/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42397.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 56
 * Decompile Time: 25 ms
 * Timestamp: 4/20/2022 8:23:26 PM
*******************************************************************/

//Function Number: 1
lib_A59D::main()
{
	lib_A59D::func_4D6E();
	lib_A59D::func_41D4();
}

//Function Number: 2
lib_A59D::func_4D6E()
{
	if(isdefined(level.var_31D.var_9C57))
	{
		return;
	}

	var_00["normal"][0] = "tracking_grenade_var";
	var_00["normal"][1] = "contact_grenade_var";
	var_00["normal"][2] = "frag_grenade_var";
	var_00["special"][0] = "paint_grenade_var";
	var_00["special"][1] = "flash_grenade_var";
	var_00["special"][2] = "emp_grenade_var";
	level.var_31D.var_9C57 = var_00;
	var_01 = [];
	var_01["frag_grenade_var"] = 1;
	var_01["contact_grenade_var"] = 2;
	var_01["tracking_grenade_var"] = 3;
	var_01["paint_grenade_var"] = 4;
	var_01["flash_grenade_var"] = 5;
	var_01["emp_grenade_var"] = 6;
	level.var_31D.var_9C5A = var_01;
	common_scripts\utility::flag_init("variable_grenade_switch");
	level.var_31D.var_2997 = 1000;
	level.var_31D.var_2998 = 1.75;
	level.var_31D.var_2994 = 15;
	level.var_31D.var_9315 = "enhanceable";
	foreach(var_03 in ["normal","special"])
	{
		foreach(var_05 in var_00[var_03])
		{
			precacheitem(var_05);
		}
	}

	precacheitem("smart_grenade");
	precachemodel("npc_variable_grenade_lethal");
	var_08 = function_00DA("axis");
	if(var_08.size > 0)
	{
		lib_A59A::func_D0B(var_08,::lib_A59D::func_4549);
	}

	lib_A59D::func_454B();
	lib_A59D::func_4CF3();
	lib_A59D::func_6ECF();
	level.var_31D thread lib_A59D::target_enhancer_think();
}

//Function Number: 3
lib_A59D::func_454B()
{
	var_00 = veh_getspawnerarray();
	var_01 = [];
	foreach(var_03 in var_00)
	{
		if(isdefined(var_03.var_7AE9) && var_03.var_7AE9 == "axis")
		{
			if(isdefined(var_03.script_parameters) && issubstr(var_03.script_parameters,"threat_detectable"))
			{
				var_01 = common_scripts\utility::add_to_array(var_01,var_03);
				continue;
			}

			if(issubstr(var_03.classname,"pdrone"))
			{
				var_01 = common_scripts\utility::add_to_array(var_01,var_03);
			}
		}
	}

	if(var_01.size > 0)
	{
		lib_A59A::func_D0B(var_01,::lib_A59D::func_4549);
	}

	var_05 = getentarray("script_vehicle_pdrone_kva","classname");
	if(var_05.size > 0)
	{
		lib_A59A::func_D0B(var_05,::lib_A59D::func_4549);
	}

	var_06 = getentarray("enemy_walker","targetname");
	if(var_06.size > 0)
	{
		lib_A59A::func_D0D("enemy_walker",::lib_A59D::func_4549);
	}

	foreach(var_08 in getentarray("actor_enemy_dog","classname"))
	{
		if(isspawner(var_08))
		{
			var_08 lib_A59A::func_798(::lib_A59D::func_4549);
			continue;
		}

		var_08 thread lib_A59D::func_4549();
	}
}

//Function Number: 4
lib_A59D::func_41D4()
{
	lib_A59D::func_4D6E();
	var_00 = 0;
	var_01 = level.var_31D getweaponslistoffhands();
	if(!isdefined(var_01) || var_01.size == 0)
	{
		var_00 = 1;
	}
	else
	{
		foreach(var_03 in var_01)
		{
			if(!isdefined(level.var_31D lib_A59D::func_3DA7(var_03)))
			{
				var_00 = 1;
				break;
			}
		}
	}

	if(var_00)
	{
		foreach(var_03 in level.var_31D getweaponslistoffhands())
		{
			level.var_31D takeweapon(var_03);
		}

		level.var_31D setoffhandprimaryclass(level.var_31D.var_9C57["normal"][0]);
		level.var_31D giveweapon(level.var_31D.var_9C57["normal"][0]);
		level.var_31D setoffhandsecondaryclass(level.var_31D.var_9C57["special"][0]);
		level.var_31D giveweapon(level.var_31D.var_9C57["special"][0]);
	}

	common_scripts\utility::flag_set("variable_grenade_switch");
	level.var_31D thread lib_A59D::func_5DA9();
	level.var_31D thread lib_A59D::func_5DCE();
}

//Function Number: 5
lib_A59D::func_7EF3(param_00,param_01)
{
	foreach(var_03 in level.var_31D getweaponslistoffhands())
	{
		level.var_31D takeweapon(var_03);
	}

	level.var_31D setoffhandprimaryclass(param_00);
	level.var_31D giveweapon(param_00);
	level.var_31D setoffhandsecondaryclass(param_01);
	level.var_31D giveweapon(param_01);
	common_scripts\utility::flag_clear("variable_grenade_switch");
}

//Function Number: 6
lib_A59D::func_3DDC(param_00)
{
	if(!isdefined(param_00))
	{
		return undefined;
	}

	var_01 = undefined;
	foreach(var_03 in ["normal","special"])
	{
		if(common_scripts\utility::array_contains(self.var_9C57[var_03],param_00))
		{
			var_01 = var_03;
			break;
		}
	}

	return var_01;
}

