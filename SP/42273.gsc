/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42273.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 27
 * Decompile Time: 12 ms
 * Timestamp: 4/20/2022 8:22:04 PM
*******************************************************************/

//Function Number: 1
lib_A521::initglobals()
{
	if(getdvar("debug_drones") == "")
	{
		setdvar("debug_drones","0");
	}

	if(!isdefined(level.var_5852))
	{
		level.var_2E89 = 200;
	}

	if(!isdefined(level.var_59FC))
	{
		level.var_59FC = [];
	}

	if(!isdefined(level.var_59FC["allies"]))
	{
		level.var_59FC["allies"] = 99999;
	}

	if(!isdefined(level.var_59FC["axis"]))
	{
		level.var_59FC["axis"] = 99999;
	}

	if(!isdefined(level.var_59FC["team3"]))
	{
		level.var_59FC["team3"] = 99999;
	}

	if(!isdefined(level.var_59FC["neutral"]))
	{
		level.var_59FC["neutral"] = 99999;
	}

	if(!isdefined(level.var_2F19))
	{
		level.var_2F19 = [];
	}

	if(!isdefined(level.var_2F19["allies"]))
	{
		level.var_2F19["allies"] = lib_A59A::func_8F5C();
	}

	if(!isdefined(level.var_2F19["axis"]))
	{
		level.var_2F19["axis"] = lib_A59A::func_8F5C();
	}

	if(!isdefined(level.var_2F19["team3"]))
	{
		level.var_2F19["team3"] = lib_A59A::func_8F5C();
	}

	if(!isdefined(level.var_2F19["neutral"]))
	{
		level.var_2F19["neutral"] = lib_A59A::func_8F5C();
	}

	level.var_2EBF = ::lib_A521::func_2E60;
}

//Function Number: 2
lib_A521::func_2E60()
{
	if(level.var_2F19[self.inliveplayerkillstreak].var_CD8.size >= level.var_59FC[self.inliveplayerkillstreak])
	{
		self delete();
		return;
	}

	thread lib_A521::func_2E25(self);
	level notify("new_drone");
	self setcandamage(1);
	lib_A523::func_2E57();
	if(isdefined(self.var_79A9))
	{
		return;
	}

	thread lib_A521::func_2E92();
	thread lib_A521::func_2E3A();
	if(isdefined(self.target))
	{
		if(!isdefined(self.var_7A3A))
		{
			thread lib_A521::func_2E94();
		}
		else
		{
			thread lib_A521::func_2EEE();
		}
	}

	if(isdefined(self.var_7A24) && self.var_7A24 == 0)
	{
		return;
	}

	thread lib_A521::func_2E5B();
}

//Function Number: 3
lib_A521::func_2E25(param_00)
{
	lib_A59A::func_8F5F(level.var_2F19[param_00.inliveplayerkillstreak],param_00);
	var_01 = param_00.inliveplayerkillstreak;
	param_00 waittill("death");
	if(isdefined(param_00) && isdefined(param_00.var_8F5B))
	{
		lib_A59A::func_8F61(level.var_2F19[var_01],param_00.var_8F5B);
		return;
	}

	lib_A59A::func_8F62(level.var_2F19[var_01]);
}

