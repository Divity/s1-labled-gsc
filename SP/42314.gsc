/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42314.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 70
 * Decompile Time: 32 ms
 * Timestamp: 4/20/2022 8:23:18 PM
*******************************************************************/

//Function Number: 1
lib_A54A::main()
{
	if(isdefined(level.var_5AB5))
	{
		return;
	}

	level.var_5AB5 = 1;
	level.var_5EB = spawnstruct();
	level.var_5EB.var_6281 = 0;
	level.var_5EB.var_6282 = 0;
	if(!isdefined(level.var_8F7D))
	{
		level.var_8F7D = [];
	}

	level.var_8F7D["mech"] = ::lib_A54A::func_8F7A;
	if(!getdvarint("r_reflectionProbeGenerate"))
	{
		lib_A54B::main();
	}

	precacheitem("mech_rocket");
	precacheitem("mech_rocket_deploy");
	precachemodel("npc_exo_armor_minigun_whole");
	precachemodel("npc_exo_armor_minigun_barrel");
	precachemodel("npc_exo_armor_minigun_handle");
	level.var_5A97["rocket_muzzle_flash"] = loadfx("vfx/muzzleflash/exo_armor_rocket_flash_wv");
	level.var_5A97["rocket_seperation"] = loadfx("vfx/muzzleflash/exo_armor_rocket_burst");
	level.var_5A97["bullet_hit_sparks"] = loadfx("vfx/weaponimpact/metal_spark_fountain_small");
	level.var_5A97["bullet_hit_sparks_large"] = loadfx("vfx/weaponimpact/metal_spark_fountain_large");
	level.var_5A97["rocket_trail_0"] = loadfx("vfx/trail/exo_armor_rocket_trail_a");
	level.var_5A97["rocket_trail_1"] = loadfx("vfx/trail/exo_armor_rocket_trail_b");
	level.var_5A97["rocket_trail_2"] = loadfx("vfx/trail/exo_armor_rocket_trail_c");
}

//Function Number: 2
lib_A54A::func_8F7A()
{
	lib_A54A::func_4D11();
	self.var_5A77 = 1;
	self.var_758E = 0;
	self.var_3065 = 0;
	self.var_91BB = 0;
	self.var_5B20 = 1;
	self.var_6652 = 200;
	self.var_6651 = 100;
	self.var_664F = 4;
	self.var_6650 = 1;
	self.var_6653 = 0.2;
	self.var_C4D = "mech";
	self.script_animation = "mech";
	if(animscripts\utility::func_95B("exo_minigun"))
	{
		self attach("npc_exo_armor_minigun_barrel","TAG_BARREL");
		self attach("npc_exo_armor_minigun_handle","TAG_HANDLE");
		self method_814B(%s1_mechgun,1,1,1);
	}

	if(animscripts\utility::func_95B("exo_minigun_scaled"))
	{
		self attach("npc_exo_armor_minigun_barrel","TAG_BARREL");
		self attach("npc_exo_armor_minigun_handle","TAG_HANDLE");
		self method_814B(%s1_mechgun,1,1,1);
	}

	level.var_78A9["generic"]["patrol_idle_mech"] = %mech_unaware_idle;
	level.var_78A9["generic"]["patrol_walk_mech"] = %mech_unaware_walk;
	level.var_78A9["generic"]["patrol_stop_mech"] = %mech_unaware_walk_stop;
	level.var_78A9["generic"]["patrol_start_mech"] = %mech_unaware_walk_start;
	level.var_78A9["generic"]["patrol_walk_weights"] = %mech_unaware_walk;
	self method_81CA("stand");
	self.var_275 = self.health;
	self.var_285 = 100;
	self.var_50E = 500;
	self.var_50F = self.var_50E;
	self.var_1D3 = 0;
	self.var_2D64 = 0.05;
	self.var_8A8 = 1;
	self.var_202 = 1;
	self.var_6106 = 1;
	self.var_6160 = 1;
	self.var_2AF6 = 1;
	self.var_C8 = "no_cover";
	self.var_6094 = 1;
	self.var_623C = undefined;
	self.var_97 = 0;
	self.var_38A6 = 1;
	self.var_849D = 0;
	self.var_6162 = 1;
	self.var_9BFF = 1;
	self.var_1359 = 1;
	self.var_978 = 20;
	self.var_2B23 = 1;
	self.var_2D37 = 1;
	self.var_5B7F = 9216;
	self method_84E3();
	self.var_8B08 = 0.2;
	self.var_A134 = 0.07;
	self.var_76D0 = 0.5;
	self.var_8B05 = 0.2;
	self.var_A131 = 0.6;
	self.var_76DD = 0.4;
	self.var_97C = 2;
	self.var_8B07 = 1.5;
	self.var_A133 = 1.5;
	self.var_76DF = 0.2;
	self.var_8B06 = [-25,35,45,-45];
	self.var_A132 = [-25,35,45,-45];
	self.var_76DE = [-25,35,45,-45];
	if(!isdefined(self.var_E56))
	{
		self.var_E56 = 6;
	}

	if(!isdefined(self.var_7405))
	{
		self.var_7405 = 3;
	}

	self.var_54BE = 600;
	self method_84FB(0);
	self.var_7B38 = common_scripts\utility::spawn_tag_origin();
	self.var_7B38.type = "scripted_arrival_ent";
	self.var_7B38.var_D27 = "stand";
	thread common_scripts\utility::delete_on_death(self.var_7B38);
	lib_A59A::func_2AD9();
	lib_A59A::func_2A8F();
	self.var_1D4 = 0;
	self.var_6161 = 1;
	lib_A59A::func_749(::animscripts\pain::func_7F0);
	lib_A59A::func_749(::lib_A577::func_6648);
	lib_A59A::func_749(::lib_A54A::func_5AAD);
	lib_A59A::func_749(::lib_A54A::func_5ACD);
	lib_A59A::func_749(::lib_A54A::func_5AB1);
	thread lib_A571::func_591C();
	self.var_3068 = ::lib_A54A::func_5A89;
	thread lib_A54A::func_5B07();
	thread lib_A54A::func_5AC8();
	thread lib_A54A::func_5AC3();
	thread lib_A54A::func_5B01();
	thread lib_A54A::func_5ACE();
	if(isdefined(level.var_5AA1))
	{
		[[ level.var_5AA1 ]](self);
	}

	if(!self method_813D())
	{
		return;
	}

	self.var_18A8 = 40;
	lib_A59A::func_749(::lib_A577::func_18A8);
	lib_A59A::func_749(::lib_A54A::func_5AFF);
	self.var_2FB = 64;
	self.var_2FC = 128;
	level notify("mech_spawned");
	self waittill("death",var_00,var_01,var_02);
	lib_A54A::func_5A84();
	if(isdefined(self) && isdefined(self.var_613C))
	{
		var_03 = [];
		var_03[var_03.size] = "left";
		var_03[var_03.size] = "right";
		var_03[var_03.size] = "chest";
		var_03[var_03.size] = "back";
		animscripts\shared::func_297E();
		foreach(var_05 in var_03)
		{
			var_02 = self.var_7.var_A2D9[var_05];
			if(var_02 == "none")
			{
				continue;
			}

			self.energyturret[var_02].var_32E = "none";
			self.var_7.var_A2D9[var_05] = "none";
		}

		self.weapon = "none";
		animscripts\shared::func_9AEE();
	}

	level notify("mech_died");
	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(var_00))
	{
		return;
	}

	if(!isplayer(var_00))
	{
	}
}

