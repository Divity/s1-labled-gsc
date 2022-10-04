/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: init_move_transitions.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 405 ms
 * Timestamp: 4/20/2022 8:20:32 PM
*******************************************************************/

//Function Number: 1
func_4D18()
{
	if(isdefined(level.var_5F36))
	{
		return;
	}

	anim.var_5F36 = 1;
	if(!isdefined(level.var_22C7))
	{
		anim.var_22C7 = [];
	}

	if(!isdefined(level.var_22A3))
	{
		anim.var_22A3 = [];
	}

	anim.var_5A2C = [];
	anim.var_33E6 = [];
	anim.var_9737 = [];
	if(!isdefined(level.var_22C9))
	{
		anim.var_22C9 = [];
	}

	if(!isdefined(level.var_22A5))
	{
		anim.var_22A5 = [];
	}

	anim.var_22A7 = [];
	anim.var_22CA = [];
	if(!isdefined(level.var_22C8))
	{
		anim.var_22C8 = [];
	}

	if(!isdefined(level.var_22A4))
	{
		anim.var_22A4 = [];
	}

	anim.var_D24 = [];
}

//Function Number: 2
func_4E1B()
{
	var_00 = [];
	var_00["right"][1] = %corner_standr_trans_in_1;
	var_00["right"][2] = %corner_standr_trans_in_2;
	var_00["right"][3] = %corner_standr_trans_in_3;
	var_00["right"][4] = %corner_standr_trans_in_4;
	var_00["right"][6] = %corner_standr_trans_in_6;
	var_00["right"][8] = %corner_standr_trans_in_8;
	var_00["right"][9] = %corner_standr_trans_in_9;
	var_00["right_crouch"][1] = %cornercrr_trans_in_ml;
	var_00["right_crouch"][2] = %cornercrr_trans_in_m;
	var_00["right_crouch"][3] = %cornercrr_trans_in_mr;
	var_00["right_crouch"][4] = %cornercrr_trans_in_l;
	var_00["right_crouch"][6] = %cornercrr_trans_in_r;
	var_00["right_crouch"][8] = %cornercrr_trans_in_f;
	var_00["right_crouch"][9] = %cornercrr_trans_in_mf;
	var_00["right_cqb"][1] = %corner_standr_trans_cqb_in_1;
	var_00["right_cqb"][2] = %corner_standr_trans_cqb_in_2;
	var_00["right_cqb"][3] = %corner_standr_trans_cqb_in_3;
	var_00["right_cqb"][4] = %corner_standr_trans_cqb_in_4;
	var_00["right_cqb"][6] = %corner_standr_trans_cqb_in_6;
	var_00["right_cqb"][8] = %corner_standr_trans_cqb_in_8;
	var_00["right_cqb"][9] = %corner_standr_trans_cqb_in_9;
	var_00["right_crouch_cqb"][1] = %cornercrr_cqb_trans_in_1;
	var_00["right_crouch_cqb"][2] = %cornercrr_cqb_trans_in_2;
	var_00["right_crouch_cqb"][3] = %cornercrr_cqb_trans_in_3;
	var_00["right_crouch_cqb"][4] = %cornercrr_cqb_trans_in_4;
	var_00["right_crouch_cqb"][6] = %cornercrr_cqb_trans_in_6;
	var_00["right_crouch_cqb"][8] = %cornercrr_cqb_trans_in_8;
	var_00["right_crouch_cqb"][9] = %cornercrr_cqb_trans_in_9;
	var_00["left"][1] = %corner_standl_trans_in_1;
	var_00["left"][2] = %corner_standl_trans_in_2;
	var_00["left"][3] = %corner_standl_trans_in_3;
	var_00["left"][4] = %corner_standl_trans_in_4;
	var_00["left"][6] = %corner_standl_trans_in_6;
	var_00["left"][7] = %corner_standl_trans_in_7;
	var_00["left"][8] = %corner_standl_trans_in_8;
	var_00["left_crouch"][1] = %cornercrl_trans_in_ml;
	var_00["left_crouch"][2] = %cornercrl_trans_in_m;
	var_00["left_crouch"][3] = %cornercrl_trans_in_mr;
	var_00["left_crouch"][4] = %cornercrl_trans_in_l;
	var_00["left_crouch"][6] = %cornercrl_trans_in_r;
	var_00["left_crouch"][7] = %cornercrl_trans_in_mf;
	var_00["left_crouch"][8] = %cornercrl_trans_in_f;
	var_00["left_cqb"][1] = %corner_standl_trans_cqb_in_1;
	var_00["left_cqb"][2] = %corner_standl_trans_cqb_in_2;
	var_00["left_cqb"][3] = %corner_standl_trans_cqb_in_3;
	var_00["left_cqb"][4] = %corner_standl_trans_cqb_in_4;
	var_00["left_cqb"][6] = %corner_standl_trans_cqb_in_6;
	var_00["left_cqb"][7] = %corner_standl_trans_cqb_in_7;
	var_00["left_cqb"][8] = %corner_standl_trans_cqb_in_8;
	var_00["left_crouch_cqb"][1] = %cornercrl_cqb_trans_in_1;
	var_00["left_crouch_cqb"][2] = %cornercrl_cqb_trans_in_2;
	var_00["left_crouch_cqb"][3] = %cornercrl_cqb_trans_in_3;
	var_00["left_crouch_cqb"][4] = %cornercrl_cqb_trans_in_4;
	var_00["left_crouch_cqb"][6] = %cornercrl_cqb_trans_in_6;
	var_00["left_crouch_cqb"][7] = %cornercrl_cqb_trans_in_7;
	var_00["left_crouch_cqb"][8] = %cornercrl_cqb_trans_in_8;
	var_00["crouch"][1] = %covercrouch_run_in_ml;
	var_00["crouch"][2] = %covercrouch_run_in_m;
	var_00["crouch"][3] = %covercrouch_run_in_mr;
	var_00["crouch"][4] = %covercrouch_run_in_l;
	var_00["crouch"][6] = %covercrouch_run_in_r;
	var_00["stand"][1] = %coverstand_trans_in_ml;
	var_00["stand"][2] = %coverstand_trans_in_m;
	var_00["stand"][3] = %coverstand_trans_in_mr;
	var_00["stand"][4] = %coverstand_trans_in_l;
	var_00["stand"][6] = %coverstand_trans_in_r;
	var_00["stand_saw"][1] = %saw_gunner_runin_ml;
	var_00["stand_saw"][2] = %saw_gunner_runin_m;
	var_00["stand_saw"][3] = %saw_gunner_runin_mr;
	var_00["stand_saw"][4] = %saw_gunner_runin_l;
	var_00["stand_saw"][6] = %saw_gunner_runin_r;
	var_00["stand_unstable"] = [];
	var_00["stand_unstable"][1] = %lag_unstable_moveforward_arrive_1;
	var_00["stand_unstable"][2] = %lag_unstable_moveforward_arrive_2;
	var_00["stand_unstable"][3] = %lag_unstable_moveforward_arrive_3;
	var_00["stand_unstable"][4] = %lag_unstable_moveforward_arrive_4;
	var_00["stand_unstable"][6] = %lag_unstable_moveforward_arrive_6;
	var_00["stand_unstable"][7] = %lag_unstable_moveforward_arrive_7;
	var_00["stand_unstable"][8] = %lag_unstable_moveforward_arrive_8;
	var_00["stand_unstable"][9] = %lag_unstable_moveforward_arrive_9;
	var_00["stand_unstable_run"] = [];
	var_00["stand_unstable_run"][1] = %lag_unstable_run_arrive_1;
	var_00["stand_unstable_run"][2] = %lag_unstable_run_arrive_2;
	var_00["stand_unstable_run"][3] = %lag_unstable_run_arrive_3;
	var_00["stand_unstable_run"][4] = %lag_unstable_run_arrive_4;
	var_00["stand_unstable_run"][6] = %lag_unstable_run_arrive_6;
	var_00["stand_unstable_run"][7] = %lag_unstable_run_arrive_7;
	var_00["stand_unstable_run"][8] = %lag_unstable_run_arrive_8;
	var_00["stand_unstable_run"][9] = %lag_unstable_run_arrive_9;
	var_00["crouch_saw"][1] = %saw_gunner_lowwall_runin_ml;
	var_00["crouch_saw"][2] = %saw_gunner_lowwall_runin_m;
	var_00["crouch_saw"][3] = %saw_gunner_lowwall_runin_mr;
	var_00["crouch_saw"][4] = %saw_gunner_lowwall_runin_l;
	var_00["crouch_saw"][6] = %saw_gunner_lowwall_runin_r;
	var_00["prone_saw"][1] = %saw_gunner_prone_runin_ml;
	var_00["prone_saw"][2] = %saw_gunner_prone_runin_m;
	var_00["prone_saw"][3] = %saw_gunner_prone_runin_mr;
	var_00["exposed"] = [];
	var_00["exposed"][1] = %run_2_idle_1;
	var_00["exposed"][2] = %run_2_stand_f_6;
	var_00["exposed"][3] = %run_2_idle_3;
	var_00["exposed"][4] = %run_2_stand_90l;
	var_00["exposed"][6] = %run_2_stand_90r;
	var_00["exposed"][7] = %run_2_idle_7;
	var_00["exposed"][8] = %run_2_stand_180l;
	var_00["exposed"][9] = %run_2_idle_9;
	var_00["exposed_smg"] = [];
	var_00["exposed_smg"][1] = %cqb_stop_1;
	var_00["exposed_smg"][2] = %smg_run_2_stand_f_6;
	var_00["exposed_smg"][3] = %cqb_stop_3;
	var_00["exposed_smg"][4] = %run_2_stand_90l;
	var_00["exposed_smg"][6] = %run_2_stand_90r;
	var_00["exposed_smg"][7] = %cqb_stop_7;
	var_00["exposed_smg"][8] = %run_2_stand_180l;
	var_00["exposed_smg"][9] = %cqb_stop_9;
	var_00["exposed_crouch"] = [];
	var_00["exposed_crouch"][1] = %run_2_crouch_idle_1;
	var_00["exposed_crouch"][2] = %run_2_crouch_f;
	var_00["exposed_crouch"][3] = %run_2_crouch_idle_3;
	var_00["exposed_crouch"][4] = %run_2_crouch_90l;
	var_00["exposed_crouch"][6] = %run_2_crouch_90r;
	var_00["exposed_crouch"][7] = %run_2_crouch_idle_7;
	var_00["exposed_crouch"][8] = %run_2_crouch_180l;
	var_00["exposed_crouch"][9] = %run_2_crouch_idle_9;
	var_00["exposed_cqb"] = [];
	var_00["exposed_cqb"][1] = %cqb_stop_1;
	var_00["exposed_cqb"][2] = %cqb_stop_2;
	var_00["exposed_cqb"][3] = %cqb_stop_3;
	var_00["exposed_cqb"][4] = %cqb_stop_4;
	var_00["exposed_cqb"][6] = %cqb_stop_6;
	var_00["exposed_cqb"][7] = %cqb_stop_7;
	var_00["exposed_cqb"][8] = %cqb_stop_8;
	var_00["exposed_cqb"][9] = %cqb_stop_9;
	var_00["exposed_crouch_cqb"] = [];
	var_00["exposed_crouch_cqb"][1] = %cqb_crouch_stop_1;
	var_00["exposed_crouch_cqb"][2] = %cqb_crouch_stop_2;
	var_00["exposed_crouch_cqb"][3] = %cqb_crouch_stop_3;
	var_00["exposed_crouch_cqb"][4] = %cqb_crouch_stop_4;
	var_00["exposed_crouch_cqb"][6] = %cqb_crouch_stop_6;
	var_00["exposed_crouch_cqb"][7] = %cqb_crouch_stop_7;
	var_00["exposed_crouch_cqb"][8] = %cqb_crouch_stop_8;
	var_00["exposed_crouch_cqb"][9] = %cqb_crouch_stop_9;
	var_00["exposed_unstable"] = [];
	var_00["exposed_unstable"][1] = %lag_unstable_moveforward_arrive_1;
	var_00["exposed_unstable"][2] = %lag_unstable_moveforward_arrive_2;
	var_00["exposed_unstable"][3] = %lag_unstable_moveforward_arrive_3;
	var_00["exposed_unstable"][4] = %lag_unstable_moveforward_arrive_4;
	var_00["exposed_unstable"][6] = %lag_unstable_moveforward_arrive_6;
	var_00["exposed_unstable"][7] = %lag_unstable_moveforward_arrive_7;
	var_00["exposed_unstable"][8] = %lag_unstable_moveforward_arrive_8;
	var_00["exposed_unstable"][9] = %lag_unstable_moveforward_arrive_9;
	var_00["exposed_unstable_run"] = [];
	var_00["exposed_unstable_run"][1] = %lag_unstable_run_arrive_1;
	var_00["exposed_unstable_run"][2] = %lag_unstable_run_arrive_2;
	var_00["exposed_unstable_run"][3] = %lag_unstable_run_arrive_3;
	var_00["exposed_unstable_run"][4] = %lag_unstable_run_arrive_4;
	var_00["exposed_unstable_run"][6] = %lag_unstable_run_arrive_6;
	var_00["exposed_unstable_run"][7] = %lag_unstable_run_arrive_7;
	var_00["exposed_unstable_run"][8] = %lag_unstable_run_arrive_8;
	var_00["exposed_unstable_run"][9] = %lag_unstable_run_arrive_9;
	var_00["heat"] = [];
	var_00["heat"][1] = %heat_approach_1;
	var_00["heat"][2] = %heat_approach_2;
	var_00["heat"][3] = %heat_approach_3;
	var_00["heat"][4] = %heat_approach_4;
	var_00["heat"][6] = %heat_approach_6;
	var_00["heat"][8] = %heat_approach_8;
	var_00["heat_left"] = [];
	var_00["heat_right"] = [];
	var_00["wall_over_96"][1] = %traverse90_in_ml;
	var_00["wall_over_96"][2] = %traverse90_in_m;
	var_00["wall_over_96"][3] = %traverse90_in_mr;
	level.var_9737["wall_over_96"]["height"] = 96;
	var_00["wall_over_40"][1] = %traverse_window_m_2_run;
	var_00["wall_over_40"][2] = %traverse_window_m_2_run;
	var_00["wall_over_40"][3] = %traverse_window_m_2_run;
	level.var_CCA["soldier"]["cover_trans"] = var_00;
}

