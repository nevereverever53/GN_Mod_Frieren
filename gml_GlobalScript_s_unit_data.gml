function scr_set_class_spr_data(arg0, arg1, arg2)
{
    var _spr_c_array = -1;
    var _spr_array = -1;
    var _set = false;
    var _class = arg0.class;
    var _hair = arg0.hair;
    var _skin = arg0.skin;
    var _head = -1;
    var _breast = -1;
    var _leg = -1;
    var _leg_p = -1;
    
    if (arg1 == UnknownEnum.Value_3)
        arg1 = UnknownEnum.Value_2;
    
    switch (slot_data.slot_type)
    {
        case UnknownEnum.Value_1:
            switch (slot_data.h_type)
            {
                case UnknownEnum.Value_36:
                    _set = true;
                    
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_cow_idle_head, spr_cow_breast, -1, -1, -1];
                            _spr_c_array = [-1, -1, -1, spr_cow_idle_hand, spr_cow_idle_leg, -1];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_cow_loop_head, spr_cow_breast, -1, -1, -1];
                            _spr_c_array = [-1, -1, -1, spr_cow_loop_hand, spr_cow_loop_leg, -1];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_38:
                    _set = true;
                    
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, -1, spr_h_morrigan_chain_idle_breast, -1, spr_h_morrigan_chain_idle_leg, -1];
                            _spr_c_array = [-1, -1, spr_h_morrigan_chain_idle_breast_c, -1, spr_h_morrigan_chain_idle_leg_c, -1];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, -1, spr_h_morrigan_chain_loop_breast, -1, spr_h_morrigan_chain_loop_leg, -1];
                            _spr_c_array = [-1, -1, spr_h_morrigan_chain_loop_breast_c, -1, spr_h_morrigan_chain_loop_leg_c, -1];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_39:
                    _set = true;
                    
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_lilith_shrine_idle_head, spr_h_lilith_shrine_idle_breast, spr_h_lilith_hand, spr_h_lilith_shrine_idle_leg, -1];
                            _spr_c_array = [-1, -1, spr_h_lilith_shrine_idle_breast_c, spr_h_lilith_hand_c, spr_h_lilith_shrine_idle_leg_c, -1];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_lilith_shrine_loop_head, spr_h_lilith_shrine_loop_hand, spr_h_lilith_hand, spr_h_lilith_shrine_loop_leg, -1];
                            _spr_c_array = [-1, -1, spr_h_lilith_shrine_loop_hand, spr_h_lilith_hand_c, spr_h_lilith_shrine_loop_leg_c, -1];
                            break;
                    }
                    
                    break;
            }
            
            if (!_set)
            {
                switch (arg1)
                {
                    case UnknownEnum.Value_0:
                        _head = spr_h_base_big_start_head;
                        _breast = spr_h_base_big_start_breast;
                        
                        switch (arg0.leg)
                        {
                            case UnknownEnum.Value_1:
                                _leg = spr_h_base_big_start_leg_1;
                                break;
                            
                            case UnknownEnum.Value_2:
                                _leg = spr_h_base_big_start_leg_2;
                                break;
                            
                            case UnknownEnum.Value_0:
                                _head = spr_h_base_big_start_head_3;
                                _breast = spr_h_base_big_start_breast_3;
                                _leg = spr_h_base_big_start_leg_3;
                                break;
                        }
                        
                        _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, -1, -1];
                        break;
                    
                    case UnknownEnum.Value_1:
                        _head = spr_h_base_big_idle_head;
                        _breast = spr_h_base_big_idle_breast;
                        
                        switch (arg0.leg)
                        {
                            case UnknownEnum.Value_1:
                                _leg = spr_h_base_big_idle_leg_1;
                                break;
                            
                            case UnknownEnum.Value_2:
                                _leg = spr_h_base_big_idle_leg_2;
                                break;
                            
                            case UnknownEnum.Value_0:
                                _head = spr_h_base_big_idle_head_3;
                                _breast = spr_h_base_big_idle_breast_3;
                                _leg = spr_h_base_big_idle_leg_3;
                                break;
                        }
                        
                        _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, -1, -1];
                        break;
                    
                    case UnknownEnum.Value_2:
                        _head = spr_h_base_big_loop_head;
                        _breast = spr_h_base_big_loop_breast;
                        
                        switch (arg0.leg)
                        {
                            case UnknownEnum.Value_1:
                                _leg = spr_h_base_big_loop_leg_1;
                                break;
                            
                            case UnknownEnum.Value_2:
                                _leg = spr_h_base_big_loop_leg_2;
                                break;
                            
                            case UnknownEnum.Value_0:
                                _breast = spr_h_base_big_loop_breast_3;
                                _leg = spr_h_base_big_loop_leg_3;
                                _head = spr_h_base_big_loop_head_3;
                                break;
                        }
                        
                        _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, -1, -1];
                        break;
                }
                
                switch (_class)
                {
                    case UnknownEnum.Value_0:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_peasant_big_start_leg_1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_peasant_big_start_leg_2;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_peasant_big_start_hair, spr_h_peasant_big_start_head, spr_h_peasant_big_start_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_peasant_big_idle_leg_1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_peasant_big_idle_leg_2;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_peasant_big_idle_hair, spr_h_peasant_big_idle_head, spr_h_peasant_big_idle_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_peasant_big_loop_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_peasant_big_loop_leg;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_peasant_big_loop_hair, spr_h_peasant_big_loop_head, spr_h_peasant_big_loop_breast, -1, _leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_1:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_cleric_big_start_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_cleric_big_start_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_cleric_big_start_head, spr_h_cleric_big_start_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_cleric_big_idle_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_cleric_big_idle_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_cleric_big_idle_head, spr_h_cleric_big_idle_breast, spr_h_cleric_hand, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_cleric_big_loop_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_cleric_big_loop_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_cleric_big_loop_head, spr_h_cleric_big_loop_breast, spr_h_cleric_hand, _leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_2:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_knight_big_start_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_knight_big_start_leg;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_knight_big_start_hair, spr_h_knight_big_start_head, spr_h_knight_big_start_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_knight_big_idle_leg_1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_knight_big_idle_leg_2;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_knight_big_idle_hair, spr_h_knight_big_idle_head, spr_h_knight_big_idle_breast, spr_h_knight_hand, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_knight_big_loop_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_knight_big_loop_leg;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_knight_big_loop_hair, spr_h_knight_big_loop_head, spr_h_knight_big_loop_breast, spr_h_knight_hand, _leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_4:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_nun_big_start_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_nun_big_start_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_nun_big_start_head, spr_h_nun_big_start_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_nun_big_idle_leg_1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_nun_big_idle_leg_2;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_nun_big_idle_head, spr_h_nun_big_idle_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_nun_big_loop_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_nun_big_loop_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_nun_big_loop_head, spr_h_nun_big_loop_breast, -1, _leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_3:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_ranger_big_start_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_ranger_big_start_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_ranger_big_start_head, spr_h_ranger_big_start_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_ranger_big_idle_leg_1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_ranger_big_idle_leg_2;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_ranger_big_idle_head, spr_h_ranger_big_idle_breast, spr_h_ranger_hand, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_ranger_big_loop_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_ranger_big_loop_leg;
                                        break;
                                }
                                
                                _spr_c_array = [-1, spr_h_ranger_big_loop_head, spr_h_ranger_big_loop_breast, spr_h_ranger_hand, _leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_5:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_samurai_big_start_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_samurai_big_start_leg;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_samurai_big_start_hair, spr_h_samurai_big_start_head, spr_h_samurai_big_start_breast, -1, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_samurai_big_idle_leg_1;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_samurai_big_idle_leg_2;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_samurai_big_idle_hair, spr_h_samurai_big_idle_head, spr_h_samurai_big_idle_breast, spr_h_samurai_hand, _leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                switch (arg0.leg)
                                {
                                    case UnknownEnum.Value_1:
                                        _leg = spr_h_samurai_big_loop_leg;
                                        break;
                                    
                                    case UnknownEnum.Value_2:
                                        _leg = spr_h_samurai_big_loop_leg;
                                        break;
                                }
                                
                                _spr_c_array = [spr_h_samurai_big_loop_hair, spr_h_samurai_big_loop_head, spr_h_samurai_big_loop_breast, spr_h_samurai_hand, _leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_6:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_c_array = [spr_h_shaman_big_start_hair, spr_h_shaman_big_start_head, spr_h_shaman_big_start_breast, -1, spr_h_shaman_big_start_leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_c_array = [spr_h_shaman_big_idle_hair, spr_h_shaman_big_idle_head, spr_h_shaman_big_idle_breast, -1, spr_h_shaman_big_idle_leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_c_array = [spr_h_shaman_big_loop_hair, spr_h_shaman_big_loop_head, spr_h_shaman_big_loop_breast, -1, spr_h_shaman_big_loop_leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_7:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_c_array = [-1, spr_h_warrior_big_start_head, spr_h_warrior_big_start_breast, spr_h_warrior_hand, spr_h_warrior_big_start_leg, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_c_array = [-1, spr_h_warrior_big_idle_head, spr_h_warrior_big_idle_breast, spr_h_warrior_hand, spr_h_warrior_big_idle_leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_c_array = [-1, spr_h_warrior_big_loop_head, spr_h_warrior_big_loop_breast, spr_h_warrior_hand, spr_h_warrior_big_loop_leg, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_9:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_array = [-1, spr_h_cow_big_start_head, spr_h_cow_big_start_breast, spr_h_cow_hand, spr_h_cow_big_start_leg, -1];
                                _spr_c_array = [-1, spr_h_cow_big_start_head, spr_h_cow_big_start_breast_c, spr_h_cow_hand_c, spr_h_cow_big_start_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_array = [-1, spr_h_cow_big_idle_head, spr_h_cow_big_idle_breast, spr_h_cow_hand, spr_h_cow_big_idle_leg, -1];
                                _spr_c_array = [-1, spr_h_cow_big_idle_head, spr_h_cow_big_idle_breast_c, spr_h_cow_hand_c, spr_h_cow_big_idle_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_h_cow_big_loop_head, spr_h_cow_big_loop_breast, spr_h_cow_hand, spr_h_cow_big_loop_leg, -1];
                                _spr_c_array = [-1, spr_h_cow_big_loop_head, spr_h_cow_big_loop_breast_c, spr_h_cow_hand_c, spr_h_cow_big_loop_leg_c, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_10:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_array = [-1, spr_h_nyx_big_start_head, spr_h_nyx_big_start_breast, spr_h_nyx_hand, spr_h_nyx_big_start_leg, -1];
                                _spr_c_array = [-1, spr_h_nyx_big_start_head, spr_h_nyx_big_start_breast_c, spr_h_nyx_hand_c, spr_h_nyx_big_start_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_array = [-1, spr_h_nyx_big_idle_head, spr_h_nyx_big_idle_breast, spr_h_nyx_hand, spr_h_nyx_big_idle_leg, -1];
                                _spr_c_array = [-1, spr_h_nyx_big_idle_head, spr_h_nyx_big_idle_breast_c, spr_h_nyx_hand_c, spr_h_nyx_big_idle_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_h_nyx_big_loop_head, spr_h_nyx_big_loop_breast, spr_h_nyx_hand, spr_h_nyx_big_loop_leg, -1];
                                _spr_c_array = [-1, spr_h_nyx_big_loop_head, spr_h_nyx_big_loop_breast_c, spr_h_nyx_hand_c, spr_h_nyx_big_loop_leg_c, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_8:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_array = [-1, spr_h_lilith_big_start_head, spr_h_lilith_big_start_breast, spr_h_lilith_hand, spr_h_lilith_big_start_leg, -1];
                                _spr_c_array = [-1, spr_h_lilith_big_start_head, spr_h_lilith_big_start_breast_c, spr_h_lilith_hand_c, spr_h_lilith_big_start_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_array = [-1, spr_h_lilith_big_idle_head, spr_h_lilith_big_idle_breast, spr_h_lilith_hand, spr_h_lilith_big_idle_leg, -1];
                                _spr_c_array = [-1, spr_h_lilith_big_idle_head, spr_h_lilith_big_idle_breast_c, spr_h_lilith_hand_c, spr_h_lilith_big_idle_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_h_lilith_big_loop_head, spr_h_lilith_big_loop_breast, spr_h_lilith_hand, spr_h_lilith_big_loop_leg, -1];
                                _spr_c_array = [-1, spr_h_lilith_big_loop_head, spr_h_lilith_big_loop_breast_c, spr_h_lilith_hand_c, spr_h_lilith_big_loop_leg_c, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_13:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_array = [-1, spr_h_cat_big_start_head, spr_h_cat_big_start_breast, spr_h_cat_hand, spr_h_cat_big_start_leg, -1];
                                _spr_c_array = [-1, spr_h_cat_big_start_head, spr_h_cat_big_start_breast_c, spr_h_cat_hand_c, spr_h_cat_big_start_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_array = [-1, spr_h_cat_big_idle_head, spr_h_cat_big_idle_breast, spr_h_cat_hand, spr_h_cat_big_idle_leg, -1];
                                _spr_c_array = [-1, spr_h_cat_big_idle_head, spr_h_cat_big_idle_breast_c, spr_h_cat_hand_c, spr_h_cat_big_idle_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_h_cat_big_loop_head, spr_h_cat_big_loop_breast, spr_h_cat_hand, spr_h_cat_big_loop_leg, -1];
                                _spr_c_array = [-1, spr_h_cat_big_loop_head, spr_h_cat_big_loop_breast_c, spr_h_cat_hand_c, spr_h_cat_big_loop_leg_c, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_12:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_array = [-1, spr_h_morrigan_big_start_head, spr_h_morrigan_big_start_breast, spr_h_morrigan_hand, spr_h_morrigan_big_start_leg, -1];
                                _spr_c_array = [-1, spr_h_morrigan_big_start_head, spr_h_morrigan_big_start_breast_c, spr_h_morrigan_hand_c, spr_h_morrigan_big_start_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_array = [-1, spr_h_morrigan_big_idle_head, spr_h_morrigan_big_idle_breast, spr_h_morrigan_hand, spr_h_morrigan_big_idle_leg, -1];
                                _spr_c_array = [-1, spr_h_morrigan_big_idle_head, spr_h_morrigan_big_idle_breast_c, spr_h_morrigan_hand_c, spr_h_morrigan_big_idle_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_h_morrigan_big_loop_head, spr_h_morrigan_big_loop_breast, spr_h_morrigan_hand, spr_h_morrigan_big_loop_leg, -1];
                                _spr_c_array = [-1, spr_h_morrigan_big_loop_head, spr_h_morrigan_big_loop_breast_c, spr_h_morrigan_hand_c, spr_h_morrigan_big_loop_leg_c, -1];
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_11:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_1:
                                _spr_array = [spr_giant_idle_middle, spr_giant_idle_head, spr_giant_idle_breast, spr_giant_idle_hand, spr_giant_idle_leg_1, spr_giant_idle_leg_2];
                                _spr_c_array = [-1, -1, spr_giant_idle_breast_c, spr_giant_idle_hand_c, spr_giant_idle_leg_1_c, spr_giant_idle_leg_2_c];
                                _spr_array[UnknownEnum.Value_6] = spr_giant_idle_middle;
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_giant_loop_head, spr_giant_loop_breast, spr_giant_loop_hand, spr_giant_loop_leg_1, spr_giant_loop_leg_2];
                                _spr_c_array = [-1, -1, spr_giant_loop_breast_c, spr_giant_loop_hand_c, spr_giant_loop_leg_1_c, spr_giant_loop_leg_2_c];
                                _spr_array[UnknownEnum.Value_6] = spr_giant_loop_middle;
                                break;
                            
                            case UnknownEnum.Value_4:
                                _spr_array = [spr_giant_birth_middle, spr_giant_birth_head, spr_giant_birth_breast, spr_giant_birth_hand, spr_giant_birth_leg_1, spr_giant_birth_leg_2];
                                _spr_c_array = [-1, -1, spr_giant_birth_breast_c, spr_giant_birth_hand_c, spr_giant_birth_leg_1_c, spr_giant_birth_leg_2_c];
                                _spr_array[UnknownEnum.Value_6] = spr_giant_birth_middle;
                                break;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_14:
                        switch (arg1)
                        {
                            case UnknownEnum.Value_0:
                                _spr_array = [-1, spr_h_frieren_big_start_head, spr_h_frieren_big_start_breast, spr_h_frieren_hand, spr_h_frieren_big_start_leg, -1];
                                _spr_c_array = [-1, spr_h_frieren_big_start_head, spr_h_frieren_big_start_breast_c, spr_h_frieren_hand, spr_h_frieren_big_start_leg_c, -1];
                                break;
                            
                            case UnknownEnum.Value_1:
                                _spr_array = [-1, spr_h_frieren_big_idle_head, spr_h_frieren_big_idle_breast, spr_h_cow_hand, spr_h_frieren_big_idle_leg, -1];
                                _spr_c_array = [-1, spr_h_frieren_big_idle_head, spr_h_frieren_big_idle_breast, spr_h_cow_hand, spr_h_frieren_big_idle_leg, -1];
                                break;
                            
                            case UnknownEnum.Value_2:
                                _spr_array = [-1, spr_h_frieren_big_loop_head, spr_h_frieren_big_loop_breast, spr_h_frieren_hand, spr_h_frieren_big_loop_leg, -1];
                                _spr_c_array = [-1, spr_h_frieren_big_loop_head, spr_h_frieren_big_loop_breast_c, spr_h_frieren_hand, spr_h_frieren_big_loop_leg_c, -1];
                                break;
                        }
                        
                        break;
                }
            }
            
            break;
        
        case UnknownEnum.Value_0:
            switch (arg1)
            {
                case UnknownEnum.Value_1:
                    _head = spr_h_base_idle_head;
                    _breast = spr_h_base_idle_breast;
                    _leg_p = spr_h_base_idle_leg_part;
                    
                    switch (arg0.leg)
                    {
                        case UnknownEnum.Value_1:
                            _leg = spr_h_base_idle_leg_1;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _leg = spr_h_base_idle_leg_2;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _head = spr_h_base_idle_head_3;
                            _breast = spr_h_base_idle_breast_3;
                            _leg = spr_h_base_idle_leg_3;
                            _leg_p = spr_h_base_idle_leg_part_3;
                            break;
                    }
                    
                    _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, _leg_p, -1];
                    break;
                
                case UnknownEnum.Value_2:
                    _head = spr_h_base_loop_head;
                    _breast = spr_h_base_loop_breast;
                    _leg_p = spr_h_base_loop_leg_part;
                    
                    switch (arg0.leg)
                    {
                        case UnknownEnum.Value_1:
                            _leg = spr_h_base_loop_leg_1;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _leg = spr_h_base_loop_leg_2;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _head = spr_h_base_loop_head_3;
                            _breast = spr_h_base_loop_breast_3;
                            _leg = spr_h_base_loop_leg_3;
                            _leg_p = spr_h_base_loop_leg_part_3;
                            break;
                    }
                    
                    _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, _leg_p, -1];
                    break;
            }
            
            switch (_class)
            {
                case UnknownEnum.Value_0:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_peasant_idle_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_peasant_idle_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_peasant_idle_hair, spr_h_peasant_idle_head, spr_h_peasant_idle_breast, -1, _leg, spr_h_peasant_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_peasant_loop_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_peasant_loop_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_peasant_loop_hair, spr_h_peasant_loop_head, spr_h_peasant_loop_breast, -1, _leg, spr_h_peasant_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_1:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_cleric_idle_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_cleric_idle_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_cleric_idle_head, spr_h_cleric_idle_breast, spr_h_cleric_hand, _leg, spr_h_cleric_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_cleric_loop_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_cleric_loop_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_cleric_loop_head, spr_h_cleric_loop_breast, spr_h_cleric_hand, _leg, spr_h_cleric_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_2:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_knight_idle_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_knight_idle_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_knight_idle_hair, spr_h_knight_idle_head, spr_h_knight_idle_breast, spr_h_knight_hand, _leg, spr_h_knight_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_knight_loop_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_knight_loop_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_knight_loop_hair, spr_h_knight_loop_head, spr_h_knight_loop_breast, spr_h_knight_hand, _leg, spr_h_knight_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_4:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_nun_idle_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_nun_idle_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_nun_idle_head, spr_h_nun_idle_breast, -1, _leg, spr_h_nun_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_nun_loop_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_nun_loop_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_nun_loop_head, spr_h_nun_loop_breast, -1, _leg, spr_h_nun_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_3:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_ranger_idle_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_ranger_idle_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_ranger_idle_head, spr_h_ranger_idle_breast, spr_h_ranger_hand, _leg, spr_h_ranger_idle_leg_part];
                            _spr_array[UnknownEnum.Value_6] = spr_h_ranger_idle_cape;
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_ranger_loop_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_ranger_loop_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_ranger_loop_head, spr_h_ranger_loop_breast, spr_h_ranger_hand, _leg, spr_h_ranger_loop_leg_part];
                            _spr_array[UnknownEnum.Value_6] = spr_h_ranger_loop_cape;
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_5:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_samurai_idle_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_samurai_idle_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_samurai_idle_hair, spr_h_samurai_idle_head, spr_h_samurai_idle_breast, spr_h_samurai_hand, _leg, spr_h_samurai_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_samurai_loop_leg_1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_samurai_loop_leg_2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_samurai_loop_hair, spr_h_samurai_loop_head, spr_h_samurai_loop_breast, spr_h_samurai_hand, _leg, spr_h_samurai_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_c_array = [spr_h_mage_idle_hair, spr_h_mage_idle_head, spr_h_mage_idle_breast, -1, spr_h_mage_idle_leg, spr_h_mage_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_c_array = [spr_h_mage_loop_hair, spr_h_mage_loop_head, spr_h_mage_loop_breast, -1, spr_h_mage_loop_leg, spr_h_mage_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_c_array = [-1, spr_h_warrior_idle_head, spr_h_warrior_idle_breast, spr_h_warrior_hand, spr_h_warrior_idle_leg, spr_h_warrior_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_c_array = [-1, spr_h_warrior_loop_head, spr_h_warrior_loop_breast, spr_h_warrior_hand, spr_h_warrior_loop_leg, spr_h_warrior_loop_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_9:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_base_idle_head_cow, spr_h_base_idle_breast_cow, spr_h_cow_hand, spr_h_base_idle_leg_cow, spr_h_base_idle_leg_part_cow, spr_h_base_idle_cape_cow];
                            _spr_c_array = [-1, spr_h_base_idle_head_cow, spr_h_base_idle_breast_c_cow, spr_h_cow_hand_c, spr_h_base_idle_leg_c_cow, spr_h_base_idle_leg_part_c_cow];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_base_loop_head_cow, spr_h_base_loop_breast_cow, spr_h_cow_hand, spr_h_base_loop_leg_cow, spr_h_base_loop_leg_part_cow, spr_h_base_loop_cape_cow];
                            _spr_c_array = [-1, spr_h_base_loop_head_cow, spr_h_base_loop_breast_c_cow, spr_h_cow_hand_c, spr_h_base_loop_leg_c_cow, spr_h_base_loop_leg_part_c_cow];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_10:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_base_idle_head_nyx, spr_h_base_idle_breast_nyx, spr_h_nyx_hand, spr_h_base_idle_leg_nyx, spr_h_base_idle_leg_part_nyx, -1];
                            _spr_c_array = [-1, spr_h_base_idle_head_nyx, spr_h_base_idle_breast_c_nyx, spr_h_nyx_hand_c, spr_h_base_idle_leg_c_nyx, spr_h_base_idle_leg_part_c_nyx];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_base_loop_head_nyx, spr_h_base_loop_breast_nyx, spr_h_nyx_hand, spr_h_base_loop_leg_nyx, spr_h_base_loop_leg_part_nyx, -1];
                            _spr_c_array = [-1, spr_h_base_loop_head_nyx, spr_h_base_loop_breast_c_nyx, spr_h_nyx_hand_c, spr_h_base_loop_leg_c_nyx, spr_h_base_loop_leg_part_c_nyx];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_13:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_base_idle_head_cat, spr_h_base_idle_breast_cat, spr_h_cat_hand, spr_h_base_idle_leg_cat, spr_h_base_idle_leg_part_cat, -1];
                            _spr_c_array = [-1, spr_h_base_idle_head_cat, spr_h_base_idle_breast_c_cat, spr_h_cat_hand_c, spr_h_base_idle_leg_c_cat, spr_h_base_idle_leg_part_c_cat];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_base_loop_head_cat, spr_h_base_loop_breast_cat, spr_h_cat_hand, spr_h_base_loop_leg_cat, spr_h_base_loop_leg_part_cat, -1];
                            _spr_c_array = [-1, spr_h_base_loop_head_cat, spr_h_base_loop_breast_c_cat, spr_h_cat_hand_c, spr_h_base_loop_leg_c_cat, spr_h_base_loop_leg_part_c_cat];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_12:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_base_idle_head_morrigan, spr_h_base_idle_breast_morrigan, spr_h_morrigan_hand, spr_h_base_idle_leg_morrigan, spr_h_base_idle_leg_part_morrigan, spr_h_base_idle_cape_morrigan];
                            _spr_c_array = [-1, spr_h_base_idle_head_morrigan, spr_h_base_idle_breast_c_morrigan, spr_h_morrigan_hand_c, spr_h_base_idle_leg_c_morrigan, spr_h_base_idle_leg_part_c_morrigan];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_base_loop_head_morrigan, spr_h_base_loop_breast_morrigan, spr_h_morrigan_hand, spr_h_base_loop_leg_morrigan, spr_h_base_loop_leg_part_morrigan, spr_h_base_idle_cape_morrigan];
                            _spr_c_array = [-1, spr_h_base_loop_head_morrigan, spr_h_base_loop_breast_c_morrigan, spr_h_morrigan_hand_c, spr_h_base_loop_leg_c_morrigan, spr_h_base_loop_leg_part_c_morrigan];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_8:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_base_idle_head_lilith, spr_h_base_idle_breast_lilith, spr_h_lilith_hand, spr_h_base_idle_leg_lilith, spr_h_base_idle_leg_part_lilith, -1];
                            _spr_c_array = [-1, spr_h_base_idle_head_lilith, spr_h_base_idle_breast_c_lilith, spr_h_lilith_hand_c, spr_h_base_idle_leg_c_lilith, spr_h_base_idle_leg_part_c_lilith];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_base_loop_head_lilith, spr_h_base_loop_breast_lilith, spr_h_lilith_hand, spr_h_base_loop_leg_lilith, spr_h_base_loop_leg_part_lilith, -1];
                            _spr_c_array = [-1, spr_h_base_loop_head_lilith, spr_h_base_loop_breast_c_lilith, spr_h_lilith_hand_c, spr_h_base_loop_leg_c_lilith, spr_h_base_loop_leg_part_c_lilith];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_14:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_base_idle_head_frieren, spr_h_base_idle_breast_frieren, spr_h_frieren_hand, spr_h_base_idle_leg_frieren, spr_h_base_idle_leg_part_frieren, -1];
                            _spr_c_array = [-1, spr_h_base_idle_head_frieren, spr_h_base_idle_breast_c_frieren, spr_h_frieren_hand, spr_h_base_idle_leg_c_frieren, spr_h_base_idle_leg_part_c_frieren];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_base_loop_head_frieren, spr_h_base_loop_breast_frieren, spr_h_frieren_hand, spr_h_base_loop_leg_frieren, spr_h_base_loop_leg_part_frieren, -1];
                            _spr_c_array = [-1, spr_h_base_loop_head_frieren, spr_h_base_loop_breast_c_frieren, spr_h_frieren_hand, spr_h_base_loop_leg_c_frieren, spr_h_base_loop_leg_part_c_frieren];
                            break;
                    }
            }
            
            break;
        
        case UnknownEnum.Value_2:
            switch (arg1)
            {
                case UnknownEnum.Value_1:
                    _head = spr_h_tent_idle_head;
                    _breast = spr_h_tent_idle_breast;
                    _leg_p = spr_h_tent_idle_leg_part;
                    
                    switch (arg0.leg)
                    {
                        case UnknownEnum.Value_1:
                            _leg = spr_h_tent_idle_leg_1;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _leg = spr_h_tent_idle_leg_2;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _head = spr_h_tent_idle_head_3;
                            _breast = spr_h_tent_idle_breast_3;
                            _leg = spr_h_tent_idle_leg_3;
                            _leg_p = spr_h_tent_idle_leg_part_3;
                            break;
                    }
                    
                    _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, _leg_p, -1];
                    break;
                
                case UnknownEnum.Value_2:
                    _head = spr_h_tent_loop_head;
                    _breast = spr_h_tent_loop_breast;
                    _leg_p = spr_h_tent_loop_leg_part;
                    
                    switch (arg0.leg)
                    {
                        case UnknownEnum.Value_1:
                            _leg = spr_h_tent_loop_leg_1;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _leg = spr_h_tent_loop_leg_2;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _head = spr_h_tent_loop_head_3;
                            _breast = spr_h_tent_loop_breast_3;
                            _leg = spr_h_tent_loop_leg_3;
                            _leg_p = spr_h_tent_loop_leg_part_3;
                            break;
                    }
                    
                    _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, _leg_p, -1];
                    break;
                
                case UnknownEnum.Value_4:
                    _head = spr_h_tent_birth_head;
                    _breast = spr_h_tent_birth_breast;
                    _leg_p = spr_h_tent_birth_leg_part;
                    
                    switch (arg0.leg)
                    {
                        case UnknownEnum.Value_1:
                            _leg = spr_h_tent_birth_leg_1;
                            break;
                        
                        case UnknownEnum.Value_2:
                            _leg = spr_h_tent_birth_leg_2;
                            break;
                        
                        case UnknownEnum.Value_0:
                            _head = spr_h_tent_birth_head_3;
                            _breast = spr_h_tent_birth_breast_3;
                            _leg = spr_h_tent_birth_leg_3;
                            _leg_p = spr_h_tent_birth_leg_part_3;
                            break;
                    }
                    
                    _spr_array = [-1, _head, _breast, spr_h_base_hand, _leg, _leg_p, -1];
                    break;
            }
            
            switch (_class)
            {
                case UnknownEnum.Value_0:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_peasant_tent_idle_leg;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_peasant_tent_idle_leg;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_peasant_tent_idle_hair, spr_h_peasant_tent_idle_head, spr_h_peasant_tent_idle_breast, -1, _leg, spr_h_peasant_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_peasant_tent_loop_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_peasant_tent_loop_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_peasant_tent_loop_hair, spr_h_peasant_tent_loop_head, spr_h_peasant_tent_loop_breast, -1, _leg, spr_h_peasant_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_peasant_tent_birth_leg;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_peasant_tent_birth_leg;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_peasant_tent_birth_hair, spr_h_peasant_tent_birth_head, spr_h_peasant_tent_birth_breast, -1, _leg, spr_h_peasant_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_1:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_cleric_tent_idle_leg;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_cleric_tent_idle_leg;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_cleric_tent_idle_head, spr_h_cleric_tent_idle_breast, spr_h_cleric_hand, _leg, spr_h_cleric_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_cleric_tent_loop_leg;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_cleric_tent_loop_leg;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_cleric_tent_loop_head, spr_h_cleric_tent_loop_breast, spr_h_cleric_hand, _leg, spr_h_cleric_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_cleric_tent_birth_leg;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_cleric_tent_birth_leg;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_cleric_tent_birth_head, spr_h_cleric_tent_birth_breast, spr_h_cleric_hand, _leg, spr_h_cleric_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_2:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_knight_tent_idle_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_knight_tent_idle_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_knight_tent_idle_hair, spr_h_knight_tent_idle_head, spr_h_knight_tent_idle_breast, spr_h_knight_hand, _leg, spr_h_knight_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_knight_tent_loop_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_knight_tent_loop_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_knight_tent_loop_hair, spr_h_knight_tent_loop_head, spr_h_knight_tent_loop_breast, spr_h_knight_hand, _leg, spr_h_knight_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_knight_tent_birth_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_knight_tent_birth_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_knight_tent_birth_hair, spr_h_knight_tent_birth_head, spr_h_knight_tent_birth_breast, spr_h_knight_hand, _leg, spr_h_knight_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_4:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_nun_tent_idle_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_nun_tent_idle_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_nun_tent_idle_head, spr_h_nun_tent_idle_breast, -1, _leg, spr_h_nun_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_nun_tent_loop_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_nun_tent_loop_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_nun_tent_loop_head, spr_h_nun_tent_loop_breast, -1, _leg, spr_h_nun_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_nun_tent_birth_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_nun_tent_birth_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_nun_tent_birth_head, spr_h_nun_tent_birth_breast, -1, _leg, spr_h_nun_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_3:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_ranger_tent_idle_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_ranger_tent_idle_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_ranger_tent_idle_head, spr_h_ranger_tent_idle_breast, spr_h_ranger_hand, _leg, spr_h_ranger_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_ranger_tent_loop_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_ranger_tent_loop_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_ranger_tent_loop_head, spr_h_ranger_tent_loop_breast, spr_h_ranger_hand, _leg, spr_h_ranger_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_ranger_tent_birth_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_ranger_tent_birth_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [-1, spr_h_ranger_tent_birth_head, spr_h_ranger_tent_birth_breast, spr_h_ranger_hand, _leg, spr_h_ranger_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_5:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_samurai_tent_idle_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_samurai_tent_idle_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_samurai_tent_idle_hair, spr_h_samurai_tent_idle_head, spr_h_samurai_tent_idle_breast, spr_h_samurai_hand, _leg, spr_h_samurai_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_samurai_tent_loop_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_samurai_tent_loop_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_samurai_tent_loop_hair, spr_h_samurai_tent_loop_head, spr_h_samurai_tent_loop_breast, spr_h_samurai_hand, _leg, spr_h_samurai_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            switch (arg0.leg)
                            {
                                case UnknownEnum.Value_1:
                                    _leg = spr_h_samurai_tent_birth_leg_v1;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    _leg = spr_h_samurai_tent_birth_leg_v2;
                                    break;
                            }
                            
                            _spr_c_array = [spr_h_samurai_tent_birth_hair, spr_h_samurai_tent_birth_head, spr_h_samurai_tent_birth_breast, spr_h_samurai_hand, _leg, spr_h_samurai_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_7:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_c_array = [-1, spr_h_warrior_tent_idle_head, spr_h_warrior_tent_idle_breast, spr_h_warrior_hand, spr_h_warrior_tent_idle_leg, spr_h_warrior_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_c_array = [-1, spr_h_warrior_tent_loop_head, spr_h_warrior_tent_loop_breast, spr_h_warrior_hand, spr_h_warrior_tent_loop_leg, spr_h_warrior_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_c_array = [-1, spr_h_warrior_tent_birth_head, spr_h_warrior_tent_birth_breast, spr_h_warrior_hand, spr_h_warrior_tent_birth_leg, spr_h_warrior_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_6:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_c_array = [spr_h_mage_tent_idle_hair, spr_h_mage_tent_idle_head, spr_h_mage_tent_idle_breast, -1, spr_h_mage_tent_idle_leg, spr_h_mage_tent_idle_leg_part];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_c_array = [spr_h_mage_tent_loop_hair, spr_h_mage_tent_loop_head, spr_h_mage_tent_loop_breast, -1, spr_h_mage_tent_loop_leg, spr_h_mage_tent_loop_leg_part];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_c_array = [spr_h_mage_tent_birth_hair, spr_h_mage_tent_birth_head, spr_h_mage_tent_birth_breast, -1, spr_h_mage_tent_birth_leg, spr_h_mage_tent_birth_leg_part];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_9:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_cow_tent_idle_head, spr_h_cow_tent_idle_breast, spr_h_cow_hand, spr_h_cow_tent_idle_leg, spr_h_cow_tent_idle_leg_part];
                            _spr_c_array = [-1, spr_h_cow_tent_idle_head, spr_h_cow_tent_idle_breast_c, spr_h_cow_hand_c, spr_h_cow_tent_idle_leg_c, spr_h_cow_tent_idle_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_cow_tent_loop_head, spr_h_cow_tent_loop_breast, spr_h_cow_hand, spr_h_cow_tent_loop_leg, spr_h_cow_tent_loop_leg_part];
                            _spr_c_array = [-1, spr_h_cow_tent_loop_head, spr_h_cow_tent_loop_breast_c, spr_h_cow_hand_c, spr_h_cow_tent_loop_leg_c, spr_h_cow_tent_loop_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_array = [-1, spr_h_cow_tent_birth_head, spr_h_cow_tent_birth_breast, spr_h_cow_hand, spr_h_cow_tent_birth_leg, spr_h_cow_tent_birth_leg_part];
                            _spr_c_array = [-1, spr_h_cow_tent_birth_head, spr_h_cow_tent_birth_breast_c, spr_h_cow_hand_c, spr_h_cow_tent_birth_leg_c, spr_h_cow_tent_birth_leg_part_c];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_10:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_nyx_tent_idle_head, spr_h_nyx_tent_idle_breast, spr_h_nyx_hand, spr_h_nyx_tent_idle_leg, spr_h_nyx_tent_idle_leg_part];
                            _spr_c_array = [-1, spr_h_nyx_tent_idle_head, spr_h_nyx_tent_idle_breast_c, spr_h_nyx_hand_c, spr_h_nyx_tent_idle_leg_c, spr_h_nyx_tent_idle_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_nyx_tent_loop_head, spr_h_nyx_tent_loop_breast, spr_h_nyx_hand, spr_h_nyx_tent_loop_leg, spr_h_nyx_tent_loop_leg_part];
                            _spr_c_array = [-1, spr_h_nyx_tent_loop_head, spr_h_nyx_tent_loop_breast_c, spr_h_nyx_hand_c, spr_h_nyx_tent_loop_leg_c, spr_h_nyx_tent_loop_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_array = [-1, spr_h_nyx_tent_birth_head, spr_h_nyx_tent_birth_breast, spr_h_nyx_hand, spr_h_nyx_tent_birth_leg, spr_h_nyx_tent_birth_leg_part];
                            _spr_c_array = [-1, spr_h_nyx_tent_birth_head, spr_h_nyx_tent_birth_breast_c, spr_h_nyx_hand_c, spr_h_nyx_tent_birth_leg_c, spr_h_nyx_tent_birth_leg_part_c];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_12:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_morrigan_tent_idle_head, spr_h_morrigan_tent_idle_breast, spr_h_morrigan_hand, spr_h_morrigan_tent_idle_leg, spr_h_morrigan_tent_idle_leg_part];
                            _spr_c_array = [-1, spr_h_morrigan_tent_idle_head, spr_h_morrigan_tent_idle_breast_c, spr_h_morrigan_hand_c, spr_h_morrigan_tent_idle_leg_c, spr_h_morrigan_tent_idle_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_morrigan_tent_loop_head, spr_h_morrigan_tent_loop_breast, spr_h_morrigan_hand, spr_h_morrigan_tent_loop_leg, spr_h_morrigan_tent_loop_leg_part];
                            _spr_c_array = [-1, spr_h_morrigan_tent_loop_head, spr_h_morrigan_tent_loop_breast_c, spr_h_morrigan_hand_c, spr_h_morrigan_tent_loop_leg_c, spr_h_morrigan_tent_loop_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_array = [-1, spr_h_morrigan_tent_birth_head, spr_h_morrigan_tent_birth_breast, spr_h_morrigan_hand, spr_h_morrigan_tent_birth_leg, spr_h_morrigan_tent_birth_leg_part];
                            _spr_c_array = [-1, spr_h_morrigan_tent_birth_head, spr_h_morrigan_tent_birth_breast_c, spr_h_morrigan_hand_c, spr_h_morrigan_tent_birth_leg_c, spr_h_morrigan_tent_birth_leg_part_c];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_13:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_cat_tent_idle_head, spr_h_cat_tent_idle_breast, spr_h_cat_hand, spr_h_cat_tent_idle_leg, spr_h_cat_tent_idle_leg_part];
                            _spr_c_array = [-1, spr_h_cat_tent_idle_head, spr_h_cat_tent_idle_breast_c, spr_h_cat_hand_c, spr_h_cat_tent_idle_leg_c, spr_h_cat_tent_idle_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_cat_tent_loop_head, spr_h_cat_tent_loop_breast, spr_h_cat_hand, spr_h_cat_tent_loop_leg, spr_h_cat_tent_loop_leg_part];
                            _spr_c_array = [-1, spr_h_cat_tent_loop_head, spr_h_cat_tent_loop_breast_c, spr_h_cat_hand_c, spr_h_cat_tent_loop_leg_c, spr_h_cat_tent_loop_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_array = [-1, spr_h_cat_tent_birth_head, spr_h_cat_tent_birth_breast, spr_h_cat_hand, spr_h_cat_tent_birth_leg, spr_h_cat_tent_birth_leg_part];
                            _spr_c_array = [-1, spr_h_cat_tent_birth_head, spr_h_cat_tent_birth_breast_c, spr_h_cat_hand_c, spr_h_cat_tent_birth_leg_c, spr_h_cat_tent_birth_leg_part_c];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_8:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_lilith_tent_idle_head, spr_h_lilith_tent_idle_breast, spr_h_lilith_hand, spr_h_lilith_tent_idle_leg, spr_h_lilith_tent_idle_leg_part];
                            _spr_c_array = [-1, spr_h_lilith_tent_idle_head, spr_h_lilith_tent_idle_breast_c, spr_h_lilith_hand_c, spr_h_lilith_tent_idle_leg_c, spr_h_lilith_tent_idle_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_lilith_tent_loop_head, spr_h_lilith_tent_loop_breast, spr_h_lilith_hand, spr_h_lilith_tent_loop_leg, spr_h_lilith_tent_loop_leg_part];
                            _spr_c_array = [-1, spr_h_lilith_tent_loop_head, spr_h_lilith_tent_loop_breast_c, spr_h_lilith_hand_c, spr_h_lilith_tent_loop_leg_c, spr_h_lilith_tent_loop_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_array = [-1, spr_h_lilith_tent_birth_head, spr_h_lilith_tent_birth_breast, spr_h_lilith_hand, spr_h_lilith_tent_birth_leg, spr_h_lilith_tent_birth_leg_part];
                            _spr_c_array = [-1, spr_h_lilith_tent_birth_head, spr_h_lilith_tent_birth_breast_c, spr_h_lilith_hand_c, spr_h_lilith_tent_birth_leg_c, spr_h_lilith_tent_birth_leg_part_c];
                            break;
                    }
                    
                    break;
                
                case UnknownEnum.Value_14:
                    switch (arg1)
                    {
                        case UnknownEnum.Value_1:
                            _spr_array = [-1, spr_h_frieren_tent_idle_head, spr_h_frieren_tent_idle_breast, spr_h_frieren_hand, spr_h_frieren_tent_idle_leg, spr_h_frieren_tent_idle_leg_part];
                            _spr_c_array = [-1, spr_h_frieren_tent_idle_head, spr_h_frieren_tent_idle_breast_c, spr_h_frieren_hand, spr_h_frieren_tent_idle_leg_c, spr_h_frieren_tent_idle_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_2:
                            _spr_array = [-1, spr_h_frieren_tent_loop_head, spr_h_frieren_tent_loop_breast, spr_h_frieren_hand, spr_h_frieren_tent_loop_leg, spr_h_frieren_tent_loop_leg_part];
                            _spr_c_array = [-1, spr_h_frieren_tent_loop_head, spr_h_frieren_tent_loop_breast_c, spr_h_frieren_hand, spr_h_frieren_tent_loop_leg_c, spr_h_frieren_tent_loop_leg_part_c];
                            break;
                        
                        case UnknownEnum.Value_4:
                            _spr_array = [-1, spr_h_frieren_tent_birth_head, spr_h_frieren_tent_birth_breast, spr_h_frieren_hand, spr_h_frieren_tent_birth_leg, spr_h_frieren_tent_birth_leg_part];
                            _spr_c_array = [-1, spr_h_frieren_tent_birth_head, spr_h_frieren_tent_birth_breast_c, spr_h_frieren_hand, spr_h_frieren_tent_birth_leg_c, spr_h_frieren_tent_birth_leg_part_c];
                            break;
                    }
                    
                    break;
            }
            
            break;
    }
    
    var _spr = [_spr_array, _spr_c_array];
    return _spr;
}

function scr_set_unit_stat_data(arg0, arg1)
{
    var _info = {};
    _info.scr_unit = -1;
    _info.hair = -1;
    _info.skin = irandom_range(0, 2);
    _info.breast = -1;
    _info.leg = choose(UnknownEnum.Value_1, UnknownEnum.Value_2);
    
    switch (arg1)
    {
        case 0:
            _info.preg_c = irandom_range(4, 5);
            break;
        
        case 1:
            _info.preg_c = irandom_range(5, 6);
            break;
        
        case 2:
            _info.preg_c = irandom_range(6, 7);
            break;
        
        case 3:
            _info.preg_c = irandom_range(7, 8);
            break;
        
        case 4:
            _info.preg_c = irandom_range(8, 9);
            break;
    }
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            _info.class_name = "PEASANT";
            _info.hair = irandom_range(0, 2);
            break;
        
        case UnknownEnum.Value_1:
            _info.class_name = "CLERIC";
            break;
        
        case UnknownEnum.Value_2:
            _info.class_name = "KNIGHT";
            _info.hair = irandom_range(0, 2);
            break;
        
        case UnknownEnum.Value_3:
            _info.class_name = "RANGER";
            break;
        
        case UnknownEnum.Value_4:
            _info.class_name = "NUN";
            break;
        
        case UnknownEnum.Value_5:
            _info.class_name = "SAMURAI";
            _info.hair = irandom_range(0, 2);
            break;
        
        case UnknownEnum.Value_6:
            _info.leg = UnknownEnum.Value_0;
            _info.class_name = "SHAMAN";
            _info.hair = irandom_range(0, 2);
            break;
        
        case UnknownEnum.Value_7:
            _info.leg = UnknownEnum.Value_0;
            _info.class_name = "WARRIOR";
            break;
        
        case UnknownEnum.Value_9:
            _info.class_name = "HATHOR";
            _info.skin = -1;
            _info.scr_unit = UnknownEnum.Value_0;
            _info.leg = UnknownEnum.Value_2;
            
            if (arg1 == 7)
                _info.preg_c = 10;
            else
                _info.preg_c = 15;
            
            break;
        
        case UnknownEnum.Value_10:
            _info.class_name = "NYX";
            _info.skin = -1;
            
            if (arg1 == 7)
                _info.preg_c = 10;
            else
                _info.preg_c = -1;
            
            _info.leg = UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_11:
            _info.class_name = "SELENE";
            _info.skin = -1;
            
            if (arg1 == 7)
            {
                _info.preg_c = 10;
            }
            else
            {
                _info.preg_c = 10;
                _info.scr_unit = UnknownEnum.Value_1;
            }
            
            break;
        
        case UnknownEnum.Value_12:
            _info.class_name = "MORRIGAN";
            _info.skin = -1;
            
            if (arg1 == 7)
                _info.preg_c = 8;
            else
                _info.preg_c = 16;
            
            _info.leg = UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_13:
            _info.class_name = "BASTET";
            _info.skin = -1;
            
            if (arg1 == 7)
                _info.preg_c = 5;
            else
                _info.preg_c = 12;
            
            _info.leg = UnknownEnum.Value_0;
            break;
        
        case UnknownEnum.Value_8:
            _info.class_name = "LILITH";
            _info.skin = -1;
            
            if (arg1 == 7)
                _info.preg_c = 6;
            else
                _info.preg_c = 666;
            
            _info.leg = UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_14:
            _info.class_name = "FRIEREN";
            _info.skin = -1;
            
            if (arg1 == 7)
                _info.preg_c = 10;
            else
                _info.preg_c = -1;
            
            _info.leg = UnknownEnum.Value_2;
            break;
    }
    
    return _info;
}

function scr_set_patrol_spr_data(arg0)
{
    var _base = -1;
    var _head = -1;
    var _hand = -1;
    var _hair = -1;
    var _leg = arg0.leg;
    var _skin = arg0.skin;
    var _hair_c = arg0.hair;
    
    switch (_leg)
    {
        case UnknownEnum.Value_1:
            _base = spr_ogre_carry_base;
            _hand = spr_ogre_carry_hand;
            break;
        
        case UnknownEnum.Value_2:
            _base = spr_ogre_carry_base;
            _hand = spr_ogre_carry_hand;
            break;
        
        case UnknownEnum.Value_0:
            _base = spr_ogre_carry_base_v3;
            _hand = spr_ogre_carry_hand_v3;
            break;
    }
    
    switch (arg0.class)
    {
        case UnknownEnum.Value_0:
            _head = spr_ogre_carry_head_peasant;
            _hair = spr_ogre_carry_hair_peasant;
            break;
        
        case UnknownEnum.Value_4:
            _head = spr_ogre_carry_head_nun;
            break;
        
        case UnknownEnum.Value_2:
            _head = spr_ogre_carry_head_knight;
            _hair = spr_ogre_carry_hair_knight;
            break;
        
        case UnknownEnum.Value_1:
            _head = spr_ogre_carry_head_cleric;
            break;
        
        case UnknownEnum.Value_3:
            _head = spr_ogre_carry_head_ranger;
            break;
        
        case UnknownEnum.Value_5:
            _head = spr_ogre_carry_head_samurai;
            _hair = spr_ogre_carry_hair_samurai;
            break;
        
        case UnknownEnum.Value_7:
            _head = spr_ogre_carry_head_warrior;
            break;
        
        case UnknownEnum.Value_6:
            _head = spr_ogre_carry_head_mage;
            _hair = spr_ogre_carry_hair_mage;
            break;
        
        case UnknownEnum.Value_8:
            _base = spr_ogre_carry_base_lilith;
            _hand = -1;
            _skin = 0;
            break;
        
        case UnknownEnum.Value_9:
            _base = spr_ogre_carry_base_cow;
            _hand = spr_ogre_carry_hand;
            _skin = 0;
            break;
        
        case UnknownEnum.Value_10:
            _base = spr_ogre_carry_base_nyx;
            _hand = -1;
            _skin = 0;
            break;
        
        case UnknownEnum.Value_12:
            _base = spr_ogre_carry_base_morrigan;
            _head = -1;
            _hand = -1;
            _skin = 0;
            break;
        
        case UnknownEnum.Value_13:
            _base = spr_ogre_carry_base_cat;
            _head = -1;
            _hand = -1;
            _skin = 0;
            break;
        
        case UnknownEnum.Value_14:
            _base = spr_ogre_carry_base_frieren;
            _hand = -1;
            _skin = 0;
            break;
    }
    
    var _spr_data = 
    {
        base: _base,
        head: _head,
        hand: _hand,
        hair: _hair,
        skin: _skin,
        hair_c: _hair_c
    };
    return _spr_data;
}

function scr_set_unit_ap(arg0, arg1)
{
    arg1 += 0;
    var _fap = 0;
    var _bap = 0;
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            _fap = arg1;
            break;
        
        case UnknownEnum.Value_4:
            _bap = arg1 * 2;
            break;
        
        case UnknownEnum.Value_2:
            _fap = arg1 * 3;
            _bap = arg1;
            break;
        
        case UnknownEnum.Value_6:
            _fap = arg1;
            _bap = arg1 * 2;
            break;
        
        case UnknownEnum.Value_7:
            _fap = arg1 * 5;
            break;
        
        case UnknownEnum.Value_1:
            _fap = arg1;
            _bap = arg1 * 4;
            break;
        
        case UnknownEnum.Value_3:
            _fap = arg1 * 2;
            _bap = arg1 * 5;
            break;
        
        case UnknownEnum.Value_5:
            _fap = arg1 * 6;
            _bap = arg1 * 2;
            break;
        
        case UnknownEnum.Value_9:
            _fap = 15;
            _bap = 10;
            break;
        
        case UnknownEnum.Value_10:
            _fap = 20;
            _bap = 30;
            break;
        
        case UnknownEnum.Value_11:
            _fap = 45;
            _bap = 45;
            break;
        
        case UnknownEnum.Value_12:
            _fap = 75;
            _bap = 75;
            break;
        
        case UnknownEnum.Value_8:
            _fap = 0;
            _bap = 0;
            break;
        
        case UnknownEnum.Value_14:
            _fap = 500;
            _bap = 500;
            break;
    }
    
    return [_fap, _bap];
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
    Value_36 = 36,
    Value_38 = 38,
    Value_39
}
