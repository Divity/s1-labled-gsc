/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: corner.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 60
 * Decompile Time: 2232 ms
 * Timestamp: 4/20/2022 8:20:16 PM
*******************************************************************/

//Function Number: 1
func_2222(param_00,param_01)
{
	self endon("killanimscript");
	self.var_C50["exposed"]["stand"] = ::func_7EBA;
	self.var_C50["exposed"]["crouch"] = ::func_7DF4;
	self.var_22BA = self.node;
	self.var_2225 = param_00;
	self.var_7.var_2227 = "unknown";
	self.var_7.var_979 = undefined;
	animscripts\cover_behavior::func_9937(param_01);
	func_7DF0();
	self.var_519D = 0;
	self.var_94BB = 0;
	self.var_2223 = 0;
	animscripts\track::func_7F1B(0);
	self.var_475C = 0;
	var_02 = spawnstruct();
	if(!self.var_180)
	{
		var_02.var_5F90 = ::animscripts\cover_behavior::func_5F90;
	}

	var_02.var_5907 = ::func_5907;
	var_02.var_365 = ::func_2228;
	var_02.var_5664 = ::func_8E23;
	var_02.var_25A = ::func_585D;
	var_02.var_367C = ::func_367C;
	var_02.var_4B60 = ::func_4B60;
	var_02.grenade = ::func_989D;
	var_02.var_43FE = ::func_989E;
	var_02.var_14AB = ::func_14AB;
	animscripts\cover_behavior::main(var_02);
}

//Function Number: 2
func_3142()
{
	self.var_8E24 = undefined;
	self.var_7.var_565B = undefined;
}

//Function Number: 3
func_7DF0()
{
	if(self.var_7.var_6E57 == "crouch")
	{
		func_7DB6("crouch");
		return;
	}

	if(self.var_7.var_6E57 == "stand")
	{
		func_7DB6("stand");
		return;
	}

	animscripts\utility::func_3449(1);
	self.var_7.var_6E57 = "crouch";
	func_7DB6("crouch");
}

//Function Number: 4
func_8482()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(!isdefined(self.var_1C82))
	{
		self.var_1C82 = gettime() + randomintrange(5000,20000);
	}

	if(gettime() > self.var_1C82)
	{
		self.var_1C82 = gettime() + randomintrange(5000,20000);
		if(isdefined(self.var_7106) && self.var_7.var_6E57 == "stand")
		{
			return 0;
		}

		self.var_7.var_6F4A = undefined;
		return 1;
	}

	return 0;
}

//Function Number: 5
func_5907()
{
	var_00 = "stand";
	if(self.var_7.var_6E57 == "crouch")
	{
		var_00 = "crouch";
		if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
		{
			if(self.script == "cover_right")
			{
				var_00 = "crouch_r";
			}
			else if(self.script == "cover_left")
			{
				var_00 = "crouch_l";
			}
		}

		if(self.var_22BA doesnodeallowstance("stand"))
		{
			if(!self.var_22BA doesnodeallowstance("crouch") || func_8482())
			{
				var_00 = "stand";
			}
		}
	}
	else if(self.var_22BA doesnodeallowstance("crouch"))
	{
		if(!self.var_22BA doesnodeallowstance("stand") || func_8482())
		{
			var_00 = "crouch";
			if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
			{
				if(self.script == "cover_right")
				{
					var_00 = "crouch_r";
				}
				else if(self.script == "cover_left")
				{
					var_00 = "crouch_l";
				}
			}
		}
	}

	if(self.var_475C)
	{
		if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
		{
			if(var_00 == "crouch_l" || var_00 == "crouch_r")
			{
				var_00 = "crouch";
			}
		}

		func_9719(var_00);
		return;
	}

	var_01 = undefined;
	if(self.var_7.var_6E57 == var_00)
	{
		if(isdefined(self.var_DA) && isdefined(self.var_DA.var_487D) && self.var_DA.var_487D == "back")
		{
			var_02 = animscripts\utility::func_C4E("alert_idle_back");
		}
		else
		{
			var_02 = animscripts\utility::func_C4E("alert_idle");
		}

		func_427E(var_02,0.3,0.4);
	}
	else
	{
		if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
		{
			if(var_00 == "crouch_l")
			{
				var_01 = animscripts\utility::func_5860("combat","trans_to_crouch_l");
				var_00 = "crouch";
			}
			else if(var_00 == "crouch_r")
			{
				var_01 = animscripts\utility::func_5860("combat","trans_to_crouch_r");
				var_00 = "crouch";
			}
		}

		if(!isdefined(var_01))
		{
			var_01 = animscripts\utility::func_C4E("stance_change");
		}

		func_427E(var_01,0.3,function_0063(var_01));
		func_7DB6(var_00);
	}

	self.var_475C = 1;
}

//Function Number: 6
func_6FB7()
{
	wait(2);
	for(;;)
	{
		func_6FB8();
		wait(0.05);
	}
}

//Function Number: 7
func_1AE4(param_00,param_01)
{
	var_02 = param_01 animscripts\utility::func_4173(param_00);
	if(var_02 > 60 || var_02 < -60)
	{
		return 0;
	}

	if(animscripts\utility::func_5158(param_01) && var_02 > 14)
	{
		return 0;
	}

	if(animscripts\utility::func_515B(param_01) && var_02 < -12)
	{
		return 0;
	}

	return 1;
}

