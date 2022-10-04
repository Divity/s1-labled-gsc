/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_wall.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 40
 * Decompile Time: 1422 ms
 * Timestamp: 4/20/2022 8:20:24 PM
*******************************************************************/

//Function Number: 1
func_4C7E()
{
	var_00 = [];
	var_00["add_aim_up"] = %covercrouch_aim8_add;
	var_00["add_aim_down"] = %covercrouch_aim2_add;
	var_00["add_aim_left"] = %covercrouch_aim4_add;
	var_00["add_aim_right"] = %covercrouch_aim6_add;
	var_00["straight_level"] = %covercrouch_aim5;
	var_00["hide_idle"] = %covercrouch_hide_idle;
	var_00["hide_idle_twitch"] = animscripts\utility::func_CD8(%covercrouch_twitch_1,%covercrouch_twitch_2,%covercrouch_twitch_3,%covercrouch_twitch_4);
	var_00["hide_idle_flinch"] = animscripts\utility::func_CD8();
	var_00["hide_2_crouch"] = %covercrouch_hide_2_aim;
	var_00["hide_2_stand"] = %covercrouch_hide_2_stand;
	var_00["hide_2_lean"] = %covercrouch_hide_2_lean;
	var_00["hide_2_right"] = %covercrouch_hide_2_right;
	var_00["hide_2_left"] = %covercrouch_hide_2_left;
	var_00["crouch_2_hide"] = %covercrouch_aim_2_hide;
	var_00["stand_2_hide"] = %covercrouch_stand_2_hide;
	var_00["lean_2_hide"] = %covercrouch_lean_2_hide;
	var_00["right_2_hide"] = %covercrouch_right_2_hide;
	var_00["left_2_hide"] = %covercrouch_left_2_hide;
	var_00["smg_hide_2_stand"] = %smg_covercrouch_hide_2_stand;
	var_00["smg_stand_2_hide"] = %smg_covercrouch_stand_2_hide;
	var_00["crouch_aim"] = %covercrouch_aim5;
	var_00["stand_aim"] = %exposed_aim_5;
	var_00["lean_aim"] = %covercrouch_lean_aim5;
	var_00["fire"] = %exposed_shoot_auto_v2;
	var_00["semi2"] = %exposed_shoot_semi2;
	var_00["semi3"] = %exposed_shoot_semi3;
	var_00["semi4"] = %exposed_shoot_semi4;
	var_00["semi5"] = %exposed_shoot_semi5;
	var_00["single"] = [%exposed_shoot_semi1];
	var_00["burst2"] = %exposed_shoot_burst3;
	var_00["burst3"] = %exposed_shoot_burst3;
	var_00["burst4"] = %exposed_shoot_burst4;
	var_00["burst5"] = %exposed_shoot_burst5;
	var_00["burst6"] = %exposed_shoot_burst6;
	var_00["blind_fire"] = animscripts\utility::func_CD8(%covercrouch_blindfire_1,%covercrouch_blindfire_2,%covercrouch_blindfire_3,%covercrouch_blindfire_4);
	var_00["reload"] = %covercrouch_reload_hide;
	var_00["grenade_safe"] = animscripts\utility::func_CD8(%covercrouch_grenadea,%covercrouch_grenadeb);
	var_00["grenade_exposed"] = animscripts\utility::func_CD8(%covercrouch_grenadea,%covercrouch_grenadeb);
	var_00["exposed_idle"] = animscripts\utility::func_CD8(%exposed_idle_alert_v1,%exposed_idle_alert_v2,%exposed_idle_alert_v3);
	var_00["look"] = animscripts\utility::func_CD8(%covercrouch_hide_look);
	level.var_CCA["soldier"]["cover_crouch"] = var_00;
	var_00 = [];
	var_00["add_aim_up"] = %coverstandaim_aim8_add;
	var_00["add_aim_down"] = %coverstandaim_aim2_add;
	var_00["add_aim_left"] = %coverstandaim_aim4_add;
	var_00["add_aim_right"] = %coverstandaim_aim6_add;
	var_00["straight_level"] = %coverstandaim_aim5;
	var_00["hide_idle"] = %coverstand_hide_idle;
	var_00["hide_idle_twitch"] = animscripts\utility::func_CD8(%coverstand_hide_idle_twitch01,%coverstand_hide_idle_twitch02,%coverstand_hide_idle_twitch03,%coverstand_hide_idle_twitch04,%coverstand_hide_idle_twitch05);
	var_00["hide_idle_flinch"] = animscripts\utility::func_CD8(%coverstand_react01,%coverstand_react02,%coverstand_react03,%coverstand_react04);
	var_00["hide_2_stand"] = %coverstand_hide_2_aim;
	var_00["stand_2_hide"] = %coverstand_aim_2_hide;
	var_00["smg_hide_2_stand"] = %smg_coverstand_hide_2_aim;
	var_00["smg_stand_2_hide"] = %smg_coverstand_aim_2_hide;
	var_00["hide_2_over"] = %coverstand_2_coverstandaim;
	var_00["over_2_hide"] = %coverstandaim_2_coverstand;
	var_00["over_aim"] = %coverstandaim_aim5;
	var_00["fire"] = %coverstandaim_autofire;
	var_00["semi2"] = %coverstandaim_fire;
	var_00["semi3"] = %coverstandaim_fire;
	var_00["semi4"] = %coverstandaim_fire;
	var_00["semi5"] = %coverstandaim_fire;
	var_00["single"] = animscripts\utility::func_CD8(%coverstandaim_fire);
	var_00["burst2"] = %coverstandaim_autofire;
	var_00["burst3"] = %coverstandaim_autofire;
	var_00["burst4"] = %coverstandaim_autofire;
	var_00["burst5"] = %coverstandaim_autofire;
	var_00["burst6"] = %coverstandaim_autofire;
	var_00["blind_fire"] = animscripts\utility::func_CD8(%coverstand_blindfire_1,%coverstand_blindfire_2);
	var_00["reload"] = %coverstand_reloada;
	var_00["look"] = animscripts\utility::func_CD8(%coverstand_look_quick,%coverstand_look_quick_v2);
	var_00["grenade_safe"] = animscripts\utility::func_CD8(%coverstand_grenadea,%coverstand_grenadeb);
	var_00["grenade_exposed"] = animscripts\utility::func_CD8(%coverstand_grenadea,%coverstand_grenadeb);
	var_00["exposed_idle"] = animscripts\utility::func_CD8(%exposed_idle_alert_v1,%exposed_idle_alert_v2,%exposed_idle_alert_v3);
	var_00["hide_to_look"] = %coverstand_look_moveup;
	var_00["look_idle"] = %coverstand_look_idle;
	var_00["look_to_hide"] = %coverstand_look_movedown;
	var_00["look_to_hide_fast"] = %coverstand_look_movedown_fast;
	level.var_CCA["soldier"]["cover_stand"] = var_00;
}