//Function Number: 3
func_4E1C()
{
	var_00 = [];
	var_00["right"][1] = %corner_standr_trans_out_1;
	var_00["right"][2] = %corner_standr_trans_out_2;
	var_00["right"][3] = %corner_standr_trans_out_3;
	var_00["right"][4] = %corner_standr_trans_out_4;
	var_00["right"][6] = %corner_standr_trans_out_6;
	var_00["right"][8] = %corner_standr_trans_out_8;
	var_00["right"][9] = %corner_standr_trans_out_9;
	var_00["right_crouch"][1] = %cornercrr_trans_out_ml;
	var_00["right_crouch"][2] = %cornercrr_trans_out_m;
	var_00["right_crouch"][3] = %cornercrr_trans_out_mr;
	var_00["right_crouch"][4] = %cornercrr_trans_out_l;
	var_00["right_crouch"][6] = %cornercrr_trans_out_r;
	var_00["right_crouch"][8] = %cornercrr_trans_out_f;
	var_00["right_crouch"][9] = %cornercrr_trans_out_mf;
	var_00["right_cqb"][1] = %corner_standr_trans_cqb_out_1;
	var_00["right_cqb"][2] = %corner_standr_trans_cqb_out_2;
	var_00["right_cqb"][3] = %corner_standr_trans_cqb_out_3;
	var_00["right_cqb"][4] = %corner_standr_trans_cqb_out_4;
	var_00["right_cqb"][6] = %corner_standr_trans_cqb_out_6;
	var_00["right_cqb"][8] = %corner_standr_trans_cqb_out_8;
	var_00["right_cqb"][9] = %corner_standr_trans_cqb_out_9;
	var_00["right_crouch_cqb"][1] = %cornercrr_cqb_trans_out_1;
	var_00["right_crouch_cqb"][2] = %cornercrr_cqb_trans_out_2;
	var_00["right_crouch_cqb"][3] = %cornercrr_cqb_trans_out_3;
	var_00["right_crouch_cqb"][4] = %cornercrr_cqb_trans_out_4;
	var_00["right_crouch_cqb"][6] = %cornercrr_cqb_trans_out_6;
	var_00["right_crouch_cqb"][8] = %cornercrr_cqb_trans_out_8;
	var_00["right_crouch_cqb"][9] = %cornercrr_cqb_trans_out_9;
	var_00["left"][1] = %corner_standl_trans_out_1;
	var_00["left"][2] = %corner_standl_trans_out_2;
	var_00["left"][3] = %corner_standl_trans_out_3;
	var_00["left"][4] = %corner_standl_trans_out_4;
	var_00["left"][6] = %corner_standl_trans_out_6;
	var_00["left"][7] = %corner_standl_trans_out_7;
	var_00["left"][8] = %corner_standl_trans_out_8;
	var_00["left_crouch"][1] = %cornercrl_trans_out_ml;
	var_00["left_crouch"][2] = %cornercrl_trans_out_m;
	var_00["left_crouch"][3] = %cornercrl_trans_out_mr;
	var_00["left_crouch"][4] = %cornercrl_trans_out_l;
	var_00["left_crouch"][6] = %cornercrl_trans_out_r;
	var_00["left_crouch"][7] = %cornercrl_trans_out_mf;
	var_00["left_crouch"][8] = %cornercrl_trans_out_f;
	var_00["left_cqb"][1] = %corner_standl_trans_cqb_out_1;
	var_00["left_cqb"][2] = %corner_standl_trans_cqb_out_2;
	var_00["left_cqb"][3] = %corner_standl_trans_cqb_out_3;
	var_00["left_cqb"][4] = %corner_standl_trans_cqb_out_4;
	var_00["left_cqb"][6] = %corner_standl_trans_cqb_out_6;
	var_00["left_cqb"][7] = %corner_standl_trans_cqb_out_7;
	var_00["left_cqb"][8] = %corner_standl_trans_cqb_out_8;
	var_00["left_crouch_cqb"][1] = %cornercrl_cqb_trans_out_1;
	var_00["left_crouch_cqb"][2] = %cornercrl_cqb_trans_out_2;
	var_00["left_crouch_cqb"][3] = %cornercrl_cqb_trans_out_3;
	var_00["left_crouch_cqb"][4] = %cornercrl_cqb_trans_out_4;
	var_00["left_crouch_cqb"][6] = %cornercrl_cqb_trans_out_6;
	var_00["left_crouch_cqb"][7] = %cornercrl_cqb_trans_out_7;
	var_00["left_crouch_cqb"][8] = %cornercrl_cqb_trans_out_8;
	var_00["crouch"][1] = %covercrouch_run_out_ml;
	var_00["crouch"][2] = %covercrouch_run_out_m;
	var_00["crouch"][3] = %covercrouch_run_out_mr;
	var_00["crouch"][4] = %covercrouch_run_out_l;
	var_00["crouch"][6] = %covercrouch_run_out_r;
	var_00["stand"][1] = %coverstand_trans_out_ml;
	var_00["stand"][2] = %coverstand_trans_out_m;
	var_00["stand"][3] = %coverstand_trans_out_mr;
	var_00["stand"][4] = %coverstand_trans_out_l;
	var_00["stand"][6] = %coverstand_trans_out_r;
	var_00["stand_saw"][1] = %saw_gunner_runout_ml;
	var_00["stand_saw"][2] = %saw_gunner_runout_m;
	var_00["stand_saw"][3] = %saw_gunner_runout_mr;
	var_00["stand_saw"][4] = %saw_gunner_runout_l;
	var_00["stand_saw"][6] = %saw_gunner_runout_r;
	var_00["stand_unstable"] = [];
	var_00["stand_unstable"][1] = %lag_unstable_moveforward_exit_1;
	var_00["stand_unstable"][2] = %lag_unstable_moveforward_exit_2;
	var_00["stand_unstable"][3] = %lag_unstable_moveforward_exit_3;
	var_00["stand_unstable"][4] = %lag_unstable_moveforward_exit_4;
	var_00["stand_unstable"][6] = %lag_unstable_moveforward_exit_6;
	var_00["stand_unstable"][7] = %lag_unstable_moveforward_exit_7;
	var_00["stand_unstable"][8] = %lag_unstable_moveforward_exit_8;
	var_00["stand_unstable"][9] = %lag_unstable_moveforward_exit_9;
	var_00["stand_unstable_run"] = [];
	var_00["stand_unstable_run"][1] = %lag_unstable_run_exit_1;
	var_00["stand_unstable_run"][2] = %lag_unstable_run_exit_2;
	var_00["stand_unstable_run"][3] = %lag_unstable_run_exit_3;
	var_00["stand_unstable_run"][4] = %lag_unstable_run_exit_4;
	var_00["stand_unstable_run"][6] = %lag_unstable_run_exit_6;
	var_00["stand_unstable_run"][7] = %lag_unstable_run_exit_7;
	var_00["stand_unstable_run"][8] = %lag_unstable_run_exit_8;
	var_00["stand_unstable_run"][9] = %lag_unstable_run_exit_9;
	var_00["prone_saw"][2] = %saw_gunner_prone_runout_m;
	var_00["prone_saw"][4] = %saw_gunner_prone_runout_l;
	var_00["prone_saw"][6] = %saw_gunner_prone_runout_r;
	var_00["prone_saw"][8] = %saw_gunner_prone_runout_f;
	var_00["crouch_saw"][1] = %saw_gunner_lowwall_runout_ml;
	var_00["crouch_saw"][2] = %saw_gunner_lowwall_runout_m;
	var_00["crouch_saw"][3] = %saw_gunner_lowwall_runout_mr;
	var_00["crouch_saw"][4] = %saw_gunner_lowwall_runout_l;
	var_00["crouch_saw"][6] = %saw_gunner_lowwall_runout_r;
	var_00["exposed"] = [];
	var_00["exposed"][1] = %cqb_start_1;
	var_00["exposed"][2] = %stand_2_run_180l;
	var_00["exposed"][3] = %cqb_start_3;
	var_00["exposed"][4] = %stand_2_run_l;
	var_00["exposed"][6] = %stand_2_run_r;
	var_00["exposed"][7] = %cqb_start_7;
	var_00["exposed"][8] = %surprise_start_v1;
	var_00["exposed"][9] = %cqb_start_9;
	var_00["exposed_smg"] = [];
	var_00["exposed_smg"][1] = %cqb_start_1;
	var_00["exposed_smg"][2] = %smg_stand_2_run_180l;
	var_00["exposed_smg"][3] = %cqb_start_3;
	var_00["exposed_smg"][4] = %smg_stand_2_run_l;
	var_00["exposed_smg"][6] = %smg_stand_2_run_r;
	var_00["exposed_smg"][7] = %cqb_start_7;
	var_00["exposed_smg"][8] = %smg_stand_2_run_f_2;
	var_00["exposed_smg"][9] = %cqb_start_9;
	var_00["exposed_crouch"] = [];
	var_00["exposed_crouch"][1] = %cqb_crouch_start_1;
	var_00["exposed_crouch"][2] = %crouch_2run_180;
	var_00["exposed_crouch"][3] = %cqb_crouch_start_3;
	var_00["exposed_crouch"][4] = %crouch_2run_l;
	var_00["exposed_crouch"][6] = %crouch_2run_r;
	var_00["exposed_crouch"][7] = %cqb_crouch_start_7;
	var_00["exposed_crouch"][8] = %crouch_2run_f;
	var_00["exposed_crouch"][9] = %cqb_crouch_start_9;
	var_00["exposed_cqb"] = [];
	var_00["exposed_cqb"][1] = %cqb_start_1;
	var_00["exposed_cqb"][2] = %cqb_start_2;
	var_00["exposed_cqb"][3] = %cqb_start_3;
	var_00["exposed_cqb"][4] = %cqb_start_4;
	var_00["exposed_cqb"][6] = %cqb_start_6;
	var_00["exposed_cqb"][7] = %cqb_start_7;
	var_00["exposed_cqb"][8] = %cqb_start_8;
	var_00["exposed_cqb"][9] = %cqb_start_9;
	var_00["exposed_crouch_cqb"] = [];
	var_00["exposed_crouch_cqb"][1] = %cqb_crouch_start_1;
	var_00["exposed_crouch_cqb"][2] = %cqb_crouch_start_2;
	var_00["exposed_crouch_cqb"][3] = %cqb_crouch_start_3;
	var_00["exposed_crouch_cqb"][4] = %cqb_crouch_start_4;
	var_00["exposed_crouch_cqb"][6] = %cqb_crouch_start_6;
	var_00["exposed_crouch_cqb"][7] = %cqb_crouch_start_7;
	var_00["exposed_crouch_cqb"][8] = %cqb_crouch_start_8;
	var_00["exposed_crouch_cqb"][9] = %cqb_crouch_start_9;
	var_00["exposed_unstable"] = [];
	var_00["exposed_unstable"][1] = %lag_unstable_moveforward_exit_1;
	var_00["exposed_unstable"][2] = %lag_unstable_moveforward_exit_2;
	var_00["exposed_unstable"][3] = %lag_unstable_moveforward_exit_3;
	var_00["exposed_unstable"][4] = %lag_unstable_moveforward_exit_4;
	var_00["exposed_unstable"][6] = %lag_unstable_moveforward_exit_6;
	var_00["exposed_unstable"][7] = %lag_unstable_moveforward_exit_7;
	var_00["exposed_unstable"][8] = %lag_unstable_moveforward_exit_8;
	var_00["exposed_unstable"][9] = %lag_unstable_moveforward_exit_9;
	var_00["exposed_unstable_run"] = [];
	var_00["exposed_unstable_run"][1] = %lag_unstable_run_exit_1;
	var_00["exposed_unstable_run"][2] = %lag_unstable_run_exit_2;
	var_00["exposed_unstable_run"][3] = %lag_unstable_run_exit_3;
	var_00["exposed_unstable_run"][4] = %lag_unstable_run_exit_4;
	var_00["exposed_unstable_run"][6] = %lag_unstable_run_exit_6;
	var_00["exposed_unstable_run"][7] = %lag_unstable_run_exit_7;
	var_00["exposed_unstable_run"][8] = %lag_unstable_run_exit_8;
	var_00["exposed_unstable_run"][9] = %lag_unstable_run_exit_9;
	var_00["heat"] = [];
	var_00["heat"][1] = %heat_exit_1;
	var_00["heat"][2] = %heat_exit_2;
	var_00["heat"][3] = %heat_exit_3;
	var_00["heat"][4] = %heat_exit_4;
	var_00["heat"][6] = %heat_exit_6;
	var_00["heat"][7] = %heat_exit_7;
	var_00["heat"][8] = %heat_exit_8;
	var_00["heat"][9] = %heat_exit_9;
	var_00["heat_left"] = [];
	var_00["heat_left"][1] = %heat_exit_1;
	var_00["heat_left"][2] = %heat_exit_2;
	var_00["heat_left"][3] = %heat_exit_3;
	var_00["heat_left"][4] = %heat_exit_4;
	var_00["heat_left"][6] = %heat_exit_6;
	var_00["heat_left"][7] = %heat_exit_8l;
	var_00["heat_left"][8] = %heat_exit_8l;
	var_00["heat_left"][9] = %heat_exit_8r;
	var_00["heat_right"] = [];
	var_00["heat_right"][1] = %heat_exit_1;
	var_00["heat_right"][2] = %heat_exit_2;
	var_00["heat_right"][3] = %heat_exit_3;
	var_00["heat_right"][4] = %heat_exit_4;
	var_00["heat_right"][6] = %heat_exit_6;
	var_00["heat_right"][7] = %heat_exit_8l;
	var_00["heat_right"][8] = %heat_exit_8r;
	var_00["heat_right"][9] = %heat_exit_8r;
	level.var_CCA["soldier"]["cover_exit"] = var_00;
}

