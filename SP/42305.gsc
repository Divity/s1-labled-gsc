/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42305.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 47
 * Decompile Time: 17 ms
 * Timestamp: 4/20/2022 8:23:17 PM
*******************************************************************/

//Function Number: 1
lib_A541::main()
{
	precacheshader("black");
	var_00 = 0;
	level thread lib_A541::func_3BD4();
	common_scripts\utility::flag_wait("start_is_set");
	if(!isdefined(level.var_4F89) || !lib_A59A::func_5013() || var_00)
	{
		lib_A59A::delaythread(0.05,::common_scripts\utility::flag_set,"introscreen_complete");
		return;
	}

	if(isdefined(level.var_4F89.var_255A))
	{
		[[ level.var_4F89.var_255A ]]();
		return;
	}

	lib_A541::func_4F89();
}

//Function Number: 2
lib_A541::func_4F8D()
{
	if(!isdefined(level.var_4F89))
	{
		return 0;
	}

	var_00 = level.var_4F89.var_5771;
	var_01 = getarraykeys(var_00);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		var_04 = 1;
		var_05 = var_02 * var_04 + 1;
		lib_A59A::delaythread(var_05,::lib_A541::func_4F8B,var_00[var_03],var_00.size - var_02 - 1,var_04,var_03);
	}

	return 1;
}

//Function Number: 3
lib_A541::func_4F8E(param_00,param_01,param_02)
{
	lib_A541::func_4F8F("black",param_00,param_01,param_02);
}

//Function Number: 4
lib_A541::func_4F8F(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 1.5;
	}

	if(!isdefined(param_03))
	{
		lib_A53C::func_8C1D(param_00);
	}
	else
	{
		lib_A53C::func_35E1(param_03,param_00);
	}

	wait(param_01);
	lib_A53C::func_35DA(param_02,param_00);
	wait(param_02);
	function_00D3("com_cinematicEndInWhite",0);
}

//Function Number: 5
lib_A541::func_4F8B(param_00,param_01,param_02,param_03)
{
	level notify("new_introscreen_element");
	if(!isdefined(level.var_4F4B))
	{
		level.var_4F4B = 0;
	}
	else
	{
		level.var_4F4B++;
	}

	var_04 = lib_A541::func_2226();
	var_05 = newhudelem();
	var_05.x = 20;
	var_05.y = var_04;
	var_05.alignx = "left";
	var_05.aligny = "bottom";
	var_05.horzalign = "left";
	var_05.vertalign = "bottom";
	var_05.fontscale = 1;
	var_05.foreground = 1;
	var_05 settext(param_00);
	var_05.alpha = 0;
	var_05 fadeovertime(0.2);
	var_05.alpha = 1;
	var_05.hidewheninmenu = 1;
	var_05.var_18C = 2;
	var_05.color = (0.8,1,0.8);
	var_05.font = "default";
	var_05.glowcolor = (0.3,0.6,0.3);
	var_05.glowalpha = 1;
	var_06 = int(param_01 * param_02 * 1000 + 4000);
	var_05 setpulsefx(30,var_06,700);
	thread lib_A541::func_4ADF(var_05);
}

//Function Number: 6
lib_A541::func_2226()
{
	return level.var_4F4B * 20 - 82;
}

//Function Number: 7
lib_A541::func_4ADF(param_00)
{
	wait(16);
	param_00 notify("destroying");
	level.var_4F4A = undefined;
	var_01 = 0.5;
	param_00 fadeovertime(var_01);
	param_00.alpha = 0;
	wait(var_01);
	param_00 notify("destroy");
	param_00 destroy();
}

//Function Number: 8
lib_A541::func_63A7()
{
	level.var_31D freezecontrols(1);
	thread lib_A541::func_4F8E(level.var_4F89.var_20D2,level.var_4F89.var_35E4,level.var_4F89.var_35DF);
	if(!lib_A541::func_4F8D())
	{
		wait(0.05);
	}

	wait(level.var_4F89.var_20D2);
	common_scripts\utility::flag_set("introscreen_complete");
	level.var_31D freezecontrols(0);
}

//Function Number: 9
lib_A541::func_1C12(param_00)
{
	if(!isarray(param_00))
	{
		param_00 = [param_00];
	}

	var_01 = 3;
	var_02 = 1;
	var_03 = [];
	for(var_04 = 0;var_04 < param_00.size;var_04++)
	{
		var_03[var_03.size] = lib_A541::func_1C11(param_00[var_04],var_04,var_01 + param_00.size - var_04);
		wait(1);
	}

	wait(var_01);
	foreach(var_06 in var_03)
	{
		var_06 thread lib_A53C::func_35E6(0,var_02);
	}

	wait(var_02);
	foreach(var_06 in var_03)
	{
		var_06 destroy();
	}
}

