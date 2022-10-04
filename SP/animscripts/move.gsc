/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: move.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 45
 * Decompile Time: 1704 ms
 * Timestamp: 4/20/2022 8:20:36 PM
*******************************************************************/

//Function Number: 1
func_4C85()
{
	var_00 = [];
	var_00["fire"] = %exposed_shoot_auto_v3;
	var_00["single"] = [%exposed_shoot_semi1];
	var_00["single_shotgun"] = [%shotgun_stand_fire_1a,%shotgun_stand_fire_1b];
	var_00["burst2"] = %exposed_shoot_burst3;
	var_00["burst3"] = %exposed_shoot_burst3;
	var_00["burst4"] = %exposed_shoot_burst4;
	var_00["burst5"] = %exposed_shoot_burst5;
	var_00["burst6"] = %exposed_shoot_burst6;
	var_00["semi2"] = %exposed_shoot_semi2;
	var_00["semi3"] = %exposed_shoot_semi3;
	var_00["semi4"] = %exposed_shoot_semi4;
	var_00["semi5"] = %exposed_shoot_semi5;
	level.var_CCA["soldier"]["shoot_while_moving"] = var_00;
	var_00 = [];
	var_00["shuffle_start_from_cover_left"] = %cornercrl_alert_2_shuffle;
	var_00["shuffle_start_from_cover_right"] = %cornercrr_alert_2_shuffle;
	var_00["shuffle_start_left"] = %covercrouch_hide_2_shufflel;
	var_00["shuffle_start_right"] = %covercrouch_hide_2_shuffler;
	var_00["shuffle_to_cover_left"] = %covercrouch_shufflel;
	var_00["shuffle_end_to_cover_left"] = %cornercrl_shuffle_2_alert;
	var_00["shuffle_to_cover_right"] = %covercrouch_shuffler;
	var_00["shuffle_end_to_cover_right"] = %cornercrr_shuffle_2_alert;
	var_00["shuffle_start_left_stand_to_stand"] = %coverstand_hide_2_shufflel;
	var_00["shuffle_left_stand_to_stand"] = %coverstand_shufflel;
	var_00["shuffle_end_left_stand_to_stand"] = %coverstand_shufflel_2_hide;
	var_00["shuffle_start_right_stand_to_stand"] = %coverstand_hide_2_shuffler;
	var_00["shuffle_right_stand_to_stand"] = %coverstand_shuffler;
	var_00["shuffle_end_right_stand_to_stand"] = %coverstand_shuffler_2_hide;
	var_00["shuffle_to_left_crouch"] = %covercrouch_shufflel;
	var_00["shuffle_end_to_left_stand"] = %coverstand_shufflel_2_hide;
	var_00["shuffle_end_to_left_crouch"] = %covercrouch_shufflel_2_hide;
	var_00["shuffle_to_right_crouch"] = %covercrouch_shuffler;
	var_00["shuffle_end_to_right_stand"] = %coverstand_shuffler_2_hide;
	var_00["shuffle_end_to_right_crouch"] = %covercrouch_shuffler_2_hide;
	level.var_CCA["soldier"]["shuffle"] = var_00;
}

//Function Number: 2
func_4CA9()
{
	var_00 = [];
	var_00["fire"] = %smg_exposed_shoot_auto_v3;
	var_00["single"] = [%smg_exposed_shoot_semi1];
	var_00["single_shotgun"] = [%shotgun_stand_fire_1a,%shotgun_stand_fire_1b];
	var_00["burst2"] = %smg_exposed_shoot_burst3;
	var_00["burst3"] = %smg_exposed_shoot_burst3;
	var_00["burst4"] = %smg_exposed_shoot_burst4;
	var_00["burst5"] = %smg_exposed_shoot_burst5;
	var_00["burst6"] = %smg_exposed_shoot_burst6;
	var_00["semi2"] = %smg_exposed_shoot_semi2;
	var_00["semi3"] = %smg_exposed_shoot_semi3;
	var_00["semi4"] = %smg_exposed_shoot_semi4;
	var_00["semi5"] = %smg_exposed_shoot_semi5;
	level.var_CCA["soldier"]["smg_shoot_while_moving"] = var_00;
}

