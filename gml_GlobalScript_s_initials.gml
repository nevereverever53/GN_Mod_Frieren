function scr_create_initials()
{
    randomize();
    global.val = {};
    global.val.sfx_vol = 0.5;
    global.val.bgm_vol = 0.5;
    global.val.money = 0;
    global.val.food = 0;
    global.val.play_time = 0;
    global.val.day_timer = 0;
    global.val.day = 1;
    global.val.floor = 0;
    global.val.mood = 80;
    global.val.mood_red = 0;
    global.val.camera_click = 2;
    global.val.select_click = 1;
    global.val.show_head = false;
    global.val.stage_info = [-1, -1, -1, -1, -1];
    global.val.stage_lvl_sel = [0, 0, 0, 0, 0];
    global.val.cage = [-1];
    global.val.quest_new = false;
    global.val.quest_clear = false;
    global.val.troop_size = 0;
    global.val.cart_spd = 1;
    global.val.add_range = 0;
    global.val.orb_num = 4;
    global.val.elf_num = 0;
    global.val.raid_num = 0;
    global.val.birth_num = 0;
    global.val.cap_num = 0;
    global.val.alpha_type = UnknownEnum.Value_0;
    global.val.mon_alpha = 1;
    global.val.crate_alpha_type = UnknownEnum.Value_0;
    global.val.crate_alpha = 1;
    global.val.ui_place = false;
    global.val.t_lvl = 0;
    global.val.old_t_lvl = 0;
    global.val.ct_lvl = 0;
    global.val.demo = 0;
    global.val.version = 1.32;
    global.val.language = UnknownEnum.Value_0;
    global.val.f_count = 0;
    global.val.latest_over_diff = 0;
    global.val.goblin = 
    {
        num: [0, -1, -1, -1],
        stat: [1, 1, 2, 3],
        lvl: [0, 0, 0, 0],
        expe: [0, 0, 0, 0],
        skill_lvl: [0, 0, 0, 0],
        skill_exp: [0, 0, 0, 0]
    };
    global.val.hobgoblin = 
    {
        num: [-1, -1, -1, -1],
        stat: [4, 5, 4, 5],
        lvl: [0, 0, 0, 0],
        expe: [0, 0, 0, 0],
        skill_lvl: [0, 0, 0, 0],
        skill_exp: [0, 0, 0, 0]
    };
    global.val.tentacle = 
    {
        num: [-1, -1, -1, -1],
        stat: [3, 3, 4, 4],
        lvl: [0, 0, 0, 0],
        expe: [0, 0, 0, 0],
        skill_lvl: [0, 0, 0, 0],
        skill_exp: [0, 0, 0, 0]
    };
    global.val.ogre = 
    {
        num: [-1, -1, -1, -1],
        stat: [6, 6, 7, 7],
        lvl: [0, 0, 0, 0],
        expe: [0, 0, 0, 0],
        skill_lvl: [0, 0, 0, 0],
        skill_exp: [0, 0, 0, 0]
    };
    global.val.mon_num = [0, -1, -1, -1];
    global.val.nest_num = [5, 0, 0, 0, 0];
    global.unlock = 
    {
        breed: [],
        utility: [],
        pleasure: [],
        b_breed: [],
        b_utility: [],
        b_other: [],
        t_breed: [],
        t_utility: [],
        edit_between: [],
        edit_top: [],
        edit_mid: [],
        edit_bot: [],
        entrance: false,
        raid: false,
        unit: false,
        timer: false,
        boss: [-1, -1, -1, -1, -1, -1, -1]
    };
    global.val.br_unlock = [[[-1, -1], [-1, -1], [-1, -1], [-1, -1]], [[-1, -1], [-1, -1], [-1, -1], [-1, -1]], [[-1, -1], [-1, -1], [-1, -1], [-1, -1]], [[-1, -1], [-1, -1], [-1, -1], [-1, -1]]];
    global.val.guide_unlock = 
    {
        num: 0,
        cell: []
    };
    global.unit_list = ds_list_create();
    global.front_row = ds_list_create();
    global.back_row = ds_list_create();
    global.new_button_list = ds_list_create();
    global.noti_list = ds_list_create();
    global.inv_list = ds_list_create();
    global.raid_inv_list = ds_list_create();
    global.quest_list = ds_list_create();
    global.new_guide_list = ds_list_create();
    global.front_row_save = ds_list_create();
    global.back_row_save = ds_list_create();
    
    for (var i = 0; i < 5; i++)
        ds_list_add(global.unit_list, -1);
    
    scr_set_encounter_reward();
    scr_set_shop_list();
    global.load_file = -1;
    global.mask_collision = false;
    global.dirt_fix = 0;
    global.death_fix = 0;
    global.trans_lock = false;
    global.camera_lock = false;
    global.click_lock = false;
    global.drag_lock = false;
    global.speed_lock = false;
    global.speed_save = false;
    global.build_side = false;
    global.w_spd = 1;
    global.zoom_target = 0;
    global.muffle = 1;
    global.breed_order = [UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_13, UnknownEnum.Value_14];
    global.utility_order = [UnknownEnum.Value_5, UnknownEnum.Value_12, UnknownEnum.Value_4, UnknownEnum.Value_10, UnknownEnum.Value_11];
    global.pleasure_order = [UnknownEnum.Value_3, UnknownEnum.Value_6, UnknownEnum.Value_15];
    global.b_breed_order = [UnknownEnum.Value_19, UnknownEnum.Value_18, UnknownEnum.Value_23, UnknownEnum.Value_20, UnknownEnum.Value_21, UnknownEnum.Value_22];
    global.b_utility_order = [UnknownEnum.Value_17, UnknownEnum.Value_24, UnknownEnum.Value_25];
    global.b_pleasure_order = [UnknownEnum.Value_36, UnknownEnum.Value_37, UnknownEnum.Value_38, UnknownEnum.Value_42, UnknownEnum.Value_41, UnknownEnum.Value_40, UnknownEnum.Value_39];
    global.t_breed_order = [UnknownEnum.Value_31, UnknownEnum.Value_32, UnknownEnum.Value_29, UnknownEnum.Value_27, UnknownEnum.Value_28];
    global.t_utility_order = [UnknownEnum.Value_34, UnknownEnum.Value_30, UnknownEnum.Value_33];
    global.between_order = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4];
    global.prop_order_top = [UnknownEnum.Value_37, UnknownEnum.Value_9, UnknownEnum.Value_13, UnknownEnum.Value_19, UnknownEnum.Value_24, UnknownEnum.Value_28, UnknownEnum.Value_6, UnknownEnum.Value_15, UnknownEnum.Value_16, UnknownEnum.Value_47];
    global.prop_order_mid = [UnknownEnum.Value_10, UnknownEnum.Value_7, UnknownEnum.Value_14, UnknownEnum.Value_17, UnknownEnum.Value_8, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_36, UnknownEnum.Value_21, UnknownEnum.Value_27];
    global.prop_order_bot = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_20, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_18, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_25, UnknownEnum.Value_29, UnknownEnum.Value_32, UnknownEnum.Value_33, UnknownEnum.Value_34, UnknownEnum.Value_35, UnknownEnum.Value_26, UnknownEnum.Value_38];
    global.guide_order_cell = [UnknownEnum.Value_10, UnknownEnum.Value_12, UnknownEnum.Value_11, UnknownEnum.Value_17, UnknownEnum.Value_33, UnknownEnum.Value_30, UnknownEnum.Value_24, UnknownEnum.Value_25, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_40, UnknownEnum.Value_39];
    global.base_raid_time = [2760, 3240, 4000, 5100, 4800];
    var _goblin_alpha_c = make_color_rgb(35, 101, 0);
    var _hobgoblin_alpha_c = make_color_rgb(11, 105, 183);
    var _ogre_alpha_c = make_color_rgb(127, 105, 52);
    global.mon_alpha_c = [_goblin_alpha_c, _hobgoblin_alpha_c, -1, _ogre_alpha_c];
    var _start_x = -1;
    global.slot_x = [];
    global.slot_list = [];
    global.slot_x[0] = _start_x;
    global.slot_list[0] = ds_list_create();
    var _c_1 = make_color_rgb(153, 0, 38);
    var _c_2 = make_color_rgb(216, 42, 13);
    var _c_3 = make_color_rgb(222, 161, 0);
    var _c_4 = make_color_rgb(1, 221, 0);
    global.mood_c = [_c_1, _c_2, _c_3, _c_4];
    global.max_exp = [50, 100, 150, 200, 250, 1];
    global.max_troop = [10, 25, 50, 90, 150, 220, 320, -1];
    global.bar_c = make_color_rgb(219, 173, 40);
    scr_set_mon_skill();
    scr_set_mon_range();
    scr_stage_raid_reward();
    scr_set_trade_list();
    draw_set_font(fnt_base_font_eng);
    display_set_gui_size(480, 270);
    window_set_cursor(cr_none);
    
    if (room == rm_init)
        room_goto(rm_logo);
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
    Value_17,
    Value_18,
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
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_47 = 47
}
