/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42409.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:27 PM
*******************************************************************/

//Function Number: 1
lib_A5A9::func_70F6(param_00)
{
	iprintlnbold("RAIN");
	level notify("rain_change","hard",param_00);
	level thread lib_A5A9::func_70F5(10,param_00);
	wait(param_00 * 0.5);
	level.var_B3A["rain"] = "";
	wait(param_00 * 0.5);
}

//Function Number: 2
lib_A5A9::func_70FC(param_00)
{
	level notify("rain_change","hard",param_00);
	level thread lib_A5A9::func_70F5(8,param_00);
	wait(param_00 * 0.5);
	level.var_B3A["rain"] = "";
	wait(param_00 * 0.5);
}

//Function Number: 3
lib_A5A9::func_70FB(param_00)
{
	level notify("rain_change","light",param_00);
	level thread lib_A5A9::func_70F5(5,param_00);
	wait(param_00 * 0.5);
	level.var_B3A["rain"] = "light";
	wait(param_00 * 0.5);
}

//Function Number: 4
lib_A5A9::func_70FD(param_00)
{
	level notify("rain_change","none",param_00);
	level thread lib_A5A9::func_70F5(0,param_00);
	wait(param_00 * 0.5);
	level.var_B3A["rain"] = "norain";
	wait(param_00 * 0.5);
}

//Function Number: 5
lib_A5A9::func_70F7(param_00)
{
	common_scripts\utility::flag_init("_weather_lightning_enabled");
	common_scripts\utility::flag_set("_weather_lightning_enabled");
	if(param_00 == "none")
	{
		level.var_70F8 = 0;
		level._effect["rain_drops"] = level._effect["rain_" + level.var_70F8];
		lib_A5A9::func_70FD(0.1);
		return;
	}

	if(param_00 == "light")
	{
		level.var_70F8 = 5;
		level._effect["rain_drops"] = level._effect["rain_" + level.var_70F8];
		lib_A5A9::func_70FB(0.1);
		return;
	}

	level.var_70F8 = 10;
	level._effect["rain_drops"] = level._effect["rain_" + level.var_70F8];
	lib_A5A9::func_70F6(0.1);
}

//Function Number: 6
lib_A5A9::func_5731(param_00,param_01)
{
	[[ param_00 ]]();
	waittillframeend;
	lib_A5A9::func_573F(param_00,param_01);
}

//Function Number: 7
lib_A5A9::func_70F5(param_00,param_01)
{
	level notify("rain_level_change");
	level endon("rain_level_change");
	if(level.var_70F8 > param_00)
	{
		var_02 = level.var_70F8 - param_00;
		param_01 = param_01 / var_02;
		for(var_03 = 0;var_03 < var_02;var_03++)
		{
			wait(param_01);
			level.var_70F8--;
			level._effect["rain_drops"] = level._effect["rain_" + level.var_70F8];
		}
	}

	if(level.var_70F8 < param_00)
	{
		var_02 = param_00 - level.var_70F8;
		param_01 = param_01 / var_02;
		for(var_03 = 0;var_03 < var_02;var_03++)
		{
			wait(param_01);
			level.var_70F8++;
			level._effect["rain_drops"] = level._effect["rain_" + level.var_70F8];
		}
	}
}

//Function Number: 8
lib_A5A9::func_07FE(param_00)
{
	if(!isdefined(level.var_573C))
	{
		level.var_573C = [];
		level.var_573D = 0;
	}

	level.var_573C[level.var_573C.size] = param_00;
}

//Function Number: 9
lib_A5A9::func_6D91()
{
	var_00 = getentarray("player","classname")[0];
	for(;;)
	{
		playfx(level._effect["rain_drops"],var_00.var_2E6 + (0,0,650),var_00.var_2E6 + (0,0,680));
		wait(0.3);
	}
}

//Function Number: 10
lib_A5A9::func_70F9()
{
	if(level.var_70F8 == 0)
	{
		return randomfloat(30);
	}

	if(level.var_70F8 == 1)
	{
		return randomfloat(24);
	}

	if(level.var_70F8 == 2)
	{
		return randomfloat(20);
	}

	if(level.var_70F8 == 3)
	{
		return randomfloat(15);
	}

	if(level.var_70F8 == 4)
	{
		return randomfloat(12);
	}

	if(level.var_70F8 == 5)
	{
		return randomfloat(9);
	}

	if(level.var_70F8 == 6)
	{
		return randomfloat(8);
	}

	if(level.var_70F8 == 7)
	{
		return randomfloat(8);
	}

	if(level.var_70F8 == 8)
	{
		return randomfloat(7);
	}

	if(level.var_70F8 == 9)
	{
		return randomfloat(6);
	}

	if(level.var_70F8 == 10)
	{
		return randomfloat(5);
	}
}

