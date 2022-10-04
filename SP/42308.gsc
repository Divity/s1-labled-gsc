/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42308.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 69
 * Decompile Time: 27 ms
 * Timestamp: 4/20/2022 8:23:18 PM
*******************************************************************/

//Function Number: 1
lib_A544::func_5702()
{
	if(!isdefined(level._light))
	{
		level._light = spawnstruct();
		lib_A544::func_570D();
		lib_A544::func_570A();
		lib_A544::func_570B();
		lib_A544::light_setup_common_flickerlight_presets();
		lib_A544::func_570E();
		lib_A544::light_message_init();
		thread lib_A544::func_4D51();
	}
}

//Function Number: 2
lib_A544::func_4D51()
{
	level.var_7B25 = 0;
	level.var_78B5 = undefined;
	wait(0.05);
}

//Function Number: 3
lib_A544::func_33F1(param_00)
{
	var_01 = level.var_78B4[param_00];
	var_01.state = 0;
	var_01.var_96CE[0] = 0;
	thread lib_A544::func_33F0(0,var_01);
	for(var_04 = 1;var_04 < var_01.var_96CE.size;var_04++)
	{
		lib_A59A::delaythread(var_01.time[var_04],::lib_A544::func_33F0,var_04,var_01);
	}
}

//Function Number: 4
lib_A544::func_7B2D(param_00,param_01)
{
	var_02 = getdvarint("scr_prim_edit_lights");
	var_03 = getdvarint("scr_prim_light_state");
	var_04 = getdvarint("scr_prim_light_num");
	var_05 = param_00.intensity["curr"];
	while(param_00.active)
	{
		var_06 = param_00.pos["curr"];
		var_07 = param_00.dir["curr"];
		var_08 = vectornormalize(anglestoforward(param_00.dir["curr"]));
		var_09 = param_00.pos["curr"];
		var_0A = param_00.intensity["curr"];
		var_0B = param_00.color["curr"];
		var_0C = param_00.var_4E3B["curr"];
		var_0D = param_00.var_65BB["curr"];
		var_0E = param_00.radius["curr"];
		var_0F = param_00.var_5705;
		if(isdefined(param_00.var_DDE))
		{
			var_13 = param_00.var_DF0.var_2E6;
			var_14 = vectornormalize(anglestoforward(param_00.var_DF0.var_41));
			var_15 = vectornormalize(anglestoup(param_00.var_DF0.var_41));
			var_16 = vectornormalize(anglestoright(param_00.var_DF0.var_41));
			var_17 = vectornormalize(var_14 * var_08[0] + var_15 * var_08[2] - var_16 * var_08[1]);
			var_18 = var_14 * var_06[0] + var_15 * var_06[2] - var_16 * var_06[1];
			param_00.var_6F7D unlink();
			param_00.var_6F7D.var_41 = vectortoangles(var_17);
			param_00.var_6F7D.var_2E6 = var_13 + var_18;
			if(isdefined(param_00.var_2004))
			{
				var_19 = param_00.var_2004 gettagorigin(param_00.var_2003);
				param_00.var_6F7D.var_41 = vectortoangles(vectornormalize(var_19 - param_00.var_6F7D.var_2E6));
			}

			if(isdefined(param_00.var_2005))
			{
				param_00.var_6F7D.var_41 = vectortoangles(vectornormalize(param_00.var_2005 - param_00.var_6F7D.var_2E6));
			}

			param_00.var_6F7D linkto(param_00.var_DF0);
		}
		else
		{
			param_00.var_6F7D.var_41 = var_07;
			if(isdefined(param_00.var_2004))
			{
				var_19 = param_00.var_2004 gettagorigin(param_00.var_2003);
				param_00.var_6F7D.var_41 = vectortoangles(vectornormalize(var_19 - param_00.var_6F7D.var_2E6));
			}

			if(isdefined(param_00.var_2005))
			{
				param_00.var_6F7D.var_41 = vectortoangles(vectornormalize(param_00.var_2005 - param_00.var_6F7D.var_2E6));
			}

			param_00.var_6F7D.var_2E6 = var_06;
		}

		param_00.var_6F7D setlightintensity(var_0A);
		param_00.var_6F7D method_8044(var_0B);
		param_00.var_6F7D method_8020(var_0D,var_0C);
		param_00.var_6F7D method_8046(var_0E);
		wait(0.05);
	}
}

//Function Number: 5
lib_A544::func_33F0(param_00,param_01)
{
	var_02 = param_01.var_96CE[param_00] * 20;
	var_03 = param_00 - 1;
	for(var_04 = 0;var_04 < var_02;var_04++)
	{
		var_05 = float(var_04) / var_02;
		var_06 = 1 - var_05;
		param_01.pos["curr"] = param_01.pos[param_00] * var_05 + param_01.pos[var_03] * var_06;
		param_01.dir["curr"] = param_01.dir[param_00] * var_05 + param_01.dir[var_03] * var_06;
		param_01.intensity["curr"] = param_01.intensity[param_00] * var_05 + param_01.intensity[var_03] * var_06;
		param_01.color["curr"] = param_01.color[param_00] * var_05 + param_01.color[var_03] * var_06;
		param_01.var_4E3B["curr"] = param_01.var_4E3B[param_00] * var_05 + param_01.var_4E3B[var_03] * var_06;
		param_01.var_65BB["curr"] = param_01.var_65BB[param_00] * var_05 + param_01.var_65BB[var_03] * var_06;
		param_01.radius["curr"] = param_01.radius[param_00] * var_05 + param_01.radius[var_03] * var_06;
		wait(0.05);
	}

	param_01.pos["curr"] = param_01.pos[param_00];
	param_01.dir["curr"] = param_01.dir[param_00];
	param_01.intensity["curr"] = param_01.intensity[param_00];
	param_01.color["curr"] = param_01.color[param_00];
	param_01.var_4E3B["curr"] = param_01.var_4E3B[param_00];
	param_01.var_65BB["curr"] = param_01.var_65BB[param_00];
	param_01.radius["curr"] = param_01.radius[param_00];
	param_01.state = param_00;
}

//Function Number: 6
lib_A544::func_8EB8(param_00)
{
	var_01 = level.var_78B4[param_00];
	var_01.active = 0;
	if(isdefined(var_01.var_DDE))
	{
		if(isdefined(var_01.var_6F7D))
		{
			var_01.var_6F7D unlink();
		}
	}
}

