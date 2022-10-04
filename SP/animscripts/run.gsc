/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: run.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 46
 * Decompile Time: 1817 ms
 * Timestamp: 4/20/2022 8:20:43 PM
*******************************************************************/

//Function Number: 1
func_5F6D()
{
	var_00 = [[ self.var_1D46 ]]("stand");
	switch(var_00)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 2
func_40BB()
{
	if(!isdefined(self.var_7.var_5F40))
	{
		return animscripts\utility::func_5860("run","straight");
	}

	if(!self.var_178)
	{
		if(self.var_3F2 == "none" || abs(self method_8190()) > 45)
		{
			return animscripts\utility::func_402B("move_f");
		}
	}

	if(self.var_3F2 == "up")
	{
		return animscripts\utility::func_402B("stairs_up");
	}
	else if(self.var_3F2 == "down")
	{
		return animscripts\utility::func_402B("stairs_down");
	}
	else if(animscripts\utility::func_9C33())
	{
		return animscripts\utility::func_402B("smg_straight");
	}

	if(animscripts\utility::func_5121() || isdefined(self.var_6162) && self.var_6162 || isdefined(self.var_7.var_135B) && self.var_7.var_135B)
	{
		return animscripts\utility::func_402B("straight");
	}

	var_00 = animscripts\utility::func_402B("straight_twitch");
	if(!isdefined(var_00) || var_00.size == 0)
	{
		return animscripts\utility::func_402B("straight");
	}

	var_01 = animscripts\utility::func_40A4(self.var_7.var_76D1,4);
	if(var_01 == 0)
	{
		var_01 = animscripts\utility::func_40A4(self.var_7.var_76D1,var_00.size);
		return var_00[var_01];
	}

	return animscripts\utility::func_402B("straight");
}

//Function Number: 3
func_3F41()
{
	if(!isdefined(self.var_7.var_5F40))
	{
		if(animscripts\utility::func_9C33())
		{
			return animscripts\utility::func_5860("smg_crouch_run","crouch");
		}
		else
		{
			return animscripts\utility::func_5860("run","crouch");
		}
	}

	return animscripts\utility::func_402B("crouch");
}

//Function Number: 4
func_7020()
{
	self.var_7.var_5F58 = "run";
	self method_8152("runanim",animscripts\utility::func_402B("prone"),1,0.3,self.var_5F62);
	func_76A5();
	animscripts\notetracks::func_2D0A(0.25,"runanim");
}

//Function Number: 5
func_4E02()
{
	if(!isdefined(self.var_76D3))
	{
		self notify("stop_move_anim_update");
		self.var_9AC1 = undefined;
		self method_8142(%combatrun_backward,0.2);
		self method_8142(%combatrun_right,0.2);
		self method_8142(%combatrun_left,0.2);
		self method_8142(%w_aim_2,0.2);
		self method_8142(%w_aim_4,0.2);
		self method_8142(%w_aim_6,0.2);
		self method_8142(%w_aim_8,0.2);
		self.var_76D3 = 1;
	}
}

//Function Number: 6
func_8EFA()
{
	if(isdefined(self.var_76D3))
	{
		self method_8142(%run_n_gun,0.2);
		self.var_76D3 = undefined;
	}

	return 0;
}

//Function Number: 7
func_76D3(param_00)
{
	if(param_00)
	{
		var_01 = func_4096(0.2);
		var_02 = var_01 < 0;
	}
	else
	{
		var_01 = 0;
		var_02 = self.var_76D7 < 0;
	}

	var_03 = 1 - var_02;
	var_04 = self.var_5A4F;
	var_05 = self.var_76D6;
	var_06 = self.var_76D5;
	if(!param_00 || squared(var_01) > var_04 * var_04)
	{
		self method_8142(%add_fire,0);
		if(squared(self.var_76D7) < var_06 * var_06)
		{
			self.var_76D7 = 0;
			self.var_76D3 = undefined;
			return 0;
		}
		else if(self.var_76D7 > 0)
		{
			self.var_76D7 = self.var_76D7 - var_06;
		}
		else
		{
			self.var_76D7 = self.var_76D7 + var_06;
		}
	}
	else
	{
		var_07 = var_01 / var_04;
		var_08 = var_07 - self.var_76D7;
		if(abs(var_08) < var_05 * 0.7)
		{
			self.var_76D7 = var_07;
		}
		else if(var_08 > 0)
		{
			self.var_76D7 = self.var_76D7 + var_06;
		}
		else
		{
			self.var_76D7 = self.var_76D7 - var_06;
		}
	}

	func_4E02();
	var_09 = abs(self.var_76D7);
	var_0A = animscripts\utility::func_5861("run_n_gun");
	if(var_09 > var_05)
	{
		var_0B = var_09 - var_05 / var_05;
		var_0B = clamp(var_0B,0,1);
		self method_8142(var_0A["F"],0.2);
		self method_814C(var_0A["L"],1 - var_0B * var_02,0.2);
		self method_814C(var_0A["R"],1 - var_0B * var_03,0.2);
		self method_814C(var_0A["LB"],var_0B * var_02,0.2);
		self method_814C(var_0A["RB"],var_0B * var_03,0.2);
	}
	else
	{
		var_0B = clamp(var_0A / var_06,0,1);
		self method_814C(var_0A["F"],1 - var_0B,0.2);
		self method_814C(var_0A["L"],var_0B * var_02,0.2);
		self method_814C(var_0A["R"],var_0B * var_03,0.2);
		if(var_05 < 1)
		{
			self method_8142(var_0A["LB"],0.2);
			self method_8142(var_0A["RB"],0.2);
		}
	}

	self method_8152("runanim",%run_n_gun,1,0.3,0.8);
	func_76B0(undefined);
	self.var_7.var_AA5 = gettime() + 500;
	if(param_00 && isplayer(self.enemy))
	{
		self method_81EA();
	}

	return 1;
}

//Function Number: 8
func_76D4()
{
	func_4E02();
	var_00 = animscripts\utility::func_5860("run_n_gun","move_back");
	self method_8152("runanim",var_00,1,0.3,0.8);
	func_76B0(var_00);
	if(isplayer(self.enemy))
	{
		self method_81EA();
	}

	animscripts\notetracks::func_2D0A(0.2,"runanim");
	self method_8142(var_00,0.2);
}

//Function Number: 9
func_71CE()
{
	self endon("killanimscript");
	for(;;)
	{
		wait(0.2);
		if(!isdefined(self.var_7178))
		{
			break;
		}

		if(!isdefined(self.var_2FD) || distancesquared(self.var_2FD,self.var_2E6) < squared(80))
		{
			func_31C0();
			self notify("interrupt_react_to_bullet");
			break;
		}
	}
}

//Function Number: 10
func_31C0()
{
	self method_818F("face default");
	self.var_7178 = undefined;
	self.var_7406 = undefined;
}

//Function Number: 11
func_76E0()
{
	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		return;
	}

	func_315C();
	self endon("interrupt_react_to_bullet");
	self.var_7178 = 1;
	self method_818F("face motion");
	var_00 = animscripts\utility::func_5861("running_react_to_bullets");
	var_01 = randomint(var_00.size);
	if(var_01 == level.var_55D2)
	{
		var_01 = var_01 + 1 % var_00.size;
	}

	anim.var_55D2 = var_01;
	var_02 = var_00[var_01];
	self method_810D("reactanim",var_02,1,0.5,self.var_5F62);
	func_76B0(var_02);
	thread func_71CE();
	animscripts\shared::func_2D05("reactanim");
	func_31C0();
}

