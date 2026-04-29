function scr_calculate_troop_size()
{
    var _unit_num = 0;
    var _list_n = ds_list_size(global.front_row);
    
    for (var i = 0; i < _list_n; i++)
    {
        var _a = ds_list_find_value(global.front_row, i);
        _unit_num += _a.num;
    }
    
    _list_n = ds_list_size(global.back_row);
    
    for (var i = 0; i < _list_n; i++)
    {
        var _a = ds_list_find_value(global.back_row, i);
        _unit_num += _a.num;
    }
    
    return _unit_num;
}

function scr_calculate_group_stat(arg0)
{
    raid_data.skill_type = [[-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1]];
    var _front_list = ds_list_create();
    var _back_list = ds_list_create();
    ds_list_copy(_front_list, global.front_row);
    ds_list_copy(_back_list, global.back_row);
    
    if (arg0 != -1)
    {
        with (arg0)
        {
            var _mon_data = {};
            _mon_data.mon_type = UnknownEnum.Value_21;
            _mon_data.unit_data = source_id.unit_data;
            _mon_data.num = arg0.num;
            
            if (source_id.row == 0)
                ds_list_insert(_front_list, source_id.button_num, _mon_data);
            else
                ds_list_insert(_back_list, source_id.button_num, _mon_data);
        }
    }
    
    var _ap = 0;
    var _num = ds_list_size(_front_list);
    
    for (var i = 0; i < _num; i++)
    {
        var _info = ds_list_find_value(_front_list, i);
        var _array = scr_mon_type_construct(_info.unit_data.mon_type);
        _ap += ((_array.stat[_info.unit_data.class] + _array.lvl[_info.unit_data.class]) * _info.num);
        var _skill_num = 0;
        var _skill_exp = _info.num * (_array.skill_lvl[_info.unit_data.class] + 1);
        
        while (_skill_exp >= ((_skill_num + 1) * 10))
        {
            _skill_exp -= ((_skill_num + 1) * 10);
            _skill_num += 1;
        }
        
        raid_data.skill_exp[0][i] = _skill_exp;
        raid_data.skill_num[0][i] = _skill_num;
        raid_data.skill_type[0][i] = global.mon_skill[_info.unit_data.mon_type][_info.unit_data.class];
    }
    
    raid_data.ap[0] = _ap;
    _ap = 0;
    _num = ds_list_size(_back_list);
    
    for (var i = 0; i < _num; i++)
    {
        var _info = ds_list_find_value(_back_list, i);
        var _array = scr_mon_type_construct(_info.unit_data.mon_type);
        _ap += ((_array.stat[_info.unit_data.class] + _array.lvl[_info.unit_data.class]) * _info.num);
        var _skill_num = 0;
        var _skill_exp = _info.num * (_array.skill_lvl[_info.unit_data.class] + 1);
        
        while (_skill_exp >= ((_skill_num + 1) * 10))
        {
            _skill_exp -= ((_skill_num + 1) * 10);
            _skill_num += 1;
        }
        
        raid_data.skill_exp[1][i] = _skill_exp;
        raid_data.skill_num[1][i] = _skill_num;
        raid_data.skill_type[1][i] = global.mon_skill[_info.unit_data.mon_type][_info.unit_data.class];
    }
    
    raid_data.ap[1] = _ap;
    var _mul = 0;
    _mul += scr_check_skill_data(UnknownEnum.Value_12);
    _num = ds_list_size(_front_list);
    
    for (var i = 0; i < _num; i++)
        raid_data.skill_num[0][i] += _mul;
    
    _mul = 0;
    _mul += scr_check_skill_data(UnknownEnum.Value_13);
    _num = ds_list_size(_back_list);
    
    for (var i = 0; i < _num; i++)
        raid_data.skill_num[1][i] += _mul;
    
    _mul = 1;
    _mul += scr_check_skill_data(UnknownEnum.Value_2);
    _mul += scr_check_skill_data(UnknownEnum.Value_15);
    raid_data.ap[0] = floor(raid_data.ap[0] * _mul);
    _mul = 1;
    _mul += scr_check_skill_data(UnknownEnum.Value_7);
    _mul += scr_check_skill_data(UnknownEnum.Value_15);
    raid_data.ap[1] = floor(raid_data.ap[1] * _mul);
    raid_data.haste = 1 + scr_check_skill_data(UnknownEnum.Value_6);
    ds_list_destroy(_front_list);
    ds_list_destroy(_back_list);
}