//Function Number: 8
func_840A()
{
	if(!isdefined(self.var_8409))
	{
		return 0;
	}

	var_00 = self.var_22BA animscripts\utility::func_4173(self.var_8409);
	if(self.var_7.var_2227 == "over")
	{
		return var_00 < self.var_251 || self.var_37F < var_00;
	}

	if(self.var_2225 == "up")
	{
		return var_00 < -50 || var_00 > 50;
	}

	if(self.var_2225 == "left")
	{
		if(self.var_7.var_2227 == "B")
		{
			return var_00 < 0 - self.var_6B4 || var_00 > 14;
		}

		if(self.var_7.var_2227 == "A")
		{
			return var_00 > 0 - self.var_6B4;
		}

		return var_00 < -50 || var_00 > 8;
	}

	if(self.var_7.var_2227 == "B")
	{
		return var_00 > self.var_6B4 || var_00 < -12;
	}

	if(self.var_7.var_2227 == "A")
	{
		return var_00 < self.var_6B4;
	}

	return var_00 > 50 || var_00 < -8;
}

//Function Number: 9
func_3F3B(param_00,param_01)
{
	var_02 = 0;
	var_03 = 0;
	if(isdefined(param_01))
	{
		var_03 = param_00 animscripts\utility::func_4173(param_01);
	}

	var_04 = [];
	if(isdefined(param_00) && self.var_7.var_6E57 == "crouch" && var_03 > self.var_251 && self.var_37F > var_03)
	{
		var_04 = param_00 method_8033();
	}

	if(self.var_2225 == "up")
	{
		if(animscripts\utility::func_51AD())
		{
			var_05 = 0;
			if(isdefined(param_01))
			{
				var_06 = anglestoup(self.var_41);
				var_05 = animscripts\combat_utility::func_4081(param_01,self geteye() + (var_06[0] * 12,var_06[1] * 12,var_06[2] * 12));
			}

			if(func_1ACD(var_05,-5,80))
			{
				var_02 = func_8498();
				var_04[var_04.size] = "lean";
				var_04[var_04.size] = "lean";
			}

			if(!var_02)
			{
				var_04[var_04.size] = "A";
			}
		}
		else
		{
			var_04[var_04.size] = "A";
		}
	}
	else if(self.var_2225 == "left")
	{
		if(func_1ACD(var_03,-40,0))
		{
			var_02 = func_8498();
			var_04[var_04.size] = "lean";
		}

		if(!var_02 && var_03 < 14)
		{
			if(var_03 < 0 - self.var_6B4)
			{
				var_04[var_04.size] = "A";
			}
			else
			{
				var_04[var_04.size] = "B";
			}
		}
	}
	else
	{
		if(func_1ACD(var_03,0,40))
		{
			var_02 = func_8498();
			var_04[var_04.size] = "lean";
		}

		if(!var_02 && var_03 > -12)
		{
			if(var_03 > self.var_6B4)
			{
				var_04[var_04.size] = "A";
			}
			else
			{
				var_04[var_04.size] = "B";
			}
		}
	}

	return animscripts\combat_utility::func_40A2(var_04);
}

//Function Number: 10
func_3F16()
{
	var_00 = 0;
	if(animscripts\utility::func_1AEF())
	{
		var_00 = self.var_22BA animscripts\utility::func_4173(animscripts\utility::func_3F7C());
	}
	else if(self.var_12F && isdefined(self.var_8409))
	{
		var_00 = self.var_22BA animscripts\utility::func_4173(self.var_8409);
	}

	if(self.var_7.var_2227 == "lean")
	{
		return "lean";
	}

	if(self.var_7.var_2227 == "over")
	{
		return "over";
	}

	if(self.var_7.var_2227 == "B")
	{
		if(self.var_2225 == "left")
		{
			if(var_00 < 0 - self.var_6B4)
			{
				return "A";
			}
		}
		else if(self.var_2225 == "right")
		{
			if(var_00 > self.var_6B4)
			{
				return "A";
			}
		}

		return "B";
	}

	if(self.var_7.var_2227 == "A")
	{
		if(self.var_2225 == "up")
		{
			return "A";
		}
		else if(self.var_2225 == "left")
		{
			if(var_00 > 0 - self.var_6B4)
			{
				return "B";
			}
		}
		else if(self.var_2225 == "right")
		{
			if(var_00 < self.var_6B4)
			{
				return "B";
			}
		}

		return "A";
	}
}

//Function Number: 11
func_1C83()
{
	self endon("killanimscript");
	var_00 = func_3F16();
	if(var_00 == self.var_7.var_2227)
	{
		return 0;
	}

	self.var_1C86 = 1;
	self notify("done_changing_cover_pos");
	var_01 = self.var_7.var_2227 + "_to_" + var_00;
	var_02 = animscripts\utility::func_C51(var_01);
	if(animscripts\utility::func_51AD() && var_01 == "A_to_B" || var_01 == "B_to_A")
	{
		return 0;
	}

	var_03 = !self.var_425;
	var_04 = func_4095();
	if(!self method_81C3(var_04,var_03))
	{
		return 0;
	}

	if(!self method_81C4(var_04,animscripts\utility::func_3EFA(var_02),var_03))
	{
		return 0;
	}

	animscripts\combat_utility::func_3155();
	func_8ED7(0.3);
	var_05 = self.var_7.var_6E57;
	self method_814C(animscripts\utility::func_C4E("straight_level"),0,0.2);
	self method_8152("changeStepOutPos",var_02,1,0.2,1.2);
	func_2221(var_02);
	thread func_2D12("changeStepOutPos");
	var_06 = animhasnotetrack(var_02,"start_aim");
	if(var_06)
	{
		self waittillmatch("start_aim","changeStepOutPos");
	}
	else
	{
		self waittillmatch("end","changeStepOutPos");
	}

	thread func_8CF6(undefined,0,0.3);
	if(var_06)
	{
		self waittillmatch("end","changeStepOutPos");
	}

	self method_8142(var_02,0.1);
	self.var_7.var_2227 = var_00;
	self.var_1C86 = 0;
	self.var_22BC = gettime();
	if(self.var_7.var_6E57 != var_05)
	{
		func_7DB6(self.var_7.var_6E57);
	}

	thread func_1C7D(undefined,1,0.3);
	return 1;
}

