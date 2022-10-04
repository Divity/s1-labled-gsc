/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_drop_pod_credits.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 486 ms
 * Timestamp: 4/20/2022 8:21:41 PM
*******************************************************************/

//Function Number: 1
func_2455()
{
	level.var_9BEF = [];
	level.var_9BF0 = [];
	level.var_9BEE = [];
	level.var_244E = 0.85;
	var_00 = 16;
	if(level.console)
	{
		var_01 = [33,110,var_00 + 2,"left","middle","left","middle"];
	}
	else
	{
		var_01 = [76,110,var_01 + 2,"left","middle","left","middle"];
	}

	var_02 = [-350,-110,var_00,"left","middle"];
	var_03 = [300,-110,var_00,"right","middle"];
	var_04 = [-350,150,var_00,"left","middle"];
	var_05 = [300,150,var_00,"right","middle"];
	func_84E8(var_01);
}

//Function Number: 2
func_2451(param_00)
{
	var_01 = 1;
	while(!common_scripts\utility::flag("kill_credits"))
	{
		while(common_scripts\utility::flag("pause_credits"))
		{
			level.var_244E = 0.55;
			wait 0.05;
		}

		if(var_01)
		{
			var_02 = [param_00[0],param_00[1]];
			common_scripts\utility::flag_set("pause_credits");
		}
		else
		{
			var_02 = param_00;
		}

		var_01 = 0;
		foreach(var_04 in var_02)
		{
			if(!common_scripts\utility::flag("kill_credits"))
			{
				thread func_707E(var_04);
				wait(6.25);
			}
		}

		param_00 = common_scripts\utility::array_randomize(param_00);
	}
}

//Function Number: 3
func_84E8(param_00)
{
	wait(2);
	var_01 = func_3E94(param_00,&"SEOUL_CREDITS_SHG_DEVELOPMENT",3);
	lib_A59A::delaythread(3,::func_92AC,var_01,0.2);
	thread lib_A59A::delaythread(4.5,::func_35E0,var_01,0,1,4);
	wait(5);
	var_02 = func_3E94(param_00,&"SEOUL_CREDITS_ASSOCIATION_WITH",2);
	thread lib_A59A::delaythread(6.5,::func_35E0,var_02,0,1);
	wait(2);
	var_03 = func_3E94(param_00,&"SEOUL_CREDITS_RAVEN_SOFT",1);
	thread lib_A59A::delaythread(3.5,::func_35E0,var_03,0,1);
	wait(1.25);
	var_04 = func_3E94(param_00,&"SEOUL_CREDITS_HIGHMOON",0);
	thread lib_A59A::delaythread(3.5,::func_35E0,var_04,0,1);
	wait(3.7);
	var_05 = func_3E94(param_00,&"SEOUL_CREDITS_COD_AW",3,1);
	wait(4);
}

//Function Number: 4
func_84C6(param_00)
{
	var_01 = [param_00[0],param_00[1],param_00[2] + 3,param_00[3],param_00[4]];
	var_02 = func_3E94(var_01,&"SEOUL_CREDITS_DIRECTED_BY",3,1);
	thread lib_A59A::delaythread(8,::func_35E0,var_02,0,1);
	wait(2);
	var_03 = func_3E94(var_01,&"SEOUL_CREDITS_GLEN_SCHOFIELD",2);
	lib_A59A::delaythread(1,::func_92AC,var_03,0.2);
	thread lib_A59A::delaythread(3.5,::func_35E0,var_03,0,1);
	wait(2);
	var_04 = func_3E94(var_01,&"SEOUL_CREDITS_MICHAEL_CONDREY",1);
	lib_A59A::delaythread(1,::func_92AC,var_04,0.2);
	thread lib_A59A::delaythread(3.5,::func_35E0,var_04,0,1);
	wait(4);
}

//Function Number: 5
func_3E94(param_00,param_01,param_02,param_03)
{
	var_04 = 18;
	var_05 = lib_A56F::func_3E6D(param_00[0],param_00[1],param_00[2],param_00[3],param_00[4],param_02 * -1,(0.75,0.85,0.87),(0.25,0.25,0.3),param_00[5],param_00[6]);
	var_05.var_92BB = param_01;
	var_05.alpha = 0;
	var_05 fadeovertime(1.25);
	var_05.alpha = level.var_244E;
	var_05.var_18C = 1.85;
	var_05 settext(param_01);
	if(isdefined(param_03) && param_03)
	{
		var_05 setpulsefx(50,6000,700);
	}

	return var_05;
}

//Function Number: 6
func_707E(param_00)
{
	var_01 = func_3E48(6);
	var_02 = [];
	foreach(var_05, var_04 in var_01)
	{
		var_02[var_05] = lib_A56F::func_3E6D(param_00[0],param_00[1],param_00[2],param_00[3],param_00[4],var_05 * -1,(0.75,0.85,0.87),(0.25,0.25,0.3));
		var_02[var_05] settext(var_04);
		var_02[var_05].alpha = 0;
		var_02[var_05].var_92BB = var_04;
	}

	foreach(var_07 in var_02)
	{
		thread func_35E0(var_07);
		wait(0.2);
	}

	wait(3);
	var_08 = common_scripts\utility::array_randomize(var_02);
	foreach(var_07 in var_08)
	{
		thread func_35E0(var_07,0);
		wait(randomfloat(0.5));
	}

	foreach(var_07 in var_08)
	{
		while(!var_07.var_D7F)
		{
			wait 0.05;
		}

		var_07 destroy();
	}
}

