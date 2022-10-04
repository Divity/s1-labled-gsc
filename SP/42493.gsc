/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42493.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:46 PM
*******************************************************************/

//Function Number: 1
lib_A5FD::main(param_00,param_01,param_02)
{
	precachemodel(param_00);
	lib_A59A::set_console_status();
	level._effect["pdrone_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_explosion");
	level._effect["pdrone_large_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_large_explosion");
	level._effect["kamikaze_drone_beacon_attack"] = loadfx("vfx/lights/light_drone_beacon_attack");
	lib_A59E::func_186C("attack_drone_kamikaze",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A5FD::func_4D0D);
	lib_A59E::func_1846(0.4,0.8,1024);
	lib_A59E::func_1856(499);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1855();
}

//Function Number: 2
lib_A5FD::func_4D0D()
{
	self.var_796E = 1;
	self.var_7953 = 0;
	self.var_2D2F = 1;
	self.var_2161 = self setcontents(0);
	self.var_4B9E = 1;
	self.delete_on_death = 1;
	thread lib_A5F9::func_E16();
	thread lib_A5FD::func_0E17();
	if(isdefined(self.script_parameters) && self.script_parameters == "diveboat_weapon_target")
	{
		self.var_2161 = self setcontents(self.var_2161);
		self.var_253C = ::lib_A5FD::func_4541;
		function_009A(self,(0,0,0));
		function_00A6(self,level.var_31D);
	}
}

//Function Number: 3
lib_A5FD::func_0E17()
{
	playfxontag(common_scripts\utility::getfx("kamikaze_drone_beacon_attack"),self,"tag_origin");
}

//Function Number: 4
lib_A5FD::func_4541()
{
	if(!isdefined(self))
	{
		return;
	}

	self.var_235D = 1;
	if(self.var_7AE9 != "allies" && !isdefined(self.owner) && isdefined(self.var_5512) && randomfloat(1) < 0.33)
	{
		if(randomfloat(1) < 0.5)
		{
			lib_A5FD::func_263E(self.var_5512);
		}
		else
		{
			thread lib_A5FD::func_264B(self.var_5512);
		}
	}
	else
	{
		lib_A5FD::func_68B1();
	}

	if(isdefined(self))
	{
		self notify("crash_done");
		self delete();
	}
}

//Function Number: 5
lib_A5FD::func_68B1()
{
	if(self.classname == "script_vehicle_pdrone_atlas_large")
	{
		playfx(common_scripts\utility::getfx("pdrone_large_death_explosion"),self gettagorigin("tag_origin"));
		lib_A5DE::snd_message("pdrone_death_explode");
		return;
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),self gettagorigin("tag_origin"));
	lib_A5DE::snd_message("pdrone_death_explode");
}

//Function Number: 6
lib_A5FD::func_264B(param_00)
{
	var_01 = spawn("script_model",self.var_2E6);
	var_01.var_41 = self.var_41;
	if(isdefined(self.var_2644))
	{
		var_01 setmodel(self.var_2644);
	}
	else
	{
		var_01 setmodel(self.model);
	}

	self hide();
	stopfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"tag_origin");
	playfxontag(common_scripts\utility::getfx("emp_drone_damage"),var_01,"TAG_ORIGIN");
	lib_A5DE::snd_message("pdrone_emp_death",var_01);
	var_02 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2] - 500);
	var_03 = physicstrace(self.var_2E6,var_02);
	var_04 = 0;
	var_05 = 5;
	var_06 = param_00.var_2E6 - var_01.var_2E6;
	var_06 = vectornormalize(var_06);
	var_07 = vectorcross((0,0,1),var_06);
	var_07 = vectornormalize(var_07);
	var_08 = 100;
	var_09 = var_01.var_2E6 + var_07 * var_08;
	var_0A = vectortoangles(var_01.var_2E6 - var_09);
	var_0B = 1;
	if(common_scripts\utility::cointoss())
	{
		var_0B = -1;
	}

	while(var_04 < 5)
	{
		wait(0.05);
		var_04 = var_04 + 0.05;
		var_0A = var_0A + (0,10,0) * var_0B;
		var_0C = lib_A59A::func_5768(clamp(var_04 / 3,0,1),2,30);
		var_09 = var_09 - (0,0,var_0C);
		var_0D = var_09 + anglestoforward(var_0A) * var_08;
		var_0E = physicstrace(var_01.var_2E6,var_0D,var_01);
		var_01.var_2E6 = var_0D;
		var_01.var_41 = var_01.var_41 + (0,50,0) * var_0B;
		var_0F = length(var_03 - var_01.var_2E6);
		if(var_0F < 60 || var_01.var_2E6[2] < var_03[2] + 15 || var_0E != var_0D)
		{
			break;
		}
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),var_01.var_2E6);
	lib_A5DE::snd_message("pdrone_crash_land",var_01.var_2E6);
	var_01 delete();
}

//Function Number: 7
lib_A5FD::func_263E(param_00)
{
	self.var_9D43 = 1;
	var_01 = param_00.var_2E6 - self.var_2E6;
	var_01 = vectornormalize(var_01);
	var_02 = vectorcross((0,0,1),var_01);
	var_02 = vectornormalize(var_02);
	if(common_scripts\utility::cointoss())
	{
		var_02 = var_02 * -1;
	}

	var_03 = param_00.var_2E6 - var_01 * (1,1,0) * 250 + var_02 * 250;
	var_03 = (var_03[0],var_03[1],self.var_2E6[2]);
	var_04 = common_scripts\utility::randomvectorincone(vectornormalize(var_03 - self.var_2E6),15);
	var_05 = self.var_2E6 + var_04 * 250;
	var_03 = physicstrace(self.var_2E6,var_05);
	self notify("newpath");
	self notify("deathspin");
	self veh_neargoalnotifydist(60);
	self veh_helisetgoal(var_03,lib_A5FD::func_2E9C("speed") * 0.75,lib_A5FD::func_2E9C("accel"),lib_A5FD::func_2E9C("decel"),undefined,undefined,0,0,0,0,0,0,0);
	common_scripts\utility::waittill_any("goal","near_goal");
	lib_A5FD::func_2648();
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
}

//Function Number: 8
lib_A5FD::func_2648()
{
	var_00 = spawn("script_model",self.var_2E6);
	var_00.var_41 = self.var_41;
	var_00 setmodel(self.model);
	self hide();
	if(!issubstr(self.classname,"_security"))
	{
		stopfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"tag_origin");
	}

	var_01 = 0;
	var_02 = self veh_getvelocity();
	var_03 = squared(0.05);
	var_04 = (0,0,-980);
	while(var_01 < 5)
	{
		wait(0.05);
		var_02 = var_04 * 0.05 + var_02;
		var_02 = function_0284(var_02,1000);
		var_05 = var_02 * 0.05 + var_04 * var_03 / 2;
		var_06 = var_00.var_2E6 + var_05;
		var_07 = physicstrace(var_00.var_2E6,var_06,var_00);
		if(var_07 != var_06)
		{
			break;
		}

		var_00.var_2E6 = var_06;
		var_00.var_41 = var_00.var_41 + (0,5,0);
		var_01 = var_01 + 0.05;
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),var_00.var_2E6);
	lib_A5DE::snd_message("pdrone_crash_land",var_00.var_2E6);
	var_00 delete();
}

//Function Number: 9
lib_A5FD::func_2E9C(param_00)
{
	return level.var_678B[self.classname][param_00];
}