//Function Number: 7
lib_A59D::func_3DA7(param_00)
{
	var_01 = lib_A59D::func_3DDC(param_00);
	if(!isdefined(var_01))
	{
		return undefined;
	}

	foreach(var_04, var_03 in self.var_9C57[var_01])
	{
		if(var_03 == param_00)
		{
			return var_04;
		}
	}
}

//Function Number: 8
lib_A59D::func_5DA9()
{
	self endon("death");
	self notify("new_monitor_grenade_fire");
	self endon("new_monitor_grenade_fire");
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		var_02 = lib_A59D::func_3DDC(var_01);
		if(!isdefined(var_02))
		{
			wait 0.05;
			continue;
		}

		foreach(var_04 in ["normal","special"])
		{
			if(common_scripts\utility::array_contains(self.var_9C57[var_04],var_01))
			{
				thread lib_A59D::func_4853();
			}
		}

		if(issubstr(var_01,"emp_grenade_var"))
		{
			var_00 thread lib_A59D::func_306C(self);
			continue;
		}

		if(issubstr(var_01,"paint_grenade_var"))
		{
			var_00 thread lib_A59D::detection_grenade_think(self);
			continue;
		}

		if(issubstr(var_01,"tracking_grenade_var"))
		{
			var_00 thread lib_A59D::func_94C9(self);
		}
	}
}

//Function Number: 9
lib_A59D::func_43F4(param_00)
{
	if(isdefined(level.var_31D.var_9C59))
	{
		return;
	}

	level.var_31D.var_9C59 = 1;
	setomnvar("ui_grenade_screen",1);
	if(common_scripts\utility::flag("variable_grenade_switch"))
	{
		thread lib_A59D::func_84D0(param_00);
	}
}

//Function Number: 10
lib_A59D::func_43F3()
{
	if(!isdefined(level.var_31D.var_9C59))
	{
		return;
	}

	level.var_31D.var_9C59 = undefined;
	setomnvar("ui_grenade_screen",0);
	if(common_scripts\utility::flag("variable_grenade_switch"))
	{
		thread lib_A59D::func_4853();
	}
}

//Function Number: 11
lib_A59D::func_5DCE()
{
	self endon("death");
	self notify("new_monitor_offhand_cycle");
	self endon("new_monitor_offhand_cycle");
	var_00 = ["current","previous"];
	var_00["previous"] = spawnstruct();
	var_00["current"] = spawnstruct();
	var_00["current"].var_5086 = 0;
	var_00["current"].var_5035 = 0;
	var_00["current"].var_506D = 0;
	childthread lib_A59D::func_5D7B();
	childthread lib_A59D::func_5E06();
	for(;;)
	{
		var_01 = var_00["previous"];
		var_00["previous"] = var_00["current"];
		var_00["current"] = var_01;
		var_02 = self getcurrentoffhand();
		var_03 = lib_A59D::func_3DDC(var_02);
		if(!isdefined(var_03))
		{
			lib_A59D::func_43F3();
			wait 0.05;
			continue;
		}

		var_00["current"].var_506D = self method_83AF();
		var_00["current"].var_5035 = self method_83AD() || self method_83AF() || self method_83AE();
		var_00["current"].var_5086 = var_00["current"].var_5035 && self usebuttonpressed() || self.var_43E1;
		var_04 = var_00["current"].var_506D && !var_00["previous"].var_506D;
		var_05 = var_00["current"].var_5086 && !var_00["previous"].var_5086;
		var_06 = var_00["current"].var_5035 && !var_00["previous"].var_5035;
		var_07 = !var_00["current"].var_5035 && var_00["previous"].var_5035;
		if(common_scripts\utility::flag("variable_grenade_switch") && var_00["current"].var_5035 && var_05)
		{
			lib_A59D::func_2572();
		}

		self.var_43E1 = 0;
		if(var_04)
		{
			lib_A59D::func_43F4(var_03);
		}
		else if(var_07)
		{
			lib_A59D::func_43F3();
		}

		if(var_04 || var_06 || var_05)
		{
			var_02 = self getcurrentoffhand();
			var_08 = level.var_31D.var_9C5A[var_02];
			setomnvar("ui_grenade_type",var_08);
		}

		wait 0.05;
	}
}

//Function Number: 12
lib_A59D::func_5D7B()
{
	self.var_43E1 = 0;
	if(isdefined(level.ps4) && level.ps4)
	{
		for(;;)
		{
			var_00 = self method_8527();
			if(lengthsquared(var_00) > 0)
			{
				if(abs(var_00[0]) > abs(var_00[1]))
				{
					if(var_00[0] < 0)
					{
						self.var_43E1 = 1;
					}
					else
					{
						self.var_43E1 = 4;
					}
				}
				else if(var_00[1] < 0)
				{
					self.var_43E1 = 3;
				}
				else
				{
					self.var_43E1 = 2;
				}

				wait 0.05;
			}

			wait 0.05;
		}
	}
}

//Function Number: 13
lib_A59D::func_5E06()
{
	if(isdefined(level.xb3) && level.xb3)
	{
		self waittill("speechCommand",var_00,var_01);
		if(var_00 > 0.7 && self method_83AD() || self method_83AF() || self method_83AE())
		{
			var_02 = undefined;
			var_03 = undefined;
			var_04 = undefined;
			var_05 = self getcurrentoffhand();
			if(!isdefined(var_05))
			{
				continue;
			}

			var_06 = lib_A59D::func_3DDC(var_05);
			if(!isdefined(var_06))
			{
				continue;
			}

			switch(var_01)
			{
				case "next_var":
					break;

				case "previous_var":
					break;

				case "frag_var":
					break;

				case "smart_var":
					break;

				case "emp_var":
					break;

				case "contact_var":
					break;

				case "flash_var":
					break;

				case "threat_var":
					break;
			}
		}
	}
}

