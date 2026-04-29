function scr_nest_time()
{
    if (global.w_spd != 0)
    {
        global.val.mood_red = global.val.nest_num[0] * 0.0000062;
        var _red = global.val.mood_red * -1 * global.w_spd;
        scr_mood_value_set(_red);
        global.val.day_timer += global.w_spd;
        
        if (global.val.day_timer >= 18000)
        {
            global.val.day_timer = 0;
            global.val.day++;
            scr_check_steam_achievement(UnknownEnum.Value_9);
            scr_food_cost();
            var _raid_data = obj_raid.raid_data;
            var _num = array_length(global.val.stage_info);
            
            for (var i = 0; i < _num; i++)
            {
                if (global.val.stage_info[i] != -1)
                    scr_set_stage_data(i, -1, false);
            }
            
            with (obj_raid)
            {
                with (obj_button)
                {
                    if (interact_type == UnknownEnum.Value_49 || interact_type == UnknownEnum.Value_48)
                        instance_destroy();
                }
                
                scr_choose_trade_item();
                scr_choose_shop_item();
            }
            
            scr_check_all_boss_exists();
            scr_save_game(0);
        }
    }
}

function scr_all_mon_num_cal()
{
    var _unit_num = 0;
    
    for (var i = 0; i < array_length(global.val.mon_num); i++)
        _unit_num += max(0, global.val.mon_num[i]);
    
    _unit_num += scr_calculate_troop_size();
    return _unit_num;
}

function scr_all_fem_num_cal()
{
    var _unit_num = 0;
    var _num = ds_list_size(global.unit_list);
    
    for (var i = 0; i < _num; i++)
    {
        var _unit = ds_list_find_value(global.unit_list, i);
        
        if (_unit != -1)
            _unit_num++;
    }
    
    with (obj_slot)
    {
        if (unit_data != -1)
            _unit_num++;
    }
    
    if (obj_control.hold_id != -1 && instance_exists(obj_control.hold_id) && obj_control.hold_id.interact_type == UnknownEnum.Value_20 && obj_control.hold_id.drag_type == UnknownEnum.Value_2)
        _unit_num++;
    
    return _unit_num;
}

function scr_all_unit_num_cal()
{
    var _unit_num = 0;
    _unit_num = scr_all_fem_num_cal() + global.val.nest_num[0];
    return _unit_num;
}

function scr_check_all_boss_exists()
{
    var _num = ds_list_size(global.unit_list);
    var _boss_unlock = global.unlock.boss;
    var _boss_exists = [];
    
    for (var i = 0; i < array_length(_boss_unlock); i++)
        array_push(_boss_exists, false);
    
    for (var i = 0; i < _num; i++)
    {
        var _unit = ds_list_find_value(global.unit_list, i);
        
        if (_unit != -1 && _unit.class >= UnknownEnum.Value_8 && _unit.lvl == 5)
        {
            if (_unit.class == UnknownEnum.Value_8)
                _boss_exists[4] = true;
            else if (_unit.class == UnknownEnum.Value_13)
                _boss_exists[5] = true;
            else if (_unit.class == UnknownEnum.Value_14)
                _boss_exists[6] = true;
            else
                _boss_exists[_unit.class - UnknownEnum.Value_8 - 1] = true;
        }
    }
    
    with (obj_slot)
    {
        var _unit = unit_data;
        
        if (_unit != -1 && _unit.class >= UnknownEnum.Value_8 && _unit.lvl == 5)
        {
            if (_unit.class == UnknownEnum.Value_8)
                _boss_exists[4] = true;
            else if (_unit.class == UnknownEnum.Value_13)
                _boss_exists[5] = true;
            else if (_unit.class == UnknownEnum.Value_14)
                _boss_exists[6] = true;
            else
                _boss_exists[_unit.class - UnknownEnum.Value_8 - 1] = true;
        }
    }
    
    if (obj_control.hold_id != -1 && obj_control.hold_id.interact_type == UnknownEnum.Value_20 && obj_control.hold_id.drag_type == UnknownEnum.Value_2)
    {
        var _unit = obj_control.hold_id.unit_data;
        
        if (_unit.class >= UnknownEnum.Value_8 && _unit.lvl == 5)
        {
            if (_unit.class == UnknownEnum.Value_8)
                _boss_exists[4] = true;
            else if (_unit.class == UnknownEnum.Value_13)
                _boss_exists[5] = true;
            else if (_unit.class == UnknownEnum.Value_14)
                _boss_exists[6] = true;
            else
                _boss_exists[_unit.class - UnknownEnum.Value_8 - 1] = true;
        }
    }
    
    for (var i = 0; i < array_length(global.val.cage); i++)
    {
        var _unit = global.val.cage[i];
        
        if (_unit != -1 && _unit.class >= UnknownEnum.Value_8 && _unit.lvl == 5)
        {
            if (_unit.class == UnknownEnum.Value_8)
                _boss_exists[4] = true;
            else if (_unit.class == UnknownEnum.Value_13)
                _boss_exists[5] = true;
            else if (_unit.class == UnknownEnum.Value_14 && global.unlock.boss[6] == 0)
                _boss_exists[6] = _boss_exists[6];
            else if (_unit.class == UnknownEnum.Value_14 && global.unlock.boss[6] == 1)
                _boss_exists[6] = true;
            else
                _boss_exists[_unit.class - UnknownEnum.Value_8 - 1] = true;
        }
    }
    
    for (var i = 0; i < array_length(_boss_unlock); i++)
    {
        if (global.unlock.boss[i] == 1 && !_boss_exists[i])
            global.unlock.boss[i] = 0;
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_8 = 8,
    Value_9,
    Value_13 = 13,
    Value_14,
    Value_20 = 20,
    Value_48 = 48,
    Value_49
}
