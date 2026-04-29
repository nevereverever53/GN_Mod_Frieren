function scr_create_raid()
{
    var _raid = instance_create_depth(x, y, -2400, obj_window);
    
    with (_raid)
    {
        sprite_index = spr_pixel;
        image_xscale = 480;
        image_yscale = 270;
        interact_type = UnknownEnum.Value_4;
        source_id = other.id;
        gui = true;
        trans = false;
        activate = false;
        trans_id = -1;
        seq_id = -1;
        raid_layer = -1;
        raid_surf = -1;
        ap_save = -1;
        raid_data = {};
        raid_data.raid_state = UnknownEnum.Value_0;
        raid_data.ff = true;
        raid_data.raid_pos = 0;
        raid_data.wait = 0;
        raid_data.stage = -1;
        raid_data.ap = [0, 0];
        raid_data.en_ap = [0, 0];
        raid_data.lost = false;
        raid_data.cat = UnknownEnum.Value_0;
        raid_data.rob_pos = -1;
        raid_data.spd = 0;
        raid_data.max_time = 0;
        raid_data.time_left = 0;
        raid_data.haste = 1;
        raid_data.skill_exp = [[-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1]];
        raid_data.skill_num = [[-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1]];
        raid_data.skill_type = [[-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1]];
        scr_window_step = scr_raid_step;
        scr_window_end_step = scr_raid_end_step;
        scr_window_draw = scr_draw_raid;
        line_c = make_color_rgb(104, 46, 32);
        extra_row_num = 0;
        slider_y = 0;
        row_h = 20;
        inv_slider = -1;
        inv_surface = -1;
        raid_surf = -1;
    }
    
    return _raid;
}

function scr_raid_step()
{
    switch (raid_data.raid_state)
    {
        case UnknownEnum.Value_0:
            scr_raid_state_base();
            break;
        
        case UnknownEnum.Value_1:
            scr_raid_state_raiding();
            break;
        
        case UnknownEnum.Value_2:
            scr_raid_state_return();
            break;
        
        case UnknownEnum.Value_3:
            scr_raid_state_trade();
            break;
        
        case UnknownEnum.Value_4:
            scr_raid_state_shop();
            break;
    }
}

function scr_raid_end_step()
{
    if (trans)
    {
        trans = false;
        activate = !activate;
        
        if (instance_exists(obj_button))
        {
            with (obj_button)
            {
                if (interact_type == UnknownEnum.Value_21 || interact_type == UnknownEnum.Value_39 || interact_type == UnknownEnum.Value_22 || interact_type == UnknownEnum.Value_44 || interact_type == UnknownEnum.Value_45 || interact_type == UnknownEnum.Value_38 || interact_type == UnknownEnum.Value_62 || interact_type == UnknownEnum.Value_63 || interact_type == UnknownEnum.Value_47 || interact_type == UnknownEnum.Value_49 || interact_type == UnknownEnum.Value_50 || interact_type == UnknownEnum.Value_41 || interact_type == UnknownEnum.Value_43 || interact_type == UnknownEnum.Value_23 || interact_type == UnknownEnum.Value_24 || interact_type == UnknownEnum.Value_46 || interact_type == UnknownEnum.Value_48 || interact_type == UnknownEnum.Value_58 || interact_type == UnknownEnum.Value_59 || (interact_type == UnknownEnum.Value_20 && drag_type == UnknownEnum.Value_5))
                    instance_destroy();
            }
        }
        
        if (instance_exists(obj_window))
        {
            with (obj_window)
            {
                if (interact_type == UnknownEnum.Value_10 || interact_type == UnknownEnum.Value_12)
                    instance_destroy();
            }
        }
        
        if (activate)
        {
            global.camera_lock = true;
            global.muffle = 0.1;
            scr_set_raid_group(false);
            var _x = 61;
            var _y = 57;
            var _num = 0;
            scr_create_button_layout(_x - 42, _y + 1, depth - 5, 4, 1, 0, 23, 0, spr_mon_cat, UnknownEnum.Value_39, other.id, false, scr_create_mon_cat_button, -1, scr_draw_cat_mon_button);
            scr_reset_mon_cat_head(_x, _y, raid_data.cat);
            inv_slider = scr_create_inv_slider(0);
            scr_create_button(157, 160, depth - 1, spr_sort_button, UnknownEnum.Value_38, other.id, scr_create_sort_button, -1, scr_draw_sort_button, 0, 0);
            scr_create_button(466, 40, depth - 1, spr_form_save_button, UnknownEnum.Value_62, other.id, scr_create_saveform_button, -1, scr_draw_saveform_button, 0, 0);
            scr_create_button(327, 45, depth - 1, spr_form_load_button, UnknownEnum.Value_63, other.id, scr_create_loadform_button, -1, scr_draw_loadform_button, 0, 0);
            scr_create_button(369, 167, depth - 1, spr_get_button, UnknownEnum.Value_47, other.id, scr_create_sort_button, -1, scr_draw_get_button, 0, 0);
            scr_create_button(448, 167, depth - 1, spr_get_button, UnknownEnum.Value_47, other.id, scr_create_sort_button, -1, scr_draw_get_button, 1, 0);
            obj_item_desc = instance_create_depth(0, 0, depth - 5, obj_empty);
            
            with (obj_item_desc)
            {
                gui = true;
                scr_empty_draw = scr_draw_item_desc;
            }
            
            if (raid_layer != -1)
                layer_set_visible(raid_layer, activate);
            
            scr_reset_cage();
            
            switch (raid_data.raid_state)
            {
                case UnknownEnum.Value_0:
                    scr_create_map_buttons();
                    break;
                
                case UnknownEnum.Value_3:
                    raid_data.ff = true;
                    break;
                
                case UnknownEnum.Value_4:
                    raid_data.ff = true;
                    break;
            }
            
            with (obj_window)
            {
                if (interact_type == UnknownEnum.Value_5 && source_id == obj_np.obj_raid)
                    visible = true;
            }
            
            extra_row_num = scr_set_inventory_row();
        }
        else
        {
            global.camera_lock = false;
            global.muffle = 1;
            
            with (obj_window)
            {
                if (interact_type == UnknownEnum.Value_5 && source_id == obj_np.obj_raid)
                    visible = false;
            }
            
            if (raid_layer != -1)
                layer_set_visible(raid_layer, activate);
            
            with (obj_item_desc)
                instance_destroy();
        }
    }
}

