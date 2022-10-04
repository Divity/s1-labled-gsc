/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42837.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 59
 * Decompile Time: 20 ms
 * Timestamp: 4/20/2022 8:18:23 PM
*******************************************************************/

//Function Number: 1
lib_A755::main()
{
	thread lib_A755::main_thread();
}

//Function Number: 2
lib_A755::main_thread()
{
	var_00 = common_scripts\utility::getstructarray("teleport_world_origin","targetname");
	var_01 = level.gametype;
	if(!var_00.size || !var_01 == "dom" || var_01 == "ctf" || var_01 == "hp" || var_01 == "ball")
	{
		return;
	}

	common_scripts\utility::flag_init("teleport_setup_complete");
	level.teleport_minimaps = [];
	level.teleport_allowed = 1;
	level.teleport_to_offset = 0;
	level.teleport_to_nodes = 0;
	level.teleport_include_killsteaks = 0;
	level.teleport_include_players = 0;
	level.teleport_gamemode_func = undefined;
	level.teleport_pre_funcs = [];
	level.teleport_post_funcs = [];
	level.teleport_nodes_in_zone = [];
	level.teleport_pathnode_zones = [];
	level.teleport_onstartgametype = level.onstartgametype;
	level.onstartgametype = ::lib_A755::teleport_onstartgametype;
	level.teleportgetactivenodesfunc = ::lib_A755::teleport_get_active_nodes;
	level.teleportgetactivepathnodezonesfunc = ::lib_A755::teleport_get_active_pathnode_zones;
}

//Function Number: 3
lib_A755::teleport_init()
{
	level.teleport_spawn_info = [];
	var_00 = common_scripts\utility::getstructarray("teleport_world_origin","targetname");
	if(!var_00.size)
	{
		return;
	}

	level.teleport_zones = [];
	foreach(var_02 in var_00)
	{
		if(!isdefined(var_02.var_39B))
		{
			var_02.var_39B = "zone_" + level.teleport_zones.size;
		}

		var_02.name = var_02.var_39B;
		lib_A755::teleport_parse_zone_targets(var_02);
		level.teleport_nodes_in_zone[var_02.name] = [];
		level.teleport_pathnode_zones[var_02.name] = [];
		level.teleport_zones[var_02.var_39B] = var_02;
	}

	var_04 = getallnodes();
	foreach(var_06 in var_04)
	{
		var_02 = lib_A755::teleport_closest_zone(var_06.var_2E6);
		level.teleport_nodes_in_zone[var_02.name][level.teleport_nodes_in_zone[var_02.name].size] = var_06;
	}

	for(var_08 = 0;var_08 < getzonecount();var_08++)
	{
		var_02 = lib_A755::teleport_closest_zone(getzoneorigin(var_08));
		level.teleport_pathnode_zones[var_02.name][level.teleport_pathnode_zones[var_02.name].size] = var_08;
	}

	if(!isdefined(level.teleport_zone_current))
	{
		if(isdefined(level.teleport_zones["start"]))
		{
			lib_A755::teleport_set_current_zone("start");
			return;
		}

		foreach(var_0B, var_0A in level.teleport_zones)
		{
			lib_A755::teleport_set_current_zone(var_0B);
			break;
		}
	}
}

//Function Number: 4
lib_A755::teleport_onstartgametype()
{
	lib_A755::teleport_init();
	var_00 = undefined;
	var_01 = undefined;
	switch(level.gametype)
	{
		case "dom":
			break;

		case "ctf":
			break;

		case "hp":
			break;

		case "ball":
			break;

		default:
			break;
	}
}

//Function Number: 5
lib_A755::teleport_pre_onstartgamesr()
{
	lib_A755::teleport_pre_onstartgamesd_and_sr();
}

//Function Number: 6
lib_A755::teleport_pre_onstartgamesd()
{
	lib_A755::teleport_pre_onstartgamesd_and_sr();
}

