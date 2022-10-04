/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_zipline.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 30
 * Decompile Time: 1425 ms
 * Timestamp: 4/20/2022 8:19:49 PM
*******************************************************************/

//Function Number: 1
func_6ECE()
{
	func_6EBB();
	func_57CD();
}

//Function Number: 2
func_6EBB()
{
	level._effect["warbird_harpoon_spiral"] = loadfx("vfx/vehicle/warbird_harpoon_spiral");
	level._effect["warbird_zip_rope_glow"] = loadfx("vfx/vehicle/warbird_zip_rope_glow");
	level._effect["dust_harpoon_impact"] = loadfx("vfx/dust/dust_harpoon_impact");
}

//Function Number: 3
func_57CD()
{
	func_57C2();
	func_57CC();
	precachemodel("npc_zipline_rope_left");
}

//Function Number: 4
func_57C2()
{
	level.var_78A9["generic"]["npc_inverted_zipline_launch_1"] = %npc_inverted_zipline_launch_1;
	level.var_78A9["generic"]["npc_inverted_zipline_launch_2"] = %npc_inverted_zipline_launch_2;
	level.var_78A9["generic"]["npc_inverted_zipline_launch_3"] = %npc_inverted_zipline_launch_3;
	level.var_78A9["generic"]["npc_inverted_zipline_launch_4"] = %npc_inverted_zipline_launch_4;
	level.var_78A9["generic"]["zipline_land_spc_1"] = %npc_inverted_zipline_spc_1;
	level.var_78A9["generic"]["zipline_land_spc_2"] = %npc_inverted_zipline_spc_2;
	level.var_78A9["generic"]["zipline_land_spc_3"] = %npc_inverted_zipline_spc_3;
	level.var_78A9["generic"]["zipline_land_spc_4"] = %npc_inverted_zipline_spc_4;
	level.var_78A9["generic"]["zipline_land_1"] = %npc_inverted_zipline_1;
	level.var_78A9["generic"]["zipline_land_2"] = %npc_inverted_zipline_2;
	level.var_78A9["generic"]["zipline_land_3"] = %npc_inverted_zipline_3;
	level.var_78A9["generic"]["zipline_land_4"] = %npc_inverted_zipline_4;
	level.var_78A9["generic"]["zipline_land_6"] = %npc_inverted_zipline_6;
	level.var_78A9["generic"]["zipline_land_7"] = %npc_inverted_zipline_7;
	level.var_78A9["generic"]["zipline_land_8"] = %npc_inverted_zipline_8;
	level.var_78A9["generic"]["zipline_land_9"] = %npc_inverted_zipline_9;
	level.var_78A9["generic"]["zipline_ground_land_ra"] = %zipline_right_land_guy_a;
	level.var_78A9["generic"]["zipline_ground_land_rb"] = %zipline_right_land_guy_b;
	level.var_78A9["generic"]["zipline_ground_land_la"] = %zipline_left_landing_guy_a;
	level.var_78A9["generic"]["zipline_ground_land_lb"] = %zipline_left_landing_guy_b;
	level.var_78A9["generic"]["zipline_idleloop_ra"][0] = %zipline_right_slidedown_guy_a;
	level.var_78A9["generic"]["zipline_idleloop_rb"][0] = %zipline_right_slidedown_guy_b;
	level.var_78A9["generic"]["zipline_idleloop_la"][0] = %zipline_left_slidedown_guy_a;
	level.var_78A9["generic"]["zipline_idleloop_lb"][0] = %zipline_left_slidedown_guy_b;
}

//Function Number: 5
func_57CC()
{
	level.var_78AE["_zipline_rope_fl"] = #animtree;
	level.var_78B2["_zipline_rope_fl"] = "npc_zipline_rope_left";
	level.var_78A9["_zipline_rope_fl"]["fastzip_fire"] = %fastzip_launcher_fire_left_npc;
	level.var_78A9["_zipline_rope_fl"]["fastzip_slide"] = %fastzip_launcher_slidedown_left_npc;
	level.var_78A9["_zipline_rope_fl"]["retract_rope"] = %fastzip_launcher_retract_left;
	lib_A506::func_807("_zipline_rope_fl","fx_harpoon_launch",::func_46DB,"fastzip_fire");
}