//Function Number: 2
func_229A(param_00)
{
	self endon("killanimscript");
	self.var_22BA = self.node;
	self.var_22CB = param_00;
	if(!isdefined(self.node.turret))
	{
		animscripts\cover_behavior::func_9937(0);
	}

	if(param_00 == "crouch")
	{
		func_809B("unknown");
		self.var_22BA func_4DA1();
	}
	else
	{
		func_809E("unknown");
		self.var_22BA func_4DA2();
	}

	self.var_7.var_979 = undefined;
	self method_818F("face angle",self.var_22BA.var_41[1]);
	if(isdefined(self.weapon) && animscripts\utility::func_9C26() && isdefined(self.node) && isdefined(self.node.var_99AB) && canspawnturret())
	{
		if(param_00 == "crouch")
		{
			if(func_5192(self.weapon))
			{
				var_01 = "rpd_bipod_crouch";
			}
			else
			{
				var_01 = "saw_bipod_crouch";
			}
		}
		else if(func_5192(self.weapon))
		{
			var_01 = "rpd_bipod_stand";
		}
		else
		{
			var_01 = "saw_bipod_stand";
		}

		if(func_5192(self.weapon))
		{
			var_02 = "weapon_rpd_MG_Setup";
		}
		else
		{
			var_02 = "weapon_saw_MG_Setup";
		}

		func_9C0A(var_01,var_02);
	}
	else if(isdefined(self.node) && isdefined(self.node.turret))
	{
		func_9C0D();
	}

	self method_818E("normal");
	if(param_00 == "crouch" && self.var_7.var_6E57 == "stand")
	{
		var_03 = animscripts\utility::func_C4E("stand_2_hide");
		if(animscripts\utility::func_9C33())
		{
			var_03 = animscripts\utility::func_C4E("smg_stand_2_hide");
		}

		var_04 = function_0063(var_03);
		self method_8149(var_03,%body,1,0.2,animscripts\combat_utility::func_3678());
		thread animscripts\shared::func_5F91(self.var_22BA,var_04);
		wait(var_04);
		self.var_7.var_22AB = "hide";
	}
	else
	{
		func_5881(0.4);
		if(distancesquared(self.var_2E6,self.var_22BA.var_2E6) > 1)
		{
			thread animscripts\shared::func_5F91(self.var_22BA,0.4);
			wait(0.2);
			if(param_00 == "crouch")
			{
				self.var_7.var_6E57 = "crouch";
			}

			wait(0.2);
		}
		else
		{
			wait(0.1);
		}
	}

	func_7F48();
	if(param_00 == "crouch")
	{
		if(self.var_7.var_6E57 == "prone")
		{
			animscripts\utility::func_3449(1);
		}

		self.var_7.var_6E57 = "crouch";
	}

	if(self.var_22CB == "stand")
	{
		self.var_7.var_8A14 = "cover_stand";
	}
	else
	{
		self.var_7.var_8A14 = "cover_crouch";
	}

	var_05 = spawnstruct();
	if(!self.var_180)
	{
		var_05.var_5F90 = ::animscripts\cover_behavior::func_5F90;
	}

	var_05.var_365 = ::func_22BE;
	var_05.var_5664 = ::func_6E46;
	var_05.var_25A = ::func_025A;
	var_05.var_367C = ::func_367C;
	var_05.var_4B60 = ::func_4B60;
	var_05.var_38DD = ::func_38DD;
	var_05.grenade = ::func_989D;
	var_05.var_43FE = ::func_989E;
	var_05.var_14AB = ::func_14AB;
	animscripts\cover_behavior::main(var_05);
}