//Function Number: 12
func_2567()
{
	func_315C();
	self.var_7178 = 1;
	self method_818F("face motion");
	var_00 = randomint(self.var_76AE.size);
	var_01 = self.var_76AE[var_00];
	self method_810D("reactanim",var_01,1,0.5,self.var_5F62);
	func_76B0(var_01);
	thread func_71CE();
	animscripts\shared::func_2D05("reactanim");
	func_31C0();
}

//Function Number: 13
func_40E1()
{
	var_00 = undefined;
	if(isdefined(self.grenade))
	{
		var_00 = animscripts\utility::func_402B("sprint_short");
	}

	if(!isdefined(var_00))
	{
		var_00 = animscripts\utility::func_402B("sprint");
	}

	return var_00;
}

//Function Number: 14
func_84AB()
{
	if(isdefined(self.var_8AA2))
	{
		return 1;
	}

	if(isdefined(self.grenade) && isdefined(self.enemy) && self.var_1AC == 1)
	{
		return distancesquared(self.var_2E6,self.enemy.var_2E6) > 90000;
	}

	return 0;
}

//Function Number: 15
func_84AC()
{
	if(isdefined(self.var_6094))
	{
		return 0;
	}

	if(!self.var_178 || self.var_3F2 != "none")
	{
		return 0;
	}

	var_00 = gettime();
	if(isdefined(self.var_25F0))
	{
		if(var_00 < self.var_25F0)
		{
			return 1;
		}

		if(var_00 - self.var_25F0 < 6000)
		{
			return 0;
		}
	}

	if(!isdefined(self.enemy) || !issentient(self.enemy))
	{
		return 0;
	}

	if(randomint(100) < 25 && self sentient_lastknowntime(self.enemy) + 2000 > var_00)
	{
		self.var_25F0 = var_00 + 2000 + randomint(1000);
		return 1;
	}

	return 0;
}