//Function Number: 3
lib_A54A::func_5ADD(param_00)
{
	self method_81A5(param_00);
	self.var_7B38.var_2E6 = param_00.var_2E6;
	self.var_7B38.var_41 = param_00.var_41;
	self.var_3AA = self.var_7B38;
}

//Function Number: 4
lib_A54A::func_6FEA()
{
	self endon("death");
	self endon("melee_complete");
	for(;;)
	{
		self waittill("meleeAnim",var_00);
		if(!isdefined(var_00))
		{
			var_00 = "undefined";
		}

		if(var_00 == "fire")
		{
			if(isdefined(self.enemy))
			{
				var_01 = self method_81E9();
				if(isai(var_01))
				{
					var_01 dodamage(999999999,self.var_2E6,self,self,"MOD_MELEE");
				}
			}

			continue;
		}

		if(var_00 == "end" || var_00 == "stop")
		{
			return;
		}
		else
		{
			animscripts\notetracks::func_4669(var_00,"meleeAnim");
		}
	}
}

//Function Number: 5
lib_A54A::func_5A88()
{
	self method_818E("zonly_physics");
	var_00 = vectortoyaw(self.enemy.var_2E6 - self.var_2E6);
	var_01 = angleclamp180(self.var_41[1] - var_00);
	if(var_01 < -90)
	{
		var_02 = self.var_2E6 + self.var_2E6 - self.enemy.var_2E6;
		self method_818F("face point",var_02);
		var_03 = %mech_stand_melee_left;
	}
	else if(var_03 > 90)
	{
		var_02 = self.var_2E6 + self.var_2E6 - self.enemy.var_2E6;
		self method_818F("face point",var_02);
		var_03 = %mech_stand_melee_right;
	}
	else
	{
		self method_818F("face point",self.enemy.var_2E6);
		var_03 = %mech_stand_melee_front;
	}

	self method_8110("meleeAnim",var_03,%body,1,0.5,1);
	var_04 = function_0063(var_03);
	thread lib_A54A::func_6FEA();
	thread lib_A54A::func_52FC();
	wait(var_04);
	self notify("stop_kill_clipping_enemy");
}

//Function Number: 6
lib_A54A::func_52FC()
{
	self endon("stop_kill_clipping_enemy");
	self endon("death");
	for(;;)
	{
		if(isdefined(self.enemy) && distance(self.var_2E6,self.enemy.var_2E6) < 32 && !isplayer(self.enemy))
		{
			self.enemy dodamage(999999999,self.var_2E6,self,self,"MOD_MELEE");
		}

		wait 0.05;
	}
}

//Function Number: 7
lib_A54A::func_5AC4()
{
	self method_818E("none");
	self method_8142(%body,0.2);
	self.var_7.var_5F58 = "stop";
	self method_818F("face default");
	var_00 = self method_813C();
	if(isdefined(var_00))
	{
		self method_81C6(var_00,self.var_41);
	}
	else
	{
	}

	self notify("melee_complete");
}

//Function Number: 8
lib_A54A::func_5A84()
{
	if(isdefined(self) && isdefined(self.var_5A77) && self.var_5A77)
	{
		self hidepart("TAG_BARREL","npc_exo_armor_minigun_barrel");
		self hidepart("TAG_HANDLE","npc_exo_armor_minigun_handle");
		self detach("npc_exo_armor_minigun_barrel","TAG_BARREL");
		self detach("npc_exo_armor_minigun_handle","TAG_HANDLE");
	}
}

//Function Number: 9
lib_A54A::func_5AC8()
{
	self endon("death");
	var_00 = 0;
	for(;;)
	{
		if(animscripts\utility::func_5121() && !var_00)
		{
			var_00 = 1;
		}

		if(!animscripts\utility::func_5121() && var_00)
		{
			var_00 = 0;
		}

		wait(0.25);
	}
}

//Function Number: 10
lib_A54A::func_5ACE()
{
	self endon("death");
	if(!isdefined(self.var_5B20) || isdefined(self.var_5B20) && !self.var_5B20)
	{
		return;
	}

	if(isdefined(self.var_6652))
	{
		self.var_285 = self.var_6652;
	}

	for(;;)
	{
		if(self.var_285 < self.var_6652)
		{
			self.var_285 = self.var_285 + self.var_6650;
		}

		if(isdefined(self.var_5B20) && !self.var_5B20)
		{
			break;
		}

		if(isdefined(self.var_6653) && self.var_6653 > 0)
		{
			wait(self.var_6653);
			continue;
		}

		wait(0.2);
	}
}

//Function Number: 11
lib_A54A::func_5ACD(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(self.var_5B20) && self.var_5B20 && param_04 == "MOD_RIFLE_BULLET" || param_04 == "MOD_PISTOL_BULLET" && param_01 == level.var_31D)
	{
		if(self.var_285 > self.var_6651)
		{
			self.var_285 = self.var_285 - self.var_664F;
		}
	}
}

//Function Number: 12
lib_A54A::func_5AB1(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = 0;
	if(isdefined(self.var_18A8))
	{
		var_07 = self.var_18A8;
	}

	if(isdefined(self.var_72A3) && self.var_72A3 > 0 && param_01 != level.var_31D)
	{
		if(self.health > 0 && param_00 > var_07)
		{
			self.health = self.health + int(param_00 - var_07 * self.var_72A3);
			return;
		}

		return;
	}

	if(self.var_FE == "head")
	{
		if(self.health > 0)
		{
			self.health = self.health + int(param_00 - var_07 * 0.25);
			return;
		}
	}
}

//Function Number: 13
lib_A54A::func_5015()
{
	return isdefined(self.script) && self.script == "scripted";
}

//Function Number: 14
lib_A54A::func_5B01()
{
	self endon("stop_mech_turn_loop");
	var_00 = (1,0,0);
	var_01 = self.movemode;
	var_02 = animscripts\utility::func_5121();
	for(;;)
	{
		if(!function_0294(self) && isdefined(self))
		{
			if((isdefined(self.script) && self.script == "death") || !isalive(self))
			{
				self method_814B(%idle_combat,0,1,1,1);
				self method_814C(%mech_combat_idle,0,0.2,1);
				break;
			}
		}
		else
		{
			break;
		}

		if(lib_A54A::func_5015())
		{
		}
		else if(self.movemode == "stop" || self.movemode == "stop soon" && isdefined(self.var_8B08))
		{
			self.var_4CB = self.var_8B08;
			self.var_974 = self.var_8B05;
			self.var_8F18 = self.var_8B07;
			self.var_251 = self.var_8B06[0];
			self.var_37F = self.var_8B06[1];
			self.var_4E0 = self.var_8B06[2];
			self.var_134 = self.var_8B06[3];
		}
		else if(self.movemode == "walk" && isdefined(self.var_A134))
		{
			self.var_4CB = self.var_A134;
			self.var_974 = self.var_A131;
			self.var_8F18 = self.var_A133;
			self.var_251 = self.var_A132[0];
			self.var_37F = self.var_A132[1];
			self.var_4E0 = self.var_A132[2];
			self.var_134 = self.var_A132[3];
		}
		else if(self.movemode == "run" && isdefined(self.var_76D0))
		{
			self.var_4CB = self.var_76D0;
			self.var_974 = self.var_76DD;
			self.var_8F18 = self.var_76DF;
			self.var_251 = self.var_76DE[0];
			self.var_37F = self.var_76DE[1];
			self.var_4E0 = self.var_76DE[2];
			self.var_134 = self.var_76DE[3];
		}
		else
		{
		}

		if(var_02 != animscripts\utility::func_5121() || self.movemode != var_01)
		{
			if(self.movemode == "stop" && animscripts\utility::func_5121() && self.script != "scripted")
			{
				self method_814B(%idle_combat,1,1,1,1);
				self method_814C(%mech_combat_idle,0.5,0.2,1);
			}
			else
			{
				self method_814B(%idle_combat,0,1,1,1);
				self method_814C(%mech_combat_idle,0,0.2,1);
			}

			var_02 = animscripts\utility::func_5121();
			var_01 = self.movemode;
		}

		wait(0.05);
	}
}