//Function Number: 3
func_5192(param_00)
{
	return getsubstr(param_00,0,3) == "rpd" && param_00.size == 3 || param_00[3] == "_";
}

//Function Number: 4
func_4DA1()
{
	if(isdefined(self.var_2482))
	{
		return;
	}

	var_00 = (0,0,42);
	var_01 = anglestoforward(self.var_41);
	self.var_2482 = sighttracepassed(self.var_2E6 + var_00,self.var_2E6 + var_00 + var_01 * 64,0,undefined);
}

//Function Number: 5
func_4DA2()
{
	if(isdefined(self.var_58AB))
	{
		return;
	}

	var_00 = (0,0,48);
	var_01 = anglestoforward(self.var_41);
	self.var_58AB = sighttracepassed(self.var_2E6 + var_00,self.var_2E6 + var_00 + var_01 * 64,0,undefined);
}

//Function Number: 6
func_809B(param_00)
{
	animscripts\combat::func_7E02(self.var_22BA);
	func_80A4(param_00);
}

//Function Number: 7
func_809E(param_00)
{
	animscripts\combat::func_7E02(self.var_22BA);
	func_82AB(param_00);
}

//Function Number: 8
func_22BE()
{
	var_00 = animscripts\combat_utility::func_365(2,animscripts\utility::func_C4E("reload"));
	if(isdefined(var_00) && var_00)
	{
		return 1;
	}

	return 0;
}