//Function Number: 16
func_402C()
{
	var_00 = self.var_5F62;
	if(self.var_25E && self.var_3F2 == "none" && self.var_25D < 300)
	{
		var_00 = var_00 * 0.75;
	}

	return var_00;
}

//Function Number: 17
func_8B0C()
{
	var_00 = func_402C();
	self method_8143(%combatrun,1,0.5,var_00);
	var_01 = 0;
	var_02 = isdefined(self.var_7406) && gettime() - self.var_7406 < 100;
	if(var_02 && randomfloat(1) < self.var_7.var_71CD)
	{
		func_8EFA();
		func_8007(0);
		func_76E0();
		return;
	}

	if(func_84AB())
	{
		var_03 = func_40E1();
		self method_8152("runanim",var_03,1,0.5,self.var_5F62);
		func_76B0(var_03);
		func_8007(0);
		var_01 = 1;
	}
	else if(isdefined(self.enemy) && animscripts\move::func_5A5E())
	{
		func_8007(1);
		if(!self.var_178)
		{
			thread func_35B4();
		}
		else if(self.var_840F != "none" && !isdefined(self.var_6160))
		{
			func_315C();
			if(func_1AE9())
			{
				var_01 = func_76D3(1);
			}
			else if(func_1AE8())
			{
				func_76D4();
				return;
			}
		}
		else if(isdefined(self.var_76D7) && self.var_76D7 != 0)
		{
			var_01 = func_76D3(0);
		}
	}
	else if(isdefined(self.var_76D7) && self.var_76D7 != 0)
	{
		func_8007(0);
		var_01 = func_76D3(0);
	}
	else
	{
		func_8007(0);
	}

	if(!var_01)
	{
		func_8EFA();
		if(var_02 && self.var_7.var_71CD != 0)
		{
			func_76E0();
			return;
		}

		if(func_5F03())
		{
			return;
		}

		self method_8142(%stair_transitions,0.1);
		if(func_84AC())
		{
			var_04 = animscripts\utility::func_402B("sprint_short");
		}
		else
		{
			var_04 = func_40BB();
		}

		self method_8153("runanim",var_04,1,0.1,self.var_5F62,1);
		func_76B0(var_04);
		func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"),self.var_8559);
		thread func_7F38("run");
	}

	animscripts\notetracks::func_2D0A(0.2,"runanim");
}

//Function Number: 18
func_40E3(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "none";
	}

	if(param_00 == param_01)
	{
		return undefined;
	}

	if(param_00 == "up")
	{
		return animscripts\utility::func_402B("stairs_up_out");
	}

	if(param_00 == "down")
	{
		return animscripts\utility::func_402B("stairs_down_out");
	}

	if(param_01 == "up")
	{
		return animscripts\utility::func_402B("stairs_up_in");
	}

	if(param_01 == "down")
	{
		return animscripts\utility::func_402B("stairs_down_in");
	}
}

