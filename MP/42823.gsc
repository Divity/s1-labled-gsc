/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42823.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 64
 * Decompile Time: 14 ms
 * Timestamp: 4/20/2022 8:18:21 PM
*******************************************************************/

//Function Number: 1
lib_A747::main()
{
	if(getdvar("r_reflectionProbeGenerate") == "1")
	{
		return;
	}

	level.script_mover_defaults = [];
	level.script_mover_defaults["move_time"] = 5;
	level.script_mover_defaults["accel_time"] = 0;
	level.script_mover_defaults["decel_time"] = 0;
	level.script_mover_defaults["wait_time"] = 0;
	level.script_mover_defaults["delay_time"] = 0;
	level.script_mover_defaults["usable"] = 0;
	level.script_mover_defaults["hintstring"] = "activate";
	lib_A747::script_mover_add_hintstring("activate",&"MP_ACTIVATE_MOVER");
	lib_A747::script_mover_add_parameters("none","");
	level.script_mover_named_goals = [];
	level.script_mover_animations = [];
	wait 0.05;
	var_00 = [];
	var_01 = lib_A747::script_mover_classnames();
	foreach(var_03 in var_01)
	{
		var_00 = common_scripts\utility::array_combine(var_00,getentarray(var_03,"classname"));
	}

	common_scripts\utility::array_thread(var_00,::lib_A747::script_mover_init);
}

//Function Number: 2
lib_A747::script_mover_classnames()
{
	return ["script_model_mover","script_brushmodel_mover"];
}

//Function Number: 3
lib_A747::script_mover_is_script_mover()
{
	if(isdefined(self.script_mover))
	{
		return self.script_mover;
	}

	var_00 = lib_A747::script_mover_classnames();
	foreach(var_02 in var_00)
	{
		if(self.classname == var_02)
		{
			self.script_mover = 1;
			return 1;
		}
	}

	return 0;
}

//Function Number: 4
lib_A747::script_mover_add_hintstring(param_00,param_01)
{
	if(!isdefined(level.script_mover_hintstrings))
	{
		level.script_mover_hintstrings = [];
	}

	level.script_mover_hintstrings[param_00] = param_01;
}

//Function Number: 5
lib_A747::script_mover_add_parameters(param_00,param_01)
{
	if(!isdefined(level.script_mover_parameters))
	{
		level.script_mover_parameters = [];
	}

	level.script_mover_parameters[param_00] = param_01;
}

//Function Number: 6
lib_A747::script_mover_add_animation(param_00,param_01,param_02,param_03)
{
	if(!isdefined(level.script_mover_animations))
	{
		level.script_mover_animations = [];
	}

	if(!isdefined(param_03))
	{
		param_03 = "default";
	}

	if(!isdefined(level.script_mover_animations[param_00]))
	{
		level.script_mover_animations[param_00] = [];
	}

	var_04 = spawnstruct();
	var_04.animname = param_01;
	var_04.animref = param_02;
	level.script_mover_animations[param_00][param_03] = var_04;
}

//Function Number: 7
lib_A747::script_mover_init()
{
	self.script_mover = 1;
	self.moving = 0;
	self.origin_ent = self;
	self.use_triggers = [];
	self.linked_ents = [];
	var_00 = [];
	if(isdefined(self.target))
	{
		var_00 = common_scripts\utility::getstructarray(self.target,"targetname");
	}

	var_01 = var_00;
	var_03 = getfirstarraykey(var_01);
	if(isdefined(var_03))
	{
		var_02 = var_01[var_03];
		if(!isdefined(var_02.var_39B))
		{
			continue;
		}

		switch(var_02.var_39B)
		{
			case "origin":
				break;

			case "scene_node":
			case "scripted_node":
				break;

			default:
				break;
		}
	}
}

//Function Number: 8
lib_A747::script_mover_start()
{
	if(lib_A747::script_mover_is_animated())
	{
		thread lib_A747::script_mover_animate();
		return;
	}

	thread lib_A747::script_mover_move_to_target();
}