//Function Number: 9
func_6E46()
{
	self.var_234 = 1;
	if(isdefined(self.var_7106) && randomfloat(1) < self.var_7106)
	{
		if(func_7101())
		{
			return 1;
		}
	}

	if(!func_6E40())
	{
		return 0;
	}

	func_83E4();
	animscripts\combat_utility::func_315D();
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
		}
	}

	func_423D();
	self.var_22A0 = undefined;
	self.var_234 = 0;
	return 1;
}

//Function Number: 10
func_83E4()
{
	self endon("return_to_cover");
	lib_A52D::func_2A4C();
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

		if(self.var_22CB == "crouch" && func_6083())
		{
			break;
		}

		func_8413();
		self method_8142(%add_fire,0.2);
	}
}

//Function Number: 11
func_8413()
{
	if(self.var_22CB == "crouch")
	{
		thread func_0B99();
	}

	thread animscripts\combat_utility::func_979();
	animscripts\combat_utility::func_8411();
}

//Function Number: 12
func_7101()
{
	if(!animscripts\utility::func_4729())
	{
		return 0;
	}

	var_00 = "rambo";
	if(randomint(10) < 2)
	{
		var_00 = "rambo_fail";
	}

	if(!animscripts\utility::func_C4F(var_00))
	{
		return 0;
	}

	if(self.var_22CB == "crouch" && !self.var_22BA.var_2482)
	{
		return 0;
	}

	var_01 = func_40C7(self.var_22BA.var_2E6 + animscripts\utility::func_404B(self.var_22BA));
	if(var_01 > 15)
	{
		return 0;
	}

	var_02 = anglestoforward(self.var_41);
	var_03 = self.var_2E6 + var_02 * -16;
	if(!self method_81C3(var_03))
	{
		return 0;
	}

	self.var_22BC = gettime();
	func_7F48();
	self.var_234 = 1;
	self.var_5184 = 1;
	self.var_7.var_6F4A = "rambo";
	self.var_1C86 = 1;
	thread animscripts\shared::func_7103(0);
	var_04 = animscripts\utility::func_C51(var_00);
	self method_8110("rambo",var_04,%body,1,0.2,1);
	func_2299(var_04);
	animscripts\shared::func_2D05("rambo");
	self notify("rambo_aim_end");
	self.var_1C86 = 0;
	self.var_234 = 0;
	self.var_55CE = gettime();
	self.var_1C86 = 0;
	self.var_5184 = undefined;
	return 1;
}

//Function Number: 13
func_4B60()
{
	self endon("end_idle");
	for(;;)
	{
		var_00 = randomint(2) == 0 && animscripts\utility::func_C4F("hide_idle_twitch");
		if(var_00)
		{
			var_01 = animscripts\utility::func_C51("hide_idle_twitch");
		}
		else
		{
			var_01 = animscripts\utility::func_C4E("hide_idle");
		}

		func_6DA9(var_01,var_00);
	}
}

//Function Number: 14
func_38DD()
{
	if(!animscripts\utility::func_C4F("hide_idle_flinch"))
	{
		return 0;
	}

	var_00 = anglestoforward(self.var_41);
	var_01 = self.var_2E6 + var_00 * -16;
	if(!self method_81C3(var_01,!self.var_425))
	{
		return 0;
	}

	func_7F48();
	self.var_234 = 1;
	var_02 = animscripts\utility::func_C51("hide_idle_flinch");
	func_6DA9(var_02,1);
	self.var_234 = 0;
	return 1;
}

//Function Number: 15
func_6DA9(param_00,param_01)
{
	if(param_01)
	{
		self method_8110("idle",param_00,%body,1,0.25,1);
	}
	else
	{
		self method_810F("idle",param_00,%body,1,0.25,1);
	}

	func_2299(param_00);
	self.var_7.var_22AB = "hide";
	animscripts\shared::func_2D05("idle");
}

