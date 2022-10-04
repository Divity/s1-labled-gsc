/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: animset.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 56
 * Decompile Time: 2546 ms
 * Timestamp: 4/20/2022 8:19:58 PM
*******************************************************************/

//Function Number: 1
func_4C73()
{
	if(isdefined(level.var_CCA))
	{
		return;
	}

	anim.var_CCA = [];
	level.var_CCA["soldier"] = [];
	animscripts\cover_left::func_4C7A();
	animscripts\cover_right::func_4C7D();
	animscripts\cover_prone::func_4C7C();
	animscripts\cover_multi::func_4C7B();
	animscripts\cover_wall::func_4C7E();
	animscripts\reactions::func_4C9F();
	animscripts\pain::func_4C9C();
	animscripts\death::func_4C83();
	animscripts\combat::func_4C77();
	animscripts\move::func_4C85();
	animscripts\move::func_4CA9();
	animscripts\flashed::func_4C88();
	animscripts\stop::func_4C8C();
	animscripts\melee::func_4C9B();
	anim.var_C81 = spawnstruct();
	level.var_C81.move = [];
	func_4C87();
	func_4C80();
	func_4C9E();
	func_4CA1();
	func_4CA5();
	func_4C8B();
	func_4CAA();
	func_4CAC();
	func_4C84();
	func_4CA0();
	func_4CA4();
	func_4CA7();
	func_4C86();
	func_4CA2();
	func_4CAE();
	func_4C7F();
	func_4C8A();
	func_4CAD();
	func_4CAB();
	func_4C9D();
	func_4D19();
	func_4CE5();
	func_4C89();
	func_4CF2();
	func_4CA3();
	func_4C76();
	func_4CA6();
	func_4CA8();
	if(lib_A59A::func_76FC())
	{
		level.var_CCA["s1_soldier"] = [];
		animscripts\s1_common_anims::func_4D48();
		animscripts\s1_common_anims::func_4D40();
		animscripts\s1_common_anims::func_4D44();
		animscripts\s1_common_anims::func_4D42();
		animscripts\s1_common_anims::func_4D3E();
		animscripts\s1_common_anims::func_4D3B();
		animscripts\s1_common_anims::func_4D3C();
		animscripts\s1_common_anims::func_4D3D();
		animscripts\s1_common_anims::func_4D46();
		animscripts\s1_common_anims::func_4D4C();
		animscripts\s1_common_anims::func_4D47();
		animscripts\s1_common_anims::func_4D45();
		animscripts\s1_common_anims::func_4D3F();
		animscripts\s1_common_anims::func_4D43();
		animscripts\s1_common_anims::func_4D49();
		animscripts\s1_common_anims::func_4D41();
		animscripts\s1_common_anims::func_4D3A();
		animscripts\s1_common_anims::func_4D4B();
		animscripts\s1_common_anims::func_4D4A();
		level.var_CCA["s1_soldier"]["old_default_stand"] = level.var_CCA["soldier"]["default_stand"];
	}
}

//Function Number: 2
func_72EA(param_00,param_01,param_02)
{
	func_4C73();
	level.var_CCA[param_00] = param_01;
	if(isdefined(param_01["flashed"]))
	{
		level.var_38A2[param_00] = 0;
	}

	if(isdefined(param_02) && param_02)
	{
		animscripts\init_move_transitions::func_40DF(param_00);
	}
}

//Function Number: 3
func_0CC9(param_00)
{
	return isdefined(level.var_CCA[param_00]);
}

//Function Number: 4
func_4CA2()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %sprint_loop_distant;
	level.var_4D85["sprint_short"] = %sprint1_loop;
	level.var_4D85["prone"] = %prone_crawl;
	level.var_4D85["straight"] = %run_lowready_f;
	level.var_4D85["smg_straight"] = %smg_run_lowready_f;
	level.var_4D85["straight_twitch"] = [%run_twitch_guncheck,%run_twitch_aim_straight,%run_twitch_aim_above,%run_twitch_lookbehind_a,%run_twitch_lookbehind_b];
	level.var_4D85["move_f"] = %walk_forward;
	level.var_4D85["move_l"] = %walk_left;
	level.var_4D85["move_r"] = %walk_right;
	level.var_4D85["move_b"] = %walk_backward;
	level.var_4D85["crouch"] = %crouch_fastwalk_f;
	level.var_4D85["crouch_l"] = %crouch_fastwalk_l;
	level.var_4D85["crouch_r"] = %crouch_fastwalk_r;
	level.var_4D85["crouch_b"] = %crouch_fastwalk_b;
	level.var_4D85["stairs_up"] = %run_stairs_up;
	level.var_4D85["stairs_up_in"] = %run_stairs_up_in;
	level.var_4D85["stairs_up_out"] = %run_stairs_up_out;
	level.var_4D85["stairs_down"] = %traverse_stair_run_down;
	level.var_4D85["reload"] = [%run_reload_a,%run_reload_b];
	level.var_CCA["soldier"]["run"] = level.var_4D85;
}

//Function Number: 5
func_4CAB()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %lag_unstable_run;
	level.var_4D85["sprint_short"] = %lag_unstable_run;
	level.var_4D85["straight"] = %lag_unstable_run;
	level.var_4D85["straight_twitch"] = [%lag_unstable_run];
	level.var_4D85["move_f"] = %walk_cqb_f;
	level.var_4D85["move_l"] = %walk_left;
	level.var_4D85["move_r"] = %walk_right;
	level.var_4D85["move_b"] = %walk_backward;
	level.var_4D85["aim_2"] = %cqb_run_aim_2;
	level.var_4D85["aim_4"] = %cqb_run_aim_4;
	level.var_4D85["aim_5"] = %cqb_run_aim_5;
	level.var_4D85["aim_6"] = %cqb_run_aim_6;
	level.var_4D85["aim_8"] = %cqb_run_aim_8;
	level.var_4D85["stairs_up"] = %traverse_stair_run;
	level.var_4D85["stairs_down_in"] = %cqb_stairs_down_in_m;
	level.var_4D85["stairs_down"] = %cqb_stairs_down;
	level.var_4D85["stairs_down_out"] = %cqb_stairs_down_out_m;
	level.var_4D85["shotgun_pullout"] = %shotgun_cqbrun_pullout;
	level.var_4D85["shotgun_putaway"] = %shotgun_cqbrun_putaway;
	level.var_4D85["reload"] = [%cqb_run_reload_a_iw6,%cqb_run_reload_b_iw6];
	level.var_CCA["soldier"]["unstable_run"] = level.var_4D85;
}