//Function Number: 4
lib_A521::func_2E3A()
{
	lib_A521::func_2EED();
	if(!isdefined(self))
	{
		return;
	}

	var_00 = "stand";
	if(isdefined(self.var_C80) && isdefined(level.var_2E21[self.inliveplayerkillstreak][self.var_C80]) && isdefined(level.var_2E21[self.inliveplayerkillstreak][self.var_C80]["death"]))
	{
		var_00 = self.var_C80;
	}

	var_01 = level.var_2E21[self.inliveplayerkillstreak][var_00]["death"];
	if(isdefined(self.var_2651))
	{
		var_01 = self.var_2651;
	}

	self notify("death");
	if(isdefined(level.var_2E39))
	{
		self thread [[ level.var_2E39 ]](var_01);
		return;
	}

	if(!isdefined(self.var_6156) && isdefined(self.var_85B4))
	{
		if(isdefined(self.var_6156))
		{
			lib_A521::func_2E9F(var_01,"deathplant");
		}
		else if(isdefined(self.var_85B4))
		{
			self startragdoll();
			lib_A521::func_2E9F(var_01,"deathplant");
		}
		else
		{
			lib_A521::func_2E9F(var_01,"deathplant");
			self startragdoll();
		}
	}

	self notsolid();
	thread lib_A521::func_2EDC(2);
	if(isdefined(self) && isdefined(self.var_611C))
	{
		return;
	}

	wait(10);
	while(isdefined(self))
	{
		if(!common_scripts\utility::within_fov(level.var_31D.var_2E6,level.var_31D.var_41,self.var_2E6,0.5))
		{
			self delete();
		}

		wait(5);
	}
}

//Function Number: 5
lib_A521::func_2E92()
{
	self endon("death");
	for(;;)
	{
		while(!isdefined(self.var_101) || !self.var_101)
		{
			wait(0.05);
		}

		var_00 = self.health;
		self.health = 100000;
		while(isdefined(self.var_101) && self.var_101)
		{
			wait(0.05);
		}

		self.health = var_00;
		wait(0.05);
	}
}

//Function Number: 6
lib_A521::func_2EED()
{
	self endon("death");
	while(isdefined(self))
	{
		self waittill("damage");
		if(isdefined(self.var_101) && self.var_101)
		{
			self.health = 100000;
			continue;
		}

		if(self.health <= 0)
		{
			break;
		}
	}
}

//Function Number: 7
lib_A521::func_2EDC(param_00)
{
	wait(param_00);
	if(isdefined(self))
	{
		self method_8000();
	}
}

//Function Number: 8
lib_A521::func_2E9E(param_00,param_01)
{
	if(isdefined(self.var_2E8B))
	{
		self [[ self.var_2E8C ]](param_00,param_01);
		return;
	}

	self method_8142(%body,0.2);
	self method_8141();
	self method_8110("drone_anim",param_00,%body,1,0.2,param_01);
	self.var_2EF6 = param_00;
}

//Function Number: 9
lib_A521::func_2E9F(param_00,param_01)
{
	if(self.type == "human")
	{
		self method_8142(%body,0.2);
	}

	self method_8141();
	var_02 = "normal";
	if(isdefined(param_01))
	{
		var_02 = "deathplant";
	}

	var_03 = "drone_anim";
	self method_813E(var_03,self.var_2E6,self.var_41,param_00,var_02);
	self waittillmatch("end","drone_anim");
}

//Function Number: 10
lib_A521::func_2E42()
{
	if(!isdefined(self))
	{
		return;
	}

	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	var_00 = getweaponmodel(self.weapon);
	var_01 = self.weapon;
	if(isdefined(var_00))
	{
		lib_A59A::func_2974(self.weapon);
		self detach(var_00,"tag_weapon_right");
		var_02 = self gettagorigin("tag_weapon_right");
		var_03 = self gettagangles("tag_weapon_right");
		var_04 = spawn("weapon_" + var_01,(0,0,0));
		var_04.var_41 = var_03;
		var_04.var_2E6 = var_02;
	}
}

//Function Number: 11
lib_A521::func_2EB6(param_00)
{
	if(isdefined(level.var_CCA[param_00]))
	{
		var_01 = level.var_CCA[param_00]["idle"]["stand"][0];
		var_01 = common_scripts\utility::array_combine(var_01,level.var_CCA[param_00]["idle"]["stand"][1]);
		var_02 = level.var_CCA[param_00]["idle"]["stand"][0][0];
		self.var_2E22 = var_02;
		self.var_2E23 = var_01;
		self.var_2E5C = 1;
		self.var_2E5D = ::lib_A521::func_2E24;
		thread lib_A521::func_2E5B(undefined,undefined);
	}
}