//Function Number: 11
lib_A5A9::func_70FA()
{
	if(level.var_70F8 == 0)
	{
		return 20;
	}

	if(level.var_70F8 == 1)
	{
		return 18;
	}

	if(level.var_70F8 == 2)
	{
		return 16;
	}

	if(level.var_70F8 == 3)
	{
		return 14;
	}

	if(level.var_70F8 == 4)
	{
		return 12;
	}

	if(level.var_70F8 == 5)
	{
		return 10;
	}

	if(level.var_70F8 == 6)
	{
		return 9;
	}

	if(level.var_70F8 == 7)
	{
		return 8;
	}

	if(level.var_70F8 == 8)
	{
		return 7;
	}

	if(level.var_70F8 == 9)
	{
		return 6;
	}

	if(level.var_70F8 == 10)
	{
		return 5;
	}
}

//Function Number: 12
lib_A5A9::func_573F(param_00,param_01)
{
	level endon("rain_change");
	var_02 = gettime() + lib_A5A9::func_70FA() + lib_A5A9::func_70F9() * 1000;
	if(var_02 < level.var_60CA)
	{
		level.var_60CA = var_02;
	}

	for(;;)
	{
		common_scripts\utility::flag_wait("_weather_lightning_enabled");
		var_03 = level.var_60CA - gettime() * 0.001;
		if(var_03 > 0)
		{
			wait(var_03);
		}

		if(!common_scripts\utility::flag("_weather_lightning_enabled"))
		{
			continue;
		}

		lib_A5A9::func_573E(param_00,param_01);
		level.var_60CA = gettime() + lib_A5A9::func_70FA() + lib_A5A9::func_70F9() * 1000;
	}
}

//Function Number: 13
lib_A5A9::func_3961(param_00)
{
	if(isdefined(level.var_573D))
	{
		common_scripts\_exploder::exploder(level.var_573C[level.var_573D]);
	}

	[[ param_00 ]]();
}

//Function Number: 14
lib_A5A9::func_573E(param_00,param_01,param_02)
{
	var_03[0] = "quick";
	var_03[1] = "double";
	var_03[2] = "triple";
	thread lib_A5A9::func_933C();
	if(!isdefined(param_02))
	{
		param_02 = randomint(var_03.size);
	}

	var_04 = 0;
	if(isdefined(level.var_573D))
	{
		while(var_04 == level.var_573D)
		{
			var_04 = randomint(level.var_573C.size);
		}

		level.var_573D = var_04;
	}

	switch(var_03[param_02])
	{
		case "quick":
			break;

		case "double":
			break;

		case "triple":
			break;
	}
}

//Function Number: 15
lib_A5A9::func_933C()
{
	if(level.var_70F8 == 0)
	{
		wait(6 + randomfloat(2));
	}
	else if(level.var_70F8 == 1)
	{
		wait(5 + randomfloat(1.8));
	}
	else if(level.var_70F8 == 2)
	{
		wait(4.5 + randomfloat(1.6));
	}
	else if(level.var_70F8 == 3)
	{
		wait(4 + randomfloat(1.6));
	}
	else if(level.var_70F8 == 4)
	{
		wait(3.5 + randomfloat(1.5));
	}
	else if(level.var_70F8 == 5)
	{
		wait(3 + randomfloat(1.5));
	}
	else if(level.var_70F8 == 6)
	{
		wait(2.5 + randomfloat(1.2));
	}
	else if(level.var_70F8 == 7)
	{
		wait(2 + randomfloat(1));
	}
	else if(level.var_70F8 == 8)
	{
		wait(1.9 + randomfloat(0.5));
	}
	else if(level.var_70F8 == 9)
	{
		wait(1.5);
	}
	else if(level.var_70F8 == 10)
	{
		wait(1);
	}

	var_00 = spawn("script_origin",(0,0,0));
	var_00.var_2E6 = level.var_31D.var_2E6 + (0,0,60);
	var_00 linkto(level.var_31D);
	if(level.var_70F8 <= 8)
	{
		var_00 playsoundasmaster("elm_thunder_distant","sounddone");
	}
	else
	{
		var_00 playsoundasmaster("elm_thunder_distant","sounddone");
		var_00 thread lib_A59A::play_sound_on_entity("elm_thunder_strike");
	}

	var_00 waittill("sounddone");
	var_00 delete();
}