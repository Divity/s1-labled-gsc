/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42453.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 25
 * Decompile Time: 17 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5D5::func_5FF1()
{
	lib_A5D5::func_0B85();
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	level.var_55B.var_5FF8 = spawnstruct();
	level.var_55B.var_5FF8.var_24B3 = [];
	level.var_55B.var_5FF8.var_24CC = "";
	level.var_55B.var_5FF8.var_6F34 = "";
	level.var_55B.var_5FF8.var_30A1 = 0;
	level.var_55B.var_5FF8.var_3335 = [[0,0.5],[0.9,1],[1,1]];
	thread lib_A5D5::func_600C();
}

//Function Number: 2
lib_A5D5::func_5FF4(param_00,param_01,param_02,param_03,param_04)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_05 = undefined;
	var_06 = lib_A5D5::func_5FF0();
	var_07 = lib_A5D5::func_6009(param_00);
	var_08 = var_07["fade_in_time"];
	if(isdefined(param_01))
	{
		var_08 = param_01;
	}

	var_09 = 2;
	if(isdefined(var_06))
	{
		if(isdefined(param_02))
		{
			var_09 = param_02;
		}
		else if(isdefined(param_01))
		{
			var_09 = param_01;
		}
		else if(isdefined(var_06["fade_out_time"]))
		{
			var_09 = var_06["fade_out_time"];
		}
	}

	var_0A = var_07["volume"];
	if(isdefined(param_03))
	{
		var_0A = param_03;
	}

	lib_A5D5::func_600D(var_07["name"],var_08,var_09,var_0A,param_04);
}

//Function Number: 3
lib_A5D5::func_5FF5(param_00)
{
	var_01 = 3;
	if(lib_A5D5::func_5FF2())
	{
		var_02 = lib_A5D5::func_600B(level.var_55B.var_5FF8.var_24CC);
		var_01 = var_02["fade_out_time"];
	}

	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	lib_A5D5::func_600E(var_01);
}

//Function Number: 4
lib_A5D5::func_5FF2()
{
	return isdefined(level.var_55B.var_5FF8.var_24CC) && level.var_55B.var_5FF8.var_24CC != "";
}

//Function Number: 5
lib_A5D5::func_5FF0()
{
	var_00 = undefined;
	if(lib_A5D5::func_5FF2())
	{
		var_00 = lib_A5D5::func_600B(level.var_55B.var_5FF8.var_24CC);
	}

	return var_00;
}

//Function Number: 6
lib_A5D5::func_6009(param_00)
{
	var_01 = lib_A5D5::func_600B(param_00);
	if(!isdefined(var_01))
	{
		var_01 = [];
		var_01["alias"] = param_00;
		var_01["volume"] = 1;
		var_01["fade_in_time"] = 1.5;
		var_01["fade_out_time"] = 1.5;
		var_01["auto_mix"] = 0;
		var_01["name"] = param_00;
		lib_A5D5::func_6008(var_01);
	}

	return var_01;
}

//Function Number: 7
lib_A5D5::func_600D(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 0;
	if(isdefined(param_04))
	{
		var_05 = param_04;
	}

	if(param_00 == level.var_55B.var_5FF8.var_24CC && !var_05)
	{
		return;
	}

	var_06 = level.var_55B.var_5FF8.var_6F34;
	var_07 = level.var_55B.var_5FF8.var_24CC;
	level.var_55B.var_5FF8.var_6F34 = level.var_55B.var_5FF8.var_24CC;
	level.var_55B.var_5FF8.var_24CC = param_00;
	var_08 = lib_A5D5::func_600B(level.var_55B.var_5FF8.var_24CC);
	var_09 = lib_A5D5::func_600B(level.var_55B.var_5FF8.var_6F34);
	var_0A = undefined;
	if(isdefined(var_09))
	{
		var_0A = var_09["alias"];
	}

	lib_A5D9::func_864F(var_08["alias"],param_01,param_02,param_03,var_0A);
}

//Function Number: 8
lib_A5D5::func_600E(param_00)
{
	lib_A5D9::func_8653(param_00);
}

//Function Number: 9
lib_A5D5::func_600A()
{
	return level.var_55B.var_5FF8.var_30A1;
}

//Function Number: 10
lib_A5D5::func_600B(param_00)
{
	return level.var_55B.var_5FF8.var_24B3[param_00];
}