//Function Number: 6
func_4C8A()
{
	anim.var_4D85 = level.var_CCA["soldier"]["run"];
	level.var_4D85["straight"] = %heat_run_loop;
	level.var_CCA["soldier"]["heat_run"] = level.var_4D85;
}

//Function Number: 7
func_4CAE()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %sprint_loop_distant;
	level.var_4D85["sprint_short"] = %sprint1_loop;
	level.var_4D85["prone"] = %prone_crawl;
	level.var_4D85["straight"] = %walk_cqb_f;
	level.var_4D85["move_f"] = %walk_cqb_f;
	level.var_4D85["move_l"] = %walk_left;
	level.var_4D85["move_r"] = %walk_right;
	level.var_4D85["move_b"] = %walk_backward;
	level.var_4D85["crouch"] = %crouch_fastwalk_f;
	level.var_4D85["crouch_l"] = %crouch_fastwalk_l;
	level.var_4D85["crouch_r"] = %crouch_fastwalk_r;
	level.var_4D85["crouch_b"] = %crouch_fastwalk_b;
	level.var_4D85["aim_2"] = %walk_aim_2;
	level.var_4D85["aim_4"] = %walk_aim_4;
	level.var_4D85["aim_6"] = %walk_aim_6;
	level.var_4D85["aim_8"] = %walk_aim_8;
	level.var_4D85["stairs_up"] = %traverse_stair_run;
	level.var_4D85["stairs_down"] = %traverse_stair_run_down_01;
	level.var_CCA["soldier"]["walk"] = level.var_4D85;
}

//Function Number: 8
func_4CAD()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %lag_unstable_run;
	level.var_4D85["sprint_short"] = %lag_unstable_run;
	level.var_4D85["straight"] = %lag_unstable_moveforward_walk;
	level.var_4D85["straight_twitch_l"] = [%lag_unstable_moveforward_stumble_l];
	level.var_4D85["straight_twitch_r"] = [%lag_unstable_moveforward_stumble_r];
	level.var_4D85["straight_twitch"] = [%lag_unstable_moveforward_stumble];
	level.var_4D85["move_f"] = %walk_cqb_f;
	level.var_4D85["move_l"] = %walk_left;
	level.var_4D85["move_r"] = %walk_right;
	level.var_4D85["move_b"] = %walk_backward;
	level.var_4D85["aim_2"] = %cqb_run_aim_2;
	level.var_4D85["aim_4"] = %cqb_run_aim_4;
	level.var_4D85["aim_5"] = %cqb_run_aim_5;
	level.var_4D85["aim_6"] = %cqb_run_aim_6;
	level.var_4D85["aim_8"] = %cqb_run_aim_8;
	level.var_4D85["stairs_up"] = %traverse_stair_run;
	level.var_4D85["stairs_down_in"] = %cqb_stairs_down_in_m;
	level.var_4D85["stairs_down"] = %cqb_stairs_down;
	level.var_4D85["stairs_down_out"] = %cqb_stairs_down_out_m;
	level.var_4D85["shotgun_pullout"] = %shotgun_cqbrun_pullout;
	level.var_4D85["shotgun_putaway"] = %shotgun_cqbrun_putaway;
	level.var_4D85["reload"] = [%cqb_run_reload_a_iw6,%cqb_run_reload_b_iw6];
	level.var_CCA["soldier"]["unstable_walk"] = level.var_4D85;
}

//Function Number: 9
func_4C7F()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %sprint_loop_distant;
	level.var_4D85["sprint_short"] = %sprint1_loop;
	level.var_4D85["straight"] = %run_cqb_f_search_v1;
	level.var_4D85["straight_twitch"] = [%cqb_run_twitch_a_iw6,%cqb_run_twitch_b_iw6,%cqb_run_twitch_c_iw6,%cqb_run_twitch_d_iw6];
	level.var_4D85["move_f"] = %walk_cqb_f;
	level.var_4D85["move_l"] = %walk_left;
	level.var_4D85["move_r"] = %walk_right;
	level.var_4D85["move_b"] = %walk_backward;
	level.var_4D85["aim_2"] = %cqb_run_aim_2;
	level.var_4D85["aim_4"] = %cqb_run_aim_4;
	level.var_4D85["aim_5"] = %cqb_run_aim_5;
	level.var_4D85["aim_6"] = %cqb_run_aim_6;
	level.var_4D85["aim_8"] = %cqb_run_aim_8;
	level.var_4D85["stairs_up"] = %traverse_stair_run;
	level.var_4D85["stairs_down_in"] = %cqb_stairs_down_in_m;
	level.var_4D85["stairs_down"] = %cqb_stairs_down;
	level.var_4D85["stairs_down_out"] = %cqb_stairs_down_out_m;
	level.var_4D85["shotgun_pullout"] = %shotgun_cqbrun_pullout;
	level.var_4D85["shotgun_putaway"] = %shotgun_cqbrun_putaway;
	level.var_4D85["reload"] = [%cqb_run_reload_a_iw6,%cqb_run_reload_b_iw6];
	level.var_CCA["soldier"]["cqb"] = level.var_4D85;
}