//Function Number: 7
lib_A544::func_8286(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(!isdefined(param_03))
	{
		param_03 = (0,0,0);
	}

	if(!isdefined(param_02))
	{
		param_02 = (0,0,0);
	}

	if(!isdefined(param_04))
	{
		param_04 = 5000;
	}

	if(!isdefined(param_05))
	{
		param_05 = (1,1,1);
	}

	if(!isdefined(param_06))
	{
		param_06 = 60;
	}

	if(!isdefined(param_07))
	{
		param_07 = 120;
	}

	if(!isdefined(param_0A))
	{
		param_0A = 50;
	}

	var_0B = spawnstruct();
	var_0B.var_5705 = param_01;
	var_0B.time[0] = 0;
	var_0B.dir[0] = param_03;
	var_0B.pos[0] = param_02;
	var_0B.active = 1;
	var_0B.color[0] = param_05;
	var_0B.var_4E3B[0] = param_06;
	var_0B.var_65BB[0] = param_07;
	var_0B.radius[0] = param_0A;
	var_0B.intensity[0] = param_04;
	var_0B.var_96CE[0] = 0;
	var_0B.dir["curr"] = param_03;
	var_0B.pos["curr"] = param_02;
	var_0B.color["curr"] = param_05;
	var_0B.var_4E3B["curr"] = param_06;
	var_0B.var_65BB["curr"] = param_07;
	var_0B.radius["curr"] = param_0A;
	var_0B.intensity["curr"] = 0.1;
	var_0B.state = -1;
	var_0B.var_6F7D = getent(param_00,"targetname");
	var_0B.var_DDE = undefined;
	var_0B.var_DDA = undefined;
	var_0C = undefined;
	if(isstring(param_08))
	{
		if(isstring(param_08))
		{
			var_0C = getent(param_08,"targetname");
			var_0B.var_DDE = var_0C;
		}
	}
	else
	{
		var_0C = param_08;
	}

	if(isdefined(var_0C))
	{
		var_0B.var_DDE = var_0C;
		if(!isdefined(var_0B.var_DDE))
		{
			var_0B.var_DDE = undefined;
		}

		if(isdefined(param_09) && isdefined(var_0B.var_DDE))
		{
			var_0B.var_DDA = param_09;
		}
		else
		{
			var_0B.var_DDA = undefined;
		}

		var_0B.var_DF0 = common_scripts\utility::spawn_tag_origin();
		if(isdefined(param_09))
		{
			var_0B.var_DF0.var_2E6 = var_0C gettagorigin(param_09);
			var_0B.var_DF0 linkto(var_0C,param_09,(0,0,0),(0,0,0));
		}
		else
		{
			var_0B.var_DF0.var_2E6 = var_0C.var_2E6;
			var_0B.var_DF0 linkto(var_0C);
		}

		var_0D = var_0B.var_DF0.var_2E6;
		var_0E = vectornormalize(anglestoforward(var_0B.var_DF0.var_41));
		var_0F = vectornormalize(anglestoup(var_0B.var_DF0.var_41));
		var_10 = vectornormalize(anglestoright(var_0B.var_DF0.var_41));
		var_11 = vectornormalize(var_0E * param_03[0] + var_0F * param_03[2] - var_10 * param_03[1]);
		var_12 = var_0E * param_02[0] + var_0F * param_02[2] - var_10 * param_02[1];
		var_0B.var_6F7D.var_41 = vectortoangles(var_11);
		var_0B.var_6F7D.var_2E6 = var_0D + var_12;
		if(!isdefined(var_0B.var_6F7D.var_578F))
		{
			var_0B.var_6F7D.var_578F = 1;
			var_0B.var_6F7D enablelinkto();
		}

		var_0B.var_6F7D linkto(var_0B.var_DF0);
	}
	else
	{
		var_0B.var_DDE = undefined;
		var_0B.var_DDA = undefined;
	}

	var_13 = 0;
	if(isdefined(level.var_78B4))
	{
		var_13 = level.var_78B4.size;
	}

	var_0B.id = var_13;
	level.var_78B4[var_13] = var_0B;
	thread lib_A544::func_7B2D(var_0B,var_0B.id);
	return var_0B.id;
}

//Function Number: 8
lib_A544::func_7B24(param_00,param_01,param_02,param_03)
{
	var_04 = level.var_78B4[param_00];
	if(isdefined(param_02))
	{
		param_01 = undefined;
		if(!isdefined(param_03))
		{
			param_03 = "tag_origin";
		}
	}
	else if(!isdefined(param_01))
	{
		param_01 = (0,0,0);
	}

	level.var_78B4[param_00].var_2003 = param_03;
	level.var_78B4[param_00].var_2005 = param_01;
	level.var_78B4[param_00].var_2004 = param_02;
}

//Function Number: 9
lib_A544::func_7B27(param_00,param_01,param_02,param_03)
{
	lib_A544::func_7B26(param_00,param_01,undefined,undefined,undefined,param_02,undefined,undefined,undefined,param_03);
}

//Function Number: 10
lib_A544::func_7B2B(param_00,param_01,param_02,param_03)
{
	lib_A544::func_7B26(param_00,param_01,param_02,undefined,undefined,undefined,undefined,undefined,undefined,param_03);
}

//Function Number: 11
lib_A544::func_7B29(param_00,param_01,param_02,param_03)
{
	lib_A544::func_7B26(param_00,param_01,undefined,param_02,undefined,undefined,undefined,undefined,undefined,param_03);
}

//Function Number: 12
lib_A544::func_7B2A(param_00,param_01,param_02,param_03)
{
	lib_A544::func_7B26(param_00,param_01,undefined,param_02,undefined,undefined,undefined,undefined,undefined,param_03);
}

//Function Number: 13
lib_A544::func_7B28(param_00,param_01,param_02,param_03,param_04)
{
	lib_A544::func_7B26(param_00,param_01,undefined,undefined,undefined,param_02,param_03,undefined,undefined,param_04);
}

//Function Number: 14
lib_A544::func_7B2C(param_00,param_01,param_02,param_03)
{
	lib_A544::func_7B26(param_00,param_01,undefined,undefined,undefined,undefined,undefined,undefined,param_02,param_03);
}

