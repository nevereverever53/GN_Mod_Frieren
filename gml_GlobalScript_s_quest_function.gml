function scr_create_quest_button()
{
    gui = true;
    hover = false;
    quest_on = false;
    child_window = instance_create_depth(x, y, depth, obj_window);
    
    with (child_window)
    {
        interact_type = UnknownEnum.Value_6;
        source_id = other.id;
        activate = true;
        gui = true;
        quest_surface = -1;
        sprite_index = spr_pixel;
        image_xscale = 122;
        image_yscale = 91;
        shift_x = -122;
        shift_y = 0;
        xto = x + shift_x;
        yto = y + shift_y;
        scr_window_end_step = scr_quest_window_end_step;
        scr_window_draw = scr_draw_quest_window;
        slider_y = 0;
        row_h = 25;
        quest_slider = scr_create_quest_slider(0);
    }
}

function scr_create_quest_slider(arg0)
{
    var _slider = scr_create_button(116, 2, depth - 5, spr_pixel, UnknownEnum.Value_25, id, -1, scr_step_slider, scr_draw_inv_slider, 0, 0);
    
    with (_slider)
    {
        hover = false;
        gui = true;
        follow = true;
        drag_type = UnknownEnum.Value_8;
        drag_dir = 1;
        var _num = ds_list_size(global.quest_list);
        y_start = y;
        extra_row_num = max(0, _num - 3);
        max_height = 87;
        bar_height = 87 - (6 * extra_row_num);
        image_xscale = 3;
        image_yscale = bar_height;
        bar_c = global.bar_c;
        border_shift_x = shift_x;
        border_shift_y = shift_y;
        y = y_start + arg0;
        shift_y = y - source_id.y;
        shift_y = clamp(shift_y, border_shift_y, (border_shift_y + max_height) - image_yscale);
    }
    
    return _slider;
}

function scr_quest_window_end_step()
{
    scr_lerp();
    x = source_id.x + shift_x;
}

function scr_draw_quest_button()
{
    scr_draw_hover_button();
    
    if (global.val.quest_clear)
        draw_sprite(spr_quest_clear, 0, x, y + 1);
    
    if (global.val.quest_new)
        draw_sprite(spr_new_tag, 0, x + 28, y - 3);
}

function scr_draw_quest_window()
{
    if (!surface_exists(quest_surface))
        quest_surface = surface_create(480, 270);
    
    surface_set_target(quest_surface);
    draw_clear_alpha(c_white, 0);
    draw_sprite(spr_quest_window, 0, x, y);
    var _x = x;
    var _y = y;
    var _box_width = 113;
    var _box_height = 72;
    var _height = 25;
    draw_set_halign(fa_left);
    draw_text(_x + 34, _y + 5, "QUEST");
    draw_text(_x + 87, _y + 5, "REWARD");
    surface_reset_target();
    draw_surface_part(quest_surface, 0, 0, 480, 270, 0, 0);
    surface_free(quest_surface);
    var _num = ds_list_size(global.quest_list);
    var _mouse_guix = device_mouse_x_to_gui(0);
    var _mouse_guiy = device_mouse_y_to_gui(0);
    var _h_x = -1;
    var _h_y = -1;
    var _h_text = -1;
    
    if (!surface_exists(quest_surface))
        quest_surface = surface_create(480, 270);
    
    surface_set_target(quest_surface);
    draw_clear_alpha(c_white, 0);
    
    for (var i = 0; i < _num; i++)
    {
        var _quest = ds_list_find_value(global.quest_list, i);
        
        if (_quest.quest_text != -1)
        {
            _y = floor(y + 16 + (i * _height) + slider_y);
            draw_set_halign(fa_left);
            
            if (!_quest.quest_clear)
            {
                draw_sprite(spr_quest_frame, 0, _x, _y);
                draw_text_ext(_x + 5, _y + 3, _quest.quest_text, 9, 78);
                scr_draw_item(_x + 99, _y + 10, _quest.quest_reward, true);
                draw_set_alpha(0.5);
                draw_rectangle_color(_x + 85, _y, _x + 112, _y + 22, c_black, c_black, c_black, c_black, false);
                draw_set_alpha(1);
            }
            else
            {
                draw_sprite(spr_quest_frame_complete, 0, _x, _y);
                draw_text_ext(_x + 5, _y + 3, _quest.quest_text, 9, 78);
                scr_draw_item(_x + 99, _y + 10, _quest.quest_reward, true);
                draw_set_alpha(0.5);
                draw_rectangle_color(_x + 3, _y, _x + 83, _y + 22, c_black, c_black, c_black, c_black, false);
                draw_set_alpha(1);
                draw_sprite(spr_tick, 0, _x + 78, _y + 18);
            }
            
            if (_h_text == -1 && _mouse_guix >= 86 && _mouse_guix <= 113 && _mouse_guiy >= 55 && _mouse_guiy <= 127 && _mouse_guiy >= _y && _mouse_guiy <= (_y + 22))
            {
                _h_x = _x;
                _h_y = _y;
                _h_text = _quest.quest_reward.item_name;
            }
        }
    }
    
    surface_reset_target();
    draw_surface_part(quest_surface, 0, 55, _box_width, _box_height, 0, y + 16);
    surface_free(quest_surface);
    
    if (_h_text != -1)
    {
        _h_x += 68;
        _h_y += 10;
        draw_set_halign(fa_center);
        draw_sprite(spr_button_long, 0, _h_x, _h_y);
        draw_text(_h_x + 1, _h_y - 3, _h_text);
    }
}