//Function Number: 12
lib_A521::func_2E24()
{
	self endon("death");
	var_00 = 10;
	if(!isdefined(self.var_2E23) || !isarray(self.var_2E23))
	{
		return;
	}

	self method_8142(%body,0.2);
	self method_8141();
	var_01 = 1;
	animscripts\face::func_6D98(undefined,"idle",undefined);
	for(;;)
	{
		var_02 = common_scripts\utility::random(self.var_2E23);
		if(randomint(100) < var_00 || var_01)
		{
			self method_8110("drone_anim",var_02,%body,1,0.2,1);
			var_01 = 0;
		}

		self waittillmatch("end","drone_anim");
		self method_8110("drone_anim",self.var_2E22,%body,1,0.2,1);
	}
}

//Function Number: 13
lib_A521::func_2E5B(param_00,param_01)
{
	if(isdefined(self.var_2E5C))
	{
		[[ self.var_2E5D ]]();
		return;
	}

	if(isdefined(param_00) && isdefined(param_00["script_noteworthy"]) && isdefined(level.var_2E21[self.inliveplayerkillstreak][param_00["script_noteworthy"]]))
	{
		thread lib_A521::func_2E49(param_00["script_noteworthy"],param_00,param_01);
		return;
	}

	if(isdefined(self.var_4B76))
	{
		lib_A521::func_2E9E(self.var_4B76,1);
		return;
	}

	lib_A521::func_2E9E(level.var_2E21[self.inliveplayerkillstreak]["stand"]["idle"],1);
}

//Function Number: 14
lib_A521::func_2E55(param_00,param_01)
{
	var_02 = param_01["script_noteworthy"];
	if(!isdefined(level.var_2E21[self.inliveplayerkillstreak][var_02]["arrival"]))
	{
		return param_00;
	}

	var_03 = getmovedelta(level.var_2E21[self.inliveplayerkillstreak][var_02]["arrival"],0,1);
	var_03 = length(var_03);
	param_00 = param_00 - var_03;
	return param_00;
}

//Function Number: 15
lib_A521::func_2E49(param_00,param_01,param_02)
{
	self endon("death");
	self endon("stop_drone_fighting");
	self.var_C80 = param_00;
	self.var_A2E1 = undefined;
	var_03 = randomintrange(1,4);
	if(self.inliveplayerkillstreak == "axis")
	{
		if(var_03 == 1)
		{
			self.var_A2E1 = "weap_m9_fire_npc";
		}
		else if(var_03 == 2)
		{
			self.var_A2E1 = "weap_usp45sd_fire_npc";
		}

		if(var_03 == 3)
		{
			self.var_A2E1 = "weap_pecheneg_fire_npc";
		}
	}
	else
	{
		if(var_03 == 1)
		{
			self.var_A2E1 = "weap_m9_fire_npc";
		}
		else if(var_03 == 2)
		{
			self.var_A2E1 = "weap_usp45sd_fire_npc";
		}

		if(var_03 == 3)
		{
			self.var_A2E1 = "weap_pecheneg_fire_npc";
		}
	}

	self.var_41 = (0,self.var_41[1],self.var_41[2]);
	if(param_00 == "coverprone")
	{
		self moveto(self.var_2E6 + (0,0,8),0.05);
	}

	self.var_6156 = 1;
	var_04 = level.var_2E21[self.inliveplayerkillstreak][param_00];
	self.var_2651 = var_04["death"];
	while(isdefined(self))
	{
		lib_A521::func_2E9F(var_04["idle"][randomint(var_04["idle"].size)]);
		if(common_scripts\utility::cointoss() && !isdefined(self.ignoreall))
		{
			var_05 = 1;
			if(isdefined(var_04["pop_up_chance"]))
			{
				var_05 = var_04["pop_up_chance"];
			}

			var_05 = var_05 * 100;
			var_06 = 1;
			if(randomfloat(100) > var_05)
			{
				var_06 = 0;
			}

			if(var_06 == 1)
			{
				lib_A521::func_2E9F(var_04["hide_2_aim"]);
				wait(function_0063(var_04["hide_2_aim"]) - 0.5);
			}

			if(isdefined(var_04["fire"]))
			{
				if(param_00 == "coverprone" && var_06 == 1)
				{
					thread lib_A521::func_2E9E(var_04["fire_exposed"],1);
				}
				else
				{
					thread lib_A521::func_2E9E(var_04["fire"],1);
				}

				lib_A521::func_2E4E();
			}
			else
			{
				lib_A521::func_2EB9();
				wait(0.15);
				lib_A521::func_2EB9();
				wait(0.15);
				lib_A521::func_2EB9();
				wait(0.15);
				lib_A521::func_2EB9();
			}

			if(var_06 == 1)
			{
				lib_A521::func_2E9F(var_04["aim_2_hide"]);
			}

			lib_A521::func_2E9F(var_04["reload"]);
		}
	}
}

