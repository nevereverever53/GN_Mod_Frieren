function scr_save_game(arg0)
{
    var _save_data = {};
    var _slot_hold_id = -1;
    var _hold_id = obj_control.hold_id;
    
    if (_hold_id != -1 && _hold_id.drag_type == UnknownEnum.Value_2)
        _slot_hold_id = _hold_id.source_id;
    
    var _slot_list = [];
    var _slot_num = 0;
    
    for (var i = 0; i <= global.val.floor; i++)
    {
        _list = global.slot_list[i];
        _num = ds_list_size(_list);
        
        for (var ii = 0; ii < _num; ii++)
        {
            var _slot_id = ds_list_find_value(_list, ii);
            var _data = {};
            
            with (_slot_id)
            {
                _data.slot_data = slot_data;
                
                if (_slot_hold_id == _slot_id)
                {
                    _data.unit_data = _hold_id.unit_data;
                    _data.slot_data.anim_struct.spr_type = UnknownEnum.Value_1;
                }
                else
                {
                    _data.unit_data = unit_data;
                }
                
                _data.pos = ii;
                var _prop_num = array_length(slot_data.prop);
                
                for (var iii = 0; iii < _prop_num; iii++)
                {
                    with (slot_data.prop[iii].prop_id)
                    {
                        _data.slot_data.prop[iii].x_pos = x;
                        _data.slot_data.prop[iii].y_pos = y;
                        _data.slot_data.prop[iii].d_pos = depth;
                        _data.slot_data.prop[iii].xscale = image_xscale;
                        _data.slot_data.prop[iii].yscale = image_yscale;
                        _data.slot_data.prop[iii].iindex = image_index;
                        
                        if (prop_data.prop_type == UnknownEnum.Value_40)
                            _data.slot_data.prop[iii].mon_data = prop_data.mon_data;
                    }
                }
            }
            
            _slot_list[_slot_num] = _data;
            _slot_num++;
        }
    }
    
    _save_data.slot_list = _slot_list;
    var _mon_list = [];
    var _num = 0;
    
    if (instance_exists(obj_mon))
    {
        with (obj_mon)
        {
            var _data = {};
            _data.x_pos = x;
            _data.y_pos = y;
            _data.d_pos = depth;
            _data.xscale = image_xscale;
            _data.yscale = image_yscale;
            _data.iindex = image_index;
            _data.ispeed = image_speed;
            _data.vis = visible;
            _data.mon_data = mon_data;
            _data.slot_pos = -1;
            
            if (mon_data.slot_id != -1)
                _data.slot_pos = ds_list_find_index(global.slot_list[mon_data.mon_floor], mon_data.slot_id);
            
            switch (mon_data.task)
            {
                case UnknownEnum.Value_3:
                    if (mon_data.placement_num == 0)
                    {
                        if (mon_data.carry_start_id != -1)
                            _data.carry_start_id = ds_list_find_index(global.slot_list[mon_data.mon_floor], mon_data.carry_start_id);
                        
                        if (mon_data.carry_end_id != -1)
                            _data.carry_end_id = ds_list_find_index(global.slot_list[mon_data.mon_floor], mon_data.carry_end_id);
                    }
                    
                    break;
            }
            
            _mon_list[_num] = _data;
            _num++;
        }
    }
    
    _save_data.mon_list = _mon_list;
    
    with (obj_np.obj_raid)
    {
        raid_data.raid_pos = layer_sequence_get_headpos(seq_id);
        _save_data.raid_data = raid_data;
    }
    
    var _global = {};
    _global.val = global.val;
    _global.unlock = global.unlock;
    _global.unit_num = scr_all_fem_num_cal();
    _global.mon_num = global.val.nest_num[0];
    var _list = [];
    _num = ds_list_size(global.unit_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.unit_list, i);
    
    _global.unit_list = _list;
    _list = [];
    _num = ds_list_size(global.front_row);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.front_row, i);
    
    _global.front_row = _list;
    _list = [];
    _num = ds_list_size(global.back_row);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.back_row, i);
    
    _global.back_row = _list;
    _list = [];
    _num = ds_list_size(global.new_button_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.new_button_list, i);
    
    _global.new_button_list = _list;
    _list = [];
    _num = ds_list_size(global.inv_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.inv_list, i);
    
    _global.inv_list = _list;
    _list = [];
    _num = ds_list_size(global.raid_inv_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.raid_inv_list, i);
    
    _global.raid_inv_list = _list;
    _list = [];
    _num = ds_list_size(global.quest_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.quest_list, i);
    
    _global.quest_list = _list;
    _list = [];
    _num = ds_list_size(global.noti_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.noti_list, i);
    
    _global.noti_list = _list;
    _list = [];
    _num = ds_list_size(global.new_guide_list);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.new_guide_list, i);
    
    _global.new_guide_list = _list;
    _list = [];
    _num = ds_list_size(global.front_row_save);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.front_row_save, i);
    
    _global.front_row_save = _list;
    _list = [];
    _num = ds_list_size(global.back_row_save);
    
    for (var i = 0; i < _num; i++)
        _list[i] = ds_list_find_value(global.back_row_save, i);
    
    _global.back_row_save = _list;
    _save_data.global_list = _global;
    var _save_type;
    
    switch (arg0)
    {
        case 0:
            _save_type = "save_file_a.json";
            scr_pop_up_create(UnknownEnum.Value_25);
            break;
        
        case 1:
            _save_type = "save_file_1.json";
            scr_pop_up_create(UnknownEnum.Value_21);
            break;
        
        case 2:
            _save_type = "save_file_2.json";
            scr_pop_up_create(UnknownEnum.Value_22);
            break;
        
        case 3:
            _save_type = "save_file_3.json";
            scr_pop_up_create(UnknownEnum.Value_23);
            break;
    }
    
    if (file_exists(_save_type))
        file_delete(_save_type);
    
    var _buff = buffer_create(1, buffer_grow, 1);
    buffer_write(_buff, buffer_text, json_stringify(_save_data));
    buffer_save(_buff, _save_type);
    buffer_delete(_buff);
}