//Function Number: 4
func_4E1D()
{
	level.var_CCA["soldier"]["cover_trans_split"]["left"][7] = 0.369369;
	level.var_CCA["soldier"]["cover_trans_split"]["left_crouch"][7] = 0.321321;
	level.var_CCA["soldier"]["cover_trans_split"]["left_crouch_cqb"][7] = 0.2002;
	level.var_CCA["soldier"]["cover_trans_split"]["left_cqb"][7] = 0.275275;
	level.var_CCA["soldier"]["cover_exit_split"]["left"][7] = 0.550551;
	level.var_CCA["soldier"]["cover_exit_split"]["left_crouch"][7] = 0.558559;
	level.var_CCA["soldier"]["cover_exit_split"]["left_cqb"][7] = 0.358358;
	level.var_CCA["soldier"]["cover_exit_split"]["left_crouch_cqb"][7] = 0.359359;
	level.var_CCA["soldier"]["cover_exit_split"]["heat_left"][7] = 0.42;
	level.var_CCA["soldier"]["cover_trans_split"]["left"][8] = 0.525526;
	level.var_CCA["soldier"]["cover_trans_split"]["left_crouch"][8] = 0.448448;
	level.var_CCA["soldier"]["cover_trans_split"]["left_crouch_cqb"][8] = 0.251251;
	level.var_CCA["soldier"]["cover_trans_split"]["left_cqb"][8] = 0.335335;
	level.var_CCA["soldier"]["cover_exit_split"]["left"][8] = 0.616617;
	level.var_CCA["soldier"]["cover_exit_split"]["left_crouch"][8] = 0.453453;
	level.var_CCA["soldier"]["cover_exit_split"]["left_crouch_cqb"][8] = 0.572573;
	level.var_CCA["soldier"]["cover_exit_split"]["left_cqb"][8] = 0.336336;
	level.var_CCA["soldier"]["cover_exit_split"]["heat_left"][8] = 0.42;
	level.var_CCA["soldier"]["cover_trans_split"]["right"][8] = 0.472472;
	level.var_CCA["soldier"]["cover_trans_split"]["right_crouch"][8] = 0.248248;
	level.var_CCA["soldier"]["cover_trans_split"]["right_cqb"][8] = 0.345345;
	level.var_CCA["soldier"]["cover_trans_split"]["right_crouch_cqb"][8] = 0.428428;
	level.var_CCA["soldier"]["cover_exit_split"]["right"][8] = 0.431431;
	level.var_CCA["soldier"]["cover_exit_split"]["right_crouch"][8] = 0.545546;
	level.var_CCA["soldier"]["cover_exit_split"]["right_cqb"][8] = 0.335335;
	level.var_CCA["soldier"]["cover_exit_split"]["right_crouch_cqb"][8] = 0.4004;
	level.var_CCA["soldier"]["cover_exit_split"]["heat_right"][8] = 0.4;
	level.var_CCA["soldier"]["cover_trans_split"]["right"][9] = 0.551552;
	level.var_CCA["soldier"]["cover_trans_split"]["right_crouch"][9] = 0.2002;
	level.var_CCA["soldier"]["cover_trans_split"]["right_cqb"][9] = 0.3003;
	level.var_CCA["soldier"]["cover_trans_split"]["right_crouch_cqb"][9] = 0.224224;
	level.var_CCA["soldier"]["cover_exit_split"]["right"][9] = 0.485485;
	level.var_CCA["soldier"]["cover_exit_split"]["right_crouch"][9] = 0.493493;
	level.var_CCA["soldier"]["cover_exit_split"]["right_cqb"][9] = 0.438438;
	level.var_CCA["soldier"]["cover_exit_split"]["right_crouch_cqb"][9] = 0.792793;
	level.var_CCA["soldier"]["cover_exit_split"]["heat_right"][9] = 0.4;
}

