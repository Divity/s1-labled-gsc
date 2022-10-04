/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_arrival.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 35
 * Decompile Time: 1302 ms
 * Timestamp: 4/20/2022 8:20:18 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	self endon("abort_approach");
	if(self.var_425)
	{
		animscripts\swim::func_902F();
		return;
	}

	if(isdefined(self.var_2551))
	{
		[[ self.var_2551 ]]();
		return;
	}

	var_00 = self.var_CBB;
	var_01 = animscripts\utility::func_5860("cover_trans",self.var_CBC)[var_00];
	if(!isdefined(self.var_4792))
	{
		thread func_06BE();
	}

	self method_8142(%body,0.2);
	self method_8113("coverArrival",var_01,1,0.2,self.var_5F94);
	animscripts\face::func_6D98(var_01,"run");
	animscripts\shared::func_2D05("coverArrival",::func_467C);
	var_02 = level.var_D24[self.var_CBC];
	if(isdefined(var_02))
	{
		self.var_7.var_6E57 = var_02;
	}

	self.var_7.var_5F58 = "stop";
	self.var_7.var_D29 = self.var_CBC;
	self method_8142(%animscript_root,0.2);
	self.var_5572 = undefined;
}

//Function Number: 2
func_467C(param_00)
{
	if(param_00 == "start_aim")
	{
		if(self.var_7.var_6E57 == "stand")
		{
			animscripts\animset::func_7DCC();
		}
		else if(self.var_7.var_6E57 == "crouch")
		{
			animscripts\animset::func_7DBF();
		}
		else
		{
		}

		animscripts\combat::func_7DB0();
		self.var_6F64 = 0;
		animscripts\combat_utility::func_82F2(0.2);
		thread animscripts\track::func_950B();
	}
}

//Function Number: 3
func_51D1()
{
	if(!isdefined(self.node))
	{
		return 0;
	}

	if(isdefined(self.enemy) && self method_81BF(self.enemy,1.5) && distancesquared(self.var_2E6,self.enemy.var_2E6) < 250000)
	{
		return !self method_81F1();
	}

	return 0;
}

//Function Number: 4
func_06BE()
{
	self endon("killanimscript");
	for(;;)
	{
		if(!isdefined(self.node))
		{
			return;
		}

		if(func_51D1())
		{
			self method_8142(%animscript_root,0.3);
			self notify("abort_approach");
			self.var_5572 = gettime();
			return;
		}

		wait(0.1);
	}
}

//Function Number: 5
func_1AFC(param_00)
{
	if(!animscripts\utility::func_9C26())
	{
		return 0;
	}

	if(!isdefined(param_00.var_99AB))
	{
		return 0;
	}

	if(param_00.type != "Cover Stand" && param_00.type != "Cover Prone" && param_00.type != "Cover Crouch")
	{
		return 0;
	}

	if(isdefined(self.enemy) && distancesquared(self.enemy.var_2E6,param_00.var_2E6) < 65536)
	{
		return 0;
	}

	if(animscripts\utility::func_404E() > 40 || animscripts\utility::func_404E() < -40)
	{
		return 0;
	}

	return 1;
}