//Function Number: 3
main()
{
	if(isdefined(self.var_2533))
	{
		if(isdefined(self.var_2533["move"]))
		{
			[[ self.var_2533["move"] ]]();
			return;
		}
	}

	self endon("killanimscript");
	[[ self.exception["move"] ]]();
	func_5F50();
	func_4147();
	animscripts\utility::func_4DD4("move");
	var_00 = func_A1C6();
	if(var_00 && isdefined(self.var_8541))
	{
		func_5F45();
		func_5F48();
	}
	else if(isdefined(self.var_132D) && self.var_132D)
	{
		var_01 = var_00;
		func_5F7A(var_01);
		animscripts\battlechatter::func_6A2B();
		if(isdefined(self.inliveplayerkillstreak))
		{
			if(var_01)
			{
				thread lib_A51B::func_2612("react_leave_cover",self.inliveplayerkillstreak != "allies");
				thread lib_A51B::func_2612("thrt_breaking",self.inliveplayerkillstreak != "allies");
				thread lib_A51B::func_2612("act_moving",self.inliveplayerkillstreak == "allies");
				thread lib_A51B::func_2612("act_advancing",self.inliveplayerkillstreak == "allies");
			}
			else
			{
				thread lib_A51B::func_2612("react_cover",self.inliveplayerkillstreak != "allies");
			}
		}
	}

	thread func_9B6D();
	var_02 = ::func_66D6;
	if(isdefined(self.var_66D5))
	{
		var_02 = self.var_66D5;
	}

	self thread [[ var_02 ]]();
	thread func_0C6A();
	animscripts\exit_node::func_8D28();
	self.var_2CE7 = undefined;
	self.var_4BB4 = undefined;
	thread func_8D3A();
	func_57A0();
	self.var_83E1 = undefined;
	self.var_972 = undefined;
	self.var_76D3 = undefined;
	func_5F54(1);
}

//Function Number: 4
end_script()
{
	if(isdefined(self.var_63CE))
	{
		self.var_1D6 = self.var_63CE;
		self.var_63CE = undefined;
	}

	self.var_91EA = undefined;
	self.var_5C77 = undefined;
	self.var_4BB4 = undefined;
	self.var_8541 = undefined;
	self.var_8543 = undefined;
	self.var_76D3 = undefined;
	self.var_7178 = undefined;
	self.var_7406 = undefined;
	self.var_2513 = undefined;
	self.var_5F53 = undefined;
	animscripts\run::func_8007(0);
	if(self.var_425)
	{
		animscripts\swim::func_9040();
	}

	self method_8142(%head,0.2);
	self.var_35C5 = undefined;
}

//Function Number: 5
func_5F50()
{
	self.var_7178 = undefined;
	self.var_7406 = undefined;
	self.var_9AC1 = undefined;
	self.var_9AC2 = undefined;
	self.var_76D7 = 0;
	self.var_D28 = undefined;
}

//Function Number: 6
func_4147()
{
	if(self.var_7.var_6E57 == "prone")
	{
		var_00 = animscripts\utility::func_1D45("stand");
		if(var_00 != "prone")
		{
			self method_818F("face current");
			self method_818E("zonly_physics",0);
			var_01 = 1;
			if(isdefined(self.grenade))
			{
				var_01 = 2;
			}

			animscripts\cover_prone::func_7028(var_00,var_01);
			self method_818E("none",0);
			self method_818F("face default");
		}
	}
}

//Function Number: 7
func_A1C6()
{
	switch(self.var_33A)
	{
		case "cover_wide_right":
		case "cover_wide_left":
		case "concealment_stand":
		case "concealment_prone":
		case "concealment_crouch":
		case "cover_prone":
		case "cover_swim_right":
		case "cover_swim_left":
		case "cover_left":
		case "turret":
		case "hide":
		case "cover_multi":
		case "cover_right":
		case "cover_stand":
		case "cover_crouch":
			break;
	}
}

//Function Number: 8
func_5F7A(param_00)
{
	if(self.movemode == "run")
	{
		animscripts\battlechatter_ai::func_33B3(param_00);
		lib_A51B::func_33B3(param_00);
	}
}

//Function Number: 9
func_5F54(param_00)
{
	func_5F55(param_00);
	self notify("abort_reload");
}

//Function Number: 10
func_0CC8()
{
	if(isdefined(self.var_C4D) && self.var_C4D != self.var_6F6B)
	{
		return 1;
	}
	else if(!isdefined(self.var_C4D) && self.var_6F6B != "none")
	{
		return 1;
	}

	return 0;
}

//Function Number: 11
func_9B34(param_00)
{
	if(param_00 != self.var_6F6C || func_0CC8())
	{
		if(isdefined(self.var_2562) && isdefined(self.var_2562[param_00]))
		{
			self.var_7.var_5F40 = self.var_2562[param_00];
		}
		else
		{
			self.var_7.var_5F40 = animscripts\utility::func_5861(param_00);
			if((self.var_C8 == "ambush" || self.var_C8 == "ambush_nodes_only") && isdefined(self.var_2FD) && distancesquared(self.var_2E6,self.var_2FD) > squared(100))
			{
				self.var_8559 = 1;
				animscripts\animset::func_7DB4();
			}
			else
			{
				self.var_8559 = 1.35;
			}
		}

		self.var_6F6C = param_00;
		if(isdefined(self.var_C4D))
		{
			self.var_6F6B = self.var_C4D;
		}
	}
}