//Function Number: 5
func_4E03()
{
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left"][7] = 0.465465;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left_crouch"][7] = 0.284284;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left_crouch_cqb"][7] = 0.246246;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left_cqb"][7] = 0.454454;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left"][7] = 0.555556;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left_crouch"][7] = 0.644645;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left_crouch_cqb"][7] = 0.678679;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left_cqb"][7] = 0.598599;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left"][8] = 0.4004;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left_crouch"][8] = 0.404404;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left_crouch_cqb"][8] = 0.33033;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["left_cqb"][8] = 0.456456;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left"][8] = 0.54955;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left_crouch"][8] = 0.537538;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left_crouch_cqb"][8] = 0.544545;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["left_cqb"][8] = 0.67968;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right"][8] = 0.446446;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right_crouch"][8] = 0.23023;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right_cqb"][8] = 0.269269;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right_crouch_cqb"][8] = 0.438438;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right"][8] = 0.431431;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right_crouch"][8] = 0.66967;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right_cqb"][8] = 0.602603;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right_crouch_cqb"][8] = 0.621622;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right"][9] = 0.418418;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right_crouch"][9] = 0.21021;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right_cqb"][9] = 0.317317;
	level.var_CCA["s1_soldier"]["cover_trans_split"]["right_crouch_cqb"][9] = 0.396396;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right"][9] = 0.461461;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right_crouch"][9] = 0.638639;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right_cqb"][9] = 0.50951;
	level.var_CCA["s1_soldier"]["cover_exit_split"]["right_crouch_cqb"][9] = 0.550551;
}

