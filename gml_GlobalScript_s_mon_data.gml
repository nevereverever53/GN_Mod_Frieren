function scr_set_mon_range()
{
    var _range = [];
    _range[UnknownEnum.Value_0] = [[0, 1], [1], [0], [1]];
    _range[UnknownEnum.Value_1] = [[0, 1], [1], [0], [1]];
    _range[UnknownEnum.Value_2] = [[0], [0], [1], [1]];
    _range[UnknownEnum.Value_3] = [[1], [0], [0], [1]];
    global.mon_range = _range;
}

function scr_set_mon_skill()
{
    var _skill = [];
    _skill[UnknownEnum.Value_0] = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3];
    _skill[UnknownEnum.Value_1] = [UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_6, UnknownEnum.Value_7];
    _skill[UnknownEnum.Value_2] = [UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_10, UnknownEnum.Value_11];
    _skill[UnknownEnum.Value_3] = [UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_14, UnknownEnum.Value_15];
    global.mon_skill = _skill;
}

function scr_check_skill_data(arg0)
{
    var _exists = true;
    var _val = 0;
    
    for (var i = 0; i < 5; i++)
    {
        var _skill = raid_data.skill_type[0][i];
        
        if (_skill != -1 && _skill == arg0)
        {
            var _lvl = raid_data.skill_num[0][i];
            
            switch (_skill)
            {
                case UnknownEnum.Value_0:
                    _val += (0.08 * _lvl);
                    break;
                
                case UnknownEnum.Value_2:
                    _val += (0.03 * _lvl);
                    break;
                
                case UnknownEnum.Value_4:
                    _val += (0.05 * _lvl);
                    break;
                
                case UnknownEnum.Value_6:
                    _val += (0.03 * _lvl);
                    break;
                
                case UnknownEnum.Value_8:
                    _val += (0.5 * _lvl);
                    break;
                
                case UnknownEnum.Value_9:
                    _val += (0.08 * _lvl);
                    break;
                
                case UnknownEnum.Value_13:
                    _val += _lvl;
                    break;
                
                case UnknownEnum.Value_14:
                    _val += (3 * _lvl);
                    break;
            }
            
            i = 5;
        }
    }
    
    for (var i = 0; i < 5; i++)
    {
        var _skill = raid_data.skill_type[1][i];
        
        if (_skill != -1 && _skill == arg0)
        {
            var _lvl = raid_data.skill_num[1][i];
            
            switch (_skill)
            {
                case UnknownEnum.Value_0:
                    _val += (0.1 * _lvl);
                    break;
                
                case UnknownEnum.Value_1:
                    _val = 0.04 * _lvl;
                    break;
                
                case UnknownEnum.Value_3:
                    _val += (0.04 * _lvl);
                    break;
                
                case UnknownEnum.Value_4:
                    _val += (0.05 * _lvl);
                    break;
                
                case UnknownEnum.Value_5:
                    _val += (0.03 * _lvl);
                    break;
                
                case UnknownEnum.Value_7:
                    _val += (0.03 * _lvl);
                    break;
                
                case UnknownEnum.Value_10:
                    _val += (0.02 * _lvl);
                    break;
                
                case UnknownEnum.Value_11:
                    _val += (0.03 * _lvl);
                    break;
                
                case UnknownEnum.Value_12:
                    _val += _lvl;
                    break;
                
                case UnknownEnum.Value_15:
                    _val += (0.02 * _lvl);
                    break;
            }
            
            i = 5;
        }
    }
    
    return _val;
}