//Function Number: 12
func_1ACD(param_00,param_01,param_02)
{
	if(self.var_7.var_6093)
	{
		return 0;
	}

	return param_01 <= param_00 && param_00 <= param_02;
}

//Function Number: 13
func_8498()
{
	if(self.inliveplayerkillstreak == "allies")
	{
		return 1;
	}

	if(animscripts\utility::func_516B())
	{
		return 1;
	}

	return 0;
}

//Function Number: 14
func_2D12(param_00)
{
	self endon("killanimscript");
	animscripts\shared::func_2D05(param_00);
}

//Function Number: 15
func_8CF6(param_00,param_01,param_02)
{
	self.var_2223 = 1;
	if(self.var_7.var_2227 == "lean")
	{
		self.var_7.var_565B = 1;
	}
	else
	{
		self.var_7.var_565B = undefined;
	}

	func_7F12(param_00,param_01,param_02);
}

//Function Number: 16
func_1C7D(param_00,param_01,param_02)
{
	if(self.var_7.var_2227 == "lean")
	{
		self.var_7.var_565B = 1;
	}
	else
	{
		self.var_7.var_565B = undefined;
	}

	func_7F12(param_00,param_01,param_02);
}

//Function Number: 17
func_8ED7(param_00)
{
	self.var_2223 = 0;
	self method_8142(%add_fire,param_00);
	animscripts\track::func_7F1B(0,param_00);
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}

//Function Number: 18
func_7F12(param_00,param_01,param_02)
{
	self.var_8A77 = param_00;
	self method_814C(%exposed_modern,1,param_02);
	self method_814C(%exposed_aiming,1,param_02);
	self method_814C(%add_idle,1,param_02);
	animscripts\track::func_7F1B(1,param_02);
	func_2220(undefined);
	var_03 = undefined;
	if(isdefined(self.var_7.var_CD8["lean_aim_straight"]))
	{
		var_03 = self.var_7.var_CD8["lean_aim_straight"];
	}

	thread animscripts\combat_utility::func_979();
	if(isdefined(self.var_7.var_565B))
	{
		self method_814C(var_03,1,param_02);
		self method_814C(animscripts\utility::func_C4E("straight_level"),0,0);
		self method_8144(animscripts\utility::func_C4E("lean_aim_left"),1,param_02);
		self method_8144(animscripts\utility::func_C4E("lean_aim_right"),1,param_02);
		self method_8144(animscripts\utility::func_C4E("lean_aim_up"),1,param_02);
		self method_8144(animscripts\utility::func_C4E("lean_aim_down"),1,param_02);
		return;
	}

	if(param_01)
	{
		self method_814C(animscripts\utility::func_C4E("straight_level"),1,param_02);
		if(isdefined(var_03))
		{
			self method_814C(var_03,0,0);
		}

		self method_8144(animscripts\utility::func_C4E("add_aim_up"),1,param_02);
		self method_8144(animscripts\utility::func_C4E("add_aim_down"),1,param_02);
		self method_8144(animscripts\utility::func_C4E("add_aim_left"),1,param_02);
		self method_8144(animscripts\utility::func_C4E("add_aim_right"),1,param_02);
		return;
	}

	self method_814C(animscripts\utility::func_C4E("straight_level"),0,param_02);
	if(isdefined(var_03))
	{
		self method_814C(var_03,0,0);
	}

	self method_8144(animscripts\utility::func_C4E("add_turn_aim_up"),1,param_02);
	self method_8144(animscripts\utility::func_C4E("add_turn_aim_down"),1,param_02);
	self method_8144(animscripts\utility::func_C4E("add_turn_aim_left"),1,param_02);
	self method_8144(animscripts\utility::func_C4E("add_turn_aim_right"),1,param_02);
}

//Function Number: 19
func_8E22()
{
	if(self.var_7.var_2227 == "over")
	{
		return 1;
	}

	return animscripts\combat_utility::func_711C();
}