//Function Number: 7
lib_A755::teleport_pre_onstartgamesd_and_sr()
{
	foreach(var_01 in level.teleport_zones)
	{
		var_01.sd_triggers = [];
		var_01.sd_bombs = [];
		var_01.sd_bombzones = [];
	}

	var_03 = getentarray("sd_bomb_pickup_trig","targetname");
	foreach(var_05 in var_03)
	{
		var_06 = lib_A755::teleport_closest_zone(var_05.var_2E6);
		if(isdefined(var_06))
		{
			var_06.sd_triggers[var_06.sd_triggers.size] = var_05;
			lib_A755::teleport_change_targetname(var_05,var_06.name);
		}
	}

	var_08 = getentarray("sd_bomb","targetname");
	foreach(var_0A in var_08)
	{
		var_06 = lib_A755::teleport_closest_zone(var_0A.var_2E6);
		if(isdefined(var_06))
		{
			var_06.sd_bombs[var_06.sd_bombs.size] = var_0A;
			lib_A755::teleport_change_targetname(var_0A,var_06.name);
		}
	}

	var_0C = getentarray("bombzone","targetname");
	foreach(var_0E in var_0C)
	{
		var_06 = lib_A755::teleport_closest_zone(var_0E.var_2E6);
		if(isdefined(var_06))
		{
			var_06.sd_bombzones[var_06.sd_bombzones.size] = var_0E;
			lib_A755::teleport_change_targetname(var_0E,var_06.name);
		}
	}

	var_10 = [];
	foreach(var_01 in level.teleport_zones)
	{
		if(var_01.sd_triggers.size && var_01.sd_triggers.size && var_01.sd_triggers.size)
		{
			var_10[var_10.size] = var_01.name;
		}
	}

	lib_A755::teleport_gamemode_disable_teleport(var_10);
	var_13 = level.teleport_zones[level.teleport_zone_current];
	lib_A755::teleport_restore_targetname(var_13.sd_triggers);
	lib_A755::teleport_restore_targetname(var_13.sd_bombs);
	lib_A755::teleport_restore_targetname(var_13.sd_bombzones);
}

//Function Number: 8
lib_A755::teleport_onstartgamehorde()
{
	foreach(var_01 in level.teleport_zones)
	{
		var_01.horde_drops = [];
	}

	var_03 = common_scripts\utility::getstructarray("horde_drop","targetname");
	foreach(var_05 in var_03)
	{
		var_06 = lib_A755::teleport_closest_zone(var_05.var_2E6);
		if(isdefined(var_06))
		{
			var_06.horde_drops[var_06.horde_drops.size] = var_05;
		}
	}

	var_08 = [];
	foreach(var_01 in level.teleport_zones)
	{
		if(var_01.horde_drops.size)
		{
			var_08[var_08.size] = var_01.name;
		}
	}

	lib_A755::teleport_gamemode_disable_teleport(var_08);
	var_0B = level.teleport_zones[level.teleport_zone_current];
	level.struct_class_names["targetname"]["horde_drop"] = var_0B.horde_drops;
}

//Function Number: 9
lib_A755::teleport_change_targetname(param_00,param_01)
{
	if(!isarray(param_00))
	{
		param_00 = [param_00];
	}

	if(!isdefined(param_01))
	{
		param_01 = "hide_from_getEnt";
	}

	foreach(var_03 in param_00)
	{
		var_03.saved_targetname = var_03.targetname;
		var_03.targetname = var_03.targetname + "_" + param_01;
	}
}

//Function Number: 10
lib_A755::teleport_gamemode_disable_teleport(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = getarraykeys(level.teleport_zones);
	}

	var_01 = game["teleport_zone_dom"];
	if(!isdefined(var_01))
	{
		var_01 = common_scripts\utility::random(param_00);
		game["teleport_zone_dom"] = var_01;
	}

	lib_A755::teleport_to_zone(var_01,0);
	level.teleport_allowed = 0;
}

//Function Number: 11
lib_A755::teleport_restore_targetname(param_00)
{
	if(!isarray(param_00))
	{
		param_00 = [param_00];
	}

	foreach(var_02 in param_00)
	{
		if(isdefined(var_02.saved_targetname))
		{
			var_02.targetname = var_02.saved_targetname;
		}
	}
}

//Function Number: 12
lib_A755::teleport_onstartgamectf()
{
	level.teleport_gamemode_func = ::lib_A755::teleport_onteleportctf;
}

//Function Number: 13
lib_A755::teleport_onstartgamehp()
{
	if(!isdefined(level.number_of_hp_zones_pre_teleport))
	{
		level.number_of_hp_zones_pre_teleport = 5;
	}

	level.pre_event_hp_zones = [];
	level.post_event_hp_zones = [];
	level.all_hp_zones = level.zones;
	foreach(var_01 in level.zones)
	{
		if(var_01.script_index > level.number_of_hp_zones_pre_teleport)
		{
			level.post_event_hp_zones[level.post_event_hp_zones.size] = var_01;
			continue;
		}

		level.pre_event_hp_zones[level.pre_event_hp_zones.size] = var_01;
	}

	level.zones = level.pre_event_hp_zones;
	level.teleport_gamemode_func = ::lib_A755::teleport_onteleporthp;
}

//Function Number: 14
lib_A755::teleport_onstartgameball()
{
	level.teleport_gamemode_func = ::lib_A755::teleport_onteleportball;
}