//Function Number: 9
lib_A747::script_mover_reset_init()
{
	self.mover_reset_origin = self.var_2E6;
	self.mover_reset_angles = self.var_41;
}

//Function Number: 10
lib_A747::script_mover_reset(param_00)
{
	self notify("mover_reset");
	if(lib_A747::script_mover_is_animated())
	{
		self scriptmodelclearanim();
	}

	self.var_2E6 = self.mover_reset_origin;
	self.var_41 = self.mover_reset_angles;
	self notify("new_path");
	wait 0.05;
	lib_A747::script_mover_start();
}

//Function Number: 11
lib_A747::script_mover_use_trigger(param_00)
{
	self endon("death");
	for(;;)
	{
		param_00 waittill("trigger");
		if(param_00.goals.size > 0)
		{
			self notify("new_path");
			thread lib_A747::script_mover_move_to_target(param_00);
			continue;
		}

		self notify("trigger");
	}
}

//Function Number: 12
lib_A747::script_mover_move_to_named_goal(param_00)
{
	if(isdefined(level.script_mover_named_goals[param_00]))
	{
		self notify("new_path");
		self.goals = level.script_mover_named_goals[param_00];
		thread lib_A747::script_mover_move_to_target();
	}
}

//Function Number: 13
lib_A747::anglesclamp180(param_00)
{
	return (angleclamp180(param_00[0]),angleclamp180(param_00[1]),angleclamp180(param_00[2]));
}

//Function Number: 14
lib_A747::script_mover_parse_targets()
{
	if(isdefined(self.parsed) && self.parsed)
	{
		return;
	}

	self.parsed = 1;
	self.goals = [];
	self.movers = [];
	var_00 = [];
	var_01 = [];
	if(isdefined(self.target))
	{
		var_00 = common_scripts\utility::getstructarray(self.target,"targetname");
		var_01 = getentarray(self.target,"targetname");
	}

	var_02 = 0;
	if(var_02 < var_00.size)
	{
		var_03 = var_00[var_02];
		if(!isdefined(var_03.var_39B))
		{
			var_03.var_39B = "goal";
		}

		switch(var_03.var_39B)
		{
			case "ignore":
				break;

			case "goal":
				break;

			default:
				break;
		}
	}
}

//Function Number: 15
lib_A747::script_mover_parse_ent(param_00)
{
	if(!isdefined(param_00.var_39B))
	{
		return;
	}

	if(param_00 lib_A747::script_mover_is_script_mover() && !isdefined(param_00.script_mover_init))
	{
		param_00 waittill("script_mover_init");
	}

	var_01 = strtok(param_00.var_39B,";");
	var_02 = var_01;
	var_08 = getfirstarraykey(var_02);
	if(isdefined(var_08))
	{
		var_03 = var_02[var_08];
		var_04 = strtok(var_03,"_");
		if(var_04.size < 3 || var_04[1] != "on")
		{
			continue;
		}

		var_05 = tolower(var_04[0]);
		var_06 = var_04[2];
		for(var_07 = 3;var_07 < var_04.size;var_07++)
		{
			var_06 = var_06 + "_" + var_04[var_07];
		}

		switch(var_05)
		{
			case "connectpaths":
				break;

			case "disconnectpaths":
				break;

			case "solid":
				break;

			case "notsolid":
				break;

			case "delete":
				break;

			case "hide":
				break;

			case "show":
				break;

			case "triggerhide":
				break;

			case "triggershow":
				break;

			case "trigger":
				break;

			default:
				break;
		}
	}
}

//Function Number: 16
lib_A747::script_mover_trigger_off(param_00)
{
	self dontinterpolate();
	common_scripts\utility::trigger_off();
}

//Function Number: 17
lib_A747::script_mover_trigger_on(param_00)
{
	self dontinterpolate();
	common_scripts\utility::trigger_on();
}

//Function Number: 18
lib_A747::script_mover_notify(param_00,param_01)
{
	param_00 notify(param_01);
}

//Function Number: 19
lib_A747::script_mover_levelnotify(param_00,param_01)
{
	level notify(param_01);
}