//Function Number: 11
lib_A5D5::func_6008(param_00)
{
	level.var_55B.var_5FF8.var_24B3[param_00["name"]] = param_00;
}

//Function Number: 12
lib_A5D5::func_600C()
{
	if(lib_A5D5::func_600A())
	{
		var_00 = 1;
		for(;;)
		{
			wait(var_00);
			if(lib_A5D5::func_600A())
			{
				var_01 = lib_A5D2::func_F34();
				var_02 = lib_A5D2::deprecated_aud_map(var_01,level.var_55B.var_5FF8.var_3335);
			}
		}
	}
}

//Function Number: 13
lib_A5D5::func_0B85()
{
	level._snd.var_54F = spawnstruct();
	level._snd.var_54F.var_24CE = 0;
	level._snd.var_54F.var_24D2 = "";
	lib_A5DE::snd_register_message("ams_start",::lib_A5D5::func_0B8C);
	lib_A5DE::snd_register_message("ams_stop",::lib_A5D5::func_0B8D);
	lib_A5DE::snd_register_message("ams_set_state",::lib_A5D5::func_0B8B);
	lib_A5DE::snd_register_message("ams_set_proxy_vehicle",::lib_A5D5::func_0B8A);
	lib_A5DE::snd_register_message("ams_set_intensity",::lib_A5D5::func_0B89);
	lib_A5DA::func_11A3("ams_intensity",::lib_A5D5::func_0B86);
	lib_A5DA::func_11A3("ams_proxy_vehicle_speed",::lib_A5D5::func_0B88);
}

//Function Number: 14
lib_A5D5::func_0B8C(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A5D5::func_0B8E();
	var_04.var_7042 = lib_A5DA::func_1194();
	var_05 = 3;
	var_06 = 3;
	if(isdefined(param_00) && !isstring(param_00))
	{
		var_07 = param_00;
		param_00 = var_07.var_6F1E;
		param_01 = var_07.var_4DCF;
		param_02 = var_07.var_35EE;
		param_03 = var_07.var_35F3;
	}
	else
	{
	}

	lib_A5D5::func_0B8B(param_01);
	var_08 = spawnstruct();
	var_08.var_6F1E = param_00;
	var_08.var_35EE = lib_A5D2::func_F30(var_05,param_02);
	var_08.var_35F3 = lib_A5D2::func_F30(var_06,param_03);
	var_04.var_7042 lib_A5DE::snd_message("snd_start_vehicle",var_08);
}

//Function Number: 15
lib_A5D5::func_0B8D(param_00)
{
	param_00 = lib_A5D2::func_F30(3,param_00);
	var_01 = lib_A5D5::func_0B8F();
	var_01 lib_A5DE::snd_message("snd_stop_vehicle",param_00);
	var_01 delete();
}

//Function Number: 16
lib_A5D5::func_0B84()
{
	return level._snd.var_54F.var_24D2;
}

//Function Number: 17
lib_A5D5::func_0B8B(param_00)
{
	level._snd.var_54F.var_24D2 = param_00;
}

//Function Number: 18
lib_A5D5::func_0B89(param_00)
{
	var_01 = lib_A5D5::func_0B8E();
	var_01.var_24CE = param_00;
}

//Function Number: 19
lib_A5D5::func_0B8A(param_00)
{
	level._snd.var_54F.var_7042.var_9C70 = param_00;
}

//Function Number: 20
lib_A5D5::func_0B86()
{
	return lib_A5D5::func_0B8E().var_24CE;
}

//Function Number: 21
lib_A5D5::func_0B87()
{
	return level.var_31D.health;
}

//Function Number: 22
lib_A5D5::func_0B88()
{
	var_00 = 0;
	var_01 = lib_A5DA::func_11CA();
	var_02 = lib_A5D5::func_0B90();
	if(isdefined(var_02))
	{
		var_00 = var_02 veh_getspeed();
	}

	return var_00;
}

//Function Number: 23
lib_A5D5::func_0B8E()
{
	return level._snd.var_54F;
}

//Function Number: 24
lib_A5D5::func_0B8F()
{
	return level._snd.var_54F.var_7042;
}

//Function Number: 25
lib_A5D5::func_0B90()
{
	var_00 = undefined;
	var_01 = lib_A5D5::func_0B8F();
	if(isdefined(var_01))
	{
		var_00 = level._snd.var_54F.var_7042.var_9C70;
	}

	return var_00;
}