//Function Number: 6
func_46DB(param_00)
{
	playfxontag(common_scripts\utility::getfx("warbird_harpoon_spiral"),param_00,"jnt_harpoon");
	playfxontag(common_scripts\utility::getfx("warbird_zip_rope_glow"),param_00,"harpooncablebend");
}

//Function Number: 7
func_892A(param_00,param_01,param_02)
{
	if(isstring(param_00))
	{
		var_03 = getent(param_00,"targetname");
	}
	else
	{
		var_03 = param_01;
	}

	var_03.count = 1;
	var_04 = var_03 lib_A59A::func_88BD(1);
	lib_A59A::func_88EB(var_04);
	wait 0.05;
	var_04.animname = "generic";
	level notify("zipline_guys_spawned",var_04);
	var_04 thread func_7D94(param_01,param_02);
	return var_04;
}

//Function Number: 8
func_7D94(param_00,param_01,param_02)
{
	var_03 = undefined;
	var_04 = undefined;
	var_05 = undefined;
	if(isstring(param_00))
	{
		var_04 = lib_A59A::func_3F81(param_00,"targetname");
	}
	else
	{
		var_04 = param_00;
	}

	var_06 = var_04.var_2E6;
	if(isdefined(var_04.target))
	{
		var_05 = lib_A59A::func_3F81(var_04.target,"targetname");
	}
	else if(isdefined(var_04.var_39B))
	{
		var_05 = lib_A59A::func_3F81(var_04.var_39B,"targetname");
	}
	else
	{
		return;
	}

	var_07 = var_05.var_2E6;
	self.var_A3BB = var_07;
	var_08 = vectortoangles(var_07 - var_06);
	var_09 = lib_A59A::func_88CB("_zipline_rope_fl",var_06,var_08);
	var_09 setmodel("npc_zipline_rope_left");
	var_0A = randomfloat(100);
	if(var_0A < 25)
	{
		var_0B = "zipline_idleloop_ra";
	}
	else if(var_0B < 50)
	{
		var_0B = "zipline_idleloop_rb";
	}
	else if(var_0B < 75)
	{
		var_0B = "zipline_idleloop_la";
	}
	else
	{
		var_0B = "zipline_idleloop_la";
	}

	if(var_07[2] > var_06[2])
	{
		var_03 = func_3DB2(var_05,1);
	}

	if(!isdefined(param_01))
	{
		if(var_07[2] > var_06[2])
		{
			param_01 = "zipline_land_8";
		}
		else
		{
			var_0A = randomfloat(100);
			if(var_0A < 25)
			{
				param_01 = "zipline_ground_land_ra";
			}
			else if(var_0A < 50)
			{
				param_01 = "zipline_ground_land_rb";
			}
			else if(var_0A < 50)
			{
				param_01 = "zipline_ground_land_la";
			}
			else
			{
				param_01 = "zipline_ground_land_lb";
			}
		}
	}

	func_7D95(var_06,var_07,var_09,"fastzip_fire","fastzip_slide",var_0B,var_03,param_01,param_02);
}

//Function Number: 9
func_7D95(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	self endon("death");
	param_02 func_2BCE(param_02,param_00,param_01,param_03);
	param_02 func_2BD0(param_02,param_00,param_01,param_03,param_04);
	var_09 = param_01[2] > param_00[2];
	var_0A = param_02 func_37C4(param_00,param_01,param_03);
	var_0B = var_0A[0];
	var_0C = var_0A[1];
	var_0D = var_0A[2];
	param_02 thread func_738E(param_08,var_0B,self);
	if(!isdefined(self) || !isalive(self))
	{
		return 1;
	}

	if(isdefined(self) && isalive(self))
	{
		var_0E = func_3EA9(param_07,var_09);
		self.var_5096 = 1;
		thread func_0A91();
		func_3687(param_02,param_05,param_04,var_0C,var_0E);
		func_3685(param_06,var_09);
		func_3684(param_07,var_09,var_0E);
		self notify("end_allow_death_during_zipline");
		self.var_5096 = undefined;
	}

	if(!isdefined(param_08) || !param_08)
	{
		param_02 func_74BF(var_0B);
		param_02 delete();
	}

	return 1;
}