//Function Number: 12
func_5F55(param_00)
{
	self endon("killanimscript");
	self endon("move_interrupt");
	var_01 = self method_814F(%walk_and_run_loops);
	self.var_7.var_76D1 = randomint(10000);
	self.var_6F6C = "none";
	self.var_6F6B = "none";
	self.var_5F52 = undefined;
	for(;;)
	{
		var_02 = self method_814F(%walk_and_run_loops);
		if(var_02 < var_01)
		{
			self.var_7.var_76D1++;
		}

		var_01 = var_02;
		func_9B34(self.movemode);
		if(isdefined(self.var_5F57))
		{
			self [[ self.var_5F57 ]](self.movemode);
		}
		else
		{
			func_5F56(self.movemode);
		}

		if(isdefined(self.var_5F52))
		{
			self [[ self.var_5F52 ]]();
			self.var_5F52 = undefined;
		}

		self notify("abort_reload");
	}
}

//Function Number: 13
func_72E2(param_00)
{
	self.var_6DF2 = param_00;
}

//Function Number: 14
func_1ECD()
{
	self.var_6DF2 = undefined;
}

//Function Number: 15
func_5F56(param_00)
{
	self endon("move_loop_restart");
	animscripts\face::func_7F8A(level.var_9D2);
	if(isdefined(self.var_5F53))
	{
		self [[ self.var_5F53 ]]();
	}
	else if(isdefined(self.var_6DF2))
	{
		self [[ self.var_6DF2 ]]();
	}
	else if(animscripts\utility::func_8485())
	{
		animscripts\cqb::func_5F49();
	}
	else if(self.var_425)
	{
		animscripts\swim::func_5F7D();
	}
	else if(param_00 == "run")
	{
		animscripts\run::func_5F6D();
	}
	else
	{
		animscripts\walk::func_5F99();
	}

	self.var_7406 = undefined;
}

//Function Number: 16
func_5A5E()
{
	if(self.weapon == "none")
	{
		return 0;
	}

	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		if(self.movemode == "run")
		{
			return 0;
		}
	}

	var_00 = weaponclass(self.weapon);
	if(!animscripts\utility::func_9C2D())
	{
		return 0;
	}

	if(animscripts\combat_utility::issniper())
	{
		if(!animscripts\utility::func_50E6() && self.var_178)
		{
			return 0;
		}
	}

	if(isdefined(self.var_2D3A))
	{
		return 0;
	}

	return 1;
}

//Function Number: 17
func_8415()
{
	self endon("killanimscript");
	self notify("doing_shootWhileMoving");
	self endon("doing_shootWhileMoving");
	var_00 = animscripts\utility::func_5861("shoot_while_moving");
	if(animscripts\utility::func_9C33())
	{
		var_00 = animscripts\utility::func_5861("smg_shoot_while_moving");
	}

	if(isdefined(var_00))
	{
		foreach(var_03, var_02 in var_00)
		{
			self.var_7.var_CD8[var_03] = var_02;
		}
	}

	if(isdefined(self.var_20B3) && isdefined(self.var_20B3["fire"]))
	{
		self.var_7.var_CD8["fire"] = self.var_20B3["fire"];
	}

	if(isdefined(self.weapon) && animscripts\utility::func_A2C6())
	{
		self.var_7.var_CD8["single"] = animscripts\utility::func_5860("shotgun_stand","single");
	}

	for(;;)
	{
		if(!self.var_18B0)
		{
			if(animscripts\utility::func_50E7())
			{
				self.var_B78 = 0;
				animscripts\combat_utility::func_1CAE();
			}

			if(!self.var_18B0)
			{
				wait(0.5);
				continue;
			}
		}

		animscripts\combat_utility::func_8411();
		self method_8142(%exposed_aiming,0.2);
	}
}

//Function Number: 18
func_8D3A()
{
	self endon("killanimscript");
	wait(0.05);
	thread func_18B2();
	thread func_5B7D();
	thread animscripts\door::func_4C43();
	thread animscripts\door::func_2D61();
}

//Function Number: 19
func_9B6D()
{
	self endon("killanimscript");
	self.var_6F73 = self.var_3F2;
	for(;;)
	{
		wait(0.05);
		if(self.var_6F73 != self.var_3F2)
		{
			if(!isdefined(self.var_4BB4) || self.var_3F2 != "none")
			{
				self notify("move_loop_restart");
			}
		}

		self.var_6F73 = self.var_3F2;
	}
}

//Function Number: 20
func_748D(param_00)
{
	self endon("killanimscript");
	if(!param_00)
	{
		animscripts\exit_node::func_8D28();
	}

	self.var_4BB4 = undefined;
	self method_8142(%animscript_root,0.1);
	self method_818F("face default");
	self method_818E("none",0);
	self.var_36C = 1;
	func_5F54(!param_00);
}