//Function Number: 15
lib_A544::func_7B26(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	var_0A = level.var_78B4[param_00];
	var_0B = var_0A.time.size;
	if(!isdefined(param_03))
	{
		param_03 = var_0A.dir[var_0B - 1];
	}

	if(!isdefined(param_02))
	{
		param_02 = var_0A.pos[var_0B - 1];
	}

	if(!isdefined(param_04))
	{
		param_04 = var_0A.intensity[var_0B - 1];
	}

	if(!isdefined(param_05))
	{
		param_05 = var_0A.color[var_0B - 1];
	}

	if(!isdefined(param_06))
	{
		param_06 = var_0A.var_4E3B[var_0B - 1];
	}

	if(!isdefined(param_07))
	{
		param_07 = var_0A.var_65BB[var_0B - 1];
	}

	if(!isdefined(param_08))
	{
		param_08 = var_0A.radius[var_0B - 1];
	}

	var_0A.time[var_0B] = param_01;
	var_0A.pos[var_0B] = param_02;
	var_0A.dir[var_0B] = param_03;
	var_0A.intensity[var_0B] = param_04;
	var_0A.color[var_0B] = param_05;
	var_0A.var_4E3B[var_0B] = param_06;
	var_0A.var_65BB[var_0B] = param_07;
	var_0A.radius[var_0B] = param_08;
	var_0A.var_96CE[var_0B] = param_09;
}

//Function Number: 16
lib_A544::func_570D()
{
	if(function_0235())
	{
		function_00D3("r_veil",1);
		function_00D3("r_veilStrength",0.087);
		function_00D3("r_tonemap",2);
		function_00D3("r_tonemapBlack",0);
		function_00D3("r_tonemapCrossover",1);
		function_00D3("r_tonemapHighlightRange",16);
		function_00D3("r_tonemapDarkEv",2.84);
		function_00D3("r_tonemapMidEv",7.823);
		function_00D3("r_tonemapLightEv",12.81);
		function_00D3("r_tonemapDarkExposureAdjust",-3.17);
		function_00D3("r_tonemapMidExposureAdjust",-0.0651);
		function_00D3("r_tonemapLightExposureAdjust",1.47);
		function_00D3("r_tonemapMinExposureAdjust",-3.17);
		function_00D3("r_tonemapMaxExposureAdjust",2.3);
		if(level.ps4)
		{
			function_00D3("r_tonemapShoulder",0.4);
		}
		else
		{
			function_00D3("r_tonemapShoulder",0.94);
		}

		function_00D3("r_tonemapToe",0);
		function_00D3("r_tonemapWhite",512);
		function_00D3("r_tonemapAdaptSpeed",0.02);
		function_00D3("r_tonemapLockAutoExposureAdjust",0);
		function_00D3("r_tonemapAutoExposureAdjust",0);
		function_00D3("r_tonemapExposure",-10);
		function_00D3("r_tonemapMaxExposure",-10);
	}

	if(function_0236())
	{
		function_00D3("r_ssaoPower",12);
		function_00D3("r_ssaoStrength",0.45);
		function_00D3("r_ssaominstrengthdepth",25);
		function_00D3("r_ssaomaxstrengthdepth",40);
	}
}

//Function Number: 17
lib_A544::func_7916(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = newclienthudelem(level.var_31D);
	var_08.x = 0;
	var_08.y = 0;
	var_08.var_3E4 = 1;
	var_08.alignx = "left";
	var_08.aligny = "top";
	var_08.fontscale = 1;
	var_08.foreground = 0;
	var_08.horzalign = "fullscreen";
	var_08.vertalign = "fullscreen";
	var_08.alpha = param_04;
	var_08 thread lib_A544::func_1E7A();
	if(isdefined(param_05))
	{
		var_08.x = param_05;
	}

	if(isdefined(param_06))
	{
		var_08.y = param_06;
	}

	if(isdefined(param_07))
	{
		var_08.fontscale = param_07;
	}

	if(isarray(param_01))
	{
		foreach(var_0A in param_01)
		{
			var_08 setshader(var_0A,640,480);
		}
	}
	else
	{
		var_08 setshader(param_01,640,480);
	}

	if(param_00 > 0)
	{
		var_08.alpha = 0;
		var_0C = 1;
		if(isdefined(param_02))
		{
			var_0C = param_02;
		}

		var_0D = 1;
		if(isdefined(param_03))
		{
			var_0D = param_03;
		}

		var_0E = 1;
		if(isdefined(param_04))
		{
			var_0E = clamp(param_04,0,1);
		}

		var_0F = 0.05;
		if(var_0C > 0)
		{
			var_10 = 0;
			var_11 = var_0E / var_0C / var_0F;
			while(var_10 < var_0E)
			{
				var_08.alpha = var_10;
				var_10 = var_10 + var_11;
				wait(var_0F);
			}
		}

		var_08.alpha = var_0E;
		wait(param_00 - var_0C + var_0D);
		if(var_0D > 0)
		{
			var_10 = var_0E;
			var_12 = var_0E / var_0D / var_0F;
			while(var_10 > 0)
			{
				var_08.alpha = var_10;
				var_10 = var_10 - var_12;
				wait(var_0F);
			}
		}

		var_08.alpha = 0;
		var_08 destroy();
	}

	level.juggernautoverlay = var_08;
	return level.juggernautoverlay;
}

//Function Number: 18
lib_A544::func_1E7A()
{
	level waittill("end_screen_effect");
	self destroy();
}

//Function Number: 19
lib_A544::func_14B7()
{
}

//Function Number: 20
lib_A544::func_2A6E()
{
	var_00 = newclienthudelem(level.var_31D);
	var_00.x = 0;
	var_00.y = 0;
	var_00 setshader("fullscreen_dirt_bottom",640,480);
	var_00 setshader("fullscreen_dirt_bottom_b",640,480);
	var_00 setshader("fullscreen_dirt_left",640,480);
	var_00 setshader("fullscreen_dirt_right",640,480);
	var_00.var_3E4 = 1;
	var_00.alignx = "left";
	var_00.aligny = "top";
	var_00.fontscale = 1;
	var_00.foreground = 0;
	var_00.horzalign = "fullscreen";
	var_00.vertalign = "fullscreen";
	var_00.alpha = 1;
	var_00 fadeovertime(3);
	var_00.alpha = 0;
}