//Function Number: 15
lib_A755::teleport_onstartgamedom()
{
	foreach(var_01 in level.teleport_zones)
	{
		var_01.flags = [];
		var_01.domflags = [];
	}

	level.all_dom_flags = level.flags;
	foreach(var_04 in level.flags)
	{
		var_05 = lib_A755::teleport_closest_zone(var_04.var_2E6);
		if(isdefined(var_05))
		{
			var_04.teleport_zone = var_05.name;
			var_05.flags[var_05.flags.size] = var_04;
			var_05.domflags[var_05.domflags.size] = var_04.useobj;
		}
	}

	level.dom_flag_data = [];
	foreach(var_01 in level.teleport_zones)
	{
		foreach(var_09 in var_01.flags)
		{
			var_0A = spawnstruct();
			var_0A.trigger_origin = var_09.var_2E6;
			var_0A.visual_origin = var_09.useobj.visuals[0].var_2E6;
			var_0A.baseeffectpos = var_09.useobj.baseeffectpos;
			var_0A.baseeffectforward = var_09.useobj.baseeffectforward;
			var_0A.baseeffectright = var_09.useobj.baseeffectright;
			var_0A.obj_origin = var_09.useobj.curorigin;
			var_0A.obj3d_origins = [];
			foreach(var_0C in level.teamnamelist)
			{
				var_0D = "objpoint_" + var_0C + "_" + var_09.useobj.entnum;
				var_0E = maps\mp\gametypes\_objpoints::getobjpointbyname(var_0D);
				if(isdefined(var_0E))
				{
					var_0A.obj3d_origins[var_0C] = (var_0E.x,var_0E.y,var_0E.z);
				}
			}

			var_0D = "objpoint_mlg_" + var_09.useobj.entnum;
			var_0E = maps\mp\gametypes\_objpoints::getobjpointbyname(var_0D);
			if(isdefined(var_0E))
			{
				var_0A.obj3d_origins["mlg"] = (var_0E.x,var_0E.y,var_0E.z);
			}

			level.dom_flag_data[var_01.name][var_09.useobj.label] = var_0A;
		}
	}

	level.flags = level.teleport_zones[level.teleport_zone_current].flags;
	level.domflags = level.teleport_zones[level.teleport_zone_current].domflags;
	foreach(var_01 in level.teleport_zones)
	{
		foreach(var_04 in var_01.flags)
		{
			if(var_01.name == level.teleport_zone_current)
			{
				continue;
			}

			var_04.useobj.visuals[0] delete();
			var_04.useobj maps\mp\gametypes\_gameobjects::deleteuseobject();
		}
	}

	level.teleport_gamemode_func = ::lib_A755::teleport_onteleportdom;
	lib_A755::teleport_onteleportdom(level.teleport_zone_current);
	level.teleport_dom_finished_initializing = 1;
	level thread lib_A755::teleport_dom_post_bot_cleanup();
}

//Function Number: 16
lib_A755::teleport_dom_post_bot_cleanup()
{
	while(!isdefined(level.bot_gametype_precaching_done))
	{
		wait(0.05);
	}

	foreach(var_01 in level.teleport_zones)
	{
		foreach(var_03 in var_01.flags)
		{
			var_04 = level.dom_flag_data[var_01.name][var_03.useobj.label];
			var_04.nodes = var_03.nodes;
			if(var_01.name != level.teleport_zone_current)
			{
				var_03 delete();
			}
		}
	}
}

//Function Number: 17
lib_A755::teleport_onstartgameconf()
{
	level.teleport_gamemode_func = ::lib_A755::teleport_onteleportconf;
}