//Function Number: 6
func_4E2C(param_00)
{
	if(!isdefined(level.var_CCA[param_00]))
	{
		return;
	}

	var_01 = [];
	var_01[0] = "left";
	var_01[1] = "right";
	var_01[2] = "left_crouch";
	var_01[3] = "right_crouch";
	var_01[4] = "crouch";
	var_01[5] = "stand";
	var_01[6] = "exposed";
	var_01[7] = "exposed_crouch";
	var_01[8] = "stand_saw";
	var_01[9] = "prone_saw";
	var_01[10] = "crouch_saw";
	var_01[11] = "wall_over_40";
	var_01[12] = "right_cqb";
	var_01[13] = "right_crouch_cqb";
	var_01[14] = "left_cqb";
	var_01[15] = "left_crouch_cqb";
	var_01[16] = "exposed_cqb";
	var_01[17] = "exposed_crouch_cqb";
	var_01[18] = "heat";
	var_01[19] = "heat_left";
	var_01[20] = "heat_right";
	var_01[21] = "exposed_ready";
	var_01[22] = "exposed_ready_cqb";
	var_01[23] = "exposed_smg";
	var_01[24] = "exposed_unstable";
	var_01[25] = "stand_unstable";
	var_01[26] = "exposed_unstable_run";
	var_01[27] = "stand_unstable_run";
	if(!isdefined(level.var_CCA[param_00]["cover_trans"]))
	{
		return;
	}

	for(var_02 = 1;var_02 <= 6;var_02++)
	{
		if(var_02 == 5)
		{
			continue;
		}

		for(var_03 = 0;var_03 < var_01.size;var_03++)
		{
			var_04 = var_01[var_03];
			if(isdefined(level.var_CCA[param_00]["cover_trans"][var_04]) && isdefined(level.var_CCA[param_00]["cover_trans"][var_04][var_02]))
			{
				level.var_CCA[param_00]["cover_trans_dist"][var_04][var_02] = getmovedelta(level.var_CCA[param_00]["cover_trans"][var_04][var_02],0,1);
				level.var_CCA[param_00]["cover_trans_angles"][var_04][var_02] = getangledelta(level.var_CCA[param_00]["cover_trans"][var_04][var_02],0,1);
			}

			if(isdefined(level.var_CCA[param_00]["cover_exit"][var_04]) && isdefined(level.var_CCA[param_00]["cover_exit"][var_04][var_02]))
			{
				if(animhasnotetrack(level.var_CCA[param_00]["cover_exit"][var_04][var_02],"code_move"))
				{
					var_05 = getnotetracktimes(level.var_CCA[param_00]["cover_exit"][var_04][var_02],"code_move")[0];
				}
				else
				{
					var_05 = 1;
				}

				level.var_CCA[param_00]["cover_exit_dist"][var_04][var_02] = getmovedelta(level.var_CCA[param_00]["cover_exit"][var_04][var_02],0,var_05);
				level.var_CCA[param_00]["cover_exit_angles"][var_04][var_02] = getangledelta(level.var_CCA[param_00]["cover_exit"][var_04][var_02],0,1);
			}
		}
	}

	if(!isdefined(level.var_CCA[param_00]["CoverTransLongestDist"]))
	{
		level.var_CCA[param_00]["CoverTransLongestDist"] = [];
	}

	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		var_04 = var_01[var_03];
		level.var_CCA[param_00]["CoverTransLongestDist"][var_04] = 0;
		for(var_02 = 1;var_02 <= 6;var_02++)
		{
			if(var_02 == 5 || !isdefined(level.var_CCA[param_00]["cover_trans"][var_04]) || !isdefined(level.var_CCA[param_00]["cover_trans"][var_04][var_02]))
			{
				continue;
			}

			var_06 = lengthsquared(level.var_CCA[param_00]["cover_trans_dist"][var_04][var_02]);
			if(level.var_CCA[param_00]["CoverTransLongestDist"][var_04] < var_06)
			{
				level.var_CCA[param_00]["CoverTransLongestDist"][var_04] = var_06;
			}
		}

		level.var_CCA[param_00]["CoverTransLongestDist"][var_04] = sqrt(level.var_CCA[param_00]["CoverTransLongestDist"][var_04]);
	}

	level.var_3592["exposed"] = 1;
	level.var_3592["exposed_crouch"] = 1;
	level.var_3592["exposed_cqb"] = 1;
	level.var_3592["exposed_crouch_cqb"] = 1;
	level.var_3592["exposed_ready_cqb"] = 1;
	level.var_3592["exposed_unstable"] = 1;
	level.var_3592["exposed_unstable_run"] = 1;
	level.var_3592["exposed_ready"] = 1;
	level.var_3592["exposed_smg"] = 1;
	level.var_3592["heat"] = 1;
	if(!isdefined(level.var_CCA[param_00]["longestExposedApproachDist"]))
	{
		level.var_CCA[param_00]["longestExposedApproachDist"] = 0;
	}

	foreach(var_04, var_08 in level.var_3592)
	{
		for(var_02 = 7;var_02 <= 9;var_02++)
		{
			if(isdefined(level.var_CCA[param_00]["cover_trans"][var_04]) && isdefined(level.var_CCA[param_00]["cover_trans"][var_04][var_02]))
			{
				level.var_CCA[param_00]["cover_trans_dist"][var_04][var_02] = getmovedelta(level.var_CCA[param_00]["cover_trans"][var_04][var_02],0,1);
				level.var_CCA[param_00]["cover_trans_angles"][var_04][var_02] = getangledelta(level.var_CCA[param_00]["cover_trans"][var_04][var_02],0,1);
			}

			if(isdefined(level.var_CCA[param_00]["cover_exit"][var_04]) && isdefined(level.var_CCA[param_00]["cover_exit"][var_04][var_02]))
			{
				var_09 = animhasnotetrack(level.var_CCA[param_00]["cover_exit"][var_04][var_02],"code_move");
				var_05 = getnotetracktimes(level.var_CCA[param_00]["cover_exit"][var_04][var_02],"code_move")[0];
				level.var_CCA[param_00]["cover_exit_dist"][var_04][var_02] = getmovedelta(level.var_CCA[param_00]["cover_exit"][var_04][var_02],0,var_05);
				level.var_CCA[param_00]["cover_exit_angles"][var_04][var_02] = getangledelta(level.var_CCA[param_00]["cover_exit"][var_04][var_02],0,1);
			}
		}

		for(var_02 = 1;var_02 <= 9;var_02++)
		{
			if(!isdefined(level.var_CCA[param_00]["cover_trans"][var_04]) || !isdefined(level.var_CCA[param_00]["cover_trans"][var_04][var_02]))
			{
				continue;
			}

			var_0A = length(level.var_CCA[param_00]["cover_trans_dist"][var_04][var_02]);
			if(var_0A > level.var_CCA[param_00]["longestExposedApproachDist"])
			{
				level.var_CCA[param_00]["longestExposedApproachDist"] = var_0A;
			}
		}
	}
}

