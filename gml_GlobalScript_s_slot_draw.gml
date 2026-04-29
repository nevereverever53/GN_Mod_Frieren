function scr_draw_slot()
{
    switch (slot_data.slot_type)
    {
        case UnknownEnum.Value_0:
            scr_draw_slot_h();
            break;
        
        case UnknownEnum.Value_1:
            scr_draw_slot_h();
            break;
        
        case UnknownEnum.Value_2:
            scr_draw_slot_h();
            break;
        
        case UnknownEnum.Value_5:
            scr_draw_slot_between();
            break;
        
        case UnknownEnum.Value_3:
            scr_draw_slot_entrance();
            break;
        
        case UnknownEnum.Value_4:
            scr_draw_slot_between();
            break;
    }
}

function scr_draw_slot_h()
{
    if (spr_base != -1)
        draw_sprite(spr_base, slot_data.index, x, y);
    
    if (slot_data.anim_struct != -1)
    {
        script_execute(scr_slot_draw_special);
        scr_slot_anim_base();
    }
    
    if (global.mask_collision)
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
}

function scr_draw_slot_between()
{
    draw_sprite(spr_base, slot_data.index, x - 1, y);
    
    if (global.mask_collision)
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
}

function scr_draw_slot_entrance()
{
    var _side = (!slot_data.mod_index[0] * 2) - 1;
    var _x = x + (slot_data.mod_index[0] * 45);
    draw_sprite_ext(spr_base, slot_data.index, _x, y, _side, 1, image_angle, image_blend, 1);
    
    if (global.mask_collision)
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
}

function scr_draw_highlight(arg0)
{
    draw_set_alpha(1);
    gpu_set_fog(true, c_black, 0, 0);
    
    if (!surface_exists(highlight_surface))
        highlight_surface = surface_create(room_width, room_height);
    
    surface_set_target(highlight_surface);
    draw_clear_alpha(c_white, 0);
    script_execute(arg0, false);
    surface_reset_target();
    draw_surface_ext(highlight_surface, 0, 0, 1, 1, 0, image_blend, 0.15);
    surface_free(highlight_surface);
    gpu_set_fog(false, c_white, 0, 0);
    draw_set_alpha(1);
}

function scr_draw_slot_parts()
{
    var _final_index, _hair_index, _touch, _enter;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite(_touch, _final_index, x, y);
                        
                        if (_enter != -1)
                            draw_sprite(_enter, _final_index, x, y);
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_12:
                    if (slot_data.slot_dirt > 0)
                    {
                        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
                        draw_sprite(_spr, _slot_dirt, x, y);
                    }
                    
                    break;
            }
        }
    }
    
    if (slot_data.sp_x != -1 && slot_data.anim_struct.sp_state != -1)
        draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
}

function scr_draw_slot_parts_wall()
{
    draw_sprite(spr_slot_wall, slot_data.index, x, y);
    var _final_index, _hair_index, _touch, _enter;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite(_touch, _final_index, x, y);
                        
                        if (_enter != -1)
                            draw_sprite(_enter, _final_index, x, y);
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_12:
                    if (slot_data.slot_dirt > 0)
                    {
                        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
                        draw_sprite(_spr, _slot_dirt, x, y);
                    }
                    
                    break;
            }
        }
    }
    
    if (slot_data.sp_x != -1 && slot_data.anim_struct.sp_state != -1)
        draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
}