//Function Number: 16
lib_A521::func_2E4E()
{
	self endon("death");
	if(common_scripts\utility::cointoss())
	{
		lib_A521::func_2EB9();
		wait(0.1);
		lib_A521::func_2EB9();
		wait(0.1);
		lib_A521::func_2EB9();
		if(common_scripts\utility::cointoss())
		{
			wait(0.1);
			lib_A521::func_2EB9();
		}

		if(common_scripts\utility::cointoss())
		{
			wait(0.1);
			lib_A521::func_2EB9();
			wait(0.1);
			lib_A521::func_2EB9();
			wait(0.1);
		}

		if(common_scripts\utility::cointoss())
		{
			wait(randomfloatrange(1,2));
			return;
		}

		return;
	}

	lib_A521::func_2EB9();
	wait(randomfloatrange(0.25,0.75));
	lib_A521::func_2EB9();
	wait(randomfloatrange(0.15,0.75));
	lib_A521::func_2EB9();
	wait(randomfloatrange(0.15,0.75));
	lib_A521::func_2EB9();
	wait(randomfloatrange(0.15,0.75));
}

//Function Number: 17
lib_A521::func_2EB9()
{
	self endon("death");
	self notify("firing");
	self endon("firing");
	lib_A521::func_2EBC();
	var_00 = %exposed_crouch_shoot_auto_v2;
	self method_8145(var_00,1,0.2,1);
	common_scripts\utility::delaycall(0.25,::method_8142,var_00,0);
}

//Function Number: 18
lib_A521::func_2EBC()
{
	var_00 = common_scripts\utility::getfx("pdrone_flash_wv");
	if(self.inliveplayerkillstreak == "allies")
	{
		var_00 = common_scripts\utility::getfx("pdrone_flash_wv");
	}

	if(isdefined(self.var_6020))
	{
		var_00 = common_scripts\utility::getfx(self.var_6020);
	}

	if(!isdefined(self.var_613B))
	{
		thread lib_A521::func_2EA0(self.var_A2E1);
	}

	playfxontag(var_00,self,"tag_flash");
}

//Function Number: 19
lib_A521::func_2EA0(param_00)
{
	self playsoundasmaster(param_00);
}

//Function Number: 20
lib_A521::func_2EEE()
{
	self endon("death");
	self waittill("move");
	thread lib_A521::func_2E94();
}

//Function Number: 21
lib_A521::func_3CC7(param_00)
{
	var_01 = 170;
	var_02 = 1;
	var_03 = function_0063(param_00);
	var_04 = getmovedelta(param_00,0,1);
	var_05 = length(var_04);
	if(var_03 > 0 && var_05 > 0)
	{
		var_01 = var_05 / var_03;
		var_02 = 0;
	}

	if(isdefined(self.var_2EA9))
	{
		var_01 = self.var_2EA9;
	}

	var_06 = spawnstruct();
	var_06.var_C04 = var_02;
	var_06.var_76B4 = var_01;
	var_06.var_C44 = var_03;
	return var_06;
}