function scr_add_event(arg0, arg1)
{
    var _add_noti = false;
    var _add_quest = false;
    var _data = {};
    _data.event_after = -1;
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_mouse;
            _data.event_after = UnknownEnum.Value_1;
            break;
        
        case UnknownEnum.Value_1:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_cell;
            _data.event_after = UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_2:
            _add_quest = true;
            _data.quest_text = "Build a 'WALL 1' type cell.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_0, 50, -1);
            
            if (!arg1)
            {
                global.val.money += 150;
                scr_add_new_slot_h_type(UnknownEnum.Value_1, false);
            }
            
            scr_create_tutorial_arrow(-100, -100, 270, -1, false, scr_arrow_tutorial_1);
            _data.event_after = UnknownEnum.Value_46;
            break;
        
        case UnknownEnum.Value_46:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_quest;
            _data.event_after = UnknownEnum.Value_47;
            break;
        
        case UnknownEnum.Value_47:
            _add_quest = true;
            _data.quest_text = -1;
            _data.event_after = UnknownEnum.Value_3;
            scr_create_tutorial_arrow(-100, -100, 270, -1, true, scr_arrow_tutorial_2);
            break;
        
        case UnknownEnum.Value_3:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_drag;
            _data.event_after = UnknownEnum.Value_4;
            break;
        
        case UnknownEnum.Value_4:
            _add_quest = true;
            _data.quest_text = "Insert a captured unit into cell.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_0, 80, -1);
            _data.event_after = UnknownEnum.Value_5;
            
            if (!arg1)
            {
                var _info = scr_create_unit_base(UnknownEnum.Value_0, 0);
                _info.preg_c = 4;
                _info.preg_c_max = 4;
                scr_insert_unit_to_list(_info, 0, -1);
                
                with (obj_np)
                {
                    global.unlock.unit = true;
                    unit_button = scr_create_button(240, 270, -2600, spr_button_unit, UnknownEnum.Value_19, id, -1, -1, scr_draw_prison_hover_button, 0, 0);
                    
                    with (unit_button)
                    {
                        gui = true;
                        hover = true;
                        child_window = -1;
                        spr_sel = spr_button_prison_sel;
                        var _id = id;
                    }
                }
            }
            
            scr_create_tutorial_arrow(-100, -100, 270, -1, true, scr_arrow_tutorial_3);
            break;
        
        case UnknownEnum.Value_5:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_birth;
            _data.event_after = UnknownEnum.Value_6;
            break;
        
        case UnknownEnum.Value_6:
            _add_quest = true;
            _data.quest_text = "Build a 'BIRTH_1' cell and occupy it.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_1, 20, -1);
            _data.event_after = UnknownEnum.Value_7;
            
            if (!arg1)
                scr_add_new_slot_h_type(UnknownEnum.Value_5, false);
            
            scr_create_tutorial_arrow(-100, -100, 180, -1, true, scr_arrow_tutorial_4);
            break;
        
        case UnknownEnum.Value_7:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_raid_window;
            _data.event_after = UnknownEnum.Value_8;
            
            if (!arg1)
                global.val.guide_unlock.num = 1;
            
            break;
        
        case UnknownEnum.Value_8:
            _add_quest = true;
            _data.quest_text = "Open up Raid Window.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_1, 20, -1);
            _data.event_after = UnknownEnum.Value_9;
            
            if (!arg1)
            {
                with (obj_np)
                {
                    global.unlock.raid = true;
                    scr_create_button(15, 256, -2600, spr_button_ui, UnknownEnum.Value_32, -1, scr_create_raid_button, scr_raid_step_button, scr_draw_raid_button, 0, 0);
                }
            }
            
            scr_create_tutorial_arrow(0, 0, 270, -1, true, scr_arrow_tutorial_5);
            break;
        
        case UnknownEnum.Value_9:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_raid_drop;
            _data.event_after = UnknownEnum.Value_10;
            break;
        
        case UnknownEnum.Value_10:
            _add_quest = true;
            _data.quest_text = "Insert troops into your formation.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_6, UnknownEnum.Value_1, UnknownEnum.Value_3);
            _data.event_after = UnknownEnum.Value_13;
            scr_create_tutorial_arrow(0, 0, 270, -1, true, scr_arrow_tutorial_6);
            break;
        
        case UnknownEnum.Value_13:
            _add_noti = true;
            _data.text_type = scr_dia_tutorial_end;
            _data.event_after = UnknownEnum.Value_16;
            
            if (!arg1)
            {
                global.val.guide_unlock.num = 3;
                global.unlock.entrance = true;
            }
            
            break;
        
        case UnknownEnum.Value_16:
            _add_quest = true;
            _data.quest_text = "Get to 10 Goblin population.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_0, 150, -1);
            _data.event_after = -1;
            
            if (!arg1)
            {
                global.unlock.timer = true;
                obj_np.scr_time = scr_nest_time;
                scr_add_event(UnknownEnum.Value_17, false);
                scr_add_event(UnknownEnum.Value_18, false);
            }
            
            break;
        
        case UnknownEnum.Value_18:
            _add_quest = true;
            _data.quest_text = "Succeed a raid attempt.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_0, 200, -1);
            _data.event_after = UnknownEnum.Value_21;
            break;
        
        case UnknownEnum.Value_17:
            _add_quest = true;
            _data.quest_text = "Clean a dirty cell.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_4, UnknownEnum.Value_3);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_14:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_cow_tip;
            _data.event_after = UnknownEnum.Value_22;
            
            if (!arg1)
            {
                array_push(global.val.shop_item[0], [UnknownEnum.Value_2, 1, -1]);
                
                with (obj_np.obj_raid)
                    scr_choose_shop_item();
            }
            
            break;
        
        case UnknownEnum.Value_15:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_cow_win;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_21:
            _add_quest = true;
            _data.quest_text = "Clear Village lvl 1.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_7, UnknownEnum.Value_37, UnknownEnum.Value_3);
            _data.event_after = UnknownEnum.Value_14;
            break;
        
        case UnknownEnum.Value_22:
            _add_quest = true;
            _data.quest_text = "Clear Village lvl 3.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_9, UnknownEnum.Value_2);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_23:
            _add_quest = true;
            _data.quest_text = "Clear Mountain lvl 3.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_19, UnknownEnum.Value_5);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_24:
            _add_quest = true;
            _data.quest_text = "Clear Forest lvl 3.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_33, UnknownEnum.Value_1);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_25:
            _add_quest = true;
            _data.quest_text = "Clear Castle lvl 3.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_23, UnknownEnum.Value_6);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_26:
            _add_quest = true;
            _data.quest_text = "Capture Hathor in Village lvl.2.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_7, UnknownEnum.Value_6, UnknownEnum.Value_3);
            _data.event_after = UnknownEnum.Value_15;
            break;
        
        case UnknownEnum.Value_27:
            _add_quest = true;
            _data.quest_text = "Find and Capture Nyx.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_17, UnknownEnum.Value_7);
            _data.event_after = UnknownEnum.Value_43;
            break;
        
        case UnknownEnum.Value_43:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_nyx_win;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_28:
            _add_quest = true;
            _data.quest_text = "Capture Selene in the Forest.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_37, UnknownEnum.Value_7);
            _data.event_after = UnknownEnum.Value_44;
            break;
        
        case UnknownEnum.Value_44:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_goddess_win;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_29:
            _add_quest = true;
            _data.quest_text = "Capture Morrigan in the Castle.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_1, 500, -1);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_30:
            _add_quest = true;
            _data.quest_text = "Capture Lilith.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_25, UnknownEnum.Value_7);
            _data.event_after = UnknownEnum.Value_39;
            break;
        
        case UnknownEnum.Value_31:
            _add_noti = true;
            _data.text_type = scr_dia_cow_intro;
            _data.event_after = UnknownEnum.Value_26;
            break;
        
        case UnknownEnum.Value_32:
            _add_noti = true;
            _data.text_type = scr_dia_nyx_intro;
            _data.event_after = UnknownEnum.Value_27;
            break;
        
        case UnknownEnum.Value_33:
            _add_noti = true;
            _data.text_type = scr_dia_goddess_intro;
            _data.event_after = UnknownEnum.Value_28;
            break;
        
        case UnknownEnum.Value_34:
            _add_noti = true;
            _data.text_type = scr_dia_morrigan_intro;
            _data.event_after = UnknownEnum.Value_45;
            break;
        
        case UnknownEnum.Value_45:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_morrigan_tip;
            _data.event_after = UnknownEnum.Value_29;
            break;
        
        case UnknownEnum.Value_36:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_tent;
            _data.event_after = UnknownEnum.Value_42;
            break;
        
        case UnknownEnum.Value_42:
            if (!arg1)
                scr_add_new_slot_h_type(UnknownEnum.Value_34, true);
            
            _add_quest = true;
            _data.quest_text = "Create a Tentacle Clean cell.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_5, UnknownEnum.Value_31, UnknownEnum.Value_3);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_38:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_end_1;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_35:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_intro;
            _data.event_after = UnknownEnum.Value_30;
            break;
        
        case UnknownEnum.Value_39:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_end_2;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_40:
            _add_noti = true;
            _data.text_type = scr_dia_softlock;
            
            if (!arg1)
            {
                var _n = 5 - global.val.nest_num[0];
                scr_mon_num_edit(UnknownEnum.Value_0, UnknownEnum.Value_0, _n, true);
                global.val.nest_num[0] = scr_all_mon_num_cal();
                global.val.mood = max(80, global.val.mood);
            }
            
            break;
        
        case UnknownEnum.Value_48:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_no_food;
            break;
        
        case UnknownEnum.Value_41:
            _add_noti = true;
            _data.text_type = scr_dia_demo;
            break;
        
        case UnknownEnum.Value_49:
            _add_noti = true;
            _data.text_type = scr_dia_lilith_op;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_50:
            _add_quest = true;
            _data.quest_text = "Raid the tower.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_7, UnknownEnum.Value_47, UnknownEnum.Value_3);
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_51:
            _add_noti = true;
            _data.text_type = scr_dia_frieren_intro;
            _data.event_after = UnknownEnum.Value_52;
            break;
        
        case UnknownEnum.Value_52:
            _add_quest = true;
            _data.quest_text = "Capture Frieren in the Village.";
            _data.quest_reward = scr_set_item_data(UnknownEnum.Value_1, 500, -1);
            _data.event_after = UnknownEnum.Value_53;
            break;
        
        case UnknownEnum.Value_53:
            _add_noti = true;
            _data.text_type = scr_dia_frieren_win;
            _data.event_after = -1;
            break;
        
        case UnknownEnum.Value_54:
            _add_noti = true;
            _data.text_type = scr_dia_frieren_hint;
            _data.event_after = -1;
            break;
    }
    
    if (_add_noti)
    {
        var _m_exists = false;
        var _num = ds_list_size(global.noti_list);
        
        for (var i = 0; i < _num; i++)
        {
            var _not = ds_list_find_value(global.noti_list, i);
            
            if (_not.noti_type == arg0)
            {
                _m_exists = true;
                i = _num;
            }
        }
        
        if (!_m_exists)
        {
            _data.noti_type = arg0;
            ds_list_add(global.noti_list, _data);
            var _exists = false;
            
            if (instance_exists(obj_button))
            {
                with (obj_button)
                {
                    if (interact_type == UnknownEnum.Value_33)
                        _exists = true;
                }
            }
            
            if (!_exists)
            {
                with (obj_np)
                    scr_create_button(416, 242, -2000, spr_notification, UnknownEnum.Value_33, -1, scr_create_notification_button, -1, scr_draw_hover_button, 0, 0);
            }
        }
    }
    
    if (_add_quest)
    {
        _data.quest_clear = false;
        _data.quest_type = arg0;
        ds_list_add(global.quest_list, _data);
        
        if (!arg1)
            scr_pop_up_create(UnknownEnum.Value_12);
        
        with (obj_np.quest_button)
        {
            if (!arg1 && _data.quest_text != -1)
                global.val.quest_new = true;
            
            with (child_window)
            {
                var _y = 0;
                
                with (quest_slider)
                {
                    _y = y - y_start;
                    instance_destroy();
                }
                
                quest_slider = scr_create_quest_slider(_y);
            }
        }
    }
}