function scr_set_mon_spr_data(arg0, arg1)
{
    var _slot_type = arg0.slot_data.h_type;
    var _leg = arg0.unit_data.leg;
    var _class = arg0.unit_data.class;
    var _mon_type = mon_data.mon_type;
    var _spr_data = mon_data.spr_data;
    var _anal = arg0.slot_data.anal;
    var _touch = -1;
    var _enter = -1;
    var _x_shift = 0;
    var _y_shift = 0;
    _spr_data.base_frame_c = arg0.slot_data.anim_struct.frame_c;
    _spr_data.mon_frame_c = _spr_data.base_frame_c;
    _spr_data.h_type = _slot_type;
    _spr_data.spr_row_pos = arg0.slot_data.spr_row_pos;
    var _mood_x = floor(22.5);
    var _mood_y = 0;
    var _mon_draw = scr_draw_mon_slot;
    var _set = false;
    var _mon_spr = 
    {
        head_b: -1,
        body_b: -1,
        hand_b: -1,
        touch: -1,
        enter: -1,
        pen: -1,
        prop: -1
    };
    image_xscale = 1;
    depth = -700;
    
    switch (_mon_type)
    {
        case UnknownEnum.Value_0:
            switch (_slot_type)
            {
                case UnknownEnum.Value_1:
                    if (!_anal && _spr_data.prop == -1)
                        _spr_data.prop = choose(UnknownEnum.Value_0, UnknownEnum.Value_2);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (!_anal && _spr_data.prop == -1)
                        _spr_data.prop = choose(UnknownEnum.Value_0, UnknownEnum.Value_2);
                    
                    break;
                
                case UnknownEnum.Value_7:
                    if (_spr_data.prop == -1)
                        _spr_data.prop = choose(UnknownEnum.Value_0, UnknownEnum.Value_2);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_spr_data.prop == -1)
                        _spr_data.prop = choose(UnknownEnum.Value_0, UnknownEnum.Value_2);
                    
                    break;
                
                case UnknownEnum.Value_3:
                    _spr_data.prop = UnknownEnum.Value_42;
                    _mood_y += 6;
                    break;
                
                case UnknownEnum.Value_4:
                    _spr_data.base_frame_c = 8;
                    _spr_data.prop = UnknownEnum.Value_43;
                    _mon_spr.body_b = spr_h_goblin_milk_loop_alpha;
                    _set = true;
                    break;
                
                case UnknownEnum.Value_11:
                    if (mon_data.placement_num == 1)
                        image_xscale = -1;
                    
                    _spr_data.base_frame_c = 2;
                    _mon_spr.body_b = spr_h_goblin_drink_loop_alpha;
                    _touch = spr_h_goblin_drink_loop_touch;
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _touch = spr_h_goblin_drink_loop_touch;
                            break;
                        
                        case UnknownEnum.Value_10:
                            _touch = spr_h_goblin_drink_loop_touch_nyx;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _touch = spr_h_goblin_drink_loop_touch_lilith;
                            break;
                        
                        case UnknownEnum.Value_12:
                            _touch = spr_h_goblin_drink_loop_touch_morrigan;
                            break;
                        
                        case UnknownEnum.Value_13:
                            _touch = spr_h_goblin_drink_loop_touch_cat;
                            break;
                        
                        case UnknownEnum.Value_14:
                            _touch = spr_h_goblin_drink_loop_touch_frieren;
                            break;
                    }
                    
                    _set = true;
                    depth = -760;
                    break;
                
                case UnknownEnum.Value_6:
                    _spr_data.prop = UnknownEnum.Value_42;
                    _mood_y += 6;
                    break;
                
                case UnknownEnum.Value_9:
                    _mood_y += 31;
                    break;
                
                case UnknownEnum.Value_13:
                    _mood_y += 17;
                    break;
                
                case UnknownEnum.Value_14:
                    _mood_y += 20;
                    break;
                
                case UnknownEnum.Value_36:
                    _set = true;
                    image_xscale = ((mon_data.slot_id.slot_data.mod_index[7] * 2) - 1) * -1;
                    _mon_spr.body_b = spr_h_goblin_dairy_loop_alpha;
                    
                    if (image_xscale == 1)
                        _mood_x = 48;
                    else
                        _mood_x = 29;
                    
                    _mood_y = -6;
                    
                    if (visible)
                        _touch = spr_h_goblin_dairy_loop_touch;
                    
                    break;
                
                case UnknownEnum.Value_37:
                    if (arg1 == UnknownEnum.Value_0)
                    {
                        _mon_spr.body_b = spr_h_goblin_body_start_alpha_giant;
                        _mon_spr.pen = spr_h_goblin_body_start_pen_giant;
                    }
                    else
                    {
                        _mon_spr.body_b = spr_h_goblin_body_alpha_giant;
                        _mon_spr.pen = spr_h_goblin_pen_giant;
                        _touch = spr_h_goblin_touch_giant;
                        _enter = spr_h_goblin_enter_giant;
                    }
                    
                    _set = true;
                    _spr_data.prop = UnknownEnum.Value_41;
                    _mood_x = floor(38.5);
                    _mood_y = 10;
                    break;
                
                case UnknownEnum.Value_39:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_goblin_shrine_start_body_alpha;
                            _mon_spr.hand_b = spr_h_goblin_shrine_start_hand_alpha;
                            _mon_spr.pen = spr_h_goblin_shrine_start_pen;
                            _spr_data.hand_xscale = choose(1, -1);
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_goblin_shrine_alpha;
                            _touch = spr_h_goblin_shrine_touch;
                            _enter = spr_h_goblin_shrine_enter;
                            break;
                        
                        case UnknownEnum.Value_3:
                            _mon_spr.body_b = spr_h_goblin_shrine_alpha;
                            _touch = spr_h_goblin_shrine_touch;
                            _enter = spr_h_goblin_shrine_enter;
                            break;
                    }
                    
                    _set = true;
                    _mood_x = floor(38.5);
                    _mood_y = 0;
                    break;
                
                case UnknownEnum.Value_18:
                    if (mon_data.placement_num != 1)
                    {
                        switch (_leg)
                        {
                            case UnknownEnum.Value_1:
                                _mon_spr.body_b = spr_h_goblin_gb_1_loop_alpha;
                                break;
                            
                            case UnknownEnum.Value_2:
                                _mon_spr.body_b = spr_h_goblin_gb_1_loop_alpha;
                                break;
                            
                            case UnknownEnum.Value_0:
                                _mon_spr.body_b = spr_h_goblin_gb_1_v3_loop_alpha;
                                
                                if (mon_data.placement_num == 0)
                                    _x_shift = 2;
                                
                                break;
                        }
                        
                        if (mon_data.placement_num == 0)
                        {
                            _spr_data.prop = UnknownEnum.Value_44;
                            _touch = spr_h_ogre_touch_loop;
                        }
                        else
                        {
                            _spr_data.prop = UnknownEnum.Value_45;
                        }
                        
                        switch (_class)
                        {
                            case UnknownEnum.Value_9:
                                _mon_spr.body_b = spr_h_goblin_gb_1_cow_loop_alpha;
                                break;
                            
                            case UnknownEnum.Value_8:
                                _mon_spr.body_b = spr_h_goblin_gb_1_lilith_loop_alpha;
                                break;
                        }
                    }
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _touch = spr_h_ogre_touch_loop_cow;
                            break;
                        
                        case UnknownEnum.Value_10:
                            _touch = spr_h_ogre_touch_loop_nyx;
                            break;
                        
                        case UnknownEnum.Value_12:
                            _touch = spr_h_ogre_touch_loop_morrigan;
                            break;
                        
                        case UnknownEnum.Value_13:
                            _touch = spr_h_ogre_touch_loop_cat;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _touch = spr_h_ogre_touch_loop_lilith;
                            break;
                        
                        case UnknownEnum.Value_14:
                            _touch = spr_h_ogre_touch_loop_frieren;
                            break;
                    }
                    
                    _spr_data.mon_frame_c = 5;
                    _spr_data.base_frame_c = 5;
                    _spr_data.start_frame = 0;
                    image_xscale = ((mon_data.slot_id.slot_data.mod_index[6] * 2) - 1) * -1;
                    
                    switch (mon_data.placement_num)
                    {
                        case 0:
                            if (image_xscale == -1)
                                _mood_x = 45;
                            else
                                _mood_x = 32;
                            
                            _mood_y += 6;
                            break;
                        
                        case 1:
                            _mood_x = 38.5;
                            _mood_y += 8;
                            break;
                        
                        case 2:
                            if (image_xscale == 1)
                                _mood_x = 62;
                            else
                                _mood_x = 15;
                            
                            _mood_y += 8;
                            break;
                    }
                    
                    _set = true;
                    break;
                
                case UnknownEnum.Value_19:
                    switch (_leg)
                    {
                        case UnknownEnum.Value_1:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_goblin_gb_2_v3_loop_alpha;
                            break;
                    }
                    
                    _enter = spr_h_goblin_gb_2_loop_enter;
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _mon_spr.body_b = spr_h_goblin_gb_2_cow_loop_alpha;
                            _enter = spr_h_goblin_gb_2_loop_enter_cow;
                            break;
                        
                        case UnknownEnum.Value_10:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            _enter = spr_h_goblin_gb_2_loop_enter_nyx;
                            break;
                        
                        case UnknownEnum.Value_12:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            _enter = spr_h_goblin_gb_2_loop_enter_morrigan;
                            break;
                        
                        case UnknownEnum.Value_13:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            _enter = spr_h_goblin_gb_2_loop_enter_cat;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            _enter = spr_h_goblin_gb_2_loop_enter_lilith;
                            break;
                        
                        case UnknownEnum.Value_14:
                            _mon_spr.body_b = spr_h_goblin_gb_2_loop_alpha;
                            _enter = spr_h_goblin_gb_2_loop_enter_frieren;
                            break;
                    }
                    
                    _mood_x = floor(38.5);
                    _mood_y = 30;
                    _spr_data.mon_frame_c = 5;
                    _spr_data.base_frame_c = 5;
                    _spr_data.start_frame = 0;
                    _set = true;
                    break;
                
                case UnknownEnum.Value_23:
                    _mood_x = 38.5;
                    _mood_y += -1;
                    _mon_spr.body_b = spr_h_goblin_gb_3_loop_body_alpha;
                    _mon_spr.hand_b = spr_h_goblin_gb_3_loop_hand_alpha;
                    _enter = spr_h_goblin_gb_3_loop_enter;
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _mon_spr.hand_b = spr_h_goblin_gb_3_cow_loop_hand_alpha;
                            _enter = spr_h_goblin_gb_3_cow_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _mon_spr.hand_b = spr_h_goblin_gb_3_lilith_loop_hand_alpha;
                            _enter = spr_h_goblin_gb_3_lilith_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_10:
                            _enter = spr_h_goblin_gb_3_nyx_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_13:
                            _enter = spr_h_goblin_gb_3_cat_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_12:
                            _enter = spr_h_goblin_gb_3_morrigan_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_14:
                            _enter = spr_h_goblin_gb_3_frieren_loop_enter;
                            break;
                    }
                    
                    _spr_data.prop = UnknownEnum.Value_46;
                    _spr_data.mon_frame_c = 5;
                    _spr_data.base_frame_c = 5;
                    _spr_data.start_frame = 0;
                    _set = true;
                    break;
            }
            
            if (!_set)
            {
                if (!_anal)
                {
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            switch (_leg)
                            {
                                case UnknownEnum.Value_1:
                                    _mon_spr.body_b = spr_h_goblin_body_start_v1_alpha;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _mon_spr.body_b = spr_h_goblin_body_start_v2_alpha;
                                    break;
                                
                                case UnknownEnum.Value_0:
                                    _mon_spr.body_b = spr_h_goblin_body_start_v1_alpha;
                                    break;
                            }
                            
                            _spr_data.hand_xscale = choose(1, -1);
                            _mon_spr.head_b = -1;
                            _mon_spr.hand_b = spr_h_goblin_hand_start_alpha;
                            _mon_spr.pen = spr_h_goblin_pen_start;
                            _touch = spr_h_goblin_touch_start;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _mon_spr.body_b = spr_h_goblin_body_start_v2_alpha;
                                    _mon_spr.body_b = spr_h_goblin_body_start_cow_alpha;
                                    _touch = spr_h_goblin_touch_start_cow;
                                    break;
                                
                                case UnknownEnum.Value_10:
                                    _touch = spr_h_goblin_touch_start_nyx;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _touch = spr_h_goblin_touch_start_cat;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _touch = spr_h_goblin_touch_start_morrigan;
                                    break;
                                
                                case UnknownEnum.Value_8:
                                    _touch = spr_h_goblin_touch_start_lilith;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _touch = spr_h_goblin_touch_start_frieren;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.head_b = choose(spr_h_goblin_head_loop_d1_alpha, spr_h_goblin_head_loop_d2_alpha);
                            
                            switch (_leg)
                            {
                                case UnknownEnum.Value_1:
                                    _mon_spr.body_b = spr_h_goblin_body_loop_v1_alpha;
                                    _mon_spr.hand_b = spr_h_goblin_hand_loop_v1_alpha;
                                    _touch = spr_h_goblin_touch_loop_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _mon_spr.body_b = spr_h_goblin_body_loop_v2_alpha;
                                    _mon_spr.hand_b = spr_h_goblin_hand_loop_v2_alpha;
                                    _touch = spr_h_goblin_touch_loop_v2;
                                    break;
                                
                                case UnknownEnum.Value_0:
                                    _mon_spr.body_b = spr_h_goblin_body_loop_v1_alpha;
                                    _mon_spr.hand_b = spr_h_goblin_hand_loop_v1_alpha;
                                    _touch = spr_h_goblin_touch_loop_v1;
                                    break;
                            }
                            
                            _spr_data.hand_xscale = 1;
                            _mon_spr.pen = spr_h_goblin_pen_loop;
                            _enter = spr_h_goblin_enter_loop;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _mon_spr.body_b = spr_h_goblin_body_loop_cow_alpha;
                                    _mon_spr.hand_b = spr_h_goblin_hand_loop_cow_alpha;
                                    _touch = spr_h_goblin_touch_loop_cow;
                                    _enter = spr_h_goblin_enter_loop_cow;
                                    break;
                                
                                case UnknownEnum.Value_10:
                                    _touch = spr_h_goblin_touch_loop_nyx;
                                    _enter = spr_h_goblin_enter_loop_nyx;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _touch = spr_h_goblin_touch_loop_morrigan;
                                    _enter = spr_h_goblin_enter_loop_morrigan;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _touch = spr_h_goblin_touch_loop_cat;
                                    _enter = spr_h_goblin_enter_loop_cat;
                                    break;
                                
                                case UnknownEnum.Value_8:
                                    _touch = spr_h_goblin_touch_loop_lilith;
                                    _enter = spr_h_goblin_enter_loop_lilith;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _touch = spr_h_goblin_touch_loop_frieren;
                                    _enter = spr_h_goblin_enter_loop_frieren;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_3:
                            if (_slot_type == UnknownEnum.Value_1 && _slot_type == UnknownEnum.Value_2 && _slot_type == UnknownEnum.Value_7 && _slot_type == UnknownEnum.Value_8 && _slot_type == UnknownEnum.Value_3)
                            {
                                switch (_leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_v1_alpha;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_v2_alpha;
                                        break;
                                    
                                    case UnknownEnum.Value_0:
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_v1_alpha;
                                        break;
                                }
                                
                                _mon_spr.body_b = spr_h_goblin_body_ej_alpha;
                                
                                if (_slot_type == UnknownEnum.Value_3)
                                    _mon_spr.hand_b = -1;
                                
                                _mon_spr.head_b = -1;
                                _spr_data.hand_xscale = 1;
                                _mon_spr.pen = spr_h_goblin_pen_loop;
                                _enter = spr_h_goblin_enter_loop;
                                _touch = spr_h_goblin_touch_ej;
                                
                                switch (_class)
                                {
                                    case UnknownEnum.Value_9:
                                        _mon_spr.body_b = spr_h_goblin_body_ej_cow_alpha;
                                        
                                        if (_slot_type == UnknownEnum.Value_3)
                                            _mon_spr.hand_b = -1;
                                        else
                                            _mon_spr.hand_b = spr_h_goblin_hand_loop_cow_alpha;
                                        
                                        _touch = spr_h_goblin_touch_ej_cow;
                                        _enter = spr_h_goblin_enter_loop_cow;
                                        break;
                                    
                                    case UnknownEnum.Value_10:
                                        _touch = spr_h_goblin_touch_ej_nyx;
                                        _enter = spr_h_goblin_enter_loop_nyx;
                                        break;
                                    
                                    case UnknownEnum.Value_12:
                                        _touch = spr_h_goblin_touch_ej_morrigan;
                                        _enter = spr_h_goblin_enter_loop_morrigan;
                                        break;
                                    
                                    case UnknownEnum.Value_13:
                                        _touch = spr_h_goblin_touch_ej_cat;
                                        _enter = spr_h_goblin_enter_loop_cat;
                                        break;
                                    
                                    case UnknownEnum.Value_8:
                                        _touch = spr_h_goblin_touch_ej_lilith;
                                        _enter = spr_h_goblin_enter_loop_lilith;
                                        break;
                                    
                                    case UnknownEnum.Value_14:
                                        _touch = spr_h_goblin_touch_ej_frieren;
                                        _enter = spr_h_goblin_enter_loop_frieren;
                                        break;
                                }
                            }
                            else
                            {
                                _mon_spr.head_b = choose(spr_h_goblin_head_loop_d1_alpha, spr_h_goblin_head_loop_d2_alpha);
                                
                                switch (_leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _mon_spr.body_b = spr_h_goblin_body_loop_v1_alpha;
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_v1_alpha;
                                        _touch = spr_h_goblin_touch_loop_v1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _mon_spr.body_b = spr_h_goblin_body_loop_v2_alpha;
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_v2_alpha;
                                        _touch = spr_h_goblin_touch_loop_v2;
                                        break;
                                    
                                    case UnknownEnum.Value_0:
                                        _mon_spr.body_b = spr_h_goblin_body_loop_v1_alpha;
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_v1_alpha;
                                        _touch = spr_h_goblin_touch_loop_v1;
                                        break;
                                }
                                
                                _spr_data.hand_xscale = 1;
                                _mon_spr.pen = spr_h_goblin_pen_loop;
                                _enter = spr_h_goblin_enter_loop;
                                
                                switch (_class)
                                {
                                    case UnknownEnum.Value_9:
                                        _mon_spr.body_b = spr_h_goblin_body_loop_cow_alpha;
                                        _mon_spr.hand_b = spr_h_goblin_hand_loop_cow_alpha;
                                        _touch = spr_h_goblin_touch_loop_cow;
                                        _enter = spr_h_goblin_enter_loop_cow;
                                        break;
                                    
                                    case UnknownEnum.Value_10:
                                        _touch = spr_h_goblin_touch_loop_nyx;
                                        _enter = spr_h_goblin_enter_loop_nyx;
                                        break;
                                    
                                    case UnknownEnum.Value_12:
                                        _touch = spr_h_goblin_touch_loop_morrigan;
                                        _enter = spr_h_goblin_enter_loop_morrigan;
                                        break;
                                    
                                    case UnknownEnum.Value_13:
                                        _touch = spr_h_goblin_touch_loop_cat;
                                        _enter = spr_h_goblin_enter_loop_cat;
                                        break;
                                    
                                    case UnknownEnum.Value_8:
                                        _touch = spr_h_goblin_touch_loop_lilith;
                                        _enter = spr_h_goblin_enter_loop_lilith;
                                        break;
                                    
                                    case UnknownEnum.Value_14:
                                        _touch = spr_h_goblin_touch_loop_frieren;
                                        _enter = spr_h_goblin_enter_loop_frieren;
                                        break;
                                }
                            }
                            
                            break;
                    }
                }
                else
                {
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            switch (_leg)
                            {
                                case UnknownEnum.Value_1:
                                    _touch = spr_h_goblin_touch_start_anal_v1;
                                    _mon_spr.body_b = spr_h_goblin_body_start_alpha_anal;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _touch = spr_h_goblin_touch_start_anal_v2;
                                    _mon_spr.body_b = spr_h_goblin_body_start_alpha_anal;
                                    break;
                                
                                case UnknownEnum.Value_0:
                                    _touch = spr_h_goblin_touch_start_anal_v1;
                                    _mon_spr.body_b = spr_h_goblin_body_start_alpha_anal;
                                    break;
                            }
                            
                            _spr_data.hand_xscale = 1;
                            _mon_spr.head_b = -1;
                            _mon_spr.hand_b = spr_h_goblin_hand_start_alpha_anal;
                            _mon_spr.pen = spr_h_goblin_pen_start_anal;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _mon_spr.body_b = spr_h_goblin_body_start_alpha_anal_cow;
                                    _touch = spr_h_goblin_touch_start_anal_cow;
                                    break;
                                
                                case UnknownEnum.Value_10:
                                    _touch = spr_h_goblin_touch_start_anal_nyx;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _touch = spr_h_goblin_touch_start_anal_cat;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _touch = spr_h_goblin_touch_start_anal_morrigan;
                                    break;
                                
                                case UnknownEnum.Value_8:
                                    _mon_spr.body_b = spr_h_goblin_body_start_alpha_anal_lilith;
                                    _touch = spr_h_goblin_touch_start_anal_lilith;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _touch = spr_h_goblin_touch_start_anal_frieren;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.head_b = spr_h_goblin_head_loop_alpha_anal;
                            _mon_spr.hand_b = spr_h_goblin_hand_loop_alpha_anal;
                            _mon_spr.body_b = spr_h_goblin_body_loop_alpha_anal;
                            _spr_data.hand_xscale = 1;
                            _mon_spr.pen = spr_h_goblin_pen_loop_anal;
                            _enter = spr_h_goblin_enter_loop_anal;
                            _touch = spr_h_goblin_touch_loop_anal;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _mon_spr.body_b = spr_h_goblin_body_loop_alpha_anal_cow;
                                    _touch = spr_h_goblin_touch_loop_anal_cow;
                                    _enter = spr_h_goblin_enter_loop_anal_cow;
                                    break;
                                
                                case UnknownEnum.Value_10:
                                    _touch = spr_h_goblin_touch_loop_anal_nyx;
                                    _enter = spr_h_goblin_enter_loop_anal_nyx;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _touch = spr_h_goblin_touch_loop_anal_morrigan;
                                    _enter = spr_h_goblin_enter_loop_anal_morrigan;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _touch = spr_h_goblin_touch_loop_anal_cat;
                                    _enter = spr_h_goblin_enter_loop_anal_cat;
                                    break;
                                
                                case UnknownEnum.Value_8:
                                    _mon_spr.body_b = spr_h_goblin_body_loop_alpha_anal_lilith;
                                    _touch = spr_h_goblin_touch_loop_anal_lilith;
                                    _enter = spr_h_goblin_enter_loop_anal_lilith;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _touch = spr_h_goblin_touch_loop_anal_frieren;
                                    _enter = spr_h_goblin_enter_loop_anal_frieren;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_3:
                            if (_slot_type == UnknownEnum.Value_1 || _slot_type == UnknownEnum.Value_2)
                            {
                                _mon_spr.body_b = spr_h_goblin_body_ej_alpha_anal;
                                _mon_spr.hand_b = -1;
                                _mon_spr.head_b = -1;
                                _spr_data.hand_xscale = 1;
                                _mon_spr.pen = spr_h_goblin_pen_loop_anal;
                                _enter = spr_h_goblin_enter_loop_anal;
                                _touch = spr_h_goblin_touch_loop_anal;
                                
                                switch (_class)
                                {
                                    case UnknownEnum.Value_9:
                                        _mon_spr.body_b = spr_h_goblin_body_ej_alpha_anal_cow;
                                        _touch = spr_h_goblin_touch_loop_anal_cow;
                                        _enter = spr_h_goblin_enter_loop_anal_cow;
                                        break;
                                    
                                    case UnknownEnum.Value_10:
                                        _touch = spr_h_goblin_touch_loop_anal_nyx;
                                        _enter = spr_h_goblin_enter_loop_anal_nyx;
                                        break;
                                    
                                    case UnknownEnum.Value_12:
                                        _touch = spr_h_goblin_touch_loop_anal_morrigan;
                                        _enter = spr_h_goblin_enter_loop_anal_morrigan;
                                        break;
                                    
                                    case UnknownEnum.Value_13:
                                        _touch = spr_h_goblin_touch_loop_anal_cat;
                                        _enter = spr_h_goblin_enter_loop_anal_cat;
                                        break;
                                    
                                    case UnknownEnum.Value_8:
                                        _mon_spr.body_b = spr_h_goblin_body_ej_alpha_anal_lilith;
                                        _touch = spr_h_goblin_touch_loop_anal_lilith;
                                        _enter = spr_h_goblin_enter_loop_anal_lilith;
                                        break;
                                    
                                    case UnknownEnum.Value_14:
                                        _touch = spr_h_goblin_touch_loop_anal_frieren;
                                        _enter = spr_h_goblin_enter_loop_anal_frieren;
                                        break;
                                }
                            }
                            else
                            {
                                _mon_spr.head_b = spr_h_goblin_head_loop_alpha_anal;
                                _mon_spr.hand_b = spr_h_goblin_hand_loop_alpha_anal;
                                _mon_spr.body_b = spr_h_goblin_body_loop_alpha_anal;
                                _spr_data.hand_xscale = 1;
                                _mon_spr.pen = spr_h_goblin_pen_loop_anal;
                                _enter = spr_h_goblin_enter_loop_anal;
                                _touch = spr_h_goblin_touch_loop_anal;
                                
                                switch (_class)
                                {
                                    case UnknownEnum.Value_9:
                                        _mon_spr.body_b = spr_h_goblin_body_loop_alpha_anal_cow;
                                        _touch = spr_h_goblin_touch_loop_anal_cow;
                                        _enter = spr_h_goblin_enter_loop_anal_cow;
                                        break;
                                    
                                    case UnknownEnum.Value_10:
                                        _touch = spr_h_goblin_touch_loop_anal_nyx;
                                        _enter = spr_h_goblin_enter_loop_anal_nyx;
                                        break;
                                    
                                    case UnknownEnum.Value_13:
                                        _touch = spr_h_goblin_touch_loop_anal_cat;
                                        _enter = spr_h_goblin_enter_loop_anal_cat;
                                        break;
                                    
                                    case UnknownEnum.Value_12:
                                        _touch = spr_h_goblin_touch_loop_anal_morrigan;
                                        _enter = spr_h_goblin_enter_loop_anal_morrigan;
                                        break;
                                    
                                    case UnknownEnum.Value_8:
                                        _mon_spr.body_b = spr_h_goblin_body_loop_alpha_anal_lilith;
                                        _touch = spr_h_goblin_touch_loop_anal_lilith;
                                        _enter = spr_h_goblin_enter_loop_anal_lilith;
                                        break;
                                    
                                    case UnknownEnum.Value_14:
                                        _touch = spr_h_goblin_touch_loop_anal_frieren;
                                        _enter = spr_h_goblin_enter_loop_anal_frieren;
                                        break;
                                }
                            }
                            
                            break;
                    }
                }
            }
            
            switch (_spr_data.prop)
            {
                case UnknownEnum.Value_42:
                    _mon_spr.prop = spr_low_crate;
                    break;
                
                case UnknownEnum.Value_0:
                    _mon_spr.prop = spr_crate;
                    break;
                
                case UnknownEnum.Value_2:
                    _mon_spr.prop = spr_fence;
                    break;
                
                case UnknownEnum.Value_41:
                    _mon_spr.prop = spr_plank;
                    break;
                
                case UnknownEnum.Value_44:
                    _mon_spr.prop = spr_small_step_1;
                    break;
                
                case UnknownEnum.Value_45:
                    _mon_spr.prop = spr_small_step_2;
                    break;
                
                case UnknownEnum.Value_46:
                    _mon_spr.prop = spr_small_step_3;
                    break;
                
                case UnknownEnum.Value_43:
                    _mon_spr.prop = spr_bowl;
                    break;
            }
            
            _mood_y -= 18;
            break;
        
        case UnknownEnum.Value_1:
            switch (_slot_type)
            {
                case UnknownEnum.Value_36:
                    image_xscale = ((mon_data.slot_id.slot_data.mod_index[7] * 2) - 1) * -1;
                    _mon_spr.body_b = spr_h_hobgoblin_dairy_loop_alpha;
                    _touch = spr_h_hobgoblin_dairy_loop_touch;
                    _set = true;
                    
                    if (image_xscale == 1)
                        _mood_x = 60;
                    else
                        _mood_x = 17;
                    
                    _mood_y = -4;
                    break;
                
                case UnknownEnum.Value_37:
                    if (arg1 == UnknownEnum.Value_0)
                    {
                        _mon_spr.body_b = spr_h_hobgoblin_body_start_alpha_giant;
                        _mon_spr.pen = spr_h_hobgoblin_body_start_pen_giant;
                    }
                    else
                    {
                        _mon_spr.body_b = spr_h_hobgoblin_body_alpha_giant;
                        _mon_spr.pen = spr_h_hobgoblin_pen_giant;
                        _touch = spr_h_hobgoblin_touch_giant;
                        _enter = spr_h_hobgoblin_enter_giant;
                    }
                    
                    _set = true;
                    _mood_x = floor(38.5);
                    _mood_y = 8;
                    break;
                
                case UnknownEnum.Value_18:
                    switch (_leg)
                    {
                        case UnknownEnum.Value_1:
                            _mon_spr.body_b = spr_h_hobgoblin_gb_1_loop_alpha;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_hobgoblin_gb_1_loop_alpha;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_hobgoblin_gb_1_v3_loop_alpha;
                            break;
                    }
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_8:
                            _mon_spr.body_b = spr_h_hobgoblin_gb_1_lilith_loop_alpha;
                            break;
                    }
                    
                    _spr_data.mon_frame_c = 5;
                    _spr_data.base_frame_c = 5;
                    _spr_data.start_frame = 0;
                    image_xscale = ((mon_data.slot_id.slot_data.mod_index[6] * 2) - 1) * -1;
                    
                    if (image_xscale == -1)
                        _mood_x = 45;
                    else
                        _mood_x = 32;
                    
                    _mood_y += 5;
                    _set = true;
                    break;
                
                case UnknownEnum.Value_23:
                    _mon_spr.body_b = spr_h_hobgoblin_gb_3_loop_body_alpha;
                    _mon_spr.hand_b = spr_h_hobgoblin_gb_3_loop_hand_alpha;
                    _enter = spr_h_hobgoblin_gb_3_loop_enter;
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _mon_spr.hand_b = spr_h_hobgoblin_gb_3_cow_loop_hand_alpha;
                            _enter = spr_h_hobgoblin_gb_3_cow_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _mon_spr.hand_b = spr_h_hobgoblin_gb_3_lilith_loop_hand_alpha;
                            _enter = spr_h_hobgoblin_gb_3_lilith_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_13:
                            _enter = spr_h_hobgoblin_gb_3_cat_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_10:
                            _enter = spr_h_hobgoblin_gb_3_nyx_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_12:
                            _enter = spr_h_hobgoblin_gb_3_morrigan_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_14:
                            _enter = spr_h_hobgoblin_gb_3_frieren_loop_enter;
                            break;
                    }
                    
                    _spr_data.mon_frame_c = 5;
                    _spr_data.base_frame_c = 5;
                    _spr_data.start_frame = 0;
                    image_xscale = ((mon_data.slot_id.slot_data.mod_index[5] * 2) - 1) * -1;
                    _mood_x = 38.5;
                    _mood_y += 4;
                    _set = true;
                    break;
                
                case UnknownEnum.Value_39:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_hobgoblin_shrine_start_body_alpha;
                            _mon_spr.hand_b = spr_hobgoblin_shrine_start_hand_alpha;
                            _mon_spr.pen = spr_hobgoblin_shrine_start_pen;
                            _spr_data.hand_xscale = choose(1, -1);
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_hobgoblin_shrine_alpha;
                            _touch = spr_h_hobgoblin_shrine_touch;
                            _enter = spr_h_hobgoblin_shrine_enter;
                            break;
                        
                        case UnknownEnum.Value_3:
                            _mon_spr.body_b = spr_h_hobgoblin_shrine_alpha;
                            _touch = spr_h_hobgoblin_shrine_touch;
                            _enter = spr_h_hobgoblin_shrine_enter;
                            break;
                    }
                    
                    _set = true;
                    _mood_x = floor(38.5);
                    _mood_y = 0;
                    break;
                
                case UnknownEnum.Value_9:
                    _mood_y += 31;
                    break;
                
                case UnknownEnum.Value_13:
                    _mood_y += 23;
                    break;
                
                case UnknownEnum.Value_14:
                    _mood_y += 20;
                    break;
                
                case UnknownEnum.Value_3:
                    _mood_y += 5;
                    break;
            }
            
            if (!_set)
            {
                if (!_anal)
                {
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            switch (_leg)
                            {
                                case UnknownEnum.Value_1:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_start_v1_alpha;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_start_v2_alpha;
                                    break;
                                
                                case UnknownEnum.Value_0:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_start_v3_alpha;
                                    break;
                            }
                            
                            _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_start_d1_alpha, spr_h_hobgoblin_hand_start_d2_alpha);
                            _mon_spr.head_b = -1;
                            _spr_data.hand_xscale = choose(1, -1);
                            _mon_spr.pen = spr_h_hobgoblin_pen_start;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _mon_spr.hand_b = spr_h_hobgoblin_hand_start_cow_alpha;
                                    _mon_spr.body_b = spr_h_hobgoblin_body_start_cow_alpha;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_start_v3_alpha;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (_leg)
                            {
                                case UnknownEnum.Value_1:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_loop_v1_alpha;
                                    _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v1_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_loop_v2_alpha;
                                    _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v2_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                    break;
                                
                                case UnknownEnum.Value_0:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_loop_v3_alpha;
                                    _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v1_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                    break;
                            }
                            
                            _mon_spr.head_b = spr_h_hobgoblin_head_loop_alpha;
                            
                            if (_slot_type == UnknownEnum.Value_15)
                                _spr_data.hand_xscale = choose(1, -1);
                            else
                                _spr_data.hand_xscale = 1;
                            
                            _mon_spr.pen = spr_h_hobgoblin_pen_loop;
                            _touch = spr_h_hobgoblin_touch_loop;
                            _enter = spr_h_hobgoblin_enter_loop;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _mon_spr.body_b = spr_h_hobgoblin_body_loop_cow_alpha;
                                    _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v1_d1_alpha;
                                    _touch = spr_h_hobgoblin_touch_loop_cow;
                                    _enter = spr_h_hobgoblin_enter_loop_cow;
                                    break;
                                
                                case UnknownEnum.Value_10:
                                    _touch = spr_h_hobgoblin_touch_loop_nyx;
                                    _enter = spr_h_hobgoblin_enter_loop_nyx;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _touch = spr_h_hobgoblin_touch_loop_cat;
                                    _enter = spr_h_hobgoblin_enter_loop_cat;
                                    _mon_spr.body_b = spr_h_hobgoblin_body_loop_v3_alpha;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _touch = spr_h_hobgoblin_touch_loop_morrigan;
                                    _enter = spr_h_hobgoblin_enter_loop_morrigan;
                                    break;
                                
                                case UnknownEnum.Value_8:
                                    _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v1_d1_alpha;
                                    _touch = spr_h_hobgoblin_enter_loop_lilith;
                                    _enter = spr_h_hobgoblin_enter_loop_lilith;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _touch = spr_h_hobgoblin_touch_loop_frieren;
                                    _enter = spr_h_hobgoblin_enter_loop_frieren;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_3:
                            if (_slot_type == UnknownEnum.Value_1 || _slot_type == UnknownEnum.Value_2 || _slot_type == UnknownEnum.Value_7 || _slot_type == UnknownEnum.Value_8 || _slot_type == UnknownEnum.Value_15)
                            {
                                switch (_leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v1_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v2_alpha;
                                        break;
                                    
                                    case UnknownEnum.Value_0:
                                        _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v1_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                        break;
                                }
                                
                                _mon_spr.head_b = -1;
                                _mon_spr.body_b = spr_h_hobgoblin_body_ej_alpha;
                                
                                if (_slot_type == UnknownEnum.Value_15)
                                    _mon_spr.hand_b = spr_h_hobgoblin_hand_ej_alpha;
                                else
                                    _spr_data.hand_xscale = 1;
                                
                                _mon_spr.pen = spr_h_hobgoblin_pen_loop;
                                _enter = spr_h_hobgoblin_enter_loop;
                                _touch = spr_h_hobgoblin_touch_loop;
                                
                                switch (_class)
                                {
                                    case UnknownEnum.Value_9:
                                        _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v1_d1_alpha;
                                        _touch = spr_h_hobgoblin_touch_loop_cow;
                                        _enter = spr_h_hobgoblin_enter_loop_cow;
                                        break;
                                    
                                    case UnknownEnum.Value_8:
                                        _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v1_d1_alpha;
                                        _touch = spr_h_hobgoblin_touch_loop_lilith;
                                        _enter = spr_h_hobgoblin_enter_loop_lilith;
                                        break;
                                    
                                    case UnknownEnum.Value_10:
                                        _touch = spr_h_hobgoblin_touch_loop_nyx;
                                        _enter = spr_h_hobgoblin_enter_loop_nyx;
                                        break;
                                    
                                    case UnknownEnum.Value_13:
                                        _touch = spr_h_hobgoblin_touch_loop_cat;
                                        _enter = spr_h_hobgoblin_enter_loop_cat;
                                        break;
                                    
                                    case UnknownEnum.Value_12:
                                        _touch = spr_h_hobgoblin_touch_loop_morrigan;
                                        _enter = spr_h_hobgoblin_enter_loop_morrigan;
                                        break;
                                    
                                    case UnknownEnum.Value_14:
                                        _touch = spr_h_hobgoblin_touch_loop_frieren;
                                        _enter = spr_h_hobgoblin_enter_loop_frieren;
                                        break;
                                }
                            }
                            else
                            {
                                switch (_leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _mon_spr.body_b = spr_h_hobgoblin_body_loop_v1_alpha;
                                        _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v1_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _mon_spr.body_b = spr_h_hobgoblin_body_loop_v2_alpha;
                                        _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v2_alpha;
                                        break;
                                    
                                    case UnknownEnum.Value_0:
                                        _mon_spr.body_b = spr_h_hobgoblin_body_loop_v1_alpha;
                                        _mon_spr.hand_b = choose(spr_h_hobgoblin_hand_loop_v1_alpha, spr_h_hobgoblin_hand_loop_v1_d1_alpha);
                                        break;
                                }
                                
                                _mon_spr.head_b = spr_h_hobgoblin_head_loop_alpha;
                                _spr_data.hand_xscale = 1;
                                _mon_spr.pen = spr_h_hobgoblin_pen_loop;
                                _touch = spr_h_hobgoblin_touch_loop;
                                _enter = spr_h_hobgoblin_enter_loop;
                                
                                switch (_class)
                                {
                                    case UnknownEnum.Value_9:
                                        _mon_spr.body_b = spr_h_hobgoblin_body_loop_cow_alpha;
                                        _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v1_d1_alpha;
                                        _touch = spr_h_hobgoblin_touch_loop_cow;
                                        _enter = spr_h_hobgoblin_enter_loop_cow;
                                        break;
                                    
                                    case UnknownEnum.Value_8:
                                        _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_v1_d1_alpha;
                                        _touch = spr_h_hobgoblin_touch_loop_lilith;
                                        _enter = spr_h_hobgoblin_enter_loop_lilith;
                                        break;
                                    
                                    case UnknownEnum.Value_10:
                                        _touch = spr_h_hobgoblin_touch_loop_nyx;
                                        _enter = spr_h_hobgoblin_enter_loop_nyx;
                                        break;
                                    
                                    case UnknownEnum.Value_13:
                                        _touch = spr_h_hobgoblin_touch_loop_cat;
                                        _enter = spr_h_hobgoblin_enter_loop_cat;
                                        break;
                                    
                                    case UnknownEnum.Value_12:
                                        _touch = spr_h_hobgoblin_touch_loop_morrigan;
                                        _enter = spr_h_hobgoblin_enter_loop_morrigan;
                                        break;
                                    
                                    case UnknownEnum.Value_14:
                                        _touch = spr_h_hobgoblin_touch_loop_frieren;
                                        _enter = spr_h_hobgoblin_enter_loop_frieren;
                                        break;
                                }
                            }
                            
                            break;
                    }
                }
                else
                {
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_hobgoblin_body_start_alpha_anal;
                            _spr_data.hand_xscale = 1;
                            _mon_spr.head_b = -1;
                            _mon_spr.hand_b = spr_h_hobgoblin_hand_start_alpha_anal;
                            _mon_spr.pen = spr_h_hobgoblin_pen_start_anal;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.head_b = spr_h_hobgoblin_head_loop_alpha_anal;
                            _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_alpha_anal;
                            _mon_spr.body_b = spr_h_hobgoblin_body_loop_alpha_anal;
                            _spr_data.hand_xscale = 1;
                            _mon_spr.pen = spr_h_hobgoblin_pen_loop_anal;
                            _enter = spr_h_goblin_enter_loop_anal;
                            _touch = spr_h_hobgoblin_touch_loop_anal;
                            
                            switch (_class)
                            {
                                case UnknownEnum.Value_9:
                                    _touch = spr_h_hobgoblin_touch_loop_anal_cow;
                                    _enter = spr_h_hobgoblin_enter_loop_anal_cow;
                                    break;
                                
                                case UnknownEnum.Value_8:
                                    _touch = spr_h_hobgoblin_touch_loop_lilith;
                                    _enter = spr_h_hobgoblin_enter_loop_anal_lilith;
                                    break;
                                
                                case UnknownEnum.Value_10:
                                    _touch = spr_h_hobgoblin_touch_loop_anal_nyx;
                                    _enter = spr_h_hobgoblin_enter_loop_anal_nyx;
                                    break;
                                
                                case UnknownEnum.Value_13:
                                    _touch = spr_h_hobgoblin_touch_loop_anal_cat;
                                    _enter = spr_h_hobgoblin_enter_loop_anal_cat;
                                    break;
                                
                                case UnknownEnum.Value_12:
                                    _touch = spr_h_hobgoblin_touch_loop_anal_morrigan;
                                    _enter = spr_h_hobgoblin_enter_loop_anal_morrigan;
                                    break;
                                
                                case UnknownEnum.Value_14:
                                    _touch = spr_h_hobgoblin_touch_loop_anal_frieren;
                                    _enter = spr_h_hobgoblin_enter_loop_anal_frieren;
                                    break;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_3:
                            _mon_spr.head_b = spr_h_hobgoblin_head_loop_alpha_anal;
                            _mon_spr.hand_b = spr_h_hobgoblin_hand_loop_alpha_anal;
                            _mon_spr.body_b = spr_h_hobgoblin_body_loop_alpha_anal;
                            _spr_data.hand_xscale = 1;
                            _mon_spr.pen = spr_h_hobgoblin_pen_loop_anal;
                            _enter = spr_h_goblin_enter_loop_anal;
                            _touch = spr_h_hobgoblin_touch_loop_anal;
                            break;
                    }
                }
            }
            
            break;
        
        case UnknownEnum.Value_3:
            _mood_x = floor(38.5);
            _mood_y = 0;
            
            switch (_slot_type)
            {
                case UnknownEnum.Value_37:
                    if (arg1 == UnknownEnum.Value_0)
                    {
                        _mon_spr.body_b = spr_h_ogre_giant_start_alpha;
                        _mon_spr.pen = spr_h_ogre_giant_start_pen;
                    }
                    else
                    {
                        _mon_spr.body_b = spr_h_ogre_giant_loop_alpha;
                        _mon_spr.pen = spr_h_ogre_giant_loop_pen;
                        _touch = spr_h_ogre_giant_loop_touch;
                    }
                    
                    _set = true;
                    _mood_x = floor(38.5);
                    _mood_y = 8;
                    break;
                
                case UnknownEnum.Value_38:
                    _set = true;
                    _mon_spr.body_b = spr_h_ogre_body_loop_morrigan;
                    break;
                
                case UnknownEnum.Value_39:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_ogre_shrine_start_alpha;
                            _mon_spr.pen = spr_h_ogre_shrine_start_enter;
                            _spr_data.hand_xscale = choose(1, -1);
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_ogre_shrine_loop_alpha;
                            _enter = spr_h_ogre_shrine_loop_enter;
                            break;
                        
                        case UnknownEnum.Value_3:
                            _mon_spr.body_b = spr_h_ogre_shrine_loop_alpha;
                            _enter = spr_h_ogre_shrine_loop_enter;
                            break;
                    }
                    
                    _set = true;
                    _mood_x = floor(38.5);
                    _mood_y = 0;
                    break;
                
                case UnknownEnum.Value_20:
                    _mood_y = 40;
                    break;
                
                case UnknownEnum.Value_23:
                    _mood_y = 20;
                    break;
            }
            
            if (!_set)
            {
                if (arg1 == UnknownEnum.Value_0)
                {
                    switch (_leg)
                    {
                        case UnknownEnum.Value_1:
                            _mon_spr.body_b = spr_h_ogre_body_start;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_ogre_body_start;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_ogre_body_start_v3;
                            break;
                    }
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _mon_spr.body_b = spr_h_ogre_body_start_cow;
                            break;
                    }
                }
                else
                {
                    switch (_leg)
                    {
                        case UnknownEnum.Value_1:
                            _mon_spr.body_b = spr_h_ogre_body_loop;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _mon_spr.body_b = spr_h_ogre_body_loop;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _mon_spr.body_b = spr_h_ogre_body_loop_v3;
                            break;
                    }
                    
                    switch (_class)
                    {
                        case UnknownEnum.Value_9:
                            _mon_spr.body_b = spr_h_ogre_body_loop_cow;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _mon_spr.body_b = spr_h_ogre_body_loop_lilith;
                            break;
                    }
                }
                
                _mon_spr.hand_b = -1;
                _mon_spr.head_b = -1;
                _spr_data.hand_xscale = 1;
                _mon_spr.pen = -1;
            }
            
            break;
    }
    
    _spr_data.skin_type = max(0, arg0.unit_data.skin);
    _mon_spr.head_l = scr_set_mon_bl_data(_mon_spr.head_b);
    _mon_spr.body_l = scr_set_mon_bl_data(_mon_spr.body_b);
    _mon_spr.hand_l = scr_set_mon_bl_data(_mon_spr.hand_b);
    
    if (_mon_spr.prop != -1)
    {
        switch (_mon_spr.prop)
        {
            case spr_crate:
                _mon_spr.prop_l = spr_crate_l;
                break;
            
            case spr_low_crate:
                _mon_spr.prop_l = spr_low_crate_l;
                break;
            
            case spr_fence:
                _mon_spr.prop_l = spr_fence_l;
                break;
            
            case spr_plank:
                _mon_spr.prop_l = spr_plank_l;
                break;
            
            case spr_bowl:
                _mon_spr.prop_l = spr_bowl;
                break;
            
            case spr_small_step_1:
                _mon_spr.prop_l = spr_small_step_l_1;
                break;
            
            case spr_small_step_2:
                _mon_spr.prop_l = spr_small_step_l_2;
                break;
            
            case spr_small_step_3:
                _mon_spr.prop_l = spr_small_step_l_3;
                break;
        }
    }
    
    if (_touch != -1)
        arg0.slot_data.spr_touch = _touch;
    
    if (_enter != -1)
        arg0.slot_data.spr_enter = _enter;
    
    mon_spr = _mon_spr;
    mon_data.spr_data = _spr_data;
    mon_data.spr_data.spr_type = arg1;
    mon_data.mood_slot_shift_x = _mood_x;
    mon_data.mood_slot_shift_y = _mood_y;
    scr_mon_draw = _mon_draw;
    mon_data.x_shift = _x_shift;
    mon_data.y_shift = _y_shift;
    x = mon_data.slot_id.x + mon_data.x_shift;
    y = mon_data.slot_id.y + mon_data.y_shift;
    mon_data.follow = true;
}