//Function Number: 21
lib_A544::func_1509(param_00)
{
	self endon("stop_mask_bob");
	var_01 = 0;
	var_02 = level.var_31D getplayerangles();
	var_03 = 0;
	var_04 = 0;
	var_05 = param_00.y;
	var_06 = param_00.x;
	var_07 = 0.05;
	for(;;)
	{
		if(isdefined(param_00))
		{
			var_08 = level.var_31D getplayerangles();
			var_09 = level.var_31D getvelocity();
			var_0A = var_09[2];
			var_09 = var_09 - var_09 * (0,0,1);
			var_0B = length(var_09);
			var_0C = level.var_31D getstance();
			var_0D = clamp(var_0B,0,280) / 280;
			var_0E = 0.1 + var_0D * 0.25;
			var_0F = 0.1 + var_0D * 0.25;
			var_10 = 1;
			if(var_0C == "crouch")
			{
				var_10 = 0.75;
			}

			if(var_0C == "prone")
			{
				var_10 = 0.4;
			}

			if(var_0C == "stand")
			{
				var_10 = 1;
			}

			var_11 = 5;
			var_12 = 0.9;
			var_13 = level.var_31D playerads();
			var_14 = var_11 * 1 - var_13 + var_12 * var_13;
			var_14 = var_14 * 1 + var_0D * 2;
			var_15 = 5;
			var_16 = var_15 * var_0E * var_10;
			var_17 = var_15 * var_0F * var_10;
			var_01 = var_01 + var_07 * 1000 * var_14;
			var_18 = 57.29578;
			var_19 = sin(var_01 * 0.001 * var_18);
			var_1A = sin(var_01 * 0.0007 * var_18);
			var_1B = angleclamp180(var_08[1] - var_02[1]);
			var_1B = clamp(var_1B,-10,10);
			var_1C = var_1B / 10 * var_15 * 1 - var_0E;
			var_1D = var_1C - var_04;
			var_04 = var_04 + clamp(var_1D,-1,1);
			var_1E = clamp(var_0A,-200,200) / 200 * var_15 * 1 - var_0F;
			var_1F = var_1E - var_03;
			var_03 = var_03 + clamp(var_1F,-0.6,0.6);
			param_00 moveovertime(0.05);
			param_00.x = var_06 + clamp(var_19 * var_16 + var_04 - var_15,0 - 2 * var_15,0);
			param_00.y = var_05 + clamp(var_1A * var_17 + var_03 - var_15,0 - 2 * var_15,0);
			var_02 = var_08;
		}

		wait(var_07);
	}
}

//Function Number: 22
lib_A544::func_3C27(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0.25;
	}

	if(param_00)
	{
		lib_A53C::func_35E1(param_01);
	}

	self.var_3C22 = newclienthudelem(self);
	self.var_3C22.x = 0;
	self.var_3C22.y = 0;
	self.var_3C22.horzalign = "fullscreen";
	self.var_3C22.vertalign = "fullscreen";
	self.var_3C22.foreground = 0;
	self.var_3C22.fontscale = -1;
	self.var_3C22 setshader("gasmask_overlay_delta2_top",650,138);
	self.var_3C22.alpha = 1;
	self.var_3C23 = newclienthudelem(self);
	self.var_3C23.x = 0;
	self.var_3C23.y = 352;
	self.var_3C23.horzalign = "fullscreen";
	self.var_3C23.vertalign = "fullscreen";
	self.var_3C23.foreground = 0;
	self.var_3C23.fontscale = -1;
	self.var_3C23 setshader("gasmask_overlay_delta2_bottom",650,138);
	self.var_3C23.alpha = 1;
	level.var_31D lib_A59A::delaythread(1,::lib_A544::func_3C21);
	thread lib_A544::func_1509(self.var_3C22);
	thread lib_A544::func_1509(self.var_3C23);
	if(param_00)
	{
		wait(param_03);
		lib_A53C::func_35DA(param_02);
	}
}

//Function Number: 23
lib_A544::func_3C25()
{
	lib_A53C::func_35E1(0.25);
	self notify("stop_mask_bob");
	if(isdefined(self.var_3C22))
	{
		self.var_3C22 destroy();
		self.var_3C22 = undefined;
	}

	if(isdefined(self.var_3C23))
	{
		self.var_3C23 destroy();
		self.var_3C23 = undefined;
	}

	level.var_31D notify("stop_breathing");
	wait(0.25);
	lib_A53C::func_35DA(1.5);
}

//Function Number: 24
lib_A544::func_3C21()
{
	var_00 = 1;
	self endon("stop_breathing");
	for(;;)
	{
		lib_A59A::play_sound_on_entity("breathing_gasmask");
		wait(var_00);
	}
}

//Function Number: 25
lib_A544::func_3C26()
{
	self.var_3C20 = spawn("script_model",(0,0,0));
	self.var_3C20 setmodel("prop_sas_gasmask");
	self.var_3C20 linkto(self,"tag_eye",(-4,0,2),(120,0,0));
}

//Function Number: 26
lib_A544::func_3C24()
{
	if(isdefined(self.var_3C20))
	{
		self.var_3C20 delete();
	}
}

//Function Number: 27
lib_A544::light_setup_common_flickerlight_presets()
{
	lib_A544::create_flickerlight_preset("fire",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,8);
	lib_A544::create_flickerlight_preset("blue_fire",(0.445098,0.62451,0.972549),(0.05,0.150451,0.3078432),0.005,0.2,8);
	lib_A544::create_flickerlight_preset("white_fire",(0.972549,0.972549,0.972549),(0.2,0.2,0.2),0.005,0.2,8);
	lib_A544::create_flickerlight_preset("white_fire_dim",(0.972549,0.972549,0.972549),(0.2,0.2,0.2),0.005,0.2,0.5);
	lib_A544::create_flickerlight_preset("street_light",(0.972549,0.972549,0.972549),(0.572549,0.572549,0.572549),0.005,0.2,8);
	lib_A544::create_flickerlight_preset("pulse",(0,0,0),(255,107,107),0.2,1,8);
	lib_A544::create_flickerlight_preset("lightbulb",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,6);
	lib_A544::create_flickerlight_preset("fluorescent",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,7);
	lib_A544::create_flickerlight_preset("static_screen",(0.63,0.72,0.92),(0.4,0.43,0.48),0.005,0.2,7);
	lib_A544::create_flickerlight_preset("sfb_fire",(1,0.65,0.8),(0.4,0.24,0.3),0.005,0.2,8);
}

//Function Number: 28
lib_A544::func_23B3(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level._light.var_38D1))
	{
		level._light.var_38D1 = [];
	}

	var_06 = spawnstruct();
	var_06.color = param_01;
	var_06.intensity = param_02;
	var_06.var_5A40 = param_03;
	var_06.mindelay = param_04;
	var_06.maxdelay = param_05;
	level._light.var_38D1[param_00] = var_06;
}