//Function Number: 19
func_35B4()
{
	if(isdefined(self.var_972))
	{
		return;
	}

	self.var_972 = 1;
	self endon("killanimscript");
	self endon("end_face_enemy_tracking");
	self method_8173();
	var_00 = undefined;
	if(isdefined(self.var_20B3) && isdefined(self.var_20B3["walk_aims"]))
	{
		self method_814C(self.var_20B3["walk_aims"]["walk_aim_2"]);
		self method_814C(self.var_20B3["walk_aims"]["walk_aim_4"]);
		self method_814C(self.var_20B3["walk_aims"]["walk_aim_6"]);
		self method_814C(self.var_20B3["walk_aims"]["walk_aim_8"]);
	}
	else
	{
		var_01 = "walk";
		if(animscripts\utility::func_8485() && isdefined(animscripts\utility::func_5860("cqb","aim_2")))
		{
			var_01 = "cqb";
		}

		var_02 = animscripts\utility::func_5861(var_01);
		self method_814C(var_02["aim_2"]);
		self method_814C(var_02["aim_4"]);
		self method_814C(var_02["aim_6"]);
		self method_814C(var_02["aim_8"]);
		if(isdefined(var_02["aim_5"]))
		{
			self method_814C(var_02["aim_5"]);
			var_00 = %w_aim_5;
		}
	}

	animscripts\track::func_94FB(%w_aim_2,%w_aim_4,%w_aim_6,%w_aim_8,var_00);
}

//Function Number: 20
func_315C()
{
	self.var_972 = undefined;
	self notify("end_face_enemy_tracking");
}

//Function Number: 21
func_8007(param_00)
{
	var_01 = isdefined(self.var_182C);
	if(param_00)
	{
		self.var_182C = param_00;
		if(!var_01)
		{
			thread func_76C7();
			thread func_76E6();
			return;
		}

		return;
	}

	self.var_182C = undefined;
	if(var_01)
	{
		self notify("end_shoot_while_moving");
		self notify("end_face_enemy_tracking");
		self.var_83E1 = undefined;
		self.var_972 = undefined;
		self.var_76D3 = undefined;
	}
}

//Function Number: 22
func_76C7()
{
	self endon("killanimscript");
	self endon("end_shoot_while_moving");
	animscripts\shoot_behavior::func_2742("normal");
}

//Function Number: 23
func_76E6()
{
	self endon("killanimscript");
	self endon("end_shoot_while_moving");
	animscripts\move::func_8415();
}

//Function Number: 24
func_0977()
{
	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_00 = animscripts\combat_utility::func_3DB0(self.enemy);
	}
	else
	{
		var_00 = self.enemy method_8097();
	}

	var_01 = self method_81B9();
	var_02 = vectortoangles(var_00 - self method_81B8());
	if(animscripts\utility::func_6C4(var_01[1] - var_02[1]) > 15)
	{
		return 0;
	}

	return animscripts\utility::func_6C4(var_01[0] - var_02[0]) <= 20;
}

//Function Number: 25
func_1AE9()
{
	if((!isdefined(self.var_76D7) || self.var_76D7 == 0) && abs(self method_8190()) > self.var_5A4F)
	{
		return 0;
	}

	return 1;
}

//Function Number: 26
func_1AE8()
{
	if(180 - abs(self method_8190()) >= 45)
	{
		return 0;
	}

	var_00 = func_4096(0.2);
	if(abs(var_00) > 30)
	{
		return 0;
	}

	return 1;
}

//Function Number: 27
func_1AE7()
{
	return animscripts\move::func_5A5E() && isdefined(self.enemy) && func_1AE9() || func_1AE8();
}

//Function Number: 28
func_4096(param_00)
{
	var_01 = self.var_2E6;
	var_02 = self.var_41[1] + self method_8190();
	var_01 = var_01 + (cos(var_02),sin(var_02),0) * length(self.var_4FF) * param_00;
	var_03 = self.var_41[1] - vectortoyaw(self.enemy.var_2E6 - var_01);
	var_03 = angleclamp180(var_03);
	return var_03;
}

