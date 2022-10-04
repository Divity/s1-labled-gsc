/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42494.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:46 PM
*******************************************************************/

//Function Number: 1
lib_A5FE::main(param_00,param_01,param_02)
{
	precachemodel(param_00);
	if(level.currentgen)
	{
		precachemodel("vehicle_mil_attack_drone_static_multi_cg");
	}

	lib_A59A::set_console_status();
	level._effect["queen_drone_beacon_red"] = loadfx("vfx/lights/light_drone_beacon_red_single");
	level._effect["droneswarm_tread"] = loadfx("vfx/treadfx/droneswarm_tread_dust");
	level._effect["droneswarm_tread_water"] = loadfx("vfx/treadfx/droneswarm_tread_water");
	lib_A59E::func_186C("attack_drone_queen",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A5FE::func_4D0D);
	lib_A59E::func_1846(0.4,0.8,1024);
	lib_A59E::func_1856(499);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1855();
}

//Function Number: 2
lib_A5FE::func_4D0D()
{
	self.var_796E = 1;
	self.var_7953 = 0;
	self.var_2D2F = 1;
	self.var_2161 = self setcontents(0);
	self.var_4B9E = 1;
	self.delete_on_death = 1;
	thread lib_A5F9::func_E19();
	thread lib_A5FE::func_0E1B();
	self hide();
	self makevehiclenotcollidewithplayers();
}

//Function Number: 3
lib_A5FE::func_0E1B()
{
	var_00 = 0.15;
	var_01 = squared(975);
	var_02 = (0,0,-195);
	var_03 = 0.2;
	var_04 = anglestoforward(self.var_41 + (-90,0,0));
	var_05 = anglestoup(self.var_41 + (-90,0,0));
	self endon("death");
	if(randomfloat(1) > var_00)
	{
		return;
	}

	wait(randomfloat(var_03));
	for(;;)
	{
		if(distancesquared(self.var_2E6,level.var_31D.var_2E6) < var_01)
		{
			var_06 = bullettrace(self.var_2E6,self.var_2E6 + var_02,0);
			if(var_06["fraction"] < 1)
			{
				if(var_06["surfacetype"] != "water_waist")
				{
					playfx(common_scripts\utility::getfx("droneswarm_tread"),var_06["position"],var_04,var_05);
				}
				else
				{
					playfx(common_scripts\utility::getfx("droneswarm_tread_water"),var_06["position"],var_04,var_05);
				}
			}
		}

		wait(var_03);
	}
}