//Function Number: 10
lib_A541::func_1C11(param_00,param_01,param_02)
{
	var_03 = newhudelem();
	var_03.alignx = "center";
	var_03.aligny = "top";
	var_03.horzalign = "center";
	var_03.vertalign = "middle";
	var_03.x = 0;
	var_03.font = "objective";
	var_03.foreground = 1;
	var_03.hidewheninmenu = 1;
	var_03.var_1EC = 1;
	var_03.fontscale = 2;
	var_03.color = (0.99,0.99,0.88);
	var_03.glowcolor = (0,0,0);
	var_03.glowalpha = 1;
	var_04 = getdvarint("loc_language",0);
	if(var_04 != 16)
	{
		var_03 setpulsefx(100,900000,700);
	}

	var_05 = -70;
	switch(param_01)
	{
		case 0:
			break;

		default:
			break;
	}
}

//Function Number: 11
lib_A541::func_4F89(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
		var_02 = 1;
	}

	if(isdefined(param_01))
	{
		param_00 = 1;
		lib_A53C::func_8C1D();
		level.var_31D freezecontrols(1);
		level.var_31D common_scripts\utility::delaycall(param_01,::freezecontrols,0);
		lib_A59A::delaythread(param_01,::lib_A53C::func_35DA,2);
	}

	level.var_1D66 = spawnstruct();
	level.var_1D66.var_4AF9 = [];
	level.var_1D66.var_8F57 = [];
	level.var_1D66.var_555C = [];
	level.var_1D66.var_D30 = [];
	level.var_1D66.var_92B1 = 20;
	level.var_1D66.var_92B2 = -82;
	level.var_1D66.var_92AD = 0;
	level.var_1D66.var_8F58 = 0;
	level.var_1D66.var_889C = spawn("script_origin",level.var_31D.var_2E6);
	level.var_1D66.var_889C linkto(level.var_31D);
	level.var_1D66.var_60EF = param_00;
	if(!param_00)
	{
		level.var_31D freezecontrols(1);
		lib_A53C::func_8C1D();
	}

	var_03 = 0.4;
	thread lib_A541::func_7099(0,var_03);
	wait(var_03);
	lib_A541::func_9397(level.var_4F89.var_5771[0]);
	lib_A541::func_8F76(level.var_4F89.var_5771[1],0);
	wait(2);
	var_04 = lib_A541::func_8F76(level.var_4F89.var_5771[2],1,"default",1,1);
	var_04.color = (0.87,0.79,0.45);
	var_05 = undefined;
	if(isdefined(level.var_4F89.var_5771[3]))
	{
		var_05 = lib_A541::func_8F76(level.var_4F89.var_5771[3],2,"default",1,1);
		var_05.color = (0.87,0.79,0.45);
		level.var_1D66.var_4AF9 = common_scripts\utility::array_remove(level.var_1D66.var_4AF9,var_05);
	}

	wait(1);
	level.var_1D66.var_8F58 = 1;
	wait(2);
	level.var_1D66.var_8F58 = 0;
	wait(1);
	lib_A541::func_3696(0,1);
	if(!param_00)
	{
		lib_A541::func_1D67(0,"ui_chyron_off");
		thread lib_A53C::func_35DA(2);
		level.var_31D freezecontrols(0);
	}

	common_scripts\utility::flag_set("introscreen_complete");
	level notify("stop_chyron");
	level.var_1D66.var_889C delete();
	level.var_1D66 = undefined;
}

//Function Number: 12
lib_A541::func_603C()
{
	var_00 = self.color;
	var_01 = self.alpha;
	self notify("stop_quick_pulse");
	var_02 = 2;
	self.glowalpha = 1;
	self.glowcolor = (1,1,1);
	thread lib_A541::func_35D9((0.10875,0.09875,0.05625),0.1,var_02);
	self.color = (1,1,1);
	self.alpha = 1;
	self fadeovertime(var_02);
	self.color = var_00;
	self.alpha = 0.8;
	var_02 = 4;
	self moveovertime(var_02 * 3);
	self changefontscaleovertime(var_02 * 1.5);
	self.x = self.x + randomintrange(5,10);
	self.y = self.y - randomintrange(3,12);
	self.var_18C = self.var_18C * randomfloatrange(1.2,1.3);
	wait(var_02);
	self fadeovertime(2);
	self.alpha = 0;
	wait(2);
	self destroy();
}