//Function Number: 6
func_29A8(param_00)
{
	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		return "exposed";
	}

	var_01 = param_00.type;
	if(animscripts\utility::func_5029() && var_01 == "Cover Crouch")
	{
		return "free_run_into_cover_crouch";
	}

	if(var_01 == "Cover Multi")
	{
		if(!isdefined(self.var_DA))
		{
			self.var_DA = spawnstruct();
		}

		var_02 = animscripts\cover_multi::func_22B1(["over",["left","right"]]);
		self.var_DA.var_D25 = var_02;
		var_03 = animscripts\cover_multi::func_22B4(param_00,var_02);
		var_01 = animscripts\utility::func_3F3D(param_00,var_03);
	}

	if(func_1AFC(param_00))
	{
		if(var_01 == "Cover Stand")
		{
			return "stand_saw";
		}

		if(var_01 == "Cover Crouch")
		{
			return "crouch_saw";
		}
		else if(var_01 == "Cover Prone")
		{
			return "prone_saw";
		}
	}

	if(!isdefined(level.var_CB6[var_01]))
	{
		return;
	}

	if(isdefined(param_00.var_D27))
	{
		var_04 = param_00.var_D27;
	}
	else
	{
		var_04 = var_01 gethighestnodestance();
	}

	if(var_04 == "prone")
	{
		var_04 = "crouch";
	}

	var_05 = level.var_CB6[var_01][var_04];
	if(func_9C09() && var_05 == "exposed")
	{
		var_05 = "exposed_ready";
	}

	if(animscripts\utility::func_51DB())
	{
		if(var_05 == "exposed")
		{
			var_05 = "exposed_unstable";
			if(self.movemode == "run")
			{
				var_05 = var_05 + "_run";
			}

			return var_05;
		}
		else if(var_05 == "stand")
		{
			var_05 = "stand_unstable";
			if(self.movemode == "run")
			{
				var_05 = var_05 + "_run";
			}

			return var_05;
		}
	}

	if(animscripts\utility::func_8485())
	{
		var_06 = var_05 + "_cqb";
		if(isdefined(level.var_CCA["soldier"]["cover_trans"][var_06]))
		{
			var_05 = var_06;
		}
	}

	return var_05;
}

//Function Number: 7
func_29A6(param_00)
{
	if(isdefined(self.var_4792))
	{
		return "heat";
	}

	if(isdefined(param_00.var_D27))
	{
		var_01 = param_00.var_D27;
	}
	else
	{
		var_01 = var_01 gethighestnodestance();
	}

	if(var_01 == "prone")
	{
		var_01 = "crouch";
	}

	if(var_01 == "crouch")
	{
		var_02 = "exposed_crouch";
	}
	else
	{
		var_02 = "exposed";
	}

	if(var_02 == "exposed" && func_9C09())
	{
		var_02 = var_02 + "_ready";
	}

	if(var_02 == "exposed" && animscripts\utility::func_51DB())
	{
		var_02 = "exposed_unstable";
		if(self.movemode == "run")
		{
			var_02 = var_02 + "_run";
		}

		return var_02;
	}

	if(animscripts\utility::func_8485())
	{
		return var_02 + "_cqb";
	}

	return var_02;
}

//Function Number: 8
func_19E4(param_00,param_01)
{
	var_02 = anglestoright(param_00);
	var_03 = anglestoforward(param_00);
	return var_03 * param_01[0] + var_02 * 0 - param_01[1];
}

//Function Number: 9
func_3EFE()
{
	if(isdefined(self.var_3AA))
	{
		return self.var_3AA;
	}

	if(isdefined(self.node))
	{
		return self.node;
	}

	return undefined;
}

//Function Number: 10
func_3EFF(param_00,param_01)
{
	if(param_01 == "stand_saw")
	{
		var_02 = (param_00.var_99AB.var_2E6[0],param_00.var_99AB.var_2E6[1],param_00.var_2E6[2]);
		var_03 = anglestoforward((0,param_00.var_99AB.var_41[1],0));
		var_04 = anglestoright((0,param_00.var_99AB.var_41[1],0));
		var_02 = var_02 + var_03 * -32.545 - var_04 * 6.899;
	}
	else if(var_02 == "crouch_saw")
	{
		var_02 = (param_01.var_99AB.var_2E6[0],param_01.var_99AB.var_2E6[1],param_01.var_2E6[2]);
		var_03 = anglestoforward((0,param_00.var_99AB.var_41[1],0));
		var_04 = anglestoright((0,param_00.var_99AB.var_41[1],0));
		var_02 = var_02 + var_03 * -32.545 - var_04 * 6.899;
	}
	else if(var_02 == "prone_saw")
	{
		var_02 = (param_01.var_99AB.var_2E6[0],param_01.var_99AB.var_2E6[1],param_01.var_2E6[2]);
		var_03 = anglestoforward((0,param_00.var_99AB.var_41[1],0));
		var_04 = anglestoright((0,param_00.var_99AB.var_41[1],0));
		var_02 = var_02 + var_03 * -37.36 - var_04 * 13.279;
	}
	else if(isdefined(self.var_3AA))
	{
		var_02 = self.var_1C6;
	}
	else
	{
		var_02 = param_01.var_2E6;
	}

	return var_02;
}