function scr_raid_state_base()
{
    if (raid_data.ff)
    {
        raid_data.ff = true;
        raid_data.raid_pos = 0;
        raid_data.wait = 0;
    }
}

function scr_raid_state_raiding()
{
    if (raid_data.ff)
    {
        raid_data.ff = false;
        var _pos = raid_data.raid_pos;
        var _seq;
        
        switch (raid_data.stage)
        {
            case UnknownEnum.Value_0:
                _seq = seq_stage_1;
                break;
            
            case UnknownEnum.Value_1:
                _seq = seq_stage_2;
                break;
            
            case UnknownEnum.Value_2:
                _seq = seq_stage_3;
                break;
            
            case UnknownEnum.Value_3:
                _seq = seq_stage_4;
                break;
            
            case UnknownEnum.Value_4:
                _seq = seq_stage_5;
                break;
        }
        
        if (raid_layer == -1)
        {
            raid_layer = layer_create(9999, "seq");
            seq_id = layer_sequence_create(raid_layer, 0, 0, _seq);
        }
        
        layer_sequence_headdir(seq_id, 1);
        layer_sequence_headpos(seq_id, _pos);
        layer_set_visible(raid_layer, activate);
        raid_data.spd = (60 / global.base_raid_time[raid_data.stage]) * raid_data.haste;
    }
    
    var _spd = raid_data.spd * global.val.cart_spd * global.w_spd;
    layer_sequence_speedscale(seq_id, _spd);
    raid_data.time_left -= global.w_spd;
    
    if (layer_sequence_is_finished(seq_id))
    {
        raid_data.lost = scr_calculate_fight_outcome();
        raid_data.raid_state = UnknownEnum.Value_2;
        raid_data.ff = true;
        raid_data.raid_pos = layer_sequence_get_headpos(seq_id);
    }
}