//Function Number: 10
func_4C9D()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %pistol_sprint;
	level.var_4D85["sprint_short"] = %pistol_sprint;
	level.var_4D85["straight"] = %pistol_walk;
	level.var_4D85["move_f"] = %pistol_walk;
	level.var_4D85["move_l"] = %pistol_walk_left;
	level.var_4D85["move_r"] = %pistol_walk_right;
	level.var_4D85["move_b"] = %pistol_walk_back;
	level.var_CCA["soldier"]["pistol_move"] = level.var_4D85;
}

//Function Number: 11
func_4C9E()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %pistol_stand_aim_8_add;
	level.var_4D85["add_aim_down"] = %pistol_stand_aim_2_add;
	level.var_4D85["add_aim_left"] = %pistol_stand_aim_4_add;
	level.var_4D85["add_aim_right"] = %pistol_stand_aim_6_add;
	level.var_4D85["straight_level"] = %pistol_stand_aim_5;
	level.var_4D85["fire"] = %pistol_stand_fire_a;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%pistol_stand_fire_a);
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%pistol_stand_reload_a);
	level.var_4D85["reload_crouchhide"] = [];
	level.var_4D85["exposed_idle"] = [%exposed_idle_alert_v1,%exposed_idle_alert_v2,%exposed_idle_alert_v3];
	func_7DD0();
	level.var_4D85["add_turn_aim_up"] = %pistol_stand_aim_8_alt;
	level.var_4D85["add_turn_aim_down"] = %pistol_stand_aim_2_alt;
	level.var_4D85["add_turn_aim_left"] = %pistol_stand_aim_4_alt;
	level.var_4D85["add_turn_aim_right"] = %pistol_stand_aim_6_alt;
	level.var_CCA["soldier"]["pistol_stand"] = level.var_4D85;
}

//Function Number: 12
func_4CA1()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %rpg_stand_aim_8;
	level.var_4D85["add_aim_down"] = %rpg_stand_aim_2;
	level.var_4D85["add_aim_left"] = %rpg_stand_aim_4;
	level.var_4D85["add_aim_right"] = %rpg_stand_aim_6;
	level.var_4D85["straight_level"] = %rpg_stand_aim_5;
	level.var_4D85["fire"] = %rpg_stand_fire;
	level.var_4D85["single"] = [%exposed_shoot_semi1];
	level.var_4D85["reload"] = [%rpg_stand_reload];
	level.var_4D85["reload_crouchhide"] = [];
	level.var_4D85["exposed_idle"] = [%rpg_stand_idle];
	func_7DCA();
	func_7DCF();
	func_7DBB();
	level.var_CCA["soldier"]["rpg_stand"] = level.var_4D85;
}

//Function Number: 13
func_4CA5()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %shotgun_aim_8;
	level.var_4D85["add_aim_down"] = %shotgun_aim_2;
	level.var_4D85["add_aim_left"] = %shotgun_aim_4;
	level.var_4D85["add_aim_right"] = %shotgun_aim_6;
	level.var_4D85["straight_level"] = %shotgun_aim_5;
	level.var_4D85["fire"] = %exposed_shoot_auto_v3;
	level.var_4D85["single"] = [%shotgun_stand_fire_1a,%shotgun_stand_fire_1b];
	func_7DBD();
	level.var_4D85["exposed_idle"] = [%exposed_idle_alert_v1,%exposed_idle_alert_v2,%exposed_idle_alert_v3];
	level.var_4D85["reload"] = [%shotgun_stand_reload_a,%shotgun_stand_reload_b,%shotgun_stand_reload_c,%shotgun_stand_reload_c,%shotgun_stand_reload_c];
	level.var_4D85["reload_crouchhide"] = [%shotgun_stand_reload_a,%shotgun_stand_reload_b];
	func_7DCA();
	func_7DCF();
	func_7DBB();
	level.var_CCA["soldier"]["shotgun_stand"] = level.var_4D85;
}

//Function Number: 14
func_4CAA()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %smg_exposed_aim_8;
	level.var_4D85["add_aim_down"] = %smg_exposed_aim_2;
	level.var_4D85["add_aim_left"] = %smg_exposed_aim_4;
	level.var_4D85["add_aim_right"] = %smg_exposed_aim_6;
	level.var_4D85["straight_level"] = %smg_exposed_aim_5;
	level.var_4D85["fire"] = %smg_exposed_shoot_auto_v3;
	level.var_4D85["fire_corner"] = %smg_exposed_shoot_auto_v2;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%smg_exposed_shoot_semi1);
	func_7DBD();
	level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(%smg_exposed_idle_alert_v1,%smg_exposed_idle_alert_v2,%smg_exposed_idle_alert_v3);
	level.var_4D85["exposed_grenade"] = animscripts\utility::func_CD8(%smg_exposed_grenadethrowb,%smg_exposed_grenadethrowc);
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%smg_exposed_reload);
	level.var_4D85["reload_crouchhide"] = animscripts\utility::func_CD8(%smg_exposed_reloadb);
	func_7DCB();
	func_7DC9();
	func_7DB9();
	level.var_CCA["soldier"]["smg_stand"] = level.var_4D85;
}

//Function Number: 15
func_4C80()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %cqb_stand_aim8;
	level.var_4D85["add_aim_down"] = %cqb_stand_aim2;
	level.var_4D85["add_aim_left"] = %cqb_stand_aim4;
	level.var_4D85["add_aim_right"] = %cqb_stand_aim6;
	level.var_4D85["straight_level"] = %cqb_stand_aim5;
	level.var_4D85["fire"] = %exposed_shoot_auto_v3;
	level.var_4D85["single"] = [%exposed_shoot_semi1];
	func_7DBD();
	level.var_4D85["exposed_idle"] = [%exposed_idle_alert_v1,%exposed_idle_alert_v2,%exposed_idle_alert_v3];
	level.var_4D85["reload"] = [%cqb_stand_reload_steady];
	level.var_4D85["reload_crouchhide"] = [%cqb_stand_reload_knee];
	func_7DCA();
	func_7DCF();
	func_7DBB();
	level.var_CCA["soldier"]["cqb_stand"] = level.var_4D85;
}