//Function Number: 20
func_8E21()
{
	self.var_7.var_2227 = "alert";
	if(self.var_1C7 < 64)
	{
		return 0;
	}

	func_7F42();
	if(self.var_7.var_6E57 == "stand")
	{
		self.var_6B4 = 38;
	}
	else
	{
		self.var_6B4 = 31;
	}

	var_00 = self.var_7.var_6E57;
	func_7DB6(var_00);
	animscripts\combat::func_7E02();
	var_01 = "none";
	if(animscripts\utility::func_4729())
	{
		var_01 = func_3F3B(self.var_22BA,animscripts\utility::func_3F7C());
	}
	else
	{
		var_01 = func_3F3B(self.var_22BA);
	}

	if(!isdefined(var_01))
	{
		return 0;
	}

	var_02 = "alert_to_" + var_01;
	if(!animscripts\utility::func_C4F(var_02))
	{
		return 0;
	}

	var_03 = animscripts\utility::func_C51(var_02);
	if(var_01 == "lean" && !func_516E())
	{
		return 0;
	}

	if(var_01 != "over" && !func_516C(var_03,var_01 != "lean"))
	{
		return 0;
	}

	self.var_7.var_2227 = var_01;
	self.var_7.var_6F4A = var_01;
	if(self.var_7.var_2227 == "lean")
	{
		animscripts\combat::func_7E02(self.var_22BA);
	}

	if(var_01 == "A" || var_01 == "B")
	{
		self.var_7.var_8A14 = "cover_" + self.var_2225 + "_" + self.var_7.var_6E57 + "_" + var_01;
	}
	else if(var_01 == "over")
	{
		self.var_7.var_8A14 = "cover_crouch_aim";
	}
	else
	{
		self.var_7.var_8A14 = "none";
	}

	self.var_234 = 1;
	var_04 = 0;
	self.var_1C86 = 1;
	self notify("done_changing_cover_pos");
	var_05 = func_8E22();
	self.var_34F = 0;
	self method_8110("stepout",var_03,%animscript_root,1,0.2,var_05);
	func_2221(var_03);
	thread func_2D12("stepout");
	var_04 = animhasnotetrack(var_03,"start_aim");
	if(var_04)
	{
		self.var_8E24 = self.var_41[1] + getangledelta(var_03,0,1);
		self waittillmatch("start_aim","stepout");
	}
	else
	{
		self waittillmatch("end","stepout");
	}

	if(var_01 == "B" && common_scripts\utility::cointoss() && self.var_2225 == "right")
	{
		self.var_7.var_8A14 = "corner_right_martyrdom";
	}

	func_7DB7(var_00);
	var_06 = var_01 == "over" || animscripts\utility::func_51AD();
	func_8CF6(undefined,var_06,0.3);
	thread animscripts\track::func_950B();
	if(var_04)
	{
		self waittillmatch("end","stepout");
		self.var_8E24 = undefined;
	}

	func_1C7D(undefined,1,0.2);
	self method_8142(%cover,0.1);
	self method_8142(%corner,0.1);
	self.var_1C86 = 0;
	self.var_22BC = gettime();
	self.var_34F = 1;
	return 1;
}

//Function Number: 21
func_8E23()
{
	self.var_234 = 1;
	if(isdefined(self.var_7106) && randomfloat(1) < self.var_7106)
	{
		if(func_7101())
		{
			return 1;
		}
	}

	if(!func_8E21())
	{
		return 0;
	}

	func_83E4();
	if(isdefined(self.var_8409))
	{
		var_00 = lengthsquared(self.var_2E6 - self.var_8409);
		if(animscripts\utility::func_9C2E() && animscripts\utility::func_848F(var_00))
		{
			if(self.var_7.var_6E57 == "stand")
			{
				animscripts\shared::func_9333(animscripts\utility::func_5860("combat","drop_rpg_stand"));
			}
			else
			{
				animscripts\shared::func_9333(animscripts\utility::func_5860("combat","drop_rpg_crouch"));
			}

			thread func_76C6();
			return;
		}
	}

	func_74DE();
	self.var_234 = 0;
	return 1;
}

//Function Number: 22
func_475E(param_00)
{
	if(!isdefined(self.var_55CE))
	{
		return 1;
	}

	return gettime() - self.var_55CE > param_00 * 1000;
}

//Function Number: 23
func_7101()
{
	if(!animscripts\utility::func_4729())
	{
		return 0;
	}

	var_00 = 0;
	var_01 = 90;
	var_02 = self.var_22BA animscripts\utility::func_4173(animscripts\utility::func_3F7C());
	if(self.var_2225 == "left")
	{
		var_02 = 0 - var_02;
	}

	if(var_02 > 30)
	{
		var_01 = 45;
		if(self.var_2225 == "left")
		{
			var_00 = 45;
		}
		else
		{
			var_00 = -45;
		}
	}

	var_03 = "rambo" + var_01;
	if(!animscripts\utility::func_C4F(var_03))
	{
		return 0;
	}

	var_04 = animscripts\utility::func_C51(var_03);
	var_05 = func_4095(48);
	if(!self method_81C3(var_05,!self.var_425))
	{
		return 0;
	}

	self.var_22BC = gettime();
	func_7F42();
	self.var_234 = 1;
	self.var_5184 = 1;
	self.var_7.var_6F4A = "rambo";
	self.var_1C86 = 1;
	thread animscripts\shared::func_7103(var_00);
	self method_8110("rambo",var_04,%body,1,0,1);
	func_2221(var_04);
	animscripts\shared::func_2D05("rambo");
	self notify("rambo_aim_end");
	self.var_1C86 = 0;
	self.var_234 = 0;
	self.var_55CE = gettime();
	self.var_1C86 = 0;
	self.var_5184 = undefined;
	return 1;
}

//Function Number: 24
func_83E4()
{
	lib_A52D::func_2A4C();
	for(;;)
	{
		for(;;)
		{
			if(isdefined(self.var_84A1))
			{
				break;
			}

			if(!isdefined(self.var_8409))
			{
				self waittill("do_slow_things");
				waittillframeend;
				if(isdefined(self.var_8409))
				{
					continue;
				}

				break;
			}

			if(!self.var_18B0)
			{
				break;
			}

			if(func_840A())
			{
				if(!func_1C83())
				{
					if(func_3F16() == self.var_7.var_2227)
					{
						break;
					}

					func_8414(0.2);
					continue;
				}

				if(func_840A())
				{
					break;
				}

				continue;
			}

			func_8412(1);
			self method_8142(%add_fire,0.2);
		}

		if(func_1ADB(self.var_7.var_2227 != "lean"))
		{
			break;
		}

		if(func_840A() && func_1C83())
		{
			continue;
		}

		func_8414(0.2);
	}
}

//Function Number: 25
func_8414(param_00)
{
	thread func_6233(param_00);
	var_01 = gettime();
	func_8412(0);
	self notify("stopNotifyStopShootingAfterTime");
	var_02 = gettime() - var_01 / 1000;
	if(var_02 < param_00)
	{
		wait(param_00 - var_02);
	}
}