//Function Number: 29
lib_A544::func_3D6F(param_00)
{
	if(isdefined(level._light.var_38D1) && isdefined(level._light.var_38D1[param_00]))
	{
		return level._light.var_38D1[param_00];
	}

	return undefined;
}

//Function Number: 30
lib_A544::func_6947(param_00,param_01)
{
	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		return;
	}

	var_03 = lib_A544::func_3D6F(param_00);
	if(!isdefined(var_03))
	{
		return;
	}

	var_02 setlightintensity(var_03.intensity);
	var_02.islightflickering = 1;
	var_02.islightflickerpaused = 0;
	var_02 thread lib_A544::func_2FD7(var_03.color,var_03.intensity,var_03.var_5A40,var_03.mindelay,var_03.maxdelay);
	return var_02;
}

//Function Number: 31
lib_A544::create_flickerlight_preset(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level._light.flicker_presets))
	{
		level._light.flicker_presets = [];
	}

	var_06 = spawnstruct();
	var_06.color0 = param_01;
	var_06.color1 = param_02;
	var_06.mindelay = param_03;
	var_06.maxdelay = param_04;
	var_06.intensity = param_05;
	level._light.flicker_presets[param_00] = var_06;
}

//Function Number: 32
lib_A544::get_flickerlight_preset(param_00)
{
	if(isdefined(level._light.flicker_presets) && isdefined(level._light.flicker_presets[param_00]))
	{
		return level._light.flicker_presets[param_00];
	}

	return undefined;
}

//Function Number: 33
lib_A544::play_flickerlight_preset(param_00,param_01,param_02)
{
	var_03 = getent(param_01,"targetname");
	if(!isdefined(var_03))
	{
		return;
	}

	var_04 = lib_A544::get_flickerlight_preset(param_00);
	if(!isdefined(var_04))
	{
		return;
	}

	if(isdefined(param_02))
	{
		if(param_02 < 0)
		{
			param_02 = 0;
		}

		var_04.intensity = param_02;
	}

	var_03 setlightintensity(var_04.intensity);
	var_03.islightflickering = 1;
	var_03.islightflickerpaused = 0;
	var_03 thread lib_A544::dyn_flickerlight(var_04.color0,var_04.color1,var_04.mindelay,var_04.maxdelay);
	return var_03;
}

//Function Number: 34
lib_A544::stop_flickerlight(param_00,param_01,param_02)
{
	var_03 = getent(param_01,"targetname");
	if(!isdefined(var_03))
	{
		return;
	}

	if(!isdefined(var_03.islightflickering))
	{
		return;
	}

	if(isdefined(param_02))
	{
		if(param_02 < 0)
		{
			param_02 = 0;
		}
	}

	var_03 setlightintensity(param_02);
	var_03 notify("kill_flicker");
	var_03.islightflickering = undefined;
}

//Function Number: 35
lib_A544::pause_flickerlight(param_00,param_01)
{
	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		return;
	}

	if(!isdefined(var_02.islightflickering))
	{
		return;
	}

	var_02.islightflickerpaused = 1;
}

//Function Number: 36
lib_A544::unpause_flickerlight(param_00,param_01)
{
	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		return;
	}

	if(!isdefined(var_02.islightflickering))
	{
		return;
	}

	var_02.islightflickerpaused = 0;
}

//Function Number: 37
lib_A544::dyn_flickerlight(param_00,param_01,param_02,param_03)
{
	self endon("kill_flicker");
	var_04 = param_00;
	var_05 = 0;
	for(;;)
	{
		if(self.islightflickerpaused)
		{
			wait(0.05);
			continue;
		}

		var_06 = var_04;
		var_04 = param_00 + param_01 - param_00 * randomfloat(1);
		if(param_02 != param_03)
		{
			var_05 = var_05 + randomfloatrange(param_02,param_03);
		}
		else
		{
			var_05 = var_05 + param_02;
		}

		if(var_05 == 0)
		{
			var_05 = var_05 + 1E-07;
		}

		var_07 = var_06 - var_04 * 1 / var_05;
		while(var_05 > 0 && !self.islightflickerpaused)
		{
			self method_8044(var_04 + var_07 * var_05);
			wait(0.05);
			var_05 = var_05 - 0.05;
		}
	}
}

//Function Number: 38
lib_A544::func_2FD7(param_00,param_01,param_02,param_03,param_04)
{
	self endon("kill_flicker");
	self method_8044(param_00);
	self setlightintensity(param_01);
	thread lib_A544::func_37B1();
	var_05 = self.var_2E6;
	var_06 = param_02;
	var_07 = param_02;
	var_08 = param_02;
	var_09 = param_03;
	var_0A = param_04;
	for(;;)
	{
		var_0B = randomfloatrange(var_09,var_0A);
		var_0C = var_06 * randomfloatrange(0.1,1);
		var_0D = var_07 * randomfloatrange(0.1,1);
		var_0E = var_08 * randomfloatrange(0.1,1);
		var_0F = var_05 + (var_0C,var_0D,var_0E);
		self moveto(var_0F,var_0B);
		wait(var_0B);
		while(self.islightflickerpaused)
		{
			wait(0.05);
		}
	}
}

//Function Number: 39
lib_A544::func_37B1()
{
	var_00 = self getlightintensity();
	self endon("kill_flicker");
	var_01 = var_00;
	for(;;)
	{
		var_02 = randomfloatrange(var_00 * 0.5,var_00 * 1.2);
		var_03 = randomfloatrange(0.2,1);
		var_03 = var_03 * 0.75;
		while(self.islightflickerpaused)
		{
			wait(0.05);
		}

		for(var_04 = 0;var_04 < var_03;var_04++)
		{
			var_05 = var_02 * var_04 / var_03 + var_01 * var_03 - var_04 / var_03;
			self setlightintensity(var_05);
			wait(0.05);
		}

		var_01 = var_02;
	}
}

//Function Number: 40
lib_A544::func_23C6(param_00,param_01)
{
	var_02 = spawnstruct();
	var_03 = getentarray(param_00,"script_noteworthy");
	var_02.var_5714 = [];
	var_02.var_5D3F = [];
	foreach(var_05 in var_03)
	{
		if(var_05.classname == "script_model")
		{
			var_02.var_5D3F[var_02.var_5D3F.size] = var_05;
		}

		if(var_05.classname == "light_spot")
		{
			var_02.var_5714[var_02.var_5714.size] = var_05;
		}
	}

	var_02.var_3BA6 = param_01;
	return var_02;
}

