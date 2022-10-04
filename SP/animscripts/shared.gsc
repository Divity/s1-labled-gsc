/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: shared.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 33
 * Decompile Time: 1132 ms
 * Timestamp: 4/20/2022 8:20:48 PM
*******************************************************************/

//Function Number: 1
func_6866(param_00,param_01,param_02)
{
	self notify("weapon_position_change");
	var_03 = self.energyturret[param_00].var_32E;
	if(param_01 != "none" && self.var_7.var_A2D9[param_01] == param_00)
	{
		return;
	}

	func_297E();
	if(var_03 != "none")
	{
		func_2984(param_00);
	}

	if(param_01 == "none")
	{
		func_9AEE();
		return;
	}

	if(self.var_7.var_A2D9[param_01] != "none")
	{
		func_2984(self.var_7.var_A2D9[param_01]);
	}
	else if(isdefined(self.energyturret["none"]))
	{
		self.energyturret["none"].var_32E = "none";
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(param_02 && param_01 == "left" || param_01 == "right")
	{
		func_0E0C(param_00,param_01);
		self.weapon = param_00;
	}
	else
	{
		func_0E0C(param_00,param_01);
	}

	func_9AEE();
}

//Function Number: 2
func_2984(param_00)
{
	self.var_7.var_A2D9[self.energyturret[param_00].var_32E] = "none";
	self.energyturret[param_00].var_32E = "none";
}

//Function Number: 3
func_0E0C(param_00,param_01)
{
	self.energyturret[param_00].var_32E = param_01;
	self.var_7.var_A2D9[param_01] = param_00;
	if(self.var_7.var_A2DA[param_01] != "none")
	{
		self notify("end_weapon_drop_" + param_01);
		self.var_7.var_A2DA[param_01] = "none";
	}
}

//Function Number: 4
func_4165(param_00)
{
	var_01 = self.var_7.var_A2D9[param_00];
	if(var_01 == "none")
	{
		return self.var_7.var_A2DA[param_00];
	}

	return var_01;
}

//Function Number: 5
func_297E()
{
	var_00 = [];
	var_00[var_00.size] = "right";
	var_00[var_00.size] = "left";
	var_00[var_00.size] = "chest";
	var_00[var_00.size] = "back";
	self method_80B3();
	foreach(var_02 in var_00)
	{
		var_03 = func_4165(var_02);
		if(var_03 == "none")
		{
			continue;
		}

		if(weapontype(var_03) == "riotshield" && isdefined(self.var_83C1))
		{
			if(isdefined(self.var_83BB) && self.var_83BB)
			{
				playfxontag(common_scripts\utility::getfx("riot_shield_dmg"),self,"TAG_BRASS");
				self.var_83BB = undefined;
			}
		}
	}

	self method_82DC();
}

//Function Number: 6
func_9AEE()
{
	var_00 = [];
	var_01 = [];
	var_02 = [];
	var_00[var_00.size] = "right";
	var_00[var_00.size] = "left";
	var_00[var_00.size] = "chest";
	var_00[var_00.size] = "back";
	foreach(var_04 in var_00)
	{
		var_01[var_01.size] = func_4165(var_04);
		var_02[var_02.size] = func_4100(var_04);
	}

	self method_82DC(var_01[0],var_02[0],var_01[1],var_02[1],var_01[2],var_02[2],var_01[3],var_02[3]);
	foreach(var_04 in var_00)
	{
		var_07 = func_4165(var_04);
		if(var_07 == "none")
		{
			continue;
		}

		if(self.energyturret[var_07].var_9BEA && !self.energyturret[var_07].var_4720)
		{
			self hidepart("tag_clip");
		}
	}

	func_9B25();
}

//Function Number: 7
func_9B25()
{
	if(isdefined(self.var_254A))
	{
		[[ self.var_254A ]]();
		return;
	}

	if(self.var_7.var_A2D9["right"] == "none")
	{
		return;
	}

	if(func_1AFA())
	{
		self method_80B2("nvg_laser");
		return;
	}

	self method_80B3();
}

//Function Number: 8
func_1AFA()
{
	if(!self.var_7.var_54F8)
	{
		return 0;
	}

	if(animscripts\utility::func_51A0(self.weapon))
	{
		return 0;
	}

	return isalive(self);
}

//Function Number: 9
func_4100(param_00)
{
	switch(param_00)
	{
		case "chest":
			break;

		case "back":
			break;

		case "left":
			break;

		case "right":
			break;

		case "hand":
			break;

		default:
			break;
	}
}

//Function Number: 10
func_2F6A(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self.weapon;
	}

	if(param_00 == "none")
	{
		return;
	}

	if(isdefined(self.var_613C))
	{
		return;
	}

	func_297E();
	var_01 = self.energyturret[param_00].var_32E;
	if(self.var_136 && var_01 != "none")
	{
		thread func_2F9A(param_00,var_01);
	}

	func_2984(param_00);
	if(param_00 == self.weapon)
	{
		self.weapon = "none";
	}

	func_9AEE();
}