//Function Number: 11
func_1CF3()
{
	if(isdefined(self getnegotiationstartnode()))
	{
		return 0;
	}

	if(isdefined(self.var_2AF2) && self.var_2AF2)
	{
		return 0;
	}

	return 1;
}

//Function Number: 12
func_1CF2(param_00,param_01,param_02)
{
	if(isdefined(level.var_3592[param_00]))
	{
		return 0;
	}

	if(param_00 == "stand" || param_00 == "crouch" || param_00 == "stand_unstable")
	{
		if(animscripts\utility::func_6C4(vectortoyaw(param_01) - param_02.var_41[1] + 180) < 60)
		{
			return 0;
		}
	}

	if(func_51D1() || isdefined(self.var_5572) && self.var_5572 + 500 > gettime())
	{
		return 0;
	}

	return 1;
}

//Function Number: 13
func_82F6(param_00)
{
	self endon("killanimscript");
	if(isdefined(self.var_4792))
	{
		thread func_2CEA();
		return;
	}

	if(param_00)
	{
		self.var_36C = 1;
	}

	if(self.var_425 == 1)
	{
		thread animscripts\swim::func_905E();
		return;
	}

	self.var_7.var_D29 = undefined;
	thread func_2CEA();
	self waittill("cover_approach",var_01);
	if(!func_1CF3())
	{
		return;
	}

	thread func_82F6(0);
	var_02 = "exposed";
	var_03 = self.var_2FD;
	var_04 = vectortoyaw(var_01);
	var_05 = var_04;
	var_06 = func_3EFE();
	if(isdefined(var_06))
	{
		var_02 = func_29A8(var_06);
		if(isdefined(var_02) && var_02 != "exposed")
		{
			var_03 = func_3EFF(var_06,var_02);
			var_04 = var_06.var_41[1];
			var_05 = animscripts\utility::func_4049(var_06);
		}
	}
	else if(func_9C09())
	{
		if(animscripts\utility::func_8485())
		{
			var_02 = "exposed_ready_cqb";
		}
		else
		{
			var_02 = "exposed_ready";
		}
	}

	if(!func_1CF2(var_02,var_01,var_06))
	{
		return;
	}

	func_8D00(var_02,var_03,var_04,var_05,var_01);
}

//Function Number: 14
func_229C(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(self.var_2AF2) && self.var_2AF2)
	{
		return 0;
	}

	if(abs(self method_8190()) > 45 && isdefined(self.enemy) && vectordot(anglestoforward(self.var_41),vectornormalize(self.enemy.var_2E6 - self.var_2E6)) > 0.8)
	{
		return 0;
	}

	if(self.var_7.var_6E57 != "stand" || self.var_7.var_5F58 != "run" && !animscripts\utility::func_50E7())
	{
		return 0;
	}

	if(animscripts\utility::func_6C4(param_04 - self.var_41[1]) > 30)
	{
		if(isdefined(self.enemy) && self method_81BE(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) < 65536)
		{
			if(vectordot(anglestoforward(self.var_41),self.enemy.var_2E6 - self.var_2E6) > 0)
			{
				return 0;
			}
		}
	}

	if(!func_1CF9(param_00,param_01,param_02,param_03,0))
	{
		return 0;
	}

	return 1;
}

//Function Number: 15
func_0CBE(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return;
	}

	for(;;)
	{
		if(!isdefined(self.var_2FD))
		{
			func_A01D();
		}

		var_02 = distance(self.var_2E6,self.var_2FD);
		if(var_02 <= param_01 + 8)
		{
			break;
		}

		var_03 = var_02 - param_01 / 250 - 0.1;
		if(var_03 < 0.05)
		{
			var_03 = 0.05;
		}

		wait(var_03);
	}
}

