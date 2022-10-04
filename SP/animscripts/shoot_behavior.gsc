/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: shoot_behavior.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 27
 * Decompile Time: 893 ms
 * Timestamp: 4/20/2022 8:20:49 PM
*******************************************************************/

//Function Number: 1
func_2742(param_00)
{
	self endon("killanimscript");
	self notify("stop_deciding_how_to_shoot");
	self endon("stop_deciding_how_to_shoot");
	self endon("death");
	lib_A52D::func_744D();
	self.var_8408 = param_00;
	self.var_83F0 = undefined;
	self.var_8409 = undefined;
	self.var_840F = "none";
	self.var_3670 = 0;
	self.var_84A1 = undefined;
	if(!isdefined(self.var_1C86))
	{
		self.var_1C86 = 0;
	}

	var_01 = isdefined(self.var_22BA) && self.var_22BA.type != "Cover Prone" && self.var_22BA.type != "Conceal Prone";
	if(var_01)
	{
		wait(0.05);
	}

	var_02 = self.var_83F0;
	var_03 = self.var_8409;
	var_04 = self.var_840F;
	if(!isdefined(self.var_46F3))
	{
		self.var_7.var_54F8 = 1;
		animscripts\shared::func_9B25();
	}

	if(animscripts\combat_utility::issniper())
	{
		func_745A();
	}

	if(var_01 && !self.var_7.var_D83 || !animscripts\utility::func_1AE1())
	{
		thread func_A21A();
	}

	thread func_76E3();
	self.var_B69 = undefined;
	for(;;)
	{
		if(isdefined(self.var_840B))
		{
			if(!isdefined(self.enemy))
			{
				self.var_8409 = self.var_840B;
				self.var_840B = undefined;
				func_9FFA();
			}
			else
			{
				self.var_840B = undefined;
			}
		}

		var_05 = undefined;
		if(self.weapon == "none")
		{
			func_6144();
		}
		else if(animscripts\utility::func_9C2E())
		{
			var_05 = func_766B();
		}
		else if(animscripts\utility::func_9C32() || isdefined(self.var_B0F))
		{
			var_05 = func_682D();
		}
		else
		{
			var_05 = func_750D();
		}

		if(isdefined(self.var_7.var_8A30))
		{
			[[ self.var_7.var_8A30 ]]();
		}

		if(func_1CF7(var_02,self.var_83F0) || !isdefined(self.var_83F0) && func_1CF7(var_03,self.var_8409) || func_1CF7(var_04,self.var_840F))
		{
			self notify("shoot_behavior_change");
		}

		var_02 = self.var_83F0;
		var_03 = self.var_8409;
		var_04 = self.var_840F;
		if(!isdefined(var_05))
		{
			func_9FFA();
		}
	}
}

//Function Number: 2
func_9FFA()
{
	self endon("enemy");
	self endon("done_changing_cover_pos");
	self endon("weapon_position_change");
	self endon("enemy_visible");
	if(isdefined(self.var_83F0))
	{
		self.var_83F0 endon("death");
		self endon("do_slow_things");
		wait(0.05);
		while(isdefined(self.var_83F0))
		{
			if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
			{
				self.var_8409 = animscripts\combat_utility::func_3DB0(self.var_83F0);
				continue;
			}

			self.var_8409 = self.var_83F0 method_8097();
			wait(0.05);
		}

		return;
	}

	self waittill("do_slow_things");
}

//Function Number: 3
func_6144()
{
	self.var_83F0 = undefined;
	self.var_8409 = undefined;
	self.var_840F = "none";
	self.var_8408 = "normal";
}

//Function Number: 4
func_84B0()
{
	return !animscripts\combat_utility::issniper() && !animscripts\utility::func_51A0(self.weapon);
}

//Function Number: 5
func_84A3()
{
	if(!animscripts\utility::func_1AE1())
	{
		return 0;
	}

	if(!isdefined(self.var_22BA) && !self method_81BD())
	{
		return 0;
	}

	return 1;
}