//Function Number: 14
lib_A59D::func_2572()
{
	var_00 = self getcurrentoffhand();
	if(isdefined(var_00))
	{
		var_01 = lib_A59D::func_3DDC(var_00);
		var_02 = lib_A59D::func_3DA7(var_00);
		if(isdefined(var_01) && isdefined(var_02))
		{
			var_03 = var_02;
			if(self.var_43E1 > 0 && self.var_43E1 - 1 < self.var_9C57[var_01].size)
			{
				var_03 = self.var_43E1 - 1;
			}
			else if(self.var_43E1 == 0)
			{
				var_03 = var_02 + 1 % self.var_9C57[var_01].size;
			}

			if(var_03 != var_02)
			{
				lib_A59D::func_4640(var_01,var_03);
				lib_A5DE::snd_message("variable_grenade_type_switch",var_03);
				return;
			}

			return;
		}

		return;
	}
}

//Function Number: 15
lib_A59D::func_4640(param_00,param_01)
{
	var_02 = 0;
	foreach(var_04 in self getweaponslistoffhands())
	{
		if(common_scripts\utility::array_contains(self.var_9C57[param_00],var_04))
		{
			var_02 = int(max(var_02,self getweaponammostock(var_04)));
			self takeweapon(var_04);
		}
	}

	if(param_00 == "special")
	{
		self setoffhandsecondaryclass(self.var_9C57[param_00][param_01]);
	}
	else
	{
		self setoffhandprimaryclass(self.var_9C57[param_00][param_01]);
	}

	self giveweapon(self.var_9C57[param_00][param_01]);
	self setweaponammostock(self.var_9C57[param_00][param_01],var_02);
}

//Function Number: 16
lib_A59D::func_4CF3()
{
	precachestring(&"VARIABLE_GRENADE_HINT_CYCLE_LETHAL");
	precachestring(&"VARIABLE_GRENADE_HINT_CYCLE_TACTICAL");
}

//Function Number: 17
lib_A59D::func_84D0(param_00)
{
	level.var_31D notify("show_grenade_hint_stop");
	if(isdefined(level.var_31D.var_43FA))
	{
		level.var_31D.var_43FA destroy();
	}

	level.var_31D endon("show_grenade_hint_stop");
	level.var_31D endon("death");
	var_01 = 1;
	var_02 = 0.75;
	var_03 = 0.95;
	var_04 = 0.4;
	var_05 = lib_A53C::func_23ED("objective",2);
	level.var_31D.var_43FA = var_05;
	level.var_31D.var_43FA endon("stop_hint");
	var_05.alpha = 0.9;
	var_05.x = 225;
	var_05.y = 150;
	var_05.alignx = "center";
	var_05.aligny = "middle";
	var_05.horzalign = "center";
	var_05.vertalign = "middle";
	var_05.foreground = 0;
	var_05.var_1EC = 1;
	var_06 = &"VARIABLE_GRENADE_HINT_CYCLE_LETHAL";
	if(param_00 == "special")
	{
		var_06 = &"VARIABLE_GRENADE_HINT_CYCLE_TACTICAL";
	}

	var_05 settext(var_06);
	var_05.alpha = 0;
	var_05 fadeovertime(var_01);
	var_05.alpha = var_03;
	wait(var_01);
	for(;;)
	{
		var_05 fadeovertime(var_02);
		var_05.alpha = var_04;
		wait(var_02);
		var_05 fadeovertime(var_02);
		var_05.alpha = var_03;
		wait(var_02);
	}
}

//Function Number: 18
lib_A59D::func_4853()
{
	level.var_31D notify("show_grenade_hint_stop");
	if(!isdefined(level.var_31D.var_43FA) || function_0294(level.var_31D.var_43FA))
	{
		return;
	}

	level.var_31D.var_43FA destroy();
}

//Function Number: 19
lib_A59D::func_6ECF()
{
	level._effect["paint_grenade"] = loadfx("vfx/explosion/paint_grenade");
	level._effect["emp_grenade"] = loadfx("vfx/explosion/emp_grenade_explosion");
	level._effect["tracking_grenade_spray_large"] = loadfx("vfx/trail/tracking_grenade_hovering");
	level._effect["tracking_grenade_spray_small"] = loadfx("vfx/trail/tracking_grenade_spay_small");
	level._effect["tracking_grenade_spray_large_homing"] = loadfx("vfx/trail/tracking_grenade_trail");
	level._effect["tracking_grenade_homing"] = loadfx("vfx/trail/tracking_grenade_geotrail");
	level._effect["tracking_grenade_impact"] = loadfx("vfx/explosion/smart_grenade_explosion");
	level._effect["tracking_grenade_water_impact_0"] = loadfx("vfx/explosion/smart_grenade_water_impact_01");
	level._effect["tracking_grenade_water_impact_1"] = loadfx("vfx/explosion/smart_grenade_water_impact_02");
	level._effect["tracking_grenade_water_impact_2"] = loadfx("vfx/explosion/smart_grenade_water_impact_03");
	level._effect["tracking_grenade_default_impact_0"] = loadfx("vfx/explosion/smart_grenade_default_impact_01");
	level._effect["tracking_grenade_default_impact_1"] = loadfx("vfx/explosion/smart_grenade_default_impact_02");
	level._effect["tracking_grenade_default_impact_2"] = loadfx("vfx/explosion/smart_grenade_default_impact_03");
}

//Function Number: 20
lib_A59D::func_3072(param_00,param_01)
{
	for(;;)
	{
		self waittill("damage",var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A,var_0B);
		if(var_06 == "MOD_IMPACT" && isplayer(var_03) && var_0B == "emp_grenade_var")
		{
			param_00 notify(param_01);
			break;
		}
	}
}