//Function Number: 16
func_025A(param_00)
{
	if(!isdefined(self.var_7.var_CD8["hide_to_look"]))
	{
		return 0;
	}

	if(!func_67B6())
	{
		return 0;
	}

	animscripts\shared::func_6DBE(animscripts\utility::func_C4E("look_idle"),param_00);
	var_01 = undefined;
	if(animscripts\utility::func_51C0())
	{
		var_01 = animscripts\utility::func_C4E("look_to_hide_fast");
	}
	else
	{
		var_01 = animscripts\utility::func_C4E("look_to_hide");
	}

	self method_8110("looking_end",var_01,%body,1,0.1);
	func_2299(var_01);
	animscripts\shared::func_2D05("looking_end");
	return 1;
}

//Function Number: 17
func_67B6()
{
	if(isdefined(self.var_22BA.var_79A4))
	{
		return 0;
	}

	var_00 = animscripts\utility::func_C4E("hide_to_look");
	self method_810F("looking_start",var_00,%body,1,0.2);
	func_2299(var_00);
	animscripts\shared::func_2D05("looking_start");
	return 1;
}

//Function Number: 18
func_367C()
{
	var_00 = animscripts\utility::func_C51("look");
	self method_8110("look",var_00,%body,1,0.1);
	func_2299(var_00);
	animscripts\shared::func_2D05("look");
	return 1;
}

//Function Number: 19
func_6E41()
{
	if(self.var_7.var_22AB == "left" || self.var_7.var_22AB == "right" || self.var_7.var_22AB == "over")
	{
		return 1;
	}

	return animscripts\combat_utility::func_711C();
}

//Function Number: 20
func_6E40()
{
	var_00 = func_3F12();
	var_01 = 0.1;
	var_02 = animscripts\utility::func_C4E("hide_2_" + var_00);
	var_03 = !self.var_425;
	if(!self method_81C3(animscripts\utility::func_3EFA(var_02),var_03))
	{
		return 0;
	}

	if(self.script == "cover_crouch" && var_00 == "lean")
	{
		self.var_22A0 = 1;
	}

	if(self.var_22CB == "crouch")
	{
		func_809B(var_00);
	}
	else
	{
		func_809E(var_00);
	}

	self.var_7.var_8A14 = "none";
	self.var_8A26 = undefined;
	if(self.var_22CB == "stand")
	{
		if(animscripts\utility::func_9C33())
		{
			self.var_7.var_8A14 = "smg_cover_stand_aim";
		}
		else
		{
			self.var_7.var_8A14 = "cover_stand_aim";
		}
	}
	else
	{
		self.var_7.var_8A14 = "cover_crouch_aim";
	}

	self.var_1C86 = 1;
	self notify("done_changing_cover_pos");
	func_7F48();
	var_04 = func_6E41();
	self method_8110("pop_up",var_02,%body,1,0.1,var_04);
	thread func_2D09("pop_up");
	if(animhasnotetrack(var_02,"start_aim"))
	{
		self waittillmatch("start_aim","pop_up");
		var_01 = function_0063(var_02) / var_04 * 1 - self method_814F(var_02);
	}
	else
	{
		self waittillmatch("end","pop_up");
		var_01 = 0.1;
	}

	self method_8142(var_02,var_01 + 0.05);
	self.var_7.var_22AB = var_00;
	self.var_7.var_6F4A = var_00;
	func_803B(var_01);
	thread animscripts\track::func_950B();
	wait(var_01);
	if(animscripts\combat_utility::issniper())
	{
		thread animscripts\shoot_behavior::func_87CF();
	}

	self.var_1C86 = 0;
	self.var_22BC = gettime();
	self notify("stop_popup_donotetracks");
	return 1;
}

//Function Number: 21
func_2D09(param_00)
{
	self endon("killanimscript");
	self endon("stop_popup_donotetracks");
	animscripts\shared::func_2D05(param_00);
}