//Function Number: 13
lib_A541::func_35D9(param_00,param_01,param_02)
{
	self endon("death");
	var_03 = param_02 * 20;
	var_04 = param_00 - self.glowcolor / var_03;
	var_05 = param_01 - self.glowalpha / var_03;
	for(var_06 = 0;var_06 < var_03;var_06++)
	{
		self.glowcolor = self.glowcolor + var_04;
		self.glowalpha = self.glowalpha + var_05;
		wait(0.05);
	}

	self.glowcolor = param_00;
	self.glowalpha = param_01;
}

//Function Number: 14
lib_A541::func_1D67(param_00,param_01)
{
	if(!soundexists(param_01))
	{
		return;
	}

	if(param_00 == 0)
	{
		level.var_1D66.var_889C playsoundasmaster(param_01);
		return;
	}

	level.var_3BD4.var_889C playsoundasmaster(param_01);
}

//Function Number: 15
lib_A541::func_4ABE(param_00)
{
	self endon("death");
	self fadeovertime(param_00);
	self.alpha = 0;
	wait(param_00);
	self destroy();
}

//Function Number: 16
lib_A541::func_7099(param_00,param_01)
{
	wait(0.5);
	var_02 = newhudelem();
	if(param_00 == 0)
	{
		var_02.x = level.var_1D66.var_92B1 - 5;
		var_02.y = level.var_1D66.var_92B2;
		var_02.vertalign = "bottom";
	}
	else
	{
		var_02.x = level.var_3BD4.var_92B1 - 5;
		var_02.y = level.var_3BD4.var_92B2;
		var_02.vertalign = "top";
	}

	var_02.var_18C = 3;
	var_02.horzalign = "left";
	var_02.fontscale = 1;
	var_02.foreground = 1;
	var_02.hidewheninmenu = 1;
	var_02.alpha = 0.8;
	var_02 setshader("white",1,35);
	var_02.color = (0.87,0.79,0.45);
	var_02 moveovertime(param_01);
	var_02 fadeovertime(param_01 * 0.5);
	var_02.alpha = 0;
	var_02.x = var_02.x + 300;
	wait(0.4);
	var_02 destroy();
}

//Function Number: 17
lib_A541::func_0D30(param_00)
{
	if(param_00 == 0)
	{
		level endon("chyron_faze_out_text_intro");
	}
	else
	{
		level endon("chyron_faze_out_text_gamenotify");
	}

	var_01 = [".","-","_","|","+"];
	var_02 = 0.7;
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		var_04 = lib_A541::func_23A1("");
		var_04.var_18C = var_02;
		var_04.alpha = 0;
		var_04.fontscale = 2;
		var_04.color = (0.75,0.83,0.89);
		var_04.var_7049 = 0;
		level.var_1D66.var_D30[level.var_1D66.var_D30.size] = var_04;
	}

	level.var_1D66.var_D31 = 0;
	thread lib_A541::func_0D2F(param_00);
	var_05 = 0;
	var_06 = level.var_1D66.var_92B2 - 10;
	for(;;)
	{
		var_07 = 0;
		var_01 = common_scripts\utility::array_randomize(var_01);
		foreach(var_04 in level.var_1D66.var_D30)
		{
			var_04.var_18C = var_02;
			if(var_01[var_07] == "+")
			{
				var_04.var_18C = 0.55;
			}

			var_04 settext(var_01[var_07]);
			var_04.x = var_05 + randomint(200);
			var_04.y = var_06 + randomint(60);
			var_04.var_7049 = 1;
			var_07++;
			wait(randomfloatrange(0.05,0.1));
		}

		wait(randomfloatrange(4,7));
		level.var_1D66.var_D31 = 1;
		level waittill("chyron_artifact_faded");
	}
}

//Function Number: 18
lib_A541::func_0D2F(param_00)
{
	if(param_00 == 0)
	{
		level endon("chyron_faze_out_text_intro");
	}
	else
	{
		level endon("chyron_faze_out_text_gamenotify");
	}

	var_01 = 0.6;
	var_02 = 1;
	for(;;)
	{
		if(level.var_1D66.var_D31)
		{
			var_01 = var_01 - 0.07;
		}
		else
		{
			if(var_01 < 0.15 || var_01 > 0.6)
			{
				var_02 = var_02 * -1;
			}

			var_01 = var_01 + 0.02 + randomfloat(0.04) * var_02;
		}

		var_01 = max(var_01,0);
		foreach(var_04 in level.var_1D66.var_D30)
		{
			if(var_04.var_7049)
			{
				if(var_01 == 0)
				{
					var_04.alpha = 0;
					continue;
				}

				var_04.alpha = randomfloatrange(var_01 * 0.6,var_01);
			}
		}

		if(var_01 == 0)
		{
			level notify("chyron_artifact_faded");
			var_01 = 0.8;
			level.var_1D66.var_D31 = 0;
			foreach(var_04 in level.var_1D66.var_D30)
			{
				var_04.var_7049 = 0;
			}
		}

		wait(0.05);
	}
}