//Function Number: 16
func_4CAC()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %cqb_stand_aim8;
	level.var_4D85["add_aim_down"] = %cqb_stand_aim2;
	level.var_4D85["add_aim_left"] = %cqb_stand_aim4;
	level.var_4D85["add_aim_right"] = %cqb_stand_aim6;
	level.var_4D85["straight_level"] = %lag_unstable_idle;
	level.var_4D85["fire"] = %exposed_shoot_auto_v3;
	level.var_4D85["single"] = [%exposed_shoot_semi1];
	func_7DBD();
	level.var_4D85["exposed_idle"] = [%lag_unstable_idle];
	level.var_4D85["reload"] = [%cqb_stand_reload_steady];
	level.var_4D85["reload_crouchhide"] = [%cqb_stand_reload_knee];
	func_7DCA();
	func_7DCF();
	func_7DBB();
	level.var_CCA["soldier"]["unstable_stand"] = level.var_4D85;
}

//Function Number: 17
func_4C8B()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %heat_stand_aim_8;
	level.var_4D85["add_aim_down"] = %heat_stand_aim_2;
	level.var_4D85["add_aim_left"] = %heat_stand_aim_4;
	level.var_4D85["add_aim_right"] = %heat_stand_aim_6;
	level.var_4D85["straight_level"] = %heat_stand_aim_5;
	level.var_4D85["fire"] = %heat_stand_fire_auto;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%heat_stand_fire_single);
	func_7DC4(%heat_stand_fire_burst);
	level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(%heat_stand_idle,%heat_stand_scana,%heat_stand_scanb);
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%heat_exposed_reload);
	level.var_4D85["reload_crouchhide"] = animscripts\utility::func_CD8();
	func_7DCA();
	level.var_4D85["turn_left_45"] = %heat_stand_turn_l;
	level.var_4D85["turn_left_90"] = %heat_stand_turn_l;
	level.var_4D85["turn_left_135"] = %heat_stand_turn_180;
	level.var_4D85["turn_left_180"] = %heat_stand_turn_180;
	level.var_4D85["turn_right_45"] = %heat_stand_turn_r;
	level.var_4D85["turn_right_90"] = %heat_stand_turn_r;
	level.var_4D85["turn_right_135"] = %heat_stand_turn_180;
	level.var_4D85["turn_right_180"] = %heat_stand_turn_180;
	func_7DBB();
	level.var_CCA["soldier"]["heat_stand"] = level.var_4D85;
}

//Function Number: 18
func_4C89()
{
	anim.var_4D85 = [];
	level.var_4D85["reload_cover_left"] = %heat_cover_reload_r;
	level.var_4D85["reload_cover_right"] = %heat_cover_reload_l;
	level.var_4D85["reload_default"] = %heat_cover_reload_l;
	level.var_CCA["soldier"]["heat_reload"] = level.var_4D85;
}

//Function Number: 19
func_4C87()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %exposed_aim_8;
	level.var_4D85["add_aim_down"] = %exposed_aim_2;
	level.var_4D85["add_aim_left"] = %exposed_aim_4;
	level.var_4D85["add_aim_right"] = %exposed_aim_6;
	level.var_4D85["straight_level"] = %exposed_aim_5;
	level.var_4D85["fire"] = %exposed_shoot_auto_v3;
	level.var_4D85["fire_corner"] = %exposed_shoot_auto_v2;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%exposed_shoot_semi1);
	func_7DBD();
	level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(%exposed_idle_alert_v1,%exposed_idle_alert_v2,%exposed_idle_alert_v3);
	level.var_4D85["exposed_grenade"] = animscripts\utility::func_CD8(%exposed_grenadethrowb,%exposed_grenadethrowc);
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%exposed_reload);
	level.var_4D85["reload_crouchhide"] = animscripts\utility::func_CD8(%exposed_reloadb);
	func_7DCA();
	func_7DCF();
	func_7DBB();
	level.var_CCA["soldier"]["default_stand"] = level.var_4D85;
}

//Function Number: 20
func_4C84()
{
	anim.var_4D85 = [];
	func_7DBE();
	level.var_4D85["fire"] = %exposed_crouch_shoot_auto_v2;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%exposed_crouch_shoot_semi1);
	func_7DBC();
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%exposed_crouch_reload);
	level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(%exposed_crouch_idle_alert_v1,%exposed_crouch_idle_alert_v2,%exposed_crouch_idle_alert_v3);
	func_7DCA();
	func_7DC2();
	func_7DBA();
	level.var_CCA["soldier"]["default_crouch"] = level.var_4D85;
}

//Function Number: 21
func_4CA0()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %rpg_crouch_aim_8;
	level.var_4D85["add_aim_down"] = %rpg_crouch_aim_2;
	level.var_4D85["add_aim_left"] = %rpg_crouch_aim_4;
	level.var_4D85["add_aim_right"] = %rpg_crouch_aim_6;
	level.var_4D85["straight_level"] = %rpg_crouch_aim_5;
	level.var_4D85["fire"] = %rpg_crouch_fire;
	level.var_4D85["single"] = [%rpg_crouch_fire];
	level.var_4D85["reload"] = [%rpg_crouch_reload];
	level.var_4D85["exposed_idle"] = [%rpg_crouch_idle];
	func_7DCA();
	func_7DC2();
	func_7DBA();
	level.var_CCA["soldier"]["rpg_crouch"] = level.var_4D85;
}