//Function Number: 21
func_66D6()
{
	self endon("killanimscript");
	self endon("move_interrupt");
	for(;;)
	{
		self waittill("path_changed",var_00,var_01,var_02);
		if(isdefined(self.var_4BB4) || isdefined(self.var_623C))
		{
			continue;
		}

		if(isdefined(var_00) && var_00)
		{
			continue;
		}

		if(!self.var_178)
		{
			if(!isdefined(self.var_5A77))
			{
				continue;
			}
		}

		if(self.var_7.var_6E57 != "stand")
		{
			continue;
		}

		self notify("stop_move_anim_update");
		self.var_9AC1 = undefined;
		var_03 = vectortoangles(var_01);
		var_04 = angleclamp180(self.var_41[1] - var_03[1]);
		var_05 = angleclamp180(self.var_41[0] - var_03[0]);
		var_06 = func_66D4(var_04,var_05);
		if(isdefined(var_06))
		{
			self.var_9925 = var_06;
			self.var_9933 = gettime();
			self.var_5F53 = ::func_66D3;
			self notify("move_loop_restart");
			animscripts\run::func_315C();
		}
	}
}

//Function Number: 22
func_66D4(param_00,param_01)
{
	if(isdefined(self.var_66F2))
	{
		return [[ self.var_66F2 ]](param_00,param_01);
	}

	var_02 = undefined;
	var_03 = undefined;
	if(self.var_425)
	{
		var_04 = animscripts\swim::func_40FE("turn");
	}
	else if(animscripts\utility::func_51DB())
	{
		var_04 = animscripts\utility::func_5861("unstable_run_turn");
	}
	else if(self.movemode == "walk")
	{
		var_05 = "cqb_turn";
		if((isdefined(self.var_C4D) && isdefined(level.var_CCA[self.var_C4D]["walk_turn"])) || isdefined(level.var_CCA["soldier"]["walk_turn"]))
		{
			var_05 = "walk_turn";
		}

		var_04 = animscripts\utility::func_5861(var_05);
	}
	else if(animscripts\utility::func_8485())
	{
		var_04 = animscripts\utility::func_5861("cqb_run_turn");
	}
	else if(animscripts\utility::func_9C33())
	{
		var_04 = animscripts\utility::func_5861("smg_run_turn");
	}
	else
	{
		var_04 = animscripts\utility::func_5861("run_turn");
	}

	if(param_00 < 0)
	{
		if(param_00 > -45)
		{
			var_06 = 3;
		}
		else
		{
			var_06 = int(ceil(param_01 + 180 - 10 / 45));
		}
	}
	else if(param_01 < 45)
	{
		var_06 = 5;
	}
	else
	{
		var_06 = int(floor(param_01 + 180 + 10 / 45));
	}

	var_02 = var_04[var_06];
	if(isdefined(var_02))
	{
		if(isarray(var_02))
		{
			while(var_02.size > 0)
			{
				var_07 = randomint(var_02.size);
				if(func_66D1(var_02[var_07]))
				{
					return var_02[var_07];
				}

				var_02[var_07] = var_02[var_02.size - 1];
				var_02[var_02.size - 1] = undefined;
			}
		}
		else if(func_66D1(var_02))
		{
			return var_02;
		}
	}

	var_08 = -1;
	if(param_00 < -60)
	{
		var_08 = int(ceil(param_00 + 180 / 45));
		if(var_08 == var_06)
		{
			var_08 = var_06 - 1;
		}
	}
	else if(param_00 > 60)
	{
		var_08 = int(floor(param_00 + 180 / 45));
		if(var_08 == var_06)
		{
			var_08 = var_06 + 1;
		}
	}

	if(var_08 >= 0 && var_08 < 9)
	{
		var_03 = var_04[var_08];
	}

	if(isdefined(var_03))
	{
		if(isarray(var_03))
		{
			var_03 = var_03[0];
		}

		if(func_66D1(var_03))
		{
			return var_03;
		}
	}

	return undefined;
}

//Function Number: 23
func_66D1(param_00)
{
	if(!isdefined(self.var_2FD))
	{
		return 0;
	}

	var_01 = getnotetracktimes(param_00,"code_move");
	var_02 = var_01[0];
	var_03 = getmovedelta(param_00,0,var_02);
	var_04 = self localtoworldcoords(var_03);
	if(isdefined(self.var_D28) && squared(self.var_D28) > distancesquared(self.var_2FD,var_04))
	{
		return 0;
	}

	var_03 = getmovedelta(param_00,0,1);
	var_05 = self localtoworldcoords(var_03);
	var_05 = var_04 + vectornormalize(var_05 - var_04) * 20;
	var_06 = !self.var_425;
	var_07 = self method_81C4(var_04,var_05,var_06,1);
	return var_07;
}