function scr_check_quest()
{
    var _list_num = ds_list_size(global.quest_list);
    
    for (var i = 0; i < _list_num; i++)
    {
        var _quest = ds_list_find_value(global.quest_list, i);
        
        if (!_quest.quest_clear)
        {
            var _event_set = false;
            var _mail_hide = false;
            
            switch (_quest.quest_type)
            {
                case UnknownEnum.Value_2:
                    if (instance_exists(obj_slot))
                    {
                        with (obj_slot)
                        {
                            if (slot_data.slot_type == UnknownEnum.Value_0 && slot_data.h_type == UnknownEnum.Value_1 && !_quest.quest_clear)
                            {
                                _quest.quest_clear = true;
                                global.val.quest_clear = true;
                                _event_set = true;
                                _mail_hide = true;
                            }
                        }
                    }
                    
                    if (instance_exists(obj_button))
                    {
                        with (obj_button)
                        {
                            if (interact_type == UnknownEnum.Value_36 || interact_type == UnknownEnum.Value_37 || interact_type == UnknownEnum.Value_61)
                                instance_destroy();
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_47:
                    if (_list_num <= 1)
                    {
                        _event_set = true;
                        _mail_hide = true;
                        _quest.quest_clear = true;
                    }
                    
                    if (instance_exists(obj_button))
                    {
                        with (obj_button)
                        {
                            if (interact_type == UnknownEnum.Value_36 || interact_type == UnknownEnum.Value_61)
                                instance_destroy();
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_4:
                    if (instance_exists(obj_slot))
                    {
                        with (obj_slot)
                        {
                            if (slot_data.slot_type == UnknownEnum.Value_0 && unit_data != -1)
                            {
                                _quest.quest_clear = true;
                                global.val.quest_clear = true;
                                _event_set = true;
                                _mail_hide = true;
                            }
                        }
                    }
                    
                    if (instance_exists(obj_button))
                    {
                        with (obj_button)
                        {
                            if (interact_type == UnknownEnum.Value_36 || interact_type == UnknownEnum.Value_61)
                                instance_destroy();
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (instance_exists(obj_slot))
                    {
                        var _num = 0;
                        
                        with (obj_slot)
                        {
                            if (slot_data.slot_type == UnknownEnum.Value_0 && slot_data.h_type == UnknownEnum.Value_5 && unit_data != -1)
                                _num++;
                        }
                        
                        if (_num >= 1)
                        {
                            _quest.quest_clear = true;
                            global.val.quest_clear = true;
                            _event_set = true;
                            _mail_hide = true;
                        }
                    }
                    
                    if (instance_exists(obj_button))
                    {
                        with (obj_button)
                        {
                            if (interact_type == UnknownEnum.Value_36 || interact_type == UnknownEnum.Value_61)
                                instance_destroy();
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (obj_raid.activate)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        scr_mon_num_edit(UnknownEnum.Value_0, UnknownEnum.Value_0, 5, false);
                        global.val.nest_num[0] = scr_all_mon_num_cal();
                        _event_set = true;
                        _mail_hide = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_10:
                    var _clear = false;
                    
                    if ((ds_list_size(global.front_row) + ds_list_size(global.back_row)) > 0)
                        _clear = true;
                    
                    if (_clear)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                        _mail_hide = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_16:
                    var _num_1 = global.val.goblin.num[UnknownEnum.Value_0];
                    var _num_2 = scr_calculate_troop_size();
                    
                    if ((_num_1 + _num_2) >= 10)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_17:
                    with (obj_slot)
                    {
                        if ((slot_data.slot_type == UnknownEnum.Value_0 || slot_data.slot_type == UnknownEnum.Value_1) && slot_data.slot_dirt > 0 && slot_data.slot_dirt < 0.2)
                        {
                            _quest.quest_clear = true;
                            global.val.quest_clear = true;
                            _event_set = true;
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_42:
                    with (obj_slot)
                    {
                        if (slot_data.slot_type == UnknownEnum.Value_2 && slot_data.h_type == UnknownEnum.Value_34)
                        {
                            _quest.quest_clear = true;
                            global.val.quest_clear = true;
                            _event_set = true;
                        }
                    }
                    
                    break;
            }
            
            if (_quest.quest_clear)
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
            
            if (_event_set && _quest.event_after != -1)
            {
                scr_add_event(_quest.event_after, false);
                
                if (_mail_hide)
                {
                    with (obj_button)
                    {
                        if (interact_type == UnknownEnum.Value_33)
                        {
                            var _noti = ds_list_find_value(global.noti_list, 0);
                            scr_create_textbox(_noti, -1, obj_np);
                            instance_destroy();
                        }
                    }
                }
                
                if (_quest.quest_text == -1)
                    ds_list_delete(global.quest_list, i);
            }
        }
    }
}

function scr_check_quest_raid()
{
    var _list_num = ds_list_size(global.quest_list);
    
    for (var i = 0; i < _list_num; i++)
    {
        var _quest = ds_list_find_value(global.quest_list, i);
        
        if (!_quest.quest_clear)
        {
            var _event_set = false;
            var _mail_hide = false;
            
            switch (_quest.quest_type)
            {
                case UnknownEnum.Value_18:
                    _quest.quest_clear = true;
                    global.val.quest_clear = true;
                    _event_set = true;
                    break;
                
                case UnknownEnum.Value_21:
                    if (global.val.stage_info[UnknownEnum.Value_0].max_lvl > 0)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        
                        if (_quest.event_after != -1)
                            scr_add_event(_quest.event_after, false);
                    }
                    
                    break;
                
                case UnknownEnum.Value_22:
                    if (global.val.stage_info[UnknownEnum.Value_0].max_lvl > 2)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_23:
                    if (global.val.stage_info[UnknownEnum.Value_1].max_lvl > 2)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_24:
                    if (global.val.stage_info[UnknownEnum.Value_2].max_lvl > 2)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_25:
                    if (global.val.stage_info[UnknownEnum.Value_3].max_lvl > 2)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_26:
                    if (global.unlock.boss[UnknownEnum.Value_0] == 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_27:
                    if (global.unlock.boss[UnknownEnum.Value_1] == 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_28:
                    if (global.unlock.boss[UnknownEnum.Value_2] == 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_29:
                    if (global.unlock.boss[UnknownEnum.Value_3] == 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_30:
                    if (global.unlock.boss[UnknownEnum.Value_4] == 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_50:
                    if (global.val.stage_info[UnknownEnum.Value_4] != -1 && global.val.ct_lvl > 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
                
                case UnknownEnum.Value_52:
                    if (global.unlock.boss[UnknownEnum.Value_6] == 1)
                    {
                        _quest.quest_clear = true;
                        global.val.quest_clear = true;
                        _event_set = true;
                    }
                    
                    break;
            }
            
            if (_event_set && _quest.event_after != -1)
            {
                scr_add_event(_quest.event_after, false);
                
                if (_mail_hide)
                {
                    with (obj_button)
                    {
                        if (interact_type == UnknownEnum.Value_33)
                        {
                            var _noti = ds_list_find_value(global.noti_list, 0);
                            scr_create_textbox(_noti, -1, obj_np);
                            instance_destroy();
                        }
                    }
                }
            }
        }
    }
}

function scr_check_quest_hover(arg0, arg1)
{
    var _pos_y = floor((arg1 - 39 - 16 - slider_y) / row_h);
    var _quest = ds_list_find_value(global.quest_list, _pos_y);
    
    if (_quest != undefined)
    {
    }
}

function scr_check_quest_click(arg0, arg1)
{
    var _pos_y = floor((arg1 - 39 - 16 - slider_y) / row_h);
    var _quest = ds_list_find_value(global.quest_list, _pos_y);
    
    if (_quest != undefined && _quest.quest_clear)
    {
        var _item = _quest.quest_reward;
        scr_add_item(_item);
        ds_list_delete(global.quest_list, _pos_y);
        scr_item_pop_up_create(arg0, arg1, _item, true);
        scr_sfx_play(UnknownEnum.Value_0);
        var _y;
        
        with (quest_slider)
        {
            _y = y - y_start;
            instance_destroy();
        }
        
        quest_slider = scr_create_quest_slider(_y);
        var _unclaim_exists = false;
        var _num = ds_list_size(global.quest_list);
        
        for (var i = 0; i < _num; i++)
        {
            if (ds_list_find_value(global.quest_list, i).quest_clear)
            {
                i = _num;
                _unclaim_exists = true;
            }
        }
        
        global.val.quest_clear = _unclaim_exists;
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
    Value_12 = 12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_21 = 21,
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
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
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
    Value_52,
    Value_53,
    Value_54,
    Value_61 = 61
}