//Function Number: 16
func_8D00(param_00,param_01,param_02,param_03,param_04)
{
	self endon("killanimscript");
	self endon("cover_approach");
	var_05 = func_3EFE();
	var_06 = animscripts\exit_node::func_4018(var_05);
	var_07 = var_06.var_5A2C;
	var_08 = var_06.var_33E6;
	var_09 = vectordot(param_04,anglestoforward(var_05.var_41)) >= 0;
	var_06 = func_1CF4(param_01,param_03,param_00,param_04,var_07,var_08,var_09);
	if(var_06.var_CBB < 0)
	{
		return;
	}

	var_0A = var_06.var_CBB;
	if(var_0A <= 6 && var_09)
	{
		self endon("goal_changed");
		if(isdefined(self.var_C4D) && isdefined(level.var_CCA[self.var_C4D]) && isdefined(level.var_CCA[self.var_C4D]["CoverTransLongestDist"][param_00]))
		{
			self.var_D28 = level.var_CCA[self.var_C4D]["CoverTransLongestDist"][param_00];
		}
		else if(isdefined(level.var_CCA["soldier"]["CoverTransLongestDist"][param_00]))
		{
			self.var_D28 = level.var_CCA["soldier"]["CoverTransLongestDist"][param_00];
		}
		else
		{
			self.var_D28 = 8;
		}

		func_0CBE(var_05,self.var_D28);
		var_0B = vectornormalize(param_01 - self.var_2E6);
		var_06 = func_1CF4(param_01,param_03,param_00,var_0B,var_07,var_08,var_09);
		self.var_D28 = length(animscripts\utility::func_5865("cover_trans_dist",param_00,var_0A));
		func_0CBE(var_05,self.var_D28);
		if(!self method_81C3(param_01))
		{
			self.var_D28 = undefined;
			return;
		}

		if(var_06.var_CBB < 0)
		{
			self.var_D28 = undefined;
			return;
		}

		var_0A = var_06.var_CBB;
		var_0C = param_03 - animscripts\utility::func_5865("cover_trans_angles",param_00,var_0A);
	}
	else
	{
		self method_8160(self.var_22A2);
		self waittill("runto_arrived");
		var_0C = param_04 - animscripts\utility::func_5865("cover_trans_angles",param_01,var_0C);
		if(!func_229C(param_01,param_03,param_00,var_0A,var_0C))
		{
			return;
		}
	}

	self.var_CBB = var_0A;
	self.var_CBC = param_00;
	self.var_D28 = undefined;
	self method_81E4(self.var_22A2,var_0C,0);
}

//Function Number: 17
func_1CF4(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = spawnstruct();
	animscripts\exit_node::func_19E5(var_07,param_02,1,param_01,param_03,param_04,param_05);
	animscripts\exit_node::func_8891(var_07,param_04);
	var_08 = spawnstruct();
	var_09 = (0,0,0);
	var_08.var_CBB = -1;
	var_0A = 2;
	for(var_0B = 1;var_0B <= var_0A;var_0B++)
	{
		var_08.var_CBB = var_07.var_9705[var_0B];
		if(!func_1CF9(param_00,param_01,param_02,var_08.var_CBB,param_06))
		{
			continue;
		}

		break;
	}

	if(var_0B > var_0A)
	{
		var_08.var_CBB = -1;
		return var_08;
	}

	var_0C = distancesquared(param_00,self.var_2E6);
	var_0D = distancesquared(param_00,self.var_22A2);
	if(var_0C < var_0D * 2 * 2)
	{
		if(var_0C < var_0D)
		{
			var_08.var_CBB = -1;
			return var_08;
		}

		if(!param_06)
		{
			var_0E = vectornormalize(self.var_22A2 - self.var_2E6);
			var_0F = param_01 - animscripts\utility::func_5865("cover_trans_angles",param_02,var_08.var_CBB);
			var_10 = anglestoforward((0,var_0F,0));
			var_11 = vectordot(var_0E,var_10);
			if(var_11 < 0.707)
			{
				var_08.var_CBB = -1;
				return var_08;
			}
		}
	}

	return var_08;
}