//Function Number: 22
func_4CA4()
{
	anim.var_4D85 = [];
	func_7DBE();
	level.var_4D85["fire"] = %exposed_crouch_shoot_auto_v2;
	level.var_4D85["single"] = [%shotgun_crouch_fire];
	func_7DBC();
	level.var_4D85["reload"] = [%shotgun_crouch_reload];
	level.var_4D85["exposed_idle"] = [%exposed_crouch_idle_alert_v1,%exposed_crouch_idle_alert_v2,%exposed_crouch_idle_alert_v3];
	func_7DCA();
	func_7DC2();
	func_7DBA();
	level.var_CCA["soldier"]["shotgun_crouch"] = level.var_4D85;
}

//Function Number: 23
func_4CA7()
{
	anim.var_4D85 = [];
	func_7DBE();
	level.var_4D85["fire"] = %exposed_crouch_shoot_auto_v2;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%exposed_crouch_shoot_semi1);
	func_7DBC();
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%exposed_crouch_reload);
	level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(%exposed_crouch_idle_alert_v1,%exposed_crouch_idle_alert_v2,%exposed_crouch_idle_alert_v3);
	func_7DCB();
	func_7DC2();
	func_7DBA();
	level.var_CCA["soldier"]["smg_crouch"] = level.var_4D85;
}

//Function Number: 24
func_4C86()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %prone_aim_8_add;
	level.var_4D85["add_aim_down"] = %prone_aim_2_add;
	level.var_4D85["add_aim_left"] = %prone_aim_4_add;
	level.var_4D85["add_aim_right"] = %prone_aim_6_add;
	level.var_4D85["straight_level"] = %prone_aim_5;
	level.var_4D85["fire"] = %prone_fire_1;
	level.var_4D85["single"] = [%prone_fire_1];
	level.var_4D85["reload"] = [%prone_reload];
	level.var_4D85["burst2"] = %prone_fire_burst;
	level.var_4D85["burst3"] = %prone_fire_burst;
	level.var_4D85["burst4"] = %prone_fire_burst;
	level.var_4D85["burst5"] = %prone_fire_burst;
	level.var_4D85["burst6"] = %prone_fire_burst;
	level.var_4D85["semi2"] = %prone_fire_burst;
	level.var_4D85["semi3"] = %prone_fire_burst;
	level.var_4D85["semi4"] = %prone_fire_burst;
	level.var_4D85["semi5"] = %prone_fire_burst;
	level.var_4D85["exposed_idle"] = [%exposed_crouch_idle_alert_v1,%exposed_crouch_idle_alert_v2,%exposed_crouch_idle_alert_v3];
	func_7DCA();
	level.var_CCA["soldier"]["default_prone"] = level.var_4D85;
}

//Function Number: 25
func_4C79(param_00)
{
	self.var_20B3 = param_00;
}

//Function Number: 26
func_4C82(param_00,param_01,param_02,param_03)
{
	anim.var_4D85 = animscripts\utility::func_5861("default_stand");
	if(isdefined(param_01))
	{
		level.var_4D85["straight_level"] = param_01;
	}

	if(isdefined(param_00))
	{
		level.var_4D85["fire"] = param_00;
		level.var_4D85["single"] = animscripts\utility::func_CD8(param_00);
		func_7DC4(param_00);
	}

	if(isdefined(param_02))
	{
		level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(param_02);
	}

	if(isdefined(param_03))
	{
		level.var_4D85["reload"] = animscripts\utility::func_CD8(param_03);
		level.var_4D85["reload_crouchhide"] = animscripts\utility::func_CD8(param_03);
	}

	self.var_20B3 = level.var_4D85;
}

//Function Number: 27
func_4C81(param_00,param_01,param_02)
{
	anim.var_4D85 = animscripts\utility::func_5861("default_crouch");
	if(isdefined(param_00))
	{
		level.var_4D85["fire"] = param_00;
		level.var_4D85["single"] = animscripts\utility::func_CD8(param_00);
		func_7DC3(param_00);
	}

	if(isdefined(param_01))
	{
		level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(param_01);
	}

	if(isdefined(param_02))
	{
		level.var_4D85["reload"] = animscripts\utility::func_CD8(param_02);
	}

	self.var_20A9 = level.var_4D85;
}

//Function Number: 28
func_4C78(param_00)
{
	self.var_20A9 = param_00;
}

//Function Number: 29
func_1EA8()
{
	self.var_2562 = undefined;
	self.var_255C = undefined;
	self.var_20B3 = undefined;
	self.var_20A9 = undefined;
}

//Function Number: 30
func_7DD0(param_00)
{
	level.var_4D85["turn_left_45"] = %pistol_stand_turn45l;
	level.var_4D85["turn_left_90"] = %pistol_stand_turn90l;
	level.var_4D85["turn_left_135"] = %pistol_stand_turn90l;
	level.var_4D85["turn_left_180"] = %pistol_stand_turn180l;
	level.var_4D85["turn_right_45"] = %pistol_stand_turn45r;
	level.var_4D85["turn_right_90"] = %pistol_stand_turn90r;
	level.var_4D85["turn_right_135"] = %pistol_stand_turn90r;
	level.var_4D85["turn_right_180"] = %pistol_stand_turn180l;
}

//Function Number: 31
func_7DCF()
{
	level.var_4D85["turn_left_45"] = %exposed_tracking_turn45l;
	level.var_4D85["turn_left_90"] = %exposed_tracking_turn90l;
	level.var_4D85["turn_left_135"] = %exposed_tracking_turn135l;
	level.var_4D85["turn_left_180"] = %exposed_tracking_turn180l;
	level.var_4D85["turn_right_45"] = %exposed_tracking_turn45r;
	level.var_4D85["turn_right_90"] = %exposed_tracking_turn90r;
	level.var_4D85["turn_right_135"] = %exposed_tracking_turn135r;
	level.var_4D85["turn_right_180"] = %exposed_tracking_turn180r;
}