//Function Number: 19
lib_A541::func_8F57(param_00)
{
	if(param_00 == 0)
	{
		level endon("chyron_faze_out_text_intro");
	}
	else
	{
		level endon("chyron_faze_out_text_gamenotify");
	}

	var_01 = 5;
	var_02 = 0;
	var_03 = 1;
	for(;;)
	{
		if((param_00 == 0 && level.var_1D66.var_8F58) || param_00 == 1 && level.var_3BD4.var_8F58)
		{
			wait(0.05);
			continue;
		}

		var_02++;
		var_04 = int(min(var_02,var_01));
		for(var_05 = 0;var_05 < var_04;var_05++)
		{
			thread lib_A541::func_23DA(param_00);
			wait(randomfloatrange(0,0.1));
		}

		if((param_00 == 0 && level.var_1D66.var_92AD) || param_00 == 1 && level.var_3BD4.var_92AD)
		{
			wait(0.05);
			continue;
		}

		wait(randomfloatrange(var_03 * 0.5,var_03));
		var_03 = var_03 - 0.05;
		var_03 = max(var_03,0.2);
	}
}

//Function Number: 20
lib_A541::func_9397(param_00,param_01)
{
	var_02 = lib_A541::func_23A1(param_00);
	level.var_1D66.var_92AE = var_02.x;
	level.var_1D66.var_92AF = var_02.y;
	level.var_1D66.var_92AD = 1;
	wait(0.5);
	level.var_1D66.var_92AD = 0;
	var_03 = lib_A541::func_2FC8(var_02,1);
	var_04 = 4;
	var_03[0] thread lib_A541::func_57F6(var_04);
	var_02.glowalpha = 0.05;
	var_02.glowcolor = (0.435,0.395,0.225) * lib_A541::func_4235();
	var_05 = 0.3;
	var_06 = 0.5;
	var_06 = var_06 - var_05;
	wait(var_05);
	var_02.alpha = 1;
	wait(var_06);
}

//Function Number: 21
lib_A541::func_637B(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = randomintrange(1,2);
	for(var_07 = 0;var_07 < var_06;var_07++)
	{
		var_08 = lib_A541::func_7120(param_00,param_01,param_02);
		var_09 = lib_A541::func_7120(param_03,param_04,param_05);
		var_0A[0] = [var_08,var_09];
		var_0A[1] = [var_08 - 10,var_09];
		thread lib_A541::func_4AC9(var_0A);
		wait(randomfloatrange(0.5,1));
	}
}

//Function Number: 22
lib_A541::func_3696(param_00,param_01)
{
	var_02 = undefined;
	if(!param_01)
	{
		var_02 = newhudelem();
		if(param_00 == 0)
		{
			var_02.x = level.var_1D66.var_92B1 + 60;
			var_02.y = level.var_1D66.var_92B2 + 30;
			var_02.vertalign = "bottom";
		}
		else
		{
			var_02.x = level.var_3BD4.var_92B1 + 60;
			var_02.y = level.var_3BD4.var_92B2 + 10;
			var_02.vertalign = "top";
		}

		var_02.alignx = "center";
		var_02.aligny = "middle";
		var_02.horzalign = "left";
		var_02.fontscale = 1;
		var_02.foreground = 1;
		var_02.hidewheninmenu = 1;
		var_02.alpha = 0;
		var_02 setshader("white",1,60);
		var_02.color = (0.87,0.79,0.45);
		var_02 fadeovertime(0.25);
		var_02.alpha = 0.1;
		var_02 scaleovertime(0.1,2000,60);
	}

	wait(0.5);
	var_03 = 0.15;
	lib_A541::func_35E3(param_00,var_03);
	if(!param_01)
	{
		var_02 fadeovertime(0.25);
		var_02.alpha = 0.2;
		var_02.color = (1,1,1);
		var_02 scaleovertime(var_03,2000,2);
		wait(var_03);
		var_03 = 0.15;
		var_02 scaleovertime(var_03,2,2);
		var_02 thread lib_A541::func_3697(var_03);
		return;
	}

	wait(var_03);
}