//Function Number: 18
func_2CEA()
{
	self endon("killanimscript");
	self endon("move_interrupt");
	self notify("doing_last_minute_exposed_approach");
	self endon("doing_last_minute_exposed_approach");
	thread func_A224();
	for(;;)
	{
		func_2CE9();
		for(;;)
		{
			common_scripts\utility::waittill_any("goal_changed","goal_changed_previous_frame");
			if(isdefined(self.var_22A2) && isdefined(self.var_2FD) && distance2d(self.var_22A2,self.var_2FD) < 1)
			{
				continue;
			}

			break;
		}
	}
}

//Function Number: 19
func_A224()
{
	self endon("killanimscript");
	self endon("doing_last_minute_exposed_approach");
	for(;;)
	{
		self waittill("goal_changed");
		wait(0.05);
		self notify("goal_changed_previous_frame");
	}
}

//Function Number: 20
func_3587(param_00,param_01)
{
	if(!isdefined(self.var_2FD))
	{
		return 0;
	}

	if(isdefined(self.var_2AF2) && self.var_2AF2)
	{
		return 0;
	}

	if(isdefined(self.var_CB7))
	{
		if(!self [[ self.var_CB7 ]](param_00))
		{
			return 0;
		}
	}
	else
	{
		if(!self.var_178 && !isdefined(param_00) || param_00.type == "Path" || param_00.type == "Path 3D")
		{
			return 0;
		}

		if(self.var_7.var_6E57 != "stand")
		{
			return 0;
		}
	}

	if(func_51D1() || isdefined(self.var_5572) && self.var_5572 + 500 > gettime())
	{
		return 0;
	}

	if(!self method_81C3(self.var_2FD))
	{
		return 0;
	}

	return 1;
}

//Function Number: 21
func_3588()
{
	for(;;)
	{
		if(!isdefined(self.var_2FD))
		{
			func_A01D();
		}

		var_00 = func_3EFE();
		if(isdefined(var_00) && !isdefined(self.var_4792))
		{
			var_01 = var_00.var_2E6;
		}
		else
		{
			var_01 = self.var_2FD;
		}

		var_02 = distance(self.var_2E6,var_01);
		var_03 = 0;
		if(isdefined(self.var_C4D) && isdefined(level.var_CCA[self.var_C4D]) && isdefined(level.var_CCA[self.var_C4D]["longestExposedApproachDist"]))
		{
			var_03 = level.var_CCA[self.var_C4D]["longestExposedApproachDist"];
		}
		else
		{
			var_03 = level.var_CCA["soldier"]["longestExposedApproachDist"];
		}

		if(var_02 <= var_03 + 8)
		{
			break;
		}

		var_04 = var_02 - var_03 / 250 - 0.1;
		if(var_04 < 0)
		{
			break;
		}

		if(var_04 < 0.05)
		{
			var_04 = 0.05;
		}

		wait(var_04);
	}
}

//Function Number: 22
func_35B6(param_00)
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(isdefined(self.var_4792) && isdefined(param_00))
	{
		return 0;
	}

	if(self.var_C8 == "cover" && issentient(self.enemy) && gettime() - self sentient_lastknowntime(self.enemy) > 15000)
	{
		return 0;
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		return self method_81BE(self.enemy);
	}

	return sighttracepassed(self.enemy method_8097(),self.var_2FD + (0,0,60),0,undefined);
}