//Function Number: 32
func_7DC9()
{
	level.var_4D85["turn_left_45"] = %smg_exposed_tracking_turn45l;
	level.var_4D85["turn_left_90"] = %smg_exposed_tracking_turn90l;
	level.var_4D85["turn_left_135"] = %smg_exposed_tracking_turn135l;
	level.var_4D85["turn_left_180"] = %smg_exposed_tracking_turn180l;
	level.var_4D85["turn_right_45"] = %smg_exposed_tracking_turn45r;
	level.var_4D85["turn_right_90"] = %smg_exposed_tracking_turn90r;
	level.var_4D85["turn_right_135"] = %smg_exposed_tracking_turn135r;
	level.var_4D85["turn_right_180"] = %smg_exposed_tracking_turn180r;
}

//Function Number: 33
func_7DC2()
{
	level.var_4D85["turn_left_45"] = %exposed_crouch_turn_90_left;
	level.var_4D85["turn_left_90"] = %exposed_crouch_turn_90_left;
	level.var_4D85["turn_left_135"] = %exposed_crouch_turn_180_left;
	level.var_4D85["turn_left_180"] = %exposed_crouch_turn_180_left;
	level.var_4D85["turn_right_45"] = %exposed_crouch_turn_90_right;
	level.var_4D85["turn_right_90"] = %exposed_crouch_turn_90_right;
	level.var_4D85["turn_right_135"] = %exposed_crouch_turn_180_right;
	level.var_4D85["turn_right_180"] = %exposed_crouch_turn_180_right;
}

//Function Number: 34
func_7DCA()
{
	level.var_4D85["crouch_2_stand"] = %exposed_crouch_2_stand;
	level.var_4D85["crouch_2_prone"] = %crouch_2_prone;
	level.var_4D85["stand_2_crouch"] = %exposed_stand_2_crouch;
	level.var_4D85["stand_2_prone"] = %stand_2_prone;
	level.var_4D85["prone_2_crouch"] = %prone_2_crouch;
	level.var_4D85["prone_2_stand"] = %prone_2_stand;
}

//Function Number: 35
func_7DCB()
{
	level.var_4D85["crouch_2_stand"] = %smg_exposed_crouch_2_stand;
	level.var_4D85["crouch_2_prone"] = %crouch_2_prone;
	level.var_4D85["stand_2_crouch"] = %smg_exposed_stand_2_crouch;
	level.var_4D85["stand_2_prone"] = %stand_2_prone;
	level.var_4D85["prone_2_crouch"] = %prone_2_crouch;
	level.var_4D85["prone_2_stand"] = %prone_2_stand;
}

//Function Number: 36
func_7DBD()
{
	level.var_4D85["burst2"] = %exposed_shoot_burst3;
	level.var_4D85["burst3"] = %exposed_shoot_burst3;
	level.var_4D85["burst4"] = %exposed_shoot_burst4;
	level.var_4D85["burst5"] = %exposed_shoot_burst5;
	level.var_4D85["burst6"] = %exposed_shoot_burst6;
	level.var_4D85["semi2"] = %exposed_shoot_semi2;
	level.var_4D85["semi3"] = %exposed_shoot_semi3;
	level.var_4D85["semi4"] = %exposed_shoot_semi4;
	level.var_4D85["semi5"] = %exposed_shoot_semi5;
}

//Function Number: 37
func_7DC4(param_00)
{
	level.var_4D85["burst2"] = param_00;
	level.var_4D85["burst3"] = param_00;
	level.var_4D85["burst4"] = param_00;
	level.var_4D85["burst5"] = param_00;
	level.var_4D85["burst6"] = param_00;
	level.var_4D85["semi2"] = param_00;
	level.var_4D85["semi3"] = param_00;
	level.var_4D85["semi4"] = param_00;
	level.var_4D85["semi5"] = param_00;
}

//Function Number: 38
func_7DBC()
{
	level.var_4D85["burst2"] = %exposed_crouch_shoot_burst3;
	level.var_4D85["burst3"] = %exposed_crouch_shoot_burst3;
	level.var_4D85["burst4"] = %exposed_crouch_shoot_burst4;
	level.var_4D85["burst5"] = %exposed_crouch_shoot_burst5;
	level.var_4D85["burst6"] = %exposed_crouch_shoot_burst6;
	level.var_4D85["semi2"] = %exposed_crouch_shoot_semi2;
	level.var_4D85["semi3"] = %exposed_crouch_shoot_semi3;
	level.var_4D85["semi4"] = %exposed_crouch_shoot_semi4;
	level.var_4D85["semi5"] = %exposed_crouch_shoot_semi5;
}

//Function Number: 39
func_7DBE()
{
	level.var_4D85["add_aim_up"] = %exposed_crouch_aim_8;
	level.var_4D85["add_aim_down"] = %exposed_crouch_aim_2;
	level.var_4D85["add_aim_left"] = %exposed_crouch_aim_4;
	level.var_4D85["add_aim_right"] = %exposed_crouch_aim_6;
	level.var_4D85["straight_level"] = %exposed_crouch_aim_5;
}

//Function Number: 40
func_7DC3(param_00)
{
	level.var_4D85["burst2"] = param_00;
	level.var_4D85["burst3"] = param_00;
	level.var_4D85["burst4"] = param_00;
	level.var_4D85["burst5"] = param_00;
	level.var_4D85["burst6"] = param_00;
	level.var_4D85["semi2"] = param_00;
	level.var_4D85["semi3"] = param_00;
	level.var_4D85["semi4"] = param_00;
	level.var_4D85["semi5"] = param_00;
}

//Function Number: 41
func_7DBB()
{
	level.var_4D85["add_turn_aim_up"] = %exposed_turn_aim_8;
	level.var_4D85["add_turn_aim_down"] = %exposed_turn_aim_2;
	level.var_4D85["add_turn_aim_left"] = %exposed_turn_aim_4;
	level.var_4D85["add_turn_aim_right"] = %exposed_turn_aim_6;
}