//Function Number: 20
lib_A747::script_mover_connectpaths(param_00)
{
	self connectpaths();
}

//Function Number: 21
lib_A747::script_mover_disconnectpaths(param_00)
{
	self disconnectpaths(param_00);
}

//Function Number: 22
lib_A747::script_mover_solid(param_00)
{
	self solid();
}

//Function Number: 23
lib_A747::script_mover_notsolid(param_00)
{
	self notsolid();
}

//Function Number: 24
lib_A747::script_mover_delete(param_00)
{
	self delete();
}

//Function Number: 25
lib_A747::script_mover_hide(param_00)
{
	self hide();
}

//Function Number: 26
lib_A747::script_mover_show(param_00)
{
	self show();
}

//Function Number: 27
lib_A747::script_mover_trigger(param_00)
{
	self notify("trigger");
}

//Function Number: 28
lib_A747::script_mover_func_on_notify(param_00,param_01,param_02,param_03)
{
	self endon("death");
	param_00 endon("death");
	for(;;)
	{
		self waittill(param_01,var_04);
		param_00 [[ param_02 ]](var_04);
		if(isdefined(param_03) && isdefined(var_04))
		{
			var_04 lib_A747::script_mover_watch_for_reset(param_00,param_03);
			continue;
		}

		break;
	}
}

//Function Number: 29
lib_A747::script_mover_update_paths()
{
	var_00 = [];
	if(lib_A747::script_mover_is_dynamic_path())
	{
		var_00[var_00.size] = self;
	}

	foreach(var_02 in self.linked_ents)
	{
		if(var_02 lib_A747::script_mover_is_dynamic_path())
		{
			var_00[var_00.size] = var_02;
		}
	}

	if(var_00.size == 0)
	{
		return;
	}

	for(;;)
	{
		foreach(var_05 in var_00)
		{
			var_05 lib_A747::script_mover_disconnectpaths();
		}

		self waittill("move_start");
		foreach(var_05 in var_00)
		{
			var_05 lib_A747::script_mover_connectpaths();
		}

		self waittill("move_end");
	}
}

//Function Number: 30
lib_A747::script_mover_animate()
{
	childthread lib_A747::script_mover_update_paths();
	var_00 = self.params["animation"];
	if(isdefined(level.script_mover_animations[var_00]["idle"]))
	{
		lib_A747::script_mover_play_animation(level.script_mover_animations[var_00]["idle"],0);
	}

	lib_A747::script_mover_delay();
	self notify("move_start");
	self notify("start",self);
	var_01 = level.script_mover_animations[var_00]["default"];
	if(isdefined(var_01))
	{
		lib_A747::script_mover_play_animation(var_01,1);
		self waittill("end");
	}

	self notify("move_end");
}

//Function Number: 31
lib_A747::script_mover_play_animation(param_00,param_01)
{
	self notify("play_animation");
	if(param_01)
	{
		thread lib_A747::script_mover_handle_notetracks();
	}

	if(isdefined(self.scripted_node))
	{
		self method_848B(param_00.animname,self.scripted_node.var_2E6,self.scripted_node.var_41,"script_mover_anim");
		return;
	}

	self scriptmodelplayanimdeltamotion(param_00.animname,"script_mover_anim");
}

//Function Number: 32
lib_A747::script_mover_handle_notetracks()
{
	self endon("play_animation");
	self endon("mover_reset");
	for(;;)
	{
		self waittill("script_mover_anim",var_00);
		self notify(var_00,self);
	}
}

//Function Number: 33
lib_A747::script_mover_delay()
{
	if(isdefined(self.params["delay_till"]))
	{
		level waittill(self.params["delay_till"]);
	}

	if(isdefined(self.params["delay_till_trigger"]) && self.params["delay_till_trigger"])
	{
		self waittill("trigger");
	}

	if(self.params["delay_time"] > 0)
	{
		wait(self.params["delay_time"]);
	}
}

