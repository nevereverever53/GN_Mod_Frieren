function scr_stage_encounter_data(arg0, arg1, arg2)
{
    var _unit_list = [];
    var _en_ap = [0, 0];
    var _item_pool = [];
    var _item = [];
    var _pool_num = 0;
    var _data = {};
    var _spawn_boss = false;
    arg1 = min(arg1, 2);
    var _coin_num, _food_num, i;
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            switch (arg1)
            {
                case 0:
                    _unit_list[0] = scr_create_unit_base(UnknownEnum.Value_0, 0);
                    _en_ap[0] += 1;
                    _en_ap[1] += 1;
                    _coin_num = choose(10, 15, 20);
                    _food_num = choose(14, 16, 18, 20);
                    break;
                
                case 1:
                    if (global.unlock.boss[UnknownEnum.Value_0] == 0 && irandom_range(1, 100) <= 35)
                        _spawn_boss = true;
                    
                    if (_spawn_boss)
                    {
                        _num = irandom_range(1, 2);
                        var _boss_ap = scr_set_unit_ap(UnknownEnum.Value_9, 5);
                        _en_ap[0] += _boss_ap[0];
                        _en_ap[1] += _boss_ap[1];
                    }
                    else
                    {
                        _num = irandom_range(2, 3);
                    }
                    
                    _en_ap[0] += irandom_range(10, 14) + _num;
                    _en_ap[1] += irandom_range(9, 12) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class, _lvl;
                        
                        if (irandom_range(1, 100) <= 50)
                        {
                            _class = UnknownEnum.Value_0;
                            
                            if (irandom_range(1, 100) <= 75)
                                _lvl = 1;
                            else
                                _lvl = 2;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_4;
                            _lvl = 0;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    if (_spawn_boss)
                        _unit_list[i] = scr_create_unit_base(UnknownEnum.Value_9, 5);
                    
                    _coin_num = choose(15, 20, 25);
                    _food_num = choose(22, 24, 26, 28);
                    break;
                
                case 2:
                    if (global.unlock.boss[UnknownEnum.Value_6] == 0 && irandom_range(1, 100) <= 75)
                        _spawn_boss = true;
                    
                    if (_spawn_boss)
                    {
                        _num = 3;
                        var _boss_ap = scr_set_unit_ap(UnknownEnum.Value_14, 5);
                        _en_ap[0] += _boss_ap[0];
                        _en_ap[1] += _boss_ap[1];
                    }
                    else
                    {
                        _num = irandom_range(3, 4);
                    }
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _chnc = irandom_range(1, 100);
                        var _class, _lvl;
                        
                        if (_chnc <= 30)
                        {
                            _class = UnknownEnum.Value_0;
                            
                            if (irandom_range(1, 100) <= 70)
                                _lvl = 1;
                            else
                                _lvl = 2;
                        }
                        else if (_chnc <= 80)
                        {
                            _class = UnknownEnum.Value_4;
                            
                            if (irandom_range(1, 100) <= 60)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_2;
                            
                            if (irandom_range(1, 100) <= 80)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    if (_spawn_boss)
                        _unit_list[i] = scr_create_unit_base(UnknownEnum.Value_14, 5);
                    
                    _coin_num = choose(30, 37, 44, 41);
                    _food_num = choose(26, 28, 30, 32, 34);
                    break;
            }
            
            break;
        
        case UnknownEnum.Value_1:
            switch (arg1)
            {
                case 0:
                    _num = irandom_range(1, 2);
                    _en_ap[0] += irandom_range(5, 7) + _num;
                    _en_ap[1] += irandom_range(4, 6) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class, _lvl;
                        
                        if (irandom_range(1, 100) <= 35)
                        {
                            _class = UnknownEnum.Value_0;
                            
                            if (irandom_range(1, 100) <= 50)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_6;
                            
                            if (irandom_range(1, 100) <= 90)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(15, 20, 25, 30);
                    _food_num = choose(10, 12, 14);
                    break;
                
                case 1:
                    _num = irandom_range(2, 4);
                    _en_ap[0] += irandom_range(19, 24) + _num;
                    _en_ap[1] += irandom_range(14, 18) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class, _lvl;
                        
                        if (irandom_range(1, 100) <= 50)
                        {
                            _class = UnknownEnum.Value_2;
                            _lvl = 0;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_6;
                            
                            if (irandom_range(1, 100) <= 80)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(30, 36, 42, 48);
                    _food_num = choose(16, 18, 20);
                    break;
                
                case 2:
                    _num = irandom_range(3, 5);
                    _en_ap[0] += irandom_range(52, 68) + _num;
                    _en_ap[1] += irandom_range(42, 56) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _chnc = irandom_range(1, 100);
                        var _class, _lvl;
                        
                        if (_chnc <= 30)
                        {
                            _class = UnknownEnum.Value_6;
                            
                            if (irandom_range(1, 100) <= 60)
                                _lvl = 2;
                            else
                                _lvl = 3;
                        }
                        else if (_chnc <= 60)
                        {
                            _class = UnknownEnum.Value_2;
                            
                            if (irandom_range(1, 100) <= 50)
                                _lvl = 2;
                            else
                                _lvl = 3;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_7;
                            
                            if (irandom_range(1, 100) <= 75)
                                _lvl = 1;
                            else
                                _lvl = 2;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(65, 75, 85, 95);
                    _food_num = choose(18, 20, 22, 24);
                    break;
            }
            
            break;
        
        case UnknownEnum.Value_2:
            switch (arg1)
            {
                case 0:
                    _num = irandom_range(1, 3);
                    _en_ap[1] += irandom_range(14, 18) + _num;
                    _en_ap[0] += irandom_range(18, 25) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class, _lvl;
                        
                        if (irandom_range(1, 100) <= 50)
                        {
                            _class = UnknownEnum.Value_1;
                            
                            if (irandom_range(1, 100) <= 80)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        else
                        {
                            if (irandom_range(1, 100) <= 75)
                                _lvl = 1;
                            else
                                _lvl = 2;
                            
                            _class = UnknownEnum.Value_2;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(20, 26, 32, 38);
                    _food_num = choose(16, 18, 20, 22);
                    break;
                
                case 1:
                    _num = irandom_range(3, 4);
                    _en_ap[0] += irandom_range(52, 66) + _num;
                    _en_ap[1] += irandom_range(60, 64) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class, _lvl;
                        
                        if (irandom_range(1, 100) <= 65)
                        {
                            _class = UnknownEnum.Value_3;
                            
                            if (irandom_range(1, 100) <= 75)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_1;
                            
                            if (irandom_range(1, 100) <= 75)
                                _lvl = 1;
                            else
                                _lvl = 2;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(30, 40, 50, 60);
                    _food_num = choose(22, 24, 26, 28);
                    break;
                
                case 2:
                    if (global.unlock.boss[UnknownEnum.Value_2] == 0)
                        _spawn_boss = true;
                    
                    if (_spawn_boss)
                    {
                        _num = 3;
                        var _boss_ap = scr_set_unit_ap(UnknownEnum.Value_11, 5);
                        _en_ap[0] += _boss_ap[0];
                        _en_ap[1] += _boss_ap[1];
                    }
                    else
                    {
                        _num = irandom_range(4, 5);
                    }
                    
                    _en_ap[0] += irandom_range(76, 82) + _num;
                    _en_ap[1] += irandom_range(88, 100) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _chnc = irandom_range(1, 100);
                        var _class, _lvl;
                        
                        if (_chnc <= 30)
                        {
                            _class = UnknownEnum.Value_5;
                            
                            if (irandom_range(1, 100) <= 70)
                                _lvl = 0;
                            else
                                _lvl = 1;
                        }
                        else if (_chnc <= 60)
                        {
                            _class = UnknownEnum.Value_3;
                            
                            if (irandom_range(1, 100) <= 60)
                                _lvl = 1;
                            else
                                _lvl = 2;
                        }
                        else
                        {
                            _class = UnknownEnum.Value_1;
                            
                            if (irandom_range(1, 100) <= 60)
                                _lvl = 2;
                            else
                                _lvl = 3;
                        }
                        
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    if (_spawn_boss)
                        _unit_list[i] = scr_create_unit_base(UnknownEnum.Value_11, 5);
                    
                    _coin_num = choose(42, 55, 68, 81);
                    _food_num = choose(30, 32, 34, 36, 38);
                    break;
            }
            
            break;
        
        case UnknownEnum.Value_3:
            switch (arg1)
            {
                case 0:
                    _num = irandom_range(4, 5);
                    _en_ap[0] += irandom_range(86, 104) + _num;
                    _en_ap[1] += irandom_range(84, 106) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class = irandom_range(UnknownEnum.Value_0, UnknownEnum.Value_3);
                        var _lvl = irandom_range(1, 3);
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _en_ap[0] += _ap[0];
                        _en_ap[1] += _ap[1];
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(50, 60, 70);
                    _food_num = choose(30, 35, 40, 45);
                    break;
                
                case 1:
                    _num = irandom_range(4, 5);
                    _en_ap[0] += irandom_range(158, 186) + _num;
                    _en_ap[1] += irandom_range(156, 188) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class = irandom_range(UnknownEnum.Value_4, UnknownEnum.Value_5);
                        var _lvl = irandom_range(2, 4);
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    _coin_num = choose(95, 105, 115);
                    _food_num = choose(62, 67, 72, 77);
                    break;
                
                case 2:
                    if (global.unlock.boss[UnknownEnum.Value_3] == 0)
                        _spawn_boss = true;
                    
                    if (_spawn_boss)
                    {
                        _num = 4;
                        var _boss_ap = scr_set_unit_ap(UnknownEnum.Value_12, 5);
                        _en_ap[0] += _boss_ap[0];
                        _en_ap[1] += _boss_ap[1];
                    }
                    else
                    {
                        _num = 5;
                    }
                    
                    _en_ap[0] += irandom_range(210, 238) + _num;
                    _en_ap[1] += irandom_range(208, 240) + _num;
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class = irandom_range(UnknownEnum.Value_0, UnknownEnum.Value_5);
                        var _lvl = irandom_range(3, 4);
                        var _ap = scr_set_unit_ap(_class, _lvl);
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    if (_spawn_boss)
                        _unit_list[i] = scr_create_unit_base(UnknownEnum.Value_12, 5);
                    
                    _coin_num = choose(110, 120, 130, 140, 150);
                    _food_num = choose(60, 75, 90, 105);
                    break;
            }
            
            break;
        
        case UnknownEnum.Value_4:
            switch (arg1)
            {
                case 0:
                    if (global.unlock.boss[UnknownEnum.Value_4] != 1)
                    {
                        _en_ap[0] = 666;
                        _en_ap[1] = 666;
                        _unit_list[0] = scr_create_unit_base(UnknownEnum.Value_8, 5);
                    }
                    else
                    {
                        var _t_lvl = min(24, global.val.ct_lvl);
                        _en_ap[0] = 600 + (100 * _t_lvl);
                        _en_ap[1] = 600 + (100 * _t_lvl);
                        _num = 5;
                        var _spe_chnc = 5;
                        
                        if (arg2)
                            _spe_chnc += scr_check_skill_data(UnknownEnum.Value_14);
                        
                        var _spe_class = [];
                        
                        for (i = 0; i < array_length(global.unlock.boss); i++)
                        {
                            if (global.unlock.boss[i] == 1)
                            {
                                switch (i)
                                {
                                    case UnknownEnum.Value_0:
                                        array_push(_spe_class, UnknownEnum.Value_9);
                                        break;
                                    
                                    case UnknownEnum.Value_4:
                                        array_push(_spe_class, UnknownEnum.Value_8);
                                        break;
                                    
                                    case UnknownEnum.Value_5:
                                        array_push(_spe_class, UnknownEnum.Value_13);
                                        break;
                                    
                                    case UnknownEnum.Value_3:
                                        array_push(_spe_class, UnknownEnum.Value_12);
                                        break;
                                    
                                    case UnknownEnum.Value_1:
                                        array_push(_spe_class, UnknownEnum.Value_10);
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        array_push(_spe_class, UnknownEnum.Value_11);
                                        break;
                                    
                                    case UnknownEnum.Value_6:
                                        array_push(_spe_class, UnknownEnum.Value_14);
                                        break;
                                }
                            }
                        }
                        
                        for (i = 0; i < _num; i++)
                        {
                            var _class, _lvl;
                            
                            if (irandom_range(1, 100) <= _spe_chnc)
                            {
                                _class = _spe_class[irandom_range(0, array_length(_spe_class) - 1)];
                                _lvl = 6;
                            }
                            else
                            {
                                _class = irandom_range(UnknownEnum.Value_0, UnknownEnum.Value_7);
                                _lvl = irandom_range(3, 4);
                            }
                            
                            _unit_list[i] = scr_create_unit_base(_class, _lvl);
                        }
                    }
                    
                    break;
                
                case 1:
                    var _t_lvl = global.val.ct_lvl;
                    var _scale = max(0, _t_lvl - 25);
                    _en_ap[0] = 5000 + (500 * _scale);
                    _en_ap[1] = 5000 + (500 * _scale);
                    _num = 5;
                    var _spe_chnc = 5;
                    
                    if (arg2)
                        _spe_chnc += scr_check_skill_data(UnknownEnum.Value_14);
                    
                    var _spe_class = [];
                    
                    for (i = 0; i < array_length(global.unlock.boss); i++)
                    {
                        if (global.unlock.boss[i] == 1)
                        {
                            switch (i)
                            {
                                case UnknownEnum.Value_0:
                                    array_push(_spe_class, UnknownEnum.Value_9);
                                    break;
                                
                                case UnknownEnum.Value_4:
                                    array_push(_spe_class, UnknownEnum.Value_8);
                                    break;
                                
                                case UnknownEnum.Value_5:
                                    array_push(_spe_class, UnknownEnum.Value_13);
                                    break;
                                
                                case UnknownEnum.Value_3:
                                    array_push(_spe_class, UnknownEnum.Value_12);
                                    break;
                                
                                case UnknownEnum.Value_1:
                                    array_push(_spe_class, UnknownEnum.Value_10);
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    array_push(_spe_class, UnknownEnum.Value_11);
                                    break;
                                
                                case UnknownEnum.Value_6:
                                    array_push(_spe_class, UnknownEnum.Value_14);
                                    break;
                            }
                        }
                    }
                    
                    for (i = 0; i < _num; i++)
                    {
                        var _class, _lvl;
                        
                        if (irandom_range(1, 100) <= _spe_chnc)
                        {
                            _class = _spe_class[irandom_range(0, array_length(_spe_class) - 1)];
                            _lvl = 6;
                        }
                        else
                        {
                            _class = irandom_range(UnknownEnum.Value_0, UnknownEnum.Value_7);
                            _lvl = irandom_range(3, 4);
                        }
                        
                        _unit_list[i] = scr_create_unit_base(_class, _lvl);
                    }
                    
                    break;
            }
            
            _coin_num = 0;
            _food_num = 0;
            break;
    }
    
    if (_coin_num > 0)
    {
        var _item_data = scr_set_item_data(UnknownEnum.Value_0, _coin_num, -1);
        array_push(_item_pool, _item_data);
    }
    
    if (_food_num > 0)
    {
        var _item_data = scr_set_item_data(UnknownEnum.Value_1, _food_num, -1);
        array_push(_item_pool, _item_data);
    }
    
    _pool_num += 2;
    var _item_array = global.val.stage_item[arg0][arg1];
    var _ar_num = array_length(_item_array);
    
    for (i = 0; i < _ar_num; i++)
    {
        var _item_data = scr_set_item_data(_item_array[i][0], _item_array[i][1], _item_array[i][2]);
        array_push(_item_pool, _item_data);
    }
    
    _pool_num += i;
    var _num = min(array_length(_item_pool), 3 + arg1);
    
    for (i = 0; i < _num; i++)
    {
        if (irandom_range(1, 100) <= 75)
        {
            var _a = irandom_range(0, _pool_num - 1);
            array_push(_item, _item_pool[_a]);
            array_delete(_item_pool, _a, 1);
            _pool_num--;
        }
    }
    
    _data.unit_list = _unit_list;
    _data.en_ap = _en_ap;
    _data.item = _item;
    return _data;
}

function scr_check_raid_target()
{
    var _stage = [];
    
    for (var i = 0; i < array_length(global.val.stage_info); i++)
    {
        if (global.val.stage_info[i] != -1)
            _stage[i] = min(2, global.val.stage_info[i].max_lvl);
        else
            _stage[i] = -1;
    }
    
    var _a = [];
    var _stage_sel = -1;
    
    while (_stage_sel == -1)
    {
        _a[0] = irandom_range(0, array_length(_stage) - 1);
        _stage_sel = _stage[_a[0]];
    }
    
    _a[1] = irandom_range(0, _stage[_a[0]]);
    return _a;
}

function scr_stage_raid_reward()
{
    global.reward = [[[scr_set_item_data(UnknownEnum.Value_0, 10, -1), scr_set_item_data(UnknownEnum.Value_1, 12, -1)], [scr_set_item_data(UnknownEnum.Value_0, 13, -1), scr_set_item_data(UnknownEnum.Value_1, 17, -1)], [scr_set_item_data(UnknownEnum.Value_0, 15, -1), scr_set_item_data(UnknownEnum.Value_1, 30, -1)]], [[scr_set_item_data(UnknownEnum.Value_0, 16, -1), scr_set_item_data(UnknownEnum.Value_1, 8, -1)], [scr_set_item_data(UnknownEnum.Value_0, 30, -1), scr_set_item_data(UnknownEnum.Value_1, 14, -1)], [scr_set_item_data(UnknownEnum.Value_0, 60, -1), scr_set_item_data(UnknownEnum.Value_1, 22, -1)]], [[scr_set_item_data(UnknownEnum.Value_0, 28, -1), scr_set_item_data(UnknownEnum.Value_1, 20, -1)], [scr_set_item_data(UnknownEnum.Value_0, 55, -1), scr_set_item_data(UnknownEnum.Value_1, 30, -1)], [scr_set_item_data(UnknownEnum.Value_0, 90, -1), scr_set_item_data(UnknownEnum.Value_1, 45, -1)]], [[scr_set_item_data(UnknownEnum.Value_0, 80, -1), scr_set_item_data(UnknownEnum.Value_1, 40, -1)], [scr_set_item_data(UnknownEnum.Value_0, 120, -1), scr_set_item_data(UnknownEnum.Value_1, 50, -1)], [scr_set_item_data(UnknownEnum.Value_0, 160, -1), scr_set_item_data(UnknownEnum.Value_1, 60, -1)]], [[scr_set_item_data(UnknownEnum.Value_0, 150, -1), scr_set_item_data(UnknownEnum.Value_1, 70, -1)], [scr_set_item_data(UnknownEnum.Value_0, 200, -1), scr_set_item_data(UnknownEnum.Value_1, 80, -1)], [scr_set_item_data(UnknownEnum.Value_0, 200, -1), scr_set_item_data(UnknownEnum.Value_1, 80, -1)]]];
}

function scr_set_encounter_reward()
{
    global.val.stage_item = [[[[UnknownEnum.Value_5, UnknownEnum.Value_2, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_2, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_2, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_3, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_3, UnknownEnum.Value_1], [UnknownEnum.Value_7, UnknownEnum.Value_0, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_7, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_7, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_8, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_10, UnknownEnum.Value_0], [UnknownEnum.Value_7, UnknownEnum.Value_9, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_2, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_5, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_9, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_36, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_11, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_11, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_11, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_41, UnknownEnum.Value_6], [UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_32, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_14, UnknownEnum.Value_3]]], [[[UnknownEnum.Value_5, UnknownEnum.Value_3, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_7, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_8, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_6, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_6, UnknownEnum.Value_2], [UnknownEnum.Value_7, UnknownEnum.Value_12, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_10, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_36, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_13, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_13, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_15, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_9, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_41, UnknownEnum.Value_4], [UnknownEnum.Value_7, UnknownEnum.Value_1, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_13, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_19, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_29, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_27, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_28, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_28, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_30, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_39, UnknownEnum.Value_5], [UnknownEnum.Value_7, UnknownEnum.Value_18, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_31, UnknownEnum.Value_3], [UnknownEnum.Value_6, UnknownEnum.Value_2, UnknownEnum.Value_3]]], [[[UnknownEnum.Value_5, UnknownEnum.Value_32, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_32, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_32, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_12, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_12, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_42, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_42, UnknownEnum.Value_5], [UnknownEnum.Value_6, UnknownEnum.Value_4, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_29, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_28, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_27, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_27, UnknownEnum.Value_1], [UnknownEnum.Value_5, UnknownEnum.Value_30, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_42, UnknownEnum.Value_6], [UnknownEnum.Value_7, UnknownEnum.Value_24, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_29, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_34, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_33, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_20, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_20, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_21, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_41, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_12, UnknownEnum.Value_0], [UnknownEnum.Value_7, UnknownEnum.Value_20, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_25, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_35, UnknownEnum.Value_3]]], [[[UnknownEnum.Value_5, UnknownEnum.Value_14, UnknownEnum.Value_0], [UnknownEnum.Value_5, UnknownEnum.Value_14, UnknownEnum.Value_2], [UnknownEnum.Value_5, UnknownEnum.Value_18, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_18, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_20, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_40, UnknownEnum.Value_4], [UnknownEnum.Value_7, UnknownEnum.Value_21, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_26, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_28, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_24, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_24, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_21, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_40, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_22, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_39, UnknownEnum.Value_4], [UnknownEnum.Value_7, UnknownEnum.Value_27, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_23, UnknownEnum.Value_3], [UnknownEnum.Value_6, UnknownEnum.Value_3, UnknownEnum.Value_3]], [[UnknownEnum.Value_5, UnknownEnum.Value_22, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_22, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_24, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_40, UnknownEnum.Value_6], [UnknownEnum.Value_5, UnknownEnum.Value_38, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_38, UnknownEnum.Value_5], [UnknownEnum.Value_5, UnknownEnum.Value_23, UnknownEnum.Value_4], [UnknownEnum.Value_5, UnknownEnum.Value_23, UnknownEnum.Value_5], [UnknownEnum.Value_7, UnknownEnum.Value_16, UnknownEnum.Value_3], [UnknownEnum.Value_7, UnknownEnum.Value_38, UnknownEnum.Value_3]]], [[], [], []]];
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
    Value_14,
    Value_15,
    Value_16,
    Value_18 = 18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_38 = 38,
    Value_39,
    Value_40,
    Value_41,
    Value_42
}