//Function Number: 22
lib_A521::func_2E54()
{
	var_00 = lib_A521::func_407A(self.target,self.var_2E6);
	var_01 = var_00[var_00.size - 2]["target"];
	var_02 = getnode(var_01,"targetname");
	if(!isdefined(var_02))
	{
		var_03 = getnodesonpath(var_00[var_00.size - 1]["origin"],var_00[var_00.size - 1]["origin"]);
		var_02 = var_03[var_03.size - 1];
	}

	return var_02;
}

//Function Number: 23
lib_A521::func_2E94()
{
	self endon("death");
	self endon("drone_stop");
	wait(0.05);
	var_00 = lib_A521::func_407A(self.target,self.var_2E6);
	var_01 = level.var_2E21[self.inliveplayerkillstreak]["stand"]["run"];
	if(isdefined(self.var_76C1))
	{
		var_01 = self.var_76C1;
	}

	var_02 = lib_A521::func_3CC7(var_01);
	var_03 = var_02.var_76B4;
	var_04 = var_02.var_C04;
	if(isdefined(self.var_2E95))
	{
		var_02 = [[ self.var_2E95 ]]();
		if(isdefined(var_02))
		{
			var_01 = var_02.var_76C1;
			var_03 = var_02.var_76B4;
			var_04 = var_02.var_C04;
		}

		var_02 = undefined;
	}

	if(!var_04)
	{
		thread lib_A521::func_2E97(var_03);
	}

	lib_A521::func_2E9E(var_01,self.var_5F62);
	var_05 = 0.5;
	var_06 = 0;
	self.var_8D0A = 1;
	self.var_24BF = var_00[var_06];
	var_07 = 0;
	var_08 = undefined;
	for(;;)
	{
		if(!isdefined(var_00[var_06]))
		{
			break;
		}

		var_09 = var_00[var_06]["vec"];
		var_0A = self.var_2E6 - var_00[var_06]["origin"];
		var_0B = vectordot(vectornormalize(var_09),var_0A);
		if(!isdefined(var_00[var_06]["dist"]))
		{
			break;
		}

		var_0C = var_0B + level.var_2E89;
		while(var_0C > var_00[var_06]["dist"])
		{
			var_0C = var_0C - var_00[var_06]["dist"];
			var_06++;
			self.var_24BF = var_00[var_06];
			if(isdefined(var_08))
			{
				if(var_06 == 0)
				{
				}

				if(!isdefined(self.var_136C))
				{
					self.var_136C = self.var_2EF6;
				}

				var_0D = level.var_2E21[self.inliveplayerkillstreak]["stairs"][var_08];
				lib_A521::func_2E9E(var_0D,self.var_5F62);
				var_07 = 1;
			}

			if(!isdefined(var_00[var_06]["dist"]))
			{
				self rotateto(vectortoangles(var_00[var_00.size - 1]["vec"]),var_05);
				var_0E = distance(self.var_2E6,var_00[var_00.size - 1]["origin"]);
				var_0F = var_0E / var_03 * self.var_5F62;
				var_10 = var_00[var_00.size - 1]["origin"] + (0,0,100);
				var_11 = var_00[var_00.size - 1]["origin"] - (0,0,100);
				var_12 = physicstrace(var_10,var_11);
				if(getdvar("debug_drones") == "1")
				{
					thread common_scripts\utility::draw_line_for_time(var_10,var_11,1,1,1,var_05);
					thread common_scripts\utility::draw_line_for_time(self.var_2E6,var_12,0,0,1,var_05);
				}

				self moveto(var_12,var_0F);
				wait(var_0F);
				self notify("goal");
				thread lib_A521::func_1CB6();
				thread lib_A521::func_2E5B(var_00[var_00.size - 1],var_12);
				return;
			}

			if(!isdefined(var_03[var_09]))
			{
				self notify("goal");
				thread lib_A521::func_2E5B();
				return;
			}
		}

		if(isdefined(self.var_2E95))
		{
			var_05 = [[ self.var_2E95 ]]();
			if(isdefined(var_05))
			{
				if(var_05.var_76C1 != var_04)
				{
					var_04 = var_05.var_76C1;
					var_06 = var_05.var_76B4;
					var_07 = var_05.var_C04;
					if(!var_07)
					{
						thread lib_A521::func_2E97(var_06);
					}
					else
					{
						self notify("drone_move_z");
					}

					lib_A521::func_2E9E(var_04,self.var_5F62);
				}
			}
		}

		self.var_24BF = var_03[var_09];
		var_11 = var_03[var_09]["vec"] * var_10;
		var_11 = var_11 + var_03[var_09]["origin"];
		var_15 = var_11;
		var_16 = var_15 + (0,0,100);
		var_17 = var_15 - (0,0,100);
		var_15 = physicstrace(var_16,var_17);
		if(!var_07)
		{
			self.var_2E87 = var_15;
		}

		if(getdvar("debug_drones") == "1")
		{
			thread common_scripts\utility::draw_line_for_time(var_16,var_17,1,1,1,var_08);
			thread lib_A521::func_2DC0(var_15,1,0,0,16,var_08);
		}

		var_0E = vectortoangles(var_15 - self.var_2E6);
		self rotateto((0,var_0E[1],0),var_08);
		var_0F = var_06 * var_08 * self.var_5F62;
		var_12 = vectornormalize(var_15 - self.var_2E6);
		var_11 = var_12 * var_0F;
		var_11 = var_11 + self.var_2E6;
		if(getdvar("debug_drones") == "1")
		{
			thread common_scripts\utility::draw_line_for_time(self.var_2E6,var_11,0,0,1,var_08);
		}

		self moveto(var_11,var_08);
		wait(var_08);
		if(isdefined(self.var_24BF["script_noteworthy"]) && self.var_24BF["script_noteworthy"] == "stairs_start_up" || self.var_24BF["script_noteworthy"] == "stairs_start_down")
		{
			var_18 = strtok(self.var_24BF["script_noteworthy"],"_");
			var_0B = var_18[2];
			continue;
		}

		if(var_0A == 1)
		{
			if(isdefined(self.var_24BF["script_noteworthy"]) && self.var_24BF["script_noteworthy"] == "stairs_end")
			{
				var_19 = self.var_136C;
				lib_A521::func_2E9E(var_19,self.var_5F62);
				var_0A = 0;
				var_0B = undefined;
			}
		}
	}

	thread lib_A521::func_2E5B();
}