//Function Number: 21
lib_A59D::func_3078(param_00)
{
	var_01 = "wait_till_contact_or_timeout_stop";
	self endon(var_01);
	self endon("death");
	var_02 = level.var_3077;
	if(isdefined(var_02) && var_02.size > 0)
	{
		foreach(var_04 in level.var_3077)
		{
			if(isdefined(var_04))
			{
				var_04 childthread lib_A59D::func_3072(self,var_01);
			}
		}
	}

	wait(param_00);
	self notify(var_01);
}

//Function Number: 22
lib_A59D::func_306C(param_00)
{
	self endon("death");
	lib_A59D::func_3078(1);
	var_01 = 500;
	var_02 = self.var_2E6;
	var_03 = 500;
	playfx(common_scripts\utility::getfx("emp_grenade"),var_02);
	lib_A5DE::snd_message("emp_grenade_detonate");
	if(isdefined(param_00.inliveplayerkillstreak))
	{
		lib_A51B::func_2612("react_emp",param_00.inliveplayerkillstreak != "allies");
	}

	if(!isdefined(level.var_3077))
	{
		self delete();
		return;
	}

	var_04 = level.var_3077;
	foreach(var_06 in var_04)
	{
		if(!isdefined(var_06))
		{
			continue;
		}

		if(var_06 damageconetrace(var_02,self))
		{
			if(distancesquared(var_06.var_2E6,var_02) < var_01 * var_01)
			{
				if(isdefined(var_06.var_5A77) && var_06.var_5A77)
				{
					lib_A59A::func_41DA("EMP_AST");
				}

				if(isdefined(var_06.var_3068) && !isdefined(var_06.var_6FF7))
				{
					if(isdefined(var_06.vehicletype) && var_06.vehicletype == "pdrone")
					{
						if(isplayer(param_00))
						{
							param_00 lib_A565::func_72DC(self,"emp_grenade","emp_grenade_var");
						}

						var_07 = level.var_31D getplayerprofiledata("ach_flySwatter") + 1;
						level.var_31D setplayerprofiledata("ach_flySwatter",var_07);
						if(var_07 == 25)
						{
							lib_A59A::func_41DA("EMP_DRONE");
						}
					}

					var_06.var_6FF7 = 1;
					var_06 thread [[ var_06.var_3068 ]]();
					continue;
				}

				var_06 dodamage(var_03,var_02,param_00);
			}
		}
	}

	self delete();
}

//Function Number: 23
lib_A59D::detection_grenade_think(param_00,param_01,param_02,param_03)
{
	self endon("death");
	if(!isdefined(param_01))
	{
		param_01 = level.var_31D.var_2997;
	}

	if(!isdefined(param_02))
	{
		param_02 = level.var_31D.var_2998;
	}

	if(!isdefined(param_03))
	{
		if(isdefined(level.var_31D.var_2995))
		{
			param_03 = level.var_31D.var_2994 + level.var_31D.var_2995;
		}
		else
		{
			param_03 = level.var_31D.var_2994;
		}
	}

	wait(1);
	if(isdefined(param_00))
	{
		thread lib_A59D::detection_grenade_hud_effect(param_00,param_01,param_02);
		thread lib_A59D::detection_highlight_hud_effect(param_00,param_03);
	}

	playfx(common_scripts\utility::getfx("paint_grenade"),self.var_2E6);
	lib_A5DE::snd_message("paint_grenade_detonate");
	self.var_31C9 = function_00D6("axis");
	self.var_31C9 = common_scripts\utility::array_combine(self.var_31C9,lib_A59D::func_3E93());
	var_04 = "grenade";
	var_05 = 0;
	foreach(var_07 in self.var_31C9)
	{
		if(!isdefined(var_07))
		{
			continue;
		}
		else if(!isalive(var_07))
		{
			if(!var_07 lib_A59D::func_5099())
			{
				continue;
			}
		}

		if(distance(var_07.var_2E6,self.var_2E6) < param_01)
		{
			var_05++;
			self.var_11A[var_04] = 0;
			var_08 = distance(var_07.var_2E6,self.var_2E6) * param_02 / param_01;
			var_07 lib_A59A::delaythread(var_08,::lib_A59D::func_45B4,var_04,param_03 - var_08);
		}
	}

	if(var_05 >= 10)
	{
		lib_A59A::func_41DA("THREAT_GRENADE_KILL");
	}

	level.var_31D notify("threat_grenade_marking_started",self);
	wait 0.05;
	self delete();
}

//Function Number: 24
lib_A59D::func_3E93()
{
	var_00 = [];
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("script_vehicle_pdrone_kva","classname"));
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("script_vehicle_walker_tank","classname"));
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("actor_enemy_dog","classname"));
	var_01 = lib_A59A::func_4150();
	foreach(var_03 in var_01)
	{
		if(isdefined(var_03.var_7AE9) && var_03.var_7AE9 == "axis")
		{
			if(isdefined(var_03.script_parameters) && issubstr(var_03.script_parameters,"threat_detectable"))
			{
				var_00 = common_scripts\utility::add_to_array(var_00,var_03);
			}
			else if(issubstr(var_03.classname,"pdrone"))
			{
				var_00 = common_scripts\utility::add_to_array(var_00,var_03);
			}

			if(isdefined(var_03.mgturret))
			{
				foreach(var_05 in var_03.mgturret)
				{
					var_00 = common_scripts\utility::add_to_array(var_00,var_05);
				}
			}
		}
	}

	return var_00;
}

//Function Number: 25
lib_A59D::func_299B(param_00,param_01)
{
	if(!isdefined(param_00.detection_highlight_hud_effect))
	{
		param_00.detection_highlight_hud_effect = newclienthudelem(param_00);
		param_00.detection_highlight_hud_effect.color = (0.2,0.01,0.01);
		param_00.detection_highlight_hud_effect.alpha = 1;
	}

	param_00.detection_highlight_hud_effect method_83A4(param_01);
}