function scr_load_slot()
{
    var _load = false;
    var _load_type = -1;
    
    switch (global.load_file)
    {
        case 0:
            if (file_exists("save_file_a.json"))
                _load_type = "save_file_a.json";
            
            break;
        
        case 1:
            if (file_exists("save_file_1.json"))
                _load_type = "save_file_1.json";
            
            break;
        
        case 2:
            if (file_exists("save_file_2.json"))
                _load_type = "save_file_2.json";
            
            break;
        
        case 3:
            if (file_exists("save_file_3.json"))
                _load_type = "save_file_3.json";
            
            break;
    }
    
    if (_load_type != -1)
    {
        _load = true;
        var _buff = buffer_load(_load_type);
        var _json = buffer_read(_buff, buffer_text);
        var _load_data = json_parse(_json);
        buffer_delete(_buff);
        _load_data = scr_patch_update_pre(_load_data);
        var _slot_list = _load_data.slot_list;
        var _start_x = -1;
        
        for (var i = 0; i <= _load_data.global_list.val.floor; i++)
        {
            global.slot_x[i] = _start_x;
            global.slot_list[i] = ds_list_create();
        }
        
        var _num = array_length(_slot_list);
        
        for (var i = 0; i < _num; i++)
        {
            var _data = _slot_list[i];
            var _slot_id = scr_create_slot(_data.slot_data.slot_type, _data.slot_data.slot_floor, _data.pos, false);
            
            with (_slot_id)
            {
                if (_data.slot_data.anim_struct != -1)
                {
                    scr_set_slot_h_data(id, _data.slot_data.h_type);
                    
                    if (_data.unit_data != -1)
                    {
                        unit_data = _data.unit_data;
                        scr_occupy_slot(id, _data.unit_data, false, _data.slot_data.anim_struct.spr_type);
                    }
                }
                
                if (_data.slot_data.slot_type == UnknownEnum.Value_0)
                {
                    var _spr;
                    
                    switch (_data.slot_data.base_type)
                    {
                        case UnknownEnum.Value_0:
                            _spr = spr_slot_back;
                            break;
                        
                        case UnknownEnum.Value_1:
                            _spr = spr_slot_back_pillar;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr = spr_slot_back_rock;
                            break;
                        
                        case UnknownEnum.Value_3:
                            _spr = spr_slot_back_brick;
                            break;
                    }
                    
                    spr_base = _spr;
                }
                
                if (_data.slot_data.slot_type == UnknownEnum.Value_1)
                {
                    var _spr;
                    
                    switch (_data.slot_data.base_type)
                    {
                        case UnknownEnum.Value_0:
                            _spr = spr_big_slot_back;
                            break;
                        
                        case UnknownEnum.Value_1:
                            _spr = spr_big_slot_back_pillar;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr = spr_big_slot_back_rock;
                            break;
                        
                        case UnknownEnum.Value_3:
                            _spr = spr_big_slot_back_brick;
                            break;
                    }
                    
                    spr_base = _spr;
                }
                
                if (_data.slot_data.slot_type == UnknownEnum.Value_2 && _data.slot_data.base_type == UnknownEnum.Value_5)
                    spr_base = spr_tent_back_full;
                
                if (_data.slot_data.slot_type == UnknownEnum.Value_5 || _data.slot_data.slot_type == UnknownEnum.Value_4)
                {
                    var _diff = 0;
                    _diff = _slot_id.image_xscale + 2;
                    var _scale, _spr;
                    
                    switch (_data.slot_data.between_type)
                    {
                        case UnknownEnum.Value_0:
                            _spr = spr_bet_plank;
                            _scale = 11;
                            break;
                        
                        case UnknownEnum.Value_1:
                            _spr = spr_bet_pillar;
                            _scale = 20;
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr = spr_bet_tent;
                            _scale = 11;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr = spr_bet_rock;
                            _scale = 15;
                            break;
                        
                        case UnknownEnum.Value_3:
                            _spr = spr_bet_brick;
                            _scale = 13;
                            break;
                    }
                    
                    _diff = _scale - _diff;
                    spr_base = _spr;
                    image_xscale += _diff;
                    global.slot_x[slot_data.slot_floor] += _diff;
                }
                
                var _prop_num = array_length(_data.slot_data.prop);
                
                for (var ii = 0; ii < _prop_num; ii++)
                {
                    var _infant = -1;
                    
                    if (_data.slot_data.prop[ii].prop_type == UnknownEnum.Value_40)
                        _infant = _data.slot_data.prop[ii].mon_data;
                    
                    var _prop = scr_create_prop(id, _data.slot_data.prop[ii].prop_type, _infant, _data.slot_data.prop[ii].prop_step);
                    _prop.prop_data = _data.slot_data.prop[ii];
                    _prop.prop_data.prop_id = _prop;
                    _prop.x = _data.slot_data.prop[ii].x_pos;
                    _prop.y = _data.slot_data.prop[ii].y_pos;
                    _prop.depth = _data.slot_data.prop[ii].d_pos;
                    _prop.image_xscale = _data.slot_data.prop[ii].xscale;
                    _prop.image_yscale = _data.slot_data.prop[ii].yscale;
                    _prop.image_index = _data.slot_data.prop[ii].iindex;
                    
                    if (_infant != -1 && _prop.prop_data.prop_id.prop_data.spawn == true)
                        _prop.mask_index = _prop.sprite_index;
                }
                
                slot_data = _data.slot_data;
            }
        }
        
        _num = 0;
        var _mon_list = _load_data.mon_list;
        var _mon_num = array_length(_mon_list);
        
        for (var i = 0; i < _mon_num; i++)
        {
            var _data = _mon_list[_num];
            
            if (_data.slot_pos != -1)
            {
            }
            else
            {
                var _slot_id = -1;
            }
            
            var _mon = scr_create_mon(_data.mon_data.mon_type, x, y, _data.mon_data.mon_floor, _data.slot_pos, -1);
            _num++;
            
            with (_mon)
            {
                x = _data.x_pos;
                y = _data.y_pos;
                depth = _data.d_pos;
                image_xscale = _data.xscale;
                image_yscale = _data.yscale;
                image_index = _data.iindex;
                image_speed = _data.ispeed;
                visible = _data.vis;
                var _old_slot_id = mon_data.slot_id;
                mon_data = _data.mon_data;
                mon_data.slot_id = _old_slot_id;
                var _place = mon_data.placement_num;
                
                if (_old_slot_id != -1 && _old_slot_id.slot_data.slot_type != UnknownEnum.Value_3)
                {
                    with (_old_slot_id)
                    {
                        array_push(h_unit_list, other.id);
                        
                        if (slot_data.mon_placement != -1)
                            slot_data.mon_placement[_place] = _mon;
                    }
                }
                
                var _spr_data = _data.mon_data.spr_data;
                
                if (_spr_data != -1)
                {
                    switch (_spr_data.mon_step)
                    {
                        case UnknownEnum.Value_0:
                            scr_set_mon_spr_data(mon_data.slot_id, _spr_data.spr_type);
                            break;
                    }
                }
                
                if (mon_data.task == UnknownEnum.Value_3)
                {
                    switch (_data.mon_data.mon_state)
                    {
                        case UnknownEnum.Value_0:
                            var _spr = spr_idle;
                            break;
                        
                        case UnknownEnum.Value_8:
                            scr_mon_draw = scr_draw_hobgoblin_carry;
                            break;
                    }
                    
                    if (mon_data.placement_num == 0)
                    {
                        if (mon_data.carry_start_id != -1)
                            mon_data.carry_start_id = ds_list_find_value(global.slot_list[mon_data.mon_floor], _data.carry_start_id);
                        
                        if (mon_data.carry_end_id != -1)
                            mon_data.carry_end_id = ds_list_find_value(global.slot_list[mon_data.mon_floor], _data.carry_end_id);
                    }
                }
                
                switch (mon_data.mon_state)
                {
                    case UnknownEnum.Value_0:
                        sprite_index = spr_idle;
                        break;
                    
                    case UnknownEnum.Value_6:
                        mon_data.ff = true;
                        break;
                    
                    case UnknownEnum.Value_5:
                        if (x == mon_data.xto)
                            sprite_index = spr_idle;
                        else if (mon_data.removed_set == UnknownEnum.Value_0 || mon_data.removed_set == UnknownEnum.Value_4)
                            sprite_index = spr_b_walk;
                        else
                            sprite_index = spr_walk;
                        
                        break;
                    
                    case UnknownEnum.Value_7:
                        mon_data.ff = true;
                        break;
                    
                    case UnknownEnum.Value_8:
                        sprite_index = spr_walk;
                        break;
                    
                    case UnknownEnum.Value_9:
                        sprite_index = spr_walk;
                        break;
                    
                    case UnknownEnum.Value_12:
                        sprite_index = spr_walk;
                        break;
                    
                    case UnknownEnum.Value_10:
                        sprite_index = spr_patrol;
                        spr_unit = scr_set_patrol_spr_data(_old_slot_id.unit_data);
                        scr_mon_draw = scr_draw_orgre_patrol;
                        scr_mon_begin_step = scr_ogre_spd_b;
                        break;
                }
            }
        }
        
        if (_load_data.raid_data.raid_state == UnknownEnum.Value_1 || _load_data.raid_data.raid_state == UnknownEnum.Value_2)
            _load_data.raid_data.ff = true;
        
        obj_np.obj_raid.raid_data = _load_data.raid_data;
        var _global = _load_data.global_list;
        global.val = _global.val;
        global.unlock = _global.unlock;
        ds_list_clear(global.unit_list);
        _num = array_length(_global.unit_list);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.unit_list, _global.unit_list[i]);
        
        ds_list_clear(global.front_row);
        _num = array_length(_global.front_row);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.front_row, _global.front_row[i]);
        
        ds_list_clear(global.back_row);
        _num = array_length(_global.back_row);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.back_row, _global.back_row[i]);
        
        ds_list_clear(global.new_button_list);
        _num = array_length(_global.new_button_list);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.new_button_list, _global.new_button_list[i]);
        
        ds_list_clear(global.inv_list);
        _num = array_length(_global.inv_list);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.inv_list, _global.inv_list[i]);
        
        ds_list_clear(global.raid_inv_list);
        _num = array_length(_global.raid_inv_list);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.raid_inv_list, _global.raid_inv_list[i]);
        
        ds_list_clear(global.quest_list);
        _num = array_length(_global.quest_list);
        
        for (var i = 0; i < _num; i++)
        {
            scr_add_event(_global.quest_list[i].quest_type, true);
            ds_list_find_value(global.quest_list, i).quest_clear = _global.quest_list[i].quest_clear;
        }
        
        for (var i = 0; i < ds_list_size(global.quest_list); i++)
        {
            if (ds_list_find_value(global.quest_list, i).quest_type == UnknownEnum.Value_10 && ds_list_find_value(global.quest_list, i).quest_clear)
            {
                with (obj_np)
                {
                    if (tutorial_arrow != -1)
                    {
                        with (tutorial_arrow)
                            instance_destroy();
                    }
                    
                    tutorial_arrow = -1;
                }
            }
        }
        
        ds_list_clear(global.noti_list);
        _num = array_length(_global.noti_list);
        
        for (var i = 0; i < _num; i++)
            scr_add_event(_global.noti_list[i].noti_type, true);
        
        ds_list_clear(global.new_guide_list);
        _num = array_length(_global.new_guide_list);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.new_guide_list, _global.new_guide_list[i]);
        
        ds_list_clear(global.front_row_save);
        _num = array_length(_global.front_row_save);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.front_row_save, _global.front_row_save[i]);
        
        ds_list_clear(global.back_row_save);
        _num = array_length(_global.back_row_save);
        
        for (var i = 0; i < _num; i++)
            ds_list_add(global.back_row_save, _global.back_row_save[i]);
        
        _load_data = scr_patch_update_post(_load_data);
        scr_demo_to_full();
        
        if (array_length(global.unlock.boss) <= 6)
            array_push(global.unlock.boss, -1);
    }
    
    return _load;
}

function scr_delete_save(arg0)
{
    var _load_type;
    
    switch (arg0)
    {
        case 0:
            _load_type = "save_file_a.json";
            break;
        
        case 1:
            _load_type = "save_file_1.json";
            break;
        
        case 2:
            _load_type = "save_file_2.json";
            break;
        
        case 3:
            _load_type = "save_file_3.json";
            break;
    }
    
    file_delete(_load_type);
}

function scr_create_menu_load_page()
{
    with (obj_np)
    {
        for (var i = 0; i < 4; i++)
        {
            with (instance_create_depth(240, 48 + (50 * i), depth - 1, obj_window))
            {
                gui = true;
                interact_type = UnknownEnum.Value_11;
                scr_window_draw = scr_draw_load_file;
                source_id = other.id;
                
                if (i > 0)
                    y += 13;
                
                scr_create_load_file(i);
            }
        }
        
        scr_create_button(292, 250, 0, spr_button_long, UnknownEnum.Value_52, id, scr_create_menu_back_button, -1, scr_draw_back_menu, 2, 4);
    }
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
    Value_21 = 21,
    Value_22,
    Value_23,
    Value_25 = 25,
    Value_40 = 40,
    Value_52 = 52
}