function scr_raid_state_return()
{
    if (raid_data.ff)
    {
        raid_data.ff = false;
        var _pos = raid_data.raid_pos;
        var _seq;
        
        switch (raid_data.stage)
        {
            case UnknownEnum.Value_0:
                _seq = seq_stage_1;
                break;
            
            case UnknownEnum.Value_1:
                _seq = seq_stage_2;
                break;
            
            case UnknownEnum.Value_2:
                _seq = seq_stage_3;
                break;
            
            case UnknownEnum.Value_3:
                _seq = seq_stage_4;
                break;
            
            case UnknownEnum.Value_4:
                _seq = seq_stage_5;
                break;
        }
        
        if (raid_layer == -1)
        {
            raid_layer = layer_create(-9998, "seq");
            seq_id = layer_sequence_create(raid_layer, 0, 0, _seq);
        }
        
        layer_sequence_headdir(seq_id, -1);
        layer_sequence_headpos(seq_id, _pos);
        layer_set_visible(raid_layer, activate);
        raid_data.haste = 1 + scr_check_skill_data(UnknownEnum.Value_6);
        raid_data.spd = (60 / global.base_raid_time[raid_data.stage]) * raid_data.haste;
    }
    
    var _spd_mul = 1 + scr_check_skill_data(UnknownEnum.Value_6);
    var _spd = raid_data.spd * global.val.cart_spd * global.w_spd;
    layer_sequence_speedscale(seq_id, _spd);
    raid_data.time_left -= global.w_spd;
    
    if (layer_sequence_get_headpos(seq_id) == 0)
    {
        if (global.unlock.boss[UnknownEnum.Value_6] != 0)
            scr_pop_up_create(UnknownEnum.Value_11);
        
        if (raid_data.rob_pos != -1 && global.unlock.boss[UnknownEnum.Value_1] == 0)
        {
            var _data = global.val.stage_info[raid_data.rob_pos[0]].info[raid_data.rob_pos[1]];
            var _units = _data.unit_list;
            
            if (array_length(_units) > 0 && _units[array_length(_units) - 1].class == UnknownEnum.Value_10)
            {
                array_delete(_units, array_length(_units) - 1, 1);
                var _ap = scr_set_unit_ap(UnknownEnum.Value_10, 5);
                _data.en_ap[0] -= _ap[0];
                _data.en_ap[1] -= _ap[1];
            }
            
            raid_data.rob_pos = -1;
        }
        
        if (global.unlock.boss[UnknownEnum.Value_6] == 0 && array_length(global.val.cage) > 0)
        {
            for (var i = 0; i < array_length(global.val.cage); i++)
            {
                var _captive = global.val.cage[i];
                
                if (variable_struct_exists(_captive, "class"))
                {
                    if (_captive.class == UnknownEnum.Value_14)
                    {
                        if (irandom_range(1, 100) <= ((irandom_range(1, 100) - 300) + (300 * (global.val.latest_over_diff - 1))))
                        {
                            scr_pop_up_create(UnknownEnum.Value_42);
                            global.val.cage[i] = -1;
                            
                            if (variable_struct_exists(global.val, "f_count"))
                                global.val.f_count++;
                            else
                                global.val.f_count = 0;
                            
                            if (global.val.f_count >= 2)
                                scr_add_event(UnknownEnum.Value_54, false);
                            
                            if (instance_exists(obj_button))
                            {
                                with (obj_button)
                                {
                                    if (interact_type == UnknownEnum.Value_20 && drag_type == UnknownEnum.Value_5)
                                        instance_destroy();
                                }
                                
                                scr_reset_cage();
                            }
                        }
                        else
                        {
                            global.unlock.boss[UnknownEnum.Value_6] = 1;
                            scr_check_quest_raid();
                            scr_pop_up_create(UnknownEnum.Value_11);
                        }
                    }
                }
            }
        }
        
        if (!raid_data.lost)
        {
            if (raid_data.stage != UnknownEnum.Value_4)
                scr_set_stage_data(raid_data.stage, global.val.stage_lvl_sel[raid_data.stage], true);
            
            scr_add_stage_exp(raid_data.stage, 5);
            
            if (raid_data.stage == UnknownEnum.Value_4)
                scr_set_stage_data(raid_data.stage, global.val.stage_lvl_sel[raid_data.stage], true);
            
            if (global.unlock.boss[UnknownEnum.Value_1] == -1 && global.val.stage_info[UnknownEnum.Value_1] != -1 && global.val.stage_info[UnknownEnum.Value_1].max_lvl >= 2)
                scr_add_event(UnknownEnum.Value_32, false);
            
            if (global.unlock.boss[UnknownEnum.Value_1] == -1 && global.val.stage_info[UnknownEnum.Value_2] != -1 && global.val.stage_info[UnknownEnum.Value_2].max_lvl >= 1)
                scr_add_event(UnknownEnum.Value_32, false);
            
            if (global.unlock.boss[UnknownEnum.Value_3] == -1 && global.val.stage_info[UnknownEnum.Value_3] != -1 && global.val.stage_info[UnknownEnum.Value_0].max_lvl >= 3 && global.val.stage_info[UnknownEnum.Value_1].max_lvl >= 3 && global.val.stage_info[UnknownEnum.Value_2].max_lvl >= 3 && global.val.stage_info[UnknownEnum.Value_3].max_lvl >= 2)
                scr_add_event(UnknownEnum.Value_34, false);
            
            if (global.unlock.boss[UnknownEnum.Value_4] == -1 && global.val.stage_info[UnknownEnum.Value_3] != -1 && global.val.stage_info[UnknownEnum.Value_3].max_lvl >= 1)
                scr_add_event(UnknownEnum.Value_38, false);
            
            if (global.unlock.boss[UnknownEnum.Value_6] == -1 && global.val.stage_info[UnknownEnum.Value_3] != -1 && global.val.stage_info[UnknownEnum.Value_2].max_lvl >= 2)
                scr_add_event(UnknownEnum.Value_51, false);
            
            if (global.unlock.boss[UnknownEnum.Value_4] <= -1 && global.val.stage_info[UnknownEnum.Value_3] != -1 && global.val.stage_info[UnknownEnum.Value_3].max_lvl == 3)
            {
                with (obj_slot)
                {
                    if (slot_data.slot_type == UnknownEnum.Value_1 && slot_data.h_type == UnknownEnum.Value_39)
                        scr_add_event(UnknownEnum.Value_35, false);
                }
            }
            
            if (global.unlock.boss[UnknownEnum.Value_1] == 0 && irandom_range(1, 100) <= 40)
            {
                scr_pop_up_create(UnknownEnum.Value_26);
                var _array = [];
                
                for (var i = 0; i < ds_list_size(global.raid_inv_list); i++)
                {
                    if (ds_list_find_value(global.raid_inv_list, i).item_type == UnknownEnum.Value_0)
                        array_push(_array, i);
                }
                
                if (array_length(_array) > 0)
                {
                    var _choose = irandom_range(0, array_length(_array) - 1);
                    ds_list_delete(global.raid_inv_list, _array[_choose]);
                }
                
                raid_data.rob_pos = scr_check_raid_target();
                var _data = global.val.stage_info[raid_data.rob_pos[0]].info[raid_data.rob_pos[1]];
                var _units = _data.unit_list;
                
                if (array_length(_units) == 5)
                {
                    _ap = scr_set_unit_ap(_units[array_length(_units) - 1].class, _units[array_length(_units) - 1].lvl);
                    _data.en_ap[0] -= _ap[0];
                    _data.en_ap[1] -= _ap[1];
                    array_delete(_units, array_length(_units) - 1, 1);
                }
                
                array_push(_units, scr_create_unit_base(UnknownEnum.Value_10, 5));
                var _ap = scr_set_unit_ap(UnknownEnum.Value_10, 5);
                _data.en_ap[0] += _ap[0];
                _data.en_ap[1] += _ap[1];
            }
        }
        
        raid_data.lost = false;
        layer_sequence_destroy(seq_id);
        layer_destroy(raid_layer);
        raid_layer = -1;
        seq_id = -1;
        raid_data.raid_state = UnknownEnum.Value_0;
        raid_data.ff = true;
        
        if (activate)
            scr_create_map_buttons();
        
        if (instance_exists(obj_carriage))
        {
            with (obj_carriage)
                instance_destroy();
        }
    }
}