//Function Number: 15
lib_A54A::func_5B07()
{
	self endon("wait_drop_end");
	self waittill("weapon_dropped",var_00);
	if(isdefined(var_00) && var_00.classname == "weapon_exo_minigun")
	{
		var_00 setmodel("npc_exo_armor_minigun_whole");
		var_00 makeunusable();
	}
}

//Function Number: 16
lib_A54A::func_5AAD(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(param_04 == "MOD_RIFLE_BULLET" || param_04 == "MOD_PISTOL_BULLET")
	{
		if(isplayer(param_01) && isdefined(self.var_54BE) && common_scripts\utility::distance_2d_squared(self.var_2E6,param_01.var_2E6) > self.var_54BE * self.var_54BE)
		{
			playfx(level.var_5A97["bullet_hit_sparks_large"],param_03,param_02 * -1,(0,0,1));
			return;
		}

		playfx(level.var_5A97["bullet_hit_sparks"],param_03,param_02 * -1,(0,0,1));
	}
}

//Function Number: 17
lib_A54A::func_5A7E(param_00,param_01)
{
	var_02 = anglestoforward(self.var_41);
	param_01 = vectornormalize(param_01);
	var_03 = -2 * vectordot(param_01,var_02) * var_02 + param_01;
	playfx(level.var_5A97["bullet_ricochet"],param_00,var_03,(0,0,1));
}

//Function Number: 18
lib_A54A::func_5B05()
{
	self endon("death");
	for(;;)
	{
		if(self.health < self.var_275 / 2)
		{
			if(self method_8442("tag_vfx_chest_light") != -1)
			{
			}
			else
			{
			}

			break;
		}

		wait(0.5);
	}

	for(;;)
	{
		if(self.health < self.var_275 / 4)
		{
			if(self method_8442("tag_vfx_chest_light") != -1)
			{
			}
			else
			{
			}

			break;
		}

		wait(0.5);
	}
}

//Function Number: 19
lib_A54A::func_5AB9()
{
	if(isdefined(self.var_519E) && self.var_519E)
	{
		return 1;
	}

	return 0;
}

//Function Number: 20
lib_A54A::func_5AED()
{
	self.var_91BB = 1;
}

//Function Number: 21
lib_A54A::func_5AF5()
{
	self.var_91BB = 0;
}

//Function Number: 22
lib_A54A::func_5AEC(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	thread lib_A54A::func_5AD8(param_00,param_01,param_02,param_03,param_04,param_05,param_06);
}

//Function Number: 23
lib_A54A::func_5AF4()
{
	self notify("stop_stop_rocket_launcher");
}

//Function Number: 24
lib_A54A::func_5AEA()
{
	thread lib_A54A::func_5AAF();
}

//Function Number: 25
lib_A54A::func_5AF2()
{
	self notify("stop_hunting");
}

//Function Number: 26
lib_A54A::func_5A7C()
{
	self endon("death");
	self endon("stop_badplace_behavior");
	var_00 = 1;
	var_01 = 240;
	var_02 = 120;
	var_03 = "mech_bad_place" + self getentitynumber();
	for(;;)
	{
		badplace_cylinder(var_03,var_00 - 0.05,self.var_2E6,var_01,var_02,"allies");
		wait(var_00);
	}
}

//Function Number: 27
lib_A54A::func_5AE7()
{
	thread lib_A54A::func_5A7C();
}

//Function Number: 28
lib_A54A::func_5AEF()
{
	self notify("stop_badplace_behavior");
}

//Function Number: 29
lib_A54A::func_5AE8()
{
	thread lib_A54A::func_5A98();
}

//Function Number: 30
lib_A54A::func_5AF1()
{
	self notify("stop_generic_attacking");
}

//Function Number: 31
lib_A54A::func_5AEB(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0.9;
	}

	self.var_72A3 = param_00;
}

//Function Number: 32
lib_A54A::func_5AF3()
{
	self.var_72A3 = undefined;
}

//Function Number: 33
lib_A54A::func_5AC5()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(distancesquared(self.var_2E6,self.enemy.var_2E6) > self.var_5B7F)
	{
		return 0;
	}

	if(!isalive(self))
	{
		return 0;
	}

	if(isdefined(self.var_3065) && self.var_3065)
	{
		return 0;
	}

	if(!isalive(self.enemy))
	{
		return 0;
	}

	if(isdefined(self.enemy.var_2D2A) || isdefined(self.enemy.ignoreme) && self.enemy.ignoreme)
	{
		return 0;
	}

	if(isai(self.enemy))
	{
		if(self.enemy method_819B())
		{
			return 0;
		}

		if(self.enemy lib_A59A::func_2CE6() || self.enemy.var_113)
		{
			return 0;
		}
	}

	if(!lib_A54A::func_5AC6(self.enemy))
	{
		return 0;
	}

	return 1;
}