//Function Number: 26
lib_A59D::func_299F(param_00)
{
	if(isdefined(param_00.detection_highlight_hud_effect))
	{
		param_00.detection_highlight_hud_effect destroy();
		param_00.detection_highlight_hud_effect = undefined;
	}
}

//Function Number: 27
lib_A59D::func_1C76(param_00)
{
	level.var_31D.var_9315 = param_00;
	var_01 = function_00D6("axis");
	foreach(var_03 in var_01)
	{
		if(!isdefined(var_03.var_6782) && !isdefined(var_03.var_6F2F))
		{
			var_03 method_84ED(param_00);
		}
	}
}

//Function Number: 28
lib_A59D::detection_highlight_hud_effect(param_00,param_01)
{
	param_00 notify("detection_highlight_hud_effect");
	param_00 endon("detection_highlight_hud_effect");
	lib_A59D::func_299B(param_00,param_01);
	wait(param_01);
	lib_A59D::func_299F(param_00);
}

//Function Number: 29
lib_A59D::detection_grenade_hud_effect(param_00,param_01,param_02)
{
	var_03 = newclienthudelem(param_00);
	var_03.x = self.var_2E6[0];
	var_03.y = self.var_2E6[1];
	var_03.z = self.var_2E6[2];
	var_03.color = (0.2,0.01,0.01);
	var_03.alpha = 0.1;
	var_04 = 500;
	var_03 method_83A3(int(param_01 + var_04 / 2),int(var_04),param_02 + 0.05);
	wait(param_02);
	var_03 destroy();
}

//Function Number: 30
lib_A59D::func_4549()
{
	self notify("handle_detection");
	self endon("handle_detection");
	self endon("death");
	if(lib_A59E::func_51FA() && isdefined(self.mgturret))
	{
		foreach(var_01 in self.mgturret)
		{
			var_01 thread lib_A59D::func_4549();
		}
	}

	thread lib_A59D::func_454A();
	self.var_11A = [];
	var_03 = self.var_6156;
	lib_A59D::func_9A46();
	for(;;)
	{
		self waittill("detected");
		var_04 = 0;
		foreach(var_06 in self.var_11A)
		{
			if(var_06)
			{
				var_04++;
			}
		}

		if(var_04 == 1)
		{
			var_03 = self.var_6156;
			self.var_6156 = 1;
			lib_A59D::func_5999();
		}

		for(var_08 = 1;var_08;var_08 = 1)
		{
			self waittill("no_longer_detected");
			var_08 = 0;
			if(self.var_11A.size == 0)
			{
				lib_A59D::func_9A46();
				self.mark_fx = undefined;
				self.var_6156 = var_03;
				continue;
			}
		}
	}
}

//Function Number: 31
lib_A59D::func_45B4(param_00,param_01)
{
	self endon("death");
	self notify("marking_" + param_00);
	self endon("marking_" + param_00);
	self.var_11A[param_00] = 1;
	self notify("detected");
	if(isdefined(param_01))
	{
		wait(param_01);
		lib_A59D::func_9A45(param_00);
	}
}

//Function Number: 32
lib_A59D::func_9A45(param_00)
{
	self.var_11A[param_00] = undefined;
	self notify("no_longer_detected");
}

//Function Number: 33
lib_A59D::func_5999()
{
	if(isdefined(self.var_6F2F))
	{
		return;
	}

	self.var_6782 = "marked";
	self method_84ED("detected");
}

//Function Number: 34
lib_A59D::func_9A46()
{
	if(isdefined(self))
	{
		if(isalive(self))
		{
			self.var_6782 = undefined;
			self method_84ED(level.var_31D.var_9315);
			return;
		}

		self method_84ED("disabled");
	}
}

//Function Number: 35
lib_A59D::func_1EBC()
{
	if(isdefined(self))
	{
		self method_84ED("disable");
	}
}

//Function Number: 36
lib_A59D::func_454A()
{
	common_scripts\utility::waittill_any("death","emp_death");
	var_00 = undefined;
	lib_A59D::func_1EBC();
}

//Function Number: 37
lib_A59D::func_5099()
{
	return self.code_classname == "script_vehicle";
}