//Function Number: 18
lib_A755::teleport_onteleportdom(param_00)
{
	var_01 = level.teleport_zones[level.teleport_zone_current];
	var_02 = level.teleport_zones[param_00];
	if(param_00 == level.teleport_zone_current)
	{
		return;
	}

	foreach(var_04 in level.domflags)
	{
		var_04 maps\mp\gametypes\_gameobjects::setownerteam("neutral");
		var_04 maps\mp\gametypes\_gameobjects::set2dicon("enemy","waypoint_captureneutral" + var_04.label);
		var_04 maps\mp\gametypes\_gameobjects::set3dicon("enemy","waypoint_captureneutral" + var_04.label);
		var_04 maps\mp\gametypes\_gameobjects::set2dicon("friendly","waypoint_captureneutral" + var_04.label);
		var_04 maps\mp\gametypes\_gameobjects::set3dicon("friendly","waypoint_captureneutral" + var_04.label);
		var_04 maps\mp\gametypes\_gameobjects::set2dicon("mlg","waypoint_esports_dom_white" + var_04.label);
		var_04 maps\mp\gametypes\_gameobjects::set3dicon("mlg","waypoint_esports_dom_white" + var_04.label);
		var_04.firstcapture = 1;
	}

	foreach(var_04 in level.flags)
	{
		var_07 = level.dom_flag_data[param_00][var_04.useobj.label];
		var_04.var_2E6 = var_07.trigger_origin;
		var_04.useobj.visuals[0].var_2E6 = var_07.visual_origin;
		var_04.useobj.baseeffectpos = var_07.baseeffectpos;
		var_04.useobj.baseeffectforward = var_07.baseeffectforward;
		var_04.useobj maps\mp\gametypes\dom::updatevisuals();
		var_04.teleport_zone = param_00;
		var_04.nodes = var_07.nodes;
		if(isdefined(var_04.useobj.objidallies))
		{
			objective_position(var_04.useobj.objidallies,var_07.obj_origin);
		}

		if(isdefined(var_04.useobj.objidaxis))
		{
			objective_position(var_04.useobj.objidaxis,var_07.obj_origin);
		}

		if(isdefined(var_04.useobj.objidmlgspectator))
		{
			objective_position(var_04.useobj.objidmlgspectator,var_07.obj_origin);
		}

		foreach(var_09 in level.teamnamelist)
		{
			var_0A = "objpoint_" + var_09 + "_" + var_04.useobj.entnum;
			var_0B = maps\mp\gametypes\_objpoints::getobjpointbyname(var_0A);
			var_0B.x = var_07.obj3d_origins[var_09][0];
			var_0B.y = var_07.obj3d_origins[var_09][1];
			var_0B.z = var_07.obj3d_origins[var_09][2];
		}

		var_0A = "objpoint_mlg_" + var_04.useobj.entnum;
		var_0B = maps\mp\gametypes\_objpoints::getobjpointbyname(var_0A);
		var_0B.x = var_07.obj3d_origins["mlg"][0];
		var_0B.y = var_07.obj3d_origins["mlg"][1];
		var_0B.z = var_07.obj3d_origins["mlg"][2];
	}

	maps\mp\gametypes\dom::flagsetup();
	foreach(var_0F in level.domflags)
	{
		var_10 = var_0F.label;
		foreach(var_12 in level.teleport_zones["start"].domflags)
		{
			if(var_12.label == var_10)
			{
				var_0F.levelflag = var_12.levelflag;
			}
		}
	}

	foreach(var_0F in level.flags)
	{
		var_10 = var_0F.label;
		foreach(var_17 in level.teleport_zones["start"].flags)
		{
			if(var_17.label == var_10)
			{
				var_0F.levelflag = var_17.levelflag;
			}
		}
	}
}

//Function Number: 19
lib_A755::teleport_get_matching_dom_flag(param_00,param_01)
{
	foreach(var_03 in level.teleport_zones[param_01].flags)
	{
		if(param_00.useobj.label == var_03.useobj.label)
		{
			return var_03;
		}
	}

	return undefined;
}

//Function Number: 20
lib_A755::teleport_onteleportctf(param_00)
{
	if(game["switchedsides"])
	{
		level.ctf_second_zones["axis"] = getent("post_event_capzone_allies","targetname");
		level.ctf_second_zones["allies"] = getent("post_event_capzone_axis","targetname");
	}
	else
	{
		level.ctf_second_zones["allies"] = getent("post_event_capzone_allies","targetname");
		level.ctf_second_zones["axis"] = getent("post_event_capzone_axis","targetname");
	}

	var_01 = [];
	var_01["allies"] = level.capzones["allies"];
	var_01["axis"] = level.capzones["axis"];
	var_02["allies"] = level.var_91E8["allies"];
	var_02["axis"] = level.var_91E8["axis"];
	var_03["allies"] = level.ctf_second_zones["allies"].var_2E6;
	var_03["axis"] = level.ctf_second_zones["axis"].var_2E6;
	foreach(var_05 in var_01)
	{
		var_05 maps\mp\gametypes\_gameobjects::move_use_object(var_03[var_05.ownerteam],(0,0,85));
		var_05.trigger common_scripts\utility::trigger_off();
	}

	foreach(var_08 in level.var_91E8)
	{
		var_08 maps\mp\gametypes\_gameobjects::move_use_object(var_03[var_08.ownerteam],(0,0,85));
		if(isdefined(var_08.carrier))
		{
			var_08 maps\mp\gametypes\_gameobjects::setvisibleteam("any");
			var_08 maps\mp\gametypes\_gameobjects::set2dicon("friendly",level.iconkill2d);
			var_08 maps\mp\gametypes\_gameobjects::set3dicon("friendly",level.iconkill3d);
			var_08 maps\mp\gametypes\_gameobjects::set2dicon("enemy",level.iconescort2d);
			var_08 maps\mp\gametypes\_gameobjects::set3dicon("enemy",level.iconescort3d);
			level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::allowuse("none");
			level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::setvisibleteam("friendly");
			level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::set2dicon("friendly",level.iconwaitforflag2d);
			level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::set3dicon("friendly",level.iconwaitforflag3d);
			if(var_08.ownerteam == "allies")
			{
				level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::set2dicon("mlg",level.iconmissingblue);
				level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::set3dicon("mlg",level.iconmissingblue);
				continue;
			}

			level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::set2dicon("mlg",level.iconmissingred);
			level.capzones[var_08.ownerteam] maps\mp\gametypes\_gameobjects::set3dicon("mlg",level.iconmissingred);
		}
	}

	maps\mp\gametypes\ctf::capturezone_reset_base_effects();
	maps\mp\gametypes\ctf::reassign_ctf_team_spawns();
	foreach(var_05 in var_01)
	{
		var_05.trigger common_scripts\utility::trigger_on();
	}
}