//Function Number: 11
func_2F6B()
{
	if(isdefined(self.var_613C))
	{
		return "none";
	}

	var_00 = [];
	var_00[var_00.size] = "left";
	var_00[var_00.size] = "right";
	var_00[var_00.size] = "chest";
	var_00[var_00.size] = "back";
	func_297E();
	foreach(var_02 in var_00)
	{
		var_03 = self.var_7.var_A2D9[var_02];
		if(var_03 == "none")
		{
			continue;
		}

		self.energyturret[var_03].var_32E = "none";
		self.var_7.var_A2D9[var_02] = "none";
		if(self.var_136)
		{
			thread func_2F9A(var_03,var_02);
		}
	}

	self.weapon = "none";
	func_9AEE();
}

//Function Number: 12
func_2F9A(param_00,param_01)
{
	if(self isragdoll())
	{
		return "none";
	}

	self.var_7.var_A2DA[param_01] = param_00;
	var_02 = param_00;
	if(issubstr(tolower(var_02),"rpg"))
	{
		var_02 = "rpg_player";
	}

	if(issubstr(tolower(var_02),"mahem"))
	{
		var_02 = "iw5_mahemplayer_sp_mahemscopebase";
	}

	self method_81C2(var_02,param_01,0);
	self endon("end_weapon_drop_" + param_01);
	wait(0.05);
	if(!isdefined(self))
	{
		return;
	}

	func_297E();
	self.var_7.var_A2DA[param_01] = "none";
	func_9AEE();
}

//Function Number: 13
func_2D05(param_00,param_01,param_02,param_03)
{
	for(;;)
	{
		self waittill(param_00,var_04);
		if(!isdefined(var_04))
		{
			var_04 = "undefined";
		}

		var_05 = animscripts\notetracks::func_4669(var_04,param_00,param_01,param_03);
		if(isdefined(var_05))
		{
			return var_05;
		}
	}
}

//Function Number: 14
func_4094(param_00)
{
	if(!isdefined(self.var_83F0))
	{
		if(!isdefined(self.var_8409))
		{
			return 0;
		}

		return func_3EE1(self.var_8409);
	}

	var_01 = self.var_83F0.var_2E6 + self.var_83F1 * param_00;
	return func_3EE1(var_01);
}

//Function Number: 15
func_3EE2()
{
	if(!isdefined(self.var_83F0))
	{
		if(!isdefined(self.var_8409))
		{
			return 0;
		}

		return func_3EE1(self.var_8409);
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		return func_3EE1(animscripts\combat_utility::func_3DB0(self.var_83F0));
	}

	return func_3EE1(self.var_83F0 method_8097());
}

//Function Number: 16
func_3EE0()
{
	var_00 = func_4082();
	if(self.script == "cover_crouch" && isdefined(self.var_7.var_22AB) && self.var_7.var_22AB == "lean")
	{
		var_00 = var_00 - level.var_22A1;
	}

	return var_00;
}

//Function Number: 17
func_4082()
{
	if(!isdefined(self.var_83F0))
	{
		if(!isdefined(self.var_8409))
		{
			return 0;
		}

		return animscripts\combat_utility::func_4083(self.var_8409);
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		return animscripts\combat_utility::func_4083(animscripts\combat_utility::func_3DB0(self.var_83F0));
	}

	return animscripts\combat_utility::func_4083(self.var_83F0 method_8097());
}