//Function Number: 34
lib_A54A::func_5AC6(param_00)
{
	var_01 = param_00.var_2E6 - self.var_2E6;
	var_02 = vectortoangles(var_01);
	var_03 = anglestoforward(var_02);
	var_04 = anglestoright(var_02);
	var_05 = anglestoup(var_02);
	foreach(var_07 in [10,80])
	{
		foreach(var_09 in [-20,0,20])
		{
			var_0A = self.var_2E6 - 10 * var_03 + var_09 * var_04 + var_07 * var_05;
			var_0B = param_00.var_2E6 - 10 * var_03 + var_09 * var_04 + var_07 * var_05;
			var_0C = sighttracepassed(var_0A,var_0B,0,self);
			if(!var_0C)
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 35
lib_A54A::func_5AC3()
{
	self endon("death");
	var_00 = 0.05;
	for(;;)
	{
		if(lib_A54A::func_5AC5())
		{
			self method_819A(::lib_A54A::func_5A88,::lib_A54A::func_5AC4);
			self waittill("melee_complete");
		}

		wait(var_00);
	}
}

//Function Number: 36
lib_A54A::func_5AD8(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon("death");
	self endon("stop_rocket_launcher");
	var_07 = 0.25;
	self.var_519E = 1;
	if(!isdefined(param_00))
	{
		param_00 = 256;
	}

	if(!isdefined(param_01))
	{
		param_01 = 2048;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 3;
	}

	if(!isdefined(param_04))
	{
		param_04 = 50;
	}

	if(!isdefined(param_05))
	{
		param_05 = 4;
	}

	if(!isdefined(param_06))
	{
		param_06 = 117;
	}

	var_08 = param_00 * param_00;
	var_09 = param_01 * param_01;
	for(;;)
	{
		if(!isdefined(self.enemy) || !self method_81BD())
		{
			wait(var_07);
			continue;
		}

		if(isdefined(self.underwater) && self.underwater)
		{
			wait(var_07);
			continue;
		}

		if(getdvar("debug_mech_rocket") == "on")
		{
			self.var_5B21 = 1;
		}
		else
		{
			self.var_5B21 = 0;
		}

		var_0A = self gettagorigin("tag_eye");
		var_0B = self.enemy method_8097() - var_0A;
		var_0C = vectornormalize(anglestoforward(self gettagangles("tag_eye")));
		var_0D = vectornormalize(var_0B);
		var_0E = vectordot(var_0C,var_0D);
		if(var_0E < param_02)
		{
			wait(var_07);
			continue;
		}

		if((isdefined(self.var_3065) && self.var_3065) || animscripts\utility::func_50F1())
		{
			wait(var_07);
			continue;
		}

		if(isdefined(self.inliveplayerkillstreak) && self.inliveplayerkillstreak == "allies")
		{
			var_10 = pointonsegmentnearesttopoint(self.enemy method_8097(),var_0A,level.var_31D.var_2E6);
			if(distance(level.var_31D.var_2E6,var_10) < param_06)
			{
				wait(var_07);
				continue;
			}
		}

		var_11 = distancesquared(self.var_2E6,self.enemy.var_2E6);
		if(var_11 >= var_08 && var_11 <= var_09)
		{
			if(!isdefined(self.var_758E) || !self.var_758E)
			{
				lib_A54A::func_5AD2(1);
			}

			thread lib_A54A::func_5AD4(self.enemy);
			var_12 = 0;
			while(var_12 < param_03)
			{
				lib_A54A::func_5A93();
				var_12++;
				wait(0.5);
				if((isdefined(self.var_3065) && self.var_3065) || animscripts\utility::func_50F1())
				{
					break;
				}
			}

			thread lib_A54A::func_5AD3(1);
			if((isdefined(self.var_3065) && self.var_3065) || animscripts\utility::func_50F1())
			{
				lib_A54A::func_5ABC(1);
			}
			else if(randomfloatrange(0,100) < param_04)
			{
				lib_A54A::func_5ABC(1);
			}

			wait(0.5 * param_05 + randomfloatrange(0,param_05));
		}

		wait(var_07);
	}

	self.var_519E = 0;
}

//Function Number: 37
lib_A54A::func_5AD4(param_00)
{
	if(!isdefined(self.var_E56))
	{
		self.var_E56 = 6;
	}

	if(!isdefined(self.var_7405))
	{
		self.var_7405 = 3;
	}

	var_01 = 130;
	var_02 = 130;
	var_03 = 200;
	var_04 = lib_A54A::func_5AD1(self,param_00);
	var_05 = var_04 + self.var_2E6 / 2;
	var_06 = 1500;
	var_07 = 2000;
	var_08 = 3000;
	var_09 = 128;
	var_0A = 256;
	var_0B = 1200;
	self.var_5B1E = [];
	self.var_5B1F = [];
	if(level.var_5EB.var_6281 + self.var_E56 <= 10)
	{
		for(var_0C = 0;var_0C < self.var_E56;var_0C++)
		{
			var_0D = randomintrange(-1 * var_01,var_01);
			var_0E = randomintrange(-1 * var_02,var_02);
			var_0F = randomintrange(0,var_03);
			var_10 = var_05 + (var_0D,var_0E,var_0F);
			self.var_5B1E[var_0C] = missilecreateattractororigin(var_10,var_07,var_0A);
			level.var_5EB.var_6281++;
		}
	}

	if(level.var_5EB.var_6282 + self.var_7405 <= 10)
	{
		for(var_0C = 0;var_0C < self.var_7405;var_0C++)
		{
			var_0D = randomintrange(-1 * var_01,var_01);
			var_0E = randomintrange(-1 * var_02,var_02);
			var_0F = randomintrange(0,var_03);
			var_10 = var_05 + (var_0D,var_0E,var_0F);
			self.var_5B1F[var_0C] = missilecreaterepulsororigin(var_10,var_06,var_09);
			level.var_5EB.var_6282++;
		}
	}

	if(!isdefined(param_00))
	{
		self.var_5B1E[self.var_E56] = undefined;
		return;
	}

	if(level.var_5EB.var_6281 + 1 <= 10)
	{
		self.var_5B1E[self.var_E56] = missilecreateattractorent(param_00,var_08,var_0B);
		level.var_5EB.var_6281++;
	}

	thread lib_A54A::func_5AD7(param_00);
}

//Function Number: 38
lib_A54A::func_5AD3(param_00)
{
	wait(param_00);
	if(isdefined(self))
	{
		if(isdefined(self.var_5B1E))
		{
			for(var_01 = 0;var_01 < self.var_E56 + 1;var_01++)
			{
				if(isdefined(self.var_5B1E[var_01]))
				{
					missiledeleteattractor(self.var_5B1E[var_01]);
					level.var_5EB.var_6281--;
				}
			}
		}

		if(isdefined(self.var_5B1F))
		{
			for(var_01 = 0;var_01 < self.var_7405;var_01++)
			{
				if(isdefined(self.var_5B1F[var_01]))
				{
					missiledeleteattractor(self.var_5B1F[var_01]);
					level.var_5EB.var_6282--;
				}
			}
		}

		self.var_5B1E = [];
		self.var_5B1F = [];
	}
}

//Function Number: 39
lib_A54A::func_5A93()
{
	self endon("death");
	var_00 = 48;
	var_01 = 64;
	var_02 = 3;
	var_03 = 6;
	var_04 = 100;
	var_05 = 24;
	var_06 = 0.1;
	var_07 = 0.4;
	var_08 = 12;
	var_09 = "tag_rocket";
	var_0A = 0.2;
	var_0B = randomintrange(var_02 + 1,var_03 + 1);
	var_0C = 20;
	var_0D = 20;
	var_0E = 16;
	for(var_0F = 1;var_0F < var_0B;var_0F++)
	{
		var_10 = var_09 + var_0F;
		var_11 = self gettagorigin(var_10);
		var_12 = self gettagangles(var_10);
		var_13 = anglestoforward(var_12);
		var_13 = vectornormalize(var_13);
		var_14 = randomintrange(-1 * var_0C,var_0C);
		var_15 = randomintrange(-1 * var_0D,var_0D);
		var_16 = randomintrange(-1 * var_0E,var_0E);
		var_17 = var_11 + var_13 * var_05;
		var_18 = var_11 + var_13 * var_04 + (var_14,var_15,var_16);
		var_19 = magicbullet("mech_rocket_deploy",var_17,var_18);
		playfx(level.var_5A97["rocket_muzzle_flash"],var_11,var_13,(0,0,1));
		if(isdefined(var_19))
		{
			var_1A = randomfloatrange(var_06,var_07);
			var_19 thread lib_A54A::func_5AD6(self,self.enemy,var_1A);
		}

		wait(0.05);
	}

	wait(0.25);
}

//Function Number: 40
lib_A54A::func_5AD1(param_00,param_01)
{
	if(isdefined(param_01))
	{
		return param_01.var_2E6;
	}

	return 400 * anglestoforward(param_00.var_41);
}

//Function Number: 41
lib_A54A::func_5AD6(param_00,param_01,param_02)
{
	var_03 = 32;
	var_04 = self.var_2E6;
	wait(param_02);
	if(isdefined(self))
	{
		var_05 = (randomintrange(-1 * var_03,var_03),randomintrange(-1 * var_03,var_03),randomintrange(-1 * var_03,var_03));
		var_06 = lib_A54A::func_5AD1(self,param_01) + var_05;
		var_07 = magicbullet("mech_rocket",self.var_2E6,var_06);
		playfx(level.var_5A97["rocket_seperation"],self.var_2E6,anglestoforward(self.var_41),(0,0,1));
		var_07 thread lib_A54A::func_5AD9(param_01,var_06,param_00);
		var_07.owner = param_00;
		self delete();
	}
}

//Function Number: 42
lib_A54A::func_5AD7(param_00)
{
	wait(1);
	if(isdefined(self.var_5B1E) && isdefined(self.var_5B1E[self.var_E56]))
	{
		missiledeleteattractor(self.var_5B1E[self.var_E56]);
		var_01 = lib_A54A::func_5AD1(self,param_00);
		self.var_5B1E[self.var_E56] = missilecreateattractororigin(var_01,5000,256);
	}
}

//Function Number: 43
lib_A54A::func_5AD9(param_00,param_01,param_02)
{
	self endon("death");
	if(isdefined(self))
	{
		if(isdefined(param_00))
		{
			self missilesettargetent(param_00,(0,0,32));
		}
		else
		{
			self missilesettargetpos(param_01);
		}

		self hide();
		var_03 = randomintrange(0,3);
		playfxontag(level.var_5A97["rocket_trail_" + var_03],self,"tag_origin");
	}

	var_04 = self.var_2E6;
	for(;;)
	{
		var_04 = self.var_2E6;
		wait(0.1);
	}
}

//Function Number: 44
lib_A54A::func_5AD2(param_00)
{
	var_01 = 0.2;
	var_02 = %mech_add_rocketpack_raise;
	self method_8145(var_02,1,var_01);
	lib_A5DE::snd_message("snd_mech_add_rocketpack_raise");
	if(isdefined(param_00) && param_00)
	{
		wait(function_0063(var_02));
	}

	self.var_758E = 1;
}

//Function Number: 45
lib_A54A::func_5ABC(param_00)
{
	var_01 = 0.2;
	var_02 = %mech_add_rocketpack_lower;
	self method_8145(var_02,1,var_01);
	lib_A5DE::snd_message("snd_mech_add_rocketpack_lower");
	if(isdefined(param_00) && param_00)
	{
		wait(function_0063(var_02));
	}

	self.var_758E = 0;
}

//Function Number: 46
lib_A54A::func_5A98()
{
	self endon("death");
	self endon("stop_generic_attacking");
	for(;;)
	{
		wait(0.2);
		animscripts\combat::func_9892();
		if(isdefined(self.enemy))
		{
			self.var_1C7 = 200;
			self.var_1C5 = 81;
			animscripts\combat_utility::func_989C(1);
		}
	}
}

//Function Number: 47
lib_A54A::func_5AFF(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(self.var_91BB) && self.var_91BB)
	{
		self.var_4E6 = 0;
		if(isdefined(param_01) && self method_81BE(param_01))
		{
			self method_81A6(param_01.var_2E6);
		}
	}
}

//Function Number: 48
lib_A54A::func_5AB0()
{
	self endon("death");
	self endon("stop_hunting");
	self endon("_stealth_enemy_alert_level_change");
	self.var_4E6 = 1;
	var_00 = 0;
	var_01 = randomfloatrange(3,4);
	for(;;)
	{
		wait(0.5);
		if(isdefined(self.enemy) && isdefined(level.var_31D) && self.enemy == level.var_31D)
		{
			if(isdefined(level.var_571) && isdefined(level.var_571.var_1FB4) && level.var_571.var_1FB4)
			{
				wait(randomfloatrange(0.3,3));
				continue;
			}
		}

		if(isdefined(self.enemy))
		{
			self method_81A6(self sentient_lastknownpos(self.enemy));
			self.var_1C7 = 400;
			self.var_1C5 = 81;
		}
		else
		{
			var_00++;
		}

		if(0.5 * var_00 > var_01)
		{
			break;
		}
	}
}

//Function Number: 49
lib_A54A::func_5AAF()
{
	self endon("death");
	self endon("stop_hunting");
	self.var_4E6 = 0;
	for(;;)
	{
		wait(0.5);
		if(isdefined(self.enemy))
		{
			self method_81A6(self.enemy.var_2E6);
			self.var_1C7 = 200;
			self.var_1C5 = 81;
		}
	}
}

//Function Number: 50
lib_A54A::func_5A89()
{
	lib_A54A::func_5A8A(%mech_emp_react,6);
}

//Function Number: 51
lib_A54A::func_5A8A(param_00,param_01)
{
	self endon("death");
	if((isdefined(self.var_3065) && self.var_3065) || common_scripts\utility::isflashed())
	{
		return;
	}

	self.var_7.var_6E57 = "stand";
	self.var_31 = 1;
	var_02 = self.var_38A6;
	self.var_38A6 = 0;
	self.var_3065 = 1;
	lib_A59A::func_38A9(param_01);
	self.var_38A6 = var_02;
	thread lib_A54A::func_307A(param_01);
}

//Function Number: 52
lib_A54A::func_307A(param_00)
{
	self endon("death");
	if((isdefined(self.var_3065) && !self.var_3065) || !common_scripts\utility::isflashed())
	{
		return;
	}

	self notify("start_emp_effect");
	var_01 = self.var_285;
	self.var_285 = 20000;
	lib_A59A::func_2AC1();
	var_02 = function_0063(%mech_emp_react);
	wait(var_02);
	self method_8143(%mech_emp_idle,1,0.2,1);
	var_03 = function_0063(%mech_emp_restart);
	wait(param_00 - var_03 + var_02);
	if(common_scripts\utility::isflashed())
	{
		self method_8143(%mech_emp_restart,1,1,1);
		lib_A5DE::snd_message("snd_mech_emp_restart");
	}

	wait(var_03);
	lib_A59A::func_30D8();
	self.var_285 = var_01;
	self.var_3065 = 0;
}

//Function Number: 53
lib_A54A::func_4D11()
{
	if(isdefined(level.var_CCA["mech"]))
	{
		return;
	}

	level.var_CCA["mech"] = [];
	lib_A54A::func_4C90();
	lib_A54A::func_4C9A();
	lib_A54A::func_4C97();
	lib_A54A::func_4C8E();
	lib_A54A::func_4C98();
	lib_A54A::func_4D12();
	lib_A54A::func_4C8F();
	lib_A54A::func_4C94();
	lib_A54A::func_4C91();
	lib_A54A::func_4C93();
	lib_A54A::func_4C99();
	lib_A54A::func_4C8D();
	level.var_CCA["mech"]["combat"]["surprise_stop"] = %mech_unaware_walk_stop;
	level.var_CCA["mech"]["combat"]["trans_to_combat"] = %mech_walk_start;
	lib_A54A::func_4C71();
}

//Function Number: 54
lib_A54A::func_4C8D()
{
	anim.var_4D85 = [];
	level.var_4D85["default"] = [%mech_flinch_back,%mech_flinch_chest];
	level.var_4D85["left_arm"] = %mech_flinch_lshoulder_down;
	level.var_4D85["right_arm"] = %mech_flinch_rshoulder_down;
	level.var_4D85["left_leg"] = %mech_flinch_lshoulder_up;
	level.var_4D85["right_leg"] = %mech_flinch_rshoulder_up;
	level.var_CCA["mech"]["additive_pain"] = level.var_4D85;
}

//Function Number: 55
lib_A54A::func_4C99()
{
	var_00 = [];
	var_00["stand"][0] = [%mech_stand_idle];
	var_00["stand"][1] = [%mech_stand_idle];
	var_00["stand_cqb"][0] = [%mech_stand_idle];
	var_00["crouch"][0] = [%mech_stand_idle];
	level.var_CCA["mech"]["idle"] = var_00;
	var_00 = [];
	var_00["stand"][0] = [1];
	var_00["stand"][1] = [1];
	var_00["stand_cqb"][0] = [1];
	var_00["crouch"][0] = [1];
	level.var_CCA["mech"]["idle_weights"] = var_00;
	var_00 = [];
	var_00["stand"] = %mech_stand_idle;
	var_00["crouch"] = %mech_stand_idle;
	var_00["stand_smg"] = %mech_stand_idle;
	level.var_CCA["mech"]["idle_transitions"] = var_00;
}

//Function Number: 56
lib_A54A::func_4C71()
{
	var_00 = [];
	var_00["exposed"] = [];
	var_00["exposed"][1] = %mech_walk_stop_1;
	var_00["exposed"][2] = %mech_walk_stop_2;
	var_00["exposed"][3] = %mech_walk_stop_3;
	var_00["exposed"][4] = %mech_walk_stop_4;
	var_00["exposed"][6] = %mech_walk_stop_6;
	var_00["exposed"][7] = %mech_walk_stop_7;
	var_00["exposed"][8] = %mech_walk_stop_8;
	var_00["exposed"][9] = %mech_walk_stop_9;
	var_00["exposed_cqb"] = [];
	var_00["exposed_cqb"][1] = %mech_walk_stop_1;
	var_00["exposed_cqb"][2] = %mech_walk_stop_2;
	var_00["exposed_cqb"][3] = %mech_walk_stop_3;
	var_00["exposed_cqb"][4] = %mech_walk_stop_4;
	var_00["exposed_cqb"][6] = %mech_walk_stop_6;
	var_00["exposed_cqb"][7] = %mech_walk_stop_7;
	var_00["exposed_cqb"][8] = %mech_walk_stop_8;
	var_00["exposed_cqb"][9] = %mech_walk_stop_9;
	level.var_CCA["mech"]["cover_trans"] = var_00;
	var_00 = [];
	var_00["exposed"] = [];
	var_00["exposed"][1] = %mech_walk_start_1;
	var_00["exposed"][2] = %mech_walk_start_2;
	var_00["exposed"][3] = %mech_walk_start_3;
	var_00["exposed"][4] = %mech_walk_start_4;
	var_00["exposed"][6] = %mech_walk_start_6;
	var_00["exposed"][7] = %mech_walk_start_7;
	var_00["exposed"][8] = %mech_walk_start_8;
	var_00["exposed"][9] = %mech_walk_start_9;
	var_00["exposed_cqb"] = [];
	var_00["exposed_cqb"][1] = %mech_walk_start_1;
	var_00["exposed_cqb"][2] = %mech_walk_start_2;
	var_00["exposed_cqb"][3] = %mech_walk_start_3;
	var_00["exposed_cqb"][4] = %mech_walk_start_4;
	var_00["exposed_cqb"][6] = %mech_walk_start_6;
	var_00["exposed_cqb"][7] = %mech_walk_start_7;
	var_00["exposed_cqb"][8] = %mech_walk_start_8;
	var_00["exposed_cqb"][9] = %mech_walk_start_9;
	level.var_CCA["mech"]["cover_exit"] = var_00;
	animscripts\init_move_transitions::func_4E2C("mech");
	lib_A54A::func_4DEE();
	animscripts\init_move_transitions::func_40DF("mech");
}

//Function Number: 57
lib_A54A::func_4DEE()
{
}

//Function Number: 58
lib_A54A::func_4C98()
{
	var_00 = [];
	var_00["fire"] = %mech_walking_fire_auto;
	var_00["single"] = [%mech_walking_fire_auto];
	level.var_CCA["mech"]["shoot_while_moving"] = var_00;
}

//Function Number: 59
lib_A54A::func_4D12()
{
	anim.var_4D85 = [];
	level.var_4D85[0] = %mech_run_turn_180;
	level.var_4D85[1] = %mech_run_turn_l135;
	level.var_4D85[2] = %mech_run_turn_l90;
	level.var_4D85[3] = %mech_run_turn_l45;
	level.var_4D85[5] = %mech_run_turn_r45;
	level.var_4D85[6] = %mech_run_turn_r90;
	level.var_4D85[7] = %mech_run_turn_r135;
	level.var_4D85[8] = %mech_run_turn_180;
	level.var_CCA["mech"]["run_turn"] = level.var_4D85;
	level.var_CCA["mech"]["cqb_run_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85[0] = %mech_walk_turn_2;
	level.var_4D85[1] = %mech_walk_turn_1;
	level.var_4D85[2] = %mech_walk_turn_4;
	level.var_4D85[3] = %mech_walk_turn_7;
	level.var_4D85[5] = %mech_walk_turn_9;
	level.var_4D85[6] = %mech_walk_turn_6;
	level.var_4D85[7] = %mech_walk_turn_3;
	level.var_4D85[8] = %mech_walk_turn_2;
	level.var_CCA["mech"]["cqb_turn"] = level.var_4D85;
	anim.var_4D85 = [];
	level.var_4D85["turn_left_45"] = %mech_turn_45_l;
	level.var_4D85["turn_left_90"] = %mech_turn_90_l;
	level.var_4D85["turn_left_135"] = %mech_turn_135_l;
	level.var_4D85["turn_left_180"] = %mech_turn_180_l;
	level.var_4D85["turn_right_45"] = %mech_turn_45_r;
	level.var_4D85["turn_right_90"] = %mech_turn_90_r;
	level.var_4D85["turn_right_135"] = %mech_turn_135_r;
	level.var_4D85["turn_right_180"] = %mech_turn_180_r;
	level.var_CCA["mech"]["exposed_turn"] = level.var_4D85;
}

//Function Number: 60
lib_A54A::func_4C93()
{
	anim.var_4D85 = [];
	level.var_4D85["cower_squat"] = %mech_exposed_squat_down_mech_grenade_f;
	level.var_4D85["cower_dive_back"] = %mech_exposed_dive_grenade_b;
	level.var_4D85["cower_dive_front"] = %mech_exposed_dive_grenade_f;
	level.var_4D85["return_throw_short"] = [%mech_grenade_return_running_throw_forward,%mech_grenade_return_standing_throw_overhand_forward];
	level.var_4D85["return_throw_long"] = [%mech_grenade_return_standing_throw_overhand_forward];
	level.var_4D85["return_throw_default"] = [%mech_grenade_return_running_throw_forward,%mech_grenade_return_standing_throw_overhand_forward];
	level.var_CCA["mech"]["grenade"] = level.var_4D85;
}

//Function Number: 61
lib_A54A::func_4C94()
{
	anim.var_4D85 = [];
	level.var_4D85["torso_upper"] = [%mech_stand_exposed_extendedpain_neck];
	level.var_4D85["torso_upper_extended"] = [%mech_stand_exposed_extendedpain_gut,%mech_stand_exposed_extendedpain_stomach];
	level.var_4D85["torso_lower"] = [%mech_exposed_pain_groin,%mech_stand_exposed_extendedpain_hip];
	level.var_4D85["torso_lower_extended"] = [%mech_stand_exposed_extendedpain_gut,%mech_stand_exposed_extendedpain_stomach];
	level.var_4D85["head"] = [%mech_exposed_pain_face,%mech_stand_exposed_extendedpain_neck];
	level.var_4D85["head_extended"] = [%mech_exposed_pain_face,%mech_stand_exposed_extendedpain_neck];
	level.var_4D85["right_arm"] = [%mech_exposed_pain_right_arm];
	level.var_4D85["right_arm_extended"] = [%mech_exposed_pain_right_arm];
	level.var_4D85["left_arm"] = [%mech_stand_exposed_extendedpain_shoulderswing];
	level.var_4D85["left_arm_extended"] = [%mech_stand_exposed_extendedpain_shoulderswing];
	level.var_4D85["leg"] = [%mech_exposed_pain_groin];
	level.var_4D85["leg_extended"] = [%mech_stand_exposed_extendedpain_stomach];
	level.var_4D85["foot"] = [%mech_stand_exposed_extendedpain_thigh];
	level.var_4D85["foot_extended"] = [%mech_stand_exposed_extendedpain_thigh];
	level.var_4D85["default_long"] = [%mech_stand_extendedpainc,%mech_stand_exposed_extendedpain_chest,%mech_stand_exposed_extendedpain_stomach];
	level.var_4D85["default_short"] = [%mech_exposed_pain_right_arm,%mech_exposed_pain_face,%mech_exposed_pain_groin];
	level.var_4D85["default_extended"] = [%mech_stand_extendedpainb,%mech_stand_exposed_extendedpain_chest,%mech_stand_extendedpainc];
	level.var_4D85["damage_shield_pain_array"] = [%mech_stand_exposed_extendedpain_gut,%mech_stand_exposed_extendedpain_stomach,%mech_stand_exposed_extendedpain_chest];
	level.var_4D85["run_long"] = [%mech_stand_extendedpainc,%mech_stand_extendedpainb,%mech_stand_exposed_extendedpain_chest];
	level.var_4D85["run_medium"] = [%mech_stand_extendedpainc,%mech_stand_extendedpainb,%mech_stand_exposed_extendedpain_chest];
	level.var_4D85["run_short"] = [%mech_stand_extendedpainc,%mech_stand_extendedpainb,%mech_stand_exposed_extendedpain_chest];
	level.var_4D85["back"] = %mech_stand_extendedpainb;
	level.var_CCA["mech"]["pain"] = level.var_4D85;
}

//Function Number: 62
lib_A54A::func_4C8F()
{
	var_00 = [];
	var_00["directed_energy_stand_front_head"] = [%mech_stand_death_headshot_slowfall];
	var_00["directed_energy_stand_front_legs"] = [%mech_stand_death_leg];
	var_00["directed_energy_stand_front_default"] = [%mech_stand_death_tumbleforward];
	var_00["directed_energy_stand_back_default"] = [%mech_stand_death_tumbleback];
	var_00["strong_legs"] = [%mech_stand_death_leg];
	var_00["strong_torso_lower"] = [%mech_stand_death_guts];
	var_00["strong_default"] = [%mech_stand_death_stumbleforward,%mech_stand_death_tumbleforward];
	var_00["strong_right"] = [%mech_stand_death_shoulder_spin,%mech_stand_death_fallside];
	var_00["strong_left"] = [%mech_stand_death_shoulder_spin,%mech_stand_death_fallside];
	var_00["running_forward"] = [%mech_stand_death_tumbleforward,%mech_exposed_death_flop];
	var_00["running_forward_f"] = [%mech_stand_death_tumbleback];
	var_00["stand_lower_body"] = [%mech_stand_death_crotch,%mech_stand_death_leg];
	var_00["stand_lower_body_extended"] = [%mech_stand_death_crotch,%mech_stand_death_guts];
	var_00["stand_head"] = [%mech_stand_death_face,%mech_stand_death_headshot_slowfall];
	var_00["stand_neck"] = [%mech_exposed_death_neckgrab];
	var_00["stand_left_shoulder"] = [%mech_stand_death_shoulder_spin];
	var_00["stand_torso_upper"] = [%mech_stand_death_tumbleforward];
	var_00["stand_torso_upper_extended"] = [%mech_stand_death_fallside];
	var_00["stand_front_head"] = [%mech_stand_death_face,%mech_stand_death_headshot_slowfall];
	var_00["stand_front_head_extended"] = [%mech_stand_death_head_straight_back];
	var_00["stand_front_torso"] = [%mech_stand_death_tumbleback];
	var_00["stand_front_torso_extended"] = [%mech_stand_death_chest_stunned];
	var_00["stand_back"] = [%mech_exposed_death_flop];
	var_00["stand_default"] = [%mech_exposed_death_flop];
	var_00["stand_default_firing"] = [%mech_exposed_death_flop];
	var_00["stand_backup_default"] = %mech_exposed_death_flop;
	var_00["melee_standing_front"] = [%mech_exposed_death_neckgrab];
	var_00["melee_standing_back"] = [%mech_exposed_death_flop];
	var_00["melee_standing_left"] = [%mech_exposed_death_flop];
	var_00["melee_standing_right"] = [%mech_exposed_death_flop];
	var_00["melee_crouching_front"] = [%mech_exposed_death_flop];
	var_00["melee_crouching_back"] = [%mech_exposed_death_flop];
	var_00["melee_crouching_left"] = [%mech_exposed_death_flop];
	var_00["melee_crouching_right"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_stand_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_stand_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_stand_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_stand_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_stand_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_stand_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_stand_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_stand_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_stand_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_stand_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_stand_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_stand_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_crouch_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_crouch_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_crouch_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_crouch_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_crouch_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_crouch_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_crouch_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_crouch_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_crouch_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_crouch_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_crouch_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_crouch_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_prone_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_prone_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_prone_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_prone_stand"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_prone_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_prone_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_prone_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_prone_crouch"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_prone_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_back_prone_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_left_prone_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_right_prone_prone"] = [%mech_exposed_death_flop];
	var_00["melee_exo_stand_front_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_stand_back_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_stand_left_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_stand_right_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_crouch_front_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_crouch_back_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_crouch_left_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_crouch_right_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_prone_front_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_prone_back_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_prone_left_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_prone_right_head"] = [%mech_exposed_death_flop];
	var_00["melee_exo_front_lower"] = [%mech_exposed_death_flop];
	var_00["emp"] = [%mech_emp_death];
	level.var_CCA["mech"]["death"] = var_00;
}

//Function Number: 63
lib_A54A::func_4C8E()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %mech_runf;
	level.var_4D85["sprint_short"] = %mech_sprint;
	level.var_4D85["straight"] = %mech_walkf;
	level.var_4D85["fire"] = %mech_walking_fire_auto;
	level.var_4D85["single"] = [%mech_walking_fire_auto];
	level.var_4D85["move_f"] = %mech_walkf;
	level.var_4D85["move_l"] = %mech_stand_walk_left;
	level.var_4D85["move_r"] = %mech_stand_walk_right;
	level.var_4D85["move_b"] = %mech_stand_walk_back;
	level.var_4D85["stairs_up"] = %mech_run_stairs_up;
	level.var_4D85["stairs_up_in"] = %mech_run_stairs_up_2_run;
	level.var_4D85["stairs_down_out"] = %mech_run_stairs_down_2_run;
	level.var_4D85["stairs_down"] = %mech_run_stairs_down;
	level.var_4D85["aim_2"] = %mech_walking_aim_low;
	level.var_4D85["aim_4"] = %mech_walking_aim_left;
	level.var_4D85["aim_6"] = %mech_walking_aim_right;
	level.var_4D85["aim_8"] = %mech_walking_aim_high;
	level.var_4D85["aim_5"] = %mech_walking_aim5;
	level.var_CCA["mech"]["cqb"] = level.var_4D85;
}

//Function Number: 64
lib_A54A::func_4C90()
{
	anim.var_4D85 = [];
	level.var_4D85["add_aim_up"] = %mech_aim_high;
	level.var_4D85["add_aim_down"] = %mech_aim_low;
	level.var_4D85["add_aim_left"] = %mech_aim_left;
	level.var_4D85["add_aim_right"] = %mech_aim_right;
	level.var_4D85["straight_level"] = %mech_aim5;
	level.var_4D85["aim_2"] = %mech_aim_low;
	level.var_4D85["aim_4"] = %mech_aim_left;
	level.var_4D85["aim_6"] = %mech_aim_right;
	level.var_4D85["aim_8"] = %mech_aim_high;
	level.var_4D85["aim_5"] = %mech_aim5;
	level.var_4D85["fire"] = %mech_walking_fire_auto;
	level.var_4D85["single"] = animscripts\utility::func_CD8(%mech_stand_fire_burst_semi);
	lib_A54A::func_7DC5();
	level.var_4D85["exposed_idle"] = animscripts\utility::func_CD8(%mech_combat_idle);
	level.var_4D85["reload"] = animscripts\utility::func_CD8(%mech_stand_reload);
	level.var_4D85["reload_crouchhide"] = animscripts\utility::func_CD8(%mech_stand_reload);
	lib_A54A::func_7DC7();
	level.var_CCA["mech"]["default_stand"] = level.var_4D85;
	level.var_CCA["mech"]["cqb_stand"] = level.var_4D85;
}

//Function Number: 65
lib_A54A::func_4C97()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %mech_sprint;
	level.var_4D85["sprint_short"] = %mech_sprint;
	level.var_4D85["fire"] = %mech_walking_fire_auto;
	level.var_4D85["single"] = [%mech_walking_fire_auto];
	level.var_4D85["straight"] = %mech_runf;
	level.var_4D85["smg_straight"] = %mech_runf;
	level.var_4D85["aim_2"] = %mech_walking_aim_low;
	level.var_4D85["aim_4"] = %mech_walking_aim_left;
	level.var_4D85["aim_6"] = %mech_walking_aim_right;
	level.var_4D85["aim_8"] = %mech_walking_aim_high;
	level.var_4D85["aim_5"] = %mech_walking_aim5;
	level.var_4D85["move_f"] = %mech_runf;
	level.var_4D85["move_l"] = %mech_stand_walk_left;
	level.var_4D85["move_r"] = %mech_stand_walk_right;
	level.var_4D85["move_b"] = %mech_stand_walk_back;
	level.var_4D85["stairs_up"] = %mech_run_stairs_up;
	level.var_4D85["stairs_up_in"] = %mech_run_stairs_up_2_run;
	level.var_4D85["stairs_up_out"] = %mech_run_stairs_up_2_run;
	level.var_4D85["stairs_down"] = %mech_run_stairs_down;
	lib_A54A::func_7DC6();
	level.var_CCA["mech"]["run"] = level.var_4D85;
}

//Function Number: 66
lib_A54A::func_4C9A()
{
	anim.var_4D85 = [];
	level.var_4D85["sprint"] = %mech_sprint;
	level.var_4D85["straight"] = %mech_walkf;
	level.var_4D85["fire"] = %mech_walking_fire_auto;
	level.var_4D85["single"] = [%mech_walking_fire_auto];
	level.var_4D85["move_f"] = %mech_walkf;
	level.var_4D85["move_l"] = %mech_stand_walk_left;
	level.var_4D85["move_r"] = %mech_stand_walk_right;
	level.var_4D85["move_b"] = %mech_stand_walk_back;
	level.var_4D85["aim_2"] = %mech_walking_aim_low;
	level.var_4D85["aim_4"] = %mech_walking_aim_left;
	level.var_4D85["aim_6"] = %mech_walking_aim_right;
	level.var_4D85["aim_8"] = %mech_walking_aim_high;
	level.var_4D85["aim_5"] = %mech_walking_aim5;
	level.var_4D85["stairs_up"] = %mech_run_stairs_up;
	level.var_4D85["stairs_down"] = %mech_run_stairs_down;
	level.var_4D85["stairs_up_in"] = %mech_run_stairs_up_2_run;
	level.var_4D85["stairs_up_out"] = %mech_run_stairs_up_2_run;
	lib_A54A::func_7DC6();
	level.var_CCA["mech"]["walk"] = level.var_4D85;
}

//Function Number: 67
lib_A54A::func_7DC7()
{
	level.var_4D85["turn_left_45"] = %mech_turn_45_l;
	level.var_4D85["turn_left_90"] = %mech_turn_90_l;
	level.var_4D85["turn_left_135"] = %mech_turn_135_l;
	level.var_4D85["turn_left_180"] = %mech_turn_180_l;
	level.var_4D85["turn_right_45"] = %mech_turn_45_r;
	level.var_4D85["turn_right_90"] = %mech_turn_90_r;
	level.var_4D85["turn_right_135"] = %mech_turn_135_r;
	level.var_4D85["turn_right_180"] = %mech_turn_180_r;
}

//Function Number: 68
lib_A54A::func_7DC5()
{
	level.var_4D85["burst2"] = %mech_stand_fire_burst;
	level.var_4D85["burst3"] = %mech_stand_fire_burst;
	level.var_4D85["burst4"] = %mech_stand_fire_burst;
	level.var_4D85["burst5"] = %mech_stand_fire_burst;
	level.var_4D85["burst6"] = %mech_stand_fire_burst;
	level.var_4D85["semi1"] = %mech_stand_fire_burst_semi;
	level.var_4D85["semi3"] = %mech_stand_fire_burst_semi;
	level.var_4D85["semi4"] = %mech_stand_fire_burst_semi;
	level.var_4D85["semi5"] = %mech_stand_fire_burst_semi;
}

//Function Number: 69
lib_A54A::func_7DC6()
{
	level.var_4D85["burst2"] = %mech_walk_fire_burst;
	level.var_4D85["burst3"] = %mech_walk_fire_burst;
	level.var_4D85["burst4"] = %mech_walk_fire_burst;
	level.var_4D85["burst5"] = %mech_walk_fire_burst;
	level.var_4D85["burst6"] = %mech_walk_fire_burst;
	level.var_4D85["semi1"] = %mech_walk_fire_burst_semi;
	level.var_4D85["semi3"] = %mech_walk_fire_burst_semi;
	level.var_4D85["semi4"] = %mech_walk_fire_burst_semi;
	level.var_4D85["semi5"] = %mech_walk_fire_burst_semi;
}

//Function Number: 70
lib_A54A::func_4C91()
{
	var_00 = [];
	var_00["flashed"] = [%mech_emp_react];
	level.var_CCA["mech"]["flashed"] = var_00;
	level.var_38A2["mech"] = 0;
}