function scr_draw_slot_cow()
{
    var _flip = slot_data.mod_index[7];
    var _scale = ((_flip * 2) - 1) * -1;
    var _final_index = slot_data.anim_struct.index;
    
    if (slot_data.slot_dirt > 0)
    {
        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
        draw_sprite(spr_slot[0][UnknownEnum.Value_1], _slot_dirt, x, y);
    }
    
    var _milk_index = slot_data.anim_struct.milk_index;
    
    if (_milk_index == -1)
        draw_sprite_ext(spr_h_goblin_dairy_pump, 0, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
    else
        draw_sprite_ext(spr_h_goblin_dairy_pump, max(1, _milk_index + 1), x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _type = spr_slot[i][UnknownEnum.Value_0];
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        var _index = slot_data.mod_index[i];
        
        switch (_type)
        {
            case UnknownEnum.Value_1:
                if (_index != 2)
                {
                    var _mod_sign = _index;
                    var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                    draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                }
                
                break;
            
            case UnknownEnum.Value_5:
                if (_index != -1)
                    draw_sprite_ext(_spr, _index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                
                break;
        }
        
        if (unit_data != -1)
        {
            var _touch = slot_data.spr_touch;
            var _blink_index = slot_data.anim_struct.blink_index;
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            
            switch (_type)
            {
                case UnknownEnum.Value_7:
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite_ext(_c_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                        draw_sprite_ext(_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite_ext(_c_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_milk_index != -1)
                    {
                        var _a = max(1, _milk_index + (unit_data.milk * 5) + 1 + unit_data.milk);
                        draw_sprite_ext(_spr, _a, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    }
                    else
                    {
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite_ext(_c_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                        draw_sprite_ext(_touch, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    break;
            }
            
            if (_blink_index != -1)
                draw_sprite_ext(blink_spr, 0, x + (image_xscale * _flip), (y + 1) - sign(slot_data.anim_struct.index), _scale, 1, image_angle, image_blend, image_alpha);
        }
    }
}

function scr_draw_slot_giant()
{
    draw_sprite(spr_slot_giant_pillar, 0, x, y);
    
    if (slot_data.slot_dirt > 0)
    {
        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
        draw_sprite(spr_slot[0][UnknownEnum.Value_1], _slot_dirt, x, y);
    }
    
    draw_sprite(spr_slot[2][UnknownEnum.Value_1], slot_data.mod_index[2], x, y);
    
    if (unit_data != -1)
    {
        var _final_index = slot_data.anim_struct.index;
        var _touch = slot_data.spr_touch;
        var _enter = slot_data.spr_enter;
        
        switch (slot_data.mod_index[3])
        {
            case -1:
                draw_sprite(spr_slot[5][UnknownEnum.Value_1], _final_index, x, y);
                draw_sprite_ext(spr_slot[5][UnknownEnum.Value_1], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                if (slot_data.mod_index[5] == 0)
                {
                    draw_sprite(spr_slot[5][UnknownEnum.Value_3], _final_index, x, y);
                    draw_sprite_ext(spr_slot[5][UnknownEnum.Value_3], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                }
                
                break;
            
            case 0:
                draw_sprite(spr_slot[5][UnknownEnum.Value_1], _final_index, x, y);
                
                if (slot_data.mod_index[5] == 0)
                    draw_sprite(spr_slot[5][UnknownEnum.Value_3], _final_index, x, y);
                
                break;
            
            case 1:
                draw_sprite_ext(spr_slot[5][UnknownEnum.Value_1], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                if (slot_data.mod_index[5] == 0)
                    draw_sprite_ext(spr_slot[5][UnknownEnum.Value_3], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                break;
            
            case 2:
                break;
        }
        
        draw_sprite(spr_slot[6][UnknownEnum.Value_1], _final_index, x, y);
        draw_sprite(spr_slot[7][UnknownEnum.Value_1], _final_index, x, y);
        
        if (_enter != -1)
            draw_sprite(_enter, _final_index, x, y);
        
        if (slot_data.mod_index[7] == 0)
            draw_sprite(spr_slot[7][UnknownEnum.Value_3], _final_index, x, y);
        
        if (slot_data.mon_placement[0] != -1 && slot_data.mon_placement[0].mon_data.mon_state == UnknownEnum.Value_1 && slot_data.mon_placement[0].mon_spr.body_b != -1)
        {
            var _mon_spr_head_b = -1;
            var _mon_type = slot_data.mon_placement[0].mon_data.mon_type;
            
            if (slot_data.h_step <= 1)
            {
                switch (_mon_type)
                {
                    case UnknownEnum.Value_0:
                        _mon_spr_head_b = spr_h_goblin_body_start_alpha_giant;
                        var _mon_spr_head_l = spr_h_goblin_body_start_line_giant;
                        break;
                    
                    case UnknownEnum.Value_1:
                        _mon_spr_head_b = spr_h_hobgoblin_body_start_alpha_giant;
                        var _mon_spr_head_l = spr_h_hobgoblin_body_start_line_giant;
                        break;
                }
            }
            else
            {
                var _mon_spr_head_l;
                
                switch (_mon_type)
                {
                    case UnknownEnum.Value_0:
                        _mon_spr_head_b = spr_h_goblin_head_alpha_giant;
                        _mon_spr_head_l = spr_h_goblin_head_line_giant;
                        break;
                    
                    case UnknownEnum.Value_1:
                        _mon_spr_head_b = spr_h_hobgoblin_head_alpha_giant;
                        _mon_spr_head_l = spr_h_hobgoblin_head_line_giant;
                        break;
                }
                
                var _mon_alpha_c = global.mon_alpha_c[_mon_type];
                
                if (_mon_spr_head_b != -1)
                {
                    switch (global.val.alpha_type)
                    {
                        case UnknownEnum.Value_0:
                            draw_sprite_ext(_mon_spr_head_b, _final_index, x, y, 1, 1, 0, c_white, global.val.mon_alpha);
                            draw_sprite_ext(_mon_spr_head_l, _final_index, x, y, 1, 1, 0, c_white, global.val.mon_alpha);
                            break;
                        
                        case UnknownEnum.Value_2:
                            gpu_set_fog(true, _mon_alpha_c, 0, 0);
                            draw_sprite_ext(_mon_spr_head_b, _final_index, x, y, 1, 1, 0, c_white, global.val.mon_alpha);
                            draw_sprite_ext(_mon_spr_head_l, _final_index, x, y, 1, 1, 0, c_white, global.val.mon_alpha);
                            gpu_set_fog(false, c_white, 0, 0);
                            break;
                        
                        case UnknownEnum.Value_1:
                            gpu_set_fog(true, _mon_alpha_c, 0, 0);
                            draw_sprite_ext(_mon_spr_head_b, _final_index, x, y, 1, 1, 0, c_white, global.val.mon_alpha);
                            gpu_set_fog(false, c_white, 0, 0);
                            draw_sprite_ext(_mon_spr_head_l, _final_index, x, y, 1, 1, 0, c_white, 1);
                            break;
                    }
                }
            }
        }
        
        switch (slot_data.mod_index[4])
        {
            case -1:
                draw_sprite(spr_slot[8][UnknownEnum.Value_1], _final_index, x, y);
                draw_sprite_ext(spr_slot[8][UnknownEnum.Value_1], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                if (slot_data.mod_index[8] == 0)
                {
                    draw_sprite(spr_slot[8][UnknownEnum.Value_3], _final_index, x, y);
                    draw_sprite_ext(spr_slot[8][UnknownEnum.Value_3], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                }
                
                break;
            
            case 0:
                draw_sprite(spr_slot[8][UnknownEnum.Value_1], _final_index, x, y);
                draw_sprite_ext(spr_slot[9][UnknownEnum.Value_1], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                if (slot_data.mod_index[8] == 0)
                {
                    draw_sprite(spr_slot[8][UnknownEnum.Value_3], _final_index, x, y);
                    draw_sprite_ext(spr_slot[9][UnknownEnum.Value_3], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                }
                
                break;
            
            case 1:
                draw_sprite(spr_slot[9][UnknownEnum.Value_1], _final_index, x, y);
                draw_sprite_ext(spr_slot[8][UnknownEnum.Value_1], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                if (slot_data.mod_index[8] == 0)
                {
                    draw_sprite(spr_slot[9][UnknownEnum.Value_3], _final_index, x, y);
                    draw_sprite_ext(spr_slot[8][UnknownEnum.Value_3], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                }
                
                break;
            
            case 2:
                draw_sprite(spr_slot[9][UnknownEnum.Value_1], _final_index, x, y);
                draw_sprite_ext(spr_slot[9][UnknownEnum.Value_1], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                
                if (slot_data.mod_index[8] == 0)
                {
                    draw_sprite(spr_slot[9][UnknownEnum.Value_3], _final_index, x, y);
                    draw_sprite_ext(spr_slot[9][UnknownEnum.Value_3], _final_index, x + 77, y, -1, 1, image_angle, image_blend, 1);
                }
                
                break;
        }
        
        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
            draw_sprite(_touch, _final_index, x, y);
        
        draw_sprite(spr_slot[10][UnknownEnum.Value_1], _final_index, x, y);
    }
    
    if (slot_data.mod_index[11] != 2)
    {
        var _mod_sign = slot_data.mod_index[11];
        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
        draw_sprite_ext(spr_slot[11][UnknownEnum.Value_1], 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
    }
    
    if (slot_data.anim_struct.sp_state != -1)
        draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
    
    if (slot_data.h_step >= 6)
        draw_sprite(spr_slot_giant_birth, 0, floor(x + (image_xscale * 0.5)), y);
    else if (!slot_data.mod_index[1])
        draw_sprite(spr_slot_giant_birth, 0, floor(x + (image_xscale * 0.5)), y);
    else if (unit_data != -1 && !slot_data.mod_index[7])
        draw_sprite(spr_giant_idle_cloth, slot_data.mod_index[4] + 1, floor(x), y);
}

function scr_draw_slot_drink()
{
    var _final_index, _hair_index, _row_index, _touch;
    
    if (unit_data != -1)
    {
        var _skin = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        _row_index = ((_h_type * _skin) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = slot_data.anim_struct.index + _row_index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        _touch = slot_data.spr_touch;
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    var _spr_loop = spr_h_goblin_drink_base;
                    
                    switch (unit_data.class)
                    {
                        case UnknownEnum.Value_9:
                            _spr_loop = spr_h_goblin_drink_cow;
                            break;
                        
                        case UnknownEnum.Value_10:
                            _spr_loop = spr_h_goblin_drink_nyx;
                            break;
                        
                        case UnknownEnum.Value_8:
                            _spr_loop = spr_h_goblin_drink_lilith;
                            break;
                        
                        case UnknownEnum.Value_13:
                            _spr_loop = spr_h_goblin_drink_cat;
                            break;
                        
                        case UnknownEnum.Value_12:
                            _spr_loop = spr_h_goblin_drink_morrigan;
                            break;
                        
                        case UnknownEnum.Value_14:
                            _spr_loop = spr_h_goblin_drink_frieren;
                            break;
                    }
                    
                    if (slot_data.anim_struct.frame_c == 2)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    else
                    {
                        var _w = 0;
                        var _x_scale = 1;
                        var _lb_spr, _lb_index, _c_lb_index;
                        
                        if (slot_data.mon_timer[0] != 0)
                        {
                            _lb_spr = _spr_loop;
                            _lb_index = slot_data.mon_index[0] + (max(0, unit_data.skin) * 2);
                            _c_lb_index = slot_data.mon_index[0] + _row_index + 2;
                        }
                        else
                        {
                            _lb_spr = _spr;
                            _lb_index = _final_index;
                            _c_lb_index = _final_index;
                        }
                        
                        var _rb_spr, _rb_index, _c_rb_index;
                        
                        if (slot_data.mon_timer[1] != 0)
                        {
                            _rb_spr = _spr_loop;
                            _rb_index = slot_data.mon_index[1] + (max(0, unit_data.skin) * 2);
                            _c_rb_index = slot_data.mon_index[1] + _row_index + 2;
                            _w = 45;
                            _x_scale = -1;
                        }
                        else
                        {
                            _rb_spr = _spr;
                            _rb_index = _final_index + 2;
                            _c_rb_index = _final_index;
                        }
                        
                        var _c_w = 45;
                        var _c_scale = -1;
                        draw_sprite(_lb_spr, _lb_index, x, y);
                        draw_sprite_ext(_rb_spr, _rb_index, x + _w, y, _x_scale, 1, image_angle, image_blend, image_alpha);
                        draw_sprite(_c_spr, _c_lb_index, x, y);
                        draw_sprite_ext(_c_spr, _c_rb_index, x + _c_w, y, _c_scale, 1, image_angle, image_blend, image_alpha);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                        {
                            if (_lb_spr != _spr)
                                draw_sprite(_touch, _lb_index, x, y);
                            
                            if (_rb_spr != _spr)
                                draw_sprite_ext(_touch, _rb_index, x + 45, y, -1, 1, image_angle, image_blend, image_alpha);
                        }
                    }
                    
                    break;
            }
        }
    }
}

function scr_draw_slot_carry()
{
    var _num = array_length(spr_slot);
    var _final_index, _hair_index;
    
    if (slot_data.visual && unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
    }
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (slot_data.visual && unit_data != -1)
                    {
                        if (_index != -1 && !_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (slot_data.visual && unit_data != -1 && _index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (slot_data.visual && unit_data != -1 && _index != -1)
                    {
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
            }
        }
    }
    
    draw_sprite(spr_slot_carry_front, 0, x, y);
}

function scr_draw_slot_patrol()
{
    var _num = array_length(spr_slot);
    var _final_index, _hair_index;
    
    if (slot_data.visual && unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
    }
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (slot_data.visual && unit_data != -1)
                    {
                        if (_index != -1 && !_replace)
                            draw_sprite(_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (slot_data.visual && unit_data != -1 && _index == 0 && _c_spr != -1)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (slot_data.visual && unit_data != -1 && _index != -1)
                    {
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    if (slot_data.visual && unit_data != -1)
                    {
                        var _handc_pos = 0;
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
            }
        }
    }
    
    draw_sprite(spr_slot_carry_front, 0, x, y);
}

function scr_draw_slot_tent()
{
    var _final_index, _hair_index;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
    }
    
    if (spr_base != -1)
        draw_sprite(spr_base, 0, x, y);
    
    if (slot_front != -1)
        draw_sprite(slot_front, 0, x, y);
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
            }
        }
    }
    
    if (slot_data.anim_struct.sp_state != -1)
        draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
}

function scr_draw_slot_milk()
{
    scr_draw_slot_parts();
    
    if (slot_data.mon_placement[0] != -1)
    {
        var _index = h_unit_list[0].mon_data.index;
        draw_sprite(spr_h_goblin_milk_loop_alpha, _index, x, y);
        draw_sprite(spr_h_goblin_milk_loop_line, _index, x, y);
        draw_sprite(spr_bowl, 0, x + 22, y);
    }
}

function scr_draw_slot_gb_1()
{
    var _flip = slot_data.mod_index[6];
    var _scale = ((_flip * 2) - 1) * -1;
    var _x_shift = 0;
    
    if (slot_data.slot_dirt > 0)
    {
        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
        draw_sprite(spr_dirt_big, _slot_dirt, x, y);
    }
    
    var _final_index, _hair_index, _breast_spr, _touch;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _base_frame_c = slot_data.anim_struct.frame_c;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * _base_frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = -1;
        var _enter = slot_data.spr_enter;
        _breast_spr = spr_slot[2][UnknownEnum.Value_1];
        
        if (unit_data.leg == UnknownEnum.Value_0)
            _x_shift = -2 * ((_flip * 2) - 1);
        
        if (slot_data.mon_placement[0] != -1 && slot_data.mon_placement[0].mon_data.mon_type == UnknownEnum.Value_0)
            _touch = slot_data.spr_touch;
        
        if (slot_data.mon_placement[1] != -1)
        {
            var _mon_index = _base_frame_c + slot_data.anim_struct.index;
            _breast_spr = spr_h_gb_1_big_loop_breast_d2;
            var _mon_body_b = spr_h_goblin_gb_1_loop_alpha;
            var _mon_body_l = spr_h_goblin_gb_1_loop_line;
            
            if (unit_data.leg == UnknownEnum.Value_0)
            {
                _breast_spr = spr_h_gb_1_big_loop_breast_v3_d2;
                _mon_body_b = spr_h_goblin_gb_1_v3_loop_alpha;
                _mon_body_l = spr_h_goblin_gb_1_v3_loop_line;
            }
            
            switch (unit_data.class)
            {
                case UnknownEnum.Value_9:
                    _breast_spr = spr_h_gb_1_big_loop_breast_cow;
                    _mon_body_b = spr_h_goblin_gb_1_cow_loop_alpha;
                    _mon_body_l = spr_h_goblin_gb_1_cow_loop_line;
                    break;
                
                case UnknownEnum.Value_13:
                    _breast_spr = spr_h_gb_1_big_loop_breast_cat;
                    _mon_body_b = spr_h_goblin_gb_1_v3_loop_alpha;
                    _mon_body_l = spr_h_goblin_gb_1_v3_loop_line;
                    break;
                
                case UnknownEnum.Value_12:
                    _breast_spr = spr_h_gb_1_big_loop_breast_morrigan;
                    break;
                
                case UnknownEnum.Value_10:
                    _breast_spr = spr_h_gb_1_big_loop_breast_nyx;
                    break;
                
                case UnknownEnum.Value_8:
                    _breast_spr = spr_h_gb_1_big_loop_breast_lilith;
                    _mon_body_b = spr_h_goblin_gb_1_lilith_loop_alpha;
                    _mon_body_l = spr_h_goblin_gb_1_lilith_loop_line;
                    break;
                
                case UnknownEnum.Value_14:
                    _breast_spr = spr_h_gb_1_big_loop_breast_frieren;
                    _mon_body_b = spr_h_goblin_gb_1_v3_loop_alpha;
                    _mon_body_l = spr_h_goblin_gb_1_v3_loop_line;
                    break;
            }
            
            draw_sprite_ext(_mon_body_b, _mon_index, x + (image_xscale * _flip), y, _scale, 1, 0, c_white, 1);
            draw_sprite_ext(_mon_body_l, _mon_index, x + (image_xscale * _flip), y, _scale, 1, 0, c_white, 1);
        }
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            switch (_type)
            {
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite_ext(_spr, _index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite_ext(_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                        
                        draw_sprite_ext(_c_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite_ext(_hair_spr, _hair_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite_ext(_breast_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite_ext(_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite_ext(_touch, _final_index, x + (image_xscale * _flip) + _x_shift, y, _scale, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite_ext(_c_spr, _final_index, x + (image_xscale * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                    
                    break;
                
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
            }
        }
    }
}

function scr_draw_slot_gb_2()
{
    var _final_index, _hair_index, _touch, _enter, _test;
    
    if (unit_data != -1)
    {
        _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite(_touch, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                        
                        if (_enter != -1)
                        {
                            for (var u = 0; u < array_length(slot_data.mon_placement); u++)
                            {
                                if (slot_data.mon_placement[u] != -1)
                                    draw_sprite(_enter, (((u * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index, x, y);
                            }
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_12:
                    if (slot_data.slot_dirt > 0)
                    {
                        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
                        draw_sprite(_spr, _slot_dirt, x, y);
                    }
                    
                    break;
            }
        }
    }
    
    if (unit_data != -1 && slot_data.anim_struct.sp_state != -1)
    {
        for (var i = 0; i < array_length(slot_data.sp_place); i++)
        {
            var _pos = slot_data.sp_place[i];
            
            switch (slot_data.anim_struct.char_state)
            {
                case UnknownEnum.Value_0:
                    draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[_pos] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
                    break;
                
                case UnknownEnum.Value_1:
                    var _sp_index = 0;
                    
                    if (floor(slot_data.anim_struct.index) == 2)
                        _sp_index = 1;
                    else
                        _sp_index = 0;
                    
                    draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[_pos] + (_sp_index * slot_data.sp_anim_y));
                    break;
            }
        }
    }
}

function scr_draw_slot_l_shrine()
{
    var _final_index, _touch, _enter;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        var _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    if (_index != -1)
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        var _handc_pos = 0;
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (slot_data.mon_placement[0] != -1 && slot_data.h_step > 1)
                        {
                            if (slot_data.mon_placement[0].mon_data.mon_type == UnknownEnum.Value_0)
                                draw_sprite(spr_h_lilith_shrine_loop_breast_gob, _final_index, x, y);
                            else
                                draw_sprite(spr_h_lilith_shrine_loop_breast_norm, _final_index, x, y);
                        }
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                    {
                        draw_sprite(_c_spr, _final_index, x, y);
                        
                        if (slot_data.mon_placement[0] != -1 && slot_data.h_step > 1)
                        {
                            if (slot_data.mon_placement[0].mon_data.mon_type == UnknownEnum.Value_0)
                                draw_sprite(spr_h_lilith_shrine_loop_breast_c_gob, _final_index, x, y);
                            else
                                draw_sprite(spr_h_lilith_shrine_loop_breast_norm_c, _final_index, x, y);
                        }
                    }
                    
                    if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                        draw_sprite(_touch, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_enter != -1)
                            draw_sprite(_enter, _final_index, x, y);
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_11:
                    draw_sprite(_spr, _final_index, x, y);
                    break;
                
                case UnknownEnum.Value_12:
                    if (slot_data.slot_dirt > 0)
                    {
                        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
                        draw_sprite(_spr, _slot_dirt, x, y);
                    }
                    
                    break;
            }
        }
    }
    
    if (slot_data.anim_struct.sp_state != -1)
    {
        if (slot_data.mon_placement[0] != -1 && slot_data.h_step == 0)
            draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y * -1));
        else
            draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
    }
    
    draw_sprite(spr_slot_l_candle, candle_index, x + 14, y);
}

function scr_draw_ogre_behind()
{
    if (slot_data.slot_dirt > 0)
    {
        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
        draw_sprite(spr_slot[0][UnknownEnum.Value_1], _slot_dirt, x, y);
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _type = spr_slot[i][UnknownEnum.Value_0];
        var _index = slot_data.mod_index[i];
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        var _flip, _scale;
        
        switch (_type)
        {
            case UnknownEnum.Value_4:
                _flip = slot_data.mod_index[i];
                _scale = ((_flip * 2) - 1) * -1;
                break;
            
            case UnknownEnum.Value_0:
                if (_index != -1)
                    draw_sprite_ext(_spr, _index, x + (77 * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                
                break;
        }
    }
    
    var _final_index;
    
    if (slot_data.mon_placement[0] != -1)
    {
        var _unit = -1;
        
        for (var i = 0; i < array_length(h_unit_list); i++)
        {
            if (h_unit_list[i].mon_data.mon_type == UnknownEnum.Value_3)
                _unit = h_unit_list[i];
        }
        
        if (_unit != -1)
        {
            var _spr = _unit.mon_spr.body_b;
            var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
            var _row_index = _h_type * slot_data.anim_struct.frame_c;
            _final_index = _row_index + slot_data.anim_struct.index;
            
            if (_spr != -1)
                draw_sprite_ext(_spr, _final_index, x, y, 1, 1, 0, c_white, 1);
        }
        
        if (slot_data.sp_x != -1 && slot_data.anim_struct.sp_state != -1)
            draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
    }
    
    var _hair_index, _touch, _enter;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
    }
    
    _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite(_touch, _final_index, x, y);
                        
                        if (_enter != -1)
                            draw_sprite(_enter, _final_index, x, y);
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
            }
        }
    }
    
    if (slot_data.sp_x != -1 && slot_data.anim_struct.sp_state != -1)
        draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
}

function scr_draw_ogre_front()
{
    if (slot_data.slot_dirt > 0)
    {
        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
        draw_sprite(spr_slot[0][UnknownEnum.Value_1], _slot_dirt, x, y);
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _type = spr_slot[i][UnknownEnum.Value_0];
        var _index = slot_data.mod_index[i];
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        var _flip, _scale;
        
        switch (_type)
        {
            case UnknownEnum.Value_4:
                _flip = slot_data.mod_index[i];
                _scale = ((_flip * 2) - 1) * -1;
                break;
            
            case UnknownEnum.Value_0:
                if (_index != -1)
                    draw_sprite_ext(_spr, _index, x + (77 * _flip), y, _scale, 1, image_angle, image_blend, image_alpha);
                
                break;
        }
    }
    
    var _final_index, _hair_index, _touch, _enter;
    
    if (unit_data != -1)
    {
        var _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
    }
    
    _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            var _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_1:
                    if (_index != 2)
                    {
                        var _mod_sign = _index;
                        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
                        draw_sprite_ext(_spr, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
                    }
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite(_touch, _final_index, x, y);
                        
                        if (_enter != -1)
                            draw_sprite(_enter, _final_index, x, y);
                    }
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
            }
        }
    }
    
    if (slot_data.sp_x != -1 && slot_data.anim_struct.sp_state != -1)
        draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[max(0, slot_data.anal)] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_y));
}

function scr_slot_anim_base()
{
    if (slot_data.load)
    {
        slot_data.load_index += 0.1 * global.w_spd;
        
        if (slot_data.load_index >= 4)
            slot_data.load_index = 0;
    }
    
    if (bar_glow_rep != -1)
    {
        bar_glow_rep += abs(0.01 * global.w_spd);
        
        if (bar_glow_rep >= 2)
            bar_glow_rep = 0;
    }
}

function scr_draw_slot_gb_3()
{
    if (array_length(h_unit_list) > 0)
    {
        var _spr = h_unit_list[0].mon_spr.body_b;
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = _h_type * slot_data.anim_struct.frame_c;
        var _final_index = _row_index + slot_data.anim_struct.index;
        
        if (_spr != -1)
            draw_sprite_ext(_spr, _final_index, x, y, 1, 1, 0, c_white, 1);
    }
    
    scr_draw_slot_parts();
}

function scr_draw_slot_clone()
{
    if (spr_base != -1)
        draw_sprite(spr_base, slot_data.index, x, y);
    
    if (slot_data.anim_struct != -1)
    {
        draw_sprite(spr_slot_clone, 0, x, y);
        
        if (slot_data.clone_wait > 0)
            draw_sprite(spr_slot_clone_loop, ((slot_data.clone_wait / 5) % 4) * -1, x + 40, y - 39);
        
        scr_slot_anim_base();
        var _index = slot_data.mod_index[1];
        
        if (_index != 2)
        {
            var _mod_sign = _index;
            var _scale_sign = ((_mod_sign * 2) - 1) * -1;
            draw_sprite_ext(spr_slot_clone_sign, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
        }
    }
    
    if (global.mask_collision)
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
}

function scr_draw_slot_chain()
{
    var _final_index, _hair_index, _touch, _enter, _test;
    
    if (unit_data != -1)
    {
        _test = max(1, UnknownEnum.Value_3 * sign(unit_data.skin + 1));
        var _h_type = slot_data.h_type - slot_data.spr_row_pos - 1;
        var _row_index = ((_h_type * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c;
        _final_index = _row_index + slot_data.anim_struct.index;
        _hair_index = (((_h_type * UnknownEnum.Value_3) + unit_data.hair) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index;
        var _handc_pos = -1;
        var _legc_pos = -1;
        _touch = slot_data.spr_touch;
        _enter = slot_data.spr_enter;
        
        if (slot_data.mon_placement[1] != -1)
            draw_sprite(spr_h_ogre_body_loop_morrigan_extra, _final_index, x, y);
    }
    
    var _num = array_length(spr_slot);
    
    for (var i = 0; i < _num; i++)
    {
        var _replace = false;
        var _spr = spr_slot[i][UnknownEnum.Value_1];
        
        if (_spr != -1)
        {
            var _type = spr_slot[i][UnknownEnum.Value_0];
            var _c_spr = spr_slot[i][UnknownEnum.Value_3];
            _index = slot_data.mod_index[i];
            
            if (_c_spr != -1 && _index == 0)
                _replace = spr_slot[i][UnknownEnum.Value_4];
            
            var _legc_pos;
            
            switch (_type)
            {
                case UnknownEnum.Value_0:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_2:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    var _handc_pos = _index;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_index != -1)
                        draw_sprite(_spr, _index, x, y);
                    
                    _legc_pos = _index;
                    break;
                
                case UnknownEnum.Value_5:
                    if (_index == 0)
                        draw_sprite(_spr, _index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_10:
                    if (_index != -1)
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        draw_sprite(_c_spr, _final_index, x, y);
                        var _hair_spr = spr_slot[i][UnknownEnum.Value_5];
                        
                        if (_hair_spr != -1)
                            draw_sprite(_hair_spr, _hair_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    var _draw = false;
                    var _handc_pos;
                    
                    if (spr_slot[i][UnknownEnum.Value_2] == -2)
                    {
                        _handc_pos = 0;
                        _draw = true;
                    }
                    
                    if (_draw || (_index != -1 && _handc_pos != -1))
                    {
                        var _spr_hand_index = max(0, unit_data.skin) * (sprite_get_number(_spr) / UnknownEnum.Value_3);
                        var _hand_frame = slot_data.hand_frame[slot_data.anim_struct.spr_type];
                        
                        if (_hand_frame != -1)
                        {
                            var _hand_num = array_length(_hand_frame);
                            
                            for (var iii = 0; iii < _hand_num; iii++)
                            {
                                if (floor(slot_data.anim_struct.index) == _hand_frame[iii])
                                    _spr_hand_index++;
                            }
                        }
                        
                        var _end_x = x + image_xscale;
                        
                        if (!_replace)
                        {
                            draw_sprite_ext(_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                        
                        if (_c_spr != -1 && _index == 0)
                        {
                            draw_sprite_ext(_c_spr, _spr_hand_index, x + slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos], 1, slot_data.hand_angle[_handc_pos], image_blend, image_alpha);
                            draw_sprite_ext(_c_spr, _spr_hand_index, _end_x - slot_data.hand_x[_handc_pos], y + slot_data.hand_y[_handc_pos], slot_data.hand_xscale[_handc_pos] * -1, 1, slot_data.hand_angle[_handc_pos] + (180 * sign(slot_data.hand_angle[_handc_pos])), image_blend, image_alpha);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    if (_index != -1 && !_replace)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    if (_index == 0 && _c_spr != -1)
                        draw_sprite(_c_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_8:
                    if (_index != -1 && !_replace)
                    {
                        draw_sprite(_spr, _final_index, x, y);
                        
                        if (_touch != -1 && (global.val.alpha_type == UnknownEnum.Value_0 || global.val.alpha_type == UnknownEnum.Value_1))
                            draw_sprite(_touch, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                        
                        if (_enter != -1)
                        {
                            for (var u = 0; u < array_length(slot_data.mon_placement); u++)
                            {
                                if (slot_data.mon_placement[u] != -1)
                                    draw_sprite(_enter, (((u * _test) + max(0, unit_data.skin)) * slot_data.anim_struct.frame_c) + slot_data.anim_struct.index, x, y);
                            }
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_9:
                    if (_index != -1 && (_legc_pos != -1 || spr_slot[i][UnknownEnum.Value_2] == -2))
                    {
                        if (!_replace)
                            draw_sprite(_spr, _final_index, x, y);
                        
                        if (_index == 0 && _c_spr != -1)
                            draw_sprite(_c_spr, _final_index, x, y);
                    }
                    
                    break;
                
                case UnknownEnum.Value_11:
                    if (_index == 0)
                        draw_sprite(_spr, _final_index, x, y);
                    
                    break;
                
                case UnknownEnum.Value_12:
                    if (slot_data.slot_dirt > 0)
                    {
                        var _slot_dirt = ceil(slot_data.slot_dirt) - 1;
                        draw_sprite(_spr, _slot_dirt, x, y);
                    }
                    
                    break;
            }
        }
    }
    
    if (unit_data != -1 && slot_data.anim_struct.sp_state != -1)
    {
        for (var i = 0; i < array_length(slot_data.sp_place); i++)
        {
            var _pos = slot_data.sp_place[i];
            
            switch (slot_data.anim_struct.char_state)
            {
                case UnknownEnum.Value_0:
                    draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x[_pos] + (floor(slot_data.anim_struct.index) * slot_data.sp_anim_x), y + slot_data.sp_y[_pos]);
                    break;
                
                case UnknownEnum.Value_1:
                    var _sp_y = 0;
                    var _sp_x = 0;
                    
                    switch (floor(slot_data.anim_struct.index))
                    {
                        case 2:
                            _sp_x = 1;
                            break;
                        
                        case 3:
                            _sp_y = -1;
                            _sp_x = 1;
                            break;
                        
                        case 4:
                            _sp_x = 1;
                            break;
                    }
                    
                    draw_sprite(sp_spr, slot_data.anim_struct.sp_index, x + slot_data.sp_x[_pos] + (_sp_x * slot_data.sp_anim_x), y + slot_data.sp_y[_pos] + (_sp_y * slot_data.sp_anim_y));
                    break;
            }
        }
    }
    
    for (var i = 0; i < slot_data.max_mon_num; i++)
    {
        if (slot_data.mon_placement[i] != -1)
        {
            var _spr = spr_h_ogre_body_loop_morrigan;
            var _row_index = i * slot_data.anim_struct.frame_c;
            _final_index = _row_index + slot_data.anim_struct.index;
            draw_sprite_ext(_spr, _final_index, x, y, 1, 1, 0, c_white, 1);
        }
    }
    
    var _index = slot_data.mod_index[5];
    
    if (_index != 2)
    {
        var _mod_sign = _index;
        var _scale_sign = ((_mod_sign * 2) - 1) * -1;
        draw_sprite_ext(spr_slot_chain_sign, 0, x + (image_xscale * _mod_sign), y + slot_data.sign_y, _scale_sign, 1, image_angle, image_blend, image_alpha);
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
    Value_13,
    Value_14
}
