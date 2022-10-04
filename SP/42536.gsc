/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42536.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 17
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:48 PM
*******************************************************************/

//Function Number: 1
lib_A628::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("mig29",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A628::func_4D0D);
	lib_A59E::func_1845("vehicle_mil_mig29");
	lib_A59E::func_1845("vehicle_mig29");
	lib_A59E::func_1845("vehicle_mig29_desert");
	lib_A59E::func_1845("vehicle_av8b_harrier_jet");
	lib_A59E::func_1845("vehicle_mig29_low");
	lib_A59E::func_1845("vehicle_mig29_small");
	lib_A59E::func_186E();
	level._effect["engineeffect"] = loadfx("vfx/trail/jet_thruster_far");
	level._effect["afterburner"] = loadfx("vfx/fire/jet_afterburner_ignite");
	lib_A59E::func_1856(999,500,1500);
	if(param_00 != "vehicle_s1_plane_test")
	{
		if(param_00 != "vehicle_mig29_small")
		{
			lib_A59E::func_1865("mig_rumble",0.1,0.2,11300,0.05,0.05);
		}
		else
		{
			lib_A59E::func_1865("mig_rumble",0.1,0.2,1130,0.05,0.05);
		}
	}

	lib_A59E::func_186A("allies");
	if(param_00 != "vehicle_av8b_harrier_jet")
	{
		var_03 = randomfloatrange(0,1);
		lib_A59E::func_1857(param_02,"wingtip_green","tag_left_wingtip","vfx/lights/aircraft_light_wingtip_green","running",var_03);
		lib_A59E::func_1857(param_02,"wingtip_red","tag_right_wingtip","vfx/lights/aircraft_light_wingtip_red","running",var_03);
	}

	lib_A59E::func_1854();
}

//Function Number: 2
lib_A628::func_4D0D()
{
	thread lib_A628::func_6A40();
	thread lib_A628::func_3B2A();
	if(self.model != "vehicle_av8b_harrier_jet")
	{
		lib_A59E::func_9CFA("running");
	}

	thread lib_A628::func_54B1();
}

//Function Number: 3
lib_A628::func_7EF4(param_00)
{
	var_01 = "rope_test";
	precachemodel(var_01);
	return param_00;
}

//Function Number: 4
lib_A628::func_54B1()
{
	self method_8115(#animtree);
	self method_814B(%mig_landing_gear_up);
}

//Function Number: 5
lib_A628::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 1;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	return var_00;
}

//Function Number: 6
lib_A628::func_6A40()
{
	self endon("death");
	self endon("stop_engineeffects");
	lib_A59A::func_32DC("engineeffects");
	lib_A59A::func_32DD("engineeffects");
	var_00 = common_scripts\utility::getfx("engineeffect");
	for(;;)
	{
		lib_A59A::func_32DF("engineeffects");
		playfxontag(var_00,self,"tag_engine_right");
		playfxontag(var_00,self,"tag_engine_left");
		lib_A59A::func_32E3("engineeffects");
		stopfxontag(var_00,self,"tag_engine_left");
		stopfxontag(var_00,self,"tag_engine_right");
	}
}

//Function Number: 7
lib_A628::func_6A1F()
{
	playfxontag(level._effect["afterburner"],self,"tag_engine_right");
	playfxontag(level._effect["afterburner"],self,"tag_engine_left");
}

//Function Number: 8
lib_A628::func_6A35()
{
	playfxontag(level._effect["contrail"],self,"tag_right_wingtip");
	playfxontag(level._effect["contrail"],self,"tag_left_wingtip");
}

//Function Number: 9
lib_A628::func_8ED9()
{
	stopfxontag(level._effect["contrail"],self,"tag_right_wingtip");
	stopfxontag(level._effect["contrail"],self,"tag_left_wingtip");
}

//Function Number: 10
lib_A628::func_3B2A()
{
	level endon("death");
	var_00 = 45;
	var_01 = 0;
	while(isdefined(self))
	{
		var_02 = self.var_41;
		var_03 = var_02[0];
		var_04 = var_02[2];
		var_05 = 0;
		if((var_04 > var_00 && var_04 < 360 - var_00) || var_04 < -1 * var_00 && var_04 > -1 * 360 - var_00)
		{
			var_05 = 1;
		}

		if((var_03 > var_00 && var_03 < 360 - var_00) || var_03 < -1 * var_00 && var_03 > -1 * 360 - var_00)
		{
			var_05 = 1;
		}

		if(var_05 && !var_01)
		{
			lib_A628::func_6A35();
			var_01 = 1;
			continue;
		}

		if(!var_05 && var_01)
		{
			lib_A628::func_8ED9();
			var_01 = 0;
		}

		wait 0.05;
	}
}