//Function Number: 34
lib_A747::script_mover_move_to_target(param_00)
{
	self endon("death");
	self endon("new_path");
	childthread lib_A747::script_mover_update_paths();
	if(!isdefined(param_00))
	{
		param_00 = self;
	}

	while(param_00.goals.size != 0)
	{
		var_01 = common_scripts\utility::random(param_00.goals);
		var_02 = self;
		var_02 lib_A747::script_mover_apply_move_parameters(var_01);
		var_02 lib_A747::script_mover_delay();
		var_03 = var_02.params["move_time"];
		var_04 = var_02.params["accel_time"];
		var_05 = var_02.params["decel_time"];
		var_06 = 0;
		var_07 = 0;
		var_08 = transformmove(var_01.var_2E6,var_01.var_41,self.origin_ent.var_2E6,self.origin_ent.var_41,self.var_2E6,self.var_41);
		if(var_02.var_2E6 != var_01.var_2E6)
		{
			if(isdefined(var_02.params["move_speed"]))
			{
				var_09 = distance(var_02.var_2E6,var_01.var_2E6);
				var_03 = var_09 / var_02.params["move_speed"];
			}

			if(isdefined(var_02.params["accel_frac"]))
			{
				var_04 = var_02.params["accel_frac"] * var_03;
			}

			if(isdefined(var_02.params["decel_frac"]))
			{
				var_05 = var_02.params["decel_frac"] * var_03;
			}

			if(var_03 <= 0)
			{
				var_02 dontinterpolate();
				var_02.var_2E6 = var_08["origin"];
			}
			else
			{
				var_02 moveto(var_08["origin"],var_03,var_04,var_05);
			}

			var_06 = 1;
		}

		if(lib_A747::anglesclamp180(var_08["angles"]) != lib_A747::anglesclamp180(var_02.var_41))
		{
			if(var_03 <= 0)
			{
				var_02 dontinterpolate();
				var_02.var_41 = var_08["angles"];
			}
			else
			{
				var_02 rotateto(var_08["angles"],var_03,var_04,var_05);
			}

			var_07 = 1;
		}

		foreach(var_0B in var_02.movers)
		{
			var_0B notify("trigger");
			lib_A747::script_mover_watch_for_reset(var_0B,::lib_A747::script_mover_reset);
		}

		var_02 notify("move_start");
		param_00 notify("depart",var_02);
		if(isdefined(var_02.params["name"]))
		{
			var_0D = "mover_depart_" + var_02.params["name"];
			var_02 notify(var_0D);
			level notify(var_0D,var_02);
		}

		var_02 lib_A747::script_mover_allow_usable(0);
		if(var_03 <= 0)
		{
		}
		else if(var_06)
		{
			var_02 waittill("movedone");
		}
		else if(var_07)
		{
			var_02 waittill("rotatedone");
		}
		else
		{
			wait(var_03);
		}

		var_02 notify("move_end");
		var_01 notify("arrive",var_02);
		if(isdefined(var_02.params["name"]))
		{
			var_0D = "mover_arrive_" + var_02.params["name"];
			var_02 notify(var_0D);
			level notify(var_0D,var_02);
		}

		if(isdefined(var_02.params["solid"]))
		{
			if(var_02.params["solid"])
			{
				var_02 solid();
			}
			else
			{
				var_02 notsolid();
			}
		}

		foreach(var_0B in var_01.movers)
		{
			var_0B notify("trigger");
			lib_A747::script_mover_watch_for_reset(var_0B,::lib_A747::script_mover_reset);
		}

		if(isdefined(var_02.params["wait_till"]))
		{
			level waittill(var_02.params["wait_till"]);
		}

		if(var_02.params["wait_time"] > 0)
		{
			wait(var_02.params["wait_time"]);
		}

		var_02 lib_A747::script_mover_allow_usable(1);
		param_00 = var_01;
	}
}

//Function Number: 35
lib_A747::script_mover_watch_for_reset(param_00,param_01)
{
	thread lib_A747::script_mover_func_on_notify(param_00,"mover_reset",param_01);
}