//Function Number: 42
func_7DB9()
{
	level.var_4D85["add_turn_aim_up"] = %smg_exposed_turn_aim_8;
	level.var_4D85["add_turn_aim_down"] = %smg_exposed_turn_aim_2;
	level.var_4D85["add_turn_aim_left"] = %smg_exposed_turn_aim_4;
	level.var_4D85["add_turn_aim_right"] = %smg_exposed_turn_aim_6;
}

//Function Number: 43
func_7DBA()
{
	level.var_4D85["add_turn_aim_up"] = %exposed_crouch_turn_aim_8;
	level.var_4D85["add_turn_aim_down"] = %exposed_crouch_turn_aim_2;
	level.var_4D85["add_turn_aim_left"] = %exposed_crouch_turn_aim_4;
	level.var_4D85["add_turn_aim_right"] = %exposed_crouch_turn_aim_6;
}

//Function Number: 44
func_7DCC()
{
	if(animscripts\utility::func_9C32() || isdefined(self.var_B0F))
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("pistol_stand");
		return;
	}

	if(isdefined(self.var_20B3))
	{
		self.var_7.var_CD8 = self.var_20B3;
		return;
	}

	if(isdefined(self.var_4792))
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("heat_stand");
		return;
	}

	if(animscripts\utility::func_9C2E())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("rpg_stand");
		return;
	}

	if(animscripts\utility::func_9C33())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("smg_stand");
		return;
	}

	if(isdefined(self.weapon) && animscripts\utility::func_A2C6())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("shotgun_stand");
		return;
	}

	if(animscripts\utility::func_50E6())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("cqb_stand");
		return;
	}

	if(animscripts\utility::func_51DB())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("unstable_stand");
		return;
	}

	self.var_7.var_CD8 = animscripts\utility::func_5861("default_stand");
}

//Function Number: 45
func_7DBF()
{
	if(animscripts\utility::func_9C32())
	{
		animscripts\shared::func_6866(self.alias,"right");
	}

	if(isdefined(self.var_20A9))
	{
		self.var_7.var_CD8 = self.var_20A9;
		return;
	}

	if(animscripts\utility::func_9C2E())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("rpg_crouch");
		return;
	}

	if(animscripts\utility::func_9C33())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("smg_crouch");
		return;
	}

	if(isdefined(self.weapon) && animscripts\utility::func_A2C6())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("shotgun_crouch");
		return;
	}

	self.var_7.var_CD8 = animscripts\utility::func_5861("default_crouch");
}

//Function Number: 46
func_7DC8()
{
	if(animscripts\utility::func_9C32())
	{
		animscripts\shared::func_6866(self.alias,"right");
	}

	self.var_7.var_CD8 = animscripts\utility::func_5861("default_prone");
}