//Function Number: 24
func_66D3()
{
	self endon("killanimscript");
	self.var_5F53 = undefined;
	var_00 = self.var_9925;
	if(gettime() > self.var_9933 + 50)
	{
		return;
	}

	if(self.var_425)
	{
		self method_818E("nogravity",0);
	}
	else
	{
		self method_818E("zonly_physics",0);
	}

	var_01 = 0.1;
	if(isdefined(self.var_66F1))
	{
		var_01 = self.var_66F1;
	}

	self method_8142(%body,var_01);
	self.var_5F52 = ::func_66D2;
	self.var_4BB4 = 1;
	var_01 = 0.05;
	if(isdefined(self.var_66F1))
	{
		var_01 = self.var_66F1;
	}

	self notify("turn_start");
	self method_8113("turnAnim",var_00,1,var_01,self.var_5F62);
	if(animscripts\utility::func_51AD())
	{
		self method_818F("face angle 3d",self.var_41);
	}
	else
	{
		self method_818F("face angle",self.var_41[1]);
	}

	if(isdefined(self.var_2FF2))
	{
		childthread func_595A(var_00,1,"code_move");
	}

	animscripts\shared::func_2D05("turnAnim");
	self.var_4BB4 = undefined;
	self method_818F("face motion");
	self method_818E("none",0);
	animscripts\shared::func_2D05("turnAnim");
	self notify("turn_end");
}

//Function Number: 25
func_3F43()
{
	var_00 = self method_84F4();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(var_00[var_01]["animation"] == %combatrun_forward)
		{
			if(var_00[var_01 + 1].size > 2)
			{
				return var_00[var_01 + 1];
			}
			else
			{
				return undefined;
			}
		}
	}

	return undefined;
}

//Function Number: 26
func_595A(param_00,param_01,param_02)
{
	self endon("death");
	var_03 = 45;
	var_04 = getnotetracktimes(param_00,param_02);
	var_05 = self.var_2E6;
	var_06 = self.var_41;
	var_05 = getstartorigin(var_05,var_06,param_00);
	var_06 = getstartangles(var_05,var_06,param_00);
	var_07 = function_0063(param_00) * var_04[0];
	var_08 = int(lib_A59A::func_760F(var_07 * 20,0,0));
	if(var_08 < 1)
	{
		return;
	}

	var_09 = 1 / var_08;
	var_0A = 0;
	var_0B = self.var_2E6;
	for(;;)
	{
		var_0C = var_0A * var_09;
		var_0D = 1 - var_08 * var_09 - var_0C;
		var_0A++;
		if((!isdefined(self.var_4BB4) && param_01) || var_0C > 1)
		{
			break;
		}

		var_0E = getmovedelta(param_00,0,var_0C);
		var_0F = getangledelta3d(param_00,0,var_0C);
		var_10 = transformmove(var_05,var_06,(0,0,0),(0,0,0),var_0E,var_0F);
		var_11 = var_10["origin"];
		var_12 = var_10["angles"];
		var_13 = self.var_25C;
		var_14 = vectortoangles(self.var_25C)[1];
		var_15 = var_12[1];
		var_16 = angleclamp180(var_14 - var_15);
		var_17 = var_16 * var_0D;
		var_17 = abs(clamp(var_17,-1 * var_03,var_03));
		var_13 = vectorlerp(anglestoforward(var_12),self.var_25C,var_17 / var_03 * var_0D);
		self method_818F("face direction",var_13);
		wait 0.05;
	}
}

//Function Number: 27
func_66D2()
{
	self.var_4BB4 = undefined;
	self method_818F("face default");
	self method_8142(%animscript_root,0.1);
	self method_818E("none",0);
	if(self.var_425)
	{
		animscripts\swim::func_902D();
	}
}

//Function Number: 28
func_2C2C()
{
	self method_81A3(1);
	self method_818E("zonly_physics",0);
	self method_8142(%body,0.2);
	self method_8113("dodgeAnim",self.var_2513,1,0.2,1);
	animscripts\shared::func_2D05("dodgeAnim");
	self method_818E("none",0);
	self method_818F("face default");
	if(animhasnotetrack(self.var_2513,"code_move"))
	{
		animscripts\shared::func_2D05("dodgeAnim");
	}

	self method_8142(%civilian_dodge,0.2);
	self method_81A3(0);
	self.var_2513 = undefined;
	self.var_5F53 = undefined;
	return 1;
}

//Function Number: 29
func_9891(param_00,param_01)
{
	var_02 = (self.var_25C[1],-1 * self.var_25C[0],0);
	var_03 = self.var_25C * param_01[0];
	var_04 = var_02 * param_01[1];
	var_05 = self.var_2E6 + var_03 - var_04;
	self method_81A3(1);
	if(self method_81C3(var_05))
	{
		self.var_2513 = param_00;
		self.var_5F53 = ::func_2C2C;
		self notify("move_loop_restart");
		return 1;
	}

	self method_81A3(0);
	return 0;
}