//Function Number: 36
lib_A747::script_mover_init_move_parameters()
{
	self.params = [];
	if(!isdefined(self.var_41))
	{
		self.var_41 = (0,0,0);
	}

	self.var_41 = lib_A747::anglesclamp180(self.var_41);
	lib_A747::script_mover_parse_move_parameters(self.script_parameters);
}

//Function Number: 37
lib_A747::script_mover_parse_move_parameters(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "";
	}

	var_01 = strtok(param_00,";");
	var_02 = var_01;
	var_07 = getfirstarraykey(var_02);
	if(isdefined(var_07))
	{
		var_03 = var_02[var_07];
		var_04 = strtok(var_03,"=");
		if(var_04.size != 2)
		{
			continue;
		}

		if(var_04[1] == "undefined" || var_04[1] == "default")
		{
			self.params[var_04[0]] = "<undefined>";
			continue;
		}

		switch(var_04[0])
		{
			case "decel_frac":
			case "accel_frac":
			case "move_speed":
			case "delay_time":
			case "wait_time":
			case "decel_time":
			case "accel_time":
			case "move_time":
				break;

			case "wait_till":
			case "delay_till":
			case "hintstring":
			case "animation":
			case "name":
				break;

			case "delay_till_trigger":
			case "usable":
			case "solid":
				break;

			case "script_params":
				break;

			default:
				break;
		}
	}
}

//Function Number: 38
lib_A747::script_mover_parse_range(param_00)
{
	var_01 = 0;
	var_02 = strtok(param_00,",");
	if(var_02.size == 1)
	{
		var_01 = float(var_02[0]);
	}
	else if(var_02.size == 2)
	{
		var_03 = float(var_02[0]);
		var_04 = float(var_02[1]);
		if(var_03 >= var_04)
		{
			var_01 = var_03;
		}
		else
		{
			var_01 = randomfloatrange(var_03,var_04);
		}
	}

	return var_01;
}

//Function Number: 39
lib_A747::script_mover_apply_move_parameters(param_00)
{
	foreach(var_03, var_02 in param_00.params)
	{
		lib_A747::script_mover_set_param(var_03,var_02);
	}

	lib_A747::script_mover_set_defaults();
}

//Function Number: 40
lib_A747::script_mover_set_param(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(param_00 == "usable" && isdefined(param_01))
	{
		lib_A747::script_mover_set_usable(self,param_01);
	}

	if(isdefined(param_01) && isstring(param_01) && param_01 == "<undefined>")
	{
		param_01 = undefined;
	}

	self.params[param_00] = param_01;
}

//Function Number: 41
lib_A747::script_mover_allow_usable(param_00)
{
	if(self.params["usable"])
	{
		lib_A747::script_mover_set_usable(self,param_00);
	}

	foreach(var_02 in self.use_triggers)
	{
		lib_A747::script_mover_set_usable(var_02,param_00);
	}
}

//Function Number: 42
lib_A747::script_mover_set_usable(param_00,param_01)
{
	if(param_01)
	{
		param_00 makeusable();
		param_00 setcursorhint("HINT_ACTIVATE");
		param_00 sethintstring(level.script_mover_hintstrings[self.params["hintstring"]]);
		return;
	}

	param_00 makeunusable();
}

//Function Number: 43
lib_A747::script_mover_save_default_move_parameters()
{
	self.params_default = [];
	foreach(var_02, var_01 in self.params)
	{
		self.params_default[var_02] = var_01;
	}
}

//Function Number: 44
lib_A747::script_mover_set_defaults()
{
	if(isdefined(self.params_default))
	{
		foreach(var_02, var_01 in self.params_default)
		{
			if(!isdefined(self.params[var_02]))
			{
				lib_A747::script_mover_set_param(var_02,var_01);
			}
		}
	}

	foreach(var_02, var_01 in level.script_mover_defaults)
	{
		if(!isdefined(self.params[var_02]))
		{
			lib_A747::script_mover_set_param(var_02,var_01);
		}
	}
}

//Function Number: 45
lib_A747::script_mover_is_dynamic_path()
{
	return isdefined(self.spawnflags) && self.spawnflags & 1;
}