function scr_calculate_fight_outcome()
{
    var _stage_lvl = min(global.val.stage_lvl_sel[raid_data.stage], 2);
    var _data = global.val.stage_info[raid_data.stage].info[_stage_lvl];
    var _md = scr_calculate_mood_rate();
    var _player_hp = floor(obj_np.obj_raid.raid_data.ap[0]);
    var _player_ap = floor(obj_np.obj_raid.raid_data.ap[1]);
    var _enemy_hp = _data.en_ap[0];
    var _enemy_ap = _data.en_ap[1];
    var _over_diff = (_player_hp + _player_ap) / (_enemy_hp + _enemy_ap);
    var _units_total = 0;
    global.val.latest_over_diff = _over_diff;
    
    for (var i = 0; i < ds_list_size(global.front_row); i++)
        _units_total += ds_list_find_value(global.front_row, i).num;
    
    for (var i = 0; i < ds_list_size(global.back_row); i++)
        _units_total += ds_list_find_value(global.back_row, i).num;
    
    var _units_to_d = 1 - clamp(((_over_diff - 1) * 0.8) + 0.1, 0.1, 0.9);
    _units_to_d = clamp(ceil(_units_total * _units_to_d), 0, _units_total - 1);
    
    if (raid_data.stage == 0 && _stage_lvl == 0 && _over_diff >= 2)
        _units_to_d = choose(0, _units_to_d);
    
    var _base_units_td = _units_to_d;
    var _lost;
    
    if (_player_hp >= _enemy_hp && _player_ap >= _enemy_ap)
    {
        var _item_array = _data.item;
        var _ar_num = array_length(_item_array);
        var _max_num = _ar_num;
        var _cage_num = 0;
        var _cap_rate = 1;
        var _rev_mul = scr_check_skill_data(UnknownEnum.Value_1);
        var _item_mul = 1 + scr_check_skill_data(UnknownEnum.Value_3);
        var _food_mul = 1 + scr_check_skill_data(UnknownEnum.Value_0) + scr_check_skill_data(UnknownEnum.Value_11);
        var _gold_mul = 1 + scr_check_skill_data(UnknownEnum.Value_4) + scr_check_skill_data(UnknownEnum.Value_11);
        var _cap_mul = scr_check_skill_data(UnknownEnum.Value_5);
        
        while (_units_to_d > 0 && (ds_list_size(global.front_row) + ds_list_size(global.back_row)) > 1)
        {
            var _exist = false;
            
            while (!_exist)
            {
                var _row = choose(0, 1);
                var _row_list;
                
                if (_row == 0)
                    _row_list = global.front_row;
                else
                    _row_list = global.back_row;
                
                var _num_list = ds_list_size(_row_list);
                
                if (_num_list > 0)
                {
                    var _pos = irandom_range(0, _num_list - 1);
                    var _unit_data = ds_list_find_value(_row_list, _pos);
                    
                    if (_unit_data.num > 0)
                    {
                        if (irandom_range(1, 100) > (_rev_mul * 100))
                        {
                            if (--_unit_data.num <= 0)
                                ds_list_delete(_row_list, _pos);
                            else
                                ds_list_set(_row_list, _pos, _unit_data);
                        }
                        
                        _units_to_d--;
                        _exist = true;
                    }
                }
            }
        }
        
        var _item_data = variable_clone(global.reward[raid_data.stage][_stage_lvl][0]);
        _item_data.num = floor(_item_data.num * _gold_mul);
        _item_data.num_draw = _item_data.num;
        ds_list_add(global.raid_inv_list, _item_data);
        _item_data = variable_clone(global.reward[raid_data.stage][_stage_lvl][1]);
        _item_data.num = floor(_item_data.num * _food_mul);
        _item_data.num_draw = _item_data.num;
        ds_list_add(global.raid_inv_list, _item_data);
        
        for (var i = 0; i < _max_num; i++)
        {
            if (irandom_range(1, 100) <= (45 * _over_diff * 0.4 * _item_mul) && ds_list_size(global.raid_inv_list) < 5)
            {
                var _a = irandom_range(0, _ar_num - 1);
                
                if (_data.item[_a].item_type != UnknownEnum.Value_1 || _data.item[_a].item_type != UnknownEnum.Value_0)
                {
                    ds_list_add(global.raid_inv_list, _data.item[_a]);
                    var _list = global.val.stage_item[raid_data.stage][_stage_lvl];
                    var _list_num = array_length(_list);
                    
                    for (var ii = 0; ii < _list_num; ii++)
                    {
                        if (_list[ii][0] == _data.item[_a].item_type && _list[ii][1] == _data.item[_a].num && _list[ii][2] == _data.item[_a].index)
                        {
                            array_delete(_list, ii, 1);
                            ii = _list_num;
                        }
                    }
                    
                    _ar_num--;
                    array_delete(_data.item, _a, 1);
                    global.val.stage_item[raid_data.stage][_stage_lvl] = _list;
                }
                else
                {
                    if (_data.item[_a].item_type == UnknownEnum.Value_0)
                    {
                        _data.item[_a].num = floor(_data.item[_a].num * _gold_mul);
                        _data.item[_a].num_draw = _data.item[_a].num;
                    }
                    
                    if (_data.item[_a].item_type == UnknownEnum.Value_1)
                    {
                        _data.item[_a].num = floor(_data.item[_a].num * _food_mul);
                        _data.item[_a].num_draw = _data.item[_a].num;
                    }
                    
                    ds_list_add(global.raid_inv_list, _data.item[_a]);
                    _ar_num--;
                    array_delete(_data.item, _a, 1);
                }
            }
        }
        
        global.val.stage_info[raid_data.stage].info[_stage_lvl] = _data;
        global.val.raid_num++;
        scr_check_steam_achievement(UnknownEnum.Value_7);
        var _selene_grace = false;
        var _cap_start = 1;
        
        for (var i = 0; i < array_length(global.val.cage); i++)
        {
            var _unit_list2 = [];
            var _list_num = array_length(_data.unit_list);
            var _max_lvl = 0;
            
            for (var ii = 0; ii < _list_num; ii++)
            {
                if (_data.unit_list[ii].lvl > _max_lvl)
                {
                    if (_data.unit_list[ii].class == UnknownEnum.Value_8)
                        _max_lvl = 8;
                    else
                        _max_lvl = _data.unit_list[ii].lvl;
                }
                
                _unit_list2[ii] = _data.unit_list[ii];
            }
            
            var _c_rate = ((((_over_diff - 1) / (1 + (_max_lvl * 0.3))) * 100) + (_cap_mul * 100)) * _cap_start;
            _c_rate = max(floor(_c_rate), 0);
            
            if (irandom_range(1, 100) <= _c_rate)
            {
                var _a = irandom_range(0, _list_num - 1);
                var _unit_data = _data.unit_list[_a];
                
                if (_unit_data.class >= UnknownEnum.Value_9 && _list_num > 1 && irandom_range(1, 100) <= (((_unit_data.class - UnknownEnum.Value_9) + 1) * 20 * ((array_length(global.val.cage) - 1) * 0.2)) && array_length(_unit_list2) > 1)
                {
                    var _aa = _a;
                    
                    while (_aa == _a)
                        _aa = irandom_range(0, array_length(_unit_list2) - 1);
                    
                    _unit_data = _unit_list2[_aa];
                    _a = _aa;
                }
                
                _cap_start = _cap_start * 0.9;
                var _lvl_mul = scr_check_skill_data(UnknownEnum.Value_10);
                
                if (_unit_data.class < UnknownEnum.Value_8 && _unit_data.lvl < 4 && irandom_range(1, 100) <= (_lvl_mul * 100))
                {
                    _unit_data.lvl = min(_unit_data.lvl + 1, 4);
                    _unit_data.preg_c = scr_set_unit_stat_data(_unit_data.class, _unit_data.lvl).preg_c;
                    _unit_data.preg_c_max = _unit_data.preg_c;
                }
                
                global.val.cap_num++;
                scr_check_steam_achievement(UnknownEnum.Value_5);
                global.val.cage[_cage_num] = _unit_data;
                array_delete(_data.unit_list, _a, 1);
                _cage_num++;
                
                if (_unit_data.lvl < 6)
                {
                    switch (_unit_data.class)
                    {
                        case UnknownEnum.Value_1:
                            if (global.unlock.boss[UnknownEnum.Value_2] == -1 && ++global.val.elf_num >= 40)
                                scr_add_event(UnknownEnum.Value_33, false);
                            
                            if (global.unlock.boss[UnknownEnum.Value_2] == 0 && irandom_range(1, 100) <= 50)
                            {
                                global.val.cage[_cage_num - 1] = -1;
                                _selene_grace = true;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_3:
                            if (global.unlock.boss[UnknownEnum.Value_2] == -1 && ++global.val.elf_num >= 40)
                                scr_add_event(UnknownEnum.Value_33, false);
                            
                            if (global.unlock.boss[UnknownEnum.Value_2] == 0 && irandom_range(1, 100) <= 50)
                            {
                                global.val.cage[_cage_num - 1] = -1;
                                _selene_grace = true;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_9:
                            global.unlock.boss[UnknownEnum.Value_0] = 1;
                            scr_check_steam_achievement(UnknownEnum.Value_2);
                            break;
                        
                        case UnknownEnum.Value_10:
                            global.unlock.boss[UnknownEnum.Value_1] = 1;
                            raid_data.rob_pos = -1;
                            scr_check_steam_achievement(UnknownEnum.Value_2);
                            break;
                        
                        case UnknownEnum.Value_11:
                            global.unlock.boss[UnknownEnum.Value_2] = 1;
                            scr_check_steam_achievement(UnknownEnum.Value_2);
                            break;
                        
                        case UnknownEnum.Value_12:
                            global.unlock.boss[UnknownEnum.Value_3] = 1;
                            scr_check_steam_achievement(UnknownEnum.Value_2);
                            break;
                        
                        case UnknownEnum.Value_8:
                            global.unlock.boss[UnknownEnum.Value_4] = 1;
                            scr_check_steam_achievement(UnknownEnum.Value_2);
                            break;
                    }
                }
                
                if (array_length(_data.unit_list) == 0)
                    i = array_length(global.val.cage);
            }
        }
        
        var _destruction = false;
        
        if (global.unlock.boss[UnknownEnum.Value_3] == 0)
        {
            var _list_num = array_length(_data.unit_list);
            
            for (var ii = 0; ii < _list_num; ii++)
            {
                if (_data.unit_list[ii].class == UnknownEnum.Value_12)
                {
                    _units_to_d = floor(_base_units_td * 0.5);
                    
                    while (_units_to_d > 0 && (ds_list_size(global.front_row) + ds_list_size(global.back_row)) > 1)
                    {
                        var _exist = false;
                        
                        while (!_exist)
                        {
                            var _row = choose(0, 1);
                            var _row_list;
                            
                            if (_row == 0)
                                _row_list = global.front_row;
                            else
                                _row_list = global.back_row;
                            
                            var _num_list = ds_list_size(_row_list);
                            
                            if (_num_list > 0)
                            {
                                var _pos = irandom_range(0, _num_list - 1);
                                var _unit_data = ds_list_find_value(_row_list, _pos);
                                
                                if (_unit_data.num > 0)
                                {
                                    if (--_unit_data.num <= 0)
                                        ds_list_delete(_row_list, _pos);
                                    else
                                        ds_list_set(_row_list, _pos, _unit_data);
                                    
                                    _units_to_d--;
                                    _exist = true;
                                }
                            }
                        }
                    }
                    
                    _destruction = true;
                }
            }
        }
        
        var _unstable_tower = false;
        
        if (raid_data.stage == UnknownEnum.Value_4 && _stage_lvl == 1)
        {
            _units_to_d = floor(_base_units_td * 0.5);
            
            while (_units_to_d > 0 && (ds_list_size(global.front_row) + ds_list_size(global.back_row)) > 1)
            {
                var _exist = false;
                
                while (!_exist)
                {
                    var _row = choose(0, 1);
                    var _row_list;
                    
                    if (_row == 0)
                        _row_list = global.front_row;
                    else
                        _row_list = global.back_row;
                    
                    var _num_list = ds_list_size(_row_list);
                    
                    if (_num_list > 0)
                    {
                        var _pos = irandom_range(0, _num_list - 1);
                        var _unit_data = ds_list_find_value(_row_list, _pos);
                        
                        if (_unit_data.num > 0)
                        {
                            if (--_unit_data.num <= 0)
                                ds_list_delete(_row_list, _pos);
                            else
                                ds_list_set(_row_list, _pos, _unit_data);
                            
                            _units_to_d--;
                            _exist = true;
                        }
                    }
                }
                
                _unstable_tower = true;
            }
        }
        
        scr_check_quest_raid();
        
        if (activate)
            scr_reset_cage();
        
        var _m_chnc = scr_check_skill_data(UnknownEnum.Value_9);
        
        for (var i = 0; i < array_length(global.val.cage); i++)
        {
            if (irandom_range(1, 100) <= (_m_chnc * 100) && global.val.cage[i] != -1)
            {
                var _m_lvl = global.val.cage[i].lvl;
                
                if (global.val.cage[i].class >= UnknownEnum.Value_8)
                {
                    if (global.val.cage[i].class == UnknownEnum.Value_8)
                        _m_lvl = 4;
                    else
                        _m_lvl = 1;
                }
                
                scr_add_milk_item(_m_lvl, 1);
            }
        }
        
        var _md_val = scr_check_skill_data(UnknownEnum.Value_8);
        scr_mood_value_set(_md_val);
        scr_pop_up_create(UnknownEnum.Value_9);
        _lost = false;
        
        if (_selene_grace)
            scr_pop_up_create(UnknownEnum.Value_27);
        
        if (_destruction)
            scr_pop_up_create(UnknownEnum.Value_28);
        
        if (_unstable_tower)
            scr_pop_up_create(UnknownEnum.Value_29);
    }
    else
    {
        ds_list_clear(global.front_row);
        ds_list_clear(global.back_row);
        scr_pop_up_create(UnknownEnum.Value_10);
        _lost = true;
    }
    
    if (activate)
        scr_set_raid_group(true);
    else
        scr_calculate_group_stat(-1);
    
    global.val.nest_num[0] = scr_all_mon_num_cal();
    scr_check_softlock();
    return _lost;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_15 = 15,
    Value_21 = 21,
    Value_27 = 27,
    Value_28,
    Value_29,
    Value_33 = 33
}