//Function Number: 7
func_3E48(param_00)
{
	var_01 = [];
	var_02 = common_scripts\utility::array_combine(level.var_244F,level.var_2450);
	var_03 = common_scripts\utility::array_combine(level.var_9BEF,level.var_9BF0);
	var_04 = level.var_2450;
	var_05 = var_02;
	while(var_01.size < param_00 && level.var_9BEE.size < var_02.size)
	{
		var_06 = min(int(param_00 / 2),level.var_2450.size - level.var_9BF0.size);
		if(var_01.size < var_06)
		{
			var_07 = common_scripts\utility::random(var_04);
		}
		else
		{
			var_07 = common_scripts\utility::random(var_05);
		}

		if(common_scripts\utility::array_contains(level.var_9BEE,var_07))
		{
			continue;
		}

		if(common_scripts\utility::array_contains(var_01,var_07))
		{
			continue;
		}

		if(common_scripts\utility::array_contains(level.var_244F,var_07))
		{
			level.var_9BEF[level.var_9BEF.size] = var_07;
		}
		else
		{
			level.var_9BF0[level.var_9BF0.size] = var_07;
		}

		var_01[var_01.size] = var_07;
		level.var_9BEE[level.var_9BEE.size] = var_07;
	}

	var_01 = common_scripts\utility::alphabetize(var_01);
	var_01 = common_scripts\utility::array_reverse(var_01);
	return var_01;
}

//Function Number: 8
func_0AFA(param_00,param_01)
{
	var_02 = [];
	var_03 = [];
	foreach(var_05 in param_00)
	{
		var_06[0] = var_05;
		var_06[1] = func_3DA8(var_05,param_01);
		var_03[var_03.size] = var_06;
	}

	var_08 = 0;
	foreach(var_0A in var_03)
	{
		var_02[var_0A[1]] = var_0A[0];
	}

	var_0B = [];
	foreach(var_0D in var_02)
	{
		var_0B[var_0B.size] = var_0D;
	}

	return var_0B;
}

//Function Number: 9
func_3DA8(param_00,param_01)
{
	var_02 = undefined;
	foreach(var_05, var_04 in param_01)
	{
		if(var_04 == param_00)
		{
			return var_05;
		}
	}
}

//Function Number: 10
func_35E0(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		param_01 = level.var_244E;
	}

	param_00.var_D7F = 0;
	if(!isdefined(param_03))
	{
		param_03 = randomfloatrange(0.5,1.25);
	}

	param_00 fadeovertime(param_03);
	param_00.alpha = param_01;
	param_00 fadeovertime(param_03);
	wait(param_03);
	if(isdefined(param_00))
	{
		param_00.var_D7F = 1;
	}

	if(isdefined(param_02) && isdefined(param_00))
	{
		param_00 destroy();
	}
}

//Function Number: 11
func_92AC(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = 0.85;
	}

	param_00.var_D7F = 0;
	if(!isdefined(param_02))
	{
		param_02 = randomfloatrange(0.5,1.25);
	}

	var_03 = param_00.glowcolor;
	wait(param_02);
	var_04 = randomintrange(30,40);
	for(var_05 = 0;var_05 < var_04;var_05++)
	{
		if(!isdefined(param_00))
		{
			return;
		}

		var_06 = param_00.glowcolor;
		if(common_scripts\utility::cointoss())
		{
			if(common_scripts\utility::cointoss())
			{
				var_06 = (param_00.glowcolor[0] / 2,param_00.glowcolor[1] / 2,param_00.glowcolor[2] / 2 - randomfloat(1));
			}
			else if(param_00.glowcolor[0] > 0.15)
			{
				var_06 = (param_00.glowcolor[0] * 2,param_00.glowcolor[1] * 2,param_00.glowcolor[2] * 2 * randomfloatrange(1,1.5));
			}

			param_00.glowcolor = var_06;
			param_00.glowalpha = randomfloat(1);
		}
		else if(common_scripts\utility::cointoss())
		{
			if(common_scripts\utility::cointoss())
			{
				param_00.alpha = level.var_244E * 0.7;
			}
			else
			{
				param_00.alpha = level.var_244E;
			}
		}

		wait 0.05;
	}

	if(!isdefined(param_00))
	{
		return;
	}

	param_00.glowcolor = var_03;
	param_00.glowalpha = param_01;
	param_00.alpha = level.var_244E;
	param_00.var_D7F = 1;
}

//Function Number: 12
func_8AFD(param_00,param_01)
{
	var_02 = newclienthudelem(level.var_31D);
	var_02.var_32F = 1;
	var_02.alignx = "center";
	var_02.aligny = "middle";
	var_02.foreground = 1;
	var_02.hidewheninmenu = 1;
	var_02.var_8CF4 = param_00;
	var_02.y = param_01;
	return var_02;
}