//Function Number: 10
func_738E(param_00,param_01,param_02)
{
	param_02 waittill("death");
	if(isdefined(self) && !isdefined(param_00) || !param_00)
	{
		func_74BF(param_01);
		self delete();
	}
}

//Function Number: 11
func_0A91()
{
	self endon("end_allow_death_during_zipline");
	self endon("death");
	for(;;)
	{
		if(isdefined(self.var_113) && self.var_113)
		{
			func_8ED5();
			var_00 = self getlinkedparent();
			if(isdefined(var_00))
			{
				self unlink();
			}

			self method_818E("gravity");
		}

		wait 0.05;
	}
}

//Function Number: 12
func_3DB2(param_00,param_01)
{
	if(1)
	{
		var_02 = randomfloat(100);
		if(param_01)
		{
			if(var_02 < 25)
			{
				return "npc_inverted_zipline_launch_1";
			}

			if(var_02 < 50)
			{
				return "npc_inverted_zipline_launch_2";
			}

			if(var_02 < 75)
			{
				return "npc_inverted_zipline_launch_3";
			}

			return "npc_inverted_zipline_launch_4";
		}

		if(var_02 < 25)
		{
			return %npc_inverted_zipline_launch_1;
		}

		if(var_02 < 50)
		{
			return %npc_inverted_zipline_launch_2;
		}

		if(var_02 < 75)
		{
			return %npc_inverted_zipline_launch_3;
		}

		return %npc_inverted_zipline_launch_4;
	}

	if(param_01)
	{
		return param_00.animation;
	}

	return lib_A59A::func_3EF3(param_00.animation);
}

//Function Number: 13
func_3EA9(param_00,param_01)
{
	if(!param_01)
	{
		return 0.4329;
	}

	return 0;
}

//Function Number: 14
main()
{
}

//Function Number: 15
func_3685(param_00,param_01)
{
	self endon("death");
	if(isalive(self))
	{
		if(isdefined(param_00))
		{
			func_9A28();
			func_8ED5();
			common_scripts\utility::delay_script_call(0.2,::func_7E9A,0.2);
			if(isstring(param_00))
			{
				level.var_78B0[self.animname][param_00] = self.var_BAD;
				thread lib_A506::func_C24(self,param_00);
				var_02 = function_0063(lib_A59A::func_3EF3(param_00));
				wait(func_9880(var_02));
				return;
			}

			self method_8110("traverseAnim",param_01,%body,1,0.2,1);
			var_02 = function_0063(param_01);
			wait(var_02);
			return;
		}

		func_7E9A(0.2);
	}
}

//Function Number: 16
func_9880(param_00)
{
	var_01 = param_00 * 20;
	var_01 = int(var_01);
	return var_01 * 0.05;
}

//Function Number: 17
func_7E9A(param_00)
{
	self.var_BAD = param_00;
}

//Function Number: 18
func_8ED5()
{
	self notify("stop_loop");
	self method_8141();
}

//Function Number: 19
func_9A28()
{
	if(!isdefined(self))
	{
		return;
	}

	var_00 = self getlinkedparent();
	if(isdefined(var_00))
	{
		self unlink();
	}
}

//Function Number: 20
func_3684(param_00,param_01,param_02)
{
	self endon("death");
	if(isalive(self))
	{
		common_scripts\utility::delay_script_call(param_02,::func_9A28);
		func_8ED5();
		var_03 = undefined;
		if(isstring(param_00))
		{
			var_03 = lib_A59A::func_3EF3(param_00);
		}
		else
		{
			var_03 = param_00;
		}

		var_04 = function_0063(var_03);
		var_05 = 0;
		var_06 = 0;
		var_07 = 0;
		if(animhasnotetrack(var_03,"finish"))
		{
			var_05 = var_04 * getnotetracktimes(var_03,"finish")[0];
		}
		else
		{
			var_05 = var_04;
		}

		if(animhasnotetrack(var_03,"land"))
		{
			var_06 = var_04 * getnotetracktimes(var_03,"land")[0];
			var_07 = 1;
		}

		level.var_78B0[self.animname][param_00] = self.var_BAD;
		lib_A5DE::snd_message("seo_zipline_rappel_land",self);
		if(param_01)
		{
			thread lib_A506::func_C24(self,param_00);
		}
		else
		{
			thread lib_A506::func_BCA(self,"nogravity",param_00,undefined,undefined,0);
		}

		wait(param_02);
		if(var_07)
		{
			wait(var_06 - param_02 - 0.05);
			self method_818E("gravity");
			wait(var_05 - var_06 - param_02 - 0.05);
		}
		else
		{
			wait(var_05 - param_02);
		}

		self method_8141();
		return;
	}

	self.var_51D7 = undefined;
	self method_818E("none");
	self notify("zipline_done");
}