//Function Number: 24
lib_A521::func_2E97(param_00)
{
	self endon("death");
	self endon("drone_stop");
	self notify("drone_move_z");
	self endon("drone_move_z");
	var_01 = 0.05;
	for(;;)
	{
		if(isdefined(self.var_2E87) && param_00 > 0)
		{
			var_02 = self.var_2E87[2] - self.var_2E6[2];
			var_03 = distance2d(self.var_2E87,self.var_2E6);
			var_04 = var_03 / param_00;
			if(var_04 > 0 && var_02 != 0)
			{
				var_05 = abs(var_02) / var_04;
				var_06 = var_05 * var_01;
				if(var_02 >= var_05)
				{
					self.var_2E6 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2] + var_06);
				}
				else if(var_02 <= var_05 * -1)
				{
					self.var_2E6 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2] - var_06);
				}
			}
		}

		wait(var_01);
	}
}

//Function Number: 25
lib_A521::func_407A(param_00,param_01)
{
	var_02 = 1;
	var_03 = [];
	var_03[0]["origin"] = param_01;
	var_03[0]["dist"] = 0;
	var_04 = undefined;
	var_04 = param_00;
	var_05["entity"] = ::lib_A577::func_3E88;
	var_05["node"] = ::lib_A577::func_3E8A;
	var_05["struct"] = ::lib_A577::func_3E8C;
	var_06 = undefined;
	var_07 = [[ var_05["entity"] ]](var_04);
	var_08 = [[ var_05["node"] ]](var_04);
	var_09 = [[ var_05["struct"] ]](var_04);
	if(var_07.size)
	{
		var_06 = "entity";
	}
	else if(var_08.size)
	{
		var_06 = "node";
	}
	else if(var_09.size)
	{
		var_06 = "struct";
	}

	var_0A = var_03.size;
	for(;;)
	{
		var_0B = [[ var_05[var_06] ]](var_04);
		var_0C = common_scripts\utility::random(var_0B);
		if(!isdefined(var_0C))
		{
			break;
		}

		var_0A = var_03.size;
		var_0D = var_0C.var_2E6;
		if(isdefined(var_0C.radius))
		{
			if(!isdefined(self.var_2F18))
			{
				self.var_2F18 = -1 + randomfloat(2);
			}

			if(!isdefined(var_0C.var_41))
			{
				var_0C.var_41 = (0,0,0);
			}

			var_0E = anglestoforward(var_0C.var_41);
			var_0F = anglestoright(var_0C.var_41);
			var_10 = anglestoup(var_0C.var_41);
			var_11 = (0,self.var_2F18 * var_0C.radius,0);
			var_0D = var_0D + var_0E * var_11[0];
			var_0D = var_0D + var_0F * var_11[1];
			var_0D = var_0D + var_10 * var_11[2];
		}

		var_03[var_0A]["origin"] = var_0D;
		var_03[var_0A]["target"] = var_0C.target;
		if(isdefined(self.script_parameters) && self.script_parameters == "use_last_node_angles" && isdefined(var_0C.var_41))
		{
			var_03[var_0A]["angles"] = var_0C.var_41;
		}

		if(isdefined(var_0C.var_39B))
		{
			var_03[var_0A]["script_noteworthy"] = var_0C.var_39B;
		}

		if(isdefined(var_0C.script_linkname))
		{
			var_03[var_0A]["script_linkname"] = var_0C.script_linkname;
		}

		var_03[var_0A - 1]["dist"] = distance(var_03[var_0A]["origin"],var_03[var_0A - 1]["origin"]);
		var_03[var_0A - 1]["vec"] = vectornormalize(var_03[var_0A]["origin"] - var_03[var_0A - 1]["origin"]);
		if(!isdefined(var_03[var_0A - 1]["target"]))
		{
			var_03[var_0A - 1]["target"] = var_0C.targetname;
		}

		if(!isdefined(var_03[var_0A - 1]["script_noteworthy"]) && isdefined(var_0C.var_39B))
		{
			var_03[var_0A - 1]["script_noteworthy"] = var_0C.var_39B;
		}

		if(!isdefined(var_03[var_0A - 1]["script_linkname"]) && isdefined(var_0C.script_linkname))
		{
			var_03[var_0A - 1]["script_linkname"] = var_0C.script_linkname;
		}

		if(!isdefined(var_0C.target))
		{
			break;
		}

		var_04 = var_0C.target;
	}

	if(isdefined(self.script_parameters) && self.script_parameters == "use_last_node_angles" && isdefined(var_03[var_0A]["angles"]))
	{
		var_03[var_0A]["vec"] = anglestoforward(var_03[var_0A]["angles"]);
	}
	else
	{
		var_03[var_0A]["vec"] = var_03[var_0A - 1]["vec"];
	}

	var_0C = undefined;
	return var_03;
}

//Function Number: 26
lib_A521::func_2DC0(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_00 + (param_04,0,0);
	var_07 = param_00 - (param_04,0,0);
	thread common_scripts\utility::draw_line_for_time(var_06,var_07,param_01,param_02,param_03,param_05);
	var_06 = param_00 + (0,param_04,0);
	var_07 = param_00 - (0,param_04,0);
	thread common_scripts\utility::draw_line_for_time(var_06,var_07,param_01,param_02,param_03,param_05);
	var_06 = param_00 + (0,0,param_04);
	var_07 = param_00 - (0,0,param_04);
	thread common_scripts\utility::draw_line_for_time(var_06,var_07,param_01,param_02,param_03,param_05);
}

//Function Number: 27
lib_A521::func_1CB6()
{
	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(self.var_39B))
	{
		return;
	}

	switch(self.var_39B)
	{
		case "delete_on_goal":
			break;

		case "die_on_goal":
			break;
	}
}