//Function Number: 7
func_4DF0()
{
	func_4D18();
	anim.var_CB6 = [];
	level.var_CB6["Cover Left"] = [];
	level.var_CB6["Cover Left"]["stand"] = "left";
	level.var_CB6["Cover Left"]["crouch"] = "left_crouch";
	level.var_5A2C["Cover Left"] = 9;
	level.var_33E6["Cover Left"] = 9;
	level.var_CB6["Cover Right"] = [];
	level.var_CB6["Cover Right"]["stand"] = "right";
	level.var_CB6["Cover Right"]["crouch"] = "right_crouch";
	level.var_5A2C["Cover Right"] = 9;
	level.var_33E6["Cover Right"] = 7;
	level.var_CB6["Cover Crouch"] = [];
	level.var_CB6["Cover Crouch"]["stand"] = "crouch";
	level.var_CB6["Cover Crouch"]["crouch"] = "crouch";
	level.var_CB6["Conceal Crouch"] = level.var_CB6["Cover Crouch"];
	level.var_CB6["Cover Crouch Window"] = level.var_CB6["Cover Crouch"];
	level.var_5A2C["Cover Crouch"] = 6;
	level.var_33E6["Cover Crouch"] = -1;
	level.var_5A2C["Conceal Crouch"] = 6;
	level.var_33E6["Conceal Crouch"] = -1;
	level.var_CB6["Cover Stand"] = [];
	level.var_CB6["Cover Stand"]["stand"] = "stand";
	level.var_CB6["Cover Stand"]["crouch"] = "stand";
	level.var_CB6["Conceal Stand"] = level.var_CB6["Cover Stand"];
	level.var_5A2C["Cover Stand"] = 6;
	level.var_33E6["Cover Stand"] = -1;
	level.var_5A2C["Conceal Stand"] = 6;
	level.var_33E6["Conceal Stand"] = -1;
	level.var_CB6["Cover Prone"] = [];
	level.var_CB6["Cover Prone"]["stand"] = "exposed";
	level.var_CB6["Cover Prone"]["crouch"] = "exposed";
	level.var_CB6["Conceal Prone"] = level.var_CB6["Cover Prone"];
	level.var_33E6["Conceal Prone"] = -1;
	level.var_CB6["Path"] = [];
	level.var_CB6["Path"]["stand"] = "exposed";
	level.var_CB6["Path"]["crouch"] = "exposed_crouch";
	level.var_CB6["Guard"] = level.var_CB6["Path"];
	level.var_CB6["Ambush"] = level.var_CB6["Path"];
	level.var_CB6["Scripted"] = level.var_CB6["Path"];
	level.var_CB6["Exposed"] = level.var_CB6["Path"];
	level.var_50E0["Guard"] = 1;
	level.var_50E0["Ambush"] = 1;
	level.var_50E0["Exposed"] = 1;
	level.var_50E1["Guard"] = 1;
	level.var_50E1["Exposed"] = 1;
	func_4E1B();
	func_4E1C();
	if(lib_A59A::func_76FC())
	{
		animscripts\s1_common_anims::func_4E1E();
		animscripts\s1_common_anims::func_4E1F();
	}

	func_4E2C("soldier");
	if(lib_A59A::func_76FC())
	{
		func_4E2C("s1_soldier");
	}

	func_4E1D();
	if(lib_A59A::func_76FC())
	{
		func_4E03();
	}

	anim.var_8A72 = [];
	level.var_8A72["left"] = 1;
	level.var_8A72["left_crouch"] = 1;
	level.var_8A72["left_crouch_cqb"] = 1;
	level.var_8A72["left_cqb"] = 1;
	anim.var_8A74 = [];
	level.var_8A74["left"] = 1;
	level.var_8A74["left_crouch"] = 1;
	level.var_8A74["left_crouch_cqb"] = 1;
	level.var_8A74["left_cqb"] = 1;
	level.var_8A74["heat_left"] = 1;
	anim.var_8A73 = [];
	level.var_8A73["right"] = 1;
	level.var_8A73["right_crouch"] = 1;
	level.var_8A73["right_cqb"] = 1;
	level.var_8A73["right_crouch_cqb"] = 1;
	anim.var_8A75 = [];
	level.var_8A75["right"] = 1;
	level.var_8A75["right_crouch"] = 1;
	level.var_8A75["right_cqb"] = 1;
	level.var_8A75["right_crouch_cqb"] = 1;
	level.var_8A75["heat_right"] = 1;
	func_40DF("soldier");
	if(lib_A59A::func_76FC())
	{
		func_40DF("s1_soldier");
	}

	level.var_D24["left"] = "stand";
	level.var_D24["left_cqb"] = "stand";
	level.var_D24["right"] = "stand";
	level.var_D24["right_cqb"] = "stand";
	level.var_D24["stand"] = "stand";
	level.var_D24["stand_saw"] = "stand";
	level.var_D24["stand_unstable"] = "stand";
	level.var_D24["exposed"] = "stand";
	level.var_D24["exposed_cqb"] = "stand";
	level.var_D24["exposed_smg"] = "stand";
	level.var_D24["exposed_unstable"] = "stand";
	level.var_D24["exposed_unstable_run"] = "stand";
	level.var_D24["heat"] = "stand";
	level.var_D24["left_crouch"] = "crouch";
	level.var_D24["left_crouch_cqb"] = "crouch";
	level.var_D24["right_crouch"] = "crouch";
	level.var_D24["right_crouch_cqb"] = "crouch";
	level.var_D24["crouch_saw"] = "crouch";
	level.var_D24["crouch"] = "crouch";
	level.var_D24["exposed_crouch"] = "crouch";
	level.var_D24["exposed_crouch_cqb"] = "crouch";
	level.var_D24["prone_saw"] = "prone";
	level.var_D24["exposed_ready"] = "stand";
	level.var_D24["exposed_ready_cqb"] = "stand";
	level.var_7408["Cover Stand"] = "stand";
	level.var_7408["Conceal Stand"] = "stand";
	level.var_7408["Cover Crouch"] = "crouch";
	level.var_7408["Conceal Crouch"] = "crouch";
}