//Function Number: 26
func_6233(param_00)
{
	self endon("killanimscript");
	self endon("stopNotifyStopShootingAfterTime");
	wait(param_00);
	self notify("stopShooting");
}

//Function Number: 27
func_8412(param_00)
{
	self endon("return_to_cover");
	if(param_00)
	{
		thread func_0B99();
	}

	thread animscripts\combat_utility::func_979();
	animscripts\combat_utility::func_8411();
}

//Function Number: 28
func_0B99()
{
	self endon("killanimscript");
	self notify("newAngleRangeCheck");
	self endon("newAngleRangeCheck");
	self endon("take_cover_at_corner");
	for(;;)
	{
		if(func_840A())
		{
			break;
		}

		wait(0.1);
	}

	self notify("stopShooting");
}

//Function Number: 29
func_8528()
{
	self.enemy endon("death");
	self endon("enemy");
	self endon("stopshowstate");
	wait(0.05);
}

//Function Number: 30
func_1ADB(param_00)
{
	var_01 = !self.var_425;
	if(param_00)
	{
		var_02 = func_4095();
		if(!self method_81C3(var_02,var_01))
		{
			return 0;
		}

		return self method_81C4(var_02,self.var_22BA.var_2E6,var_01);
	}

	return self method_81C3(self.var_22BA.var_2E6,var_02);
}

//Function Number: 31
func_74DE()
{
	animscripts\combat_utility::func_315D();
	var_00 = animscripts\utility::func_51C0();
	self notify("take_cover_at_corner");
	self.var_1C86 = 1;
	self notify("done_changing_cover_pos");
	var_01 = self.var_7.var_2227 + "_to_alert";
	var_02 = animscripts\utility::func_C51(var_01);
	func_8ED7(0.3);
	var_03 = 0;
	if(self.var_7.var_2227 != "lean" && var_00 && animscripts\utility::func_C4F(var_01 + "_reload") && randomfloat(100) < 75)
	{
		var_02 = animscripts\utility::func_C51(var_01 + "_reload");
		var_03 = 1;
	}

	var_04 = func_8E22();
	if(animscripts\utility::func_51AD())
	{
		self method_8142(%exposed_modern,0.2);
	}
	else
	{
		self method_8142(%body,0.1);
	}

	self method_8113("hide",var_02,1,0.1,var_04);
	func_2221(var_02);
	animscripts\shared::func_2D05("hide");
	if(var_03)
	{
		animscripts\weaponlist::func_72AE();
	}

	self.var_1C86 = 0;
	if(self.var_2225 == "up")
	{
		self.var_7.var_8A14 = "cover_up";
	}
	else if(self.var_2225 == "left")
	{
		self.var_7.var_8A14 = "cover_left";
	}
	else
	{
		self.var_7.var_8A14 = "cover_right";
	}

	self.var_234 = 0;
	self method_8142(var_02,0.2);
}

//Function Number: 32
func_14AB()
{
	if(!animscripts\utility::func_C4F("blind_fire"))
	{
		return 0;
	}

	func_7F42();
	self.var_234 = 1;
	var_00 = animscripts\utility::func_C51("blind_fire");
	self method_8110("blindfire",var_00,%body,1,0,1);
	func_2221(var_00);
	animscripts\shared::func_2D05("blindfire");
	self.var_234 = 0;
	return 1;
}

//Function Number: 33
func_5773(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = (1,1,1);
	}

	for(var_03 = 0;var_03 < 100;var_03++)
	{
		wait(0.05);
	}
}

//Function Number: 34
func_989E(param_00)
{
	return func_989D(param_00,1);
}

//Function Number: 35
func_989D(param_00,param_01)
{
	if(!self method_81C3(func_4095()))
	{
		return 0;
	}

	if(isdefined(self.var_2D33) || isdefined(param_00.var_2D2A))
	{
		return 0;
	}

	var_02 = undefined;
	if(isdefined(self.var_7106) && randomfloat(1) < self.var_7106)
	{
		if(isdefined(self.var_7.var_CD8["grenade_rambo"]))
		{
			var_02 = animscripts\utility::func_C4E("grenade_rambo");
		}
	}

	if(!isdefined(var_02))
	{
		if(isdefined(param_01) && param_01)
		{
			if(!isdefined(self.var_7.var_CD8["grenade_safe"]))
			{
				return 0;
			}

			var_02 = animscripts\utility::func_C4E("grenade_safe");
		}
		else
		{
			if(!isdefined(self.var_7.var_CD8["grenade_exposed"]))
			{
				return 0;
			}

			var_02 = animscripts\utility::func_C4E("grenade_exposed");
		}
	}

	func_7F42();
	self.var_234 = 1;
	var_03 = animscripts\combat_utility::func_9895(param_00,var_02);
	self.var_234 = 0;
	return var_03;
}

//Function Number: 36
func_6FB8()
{
}

//Function Number: 37
func_585D(param_00)
{
	if(!isdefined(self.var_7.var_CD8["alert_to_look"]))
	{
		return 0;
	}

	func_7F42();
	self.var_234 = 1;
	if(!func_67B6())
	{
		return 0;
	}

	animscripts\shared::func_6DBE(animscripts\utility::func_C4E("look_idle"),param_00,::func_1AEE);
	var_01 = undefined;
	if(animscripts\utility::func_51C0())
	{
		var_01 = animscripts\utility::func_C4E("look_to_alert_fast");
	}
	else
	{
		var_01 = animscripts\utility::func_C4E("look_to_alert");
	}

	self method_8110("looking_end",var_01,%body,1,0.1,1);
	func_2221(var_01);
	animscripts\shared::func_2D05("looking_end");
	func_7F42();
	self.var_234 = 0;
	return 1;
}