//Function Number: 23
lib_A541::func_3697(param_00)
{
	self fadeovertime(param_00);
	self.alpha = 0;
	wait(param_00);
	self destroy();
}

//Function Number: 24
lib_A541::func_35E3(param_00,param_01)
{
	if(param_00 == 0)
	{
		level notify("chyron_faze_out_text_intro");
		foreach(var_03 in level.var_1D66.var_4AF9)
		{
			if(!isdefined(var_03))
			{
				continue;
			}

			var_03 thread lib_A541::func_4ABE(param_01);
		}

		foreach(var_03 in level.var_1D66.var_8F57)
		{
			var_03 thread lib_A541::func_4ABE(param_01);
		}

		return;
	}

	level notify("chyron_faze_out_text_gamenotify");
	foreach(var_03 in level.var_3BD4.var_4AF9)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_03 thread lib_A541::func_4ABE(param_01);
	}

	foreach(var_03 in level.var_3BD4.var_8F57)
	{
		var_03 thread lib_A541::func_4ABE(param_01);
	}
}

//Function Number: 25
lib_A541::func_8F76(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A541::func_23A1(param_00);
	var_05.y = var_05.y + 20 + param_01 * 15;
	if(isdefined(param_02))
	{
		var_05.font = param_02;
	}

	var_05.var_18C = 1;
	if(isdefined(param_03))
	{
		var_05.var_18C = param_03;
	}

	level.var_1D66.var_92AE = var_05.x;
	level.var_1D66.var_92AF = var_05.y;
	level.var_1D66.var_92AD = 1;
	wait(0.5);
	var_05.glowalpha = 0.05;
	var_05.glowcolor = (0.435,0.395,0.225) * lib_A541::func_4235();
	var_05.alpha = 1;
	if(isdefined(param_04))
	{
		var_05.alpha = param_04;
	}

	var_05 setpulsefx(30,50000,700);
	level.var_1D66.var_92AD = 0;
	return var_05;
}

//Function Number: 26
lib_A541::func_4235()
{
	var_00 = 1;
	if(isdefined(level.var_1D66) && level.var_1D66.var_60EF)
	{
		var_00 = 0.3;
	}

	return var_00;
}

//Function Number: 27
lib_A541::func_4AC9(param_00)
{
	var_01 = self.x;
	var_02 = self.y;
	foreach(var_04 in param_00)
	{
		self.x = var_01 + var_04[0];
		self.y = var_02 + var_04[1];
		wait(randomfloatrange(0.05,0.2));
	}

	self.x = var_01;
	self.y = var_02;
}

//Function Number: 28
lib_A541::func_709B(param_00,param_01)
{
	self endon("death");
	self endon("stop_quick_pulse");
	if(param_00 == 0)
	{
		level endon("chyron_faze_out_text_intro");
	}
	else
	{
		level endon("chyron_faze_out_text_gamenotify");
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	for(;;)
	{
		wait(0.05);
		self.alpha = randomfloatrange(param_01 * 0.7,param_01);
	}
}

//Function Number: 29
lib_A541::func_57F6(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	self endon("death");
	var_02 = self.x;
	var_03 = self.y;
	var_04 = 0.15;
	if(!param_01)
	{
		self.x = self.x + randomintrange(-30,-10);
		self.y = self.y + randomintrange(10,20);
		self moveovertime(var_04);
		self.x = var_02;
		self.y = var_03;
		self fadeovertime(var_04);
		self.alpha = 0.1;
		wait(var_04);
	}

	self moveovertime(param_00);
	self.x = self.x + randomintrange(15,20);
	self.y = self.y + randomintrange(-4,4);
	wait(param_00);
	var_04 = 0.05;
	self moveovertime(var_04);
	self.x = var_02;
	self.y = var_03;
	wait(var_04);
	self fadeovertime(var_04);
	self.alpha = 0;
}

//Function Number: 30
lib_A541::func_7120(param_00,param_01,param_02)
{
	var_03 = randomintrange(param_00,param_01);
	var_04 = 1;
	if(var_03 < 0)
	{
		var_04 = -1;
	}

	var_03 = max(abs(var_03),param_02);
	return var_03 * var_04;
}

//Function Number: 31
lib_A541::func_23A1(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = level.var_1D66.var_92B1;
	}

	if(!isdefined(param_02))
	{
		param_02 = level.var_1D66.var_92B2;
	}

	var_03 = newhudelem();
	var_03.x = param_01;
	var_03.y = param_02;
	var_03.horzalign = "left";
	var_03.vertalign = "bottom";
	var_03.aligny = "bottom";
	var_03.fontscale = 3;
	var_03.foreground = 1;
	var_03 settext(param_00);
	var_03.text = param_00;
	var_03.alpha = 0;
	var_03.hidewheninmenu = 1;
	var_03.var_18C = 1.4;
	if(level.console)
	{
		var_03.var_18C = 1.2;
	}

	var_03.color = (0.87,0.79,0.45);
	var_03.font = "default";
	if(isdefined(level.var_1D66))
	{
		level.var_1D66.var_4AF9[level.var_1D66.var_4AF9.size] = var_03;
	}

	return var_03;
}

