/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_left.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 203 ms
 * Timestamp: 4/20/2022 8:20:20 PM
*******************************************************************/

//Function Number: 1
func_4C7A()
{
	var_00 = [];
	var_00["alert_idle"] = %corner_standl_alert_idle;
	var_00["alert_idle_twitch"] = [%corner_standl_alert_twitch01,%corner_standl_alert_twitch02,%corner_standl_alert_twitch03,%corner_standl_alert_twitch04,%corner_standl_alert_twitch05,%corner_standl_alert_twitch06,%corner_standl_alert_twitch07];
	var_00["alert_idle_flinch"] = [%corner_standl_flinch];
	var_00["alert_to_A"] = [%corner_standl_trans_alert_2_a];
	var_00["alert_to_B"] = [%corner_standl_trans_alert_2_b_v2];
	var_00["A_to_alert"] = [%corner_standl_trans_a_2_alert_v2];
	var_00["A_to_alert_reload"] = [];
	var_00["A_to_B"] = [%corner_standl_trans_a_2_b_v2];
	var_00["B_to_alert"] = [%corner_standl_trans_b_2_alert_v2];
	var_00["B_to_alert_reload"] = [%corner_standl_reload_b_2_alert];
	var_00["B_to_A"] = [%corner_standl_trans_b_2_a_v2];
	var_00["lean_to_alert"] = [%cornerstndl_lean_2_alert];
	var_00["alert_to_lean"] = [%cornerstndl_alert_2_lean];
	var_00["look"] = %corner_standl_look;
	var_00["reload"] = [%corner_standl_reload_v1];
	var_00["grenade_exposed"] = %corner_standl_grenade_a;
	var_00["grenade_safe"] = %corner_standl_grenade_b;
	var_00["blind_fire"] = [%corner_standl_blindfire_v1,%corner_standl_blindfire_v2];
	var_00["alert_to_look"] = %corner_standl_alert_2_look;
	var_00["look_to_alert"] = %corner_standl_look_2_alert;
	var_00["look_to_alert_fast"] = %corner_standl_look_2_alert_fast_v1;
	var_00["look_idle"] = %corner_standl_look_idle;
	var_00["stance_change"] = %cornercrl_stand_2_alert;
	var_00["lean_aim_down"] = %cornerstndl_lean_aim_2;
	var_00["lean_aim_left"] = %cornerstndl_lean_aim_4;
	var_00["lean_aim_straight"] = %cornerstndl_lean_aim_5;
	var_00["lean_aim_right"] = %cornerstndl_lean_aim_6;
	var_00["lean_aim_up"] = %cornerstndl_lean_aim_8;
	var_00["lean_reload"] = %cornerstndl_lean_reload;
	var_00["lean_idle"] = [%cornerstndl_lean_idle];
	var_00["lean_single"] = %cornerstndl_lean_fire;
	var_00["lean_fire"] = %cornerstndl_lean_auto;
	level.var_CCA["soldier"]["cover_left_stand"] = var_00;
	var_00 = [];
	var_00["alert_idle"] = %cornercrl_alert_idle;
	var_00["alert_idle_twitch"] = [];
	var_00["alert_idle_flinch"] = [];
	var_00["alert_to_A"] = [%cornercrl_trans_alert_2_a];
	var_00["alert_to_B"] = [%cornercrl_trans_alert_2_b];
	var_00["A_to_alert"] = [%cornercrl_trans_a_2_alert];
	var_00["A_to_alert_reload"] = [];
	var_00["A_to_B"] = [%cornercrl_trans_a_2_b];
	var_00["B_to_alert"] = [%cornercrl_trans_b_2_alert];
	var_00["B_to_alert_reload"] = [];
	var_00["B_to_A"] = [%cornercrl_trans_b_2_a];
	var_00["lean_to_alert"] = [%cornercrl_lean_2_alert];
	var_00["alert_to_lean"] = [%cornercrl_alert_2_lean];
	var_00["look"] = %cornercrl_look_fast;
	var_00["reload"] = [%cornercrl_reloada,%cornercrl_reloadb];
	var_00["grenade_safe"] = %cornercrl_grenadea;
	var_00["grenade_exposed"] = %cornercrl_grenadeb;
	var_00["alert_to_over"] = [%cornercrl_alert_2_over];
	var_00["over_to_alert"] = [%cornercrl_over_2_alert];
	var_00["over_to_alert_reload"] = [];
	var_00["blind_fire"] = [];
	var_00["rambo90"] = [];
	var_00["rambo45"] = [];
	var_00["stance_change"] = %cornercrl_alert_2_stand;
	var_00["lean_aim_down"] = %cornercrl_lean_aim_2;
	var_00["lean_aim_left"] = %cornercrl_lean_aim_4;
	var_00["lean_aim_straight"] = %cornercrl_lean_aim_5;
	var_00["lean_aim_right"] = %cornercrl_lean_aim_6;
	var_00["lean_aim_up"] = %cornercrl_lean_aim_8;
	var_00["lean_idle"] = [%cornercrl_lean_idle];
	var_00["lean_single"] = %cornercrl_lean_fire;
	var_00["lean_fire"] = %cornercrl_lean_auto;
	level.var_CCA["soldier"]["cover_left_crouch"] = var_00;
}

//Function Number: 2
main()
{
	self.var_C50 = [];
	self.var_C50["hiding"]["stand"] = ::func_7DCD;
	self.var_C50["hiding"]["crouch"] = ::func_7DC0;
	self endon("killanimscript");
	animscripts\utility::func_4DD4("cover_left");
	animscripts\corner::func_2222("left",90);
}

//Function Number: 3
end_script()
{
	animscripts\corner::func_3142();
	animscripts\cover_behavior::end_script("left");
}

//Function Number: 4
func_7DCD()
{
	self.var_4881 = 90;
	self.var_7.var_CD8 = animscripts\utility::func_5861("cover_left_stand");
	if(isdefined(level.var_7105))
	{
		self.var_7.var_CD8["rambo90"] = level.var_7105.var_22A9;
		self.var_7.var_CD8["rambo45"] = level.var_7105.var_22A8;
		self.var_7.var_CD8["grenade_rambo"] = level.var_7105.var_22AA;
	}
}

//Function Number: 5
func_7DC0()
{
	self.var_4881 = 90;
	self.var_7.var_CD8 = animscripts\utility::func_5861("cover_left_crouch");
}