//Function Number: 21
func_3CAE(param_00,param_01,param_02)
{
	var_03 = getmovedelta(param_00,0,1);
	var_03 = rotatevector(var_03,self.var_41);
	var_04 = (self.var_2E6[0] + var_03[0],self.var_2E6[1] + var_03[1],self.var_2E6[2]) + (0,0,70);
	var_05 = physicstrace(var_04,self.var_2E6 + (0,0,-5120),self);
	var_06 = var_05[2] - self.var_2E6[2];
	var_07 = animscripts\utility::func_3E9C(0,var_06,-1 * self.var_4FF[2],-1 * getdvarint("g_gravity"));
	var_07 = var_07 - param_02;
	var_08 = param_02 / var_07;
	if(var_06 >= var_03[2])
	{
		return 1;
	}

	if(var_08 <= 0)
	{
		return 1;
	}

	return var_08;
}

//Function Number: 22
func_3687(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	var_05 = param_00 lib_A59A::func_3EF3(param_02);
	param_00 method_814C(%add_slide,1,0,0);
	param_00 method_814C(var_05,1,0,0);
	var_06 = anglestoforward(param_00.var_41);
	var_06 = (var_06[0],var_06[1],0);
	var_07 = vectortoangles(var_06);
	var_08 = param_00 func_4101("tag_player_attach");
	var_09 = var_08[0];
	var_0A = var_08[1];
	self method_81C6(var_09,var_07,100000);
	if(isstring(param_01))
	{
		thread lib_A506::func_BE1(self,param_01,"stop_loop");
	}
	else
	{
		thread func_6975(param_01,"stop_loop");
	}

	lib_A5DE::snd_message("seo_zipline_rappel_begin");
	wait(0.05);
	self linkto(param_00,"tag_player_attach");
	param_00 method_814C(%add_slide,1,0,1);
	param_00 method_814C(var_05,1,0,1);
	wait(param_03 - 0.1 - param_04);
	thread func_3688(param_00,var_05,param_04);
}

//Function Number: 23
func_3688(param_00,param_01,param_02)
{
	self endon("death");
	param_00 endon("death");
	wait(param_02);
	var_03 = 1;
	while(var_03 > 0)
	{
		var_03 = var_03 - 0.1;
		param_00 method_83C7(param_01,var_03);
		wait 0.05;
	}

	param_00 method_83C7(param_01,0);
}

//Function Number: 24
func_6975(param_00,param_01)
{
	self endon("death");
	self method_8110("idle",param_00,%body,1,0.1,1);
	self waittill(param_01);
	self method_8142(param_00,0.2);
}

//Function Number: 25
func_4101(param_00)
{
	var_01 = self gettagorigin("jnt_shuttleClip");
	var_02 = self gettagorigin(param_00);
	var_03 = distance(var_01,var_02);
	var_04 = var_01 + (0,0,-1) * var_03;
	return [var_04,var_02 - var_04];
}

//Function Number: 26
func_2BD0(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_00 gettagorigin("jnt_winchCableBend");
	var_06 = distance(param_02,param_01);
	var_07 = param_02 - param_01;
	var_08 = var_06 / 2400;
	param_00 method_814B(param_00 lib_A59A::func_3EF3(param_04),1,0,0);
	param_00 method_8117(param_00 lib_A59A::func_3EF3(param_04),var_08);
	wait 0.05;
	var_09 = param_00 gettagorigin("jnt_shuttleRoot");
	param_00 method_8117(param_00 lib_A59A::func_3EF3(param_04),0);
	var_0A = var_09 - param_01;
	var_0B = vectortoangles(var_0A);
	var_0C = vectortoangles(var_07);
	var_0D = combineangles(var_0C,invertangles(var_0B));
	var_0E = combineangles(var_0D,var_0C);
	param_00.var_41 = var_0E;
}

