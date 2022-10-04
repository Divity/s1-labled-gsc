/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: minigun_stand.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 69 ms
 * Timestamp: 4/20/2022 8:19:22 PM
*******************************************************************/

//Function Number: 1
main()
{
	var_00 = self method_8194();
	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	self.var_6F8B = %humveegunner_aim;
	self.var_7F6 = %humvee_turret_aim_6_add;
	self.var_7F7 = %humvee_turret_aim_4_add;
	self.var_7F2 = %additive_humveegunner_aim_leftright;
	self.var_7F5 = %humvee_turret_idle;
	self.var_7F3 = %humvee_turret_driveidle;
	self.var_7F4 = %humvee_turret_fire;
	self.var_7F8 = %additive_humveegunner_usegun;
	self.var_99A2 = %humveegunner_death;
	self.var_99A1 = %humvee_turret_death;
	self.var_99B0[0] = %humvee_turret_paina;
	self.var_99B0[1] = %humvee_turret_painb;
	self.var_99AA = %humvee_turret_flincha;
	self.var_99B2 = %humvee_turret_rechamber;
	self.var_99B9 = %humveegunner;
	var_01 = [];
	var_01["humvee_turret_bounce"] = %humvee_turret_bounce;
	var_01["humvee_turret_idle_lookback"] = %humvee_turret_idle_lookback;
	var_01["humvee_turret_idle_lookbackB"] = %humvee_turret_idle_lookbackb;
	var_01["humvee_turret_idle_signal_forward"] = %humvee_turret_idle_signal_forward;
	var_01["humvee_turret_idle_signal_side"] = %humvee_turret_idle_signal_side;
	var_01["humvee_turret_radio"] = %humvee_turret_radio;
	var_01["humvee_turret_flinchA"] = %humvee_turret_flincha;
	var_01["humvee_turret_flinchB"] = %humvee_turret_flinchb;
	var_01["humvee_turret_rechamber"] = %humvee_turret_rechamber;
	self.var_99B8 = var_01;
	var_00 func_82DA();
	thread animscripts\hummer_turret\minigun_code::main(var_00);
}

//Function Number: 2
func_82DA()
{
	self method_8115(#animtree);
	self.var_66B4 = %humvee_passenger_2_turret_minigun;
	self.var_999C = %humvee_turret_2_passenger_minigun;
}