//Function Number: 21
lib_A755::teleport_onteleporthp(param_00)
{
	level.zones = level.post_event_hp_zones;
	if(level.randomzonespawn == 0)
	{
		level.prevzoneindex = level.zones.size - 1;
	}
	else
	{
		level.zonespawnqueue = [];
		maps\mp\gametypes\hp::shufflezones();
	}

	setomnvar("ui_hardpoint_timer",0);
	level notify("zone_moved");
}

//Function Number: 22
lib_A755::teleport_onteleportball(param_00)
{
	level.ball_starts_post_event = common_scripts\utility::getstructarray("ball_start_post_event","targetname");
	if(game["switchedsides"])
	{
		level.ball_goals_post_event["allies"] = common_scripts\utility::getstruct("ball_goal_axis_post_event","targetname");
		level.ball_goals_post_event["axis"] = common_scripts\utility::getstruct("ball_goal_allies_post_event","targetname");
	}
	else
	{
		level.ball_goals_post_event["axis"] = common_scripts\utility::getstruct("ball_goal_axis_post_event","targetname");
		level.ball_goals_post_event["allies"] = common_scripts\utility::getstruct("ball_goal_allies_post_event","targetname");
	}

	var_01 = [];
	var_01["allies"] = level.ball_goals["allies"];
	var_01["axis"] = level.ball_goals["axis"];
	var_02 = [];
	var_02["allies"] = level.ball_goals_post_event["allies"].var_2E6;
	var_02["axis"] = level.ball_goals_post_event["axis"].var_2E6;
	foreach(var_04 in var_01)
	{
		var_05 = (0,0,var_04.radius / 2 * 1.1);
		var_04.useobject maps\mp\gametypes\_gameobjects::move_use_object(var_02[var_04.inliveplayerkillstreak],var_05);
		var_04 maps\mp\gametypes\ball::ball_find_ground();
		foreach(var_07 in level.var_328)
		{
			maps\mp\gametypes\ball::ball_goal_fx_for_player(var_07);
		}
	}

	lib_A755::bot_setup_ball_jump_nodes();
	var_0A = getzonenearest(level.ball_goals["allies"].var_2E6);
	if(isdefined(var_0A))
	{
		botzonesetteam(var_0A,"allies");
	}

	var_0A = getzonenearest(level.ball_goals["axis"].var_2E6);
	if(isdefined(var_0A))
	{
		botzonesetteam(var_0A,"axis");
	}

	level.ball_starts = [];
	foreach(var_0C in level.ball_starts_post_event)
	{
		maps\mp\gametypes\ball::ball_add_start(var_0C.var_2E6);
	}

	foreach(var_0F in level.balls)
	{
		var_10 = 0;
		foreach(var_07 in level.var_328)
		{
			if(isdefined(var_07.ball_carried) && var_07.ball_carried == var_0F)
			{
				var_10 = 1;
				break;
			}
		}

		if(var_10 != 1)
		{
			var_0F maps\mp\gametypes\ball::ball_return_home();
		}
	}
}

//Function Number: 23
lib_A755::bot_setup_ball_jump_nodes()
{
	var_00 = 400;
	wait(1);
	var_01 = 0;
	var_02 = 10;
	foreach(var_04 in level.ball_goals)
	{
		var_04.ball_jump_nodes = [];
		var_05 = getnodesinradius(var_04.var_2E6,var_00,0);
		foreach(var_07 in var_05)
		{
			if(var_07.type == "End")
			{
				continue;
			}

			var_01++;
			if(lib_A755::bot_ball_origin_can_see_goal(var_07.var_2E6,var_04,1))
			{
				var_04.ball_jump_nodes[var_04.ball_jump_nodes.size] = var_07;
			}

			if(var_01 % var_02 == 0)
			{
				wait(0.05);
			}
		}

		var_09 = 999999999;
		foreach(var_07 in var_04.ball_jump_nodes)
		{
			var_0B = distance2dsquared(var_07.var_2E6,var_04.var_2E6);
			if(var_0B < var_09)
			{
				var_04.nearest_node = var_07;
				var_09 = var_0B;
			}
		}

		wait(0.05);
	}
}

//Function Number: 24
lib_A755::bot_ball_origin_can_see_goal(param_00,param_01,param_02)
{
	var_03 = lib_A755::bot_ball_trace_to_origin(param_00,param_01.var_2E6);
	if(isdefined(param_02) && param_02)
	{
		if(!var_03)
		{
			var_04 = param_01.var_2E6 - (0,0,param_01.radius * 0.5);
			var_03 = lib_A755::bot_ball_trace_to_origin(param_00,var_04);
		}

		if(!var_03)
		{
			var_04 = param_01.var_2E6 + (0,0,param_01.radius * 0.5);
			var_03 = lib_A755::bot_ball_trace_to_origin(param_00,var_04);
		}
	}

	return var_03;
}