//Function Number: 32
lib_A541::func_3E7B(param_00)
{
	var_01 = spawnstruct();
	var_02 = 0;
	var_03 = 0;
	var_04 = 0;
	if(param_00 == 0)
	{
		var_05 = -85;
		var_02 = level.var_1D66.var_92AD;
		var_03 = level.var_1D66.var_92AE;
		var_04 = level.var_1D66.var_92AF;
	}
	else
	{
		var_05 = 0;
		var_02 = level.var_3BD4.var_92AD;
		var_03 = level.var_3BD4.var_92AE;
		var_04 = level.var_3BD4.var_92AF;
	}

	var_06 = 200;
	var_07 = 60;
	var_01.width = randomintrange(20,var_06);
	var_08 = [5,10,15];
	var_01.height = var_08[randomint(var_08.size)];
	var_01.x = randomintrange(0,var_06 - var_01.width);
	var_01.y = var_05 + randomint(var_07 - var_01.height);
	var_01.alpha = randomfloatrange(0.3,0.7);
	var_01.color = lib_A541::func_3E7A();
	var_01.time = randomfloatrange(0.05,0.1);
	if(var_02)
	{
		var_01.x = int(var_03 + randomintrange(-1,1));
		var_01.y = int(var_04 + randomintrange(0,7));
		var_01.width = randomintrange(100,var_06);
		var_01.height = randomintrange(10,15);
		var_01.color = (0.87,0.79,0.45) * randomfloatrange(0.2,0.4);
	}

	return var_01;
}

//Function Number: 33
lib_A541::func_3E7A()
{
	var_00 = [];
	var_00[var_00.size] = (0.15,0.14,0.22);
	var_00[var_00.size] = (0.09,0.11,0.13);
	var_00[var_00.size] = (0.34,0.22,0.22);
	var_00[var_00.size] = (0.29,0.34,0.22);
	return var_00[randomint(var_00.size)];
}

//Function Number: 34
lib_A541::func_23DA(param_00)
{
	if(param_00 == 0)
	{
		level endon("chyron_faze_out_text_intro");
		if(level.var_1D66.var_8F57.size < 8)
		{
			var_01 = newhudelem();
			var_01.var_9E51 = 0;
			level.var_1D66.var_8F57[level.var_1D66.var_8F57.size] = var_01;
		}

		var_02 = undefined;
		foreach(var_04 in level.var_1D66.var_8F57)
		{
			if(var_04.var_9E51)
			{
				continue;
			}

			var_02 = var_04;
		}

		if(!isdefined(var_02))
		{
			return;
		}

		var_06 = lib_A541::func_3E7B(param_00);
		if(!level.var_1D66.var_92AD)
		{
			if(level.var_1D66.var_555C.size > 0 && level.var_1D66.var_555C.size < 3 && randomint(100) > 10)
			{
				var_07 = level.var_1D66.var_555C[level.var_1D66.var_555C.size - 1];
				var_06.x = var_07.x;
				var_06.y = var_07.y + var_07.height;
				if(common_scripts\utility::cointoss())
				{
					var_06.y = var_07.y - var_06.height;
				}
			}
			else
			{
				level.var_1D66.var_555C = [];
			}

			level.var_1D66.var_555C[level.var_1D66.var_555C.size] = var_02;
		}
	}
	else
	{
		level endon("chyron_faze_out_text_gamenotify");
		if(level.var_3BD4.var_8F57.size < 8)
		{
			var_01 = newhudelem();
			var_01.var_9E51 = 0;
			level.var_3BD4.var_8F57[level.var_3BD4.var_8F57.size] = var_01;
		}

		var_02 = undefined;
		foreach(var_04 in level.var_3BD4.var_8F57)
		{
			if(var_04.var_9E51)
			{
				continue;
			}

			var_02 = var_04;
		}

		if(!isdefined(var_02))
		{
			return;
		}

		var_06 = lib_A541::func_3E7B(param_00);
		if(!level.var_3BD4.var_92AD)
		{
			if(level.var_3BD4.var_555C.size > 0 && level.var_3BD4.var_555C.size < 3 && randomint(100) > 10)
			{
				var_07 = level.var_3BD4.var_555C[level.var_3BD4.var_555C.size - 1];
				var_06.x = var_07.x;
				var_06.y = var_07.y + var_07.height;
				if(common_scripts\utility::cointoss())
				{
					var_06.y = var_07.y - var_06.height;
				}
			}
			else
			{
				level.var_3BD4.var_555C = [];
			}

			level.var_3BD4.var_555C[level.var_3BD4.var_555C.size] = var_02;
		}
	}

	var_02.x = var_06.x;
	var_02.y = var_06.y;
	var_02.width = var_06.width;
	var_02.height = var_06.height;
	var_02 setshader("white",var_06.width,var_06.height);
	var_02.alpha = var_06.alpha;
	var_02.color = var_06.color;
	var_02.horzalign = "left";
	var_02.vertalign = "bottom";
	if(param_00 == 1)
	{
		var_02.vertalign = "top";
	}

	var_02.fontscale = 1;
	var_02.foreground = 1;
	var_02.hidewheninmenu = 1;
	var_02.var_9E51 = 1;
	wait(var_06.time);
	var_02.alpha = 0;
	var_02.var_9E51 = 0;
}