//Function Number: 22
func_803B(param_00)
{
	if(self.var_7.var_22AB == "left" || self.var_7.var_22AB == "right")
	{
		var_01 = "crouch";
	}
	else
	{
		var_01 = self.var_7.var_22AB;
	}

	self method_8147(animscripts\utility::func_C4E(var_01 + "_aim"),%body,1,param_00);
	if(var_01 == "crouch")
	{
		self method_814C(animscripts\utility::func_5860("cover_crouch","add_aim_down"),1,0);
		self method_814C(animscripts\utility::func_5860("cover_crouch","add_aim_left"),1,0);
		self method_814C(animscripts\utility::func_5860("cover_crouch","add_aim_up"),1,0);
		self method_814C(animscripts\utility::func_5860("cover_crouch","add_aim_right"),1,0);
		return;
	}

	if(var_01 == "stand")
	{
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_down"),1,0);
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_left"),1,0);
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_up"),1,0);
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_right"),1,0);
		return;
	}

	if(var_01 == "stand_tall")
	{
		self method_814C(animscripts\utility::func_5860("old_default_stand","add_aim_down"),1,0);
		self method_814C(animscripts\utility::func_5860("old_default_stand","add_aim_left"),1,0);
		self method_814C(animscripts\utility::func_5860("old_default_stand","add_aim_up"),1,0);
		self method_814C(animscripts\utility::func_5860("old_default_stand","add_aim_right"),1,0);
		return;
	}

	if(var_01 == "lean")
	{
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_down"),1,0);
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_left"),1,0);
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_up"),1,0);
		self method_814C(animscripts\utility::func_5860("default_stand","add_aim_right"),1,0);
		return;
	}

	if(var_01 == "over")
	{
		self method_814C(animscripts\utility::func_5860("cover_stand","add_aim_down"),1,0);
		self method_814C(animscripts\utility::func_5860("cover_stand","add_aim_left"),1,0);
		self method_814C(animscripts\utility::func_5860("cover_stand","add_aim_up"),1,0);
		self method_814C(animscripts\utility::func_5860("cover_stand","add_aim_right"),1,0);
		return;
	}
}

//Function Number: 23
func_423D()
{
	self notify("return_to_cover");
	self.var_1C86 = 1;
	self notify("done_changing_cover_pos");
	animscripts\combat_utility::func_3155();
	var_00 = func_6E41();
	self method_810F("go_to_hide",animscripts\utility::func_C4E(self.var_7.var_22AB + "_2_hide"),%body,1,0.2,var_00);
	self method_8142(%exposed_modern,0.2);
	animscripts\shared::func_2D05("go_to_hide");
	self.var_7.var_22AB = "hide";
	if(self.var_22CB == "stand")
	{
		self.var_7.var_8A14 = "cover_stand";
	}
	else
	{
		self.var_7.var_8A14 = "cover_crouch";
	}

	self.var_1C86 = 0;
}

//Function Number: 24
func_989E(param_00)
{
	return func_989D(param_00,1);
}

//Function Number: 25
func_989D(param_00,param_01)
{
	if(isdefined(self.var_2D33) || isdefined(param_00.var_2D2A))
	{
		return 0;
	}

	var_02 = undefined;
	if(isdefined(self.var_7106) && randomfloat(1) < self.var_7106)
	{
		var_02 = animscripts\utility::func_C51("grenade_rambo");
	}
	else if(isdefined(param_01) && param_01)
	{
		var_02 = animscripts\utility::func_C51("grenade_safe");
	}
	else
	{
		var_02 = animscripts\utility::func_C51("grenade_exposed");
	}

	func_7F48();
	self.var_234 = 1;
	var_03 = animscripts\combat_utility::func_9895(param_00,var_02);
	self.var_234 = 0;
	return var_03;
}