//Function Number: 11
lib_A628::func_6CCF(param_00)
{
	var_01 = lib_A628::func_6CD0(param_00);
	if(var_01)
	{
		var_02 = 1;
	}
	else
	{
		var_02 = -1;
	}

	var_03 = common_scripts\utility::flat_origin(param_00.var_2E6);
	var_04 = var_03 + anglestoforward(common_scripts\utility::flat_angle(param_00.var_41)) * var_02 * 100000;
	var_05 = pointonsegmentnearesttopoint(var_03,var_04,level.var_31D.var_2E6);
	var_06 = distance(var_03,var_05);
	if(var_06 < 3000)
	{
		return 1;
	}

	return 0;
}

//Function Number: 12
lib_A628::func_6CD0(param_00)
{
	var_01 = anglestoforward(common_scripts\utility::flat_angle(param_00.var_41));
	var_02 = vectornormalize(common_scripts\utility::flat_origin(level.var_31D.var_2E6) - param_00.var_2E6);
	var_03 = vectordot(var_01,var_02);
	if(var_03 > 0)
	{
		return 1;
	}

	return 0;
}

//Function Number: 13
lib_A628::func_6874(param_00,param_01)
{
	lib_A628::func_6875("veh_mig29_dist_loop","veh_mig29_sonic_boom");
}

//Function Number: 14
lib_A628::func_6875(param_00,param_01)
{
	self waittill("trigger",var_02);
	var_02 endon("death");
	thread lib_A628::func_6874();
	var_02 thread common_scripts\utility::play_loop_sound_on_entity(param_00);
	while(lib_A628::func_6CD0(var_02))
	{
		wait(0.05);
	}

	wait(0.5);
	var_02 thread common_scripts\utility::play_sound_in_space(param_01);
	var_02 waittill("reached_end_node");
	var_02 lib_A628::func_8EC3(param_00);
	var_02 delete();
}

//Function Number: 15
lib_A628::func_686C()
{
	level._effect["plane_bomb_explosion1"] = loadfx("vfx/ambient_explosion_midair_runner_single");
	level._effect["plane_bomb_explosion2"] = loadfx("vfx/ambient_explosion_midair_runner_single");
	self waittill("trigger",var_00);
	var_00 endon("death");
	thread lib_A628::func_686C();
	var_01 = getentarray(self.script_linkto,"script_linkname");
	var_01 = common_scripts\utility::get_array_of_closest(self.var_2E6,var_01,undefined,var_01.size);
	var_02 = 0;
	wait(randomfloatrange(0.3,0.8));
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		var_02++;
		if(var_02 == 3)
		{
			var_02 = 1;
		}

		var_01[var_03] thread lib_A59A::play_sound_on_entity("airstrike_explosion");
		playfx(level._effect["plane_bomb_explosion" + var_02],var_01[var_03].var_2E6);
		wait(randomfloatrange(0.3,1.2));
	}
}

//Function Number: 16
lib_A628::func_686B()
{
	self waittill("trigger",var_00);
	var_00 endon("death");
	var_01 = var_00;
	var_01 thread lib_A628::func_686B();
	var_02 = spawn("script_model",var_01.var_2E6 - (0,0,100));
	var_02.var_41 = var_01.var_41;
	var_02 setmodel("projectile_cbu97_clusterbomb");
	var_03 = anglestoforward(var_01.var_41) * 2;
	var_04 = anglestoup(var_01.var_41) * -0.2;
	var_05 = [];
	for(var_06 = 0;var_06 < 3;var_06++)
	{
		var_05[var_06] = var_03[var_06] + var_04[var_06] / 2;
	}

	var_05 = (var_05[0],var_05[1],var_05[2]);
	var_05 = var_05 * 7000;
	var_02 gravitymove(var_05,2);
	wait(1.2);
	var_07 = spawn("script_model",var_02.var_2E6);
	var_07 setmodel("tag_origin");
	var_07.var_2E6 = var_02.var_2E6;
	var_07.var_41 = var_02.var_41;
	wait(0.05);
	var_02 delete();
	var_02 = var_07;
	var_08 = var_02.var_2E6;
	var_09 = var_02.var_41;
	playfxontag(level.var_99B,var_02,"tag_origin");
	wait(1.6);
	var_0A = 12;
	var_0B = 5;
	var_0C = 55;
	var_0D = var_0C - var_0B / var_0A;
	for(var_06 = 0;var_06 < var_0A;var_06++)
	{
		var_0E = anglestoforward(var_09 + (var_0C - var_0D * var_06,randomint(10) - 5,0));
		var_0F = var_08 + var_0E * 10000;
		var_10 = bullettrace(var_08,var_0F,0,undefined);
		var_11 = var_10["position"];
		radiusdamage(var_11 + (0,0,16),512,400,30);
		if(var_06 % 3 == 0)
		{
			thread common_scripts\utility::play_sound_in_space("airstrike_explosion",var_11);
			playrumbleonposition("artillery_rumble",var_11);
			earthquake(0.7,0.75,var_11,1000);
		}

		wait(0.75 / var_0A);
	}

	wait(1);
	var_02 delete();
}

//Function Number: 17
lib_A628::func_8EC3(param_00)
{
	self notify("stop sound" + param_00);
}