//Function Number: 35
lib_A541::func_2FC8(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_01;var_03++)
	{
		var_02[var_02.size] = lib_A541::func_23A1(param_00.text);
	}

	return var_02;
}

//Function Number: 36
lib_A541::func_3BD4()
{
	level.var_3BD4 = spawnstruct();
	level.var_3BD4.active = 0;
	level.var_3BD4.var_92B0 = [];
	level thread lib_A541::func_3BD3("chyron_message1");
	level thread lib_A541::func_3BD3("chyron_message2");
	level thread lib_A541::func_3BD3("chyron_message3");
}

//Function Number: 37
lib_A541::func_3BD3(param_00)
{
	for(;;)
	{
		level waittill(param_00,var_01,var_02);
		lib_A541::func_3BD1(var_01);
	}
}

//Function Number: 38
lib_A541::func_3BD1(param_00)
{
	level.var_3BD4.var_92B0[level.var_3BD4.var_92B0.size] = param_00;
	if(!level.var_3BD4.active)
	{
		level thread lib_A541::func_3BD5();
	}
}

//Function Number: 39
lib_A541::func_3BD7()
{
	level.var_3BD4.active = 1;
	level.var_3BD4.var_92AD = 0;
	level.var_3BD4.var_8F58 = 1;
	level.var_3BD4.var_92B1 = 6;
	level.var_3BD4.var_92B2 = 10;
	level.var_3BD4.var_4AF9 = [];
	level.var_3BD4.var_8F57 = [];
	level.var_3BD4.var_555C = [];
	level.var_3BD4.var_D30 = [];
	level.var_3BD4.var_889C = spawn("script_origin",level.var_31D.var_2E6);
	level.var_3BD4.var_889C linkto(level.var_31D);
}

//Function Number: 40
lib_A541::func_3BD6()
{
	level.var_3BD4.var_889C delete();
	level.var_3BD4 = spawnstruct();
	level.var_3BD4.active = 0;
	level.var_3BD4.var_92B0 = [];
}

//Function Number: 41
lib_A541::func_3BD5()
{
	lib_A541::func_3BD7();
	lib_A541::func_1D67(1,"ui_chyron_on");
	var_00 = 0;
	while(level.var_3BD4.var_92B0.size)
	{
		level thread lib_A541::func_3BD2(level.var_3BD4.var_92B0[0],var_00);
		var_00++;
		wait(0.5);
		level.var_3BD4.var_92B0 = lib_A59A::func_CFA(level.var_3BD4.var_92B0,0);
	}

	lib_A541::func_1D67(1,"ui_chyron_off");
	lib_A541::func_3696(1,1);
	if(level.var_3BD4.var_92B0.size)
	{
		level.var_3BD4.var_889C delete();
		thread lib_A541::func_3BD5();
		return;
	}

	lib_A541::func_3BD6();
}