//Function Number: 26
func_14AB()
{
	if(!animscripts\utility::func_C4F("blind_fire"))
	{
		return 0;
	}

	func_7F48();
	self.var_234 = 1;
	self method_8110("blindfire",animscripts\utility::func_C51("blind_fire"),%body,1,0.2,1);
	animscripts\shared::func_2D05("blindfire");
	self.var_234 = 0;
	return 1;
}

//Function Number: 27
func_2449(param_00,param_01,param_02)
{
	var_03 = spawnturret("misc_turret",param_00.var_2E6,param_01);
	var_03.var_41 = param_00.var_41;
	var_03.var_98B = self;
	var_03 setmodel(param_02);
	var_03 makeusable();
	var_03 setdefaultdroppitch(0);
	if(isdefined(param_00.leftarc))
	{
		var_03.leftarc = param_00.leftarc;
	}

	if(isdefined(param_00.rightarc))
	{
		var_03.rightarc = param_00.rightarc;
	}

	if(isdefined(param_00.toparc))
	{
		var_03.toparc = param_00.toparc;
	}

	if(isdefined(param_00.bottomarc))
	{
		var_03.bottomarc = param_00.bottomarc;
	}

	return var_03;
}

//Function Number: 28
func_2852(param_00)
{
	self endon("death");
	self endon("being_used");
	wait(0.1);
	if(isdefined(param_00))
	{
		param_00 notify("turret_use_failed");
	}

	self delete();
}

//Function Number: 29
func_9C0A(param_00,param_01)
{
	var_02 = func_2449(self.node.var_99AB,param_00,param_01);
	if(self method_818A(var_02))
	{
		var_02 thread func_2852(self);
		if(isdefined(self.var_9954))
		{
			thread [[ self.var_9954 ]](var_02);
		}

		self waittill("turret_use_failed");
		return;
	}

	var_02 delete();
}

//Function Number: 30
func_9C0D()
{
	var_00 = self.node.turret;
	if(!var_00.var_519B)
	{
		return;
	}

	thread lib_A54D::func_4473(var_00);
	self waittill("continue_cover_script");
}

//Function Number: 31
func_80A4(param_00)
{
	if(animscripts\utility::func_5029())
	{
		self.var_7.var_CD8 = animscripts\utility::func_5861("free_run_cover_crouch");
		return;
	}

	self.var_7.var_CD8 = animscripts\utility::func_5861("cover_crouch");
	if(animscripts\utility::func_A2C6())
	{
		if(param_00 == "lean" || param_00 == "stand")
		{
			self.var_7.var_CD8["single"] = animscripts\utility::func_5860("shotgun_stand","single");
		}
		else
		{
			self.var_7.var_CD8["single"] = animscripts\utility::func_5860("shotgun_crouch","single");
		}
	}

	if(isdefined(level.var_7105))
	{
		self.var_7.var_CD8["rambo"] = level.var_7105.var_229D;
		self.var_7.var_CD8["rambo_fail"] = level.var_7105.var_229E;
		self.var_7.var_CD8["grenade_rambo"] = level.var_7105.var_229F;
	}
}