//Function Number: 47
func_4D19()
{
	anim.var_4D85 = [];
	level.var_4D85[0] = %run_turn_180;
	level.var_4D85[1] = %run_turn_l135;
	level.var_4D85[2] = %run_turn_l90;
	level.var_4D85[3] = %run_turn_l45;
	level.var_4D85[5] = %run_turn_r45;
	level.var_4D85[6] = %run_turn_r90;
	level.var_4D85[7] = %run_turn_r135;
	level.var_4D85[8] = %run_turn_180;
	level.var_CCA["soldier"]["run_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85[0] = %smg_run_turn_180;
	level.var_4D85[1] = %smg_run_turn_l135;
	level.var_4D85[2] = %smg_run_turn_l90;
	level.var_4D85[3] = %smg_run_turn_l45;
	level.var_4D85[5] = %smg_run_turn_r45;
	level.var_4D85[6] = %smg_run_turn_r90;
	level.var_4D85[7] = %smg_run_turn_r135;
	level.var_4D85[8] = %smg_run_turn_180;
	level.var_CCA["soldier"]["smg_run_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85[0] = %cqb_walk_turn_2;
	level.var_4D85[1] = %cqb_walk_turn_1;
	level.var_4D85[2] = %cqb_walk_turn_4;
	level.var_4D85[3] = %cqb_walk_turn_7;
	level.var_4D85[5] = %cqb_walk_turn_9;
	level.var_4D85[6] = %cqb_walk_turn_6;
	level.var_4D85[7] = %cqb_walk_turn_3;
	level.var_4D85[8] = %cqb_walk_turn_2;
	level.var_CCA["soldier"]["cqb_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85[0] = %cqb_run_turn_180_iw6;
	level.var_4D85[1] = %cqb_run_turn_l135_iw6;
	level.var_4D85[2] = %cqb_run_turn_l90_iw6;
	level.var_4D85[3] = %cqb_run_turn_l45_iw6;
	level.var_4D85[5] = %cqb_run_turn_r45_iw6;
	level.var_4D85[6] = %cqb_run_turn_r90_iw6;
	level.var_4D85[7] = %cqb_run_turn_r135_iw6;
	level.var_4D85[8] = %cqb_run_turn_180_iw6;
	level.var_CCA["soldier"]["cqb_run_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85[0] = %lag_unstable_moveforward_arrive_2;
	level.var_4D85[1] = %lag_unstable_moveforward_arrive_1;
	level.var_4D85[2] = %lag_unstable_moveforward_arrive_4;
	level.var_4D85[3] = %lag_unstable_moveforward_arrive_7;
	level.var_4D85[5] = %lag_unstable_moveforward_arrive_9;
	level.var_4D85[6] = %lag_unstable_moveforward_arrive_6;
	level.var_4D85[7] = %lag_unstable_moveforward_arrive_3;
	level.var_4D85[8] = %lag_unstable_moveforward_arrive_2;
	level.var_CCA["soldier"]["unstable_run_turn"] = level.var_4D85;
}

//Function Number: 48
func_4CE5()
{
	anim.var_4D85 = [];
	level.var_4D85["turn_left_45"] = %exposed_tracking_turn45l;
	level.var_4D85["turn_left_90"] = %exposed_tracking_turn90l;
	level.var_4D85["turn_left_135"] = %exposed_tracking_turn135l;
	level.var_4D85["turn_left_180"] = %exposed_tracking_turn180l;
	level.var_4D85["turn_right_45"] = %exposed_tracking_turn45r;
	level.var_4D85["turn_right_90"] = %exposed_tracking_turn90r;
	level.var_4D85["turn_right_135"] = %exposed_tracking_turn135r;
	level.var_4D85["turn_right_180"] = %exposed_tracking_turn180r;
	level.var_CCA["soldier"]["exposed_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85["turn_left_45"] = %exposed_crouch_turn_90_left;
	level.var_4D85["turn_left_90"] = %exposed_crouch_turn_90_left;
	level.var_4D85["turn_left_135"] = %exposed_crouch_turn_180_left;
	level.var_4D85["turn_left_180"] = %exposed_crouch_turn_180_left;
	level.var_4D85["turn_right_45"] = %exposed_crouch_turn_90_right;
	level.var_4D85["turn_right_90"] = %exposed_crouch_turn_90_right;
	level.var_4D85["turn_right_135"] = %exposed_crouch_turn_180_right;
	level.var_4D85["turn_right_180"] = %exposed_crouch_turn_180_right;
	level.var_CCA["soldier"]["exposed_turn_crouch"] = level.var_4D85;
}

//Function Number: 49
func_4CF2()
{
	anim.var_4D85 = [];
	level.var_4D85["cower_squat"] = %exposed_squat_down_grenade_f;
	level.var_4D85["cower_squat_idle"] = %exposed_squat_idle_grenade_f;
	level.var_4D85["cower_dive_back"] = %exposed_dive_grenade_b;
	level.var_4D85["cower_dive_front"] = %exposed_dive_grenade_f;
	level.var_4D85["return_throw_short"] = [%grenade_return_running_throw_forward,%grenade_return_standing_throw_forward_1];
	level.var_4D85["return_throw_long"] = [%grenade_return_running_throw_forward,%grenade_return_standing_throw_overhand_forward];
	level.var_4D85["return_throw_default"] = [%grenade_return_standing_throw_overhand_forward];
	level.var_4D85["return_throw_short_smg"] = [%smg_grenade_return_running_throw_forward,%smg_grenade_return_standing_throw_forward_1];
	level.var_4D85["return_throw_long_smg"] = [%smg_grenade_return_running_throw_forward,%smg_grenade_return_standing_throw_overhand_forward];
	level.var_4D85["return_throw_default_smg"] = [%smg_grenade_return_standing_throw_overhand_forward];
	level.var_CCA["soldier"]["grenade"] = level.var_4D85;
}

//Function Number: 50
func_4CA3()
{
	anim.var_4D85 = [];
	level.var_4D85["F"] = %run_n_gun_f;
	level.var_4D85["L"] = %run_n_gun_l;
	level.var_4D85["R"] = %run_n_gun_r;
	level.var_4D85["LB"] = %run_n_gun_l_120;
	level.var_4D85["RB"] = %run_n_gun_r_120;
	level.var_4D85["move_back"] = %combatwalk_b;
	level.var_CCA["soldier"]["run_n_gun"] = level.var_4D85;
}

//Function Number: 51
func_827D()
{
	self.var_5A4F = 130;
	self.var_76D6 = 0.4615385;
	self.var_76D5 = 0.3;
}

//Function Number: 52
func_4C76()
{
	anim.var_4D85 = [];
	level.var_4D85["move_l"] = %combatwalk_l;
	level.var_4D85["move_r"] = %combatwalk_r;
	level.var_4D85["move_b"] = %combatwalk_b;
	level.var_CCA["soldier"]["ambush"] = level.var_4D85;
}

//Function Number: 53
func_4CA6()
{
	anim.var_4D85 = [];
	level.var_4D85["move_l"] = %smg_combatwalk_l;
	level.var_4D85["move_r"] = %smg_combatwalk_r;
	level.var_4D85["move_b"] = %smg_combatwalk_b;
	level.var_CCA["soldier"]["smg_ambush"] = level.var_4D85;
}

//Function Number: 54
func_4CA8()
{
	anim.var_4D85 = [];
	level.var_4D85["crouch"] = %smg_crouch_fastwalk_f;
	level.var_4D85["crouch_l"] = %smg_crouch_fastwalk_l;
	level.var_4D85["crouch_r"] = %smg_crouch_fastwalk_r;
	level.var_4D85["crouch_b"] = %smg_crouch_fastwalk_b;
	level.var_CCA["soldier"]["smg_crouch_run"] = level.var_4D85;
}

//Function Number: 55
func_7DB4()
{
	var_00 = "ambush";
	if(animscripts\utility::func_9C33())
	{
		var_00 = "smg_ambush";
	}

	self.var_7.var_5F40["move_l"] = animscripts\utility::func_5860(var_00,"move_l");
	self.var_7.var_5F40["move_r"] = animscripts\utility::func_5860(var_00,"move_r");
	self.var_7.var_5F40["move_b"] = animscripts\utility::func_5860(var_00,"move_b");
}

//Function Number: 56
func_4794()
{
	if(self.weapon != self.alias)
	{
		return animscripts\utility::func_C51("reload");
	}

	if(isdefined(self.node))
	{
		if(self method_8163())
		{
			var_00 = undefined;
			if(self.node.type == "Cover Left")
			{
				var_00 = animscripts\utility::func_5860("heat_reload","reload_cover_left");
			}
			else if(self.node.type == "Cover Right")
			{
				var_00 = animscripts\utility::func_5860("heat_reload","reload_cover_right");
			}

			if(isdefined(var_00))
			{
				return var_00;
			}
		}
	}

	return animscripts\utility::func_5860("heat_reload","reload_default");
}