//Function Number: 46
lib_A747::script_mover_is_animated()
{
	return isdefined(self.params["animation"]);
}

//Function Number: 47
lib_A747::init()
{
	level thread lib_A747::script_mover_connect_watch();
	level thread lib_A747::script_mover_agent_spawn_watch();
}

//Function Number: 48
lib_A747::script_mover_connect_watch()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A747::player_unresolved_collision_watch();
	}
}

//Function Number: 49
lib_A747::script_mover_agent_spawn_watch()
{
	for(;;)
	{
		level waittill("spawned_agent",var_00);
		var_00 thread lib_A747::player_unresolved_collision_watch();
	}
}

//Function Number: 50
lib_A747::player_unresolved_collision_watch()
{
	self endon("disconnect");
	if(isagent(self))
	{
		self endon("death");
	}

	self.var_9A50 = 0;
	for(;;)
	{
		self waittill("unresolved_collision",var_00);
		if(isagent(self) && isdefined(self.animclass))
		{
			if(self method_855A() == "noclip")
			{
				continue;
			}
		}

		self.var_9A50++;
		thread lib_A747::clear_unresolved_collision_count_next_frame();
		var_01 = 3;
		if(isdefined(var_00) && isdefined(var_00.var_9A56))
		{
			var_01 = var_00.var_9A56;
		}

		if(self.var_9A50 >= var_01)
		{
			if(isdefined(var_00))
			{
				if(isdefined(var_00.var_9A52))
				{
					var_00 [[ var_00.var_9A52 ]](self);
				}
				else if(isdefined(var_00.var_9A53) && var_00.var_9A53)
				{
					var_00 lib_A747::unresolved_collision_owner_damage(self);
				}
				else
				{
					var_00 lib_A747::unresolved_collision_nearest_node(self);
				}
			}
			else
			{
				lib_A747::unresolved_collision_nearest_node(self);
			}

			self.var_9A50 = 0;
		}
	}
}

//Function Number: 51
lib_A747::clear_unresolved_collision_count_next_frame()
{
	self endon("unresolved_collision");
	wait 0.05;
	if(isdefined(self))
	{
		self.var_9A50 = 0;
	}
}

//Function Number: 52
lib_A747::unresolved_collision_owner_damage(param_00)
{
	var_01 = self;
	if(!isdefined(var_01.owner))
	{
		param_00 lib_A747::mover_suicide();
		return;
	}

	var_02 = 0;
	if(level.teambased)
	{
		if(isdefined(var_01.owner.inliveplayerkillstreak) && var_01.owner.inliveplayerkillstreak != param_00.inliveplayerkillstreak)
		{
			var_02 = 1;
		}
	}
	else if(param_00 != var_01.owner)
	{
		var_02 = 1;
	}

	if(!var_02)
	{
		param_00 lib_A747::mover_suicide();
		return;
	}

	var_03 = 1000;
	if(isdefined(var_01.unresolved_collision_damage))
	{
		var_03 = var_01.unresolved_collision_damage;
	}

	param_00 dodamage(var_03,var_01.var_2E6,var_01.owner,var_01,"MOD_CRUSH");
}

//Function Number: 53
lib_A747::unresolved_collision_nearest_node(param_00,param_01)
{
	var_02 = self.unresolved_collision_nodes;
	if(isdefined(var_02))
	{
		var_02 = sortbydistance(var_02,param_00.var_2E6);
	}
	else
	{
		var_02 = getnodesinradius(param_00.var_2E6,300,0,200);
		var_02 = sortbydistance(var_02,param_00.var_2E6);
	}

	var_03 = (0,0,-100);
	param_00 cancelmantle();
	param_00 dontinterpolate();
	param_00 setorigin(param_00.var_2E6 + var_03);
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_05 = var_02[var_04];
		var_06 = var_05.var_2E6;
		if(!canspawn(var_06))
		{
			continue;
		}

		if(positionwouldtelefrag(var_06))
		{
			continue;
		}

		if(param_00 getstance() == "prone")
		{
			param_00 setstance("crouch");
		}

		param_00 setorigin(var_06);
		return;
	}

	param_00 setorigin(param_00.var_2E6 - var_03);
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(param_01)
	{
		param_00 lib_A747::mover_suicide();
	}
}