//Function Number: 30
func_0C6A()
{
	if(!isdefined(self.var_2C29) || !isdefined(self.var_2C2D))
	{
		return;
	}

	self endon("killanimscript");
	self endon("move_interrupt");
	for(;;)
	{
		self waittill("path_need_dodge",var_00,var_01);
		animscripts\utility::func_9B23();
		if(animscripts\utility::func_5121())
		{
			self.var_2C5 = 0;
			return;
		}

		if(!issentient(var_00))
		{
			continue;
		}

		var_02 = vectornormalize(var_01 - self.var_2E6);
		if(self.var_25C[0] * var_02[1] - var_02[0] * self.var_25C[1] > 0)
		{
			if(!func_9891(self.var_2C2D,self.var_2C2E))
			{
				func_9891(self.var_2C29,self.var_2C2A);
			}
		}
		else if(!func_9891(self.var_2C29,self.var_2C2A))
		{
			func_9891(self.var_2C2D,self.var_2C2E);
		}

		if(isdefined(self.var_2513))
		{
			wait(function_0063(self.var_2513));
			continue;
		}

		wait(0.1);
	}
}

//Function Number: 31
func_7F4D(param_00,param_01)
{
	self.var_2C5 = 1;
	self.var_2C29 = param_00;
	self.var_2C2D = param_01;
	var_02 = 1;
	if(animhasnotetrack(param_00,"code_move"))
	{
		var_02 = getnotetracktimes(param_00,"code_move")[0];
	}

	self.var_2C2A = getmovedelta(param_00,0,var_02);
	var_02 = 1;
	if(animhasnotetrack(param_01,"code_move"))
	{
		var_02 = getnotetracktimes(param_01,"code_move")[0];
	}

	self.var_2C2E = getmovedelta(param_01,0,var_02);
	self.interval = 80;
}

//Function Number: 32
func_1EE8()
{
	self.var_2C5 = 0;
	self.var_2C29 = undefined;
	self.var_2C2D = undefined;
	self.var_2C2A = undefined;
	self.var_2C2E = undefined;
}

//Function Number: 33
func_5B7D()
{
	self endon("killanimscript");
	for(;;)
	{
		if(isdefined(self.enemy) && isai(self.enemy) || isdefined(self.var_5B8A))
		{
			if(abs(self method_8190()) <= 135)
			{
				animscripts\melee::func_5B78();
			}
		}

		wait(0.1);
	}
}

//Function Number: 34
func_18B2()
{
	self endon("killanimscript");
	if(isdefined(self.var_2AF6))
	{
		return;
	}

	for(;;)
	{
		self waittill("bulletwhizby",var_00);
		if(self.movemode != "run" || !self.var_178 || self.var_7.var_6E57 != "stand" || isdefined(self.var_7178))
		{
			continue;
		}

		if(self.var_3F2 != "none")
		{
			continue;
		}

		if(!isdefined(self.enemy) && !self.ignoreall && isdefined(var_00.inliveplayerkillstreak) && isenemyteam(self.inliveplayerkillstreak,var_00.inliveplayerkillstreak))
		{
			self.var_A30D = var_00;
			self method_819A(::animscripts\reactions::func_18B4);
			continue;
		}

		if(self.var_25E || self.var_25D < 100)
		{
			continue;
		}

		if(isdefined(self.var_2FD) && distancesquared(self.var_2E6,self.var_2FD) < 10000)
		{
			wait(0.2);
			continue;
		}

		self.var_7406 = gettime();
		self notify("move_loop_restart");
		animscripts\run::func_315C();
	}
}

//Function Number: 35
func_3E5F(param_00,param_01)
{
	var_02 = param_01.type;
	if(var_02 == "Cover Multi")
	{
		var_02 = animscripts\utility::func_3F3D(param_01);
	}

	if(var_02 == "Cover Left")
	{
		return animscripts\utility::func_5860("shuffle","shuffle_start_from_cover_left");
	}

	if(var_02 == "Cover Right")
	{
		return animscripts\utility::func_5860("shuffle","shuffle_start_from_cover_right");
	}

	if(param_00)
	{
		return animscripts\utility::func_5860("shuffle","shuffle_start_left");
	}

	return animscripts\utility::func_5860("shuffle","shuffle_start_right");
}