//Function Number: 18
func_40C6()
{
	if(isdefined(self.var_9C00))
	{
		var_00 = self method_81BA();
		return (var_00[0],var_00[1],self geteye()[2]);
	}

	if(isdefined(self.var_9BFF) && self.var_9BFF)
	{
		if(self method_8442("tag_flash") != -1)
		{
			var_01 = self gettagorigin("tag_flash");
			if(isdefined(var_01))
			{
				return var_01;
			}
		}
	}

	return (self.var_2E6[0],self.var_2E6[1],self geteye()[2]);
}

//Function Number: 19
func_3EE1(param_00)
{
	var_01 = animscripts\utility::func_4174(param_00);
	var_02 = distance(self.var_2E6,param_00);
	if(var_02 > 3)
	{
		var_03 = asin(-3 / var_02);
		var_01 = var_01 + var_03;
	}

	var_01 = angleclamp180(var_01);
	return var_01;
}

//Function Number: 20
func_7103(param_00)
{
	self endon("killanimscript");
	func_7104(param_00);
	self method_8142(%generic_aim_left,0.5);
	self method_8142(%generic_aim_right,0.5);
}

//Function Number: 21
func_7104(param_00)
{
	self endon("rambo_aim_end");
	waittillframeend;
	self method_8142(%generic_aim_left,0.2);
	self method_8142(%generic_aim_right,0.2);
	self method_814C(%generic_aim_45l,1,0.2);
	self method_814C(%generic_aim_45r,1,0.2);
	var_01 = 0.2;
	var_02 = 0;
	for(;;)
	{
		if(isdefined(self.var_8409))
		{
			var_03 = animscripts\utility::func_416E(self.var_8409) - self.var_22BA.var_41[1];
			var_03 = angleclamp180(var_03 - param_00);
			if(abs(var_03 - var_02) > 10)
			{
				if(var_03 > var_02)
				{
					var_03 = var_02 + 10;
				}
				else
				{
					var_03 = var_02 - 10;
				}
			}

			var_02 = var_03;
		}

		if(var_02 < 0)
		{
			var_04 = var_02 / -45;
			if(var_04 > 1)
			{
				var_04 = 1;
			}

			self method_814C(%generic_aim_right,var_04,var_01);
			self method_814C(%generic_aim_left,0,var_01);
		}
		else
		{
			var_04 = var_02 / 45;
			if(var_04 > 1)
			{
				var_04 = 1;
			}

			self method_814C(%generic_aim_left,var_04,var_01);
			self method_814C(%generic_aim_right,0,var_01);
		}

		wait(var_01);
	}
}

//Function Number: 22
func_2740()
{
	var_00 = 0;
	var_01 = weaponburstcount(self.weapon);
	if(var_01)
	{
		var_00 = var_01;
	}
	else if(animscripts\weaponlist::func_9C30())
	{
		var_00 = level.var_7C74[randomint(level.var_7C74.size)];
	}
	else if(self.var_3670)
	{
		var_00 = level.var_3672[randomint(level.var_3672.size)];
	}
	else
	{
		var_00 = level.var_1931[randomint(level.var_1931.size)];
	}

	if(var_00 <= self.var_18B0)
	{
		return var_00;
	}

	if(self.var_18B0 <= 0)
	{
		return 1;
	}

	return self.var_18B0;
}

//Function Number: 23
func_2741()
{
	var_00 = self.var_18B0;
	if(weaponclass(self.weapon) == "mg")
	{
		var_01 = randomfloat(10);
		if(var_01 < 3)
		{
			var_00 = randomintrange(2,6);
		}
		else if(var_01 < 8)
		{
			var_00 = randomintrange(6,12);
		}
		else
		{
			var_00 = randomintrange(12,20);
		}
	}

	return var_00;
}

//Function Number: 24
func_4658(param_00)
{
	self endon("killanimscript");
	self endon("abort_reload");
	var_01 = undefined;
	if(self.energyturret[self.weapon].var_9BEA)
	{
		var_01 = function_00DB(self.weapon);
	}

	if(self.energyturret[self.weapon].var_4720)
	{
		if(animscripts\utility::func_9C32())
		{
			self playsoundasmaster("weap_reload_pistol_clipout_npc");
		}
		else
		{
			self playsoundasmaster("weap_reload_smg_clipout_npc");
		}

		if(isdefined(var_01))
		{
			self hidepart("tag_clip");
			thread func_2F6D(var_01,"tag_clip");
			self.energyturret[self.weapon].var_4720 = 0;
			thread func_7445(var_01);
		}
	}

	self waittill(param_00,var_02);
	switch(var_02)
	{
		case "attach clip right":
		case "attach clip left":
			break;

		case "detach clip nohand":
			break;

		case "detach clip right":
		case "detach clip left":
			break;
	}
}