//Function Number: 6
func_750F()
{
	if(!func_84A3())
	{
		if(animscripts\combat_utility::issniper())
		{
			func_745A();
		}

		if(self.var_12F)
		{
			self.var_8408 = "ambush";
			return "retry";
		}

		if(!isdefined(self.enemy))
		{
			func_475D();
			return;
		}

		func_59AE();
		if((self.var_34B || randomint(5) > 0) && func_84B0())
		{
			self.var_8408 = "suppress";
		}
		else
		{
			self.var_8408 = "ambush";
		}

		return "retry";
	}

	func_8003();
	func_8006();
}

//Function Number: 7
func_7510(param_00)
{
	if(!param_00)
	{
		func_475D();
		return;
	}

	self.var_83F0 = undefined;
	self.var_8409 = animscripts\utility::func_3F7C();
	func_8005();
}

//Function Number: 8
func_750E(param_00)
{
	self.var_840F = "none";
	self.var_83F0 = undefined;
	if(!param_00)
	{
		func_3EED();
		if(func_84AE())
		{
			self.var_B69 = undefined;
			self notify("return_to_cover");
			self.var_84A1 = 1;
			return;
		}

		return;
	}

	self.var_8409 = animscripts\utility::func_3F7C();
	if(func_84AE())
	{
		self.var_B69 = undefined;
		if(func_84B0())
		{
			self.var_8408 = "suppress";
		}

		if(randomint(3) == 0)
		{
			self notify("return_to_cover");
			self.var_84A1 = 1;
		}

		return "retry";
	}
}

//Function Number: 9
func_3EED()
{
	if(isdefined(self.enemy) && self method_81BE(self.enemy))
	{
		func_8003();
		return;
	}

	var_00 = self method_8192();
	if(!isdefined(var_00))
	{
		if(isdefined(self.var_22BA))
		{
			var_00 = self.var_22BA.var_41;
		}
		else if(isdefined(self.var_B6A))
		{
			var_00 = self.var_B6A.var_41;
		}
		else if(isdefined(self.enemy))
		{
			var_00 = vectortoangles(self sentient_lastknownpos(self.enemy) - self.var_2E6);
		}
		else
		{
			var_00 = self.var_41;
		}
	}

	var_01 = 1024;
	if(isdefined(self.enemy))
	{
		var_01 = distance(self.var_2E6,self.enemy.var_2E6);
	}

	var_02 = self geteye() + anglestoforward(var_00) * var_01;
	if(!isdefined(self.var_8409) || distancesquared(var_02,self.var_8409) > 25)
	{
		self.var_8409 = var_02;
	}
}

//Function Number: 10
func_750D()
{
	if(self.var_8408 == "normal")
	{
		func_750F();
		return;
	}

	if(func_84A3())
	{
		self.var_8408 = "normal";
		self.var_B69 = undefined;
		return "retry";
	}

	func_59AE();
	if(animscripts\combat_utility::issniper())
	{
		func_745A();
	}

	var_00 = animscripts\utility::func_1AEF();
	if(self.var_8408 == "suppress" || self.inliveplayerkillstreak == "allies" && !isdefined(self.enemy) && !var_00)
	{
		func_7510(var_00);
		return;
	}

	func_750E(var_00);
}

//Function Number: 11
func_84AE()
{
	if(!isdefined(self.var_B69))
	{
		if(self method_813D())
		{
			self.var_B69 = gettime() + randomintrange(10000,60000);
		}
		else
		{
			self.var_B69 = gettime() + randomintrange(4000,10000);
		}
	}

	return self.var_B69 < gettime();
}

//Function Number: 12
func_766B()
{
	if(!func_84A3())
	{
		func_59AE();
		func_475D();
		return;
	}

	func_8003();
	func_8004("single",0);
	var_00 = lengthsquared(self.var_2E6 - self.var_8409);
	if(var_00 < squared(512))
	{
		self notify("return_to_cover");
		self.var_84A1 = 1;
	}
}

