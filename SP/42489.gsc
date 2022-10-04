/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42489.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5F9::func_0E19()
{
	var_00 = 0.1;
	var_01 = 3;
	var_02 = 5;
	var_03 = 0.05;
	var_04 = 0.85;
	var_05 = 1.2;
	if(!isdefined(level._snd))
	{
		level._snd = spawnstruct();
	}

	if(!isdefined(level._snd.var_7084))
	{
		level._snd.var_7084 = 0;
	}

	if(level._snd.var_7084 > var_01)
	{
		lib_A5F9::func_0E18(var_01);
		return;
	}

	if(!issubstr(self.classname,"queen"))
	{
		return;
	}

	level._snd.var_7084 = level._snd.var_7084 + 1;
	var_06 = self;
	var_07 = 20;
	var_08 = [[0,var_04],[var_07,var_05]];
	var_09 = ["attack_drone_queen_lp_near","attack_drone_queen_lp_med","attack_drone_queen_lp_dist"];
	var_0A = [];
	var_0B = "attack_drone_queen_audio_stop_notify" + lib_A5DE::func_8712();
	var_0C = 0;
	foreach(var_0E in var_09)
	{
		var_0A[var_0E] = var_06 lib_A5F1::func_873C(var_0E,var_0B,var_02,var_02);
	}

	while(isdefined(var_06) && var_06.classname != "script_vehicle_corpse")
	{
		var_10 = var_06 veh_getspeed();
		if(var_10 > var_07)
		{
			var_07 = var_10;
			var_08[var_08.size - 1][0] = var_07;
		}

		var_10 = lib_A5D2::func_1095(var_0C,var_10,var_03);
		var_0C = var_10;
		var_11 = lib_A5DE::func_8702(var_10,var_08);
		foreach(var_13 in var_0A)
		{
			if(isdefined(var_13) && !function_0294(var_13))
			{
				var_13 scalepitch(var_11,var_00);
			}
		}

		wait(var_00);
	}

	level notify(var_0B);
	level._snd.var_7084 = level._snd.var_7084 - 1;
}

//Function Number: 2
lib_A5F9::func_0E16()
{
	lib_A5F1::snd_play_linked("attack_drone_kamikazi","drone_kamikaze_crash");
	for(;;)
	{
		level waittill("drone_kamikaze_crash",var_00);
		if(function_0294(self))
		{
			break;
		}
	}

	if(level.var_31D getcurrentweapon() == "weapon_suv_door_shield_fl")
	{
		lib_A5F1::func_8728("seo_drone_suicide_door",var_00);
	}
}

//Function Number: 3
lib_A5F9::func_0E18(param_00)
{
	if(!isdefined(level._snd.var_2ED2))
	{
		var_01 = param_00 + 1;
		thread lib_A5F9::func_0E1A(var_01);
	}
	else
	{
		var_01 = level._snd.var_2ED2 + 1;
		if(randomint(100) > 75)
		{
			thread lib_A5F9::func_0E1A(var_01);
		}
	}

	level._snd.var_2ED2 = var_01;
}

//Function Number: 4
lib_A5F9::func_0E1A(param_00)
{
	var_01 = "Q-" + param_00 + ":  ";
	var_02 = "drone_swarm_flyby";
	var_03 = [];
	var_03[0] = 500;
	var_03[1] = 1500;
	var_04 = [];
	var_04[0] = 20;
	thread lib_A5DF::func_86B9(var_02,undefined,var_03,var_04,1,undefined,undefined,3,2);
}