//Function Number: 38
lib_A59D::func_94C9(param_00)
{
	var_01 = 35;
	var_02 = 20;
	var_03 = 195;
	var_04 = 0.5;
	var_05 = 1;
	var_06 = 2.5;
	var_07 = param_00 lib_A59D::func_3E62();
	var_08 = var_07 * 0.5;
	var_09 = 0.35;
	var_0A = 88;
	var_0B = 7;
	var_0C = 2112;
	var_0D = 2;
	var_0E = 0.05;
	var_0F = (0,0,-300 * var_0E);
	var_10 = 3000 * var_0E;
	var_11 = 600 * var_0E;
	var_12 = 0.2;
	var_13 = 0.6;
	var_14 = 2;
	var_15 = sin(2);
	var_16 = 0.05;
	var_17 = lib_A59D::func_5936(self);
	var_17 thread lib_A59D::func_94C3(param_00);
	var_17 thread lib_A59D::func_94C2(param_00);
	var_18 = common_scripts\utility::spawn_tag_origin();
	var_18 linkto(var_17,"",(0,0,0),(-90,0,0));
	var_19 = level.var_31D geteye();
	var_1A = anglestoforward(level.var_31D method_8036());
	var_1B = bullettrace(var_19,var_19 + var_1A * 7000,0,var_17);
	var_1C = var_1B["position"];
	var_1D = var_1A + (0,0,0.2) * 50 * 17.6;
	var_1E = (0,0,0);
	var_1F = undefined;
	var_20 = (0,0,0);
	var_21 = (0,0,0);
	var_22 = 0;
	var_23 = 0;
	var_24 = 0;
	var_25 = 0;
	lib_A5DE::snd_message("tracking_grenade_hover",var_17);
	var_26 = 0;
	while(var_26 < var_0B)
	{
		if(!isdefined(var_1F) || !isalive(var_1F) || var_26 <= var_08)
		{
			var_1F = var_17 lib_A59D::func_94C1(param_00);
			if(isdefined(var_1F) && isdefined(var_1F.inliveplayerkillstreak))
			{
				var_1F lib_A51B::func_2612("react_smart",var_1F.inliveplayerkillstreak == "allies");
			}
		}

		if(var_26 > var_07 && isdefined(var_1F) && !var_22)
		{
			var_22 = 1;
			lib_A59D::func_94C7(var_1F.var_2E6);
		}

		if(var_26 > var_08 && isdefined(var_1F) && !var_23)
		{
			var_23 = 1;
			lib_A5DE::snd_message("tracking_grenade_beep",var_17);
		}

		if(var_26 > var_07)
		{
			if(isdefined(var_1F))
			{
				var_1C = var_1F.var_2E6 + var_1F lib_A59D::func_3DF3();
			}
		}
		else
		{
			var_19 = level.var_31D geteye();
			var_1A = anglestoforward(level.var_31D method_8036());
			var_1B = bullettrace(var_19,var_19 + var_1A * 7000,0,var_17);
			var_27 = var_1B["position"];
			if(distancesquared(var_27,param_00.var_2E6) > distancesquared(var_17.var_2E6,param_00.var_2E6))
			{
				var_1C = var_27;
			}
		}

		if(var_26 > var_07)
		{
			if(vectordot(var_1C - var_17.var_2E6,var_1C - param_00.var_2E6) < 0)
			{
				break;
			}

			if(!var_24)
			{
				var_24 = 1;
				playfxontag(common_scripts\utility::getfx("tracking_grenade_homing"),var_18,"tag_origin");
				lib_A5DE::snd_message("tracking_grenade_jump",var_17);
			}

			var_28 = lib_A571::func_576A(var_26 - var_07 - var_09,0,var_0D,0,var_0C);
			var_1E = vectornormalize(var_1C - var_17.var_2E6) * var_28;
			if(var_26 < var_07 + var_09 && bullettracepassed(var_17.var_2E6,var_17.var_2E6 + (0,0,var_0A * var_09),0,undefined))
			{
				var_1E = (0,0,var_0A);
			}
			else if(!var_25)
			{
				var_25 = 1;
				lib_A5DE::snd_message("tracking_grenade_strike",var_17);
			}
		}
		else
		{
			var_19 = param_00 geteye();
			if(var_26 < var_08 || !isdefined(var_1F))
			{
				var_29 = param_00 method_8036();
			}
			else
			{
				var_29 = (0,vectortoyaw(var_18.var_2E6 - var_1A),0);
			}

			var_1A = anglestoforward(var_29);
			var_1A = (var_1A[0],var_1A[1],var_1A[2] * var_04);
			var_2A = anglestoright(var_29);
			var_2B = -1 * common_scripts\utility::sign(vectordot(var_19 - var_17.var_2E6,var_2A));
			var_2C = var_19 + var_1A * var_03 + (0,0,var_01) + var_2A * var_2B * var_02;
			var_2D = var_2C - var_17.var_2E6;
			if(isplayer(param_00) && param_00 fragbuttonpressed())
			{
				var_2E = var_06;
			}
			else
			{
				var_2E = var_06;
			}

			var_1E = var_2D * var_2E;
		}

		var_1E = var_1E + lib_A59D::func_40CB(52.8,1);
		var_2F = function_0284(var_1E - var_1D * var_13 - var_0F,var_10);
		var_2F = vectorlerp(var_2F,var_20,var_12);
		var_21 = var_21 + var_2F;
		var_21 = var_21 + common_scripts\utility::randomvector(var_16 * length(var_21));
		var_30 = length(var_21);
		if(var_30 > 0)
		{
			var_31 = anglestoup(var_17.var_41);
			var_17.var_41 = combineangles(vectortoangles(var_21),(90,0,0));
			var_32 = vectornormalize(var_21);
			var_33 = vectorcross(var_32,var_31);
			var_34 = vectorcross(var_32,var_33);
			var_35 = length(var_34);
			if(var_35 > var_15)
			{
				var_17 lib_A59D::func_94CA(var_34,"tracking_grenade_spray_small",var_32 * var_14);
				if(var_35 > 2 * var_15)
				{
					var_17 lib_A59D::func_94CA(-1 * var_34,"tracking_grenade_spray_small",var_32 * var_14 * -1);
				}
			}

			if(var_30 > var_11)
			{
				if(var_26 > var_07)
				{
					var_36 = "tracking_grenade_spray_large_homing";
				}
				else
				{
					var_36 = "tracking_grenade_spray_large";
				}

				playfxontag(common_scripts\utility::getfx(var_36),var_18,"tag_origin");
				var_21 = (0,0,0);
				var_1D = var_1D + function_0284(var_2F,var_10,var_11);
			}

			var_1D = var_1D + var_0F;
		}

		var_21 = (0,0,0);
		var_37 = var_17.var_2E6 + var_1D * 0.05;
		var_38 = bullettrace(var_17.var_2E6,var_37,1,param_00,0,1,0,0,1);
		if(isdefined(var_38["glass"]))
		{
			destroyglass(var_38["glass"],vectornormalize(var_1D));
			var_38 = bullettrace(var_17.var_2E6,var_37,1,param_00,0,1,0,0,1);
		}

		if(isdefined(var_38["entity"]) && isdefined(var_38["entity"].var_578A) && var_38["entity"].var_578A == param_00)
		{
		}
		else if(var_38["fraction"] < 1)
		{
			break;
		}

		var_17.var_2E6 = var_37;
		var_20 = var_2F;
		wait(0.05);
		var_26 = var_26 + 0.05;
	}

	var_17 lib_A59D::func_94BF(param_00,var_1D,var_18);
}