//Function Number: 23
func_2CE9()
{
	self endon("goal_changed");
	self endon("move_interrupt");
	if(isdefined(self getnegotiationstartnode()))
	{
		return;
	}

	func_3588();
	if(isdefined(self.grenade) && isdefined(self.grenade.var_13) && self.grenade.var_13 == self)
	{
		return;
	}

	var_00 = "exposed";
	var_01 = 1;
	if(isdefined(self.var_CBD))
	{
		var_00 = self [[ self.var_CBD ]]();
	}
	else if(animscripts\utility::func_51DB())
	{
		var_00 = "exposed_unstable";
		if(self.movemode == "run")
		{
			var_00 = var_00 + "_run";
		}
	}
	else if(func_9C09())
	{
		if(animscripts\utility::func_8485())
		{
			var_00 = "exposed_ready_cqb";
		}
		else
		{
			var_00 = "exposed_ready";
		}
	}
	else if(animscripts\utility::func_8485())
	{
		var_00 = "exposed_cqb";
	}
	else if(isdefined(self.var_4792))
	{
		var_00 = "heat";
		var_01 = 4096;
	}
	else if(animscripts\utility::func_9C33())
	{
		var_00 = "exposed_smg";
	}

	var_02 = func_3EFE();
	if(isdefined(var_02) && isdefined(self.var_2FD) && !isdefined(self.var_2AFB))
	{
		var_03 = distancesquared(self.var_2FD,var_02.var_2E6) < var_01;
	}
	else
	{
		var_03 = 0;
	}

	if(var_03)
	{
		var_00 = func_29A6(var_02);
	}

	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		var_00 = "exposed";
	}

	var_04 = vectornormalize(self.var_2FD - self.var_2E6);
	var_05 = vectortoyaw(var_04);
	if(isdefined(self.var_35B5))
	{
		var_05 = self.var_41[1];
	}
	else if(func_35B6(var_02))
	{
		var_05 = vectortoyaw(self.enemy.var_2E6 - self.var_2FD);
	}
	else
	{
		var_06 = isdefined(var_02) && var_03;
		var_06 = var_06 && var_02.type != "Path" && var_02.type != "Path 3D" && var_02.type != "Ambush" || !animscripts\utility::func_725F();
		if(var_06)
		{
			var_05 = animscripts\utility::func_4049(var_02);
		}
		else
		{
			var_07 = self method_8192();
			if(isdefined(var_07))
			{
				var_05 = var_07[1];
			}
		}
	}

	var_08 = spawnstruct();
	animscripts\exit_node::func_19E5(var_08,var_00,1,var_05,var_04,9,-1);
	var_09 = 1;
	for(var_0A = 2;var_0A <= 9;var_0A++)
	{
		if(var_08.var_9712[var_0A] > var_08.var_9712[var_09])
		{
			var_09 = var_0A;
		}
	}

	self.var_CBB = var_08.var_9705[var_09];
	self.var_CBC = var_00;
	var_0B = animscripts\utility::func_5865("cover_trans",var_00,self.var_CBB);
	if(!isdefined(var_0B) || isdefined(self.var_2AF1))
	{
		return;
	}

	var_0C = length(animscripts\utility::func_5865("cover_trans_dist",var_00,self.var_CBB));
	var_0D = var_0C + 8;
	var_0D = var_0D * var_0D;
	while(isdefined(self.var_2FD) && isdefined(var_0D) && distancesquared(self.var_2E6,self.var_2FD) > var_0D)
	{
		wait(0.05);
	}

	if(isdefined(self.var_D28) && self.var_D28 < var_0C + 8)
	{
		return;
	}

	if(!func_3587(var_02,var_03))
	{
		return;
	}

	var_0E = distance(self.var_2E6,self.var_2FD);
	if(abs(var_0E - var_0C) > 8)
	{
		return;
	}

	var_0F = vectortoyaw(self.var_2FD - self.var_2E6);
	if(isdefined(self.var_4792) && var_03)
	{
		var_10 = var_05 - animscripts\utility::func_5865("cover_trans_angles",var_00,self.var_CBB);
		var_11 = func_3F04(self.var_2FD,var_05,var_00,self.var_CBB);
	}
	else if(var_0E > 0)
	{
		var_12 = animscripts\utility::func_5865("cover_trans_dist",var_02,self.var_CBB);
		var_13 = atan(var_12[1] / var_12[0]);
		if(!isdefined(self.var_35B5) || self.var_178)
		{
			var_10 = var_0F - var_13;
			if(animscripts\utility::func_6C4(var_10 - self.var_41[1]) > 30)
			{
				return;
			}
		}
		else
		{
			var_10 = self.var_41[1];
		}

		var_14 = var_0E - var_0C;
		var_11 = self.var_2E6 + vectornormalize(self.var_2FD - self.var_2E6) * var_14;
	}
	else
	{
		var_10 = self.var_41[1];
		var_11 = self.var_2E6;
	}

	self method_81E4(var_11,var_10,0);
}