//Function Number: 25
func_7445(param_00,param_01)
{
	self notify("clip_detached");
	self endon("clip_detached");
	common_scripts\utility::waittill_any("killanimscript","abort_reload");
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(param_01))
	{
		self detach(param_00,param_01);
	}

	if(isalive(self))
	{
		if(self.weapon != "none" && self.energyturret[self.weapon].var_32E != "none")
		{
			self showpart("tag_clip");
		}

		self.energyturret[self.weapon].var_4720 = 1;
		return;
	}

	if(isdefined(param_01))
	{
		func_2F6D(param_00,param_01);
	}
}

//Function Number: 26
func_2F6D(param_00,param_01)
{
	var_02 = spawn("script_model",self gettagorigin(param_01));
	var_02 setmodel(param_00);
	var_02.var_41 = self gettagangles(param_01);
	var_02 physicslaunchclient(var_02.var_2E6,(0,0,0));
	wait(10);
	if(isdefined(var_02))
	{
		var_02 delete();
	}
}

//Function Number: 27
func_5F91(param_00,param_01)
{
	self endon("killanimscript");
	var_02 = param_00.var_2E6;
	var_03 = distancesquared(self.var_2E6,var_02);
	if(var_03 < 1)
	{
		self method_81C7(var_02);
		return;
	}

	if(var_03 > 256 && !self method_81C3(var_02,!self.var_425))
	{
		return;
	}

	self.var_234 = 1;
	var_04 = distance(self.var_2E6,var_02);
	var_05 = int(param_01 * 20);
	for(var_06 = 0;var_06 < var_05;var_06++)
	{
		var_02 = param_00.var_2E6;
		var_07 = self.var_2E6 - var_02;
		var_07 = vectornormalize(var_07);
		var_08 = var_02 + var_07 * var_04;
		var_09 = var_08 + var_02 - var_08 * var_06 + 1 / var_05;
		self method_81C7(var_09);
		wait(0.05);
	}

	self.var_234 = 0;
}

//Function Number: 28
func_74DF()
{
	return 1;
}

//Function Number: 29
func_6DBE(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = ::func_74DF;
	}

	for(var_03 = 0;var_03 < param_01 * 10;var_03++)
	{
		if(isalive(self.enemy))
		{
			if(animscripts\utility::func_1AE1() && [[ param_02 ]]())
			{
				return;
			}
		}

		if(animscripts\utility::func_51C0() && [[ param_02 ]]())
		{
			return;
		}

		self method_8147(param_00,%body,1,0.1);
		wait(0.1);
	}
}

//Function Number: 30
func_9333(param_00)
{
	self endon("killanimscript");
	func_6866(self.secondaryweapon,"right");
	lib_A52D::func_2A4C();
}

//Function Number: 31
func_7668()
{
	var_00 = func_766A();
	if(var_00 == 0)
	{
		return;
	}

	self endon("death");
	for(;;)
	{
		level waittill("an_enemy_shot",var_01);
		if(var_01 != self)
		{
			continue;
		}

		if(!isdefined(var_01.enemy))
		{
			continue;
		}

		if(var_01.enemy != level.var_31D)
		{
			continue;
		}

		if(isdefined(level.var_243A) && level.var_243A == 0)
		{
			continue;
		}

		thread func_7669();
		var_00--;
		if(var_00 <= 0)
		{
			return;
		}
	}
}

//Function Number: 32
func_766A()
{
	var_00 = lib_A59A::func_3F56();
	switch(var_00)
	{
		case "gimp":
		case "easy":
			break;

		case "difficult":
		case "hard":
		case "medium":
			break;

		case "fu":
			break;
	}
}

//Function Number: 33
func_7669()
{
	var_00 = missilecreaterepulsorent(level.var_31D,5000,800);
	wait(4);
	missiledeleteattractor(var_00);
}