//Function Number: 32
func_82AB(param_00)
{
	self.var_7.var_CD8 = animscripts\utility::func_5861("cover_stand");
	if(param_00 != "over")
	{
		if(param_00 == "stand_tall" && lib_A59A::func_76FC())
		{
			var_01 = animscripts\utility::func_5861("old_default_stand");
			self.var_7.var_CD8["stand_tall_aim"] = var_01["straight_level"];
		}
		else
		{
			var_01 = animscripts\utility::func_5861("default_stand");
		}

		self.var_7.var_CD8["add_aim_left"] = var_01["add_aim_left"];
		self.var_7.var_CD8["add_aim_right"] = var_01["add_aim_right"];
		self.var_7.var_CD8["add_aim_up"] = var_01["add_aim_up"];
		self.var_7.var_CD8["add_aim_down"] = var_01["add_aim_down"];
		self.var_7.var_CD8["stand_aim"] = var_01["straight_level"];
		self.var_7.var_CD8["fire"] = var_01["fire_corner"];
		self.var_7.var_CD8["semi2"] = var_01["semi2"];
		self.var_7.var_CD8["semi3"] = var_01["semi3"];
		self.var_7.var_CD8["semi4"] = var_01["semi4"];
		self.var_7.var_CD8["semi5"] = var_01["semi5"];
		if(animscripts\utility::func_A2C6())
		{
			self.var_7.var_CD8["single"] = animscripts\utility::func_5860("shotgun_stand","single");
		}
		else
		{
			self.var_7.var_CD8["single"] = var_01["single"];
		}

		self.var_7.var_CD8["burst2"] = var_01["burst2"];
		self.var_7.var_CD8["burst3"] = var_01["burst3"];
		self.var_7.var_CD8["burst4"] = var_01["burst4"];
		self.var_7.var_CD8["burst5"] = var_01["burst5"];
		self.var_7.var_CD8["burst6"] = var_01["burst6"];
	}

	if(isdefined(level.var_7105))
	{
		self.var_7.var_CD8["rambo"] = level.var_7105.var_22C3;
		self.var_7.var_CD8["rambo_fail"] = level.var_7105.var_22C4;
		self.var_7.var_CD8["grenade_rambo"] = level.var_7105.var_22C5;
	}
}

//Function Number: 33
func_5881(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0.1;
	}

	self method_8149(animscripts\utility::func_C4E("hide_idle"),%body,1,param_00);
	self.var_7.var_22AB = "hide";
}

//Function Number: 34
func_0B99()
{
	self endon("killanimscript");
	self notify("newAngleRangeCheck");
	self endon("newAngleRangeCheck");
	self endon("return_to_cover");
	for(;;)
	{
		if(func_6083())
		{
			break;
		}

		wait(0.1);
	}

	self notify("stopShooting");
}

//Function Number: 35
func_6083()
{
	if(self.var_22CB != "crouch")
	{
		return 0;
	}

	var_00 = func_40C7(self geteye());
	if(self.var_7.var_22AB == "lean")
	{
		return var_00 < 10;
	}

	return var_00 > 45;
}

//Function Number: 36
func_3F12()
{
	var_00 = [];
	if(self.var_22CB == "stand")
	{
		if(!self.var_22BA.var_58AB && isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
		{
			var_00 = self.var_22BA method_8033();
			var_00[var_00.size] = "stand_tall";
		}
		else
		{
			var_00 = self.var_22BA method_8033();
			if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
			{
				var_00[var_00.size] = "over";
			}
			else
			{
				var_00[var_00.size] = "stand";
			}
		}
	}
	else
	{
		var_01 = func_40C7(self.var_22BA.var_2E6 + animscripts\utility::func_404B(self.var_22BA));
		if(var_01 > 30)
		{
			return "lean";
		}

		if(var_01 > 15 || !self.var_22BA.var_2482)
		{
			return "stand";
		}

		var_00 = self.var_22BA method_8033();
		var_00[var_00.size] = "crouch";
	}

	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		if(!isdefined(self.var_7.var_CD8["hide_2_" + var_00[var_02]]))
		{
			var_00[var_02] = var_00[var_00.size - 1];
			var_00[var_00.size - 1] = undefined;
			continue;
		}
	}

	return animscripts\combat_utility::func_40A2(var_00);
}

//Function Number: 37
func_40C7(param_00)
{
	var_01 = animscripts\utility::func_3F7B();
	return angleclamp180(vectortoangles(var_01 - param_00)[0]);
}

//Function Number: 38
func_7F48()
{
	if(self.var_425)
	{
		self method_818E("nogravity");
		return;
	}

	self method_818E("zonly_physics");
}

//Function Number: 39
func_2299(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "run";
	}

	self.var_35C5 = animscripts\face::func_6D98(param_00,param_01,self.var_35C5);
}

//Function Number: 40
func_2291()
{
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}