//Function Number: 24
func_A01D()
{
	for(;;)
	{
		if(isdefined(self.var_2FD))
		{
			return;
		}

		wait(0.1);
	}
}

//Function Number: 25
func_2564()
{
	if(!isdefined(self.var_8D29))
	{
		return;
	}

	self method_818E("zonly_physics",0);
	self method_818F("face current");
	self method_8110("move",self.var_8D29,%animscript_root,1);
	animscripts\face::func_6D98(self.var_8D29,"run");
	if(animhasnotetrack(self.var_8D29,"code_move"))
	{
		animscripts\shared::func_2D05("move");
		self method_818F("face motion");
		self method_818E("none",0);
	}

	animscripts\shared::func_2D05("move");
}

//Function Number: 26
func_255F()
{
	if(!isdefined(self.var_8D1A))
	{
		return;
	}

	var_00 = self.var_CBB;
	var_01 = self.var_8D1A;
	if(!isdefined(self.var_4792))
	{
		thread func_06BE();
	}

	self method_8142(%body,0.2);
	self method_8113("coverArrival",var_01,1,0.2,self.var_5F94);
	animscripts\face::func_6D98(var_01,"run");
	animscripts\shared::func_2D05("coverArrival",::func_467C);
	var_02 = level.var_D24[self.var_CBC];
	if(isdefined(var_02))
	{
		self.var_7.var_6E57 = var_02;
	}

	self.var_7.var_5F58 = "stop";
	self.var_7.var_D29 = self.var_CBC;
	self method_8142(%animscript_root,0.3);
	self.var_5572 = undefined;
}

//Function Number: 27
func_8F17(param_00)
{
	if(!isdefined(param_00))
	{
		return "{undefined}";
	}

	return param_00;
}

//Function Number: 28
func_2DEA(param_00,param_01,param_02,param_03)
{
	for(var_04 = 0;var_04 < param_02 * 100;var_04++)
	{
		wait(0.05);
	}
}

//Function Number: 29
func_2DCE(param_00)
{
	self endon("killanimscript");
	for(;;)
	{
		if(!isdefined(self.node))
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 30
func_3F04(param_00,param_01,param_02,param_03)
{
	var_04 = (0,param_01 - animscripts\utility::func_5865("cover_trans_angles",param_02,param_03),0);
	var_05 = anglestoforward(var_04);
	var_06 = anglestoright(var_04);
	var_07 = animscripts\utility::func_5865("cover_trans_dist",param_02,param_03);
	var_08 = var_05 * var_07[0];
	var_09 = var_06 * var_07[1];
	return param_00 - var_08 + var_09;
}

//Function Number: 31
func_3F03(param_00,param_01,param_02,param_03)
{
	var_04 = (0,param_01 - animscripts\utility::func_5865("cover_trans_angles",param_02,param_03),0);
	var_05 = anglestoforward(var_04);
	var_06 = anglestoright(var_04);
	var_07 = animscripts\utility::func_5865("cover_trans_predist",param_02,param_03);
	var_08 = var_05 * var_07[0];
	var_09 = var_06 * var_07[1];
	return param_00 - var_08 + var_09;
}

//Function Number: 32
func_1CF9(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = func_3F04(param_00,param_01,param_02,param_03);
	self.var_22A2 = var_05;
	if(param_03 <= 6 && param_04)
	{
		return 1;
	}

	if(!self method_81C4(var_05,param_00))
	{
		return 0;
	}

	if(param_03 <= 6 || isdefined(level.var_3592[param_02]))
	{
		return 1;
	}

	var_06 = func_3F03(var_05,param_01,param_02,param_03);
	self.var_22A2 = var_06;
	return self method_81C4(var_06,var_05);
}

//Function Number: 33
func_9C09()
{
	if(!isdefined(level.var_71DE))
	{
		return 0;
	}

	if(!level.var_71DE)
	{
		return 0;
	}

	if(!isdefined(self.var_1944))
	{
		return 0;
	}

	if(!self.var_1944)
	{
		return 0;
	}

	return 1;
}

//Function Number: 34
func_267A()
{
	return 0;
}

//Function Number: 35
func_2679(param_00)
{
	if(!func_267A())
	{
	}
}