//Function Number: 13
func_682D()
{
	if(self.var_8408 == "normal")
	{
		if(!func_84A3())
		{
			if(!isdefined(self.enemy))
			{
				func_475D();
				return;
			}

			func_59AE();
			self.var_8408 = "ambush";
			return "retry";
		}

		func_8003();
		func_8004("single",0);
		return;
	}

	if(func_84A3())
	{
		self.var_8408 = "normal";
		self.var_B69 = undefined;
		return "retry";
	}

	func_59AE();
	self.var_83F0 = undefined;
	self.var_840F = "none";
	self.var_8409 = animscripts\utility::func_3F7C();
	if(!isdefined(self.var_B69))
	{
		self.var_B69 = gettime() + randomintrange(4000,8000);
	}

	if(self.var_B69 < gettime())
	{
		self.var_8408 = "normal";
		self.var_B69 = undefined;
		return "retry";
	}
}

//Function Number: 14
func_59AE()
{
	if(isdefined(self.enemy) && !self.var_1C86 && self.script != "combat")
	{
		if(isai(self.enemy) && isdefined(self.enemy.script) && self.enemy.script == "cover_stand" || self.enemy.script == "cover_crouch")
		{
			if(isdefined(self.enemy.var_7.var_22AB) && self.enemy.var_7.var_22AB == "hide")
			{
				return;
			}
		}

		self.var_223B = self.enemy.var_2E6;
	}
}

//Function Number: 15
func_A21A()
{
	self endon("killanimscript");
	self endon("stop_deciding_how_to_shoot");
	for(;;)
	{
		self waittill("suppression");
		if(self.var_41F > self.var_8FE6)
		{
			if(func_71E4())
			{
				self notify("return_to_cover");
				self.var_84A1 = 1;
			}
		}
	}
}