//Function Number: 27
func_2BCE(param_00,param_01,param_02,param_03)
{
	param_00 lib_A506::func_BC7(param_00,param_03);
	var_04 = param_00 gettagorigin("jnt_winchCableBend");
	param_00.var_2E6 = param_00.var_2E6 + param_01 - var_04;
}

//Function Number: 28
func_37C4(param_00,param_01,param_02)
{
	var_03 = undefined;
	var_04 = undefined;
	var_05 = 1;
	var_06 = 7;
	var_07 = distance(param_01,param_00) / 12;
	if(var_07 <= 200)
	{
		var_08 = var_07 / 200;
	}
	else
	{
		var_08 = 1;
		var_07 = 200;
	}

	if(var_05)
	{
		var_09 = param_01 - param_00;
		var_09 = vectornormalize(var_09);
		var_04 = param_01 + var_09 * 2400;
		var_0A = bullettrace(param_01,var_04,0);
		if(var_0A["fraction"] < 1)
		{
			var_04 = var_0A["position"];
		}

		var_0B = distance(param_00,var_04) / 12;
		var_0B = var_0B - 3.75;
		if(var_0B <= 200)
		{
			var_03 = var_0B / 200;
		}
		else
		{
			var_03 = 1;
			var_0B = 200;
		}
	}
	else
	{
		var_03 = var_08;
	}

	var_0C = lib_A59A::func_3EF3(param_02);
	var_0D = function_0063(var_0C);
	var_0E = var_0D * var_03 / var_06 - 0.05;
	lib_A5DE::snd_message("seo_zipline_harpoon_fire",param_00,param_01,var_0E);
	self method_8152(param_02,var_0C,1,0.2,var_06);
	thread lib_A506::func_8C11(self,param_02,param_02,self.animname,var_0C);
	thread lib_A506::func_C7E(self,param_02,param_02);
	if(var_0E > 0.05)
	{
		wait(var_0E);
	}

	self method_814B(var_0C,1,0,0);
	self method_8117(var_0C,var_03);
	var_0F = self gettagorigin("jnt_harpoon");
	var_10 = anglestoright(self gettagangles("jnt_harpoon"));
	self.var_4919 = physicstrace(var_0F + var_10 * -75,var_0F + var_10 * 75,self);
	playfx(common_scripts\utility::getfx("dust_harpoon_impact"),self.var_4919);
	lib_A5DE::snd_message("seo_zipline_harpoon_impact",self.var_4919);
	level notify("zipline_triggered",self.var_2E6,self.var_4919);
	wait 0.05;
	self method_814B(var_0C,1,0,0);
	self method_8117(var_0C,1);
	var_11 = self gettagorigin("jnt_harpoon");
	var_12 = distance(var_0F,var_11);
	if(var_12 > 0)
	{
		var_13 = distance(var_0F,self.var_4919) - 15;
		var_14 = 1 - var_03 * var_13 / var_12;
		self method_814B(var_0C,1,0,0);
		self method_8117(var_0C,var_14 + var_03);
	}

	var_15 = var_0D * var_08 / 1;
	return [var_07,var_15,var_04];
}

//Function Number: 29
func_87BF(param_00)
{
	var_01 = self;
	var_02 = randomfloatrange(0.1,0.2);
	wait(var_02);
	var_01 lib_A5F1::func_8724("tac_fastzip_fire");
	wait(var_02);
	common_scripts\utility::play_sound_in_space("tac_fastzip_proj_impact",param_00);
}

//Function Number: 30
func_74BF(param_00)
{
	var_01 = param_00 / 200;
	var_01 = 1 - min(var_01,1);
	var_02 = 30;
	var_03 = 1;
	var_04 = lib_A59A::func_3EF3("retract_rope");
	self method_8143(var_04,1,0.2,var_03);
	self method_8117(var_04,var_01);
	playfx(common_scripts\utility::getfx("dust_harpoon_impact"),self.var_4919);
	lib_A5DE::snd_message("seo_zipline_retract_rope",self.var_4919);
	var_05 = var_02 * 1 - var_01 / 30 * var_03;
	wait(var_05 + 0.05);
}