//Function Number: 42
lib_A541::func_3BD2(param_00,param_01)
{
	var_02 = lib_A541::func_23BB(param_00,param_01);
	level.var_3BD4.var_92AE = var_02.x;
	level.var_3BD4.var_92AF = var_02.y;
	level.var_3BD4.var_92AD = 1;
	var_02.alpha = 1;
}

//Function Number: 43
lib_A541::func_23BB(param_00,param_01)
{
	var_02 = newhudelem();
	var_02.x = level.var_3BD4.var_92B1;
	var_02.y = level.var_3BD4.var_92B2 + param_01 * 20;
	var_02.horzalign = "left";
	var_02.vertalign = "top";
	var_02.fontscale = 3;
	var_02.foreground = 1;
	var_02 settext(param_00);
	var_02.text = param_00;
	var_02.alpha = 0;
	var_02.hidewheninmenu = 1;
	var_02.font = "default";
	var_02.var_18C = 1.25;
	if(level.console)
	{
		var_02.var_18C = 1;
	}

	var_02.color = (0.87,0.79,0.45);
	var_02.glowalpha = 0;
	level.var_3BD4.var_4AF9[level.var_3BD4.var_4AF9.size] = var_02;
	return var_02;
}

//Function Number: 44
lib_A541::func_8F75(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = lib_A541::func_23A1(param_00,param_02,param_03);
	var_07.var_18C = 2;
	var_07.horzalign = "subleft";
	var_07.vertalign = "subtop";
	var_07.aligny = "middle";
	var_07.alignx = "center";
	var_07.alpha = 1;
	var_07.fontscale = 3;
	if(isdefined(param_05))
	{
		var_07.glowcolor = param_05;
	}

	if(!isdefined(param_06))
	{
		param_06 = 20;
	}

	var_07 setpulsefx(param_06,50000,700);
	var_08 = [var_07];
	var_09 = lib_A541::func_2FC9(var_07,2);
	foreach(var_0B in var_09)
	{
		var_0B.alpha = 0;
		var_0B thread lib_A541::func_4AB2(randomfloatrange(0.5,1.5),randomfloatrange(0.05,0.2),param_01 - 0.5);
	}

	var_08 = common_scripts\utility::array_combine(var_09,var_08);
	return var_08;
}

//Function Number: 45
lib_A541::func_4AB2(param_00,param_01,param_02)
{
	wait(param_00);
	self.alpha = param_01;
	thread lib_A541::func_57F6(param_02 - 0.5,1);
}

//Function Number: 46
lib_A541::func_2FC9(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_01;var_03++)
	{
		var_04 = newhudelem();
		var_04.x = param_00.x;
		var_04.y = param_00.y;
		var_04.alpha = param_00.alpha;
		var_04.aligny = param_00.aligny;
		var_04.alignx = param_00.alignx;
		var_04.horzalign = param_00.horzalign;
		var_04.vertalign = param_00.vertalign;
		var_04.foreground = param_00.foreground;
		var_04.hidewheninmenu = param_00.hidewheninmenu;
		var_04.var_18C = param_00.var_18C;
		var_04.fontscale = param_00.fontscale;
		var_04.color = param_00.color;
		var_04 settext(param_00.text);
		var_02[var_02.size] = var_04;
	}

	return var_02;
}

//Function Number: 47
lib_A541::func_8F74(param_00,param_01,param_02,param_03)
{
	var_04 = newhudelem();
	var_04.x = param_01;
	var_04.y = param_02 + param_03 - 1 * 10;
	var_04.alignx = "center";
	var_04.aligny = "middle";
	var_04.horzalign = "subleft";
	var_04.vertalign = "subtop";
	var_04.fontscale = 1;
	var_04.foreground = 1;
	var_04.hidewheninmenu = 1;
	var_04.alpha = 0;
	var_05 = param_03 * 40 + 20;
	var_04 setshader("white",1,var_05);
	var_04.color = (0.87,0.79,0.45);
	var_04 fadeovertime(0.25);
	var_04.alpha = 0.1;
	var_04 scaleovertime(0.1,2000,var_05);
	wait(0.1);
	common_scripts\utility::array_thread(param_00,::lib_A541::func_4ABE,0.1);
	var_06 = 0.15;
	var_04 fadeovertime(0.25);
	var_04.alpha = 0.2;
	var_04.color = (1,1,1);
	var_04 scaleovertime(var_06,2000,2);
	wait(var_06);
	var_04 scaleovertime(var_06,2,2);
	var_04 fadeovertime(var_06);
	var_04.alpha = 0;
	wait(var_06);
	var_04 destroy();
}