//Function Number: 36
func_8299(param_00,param_01,param_02)
{
	var_03 = [];
	var_04 = param_02.type;
	if(var_04 == "Cover Multi")
	{
		var_04 = animscripts\utility::func_3F3D(param_02);
	}

	if(var_04 == "Cover Left")
	{
		var_03["shuffle_start"] = func_3E5F(param_00,param_01);
		var_03["shuffle"] = animscripts\utility::func_5860("shuffle","shuffle_to_cover_left");
		var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_to_cover_left");
	}
	else if(var_04 == "Cover Right")
	{
		var_03["shuffle_start"] = func_3E5F(param_00,param_01);
		var_03["shuffle"] = animscripts\utility::func_5860("shuffle","shuffle_to_cover_right");
		var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_to_cover_right");
	}
	else if(var_04 == "Cover Stand" && param_01.type == var_04)
	{
		if(param_00)
		{
			var_03["shuffle_start"] = animscripts\utility::func_5860("shuffle","shuffle_start_left_stand_to_stand");
			var_03["shuffle"] = animscripts\utility::func_5860("shuffle","shuffle_left_stand_to_stand");
			var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_left_stand_to_stand");
		}
		else
		{
			var_03["shuffle_start"] = animscripts\utility::func_5860("shuffle","shuffle_start_right_stand_to_stand");
			var_03["shuffle"] = animscripts\utility::func_5860("shuffle","shuffle_right_stand_to_stand");
			var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_right_stand_to_stand");
		}
	}
	else if(param_00)
	{
		var_03["shuffle_start"] = func_3E5F(param_00,param_01);
		var_03["shuffle"] = animscripts\utility::func_5860("shuffle","shuffle_to_left_crouch");
		if(var_04 == "Cover Stand")
		{
			var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_to_left_stand");
		}
		else
		{
			var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_to_left_crouch");
		}
	}
	else
	{
		var_03["shuffle_start"] = func_3E5F(param_00,param_01);
		var_03["shuffle"] = animscripts\utility::func_5860("shuffle","shuffle_to_right_crouch");
		if(var_04 == "Cover Stand")
		{
			var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_to_right_stand");
		}
		else
		{
			var_03["shuffle_end"] = animscripts\utility::func_5860("shuffle","shuffle_end_to_right_crouch");
		}
	}

	self.var_7.var_CD8 = var_03;
}

//Function Number: 37
func_5F47(param_00,param_01)
{
	if(self.var_7.var_6E57 == "stand" && param_01.type != "Cover Stand" || param_00.type != "Cover Stand")
	{
		self.var_7.var_6E57 = "crouch";
		return 0;
	}

	return 1;
}

//Function Number: 38
func_5F46(param_00)
{
	if(self.var_7.var_6E57 == "crouch" && param_00.type == "Cover Stand")
	{
		self.var_7.var_6E57 = "stand";
		return 0;
	}

	return 1;
}

//Function Number: 39
func_5F45()
{
	self endon("killanimscript");
	self endon("goal_changed");
	var_00 = self.var_8543;
	self.var_8541 = undefined;
	self.var_8543 = undefined;
	self.var_8542 = 1;
	if(!isdefined(self.var_339))
	{
		return;
	}

	if(!isdefined(self.node) || !isdefined(var_00) || self.node != var_00)
	{
		return;
	}

	var_01 = self.var_339;
	var_02 = self.node;
	var_03 = var_02.var_2E6 - self.var_2E6;
	if(lengthsquared(var_03) < 1)
	{
		return;
	}

	var_03 = vectornormalize(var_03);
	var_04 = anglestoforward(var_02.var_41);
	var_05 = var_04[0] * var_03[1] - var_04[1] * var_03[0] > 0;
	if(func_5F4A(var_05,var_01,var_02))
	{
		return;
	}

	if(func_5F47(var_01,var_02))
	{
		var_06 = 0.1;
	}
	else
	{
		var_06 = 0.4;
	}

	func_8299(var_05,var_01,var_02);
	self method_818E("zonly_physics",0);
	self method_8142(%body,var_06);
	var_07 = animscripts\utility::func_C4E("shuffle_start");
	var_08 = animscripts\utility::func_C4E("shuffle");
	var_09 = animscripts\utility::func_C4E("shuffle_end");
	if(animhasnotetrack(var_07,"finish"))
	{
		var_0A = getnotetracktimes(var_07,"finish")[0];
	}
	else
	{
		var_0A = 1;
	}

	var_0B = length(getmovedelta(var_07,0,var_0A));
	var_0C = length(getmovedelta(var_08,0,1));
	var_0D = length(getmovedelta(var_09,0,1));
	var_0E = distance(self.var_2E6,var_02.var_2E6);
	if(var_0E > var_0B)
	{
		self method_818F("face angle",animscripts\utility::func_4049(var_01));
		self method_8113("shuffle_start",var_07,1,var_06);
		animscripts\shared::func_2D05("shuffle_start");
		self method_8142(var_07,0.2);
		var_0E = var_0E - var_0B;
		var_06 = 0.2;
	}
	else
	{
		self method_818F("face angle",var_02.var_41[1]);
	}

	var_0F = 0;
	if(var_0E > var_0D)
	{
		var_0F = 1;
		var_0E = var_0E - var_0D;
	}

	var_10 = function_0063(var_08);
	var_11 = var_10 * var_0E / var_0C * 0.9;
	var_11 = floor(var_11 * 20) * 0.05;
	self method_8111("shuffle",var_08,1,var_06);
	animscripts\notetracks::func_2D0A(var_11,"shuffle");
	for(var_12 = 0;var_12 < 2;var_12++)
	{
		var_0E = distance(self.var_2E6,var_02.var_2E6);
		if(var_0F)
		{
			var_0E = var_0E - var_0D;
		}

		if(var_0E < 4)
		{
			break;
		}

		var_11 = var_10 * var_0E / var_0C * 0.9;
		var_11 = floor(var_11 * 20) * 0.05;
		if(var_11 < 0.05)
		{
			break;
		}

		animscripts\notetracks::func_2D0A(var_11,"shuffle");
	}

	if(var_0F)
	{
		if(func_5F46(var_02))
		{
			var_06 = 0.2;
		}
		else
		{
			var_06 = 0.4;
		}

		self method_8142(var_08,var_06);
		self method_8111("shuffle_end",var_09,1,var_06);
		animscripts\shared::func_2D05("shuffle_end");
	}

	self method_81C7(var_02.var_2E6);
	self method_818E("normal");
	self.var_8542 = undefined;
}