function scr_set_raid_group(arg0)
{
    var _hold_id = obj_control.hold_id;
    
    with (obj_button)
    {
        if (interact_type == UnknownEnum.Value_22 && _hold_id != id)
            instance_destroy();
    }
    
    var _raid_id = obj_np.obj_raid;
    var _depth = _raid_id.depth - 5;
    var _x = 360;
    var _width = 22;
    
    with (_raid_id)
    {
        var _num = ds_list_size(global.front_row);
        scr_create_button_layout(_x, 64, _depth, _num, 5, _width, 0, 0, -1, UnknownEnum.Value_22, _raid_id, false, scr_create_group_head, -1, -1);
        _num = ds_list_size(global.back_row);
        scr_create_button_layout(_x, 119, _depth, _num, 5, _width, 0, 0, -1, UnknownEnum.Value_22, _raid_id, false, scr_create_group_head, -1, -1);
        
        if (arg0)
            scr_calculate_group_stat(-1);
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
    Value_10 = 10,
    Value_11,
    Value_12,
    Value_14 = 14,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_26 = 26,
    Value_32 = 32,
    Value_34 = 34,
    Value_35,
    Value_38 = 38,
    Value_39,
    Value_41 = 41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_54 = 54,
    Value_58 = 58,
    Value_59,
    Value_62 = 62,
    Value_63
}