//Function Number: 39
lib_A59D::func_3E62()
{
	if(isplayer(self))
	{
		var_00 = self getcurrentweapon();
		if(isdefined(var_00) && issubstr(var_00,"microdronelaunchersmartgrenade"))
		{
			return 0.1;
		}
	}

	return 1;
}

//Function Number: 40
lib_A59D::func_7748(param_00)
{
	if(isdefined(param_00))
	{
		if(isarray(param_00))
		{
			var_01 = "(array ";
			foreach(var_04, var_03 in param_00)
			{
				var_01 = var_01 + var_04 + " -> " + lib_A59D::func_7748(var_03) + "\n";
			}

			var_01 = var_01 + ")";
			return var_01;
		}

		if(function_0294(var_04))
		{
			return "" + var_04;
		}

		if(isdefined(var_04.code_classname))
		{
			var_01 = "(entity $e" + var_04 getentitynumber() + " code_classname: \" + var_04.code_classname + "\";
			if(isspawner(var_03))
			{
				var_04 = var_04 + " (spawner)";
			}
		}
		else
		{
			var_01 = "(object";
		}

		if(isdefined(var_03.targetname))
		{
			var_04 = var_04 + " targetname: \" + var_03.targetname + "\";
		}

		if(isdefined(var_03.var_39B))
		{
			var_04 = var_04 + " script_noteworthy: \" + var_03.var_39B + "\";
		}

		if(isdefined(var_03.classname))
		{
			var_04 = var_04 + " classname: \" + var_03.classname + "\";
		}

		var_04 = var_04 + ")";
		return var_04;
	}

	if(function_0294(var_04))
	{
		return "(removed entity)";
	}

	if(var_04 == undefined)
	{
		return "(undefined)";
	}
}