//Function Number: 16
func_71E4()
{
	if(self.var_1C86)
	{
		return 0;
	}

	if(!isdefined(self.enemy) || !self method_81BE(self.enemy))
	{
		return 1;
	}

	if(gettime() < self.var_22BC + 800)
	{
		return 0;
	}

	if(isplayer(self.enemy) && self.enemy.health < self.enemy.var_275 * 0.5)
	{
		if(gettime() < self.var_22BC + 3000)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 17
func_76E3()
{
	self endon("death");
	common_scripts\utility::waittill_any("killanimscript","stop_deciding_how_to_shoot");
	self.var_7.var_54F8 = 0;
	animscripts\shared::func_9B25();
}

//Function Number: 18
func_1CF7(param_00,param_01)
{
	if(isdefined(param_00) != isdefined(param_01))
	{
		return 1;
	}

	if(!isdefined(param_01))
	{
		return 0;
	}

	return param_00 != param_01;
}

//Function Number: 19
func_8003()
{
	self.var_83F0 = self.enemy;
	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		if(isdefined(self.var_329F) && self.var_329F == self.enemy)
		{
			self.var_8409 = self.var_83F0 method_8097();
			return;
		}

		self.var_8409 = animscripts\combat_utility::func_3DB0(self.var_83F0);
		return;
	}

	self.var_8409 = self.var_83F0 method_8097();
}

//Function Number: 20
func_475D()
{
	self.var_83F0 = undefined;
	self.var_8409 = undefined;
	self.var_840F = "none";
	if(self.var_12F)
	{
		self.var_8408 = "ambush";
	}

	if(!self.var_1C86)
	{
		self notify("return_to_cover");
		self.var_84A1 = 1;
	}
}

//Function Number: 21
func_8480()
{
	return level.gameskill == 3 && isplayer(self.enemy);
}

//Function Number: 22
func_8006()
{
	if(isdefined(self.var_83F0.enemy) && isdefined(self.var_83F0.enemy.var_427))
	{
		return func_8004("single",0);
	}

	if(animscripts\combat_utility::issniper())
	{
		return func_8004("single",0);
	}

	if(animscripts\utility::func_51A0(self.weapon))
	{
		if(animscripts\utility::func_A2C6())
		{
			return func_8004("single",0);
		}
		else
		{
			return func_8004("semi",0);
		}
	}

	if(weaponclass(self.weapon) == "grenade")
	{
		return func_8004("single",0);
	}

	if(weaponburstcount(self.weapon) > 0)
	{
		return func_8004("burst",0);
	}

	if((isdefined(self.juggernaut) && self.juggernaut) || isdefined(self.var_5A77) && self.var_5A77)
	{
		return func_8004("full",1);
	}

	var_00 = distancesquared(self method_8097(),self.var_8409);
	var_01 = weaponclass(self.weapon) == "mg";
	if(self.var_34B && var_01)
	{
		return func_8004("full",0);
	}

	if(var_00 < 62500)
	{
		if(isdefined(self.var_83F0) && isdefined(self.var_83F0.var_58D4))
		{
			return func_8004("single",0);
		}
		else
		{
			return func_8004("full",0);
		}
	}
	else if(var_00 < 810000 || func_8480())
	{
		if(weaponissemiauto(self.weapon) || func_848B())
		{
			return func_8004("semi",1);
		}
		else
		{
			return func_8004("burst",1);
		}
	}
	else if(self.var_34B || var_01 || var_00 < 2560000)
	{
		if(func_848B())
		{
			return func_8004("semi",0);
		}
		else
		{
			return func_8004("burst",0);
		}
	}

	return func_8004("single",0);
}

//Function Number: 23
func_8005()
{
	var_00 = distancesquared(self method_8097(),self.var_8409);
	if(weaponissemiauto(self.weapon))
	{
		if(var_00 < 2560000)
		{
			return func_8004("semi",0);
		}

		return func_8004("single",0);
	}

	if(weaponclass(self.weapon) == "mg")
	{
		return func_8004("full",0);
	}

	if(self.var_34B || var_00 < 2560000)
	{
		if(func_848B())
		{
			return func_8004("semi",0);
		}
		else
		{
			return func_8004("burst",0);
		}
	}

	return func_8004("single",0);
}

//Function Number: 24
func_8004(param_00,param_01)
{
	self.var_840F = param_00;
	self.var_3670 = param_01;
}

//Function Number: 25
func_848B()
{
	if(weaponclass(self.weapon) != "rifle")
	{
		return 0;
	}

	if(self.inliveplayerkillstreak != "allies")
	{
		return 0;
	}

	var_00 = animscripts\utility::func_77C8(int(self.var_2E6[1]),10000) + 2000;
	var_01 = int(self.var_2E6[0]) + gettime();
	return var_01 % 2 * var_00 > var_00;
}

//Function Number: 26
func_745A()
{
	self.var_882C = 0;
	self.var_87FD = 0;
	thread func_87CF();
}

//Function Number: 27
func_87CF()
{
	self endon("killanimscript");
	self endon("enemy");
	self endon("return_to_cover");
	self notify("new_glint_thread");
	self endon("new_glint_thread");
	if(isdefined(self.var_2ACE) && self.var_2ACE)
	{
		return;
	}

	if(!isdefined(level._effect["sniper_glint"]))
	{
		return;
	}

	if(!isalive(self.enemy))
	{
		return;
	}

	var_00 = common_scripts\utility::getfx("sniper_glint");
	wait(0.2);
	for(;;)
	{
		if(self.weapon == self.alias && animscripts\combat_utility::func_6BFC())
		{
			if(distancesquared(self.var_2E6,self.enemy.var_2E6) > 65536)
			{
				playfxontag(var_00,self,"tag_flash");
			}

			var_01 = randomfloatrange(3,5);
			wait(var_01);
		}

		wait(0.2);
	}
}