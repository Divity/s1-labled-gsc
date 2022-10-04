/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: dshk_stand.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 184 ms
 * Timestamp: 4/20/2022 8:19:22 PM
*******************************************************************/

//Function Number: 1
main()
{
	var_00 = self method_8194();
	var_01 = func_3D2C();
	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	self.var_6F8B = %gazgunner_aim;
	self.var_7F6 = %gaz_turret_aim_6_add;
	self.var_7F7 = %gaz_turret_aim_4_add;
	self.var_7F2 = %additive_gazgunner_aim_leftright;
	self.var_7F5 = %gaz_turret_idle;
	self.var_7F3 = %gaz_turret_idle;
	self.var_7F4 = %gaz_turret_fire;
	self.var_7F8 = %additive_gazgunner_usegun;
	self.var_99A2 = %gazgunner_death;
	self.var_99A1 = var_01;
	self.var_99B0[0] = %gaz_turret_paina;
	self.var_99B0[1] = %gaz_turret_painb;
	self.var_99AA = %gaz_turret_flincha;
	self.var_99B2 = %gaz_turret_paina;
	self.var_99B9 = %gazgunner;
	var_02 = [];
	var_02["humvee_turret_flinchA"] = %gaz_turret_flincha;
	var_02["humvee_turret_flinchB"] = %gaz_turret_flinchb;
	self.var_99B8 = var_02;
	var_00 func_82DA();
	thread animscripts\hummer_turret\minigun_code::main(var_00);
}

//Function Number: 2
func_3D2C()
{
	var_00 = %gaz_turret_death;
	if(isdefined(self.var_750B))
	{
		if(isdefined(level.var_2FA4))
		{
			var_00 = self [[ level.var_2FA4 ]]();
		}
	}

	return var_00;
}

//Function Number: 3
func_82DA()
{
	self method_8115(#animtree);
	self.var_66B4 = %humvee_passenger_2_turret_minigun;
	self.var_999C = %humvee_turret_2_passenger_minigun;
}