//Function Number: 25
lib_A755::bot_ball_trace_to_origin(param_00,param_01)
{
	if(isdefined(self) && isplayer(self) || isagent(self))
	{
		var_02 = playerphysicstrace(param_00,param_01,self);
	}
	else
	{
		var_02 = playerphysicstrace(param_01,var_02);
	}

	return distancesquared(var_02,param_01) < 1;
}

//Function Number: 26
lib_A755::teleport_onteleportconf(param_00)
{
	var_01 = lib_A755::get_teleport_delta(param_00);
	foreach(var_03 in level.dogtags)
	{
		var_04 = var_03.curorigin + var_01;
		var_05 = lib_A755::teleport_get_safe_node_near(var_04);
		if(isdefined(var_05))
		{
			var_05.last_teleport_time = gettime();
			var_06 = var_05.var_2E6 - var_03.curorigin;
			var_03.curorigin = var_03.curorigin + var_06;
			var_03.trigger.var_2E6 = var_03.trigger.var_2E6 + var_06;
			var_03.visuals[0].var_2E6 = var_03.visuals[0].var_2E6 + var_06;
			var_03.visuals[1].var_2E6 = var_03.visuals[1].var_2E6 + var_06;
			continue;
		}

		var_03 maps\mp\gametypes\conf::resettags();
	}
}

//Function Number: 27
lib_A755::teleport_get_safe_node_near(param_00)
{
	var_01 = gettime();
	var_02 = getnodesinradiussorted(param_00,300,0,200,"Path");
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = var_02[var_03];
		if(isdefined(var_04.last_teleport_time) && var_04.last_teleport_time == var_01)
		{
			continue;
		}

		return var_04;
	}

	return undefined;
}

//Function Number: 28
lib_A755::teleport_closest_zone(param_00)
{
	var_01 = undefined;
	var_02 = undefined;
	foreach(var_04 in level.teleport_zones)
	{
		var_05 = distancesquared(var_04.var_2E6,param_00);
		if(!isdefined(var_01) || var_05 < var_01)
		{
			var_01 = var_05;
			var_02 = var_04;
		}
	}

	return var_02;
}

//Function Number: 29
lib_A755::teleport_origin_use_nodes(param_00)
{
	level.teleport_to_nodes = param_00;
}

//Function Number: 30
lib_A755::teleport_origin_use_offset(param_00)
{
	level.teleport_to_offset = param_00;
}

//Function Number: 31
lib_A755::teleport_include_killstreaks(param_00)
{
	level.teleport_include_killsteaks = param_00;
}

//Function Number: 32
lib_A755::teleport_set_minimap_for_zone(param_00,param_01)
{
	level.teleport_minimaps[param_00] = param_01;
}

//Function Number: 33
lib_A755::teleport_set_pre_func(param_00,param_01)
{
	level.teleport_pre_funcs[param_01] = param_00;
}

//Function Number: 34
lib_A755::teleport_set_post_func(param_00,param_01)
{
	level.teleport_post_funcs[param_01] = param_00;
}

//Function Number: 35
lib_A755::teleport_parse_zone_targets(param_00)
{
	if(isdefined(param_00.origins_pasrsed) && param_00.origins_pasrsed)
	{
		return;
	}

	param_00.teleport_origins = [];
	param_00.teleport_origins["none"] = [];
	param_00.teleport_origins["allies"] = [];
	param_00.teleport_origins["axis"] = [];
	var_01 = common_scripts\utility::getstructarray("teleport_zone_" + param_00.name,"targetname");
	if(isdefined(param_00.target))
	{
		var_02 = common_scripts\utility::getstructarray(param_00.target,"targetname");
		var_01 = common_scripts\utility::array_combine(var_02,var_01);
	}

	var_03 = var_01;
	var_0D = getfirstarraykey(var_03);
	if(isdefined(var_0D))
	{
		var_04 = var_03[var_0D];
		if(!isdefined(var_04.var_39B))
		{
			var_04.var_39B = "teleport_origin";
		}

		switch(var_04.var_39B)
		{
			case "teleport_origin":
				break;

			case "telport_origin_nodrop":
				break;

			default:
				break;
		}
	}
}

//Function Number: 36
lib_A755::teleport_set_current_zone(param_00)
{
	level.teleport_zone_current = param_00;
	if(isdefined(level.teleport_minimaps[param_00]))
	{
		maps\mp\_compass::setupminimap(level.teleport_minimaps[param_00]);
	}
}