//Function Number: 54
lib_A747::unresolved_collision_void(param_00)
{
}

//Function Number: 55
lib_A747::mover_suicide()
{
	if(isdefined(level.var_511A) && !isagent(self))
	{
		return;
	}

	if(isdefined(level.moversuicidecustom))
	{
		self [[ level.moversuicidecustom ]]();
		return;
	}

	maps\mp\_utility::_suicide();
}

//Function Number: 56
lib_A747::player_pushed_kill(param_00)
{
	self endon("death");
	self endon("stop_player_pushed_kill");
	for(;;)
	{
		self waittill("player_pushed",var_01,var_02);
		if(isplayer(var_01) || isagent(var_01))
		{
			var_03 = length(var_02);
			if(var_03 >= param_00)
			{
				lib_A747::unresolved_collision_owner_damage(var_01);
			}
		}
	}
}

//Function Number: 57
lib_A747::stop_player_pushed_kill()
{
	self notify("stop_player_pushed_kill");
}

//Function Number: 58
lib_A747::notify_moving_platform_invalid()
{
	var_00 = self getlinkedchildren(0);
	if(!isdefined(var_00))
	{
		return;
	}

	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.no_moving_platfrom_unlink) && var_02.no_moving_platfrom_unlink)
		{
			continue;
		}

		var_02 unlink();
		var_02 notify("invalid_parent",self);
	}
}

//Function Number: 59
lib_A747::process_moving_platform_death(param_00,param_01)
{
	if(isdefined(param_01) && isdefined(param_01.no_moving_platfrom_death) && param_01.no_moving_platfrom_death)
	{
		return;
	}

	if(isdefined(param_00.playdeathfx))
	{
		playfx(common_scripts\utility::getfx("airdrop_crate_destroy"),self.var_2E6);
	}

	if(isdefined(param_00.deathoverridecallback))
	{
		self thread [[ param_00.deathoverridecallback ]](param_00);
		return;
	}

	self delete();
}

//Function Number: 60
lib_A747::handle_moving_platform_touch(param_00)
{
	for(;;)
	{
		self waittill("touching_platform",var_01);
		if(isdefined(param_00.var_9403) && !self [[ param_00.var_9403 ]](var_01))
		{
			continue;
		}

		if(isdefined(param_00.validateaccuratetouching) && param_00.validateaccuratetouching)
		{
			if(!self istouching(var_01))
			{
				wait(0.05);
				continue;
			}
		}

		thread lib_A747::process_moving_platform_death(param_00,var_01);
		break;
	}
}

//Function Number: 61
lib_A747::handle_moving_platform_invalid(param_00)
{
	self waittill("invalid_parent",var_01);
	if(isdefined(param_00.invalidparentoverridecallback))
	{
		self thread [[ param_00.invalidparentoverridecallback ]](param_00);
		return;
	}

	thread lib_A747::process_moving_platform_death(param_00,var_01);
}

//Function Number: 62
lib_A747::handle_moving_platforms(param_00)
{
	self notify("handle_moving_platforms");
	self endon("handle_moving_platforms");
	level endon("game_ended");
	self endon("death");
	self endon("stop_handling_moving_platforms");
	if(!isdefined(param_00))
	{
		param_00 = spawnstruct();
	}

	if(isdefined(param_00.endonstring))
	{
		self endon(param_00.endonstring);
	}

	if(isdefined(param_00.linkparent))
	{
		self linkto(param_00.linkparent);
	}

	childthread lib_A747::handle_moving_platform_touch(param_00);
	childthread lib_A747::handle_moving_platform_invalid(param_00);
}

//Function Number: 63
lib_A747::stop_handling_moving_platforms()
{
	self notify("stop_handling_moving_platforms");
}

//Function Number: 64
lib_A747::moving_platform_empty_func(param_00)
{
}