//Function Number: 38
func_516E()
{
	var_00 = self.var_22BA.var_41;
	if(animscripts\utility::func_51AD())
	{
		var_00 = animscripts\utility::func_4139(self.var_22BA);
	}

	var_01 = self geteye();
	var_02 = anglestoright(var_00);
	var_03 = anglestoup(var_00);
	if(self.var_2225 == "right")
	{
		var_01 = var_01 + var_02 * 30;
	}
	else if(self.var_2225 == "left")
	{
		var_01 = var_01 - var_02 * 30;
	}
	else
	{
		var_01 = var_01 + var_03 * 30;
	}

	var_04 = var_01 + anglestoforward(var_00) * 30;
	return sighttracepassed(var_01,var_04,1,self);
}

//Function Number: 39
func_67B6()
{
	if(isdefined(self.var_22BA.var_79A4))
	{
		return 0;
	}

	if(isdefined(self.var_60D6) && gettime() < self.var_60D6)
	{
		return 0;
	}

	if(!func_516E())
	{
		self.var_60D6 = gettime() + 3000;
		return 0;
	}

	var_00 = animscripts\utility::func_C4E("alert_to_look");
	self method_810F("looking_start",var_00,%body,1,0.2,1);
	func_2221(var_00);
	animscripts\shared::func_2D05("looking_start");
	return 1;
}

//Function Number: 40
func_1AEE()
{
	return self method_81C3(self.var_22BA.var_2E6,!self.var_425);
}

//Function Number: 41
func_367C()
{
	return 0;
}

//Function Number: 42
func_2228()
{
	var_00 = animscripts\utility::func_C51("reload");
	self method_810D("cornerReload",var_00,1,0.2);
	func_2221(var_00);
	animscripts\shared::func_2D05("cornerReload");
	self notify("abort_reload");
	animscripts\weaponlist::func_72AE();
	self method_814D(animscripts\utility::func_C4E("alert_idle"),1,0.2);
	self method_8142(var_00,0.2);
	return 1;
}

//Function Number: 43
func_516C(param_00,param_01)
{
	var_02 = !self.var_425;
	if(param_01)
	{
		var_03 = func_4095();
		if(!self method_81C3(var_03,var_02))
		{
			return 0;
		}

		if(self.var_425)
		{
			return 1;
		}

		return self method_81C4(var_03,animscripts\utility::func_3EFA(param_00),var_02);
	}

	if(self.var_425)
	{
		return 1;
	}

	return self method_81C3(animscripts\utility::func_3EFA(param_01),var_03);
}

//Function Number: 44
func_4095(param_00)
{
	var_01 = self.var_22BA.var_41;
	var_02 = anglestoright(var_01);
	if(!isdefined(param_00))
	{
		param_00 = 36;
	}

	var_03 = self.script;
	if(var_03 == "cover_multi")
	{
		if(self.var_DA.state == "right")
		{
			var_03 = "cover_right";
		}
		else if(self.var_DA.state == "left")
		{
			var_03 = "cover_left";
		}
	}

	if(var_03 == "cover_swim_up")
	{
		var_04 = anglestoup(var_01);
		return self.var_22BA.var_2E6 + var_04 * param_00;
	}

	switch(var_04)
	{
		case "cover_swim_left":
		case "cover_left":
			break;

		case "cover_swim_right":
		case "cover_right":
			break;

		default:
			break;
	}
}

//Function Number: 45
func_4B60()
{
	self endon("end_idle");
	for(;;)
	{
		var_00 = randomint(2) == 0 && isdefined(self.var_7.var_CD8["alert_idle_twitch"]) && animscripts\utility::func_C4F("alert_idle_twitch");
		if(var_00)
		{
			var_01 = animscripts\utility::func_C51("alert_idle_twitch");
		}
		else
		{
			var_01 = animscripts\utility::func_C4E("alert_idle");
		}

		func_6DA9(var_01,var_00);
	}
}

//Function Number: 46
func_38DD()
{
	if(!animscripts\utility::func_C4F("alert_idle_flinch"))
	{
		return 0;
	}

	func_6DA9(animscripts\utility::func_C51("alert_idle_flinch"),1);
	return 1;
}

//Function Number: 47
func_6DA9(param_00,param_01)
{
	if(param_01)
	{
		self method_8110("idle",param_00,%body,1,0.1,1);
	}
	else
	{
		self method_810F("idle",param_00,%body,1,0.1,1);
	}

	func_2221(param_00);
	animscripts\shared::func_2D05("idle");
}

//Function Number: 48
func_7DB6(param_00)
{
	[[ self.var_C50["hiding"][param_00] ]]();
	[[ self.var_C50["exposed"][param_00] ]]();
}

//Function Number: 49
func_7DB7(param_00)
{
	[[ self.var_C50["exposed"][param_00] ]]();
}

//Function Number: 50
func_9719(param_00)
{
	if(self.var_7.var_6E57 == param_00)
	{
		func_7DB6(param_00);
		return;
	}

	var_01 = animscripts\utility::func_C4E("stance_change");
	self method_8110("changeStance",var_01,%body);
	func_2221(var_01);
	func_7DB6(param_00);
	animscripts\shared::func_2D05("changeStance");
	wait(0.2);
}