//Function Number: 8
func_40DF(param_00)
{
	func_40E0(param_00,7,8,0,level.var_8A72,level.var_8A74);
	func_40E0(param_00,8,9,1,level.var_8A73,level.var_8A75);
}

//Function Number: 9
func_40E0(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = 0;
	for(var_07 = param_01;var_07 <= param_02;var_07++)
	{
		if(!var_06)
		{
			foreach(var_0A, var_09 in param_04)
			{
				if(isdefined(level.var_CCA[param_00]["cover_trans"]) && isdefined(level.var_CCA[param_00]["cover_trans"][var_0A]) && isdefined(level.var_CCA[param_00]["cover_trans"][var_0A][var_07]))
				{
					level.var_CCA[param_00]["cover_trans_predist"][var_0A][var_07] = getmovedelta(level.var_CCA[param_00]["cover_trans"][var_0A][var_07],0,func_4138(param_00,var_0A,var_07));
					level.var_CCA[param_00]["cover_trans_dist"][var_0A][var_07] = getmovedelta(level.var_CCA[param_00]["cover_trans"][var_0A][var_07],0,1) - level.var_CCA[param_00]["cover_trans_predist"][var_0A][var_07];
					level.var_CCA[param_00]["cover_trans_angles"][var_0A][var_07] = getangledelta(level.var_CCA[param_00]["cover_trans"][var_0A][var_07],0,1);
				}
			}

			foreach(var_0A, var_09 in param_05)
			{
				if(isdefined(level.var_CCA[param_00]["cover_exit"]) && isdefined(level.var_CCA[param_00]["cover_exit"][var_0A]) && isdefined(level.var_CCA[param_00]["cover_exit"][var_0A][var_07]))
				{
					level.var_CCA[param_00]["cover_exit_dist"][var_0A][var_07] = getmovedelta(level.var_CCA[param_00]["cover_exit"][var_0A][var_07],0,func_3F8A(param_00,var_0A,var_07));
					level.var_CCA[param_00]["cover_exit_postdist"][var_0A][var_07] = getmovedelta(level.var_CCA[param_00]["cover_exit"][var_0A][var_07],0,1) - level.var_CCA[param_00]["cover_exit_dist"][var_0A][var_07];
					level.var_CCA[param_00]["cover_exit_angles"][var_0A][var_07] = getangledelta(level.var_CCA[param_00]["cover_exit"][var_0A][var_07],0,1);
				}
			}

			continue;
		}
	}
}

//Function Number: 10
func_3F8A(param_00,param_01,param_02)
{
	if(isdefined(level.var_CCA[param_00]["cover_exit_split"][param_01]) && isdefined(level.var_CCA[param_00]["cover_exit_split"][param_01][param_02]))
	{
		return level.var_CCA[param_00]["cover_exit_split"][param_01][param_02];
	}

	return 1;
}

//Function Number: 11
func_4138(param_00,param_01,param_02)
{
	if(isdefined(level.var_CCA[param_00]["cover_trans_split"][param_01]) && isdefined(level.var_CCA[param_00]["cover_trans_split"][param_01][param_02]))
	{
		return level.var_CCA[param_00]["cover_trans_split"][param_01][param_02];
	}

	return 1;
}