//Function Number: 41
lib_A544::func_5706(param_00,param_01,param_02)
{
	foreach(var_04 in self.var_5714)
	{
		var_04 setlightintensity(param_00);
		var_04 method_8044(param_01);
	}

	if(param_02 && !isdefined(self.var_A1B3))
	{
		common_scripts\_exploder::exploder(self.var_3BA6);
		foreach(var_07 in self.var_5D3F)
		{
			var_07 show();
		}

		self.var_A1B3 = 1;
		return;
	}

	if(isdefined(self.var_A1B3) && !param_02)
	{
		lib_A59A::stop_exploder(self.var_3BA6);
		foreach(var_07 in self.var_5D3F)
		{
			var_07 hide();
		}

		self.var_A1B3 = undefined;
	}
}

//Function Number: 42
lib_A544::func_38D4(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	param_00 endon("kill_flicker");
	var_07 = 0;
	var_08 = 0;
	for(;;)
	{
		var_09 = var_07;
		var_07 = randomfloat(1);
		if(param_05 != param_06)
		{
			var_08 = var_08 + randomfloatrange(param_05,param_06);
		}
		else
		{
			var_08 = var_08 + param_06;
		}

		if(var_08 == 0)
		{
			var_08 = var_08 + 1E-07;
		}

		var_0A = var_07 - var_09 / var_08;
		while(var_08 > 0)
		{
			var_0B = var_07 - var_08 * var_0A;
			var_0C = vectorlerp(param_01,param_03,var_0B);
			var_0D = lib_A59A::func_5768(var_0B,param_02,param_04);
			var_0E = var_0B > 0.5;
			param_00 lib_A544::func_5706(var_0D,var_0C,var_0E);
			wait(0.05);
			var_08 = var_08 - 0.05;
		}
	}
}

//Function Number: 43
lib_A544::func_67D4(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 2;
	var_06 = 3;
	var_07 = 5;
	for(;;)
	{
		var_08 = clamp(function_00FE(gettime() * 0.001 * var_05,0,var_06,2,var_07),0,1);
		var_09 = vectorlerp(param_01,param_03,var_08);
		var_0A = lib_A59A::func_5768(var_08,param_02,param_04);
		var_0B = var_08 > 0.5;
		param_00 lib_A544::func_5706(var_0A,var_09,var_0B);
		wait(0.05);
	}
}

//Function Number: 44
lib_A544::lerp_spot_intensity(param_00,param_01,param_02)
{
	var_03 = getent(param_00,"targetname");
	if(level.currentgen && isdefined(var_03) == 0)
	{
		return;
	}

	var_04 = var_03 getlightintensity();
	var_03.endintensity = param_02;
	var_05 = 0;
	while(var_05 < param_01)
	{
		var_06 = var_04 + param_02 - var_04 * var_05 / param_01;
		var_05 = var_05 + 0.05;
		var_03 setlightintensity(var_06);
		wait(0.05);
	}

	var_03 setlightintensity(param_02);
}

//Function Number: 45
lib_A544::lerp_spot_intensity_array(param_00,param_01,param_02)
{
	var_03 = getentarray(param_00,"targetname");
	foreach(var_05 in var_03)
	{
		var_06 = var_05 getlightintensity();
		var_05.endintensity = param_02;
		var_07 = 0;
		while(var_07 < param_01)
		{
			var_08 = var_06 + param_02 - var_06 * var_07 / param_01;
			var_07 = var_07 + 0.05;
			var_05 setlightintensity(var_08);
			wait(0.05);
		}

		var_05 setlightintensity(param_02);
	}
}

//Function Number: 46
lib_A544::func_569F(param_00,param_01,param_02)
{
	var_03 = getent(param_00,"targetname");
	if(level.currentgen && isdefined(var_03) == 0)
	{
		return;
	}

	var_04 = var_03 method_8045();
	var_03.var_31BD = param_02;
	var_05 = 0;
	while(var_05 < param_01)
	{
		var_06 = var_04 + param_02 - var_04 * var_05 / param_01;
		var_05 = var_05 + 0.05;
		var_03 method_8046(var_06);
		wait(0.05);
	}

	var_03 method_8046(param_02);
}

//Function Number: 47
lib_A544::func_7EB8(param_00,param_01)
{
	var_02 = getent(param_00,"targetname");
	if(level.currentgen && isdefined(var_02) == 0)
	{
		return;
	}

	var_02 setlightintensity(param_01);
}

//Function Number: 48
lib_A544::func_569C(param_00,param_01,param_02)
{
	var_03 = getent(param_00,"targetname");
	if(level.currentgen && isdefined(var_03) == 0)
	{
		return;
	}

	var_04 = var_03 method_8043();
	var_03.var_3156 = param_02;
	var_05 = 0;
	while(var_05 < param_01)
	{
		var_06 = var_04 + param_02 - var_04 * var_05 / param_01;
		var_05 = var_05 + 0.05;
		var_03 method_8044(var_06);
		wait(0.05);
	}

	var_03 method_8044(param_02);
}

//Function Number: 49
lib_A544::func_7EB7(param_00,param_01)
{
	var_02 = getent(param_00,"targetname");
	var_02 method_8044(param_01);
}

//Function Number: 50
lib_A544::func_570E()
{
	lib_A544::func_23D3("red",0.1,0.1,10000,(1,0.2,0.2),2);
	lib_A544::func_23D3("red2",0.1,0.1,68200000,(1,0.2,0.2),2);
	lib_A544::func_23D3("yellow",0.1,0.1,68200000,(1,0.7,0.2),2);
	lib_A544::func_23D3("white",0.1,0.1,68200000,(1,1,1),2);
	lib_A544::func_23D3("turbine_pulse",0.1,0.1,10000,(0.9,0.9,1),2);
}

//Function Number: 51
lib_A544::func_23D3(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level._light.var_704D))
	{
		level._light.var_704D = [];
	}

	var_06 = spawnstruct();
	var_06.var_9708 = param_01;
	var_06.var_9707 = param_02;
	var_06.intensity = param_03;
	var_06.var_2045 = param_04;
	var_06.var_627A = param_05;
	level._light.var_704D[param_00] = var_06;
}

//Function Number: 52
lib_A544::func_3E3D(param_00)
{
	if(isdefined(level._light.var_704D) && isdefined(level._light.var_704D[param_00]))
	{
		return level._light.var_704D[param_00];
	}

	return undefined;
}