//Function Number: 51
func_427E(param_00,param_01,param_02)
{
	var_03 = animscripts\utility::func_4046();
	var_04 = animscripts\utility::func_3F2D();
	var_05 = var_03 + self.var_4881;
	if(animscripts\utility::func_51AD())
	{
		self notify("force_space_rotation_update",0,0);
	}
	else
	{
		self method_818F("face angle",var_05);
	}

	self method_818E("normal");
	if(isdefined(var_04))
	{
		thread animscripts\shared::func_5F91(var_04,param_01);
	}

	self method_8110("coveranim",param_00,%body,1,param_01);
	func_2221(param_00);
	animscripts\notetracks::func_2D0A(param_02,"coveranim");
	while(animscripts\utility::func_6C4(self.var_41[1] - var_05) > 1)
	{
		animscripts\notetracks::func_2D0A(0.1,"coveranim");
		var_03 = animscripts\utility::func_4046();
		var_05 = var_03 + self.var_4881;
	}

	func_7F42();
	if(self.var_2225 == "left")
	{
		self.var_7.var_8A14 = "cover_left";
		return;
	}

	if(self.var_2225 == "right")
	{
		self.var_7.var_8A14 = "cover_right";
		return;
	}

	self.var_7.var_8A14 = "cover_up";
}

//Function Number: 52
func_2DDC()
{
	self endon("killanimscript");
	wait(0.05);
}

//Function Number: 53
func_7EBA()
{
	if(self.var_425 && isdefined(self.node))
	{
		func_7EC6();
		return;
	}

	if(!isdefined(self.var_7.var_CD8))
	{
	}

	var_00 = animscripts\utility::func_5861("default_stand");
	self.var_7.var_CD8["add_aim_up"] = var_00["add_aim_up"];
	self.var_7.var_CD8["add_aim_down"] = var_00["add_aim_down"];
	self.var_7.var_CD8["add_aim_left"] = var_00["add_aim_left"];
	self.var_7.var_CD8["add_aim_right"] = var_00["add_aim_right"];
	self.var_7.var_CD8["add_turn_aim_up"] = var_00["add_turn_aim_up"];
	self.var_7.var_CD8["add_turn_aim_down"] = var_00["add_turn_aim_down"];
	self.var_7.var_CD8["add_turn_aim_left"] = var_00["add_turn_aim_left"];
	self.var_7.var_CD8["add_turn_aim_right"] = var_00["add_turn_aim_right"];
	self.var_7.var_CD8["straight_level"] = var_00["straight_level"];
	if(self.var_7.var_2227 == "lean")
	{
		var_01 = self.var_7.var_CD8["lean_fire"];
		var_02 = self.var_7.var_CD8["lean_single"];
		self.var_7.var_CD8["fire"] = var_01;
		self.var_7.var_CD8["single"] = animscripts\utility::func_CD8(var_02);
		self.var_7.var_CD8["semi2"] = var_02;
		self.var_7.var_CD8["semi3"] = var_02;
		self.var_7.var_CD8["semi4"] = var_02;
		self.var_7.var_CD8["semi5"] = var_02;
		self.var_7.var_CD8["burst2"] = var_01;
		self.var_7.var_CD8["burst3"] = var_01;
		self.var_7.var_CD8["burst4"] = var_01;
		self.var_7.var_CD8["burst5"] = var_01;
		self.var_7.var_CD8["burst6"] = var_01;
	}
	else
	{
		self.var_7.var_CD8["fire"] = var_00["fire_corner"];
		self.var_7.var_CD8["semi2"] = var_00["semi2"];
		self.var_7.var_CD8["semi3"] = var_00["semi3"];
		self.var_7.var_CD8["semi4"] = var_00["semi4"];
		self.var_7.var_CD8["semi5"] = var_00["semi5"];
		if(animscripts\utility::func_A2C6())
		{
			self.var_7.var_CD8["single"] = animscripts\utility::func_5860("shotgun_stand","single");
		}
		else
		{
			self.var_7.var_CD8["single"] = var_00["single"];
		}

		self.var_7.var_CD8["burst2"] = var_00["burst2"];
		self.var_7.var_CD8["burst3"] = var_00["burst3"];
		self.var_7.var_CD8["burst4"] = var_00["burst4"];
		self.var_7.var_CD8["burst5"] = var_00["burst5"];
		self.var_7.var_CD8["burst6"] = var_00["burst6"];
	}

	self.var_7.var_CD8["exposed_idle"] = var_00["exposed_idle"];
}