function scr_set_mon_bl_data(arg0)
{
    var _line = -1;
    
    switch (arg0)
    {
        case spr_h_goblin_body_start_v1_alpha:
            _line = spr_h_goblin_body_start_v1_line;
            break;
        
        case spr_h_goblin_body_start_v2_alpha:
            _line = spr_h_goblin_body_start_v2_line;
            break;
        
        case spr_h_goblin_body_start_cow_alpha:
            _line = spr_h_goblin_body_start_cow_line;
            break;
        
        case spr_h_goblin_hand_start_alpha:
            _line = spr_h_goblin_hand_start_line;
            break;
        
        case spr_h_goblin_head_loop_d1_alpha:
            _line = spr_h_goblin_head_loop_d1_line;
            break;
        
        case spr_h_goblin_head_loop_d2_alpha:
            _line = spr_h_goblin_head_loop_d2_line;
            break;
        
        case spr_h_goblin_body_loop_v1_alpha:
            _line = spr_h_goblin_body_loop_v1_line;
            break;
        
        case spr_h_goblin_body_loop_v2_alpha:
            _line = spr_h_goblin_body_loop_v2_line;
            break;
        
        case spr_h_goblin_body_loop_cow_alpha:
            _line = spr_h_goblin_body_loop_cow_line;
            break;
        
        case spr_h_goblin_hand_loop_v1_alpha:
            _line = spr_h_goblin_hand_loop_v1_line;
            break;
        
        case spr_h_goblin_hand_loop_v2_alpha:
            _line = spr_h_goblin_hand_loop_v2_line;
            break;
        
        case spr_h_goblin_hand_loop_cow_alpha:
            _line = spr_h_goblin_hand_loop_cow_line;
            break;
        
        case spr_h_goblin_body_ej_alpha:
            _line = spr_h_goblin_body_ej_line;
            break;
        
        case spr_h_goblin_body_ej_cow_alpha:
            _line = spr_h_goblin_body_ej_cow_line;
            break;
        
        case spr_h_goblin_body_start_alpha_anal:
            _line = spr_h_goblin_body_start_line_anal;
            break;
        
        case spr_h_goblin_body_start_alpha_anal_cow:
            _line = spr_h_goblin_body_start_line_anal_cow;
            break;
        
        case spr_h_goblin_body_start_alpha_anal_lilith:
            _line = spr_h_goblin_body_start_line_anal_lilith;
            break;
        
        case spr_h_goblin_hand_start_alpha_anal:
            _line = spr_h_goblin_hand_start_line_anal;
            break;
        
        case spr_h_goblin_body_loop_alpha_anal:
            _line = spr_h_goblin_body_loop_line_anal;
            break;
        
        case spr_h_goblin_body_loop_alpha_anal_cow:
            _line = spr_h_goblin_body_loop_line_anal_cow;
            break;
        
        case spr_h_goblin_body_loop_alpha_anal_lilith:
            _line = spr_h_goblin_body_loop_line_anal_lilith;
            break;
        
        case spr_h_goblin_head_loop_alpha_anal:
            _line = spr_h_goblin_head_loop_line_anal;
            break;
        
        case spr_h_goblin_hand_loop_alpha_anal:
            _line = spr_h_goblin_hand_loop_alpha_line;
            break;
        
        case spr_h_goblin_body_ej_alpha_anal:
            _line = spr_h_goblin_body_ej_line_anal;
            break;
        
        case spr_h_goblin_body_ej_alpha_anal_cow:
            _line = spr_h_goblin_body_ej_line_anal_cow;
            break;
        
        case spr_h_goblin_body_ej_alpha_anal_lilith:
            _line = spr_h_goblin_body_ej_line_anal_lilith;
            break;
        
        case spr_h_goblin_body_alpha_giant:
            _line = spr_h_goblin_body_line_giant;
            break;
        
        case spr_h_goblin_gb_1_loop_alpha:
            _line = spr_h_goblin_gb_1_loop_line;
            break;
        
        case spr_h_goblin_gb_1_v3_loop_alpha:
            _line = spr_h_goblin_gb_1_v3_loop_line;
            break;
        
        case spr_h_goblin_gb_1_cow_loop_alpha:
            _line = spr_h_goblin_gb_1_cow_loop_line;
            break;
        
        case spr_h_goblin_gb_1_lilith_loop_alpha:
            _line = spr_h_goblin_gb_1_lilith_loop_line;
            break;
        
        case spr_h_goblin_gb_2_loop_alpha:
            _line = spr_h_goblin_gb_2_loop_line;
            break;
        
        case spr_h_goblin_gb_2_v3_loop_alpha:
            _line = spr_h_goblin_gb_2_v3_loop_line;
            break;
        
        case spr_h_goblin_gb_2_cow_loop_alpha:
            _line = spr_h_goblin_gb_2_cow_loop_line;
            break;
        
        case spr_h_goblin_gb_3_loop_body_alpha:
            _line = spr_h_goblin_gb_3_loop_body_line;
            break;
        
        case spr_h_goblin_gb_3_loop_hand_alpha:
            _line = spr_h_goblin_gb_3_loop_hand_line;
            break;
        
        case spr_h_goblin_gb_3_cow_loop_hand_alpha:
            _line = spr_h_goblin_gb_3_cow_loop_hand_line;
            break;
        
        case spr_h_goblin_gb_3_lilith_loop_hand_alpha:
            _line = spr_h_goblin_gb_3_lilith_loop_hand_line;
            break;
        
        case spr_h_goblin_milk_loop_alpha:
            _line = spr_h_goblin_milk_loop_line;
            break;
        
        case spr_h_goblin_drink_loop_alpha:
            _line = spr_h_goblin_drink_loop_line;
            break;
        
        case spr_h_goblin_dairy_loop_alpha:
            _line = spr_h_goblin_dairy_loop_line;
            break;
        
        case spr_h_goblin_body_start_alpha_giant:
            _line = spr_h_goblin_body_start_line_giant;
            break;
        
        case spr_h_goblin_shrine_start_body_alpha:
            _line = spr_h_goblin_shrine_start_body_line;
            break;
        
        case spr_h_goblin_shrine_start_hand_alpha:
            _line = spr_h_goblin_shrine_start_hand_line;
            break;
        
        case spr_h_goblin_shrine_alpha:
            _line = spr_h_goblin_shrine_line;
            break;
        
        case spr_h_hobgoblin_body_start_v1_alpha:
            _line = spr_h_hobgoblin_body_start_v1_line;
            break;
        
        case spr_h_hobgoblin_body_start_v2_alpha:
            _line = spr_h_hobgoblin_body_start_v2_line;
            break;
        
        case spr_h_hobgoblin_body_start_v3_alpha:
            _line = spr_h_hobgoblin_body_start_v3_line;
            break;
        
        case spr_h_hobgoblin_body_start_cow_alpha:
            _line = spr_h_hobgoblin_body_start_cow_line;
            break;
        
        case spr_h_hobgoblin_hand_start_d1_alpha:
            _line = spr_h_hobgoblin_hand_start_d1_line;
            break;
        
        case spr_h_hobgoblin_hand_start_d2_alpha:
            _line = spr_h_hobgoblin_hand_start_d2_line;
            break;
        
        case spr_h_hobgoblin_hand_start_cow_alpha:
            _line = spr_h_hobgoblin_hand_start_cow_line;
            break;
        
        case spr_h_hobgoblin_head_loop_alpha:
            _line = spr_h_hobgoblin_head_loop_line;
            break;
        
        case spr_h_hobgoblin_body_loop_v1_alpha:
            _line = spr_h_hobgoblin_body_loop_v1_line;
            break;
        
        case spr_h_hobgoblin_body_loop_v2_alpha:
            _line = spr_h_hobgoblin_body_loop_v2_line;
            break;
        
        case spr_h_hobgoblin_body_loop_v3_alpha:
            _line = spr_h_hobgoblin_body_loop_v3_line;
            break;
        
        case spr_h_hobgoblin_body_loop_cow_alpha:
            _line = spr_h_hobgoblin_body_loop_cow_line;
            break;
        
        case spr_h_hobgoblin_hand_loop_v1_alpha:
            _line = spr_h_hobgoblin_hand_loop_v1_line;
            break;
        
        case spr_h_hobgoblin_hand_loop_v1_d1_alpha:
            _line = spr_h_hobgoblin_hand_loop_v1_d1_line;
            break;
        
        case spr_h_hobgoblin_hand_loop_v2_alpha:
            _line = spr_h_hobgoblin_hand_loop_v2_line;
            break;
        
        case spr_h_hobgoblin_body_ej_alpha:
            _line = spr_h_hobgoblin_body_ej_line;
            break;
        
        case spr_h_hobgoblin_hand_ej_alpha:
            _line = spr_h_hobgoblin_hand_ej_line;
            break;
        
        case spr_h_hobgoblin_body_start_alpha_anal:
            _line = spr_h_hobgoblin_body_start_line_anal;
            break;
        
        case spr_h_hobgoblin_hand_start_alpha_anal:
            _line = spr_h_hobgoblin_hand_start_line_anal;
            break;
        
        case spr_h_hobgoblin_body_loop_alpha_anal:
            _line = spr_h_hobgoblin_body_loop_line_anal;
            break;
        
        case spr_h_hobgoblin_head_loop_alpha_anal:
            _line = spr_h_hobgoblin_head_loop_line_anal;
            break;
        
        case spr_h_hobgoblin_hand_loop_alpha_anal:
            _line = spr_h_hobgoblin_hand_loop_line_anal;
            break;
        
        case spr_h_hobgoblin_body_alpha_giant:
            _line = spr_h_hobgoblin_body_line_giant;
            break;
        
        case spr_h_hobgoblin_dairy_loop_alpha:
            _line = spr_h_hobgoblin_dairy_loop_line;
            break;
        
        case spr_h_hobgoblin_body_start_alpha_giant:
            _line = spr_h_hobgoblin_body_start_line_giant;
            break;
        
        case spr_hobgoblin_shrine_start_body_alpha:
            _line = spr_hobgoblin_shrine_start_body_line;
            break;
        
        case spr_hobgoblin_shrine_start_hand_alpha:
            _line = spr_hobgoblin_shrine_start_hand_line;
            break;
        
        case spr_h_hobgoblin_shrine_alpha:
            _line = spr_h_hobgoblin_shrine_line;
            break;
        
        case spr_h_hobgoblin_gb_1_loop_alpha:
            _line = spr_h_hobgoblin_gb_1_loop_line;
            break;
        
        case spr_h_hobgoblin_gb_1_v3_loop_alpha:
            _line = spr_h_hobgoblin_gb_1_v3_loop_line;
            break;
        
        case spr_h_hobgoblin_gb_1_lilith_loop_alpha:
            _line = spr_h_hobgoblin_gb_1_lilith_loop_line;
            break;
        
        case spr_h_hobgoblin_gb_3_loop_body_alpha:
            _line = spr_h_hobgoblin_gb_3_loop_body_line;
            break;
        
        case spr_h_hobgoblin_gb_3_loop_hand_alpha:
            _line = spr_h_hobgoblin_gb_3_loop_hand_line;
            break;
        
        case spr_h_hobgoblin_gb_3_cow_loop_hand_alpha:
            _line = spr_h_hobgoblin_gb_3_cow_loop_hand_line;
            break;
        
        case spr_h_hobgoblin_gb_3_lilith_loop_hand_alpha:
            _line = spr_h_hobgoblin_gb_3_lilith_loop_hand_line;
            break;
        
        case spr_h_ogre_shrine_start_alpha:
            _line = spr_h_ogre_shrine_start_line;
            break;
        
        case spr_h_ogre_shrine_loop_alpha:
            _line = spr_h_ogre_shrine_loop_line;
            break;
        
        case spr_h_ogre_giant_start_alpha:
            _line = spr_h_ogre_giant_start_line;
            break;
        
        case spr_h_ogre_giant_loop_alpha:
            _line = spr_h_ogre_giant_loop_line;
            break;
    }
    
    return _line;
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
    Value_18 = 18,
    Value_19,
    Value_20,
    Value_23 = 23,
    Value_36 = 36,
    Value_37,
    Value_38,
    Value_39,
    Value_41 = 41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46
}