//Function Number: 40
func_5F48()
{
	if(isdefined(self.var_8542))
	{
		self method_8142(%cover_shuffle,0.2);
		self.var_8542 = undefined;
		self method_818E("none",0);
		self method_818F("face default");
		return;
	}

	wait(0.2);
	self method_8142(%cover_shuffle,0.2);
}

//Function Number: 41
func_5F4A(param_00,param_01,param_02)
{
	var_03 = undefined;
	if(param_01.type == "Cover Right" && param_02.type == "Cover Left" && !param_00)
	{
		var_03 = %corner_standr_door_r2l;
	}
	else if(param_01.type == "Cover Left" && param_02.type == "Cover Right" && param_00)
	{
		var_03 = %corner_standl_door_l2r;
	}

	if(!isdefined(var_03))
	{
		return 0;
	}

	self method_818E("zonly_physics",0);
	self method_818F("face current");
	self method_8113("sideToSide",var_03,1,0.2);
	animscripts\shared::func_2D05("sideToSide",::func_467B);
	var_04 = self method_814F(var_03);
	var_05 = param_02.var_2E6 - param_01.var_2E6;
	var_05 = vectornormalize((var_05[0],var_05[1],0));
	var_06 = getmovedelta(var_03,var_04,1);
	var_07 = param_02.var_2E6 - self.var_2E6;
	var_07 = (var_07[0],var_07[1],0);
	var_08 = vectordot(var_07,var_05) - abs(var_06[1]);
	if(var_08 > 2)
	{
		var_09 = getnotetracktimes(var_03,"slide_end")[0];
		var_0A = var_09 - var_04 * function_0063(var_03);
		var_0B = int(ceil(var_0A / 0.05));
		var_0C = var_05 * var_08 / var_0B;
		thread func_861F(var_0C,var_0B);
	}

	animscripts\shared::func_2D05("sideToSide");
	self method_81C7(param_02.var_2E6);
	self method_818E("none");
	self method_818F("face default");
	self.var_8542 = undefined;
	wait(0.2);
	return 1;
}

//Function Number: 42
func_467B(param_00)
{
	if(param_00 == "slide_start")
	{
		return 1;
	}
}

//Function Number: 43
func_861F(param_00,param_01)
{
	self endon("killanimscript");
	self endon("goal_changed");
	while(param_01 > 0)
	{
		self method_81C7(self.var_2E6 + param_00);
		param_01--;
		wait(0.05);
	}
}

//Function Number: 44
func_5F79(param_00,param_01)
{
	self endon("movemode");
	self method_8142(%combatrun,0.6);
	self method_8147(%combatrun,%body,1,0.5,self.var_5F62);
	if(isdefined(self.var_7406) && gettime() - self.var_7406 < 100 && isdefined(self.var_76AE) && randomfloat(1) < self.var_7.var_71CD)
	{
		animscripts\run::func_2567();
		return;
	}

	var_02 = undefined;
	if(isdefined(self.var_76AD))
	{
		if(animscripts\run::func_5F03())
		{
			return;
		}

		self method_8142(%stair_transitions,0.1);
		if(self.var_3F2 == "up")
		{
			var_02 = animscripts\utility::func_402B("stairs_up");
		}
		else if(self.var_3F2 == "down")
		{
			var_02 = animscripts\utility::func_402B("stairs_down");
		}
	}

	if(!isdefined(var_02))
	{
		if(isarray(param_00))
		{
			if(isdefined(self.var_76AB))
			{
				var_02 = common_scripts\utility::choose_from_weighted_array(param_00,param_01);
			}
			else
			{
				var_02 = param_00[randomint(param_00.size)];
			}
		}
		else
		{
			var_02 = param_00;
		}
	}

	self method_8152("moveanim",var_02,1,0.2,self.var_5F62);
	animscripts\shared::func_2D05("moveanim");
}

//Function Number: 45
func_57A0()
{
	thread animscripts\cover_arrival::func_82F6(1);
}