//Function Number: 54
func_7DF4()
{
	if(self.var_425 && isdefined(self.node))
	{
		func_7EC6();
		return;
	}

	if(!isdefined(self.var_7.var_CD8))
	{
	}

	var_00 = animscripts\utility::func_5861("default_crouch");
	var_01["add_aim_up"] = animscripts\utility::func_5860("cover_crouch","add_aim_up");
	var_02["add_aim_up"] = animscripts\utility::func_5860("cover_crouch","add_aim_up");
	var_03[0] = animscripts\utility::func_5860("cover_crouch","add_aim_up");
	if(self.var_7.var_2227 == "over")
	{
		self.var_7.var_CD8["add_aim_up"] = animscripts\utility::func_5860("cover_crouch","add_aim_up");
		self.var_7.var_CD8["add_aim_down"] = animscripts\utility::func_5860("cover_crouch","add_aim_down");
		self.var_7.var_CD8["add_aim_left"] = animscripts\utility::func_5860("cover_crouch","add_aim_left");
		self.var_7.var_CD8["add_aim_right"] = animscripts\utility::func_5860("cover_crouch","add_aim_right");
		self.var_7.var_CD8["straight_level"] = animscripts\utility::func_5860("cover_crouch","straight_level");
		self.var_7.var_CD8["exposed_idle"] = animscripts\utility::func_5860("default_stand","exposed_idle");
		return;
	}

	if(self.var_7.var_2227 == "lean")
	{
		var_04 = self.var_7.var_CD8["lean_fire"];
		var_05 = self.var_7.var_CD8["lean_single"];
		self.var_7.var_CD8["fire"] = var_04;
		self.var_7.var_CD8["single"] = animscripts\utility::func_CD8(var_05);
		self.var_7.var_CD8["semi2"] = var_05;
		self.var_7.var_CD8["semi3"] = var_05;
		self.var_7.var_CD8["semi4"] = var_05;
		self.var_7.var_CD8["semi5"] = var_05;
		self.var_7.var_CD8["burst2"] = var_04;
		self.var_7.var_CD8["burst3"] = var_04;
		self.var_7.var_CD8["burst4"] = var_04;
		self.var_7.var_CD8["burst5"] = var_04;
		self.var_7.var_CD8["burst6"] = var_04;
	}
	else
	{
		self.var_7.var_CD8["fire"] = var_00["fire"];
		self.var_7.var_CD8["semi2"] = var_00["semi2"];
		self.var_7.var_CD8["semi3"] = var_00["semi3"];
		self.var_7.var_CD8["semi4"] = var_00["semi4"];
		self.var_7.var_CD8["semi5"] = var_00["semi5"];
		if(animscripts\utility::func_A2C6())
		{
			self.var_7.var_CD8["single"] = animscripts\utility::func_5860("shotgun_crouch","single");
		}
		else
		{
			self.var_7.var_CD8["single"] = var_00["single"];
		}

		self.var_7.var_CD8["burst2"] = var_00["burst2"];
		self.var_7.var_CD8["burst3"] = var_00["burst3"];
		self.var_7.var_CD8["burst4"] = var_00["burst4"];
		self.var_7.var_CD8["burst5"] = var_00["burst5"];
		self.var_7.var_CD8["burst6"] = var_00["burst6"];
	}

	self.var_7.var_CD8["add_aim_up"] = var_00["add_aim_up"];
	self.var_7.var_CD8["add_aim_down"] = var_00["add_aim_down"];
	self.var_7.var_CD8["add_aim_left"] = var_00["add_aim_left"];
	self.var_7.var_CD8["add_aim_right"] = var_00["add_aim_right"];
	self.var_7.var_CD8["add_turn_aim_up"] = var_00["add_turn_aim_up"];
	self.var_7.var_CD8["add_turn_aim_down"] = var_00["add_turn_aim_down"];
	self.var_7.var_CD8["add_turn_aim_left"] = var_00["add_turn_aim_left"];
	self.var_7.var_CD8["add_turn_aim_right"] = var_00["add_turn_aim_right"];
	self.var_7.var_CD8["straight_level"] = var_00["straight_level"];
	self.var_7.var_CD8["exposed_idle"] = var_00["exposed_idle"];
}

//Function Number: 55
func_7EC6()
{
	if(!isdefined(self.var_7.var_CD8))
	{
	}

	var_00 = [];
	if(self.var_CBC == "cover_corner_r")
	{
		var_00 = animscripts\swim::func_40FE("cover_corner_r");
	}
	else if(self.var_CBC == "cover_corner_l")
	{
		var_00 = animscripts\swim::func_40FE("cover_corner_l");
	}
	else if(self.var_CBC == "cover_u")
	{
		var_00 = animscripts\swim::func_40FE("cover_u");
	}
	else if(self.var_CBC == "exposed")
	{
		var_00 = animscripts\swim::func_40FE("exposed");
	}
	else
	{
	}

	self.var_7.var_CD8["add_aim_up"] = var_00["add_aim_up"];
	self.var_7.var_CD8["add_aim_down"] = var_00["add_aim_down"];
	self.var_7.var_CD8["add_aim_left"] = var_00["add_aim_left"];
	self.var_7.var_CD8["add_aim_right"] = var_00["add_aim_right"];
	self.var_7.var_CD8["add_turn_aim_up"] = var_00["add_aim_up"];
	self.var_7.var_CD8["add_turn_aim_down"] = var_00["add_aim_down"];
	self.var_7.var_CD8["add_turn_aim_left"] = var_00["add_aim_left"];
	self.var_7.var_CD8["add_turn_aim_right"] = var_00["add_aim_right"];
	self.var_7.var_CD8["straight_level"] = var_00["straight_level"];
	self.var_7.var_CD8["fire"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["semi2"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["semi3"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["semi4"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["semi5"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["single"] = animscripts\utility::func_CD8(var_00["add_aim_straight"]);
	self.var_7.var_CD8["burst2"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["burst3"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["burst4"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["burst5"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["burst6"] = var_00["add_aim_straight"];
	self.var_7.var_CD8["exposed_idle"] = animscripts\utility::func_CD8(var_00["add_aim_idle"]);
}

//Function Number: 56
func_76C6()
{
	self notify("killanimscript");
	thread animscripts\combat::main();
}

//Function Number: 57
func_7F42()
{
	if(self.var_425)
	{
		self method_818E("nogravity");
		return;
	}

	self method_818E("zonly_physics");
}

//Function Number: 58
func_2221(param_00)
{
	if(self.var_2225 == "left")
	{
		var_01 = "corner_stand_L";
	}
	else
	{
		var_01 = "corner_stand_R";
	}

	self.var_35C5 = animscripts\face::func_6D98(param_00,var_01,self.var_35C5);
}

//Function Number: 59
func_2220(param_00)
{
	self.var_35C5 = animscripts\face::func_6D98(param_00,"aim",self.var_35C5);
}

//Function Number: 60
func_221F()
{
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}