//Function Number: 53
lib_A544::func_6992(param_00,param_01,param_02,param_03)
{
	var_04 = param_00 + param_01 + "_pulse";
	level notify(var_04);
	level endon(var_04);
	var_05 = getent(param_01,"targetname");
	if(!isdefined(var_05))
	{
		return;
	}

	var_06 = lib_A544::func_3E3D(param_00);
	if(!isdefined(var_06))
	{
		return;
	}

	if(isdefined(param_02))
	{
		if(param_02 < 0)
		{
			param_02 = 0;
		}

		var_06.intensity = param_02;
	}

	var_05 setlightintensity(var_06.intensity);
	var_05 method_8044(var_06.var_2045);
	var_07 = var_06.var_627A;
	var_08 = var_05 getlightintensity();
	var_09 = 0.05;
	var_0A = var_08;
	var_0B = var_06.var_9708;
	var_0C = var_06.var_9707;
	var_0D = var_08 - var_09 / var_0B / 0.05;
	var_0E = var_08 - var_09 / var_0C / 0.05;
	var_0F = var_06.var_627A;
	for(;;)
	{
		var_10 = 1;
		var_11 = 0;
		while(var_11 < var_0C)
		{
			var_0A = var_0A - var_0E;
			var_0A = clamp(var_0A,0,1000000000);
			var_05 setlightintensity(var_0A);
			var_11 = var_11 + 0.05;
			wait(0.05);
		}

		if(isdefined(param_03))
		{
			lib_A59A::stop_exploder(param_03);
		}

		wait(0.8);
		var_11 = 0;
		while(var_11 < var_0B)
		{
			var_0A = var_0A + var_0D;
			var_0A = clamp(var_0A,0,1000000000);
			var_05 setlightintensity(var_0A);
			var_11 = var_11 + 0.05;
			wait(0.05);
		}

		if(isdefined(param_03))
		{
			common_scripts\_exploder::exploder(param_03);
		}

		wait(0.1);
		while(var_10 < var_0F)
		{
			var_11 = 0;
			while(var_11 < var_0C)
			{
				var_0A = var_0A - var_0E;
				var_0A = clamp(var_0A,0,300000);
				var_05 setlightintensity(var_0A);
				var_11 = var_11 + 0.05;
				wait(0.05);
			}

			wait(0.1);
			var_11 = 0;
			while(var_11 < var_0B)
			{
				var_0A = var_0A + var_0D;
				var_0A = clamp(var_0A,0,300000);
				var_05 setlightintensity(var_0A);
				var_11 = var_11 + 0.05;
				wait(0.05);
			}

			wait(0.1);
			var_10 = var_10 + 1;
		}
	}

	return var_05;
}

//Function Number: 54
lib_A544::model_flicker_preset(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C)
{
	self endon("death");
	if(isdefined(param_0A))
	{
		level endon(param_0A);
	}

	var_0D = getentarray(param_00,"script_noteworthy");
	if(!isdefined(var_0D))
	{
		return;
	}

	var_0E = [];
	var_0F = [];
	foreach(var_11 in var_0D)
	{
		if(var_11.classname == "script_model")
		{
			var_0F[var_0F.size] = var_11;
		}

		if(var_11.classname == "light_spot" || var_11.classname == "light_omni")
		{
			var_0E[var_0E.size] = var_11;
			var_12 = param_02;
			if(param_03 > param_02)
			{
				var_12 = randomfloatrange(param_02,param_03);
			}

			var_11 setlightintensity(var_12);
		}
	}

	var_14 = 0;
	var_15 = undefined;
	var_16 = undefined;
	var_17 = undefined;
	var_18 = undefined;
	var_19 = undefined;
	var_1A = 1;
	if(isarray(param_0B))
	{
		var_15 = param_0B["on"];
		var_16 = param_0B["off"];
		var_17 = param_0B["loop"];
		var_19 = param_0B["vol_env"];
		if(isstring(var_17))
		{
			var_18 = "model_flicker_preset_" + lib_A5DE::func_8712();
		}
	}

	var_1B = 0;
	if(isdefined(param_04))
	{
		common_scripts\_exploder::exploder(param_04);
	}

	while(var_1B < param_01 || param_01 == 0)
	{
		var_1C = undefined;
		if(isdefined(param_0C))
		{
			var_1D = param_0C;
		}
		else
		{
			var_1D = 0.05;
		}

		var_1E = 0;
		if(isdefined(param_06) && isdefined(param_07))
		{
			var_1F = randomfloatrange(param_06,param_07);
		}
		else
		{
			var_1F = randomfloatrange(0.1,0.8);
		}

		if(isdefined(param_08) && isdefined(param_09))
		{
			var_20 = randomfloatrange(param_08,param_09);
		}
		else
		{
			var_20 = randomfloatrange(0.1,0.8);
		}

		if(isdefined(param_05))
		{
			foreach(var_22 in var_0E)
			{
				if(var_14)
				{
					if(isstring(var_18))
					{
						level notify(var_18);
					}

					if(isdefined(var_16))
					{
						var_22 lib_A5F1::snd_play_linked(var_16,undefined,undefined,undefined,var_1A);
					}

					var_14 = 0;
				}
			}

			lib_A59A::stop_exploder(param_05);
		}

		foreach(var_25 in var_0F)
		{
			var_25 hide();
		}

		foreach(var_28 in var_0E)
		{
			var_1C = var_28 getlightintensity();
			var_28 setlightintensity(var_1D);
		}

		wait(var_20);
		if(isdefined(param_05))
		{
			foreach(var_22 in var_0E)
			{
				var_12 = param_02;
				if(param_03 > param_02)
				{
					var_12 = randomfloatrange(param_02,param_03);
				}

				var_22 setlightintensity(var_12);
				if(isdefined(var_15) && !var_14)
				{
					if(isarray(var_19))
					{
						var_1A = lib_A5DE::func_8702(var_12,var_19);
					}

					if(isdefined(var_15))
					{
						var_22 lib_A5F1::snd_play_linked(var_15,undefined,undefined,undefined,var_1A);
					}

					if(isdefined(var_17))
					{
						var_22 lib_A5F1::func_873C(var_17,var_18,0,0.1,var_1A);
					}

					var_14 = 1;
				}
			}

			common_scripts\_exploder::exploder(param_05);
		}

		foreach(var_25 in var_0F)
		{
			var_25 show();
		}

		foreach(var_28 in var_0E)
		{
			var_28 setlightintensity(var_1C);
		}

		wait(var_1F);
		if(param_01 != 0)
		{
			var_1B++;
		}
	}
}