//Function Number: 29
func_5F03()
{
	var_00 = 0;
	var_01 = undefined;
	if(self.var_3F2 == "none" && self.var_25E)
	{
		if(animscripts\utility::func_8485())
		{
			var_02 = 32;
		}
		else
		{
			var_02 = 48;
		}

		var_03 = self.var_2E6 + (0,0,6);
		var_04 = vectornormalize((self.var_25C[0],self.var_25C[1],0));
		var_05 = var_03 + var_02 * var_04;
		var_06 = self aiphysicstrace(var_03,var_05,15,48,1,1);
		if(var_06["fraction"] < 1)
		{
			if(!isdefined(var_06["stairs"]))
			{
				return 0;
			}

			var_01 = func_40E3("none","up");
		}
		else
		{
			var_07 = 18;
			var_08 = var_05 + (0,0,var_07);
			var_09 = var_05 - (0,0,var_07);
			var_06 = self aiphysicstrace(var_08,var_09,15,48,1,1);
			if(var_06["fraction"] >= 1)
			{
				return 0;
			}

			if(!isdefined(var_06["stairs"]))
			{
				return 0;
			}

			var_01 = func_40E3("none","down");
		}
	}
	else if(self.var_3F2 == "up")
	{
		var_02 = 24;
		var_07 = 18;
		var_05 = self.var_2E6 + var_02 * self.var_25C;
		var_08 = var_05 + (0,0,var_07);
		var_09 = var_05 - (0,0,var_07);
		var_06 = self aiphysicstrace(var_08,var_09,15,48,1,1);
		if(var_06["fraction"] <= 0 || var_06["fraction"] >= 1)
		{
			return 0;
		}

		if(isdefined(var_06["stairs"]))
		{
			return 0;
		}

		var_01 = func_40E3("up","none");
	}
	else if(self.var_3F2 == "down" && !self.var_25E)
	{
		var_02 = 24;
		var_07 = 18;
		var_05 = self.var_2E6 + var_02 * self.var_25C;
		var_08 = var_05 + (0,0,var_07);
		var_09 = var_05 - (0,0,var_07);
		var_06 = self aiphysicstrace(var_08,var_09,15,48,1,1);
		if(var_06["fraction"] <= 0 || var_06["fraction"] >= 1)
		{
			return 0;
		}

		if(isdefined(var_06["stairs"]))
		{
			return 0;
		}

		var_01 = func_40E3("down","none");
	}

	if(!isdefined(var_01))
	{
		return 0;
	}

	self notify("stop_move_anim_update");
	self.var_9AC1 = undefined;
	self method_8110("runanim",var_01,%body,1,0.1,self.var_5F62);
	func_76B0(var_01);
	animscripts\shared::func_2D05("runanim");
	return 1;
}

//Function Number: 30
func_8B0D()
{
	self endon("movemode");
	self method_8142(%combatrun,0.6);
	var_00 = func_402C();
	if(func_5F03())
	{
		return;
	}

	self method_8142(%stair_transitions,0.1);
	self method_8147(%combatrun,%body,1,0.2,var_00);
	if(func_84AB())
	{
		var_01 = func_40E1();
	}
	else
	{
		var_01 = func_40BB();
	}

	if(self.var_3F2 == "none")
	{
		var_02 = 0.3;
	}
	else
	{
		var_02 = 0.1;
	}

	self method_8152("runanim",var_01,1,var_02,self.var_5F62,1);
	func_76B0(var_01);
	func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"));
	thread func_7F38("run");
	var_03 = 0;
	if(self.leanamount > 0 && self.leanamount < 0.998)
	{
		var_03 = 1;
	}
	else if(self.leanamount < 0 && self.leanamount > -0.998)
	{
		var_03 = -1;
	}

	var_04 = max(0.2,var_02);
	animscripts\notetracks::func_2D0A(var_04,"runanim");
}

//Function Number: 31
func_2487()
{
	self endon("movemode");
	self method_810F("runanim",self.var_2485,%body,1,0.4,self.var_5F62);
	func_76B0(self.var_2485);
	animscripts\shared::func_2D05("runanim");
}

//Function Number: 32
func_2486()
{
	self endon("movemode");
	var_00 = func_3F41();
	self method_8143(var_00,1,0.4);
	var_01 = "run";
	if(animscripts\utility::func_9C33())
	{
		var_01 = "smg_crouch_run";
	}

	thread func_9B33("crouchrun",var_00,animscripts\utility::func_5860(var_01,"crouch_b"),animscripts\utility::func_5860(var_01,"crouch_l"),animscripts\utility::func_5860(var_01,"crouch_r"));
	self method_810F("runanim",%crouchrun,%body,1,0.2,self.var_5F62);
	func_76B0(undefined);
	animscripts\notetracks::func_2D0A(0.2,"runanim");
}