//Function Number: 41
lib_A59D::func_94BF(param_00,param_01,param_02)
{
	var_03 = 150;
	var_04 = 128;
	var_05 = 1000;
	var_06 = 50;
	self notify("tracking_grenade_deactivate");
	if(distance(param_00.var_2E6,self.var_2E6) > var_03)
	{
		radiusdamage(self.var_2E6,var_04,var_05,var_06,param_00,"MOD_GRENADE","tracking_grenade_var",1);
		playfx(common_scripts\utility::getfx("tracking_grenade_impact"),self.var_2E6);
		lib_A5DE::snd_message("smart_grenade_detonate");
		thread lib_A59D::func_69CC(300,self.var_2E6);
		param_02 delete();
		self delete();
		return;
	}

	self physicslaunchserver(self.var_2E6 + common_scripts\utility::randomvector(10),param_01 * 0.1 * 0.25);
	lib_A5DE::snd_message("tracking_grenade_dud",self);
	for(var_07 = 0;var_07 < 5;var_07++)
	{
		playfxontag(common_scripts\utility::getfx("tracking_grenade_spray_large"),param_02,"tag_origin");
		wait(randomfloatrange(0.05,0.3));
	}

	param_02 delete();
	thread lib_A59D::func_94C6(param_00);
	wait(30);
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 42
lib_A59D::func_94C6(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	self endon("death");
	var_01 = spawn("trigger_radius",self.var_2E6,0,15,5);
	var_01 enablelinkto();
	var_01 linkto(self);
	thread common_scripts\utility::delete_on_death(var_01);
	for(;;)
	{
		var_01 waittill("trigger",var_02);
		if(var_02 == param_00 && var_02 getweaponammostock("tracking_grenade_var") < weaponmaxammo("tracking_grenade_var"))
		{
			break;
		}
	}

	param_00 setweaponammostock("tracking_grenade_var",param_00 getweaponammostock("tracking_grenade_var") + 1);
	self delete();
}

//Function Number: 43
lib_A59D::func_69CC(param_00,param_01)
{
	for(var_02 = 0;var_02 < 20;var_02++)
	{
		wait(0.01);
		var_03 = "tracking_grenade_water_impact_" + randomintrange(0,2);
		var_04 = "tracking_grenade_default_impact_" + randomintrange(0,2);
		var_05 = (randomfloat(2) - 1,randomfloat(2) - 1,randomfloat(-1));
		var_06 = 32 * var_05 + param_01;
		var_07 = param_00 * var_05 + param_01;
		var_08 = bullettrace(var_06,var_07,0,undefined,0,0,1,0,0);
		if(isdefined(var_08) && var_08["surfacetype"] != "none")
		{
			if(distance(var_06,var_08["position"]) > 5)
			{
				if(lib_A59D::func_5200(var_08["surfacetype"]))
				{
					playfx(common_scripts\utility::getfx(var_03),var_08["position"],var_08["normal"]);
					continue;
				}

				playfx(common_scripts\utility::getfx(var_04),var_08["position"],var_08["normal"]);
			}
		}
	}
}

//Function Number: 44
lib_A59D::func_94C3(param_00)
{
	self endon("death");
	self sentient_makeentitysentient(param_00.inliveplayerkillstreak,1);
	self waittill("damage");
	lib_A59D::func_94BF();
}

//Function Number: 45
lib_A59D::func_94C2(param_00)
{
	if(!isplayer(param_00))
	{
		return;
	}

	if(!isdefined(param_00.var_627B))
	{
		param_00.var_627B = 0;
	}

	param_00.var_627B++;
	lib_A59A::func_75D("no_tracking_grenades_active",::lib_A59D::func_610F,"tracking grenades are active");
	common_scripts\utility::waittill_either("death","tracking_grenade_deactivate");
	wait(1);
	param_00.var_627B--;
}

//Function Number: 46
lib_A59D::func_610F()
{
	return !isdefined(level.var_31D.var_627B) || level.var_31D.var_627B == 0;
}

//Function Number: 47
lib_A59D::func_94C7(param_00)
{
	badplace_cylinder("",4,param_00 + (0,0,-64),117,128,"all");
}

//Function Number: 48
lib_A59D::func_94C1(param_00)
{
	var_01 = param_00 geteye();
	var_02 = anglestoforward(param_00 method_8036());
	var_03 = cos(20);
	var_04 = undefined;
	var_05 = function_00D7(common_scripts\utility::get_enemy_team(param_00.inliveplayerkillstreak),"all");
	var_05 = common_scripts\utility::array_combine(var_05,getentarray("tracking_grenade_target","script_noteworthy"));
	var_05 = common_scripts\utility::array_combine(var_05,veh_getarray());
	foreach(var_07 in var_05)
	{
		if(var_07.code_classname == "script_vehicle" && !issentient(var_07))
		{
			continue;
		}

		if(isdefined(var_07.var_6F2F))
		{
			continue;
		}

		var_08 = undefined;
		if(isai(var_07))
		{
			var_08 = var_07 geteye();
		}
		else
		{
			var_08 = var_07.var_2E6;
		}

		var_09 = vectordot(vectornormalize(var_08 - var_01),var_02);
		if(var_09 <= var_03)
		{
			continue;
		}

		if(distancesquared(var_08,var_01) < distancesquared(self.var_2E6,var_01))
		{
			continue;
		}

		if(!sighttracepassed(self.var_2E6,var_08,0,self,var_07))
		{
			continue;
		}

		if(isdefined(var_04) && !sighttracepassed(self.var_2E6,var_08,0,self,var_07))
		{
			continue;
		}

		var_03 = var_09;
		var_04 = var_07;
	}

	return var_04;
}

//Function Number: 49
lib_A59D::func_94CA(param_00,param_01,param_02)
{
	var_03 = common_scripts\utility::spawn_tag_origin();
	if(isdefined(param_02))
	{
		var_03.var_2E6 = var_03.var_2E6 + param_02;
	}

	var_03.var_41 = vectortoangles(param_00);
	var_03 linkto(self);
	playfxontag(common_scripts\utility::getfx(param_01),var_03,"tag_origin");
	var_03 common_scripts\utility::delaycall(0.3,::delete);
}

//Function Number: 50
lib_A59D::func_40CB(param_00,param_01)
{
	var_02 = gettime() * 0.001 * param_01;
	return (function_00FE(var_02,10,1,1,1) * param_00,function_00FE(var_02,20,1,1,1) * param_00,function_00FE(var_02,30,1,1,1) * param_00);
}

//Function Number: 51
lib_A59D::func_5936(param_00)
{
	var_01 = param_00.var_2E6;
	param_00 delete();
	var_02 = spawn("script_model",var_01);
	var_02 setmodel("npc_variable_grenade_lethal");
	return var_02;
}

//Function Number: 52
lib_A59D::func_91B9()
{
	var_00 = function_00D6("axis");
	var_01 = [];
	var_02 = common_scripts\utility::spawn_tag_origin();
	function_009A(var_02);
	function_00A5(var_02,1);
	foreach(var_04 in var_00)
	{
		var_02.var_2E6 = var_04 geteye();
		if(function_009F(var_02,self,65,100))
		{
			var_01[var_01.size] = var_04;
		}
	}

	var_02 delete();
	return var_01;
}

//Function Number: 53
lib_A59D::func_3DF3()
{
	if(isai(self) && isalive(self))
	{
		var_00 = self geteye()[2];
		var_01 = self.var_2E6[2];
		var_02 = var_00 - var_01;
		return (0,0,var_02);
	}

	return (0,0,0);
}

//Function Number: 54
lib_A59D::func_5200(param_00)
{
	var_01 = ["water_waist","water_ankle","water_knee"];
	foreach(var_03 in var_01)
	{
		if(var_03 == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 55
lib_A59D::target_enhancer_think()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	var_00 = 10;
	var_01 = cos(var_00);
	var_02 = 0.5;
	var_03 = undefined;
	for(;;)
	{
		var_04 = 0;
		var_05 = getweaponattachments(self getcurrentweapon());
		if(isdefined(var_05))
		{
			foreach(var_07 in var_05)
			{
				if(var_07 == "opticstargetenhancer")
				{
					var_04 = 1;
					break;
				}
			}
		}

		while(var_04 && self playerads() < var_02)
		{
			if(isdefined(var_03))
			{
				var_03 destroy();
				var_03 = undefined;
			}

			wait(0.05);
		}

		if(!var_04)
		{
			if(isdefined(var_03))
			{
				var_03 destroy();
				var_03 = undefined;
			}

			wait(0.05);
			continue;
		}

		if(self isusingturret())
		{
			if(isdefined(var_03))
			{
				var_03 destroy();
				var_03 = undefined;
			}

			wait(0.05);
			continue;
		}

		if(!isdefined(var_03))
		{
			var_03 = lib_A59D::func_6AE6();
		}

		wait(0.05);
	}
}

//Function Number: 56
lib_A59D::func_6AE6()
{
	var_00 = newclienthudelem(self);
	var_00.color = (0.2,0.01,0.01);
	var_00.alpha = 1;
	var_00 method_83A4(-1);
	return var_00;
}