//Function Number: 55
lib_A544::func_570A()
{
	lib_A544::func_23AB("default",1,1,4.5,500,500,0.05,0.5);
	lib_A544::func_23AB("viewmodel_blur",1,1,4.5,500,500,0.05,0.5);
	lib_A544::func_23AB("close_none_viewmodel_blur",1,50,4,1000,7000,0.05,0.5);
	lib_A544::func_23AB("river",1,104,4.5,500,500,1.8,0.5);
	lib_A544::func_23AB("medium_none_viewmodel_blur",1,500,10,1000,7000,0.05,0.5);
}

//Function Number: 56
lib_A544::func_23AB(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(!isdefined(level._light.var_2C65))
	{
		level._light.var_2C65 = [];
	}

	var_08 = [];
	var_08["nearStart"] = param_01;
	var_08["nearEnd"] = param_02;
	var_08["nearBlur"] = param_03;
	var_08["farStart"] = param_04;
	var_08["farEnd"] = param_05;
	var_08["farBlur"] = param_06;
	var_08["bias"] = param_07;
	level._light.var_2C65[param_00] = var_08;
}

//Function Number: 57
lib_A544::func_5700(param_00)
{
	if(isdefined(level._light.var_2C65) && isdefined(level._light.var_2C65[param_00]))
	{
		return level._light.var_2C65[param_00];
	}
}

//Function Number: 58
lib_A544::func_1498(param_00,param_01,param_02)
{
	if(isdefined(level._light.var_2C65))
	{
		var_03 = lib_A544::func_5700(param_00);
		var_04 = lib_A544::func_5700(param_01);
		if(isdefined(var_03) && isdefined(var_04))
		{
			lib_A509::func_2C4A(var_04["nearStart"],var_04["nearEnd"],var_04["nearBlur"],var_04["farStart"],var_04["farEnd"],var_04["farBlur"],param_02,var_04["bias"]);
			return;
		}
	}
}

//Function Number: 59
lib_A544::func_570B()
{
	lib_A544::func_23AC("default",2,8);
	lib_A544::func_23AC("viewmodel_blur",10,90);
	lib_A544::func_23AC("max",2,128);
}

//Function Number: 60
lib_A544::func_23AC(param_00,param_01,param_02)
{
	if(!isdefined(level._light.var_2C78))
	{
		level._light.var_2C78 = [];
	}

	var_03["start"] = param_01;
	var_03["end"] = param_02;
	level.var_31D.var_9E11 = var_03["start"];
	level.var_31D.var_9E10 = var_03["end"];
	level._light.var_2C78[param_00] = var_03;
}

//Function Number: 61
lib_A544::func_5701(param_00)
{
	if(isdefined(level._light.var_2C78) && isdefined(level._light.var_2C78[param_00]))
	{
		return level._light.var_2C78[param_00];
	}
}

//Function Number: 62
lib_A544::func_1499(param_00,param_01,param_02)
{
	if(isdefined(level._light.var_2C78))
	{
		var_03 = lib_A544::func_5701(param_00);
		var_04 = lib_A544::func_5701(param_01);
		if(isdefined(var_03) && isdefined(var_04))
		{
			lib_A544::func_14A0(var_03,var_04,param_02);
			return;
		}
	}
}

//Function Number: 63
lib_A544::func_14A0(param_00,param_01,param_02)
{
	if(param_02 > 0)
	{
		var_03 = param_01["start"] - param_00["start"] * 0.05 / param_02;
		var_04 = param_01["end"] - param_00["end"] * 0.05 / param_02;
		thread lib_A544::func_56AB(param_01,var_03,var_04);
		return;
	}

	level.var_31D.var_9E11 = param_01["start"];
	level.var_31D.var_9E10 = param_01["end"];
}

//Function Number: 64
lib_A544::func_56AB(param_00,param_01,param_02)
{
	level notify("lerp_viewmodel_dof");
	level endon("lerp_viewmodel_dof");
	var_03 = 0;
	var_04 = 0;
	while(!var_03 || !var_04)
	{
		if(!var_03)
		{
			level.var_31D.var_9E11 = level.var_31D.var_9E11 + param_01;
			if((param_01 > 0 && level.var_31D.var_9E11 > param_00["start"]) || param_01 < 0 && level.var_31D.var_9E11 < param_00["start"])
			{
				level.var_31D.var_9E11 = param_00["start"];
				var_03 = 1;
			}
		}

		if(!var_04)
		{
			level.var_31D.var_9E10 = level.var_31D.var_9E10 + param_02;
			if((param_02 > 0 && level.var_31D.var_9E10 > param_00["end"]) || param_02 < 0 && level.var_31D.var_9E10 < param_00["end"])
			{
				level.var_31D.var_9E10 = param_00["end"];
				var_04 = 1;
			}
		}

		level.var_31D setviewmodeldepthoffield(level.var_31D.var_9E11,level.var_31D.var_9E10);
		wait(0.05);
	}
}

//Function Number: 65
lib_A544::light_message_init()
{
	level._light.messages = [];
}

//Function Number: 66
lib_A544::light_debug_dvar_init()
{
}

//Function Number: 67
lib_A544::light_register_message(param_00,param_01)
{
	level._light.messages[param_00] = param_01;
}

//Function Number: 68
lib_A544::light_message(param_00,param_01,param_02,param_03)
{
	if(isdefined(level._light.messages[param_00]))
	{
		if(isdefined(param_03))
		{
			thread [[ level._light.messages[param_00] ]](param_01,param_02,param_03);
			return;
		}

		if(isdefined(param_02))
		{
			thread [[ level._light.messages[param_00] ]](param_01,param_02);
			return;
		}

		if(isdefined(param_01))
		{
			thread [[ level._light.messages[param_00] ]](param_01);
			return;
		}

		thread [[ level._light.messages[param_00] ]]();
		return;
	}
}

//Function Number: 69
lib_A544::func_568B(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 0;
	while(var_05 <= param_04)
	{
		var_06 = var_05 / param_04;
		self method_8020(lib_A59A::func_5768(var_06,param_00,param_02),lib_A59A::func_5768(var_06,param_01,param_03));
		wait 0.05;
		var_05 = var_05 + 0.05;
	}
}