//Function Number: 33
func_8B0B()
{
	var_00 = isdefined(self.var_7.var_AA5) && self.var_7.var_AA5 > gettime();
	var_00 = var_00 || isdefined(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) < 65536;
	if(var_00)
	{
		if(!animscripts\combat_utility::func_6086(0))
		{
			return 0;
		}
	}
	else if(!animscripts\combat_utility::func_6086(0.5))
	{
		return 0;
	}

	if(isdefined(self.grenade))
	{
		return 0;
	}

	if(!self.var_178 || self.var_3F2 != "none")
	{
		return 0;
	}

	if(isdefined(self.var_2D3A) || isdefined(self.var_6161))
	{
		return 0;
	}

	if(func_1AE7() && !animscripts\combat_utility::func_6086(0))
	{
		return 0;
	}

	if(!isdefined(self.var_2FD) || distancesquared(self.var_2E6,self.var_2FD) < 65536)
	{
		return 0;
	}

	var_01 = angleclamp180(self method_8190());
	if(abs(var_01) > 25)
	{
		return 0;
	}

	if(!animscripts\utility::func_9C2D())
	{
		return 0;
	}

	if(!func_76D2())
	{
		return 0;
	}

	if(animscripts\utility::func_8485())
	{
		animscripts\cqb::func_22D7();
	}
	else
	{
		func_8B0E();
	}

	self notify("abort_reload");
	self method_818F("face default");
	return 1;
}

//Function Number: 34
func_8B0E()
{
	self endon("movemode");
	self method_818F("face motion");
	var_00 = "reload_" + animscripts\combat_utility::func_4140();
	var_01 = animscripts\utility::func_5860("run","reload");
	if(isarray(var_01))
	{
		var_01 = var_01[randomint(var_01.size)];
	}

	self method_8110(var_00,var_01,%body,1,0.25);
	func_76B0(var_01);
	self.var_9AC2 = 1;
	func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"));
	thread func_7F38("run");
	animscripts\shared::func_2D05(var_00);
	self.var_9AC2 = undefined;
}

//Function Number: 35
func_76D2()
{
	var_00 = self method_814F(%walk_and_run_loops);
	var_01 = function_0063(animscripts\utility::func_5860("run","straight")) / 3;
	var_00 = var_00 * 3;
	if(var_00 > 3)
	{
		var_00 = var_00 - 2;
	}
	else if(var_00 > 2)
	{
		var_00 = var_00 - 1;
	}

	if(var_00 < 0.15 / var_01)
	{
		return 1;
	}

	if(var_00 > 1 - 0.3 / var_01)
	{
		return 1;
	}

	return 0;
}

//Function Number: 36
func_7FB1(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	self method_8144(param_00,1,0.1,param_03,1);
	self method_8144(param_01,1,0.1,param_03,1);
	self method_8144(param_02,1,0.1,param_03,1);
}

//Function Number: 37
func_7F38(param_00)
{
	func_9B33(param_00,%combatrun_forward,%combatrun_backward,%combatrun_left,%combatrun_right);
}

//Function Number: 38
func_9B33(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(self.var_9AC1) && self.var_9AC1 == param_00)
	{
		return;
	}

	self notify("stop_move_anim_update");
	self.var_9AC1 = param_00;
	self.var_A1BF = undefined;
	self endon("killanimscript");
	self endon("move_interrupt");
	self endon("stop_move_anim_update");
	for(;;)
	{
		func_9B55(param_01,param_02,param_03,param_04);
		wait(0.05);
		waittillframeend;
	}
}