//Function Number: 37
lib_A755::teleport_filter_spawn_point(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = level.teleport_zone_current;
	}

	var_02 = [];
	foreach(var_04 in param_00)
	{
		if(!isdefined(var_04.teleport_label))
		{
			var_04.teleport_label = "ent_" + var_04 getentitynumber();
		}

		if(!isdefined(level.teleport_spawn_info[var_04.teleport_label]))
		{
			lib_A755::teleport_init_spawn_info(var_04);
		}

		if(level.teleport_spawn_info[var_04.teleport_label].zone == param_01)
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 38
lib_A755::teleport_init_spawn_info(param_00)
{
	if(!isdefined(param_00.teleport_label))
	{
		param_00.teleport_label = "ent_" + param_00 getentitynumber();
	}

	if(isdefined(level.teleport_spawn_info[param_00.teleport_label]))
	{
		return;
	}

	var_01 = spawnstruct();
	var_01.spawner = param_00;
	var_02 = undefined;
	foreach(var_04 in level.teleport_zones)
	{
		var_05 = distance(var_04.var_2E6,param_00.var_2E6);
		if(!isdefined(var_02) || var_05 < var_02)
		{
			var_02 = var_05;
			var_01.zone = var_04.name;
		}
	}

	level.teleport_spawn_info[param_00.teleport_label] = var_01;
}

//Function Number: 39
lib_A755::teleport_is_valid_zone(param_00)
{
	foreach(var_03, var_02 in level.teleport_zones)
	{
		if(var_03 == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 40
lib_A755::teleport_to_zone(param_00,param_01)
{
	if(!level.teleport_allowed)
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	var_02 = level.teleport_pre_funcs[param_00];
	if(isdefined(var_02) && param_01)
	{
		[[ var_02 ]]();
	}

	var_03 = level.teleport_zones[level.teleport_zone_current];
	var_04 = level.teleport_zones[param_00];
	if(!isdefined(var_03) || !isdefined(var_04))
	{
		return;
	}

	if(level.teleport_include_players)
	{
		lib_A755::teleport_to_zone_players(param_00);
		lib_A755::teleport_to_zone_agents(param_00);
	}

	if(level.teleport_include_killsteaks)
	{
		lib_A755::teleport_to_zone_killstreaks(param_00);
	}

	if(isdefined(level.teleport_gamemode_func))
	{
		[[ level.teleport_gamemode_func ]](param_00);
	}

	lib_A755::teleport_set_current_zone(param_00);
	level notify("teleport_to_zone",param_00);
	var_05 = level.teleport_post_funcs[param_00];
	if(isdefined(var_05) && param_01)
	{
		[[ var_05 ]]();
	}

	if(isdefined(level.bot_funcs) && isdefined(level.bot_funcs["post_teleport"]))
	{
		[[ level.bot_funcs["post_teleport"] ]]();
	}
}

//Function Number: 41
lib_A755::teleport_to_zone_agents(param_00)
{
	var_01 = maps\mp\agents\_agent_utility::getactiveagentsoftype("all");
	foreach(var_03 in var_01)
	{
		lib_A755::teleport_to_zone_character(param_00,var_03);
	}
}

//Function Number: 42
lib_A755::teleport_to_zone_players(param_00)
{
	foreach(var_02 in level.var_328)
	{
		lib_A755::teleport_to_zone_character(param_00,var_02);
	}
}

//Function Number: 43
lib_A755::teleport_to_zone_character(param_00,param_01)
{
	var_02 = level.teleport_zones[level.teleport_zone_current];
	var_03 = level.teleport_zones[param_00];
	var_04 = gettime();
	if(isplayer(param_01) && param_01.sessionstate == "intermission" || param_01.sessionstate == "spectator")
	{
		var_05 = getentarray("mp_global_intermission","classname");
		var_05 = lib_A755::teleport_filter_spawn_point(var_05,param_00);
		var_06 = var_05[0];
		param_01 dontinterpolate();
		param_01 setorigin(var_06.var_2E6);
		param_01 setplayerangles(var_06.var_41);
		return;
	}

	var_07 = undefined;
	var_08 = var_03.var_41;
	if(isplayer(var_03))
	{
		var_08 = var_03 getplayerangles();
	}

	foreach(var_0E, var_0A in var_05.teleport_origins)
	{
		var_05.teleport_origins[var_0E] = common_scripts\utility::array_randomize(var_0A);
		foreach(var_0C in var_0A)
		{
			var_0C.claimed = 0;
		}
	}

	var_0F = [];
	if(level.teambased)
	{
		if(isdefined(var_03.inliveplayerkillstreak) && isdefined(var_05.teleport_origins[var_03.inliveplayerkillstreak]))
		{
			var_0F = var_05.teleport_origins[var_03.inliveplayerkillstreak];
		}
	}
	else
	{
		var_0F = var_05.teleport_origins["none"];
	}

	foreach(var_0C in var_0F)
	{
		if(!var_0C.claimed)
		{
			var_07 = var_0C.var_2E6;
			var_08 = var_0C.var_41;
			var_0C.claimed = 1;
			break;
		}
	}

	var_12 = var_05.var_2E6 - var_04.var_2E6;
	var_13 = var_03.var_2E6 + var_12;
	if(!isdefined(var_07) && level.teleport_to_offset)
	{
		if(canspawn(var_13) && !positionwouldtelefrag(var_13))
		{
			var_07 = var_13;
		}
	}

	if(!isdefined(var_07) && level.teleport_to_nodes)
	{
		var_14 = getnodesinradiussorted(var_13,300,0,200,"Path");
		for(var_15 = 0;var_15 < var_14.size;var_15++)
		{
			var_16 = var_14[var_15];
			if(isdefined(var_16.last_teleport_time) && var_16.last_teleport_time == var_06)
			{
				continue;
			}

			var_0C = var_16.var_2E6;
			if(canspawn(var_0C) && !positionwouldtelefrag(var_0C))
			{
				var_16.last_teleport_time = var_06;
				var_07 = var_0C;
				break;
			}
		}
	}

	if(!isdefined(var_07))
	{
		var_03 maps\mp\_utility::_suicide();
		return;
	}

	var_03 cancelmantle();
	var_03 dontinterpolate();
	var_03 setorigin(var_07);
	var_03 setplayerangles(var_08);
	thread lib_A755::teleport_validate_success(var_03);
}

//Function Number: 44
lib_A755::teleport_validate_success(param_00)
{
	wait 0.05;
	if(isdefined(param_00))
	{
		var_01 = lib_A755::teleport_closest_zone(param_00.var_2E6);
		if(var_01.name != level.teleport_zone_current)
		{
			param_00 maps\mp\_utility::_suicide();
		}
	}
}

//Function Number: 45
lib_A755::get_teleport_delta(param_00)
{
	var_01 = level.teleport_zones[param_00];
	var_02 = level.teleport_zones[level.teleport_zone_current];
	var_03 = var_01.var_2E6 - var_02.var_2E6;
	return var_03;
}

//Function Number: 46
lib_A755::teleport_to_zone_killstreaks(param_00)
{
}

//Function Number: 47
lib_A755::teleport_notify_death()
{
	if(isdefined(self))
	{
		self notify("death");
	}
}

//Function Number: 48
lib_A755::array_thread_safe(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(!isdefined(param_00))
	{
		return;
	}

	common_scripts\utility::array_thread(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
}

//Function Number: 49
lib_A755::array_levelthread_safe(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_00))
	{
		return;
	}

	common_scripts\utility::array_levelthread(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 50
lib_A755::teleport_get_care_packages()
{
	return getentarray("care_package","targetname");
}

//Function Number: 51
lib_A755::teleport_get_deployable_boxes()
{
	var_00 = [];
	var_01 = getentarray("script_model","classname");
	foreach(var_03 in var_01)
	{
		if(isdefined(var_03.boxtype))
		{
			var_00[var_00.size] = var_03;
		}
	}

	return var_00;
}

//Function Number: 52
lib_A755::teleport_place_on_ground(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 300;
	}

	var_02 = param_00.var_2E6;
	var_03 = param_00.var_2E6 - (0,0,param_01);
	var_04 = bullettrace(var_02,var_03,0,param_00);
	if(var_04["fraction"] < 1)
	{
		param_00.var_2E6 = var_04["position"];
		return 1;
	}

	return 0;
}

//Function Number: 53
lib_A755::teleport_add_delta_targets(param_00,param_01)
{
	if(lib_A755::teleport_delta_this_frame(param_00))
	{
		return;
	}

	lib_A755::teleport_add_delta(param_00,param_01);
	if(isdefined(param_00.target))
	{
		var_02 = getentarray(param_00.target,"targetname");
		var_03 = common_scripts\utility::getstructarray(param_00.target,"targetname");
		var_04 = common_scripts\utility::array_combine(var_02,var_03);
		common_scripts\utility::array_levelthread(var_04,::lib_A755::teleport_add_delta_targets,param_01);
	}
}

//Function Number: 54
lib_A755::teleport_self_add_delta_targets(param_00)
{
	lib_A755::teleport_add_delta_targets(self,param_00);
}

//Function Number: 55
lib_A755::teleport_self_add_delta(param_00)
{
	lib_A755::teleport_add_delta(self,param_00);
}

//Function Number: 56
lib_A755::teleport_add_delta(param_00,param_01)
{
	if(isdefined(param_00))
	{
		if(!lib_A755::teleport_delta_this_frame(param_00))
		{
			param_00.var_2E6 = param_00.var_2E6 + param_01;
			param_00.last_teleport_time = gettime();
		}
	}
}

//Function Number: 57
lib_A755::teleport_delta_this_frame(param_00)
{
	return isdefined(param_00.last_teleport_time) && param_00.last_teleport_time == gettime();
}

//Function Number: 58
lib_A755::teleport_get_active_nodes()
{
	return level.teleport_nodes_in_zone[level.teleport_zone_current];
}

//Function Number: 59
lib_A755::teleport_get_active_pathnode_zones()
{
	return level.teleport_pathnode_zones[level.teleport_zone_current];
}