//Function Number: 39
func_9B55(param_00,param_01,param_02,param_03)
{
	if(self.var_178 && !animscripts\utility::func_8485() && !isdefined(self.var_9AC2) && !isdefined(self.var_5A77) && self.var_5A77)
	{
		if(!isdefined(self.var_A1BF))
		{
			self.var_A1BF = 1;
			var_04 = 0.2;
			if(isdefined(self.var_8F18))
			{
				var_04 = self.var_8F18;
			}

			self method_814B(param_00,1,var_04,1,1);
			self method_814B(param_01,0,var_04,1,1);
			self method_814B(param_02,0,var_04,1,1);
			self method_814B(param_03,0,var_04,1,1);
			return;
		}

		return;
	}

	self.var_A1BF = undefined;
	var_05 = animscripts\utility::func_707F(self method_8190());
	if(isdefined(self.var_9AC2))
	{
		var_05["back"] = 0;
		if(var_05["front"] < 0.2)
		{
			var_05["front"] = 0.2;
		}
	}

	var_04 = 0.2;
	if(isdefined(self.var_8F18))
	{
		var_05 = self.var_8F18;
	}

	var_06 = var_04["front"];
	if(var_06 < 0.001)
	{
		var_06 = 0.001;
	}

	self method_814B(param_00,var_06,var_05,1,1);
	self method_814B(param_01,var_04["back"],var_05,1,1);
	self method_814B(param_02,var_04["left"],var_05,1,1);
	self method_814B(param_03,var_04["right"],var_05,1,1);
}

//Function Number: 40
func_8B0A()
{
	var_00 = isdefined(self.var_A14B) && self.var_A14B;
	var_01 = animscripts\utility::func_51A0(self.weapon);
	if(var_00 == var_01)
	{
		return 0;
	}

	if(!isdefined(self.var_2FD) || distancesquared(self.var_2E6,self.var_2FD) < 65536)
	{
		return 0;
	}

	if(animscripts\utility::func_9C32())
	{
		return 0;
	}

	if(self.weapon == self.alias)
	{
		if(!var_00)
		{
			return 0;
		}

		if(animscripts\utility::func_51A0(self.secondaryweapon))
		{
			return 0;
		}
	}
	else
	{
		if(var_00)
		{
			return 0;
		}

		if(animscripts\utility::func_51A0(self.alias))
		{
			return 0;
		}
	}

	var_02 = angleclamp180(self method_8190());
	if(abs(var_02) > 25)
	{
		return 0;
	}

	if(!func_76D2())
	{
		return 0;
	}

	if(var_00)
	{
		func_843F("shotgunPullout",animscripts\utility::func_5860("cqb","shotgun_pullout"),"gun_2_chest","none",self.secondaryweapon,"shotgun_pickup");
	}
	else
	{
		func_843F("shotgunPutaway",animscripts\utility::func_5860("cqb","shotgun_putaway"),"gun_2_back","back",self.alias,"shotgun_pickup");
	}

	self notify("switchEnded");
	return 1;
}

//Function Number: 41
func_843F(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("movemode");
	self method_8110(param_00,param_01,%body,1,0.25);
	func_76B0(param_01);
	self.var_9AC2 = 1;
	func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"));
	thread func_7F38("run");
	thread func_A250(param_00,param_02,param_03,param_04,param_05);
	animscripts\notetracks::func_2D0C(function_0063(param_01) - 0.25,param_00,::func_4EA8);
	self.var_9AC2 = undefined;
}

//Function Number: 42
func_4EA8(param_00)
{
	if(param_00 == "gun_2_chest" || param_00 == "gun_2_back")
	{
		return 1;
	}
}

//Function Number: 43
func_A250(param_00,param_01,param_02,param_03,param_04)
{
	self endon("killanimscript");
	self endon("movemode");
	self endon("switchEnded");
	self waittillmatch(param_01,param_00);
	animscripts\shared::func_6866(self.weapon,param_02);
	thread func_843E(param_03);
	self waittillmatch(param_04,param_00);
	self notify("complete_weapon_switch");
}

//Function Number: 44
func_843E(param_00)
{
	self endon("death");
	common_scripts\utility::waittill_any("killanimscript","movemode","switchEnded","complete_weapon_switch");
	self.var_560C = self.weapon;
	animscripts\shared::func_6866(param_00,"right");
	self.var_18B0 = weaponclipsize(self.weapon);
}

//Function Number: 45
func_76B0(param_00)
{
	self.var_35C5 = animscripts\face::func_6D98(param_00,"run",self.var_35C5);
}

//Function Number: 46
func_76A5()
{
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}