/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42787.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 36
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:18:16 PM
*******************************************************************/

//Function Number: 1
lib_A723::main()
{
	if(!isdefined(level.var_2C7A))
	{
		level.var_2C7A["nearStart"] = 0;
		level.var_2C7A["nearEnd"] = 0;
		level.var_2C7A["farStart"] = 0;
		level.var_2C7A["farEnd"] = 0;
		level.var_2C7A["nearBlur"] = 6;
		level.var_2C7A["farBlur"] = 1.8;
	}
}

//Function Number: 2
lib_A723::setup_fog_tweak()
{
}

//Function Number: 3
lib_A723::inittweaks()
{
}

//Function Number: 4
lib_A723::tweaklightset()
{
}

//Function Number: 5
lib_A723::tweakart()
{
}

//Function Number: 6
lib_A723::fovslidercheck()
{
}

//Function Number: 7
lib_A723::construct_vision_ents()
{
	if(!isdefined(level.vision_set_fog))
	{
		level.vision_set_fog = [];
	}

	var_00 = getentarray("trigger_multiple_visionset","classname");
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.script_visionset))
		{
			lib_A723::construct_vision_set(var_02.script_visionset);
		}

		if(isdefined(var_02.script_visionset_start))
		{
			lib_A723::construct_vision_set(var_02.script_visionset_start);
		}

		if(isdefined(var_02.script_visionset_end))
		{
			lib_A723::construct_vision_set(var_02.script_visionset_end);
		}
	}
}

//Function Number: 8
lib_A723::construct_vision_set(param_00)
{
	if(isdefined(level.vision_set_fog[param_00]))
	{
		return;
	}

	lib_A723::create_default_vision_set_fog(param_00);
	lib_A723::create_vision_set_vision(param_00);
	iprintlnbold("new vision: " + param_00);
}

//Function Number: 9
lib_A723::create_vision_set_vision(param_00)
{
	if(!isdefined(level.vision_set_vision))
	{
		level.vision_set_vision = [];
	}

	var_01 = spawnstruct();
	var_01.name = param_00;
	level.vision_set_vision[param_00] = var_01;
	return var_01;
}

//Function Number: 10
lib_A723::add_vision_sets_from_triggers()
{
}

//Function Number: 11
lib_A723::add_vision_set(param_00)
{
}

//Function Number: 12
lib_A723::create_default_vision_set_fog(param_00)
{
	var_01 = lib_A723::create_vision_set_fog(param_00);
	var_01.startdist = 3764.17;
	var_01.halfwaydist = 19391;
	var_01.red = 0.661137;
	var_01.green = 0.554261;
	var_01.blue = 0.454014;
	var_01.maxopacity = 0.7;
	var_01.transitiontime = 0;
	var_01.skyfogintensity = 0;
	var_01.skyfogminangle = 0;
	var_01.skyfogmaxangle = 0;
	var_01.heightfogenabled = 0;
	var_01.heightfogbaseheight = 0;
	var_01.heightfoghalfplanedistance = 1000;
}

//Function Number: 13
lib_A723::create_vision_set_fog(param_00)
{
	if(!isdefined(level.vision_set_fog))
	{
		level.vision_set_fog = [];
	}

	var_01 = spawnstruct();
	var_01.name = param_00;
	var_01.skyfogintensity = 0;
	var_01.skyfogminangle = 0;
	var_01.skyfogmaxangle = 0;
	var_01.heightfogenabled = 0;
	var_01.heightfogbaseheight = 0;
	var_01.heightfoghalfplanedistance = 1000;
	level.vision_set_fog[tolower(param_00)] = var_01;
	return var_01;
}

//Function Number: 14
lib_A723::set_fog(param_00,param_01)
{
	level.vision_set_transition_ent.vision_set = param_00;
	level.vision_set_transition_ent.time = param_01;
	var_02 = lib_A723::get_fog(param_00);
	if(getdvarint("scr_art_tweak") != 0)
	{
		lib_A723::translateenttosliders(var_02);
		param_01 = 0;
	}

	common_scripts\utility::set_fog_to_ent_values(var_02,param_01);
}

//Function Number: 15
lib_A723::translateenttosliders(param_00)
{
}

//Function Number: 16
lib_A723::hud_init()
{
	var_00 = 7;
	var_01 = [];
	var_02 = 15;
	var_03 = int(var_00 / 2);
	var_04 = 240 + var_03 * var_02;
	var_05 = 0.5 / var_03;
	var_06 = var_05;
	for(var_07 = 0;var_07 < var_00;var_07++)
	{
		var_01[var_07] = lib_A723::_newhudelem();
		var_01[var_07].location = 0;
		var_01[var_07].alignx = "left";
		var_01[var_07].aligny = "middle";
		var_01[var_07].foreground = 1;
		var_01[var_07].var_18C = 2;
		var_01[var_07].fontscale = 20;
		if(var_07 == var_03)
		{
			var_01[var_07].alpha = 1;
		}
		else
		{
			var_01[var_07].alpha = var_06;
		}

		var_01[var_07].x = 20;
		var_01[var_07].y = var_04;
		var_01[var_07] lib_A723::_settext(".");
		if(var_07 == var_03)
		{
			var_05 = var_05 * -1;
		}

		var_06 = var_06 + var_05;
		var_04 = var_04 - var_02;
	}

	level.spam_group_hudelems = var_01;
}

//Function Number: 17
lib_A723::_newhudelem()
{
	if(!isdefined(level.scripted_elems))
	{
		level.scripted_elems = [];
	}

	var_00 = newhudelem();
	level.scripted_elems[level.scripted_elems.size] = var_00;
	return var_00;
}

//Function Number: 18
lib_A723::_settext(param_00)
{
	self.realtext = param_00;
	self settext("_");
	thread lib_A723::_clearalltextafterhudelem();
	var_01 = 0;
	foreach(var_03 in level.scripted_elems)
	{
		if(isdefined(var_03.realtext))
		{
			var_01 = var_01 + var_03.realtext.size;
			var_03 settext(var_03.realtext);
		}
	}
}

//Function Number: 19
lib_A723::_clearalltextafterhudelem()
{
	if(getdvar("netconststrings_enabled") != "0")
	{
		return;
	}

	if(level._clearalltextafterhudelem)
	{
		return;
	}

	level._clearalltextafterhudelem = 1;
	self method_80CB();
	wait(0.05);
	level._clearalltextafterhudelem = 0;
}

//Function Number: 20
lib_A723::setgroup_up()
{
	lib_A723::reset_cmds();
	var_00 = undefined;
	var_01 = getarraykeys(level.vision_set_fog);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02] == level.vision_set_transition_ent.vision_set)
		{
			var_00 = var_02 + 1;
			break;
		}
	}

	if(var_00 == var_01.size)
	{
		return;
	}

	lib_A723::setcurrentgroup(var_01[var_00]);
}

//Function Number: 21
lib_A723::setgroup_down()
{
	lib_A723::reset_cmds();
	var_00 = undefined;
	var_01 = getarraykeys(level.vision_set_fog);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02] == level.vision_set_transition_ent.vision_set)
		{
			var_00 = var_02 - 1;
			break;
		}
	}

	if(var_00 < 0)
	{
		return;
	}

	lib_A723::setcurrentgroup(var_01[var_00]);
}

//Function Number: 22
lib_A723::reset_cmds()
{
}

//Function Number: 23
vision_set_fog_changes_mp(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		var_03 visionsetnakedforplayer(param_00,param_01);
		var_03 method_8323("dev_vision_exec");
		wait(0.05);
		var_03 method_8325("dev_vision_exec");
	}

	lib_A723::set_fog(param_00,param_01);
}

//Function Number: 24
lib_A723::setcurrentgroup(param_00)
{
	var_01 = getarraykeys(level.vision_set_fog);
	if(level.currentgen)
	{
		var_02 = param_00 + "_cg";
		var_03 = common_scripts\utility::array_find(var_01,var_02);
		if(isdefined(var_03))
		{
			param_00 = var_02;
		}
	}

	level.spam_model_current_group = param_00;
	var_04 = 0;
	var_05 = int(level.spam_group_hudelems.size / 2);
	for(var_06 = 0;var_06 < var_01.size;var_06++)
	{
		if(var_01[var_06] == param_00)
		{
			var_04 = var_06;
			break;
		}
	}

	level.spam_group_hudelems[var_05] lib_A723::_settext(var_01[var_04]);
	for(var_06 = 1;var_06 < level.spam_group_hudelems.size - var_05;var_06++)
	{
		if(var_04 - var_06 < 0)
		{
			level.spam_group_hudelems[var_05 + var_06] lib_A723::_settext(".");
			continue;
		}

		level.spam_group_hudelems[var_05 + var_06] lib_A723::_settext(var_01[var_04 - var_06]);
	}

	for(var_06 = 1;var_06 < level.spam_group_hudelems.size - var_05;var_06++)
	{
		if(var_04 + var_06 > var_01.size - 1)
		{
			level.spam_group_hudelems[var_05 - var_06] lib_A723::_settext(".");
			continue;
		}

		level.spam_group_hudelems[var_05 - var_06] lib_A723::_settext(var_01[var_04 + var_06]);
	}

	vision_set_fog_changes_mp(var_01[var_04],0);
}

//Function Number: 25
lib_A723::get_fog(param_00)
{
	if(!isdefined(level.vision_set_fog))
	{
		level.vision_set_fog = [];
	}

	var_01 = level.vision_set_fog[param_00];
	return var_01;
}

//Function Number: 26
lib_A723::init_fog_transition()
{
	if(!isdefined(level.fog_transition_ent))
	{
		level.fog_transition_ent = spawnstruct();
		level.fog_transition_ent.fogset = "";
		level.fog_transition_ent.time = 0;
	}
}

//Function Number: 27
lib_A723::playerinit()
{
	var_00 = level.vision_set_transition_ent.vision_set;
	level.vision_set_transition_ent.vision_set = "";
	level.vision_set_transition_ent.time = "";
	lib_A723::init_fog_transition();
	level.fog_transition_ent.fogset = "";
	level.fog_transition_ent.time = "";
	lib_A723::setcurrentgroup(var_00);
}

//Function Number: 28
lib_A723::button_down(param_00,param_01)
{
	var_02 = level.var_31D buttonpresseddevonly(param_00);
	if(!var_02)
	{
		var_02 = level.var_31D buttonpresseddevonly(param_01);
	}

	if(!isdefined(level.buttons[param_00]))
	{
		level.buttons[param_00] = 0;
	}

	if(gettime() < level.buttons[param_00])
	{
		return 0;
	}

	level.buttons[param_00] = gettime() + 400;
	return var_02;
}

//Function Number: 29
lib_A723::dumpsettings()
{
}

//Function Number: 30
lib_A723::artstartvisionfileexport()
{
	common_scripts\utility::fileprint_launcher_start_file();
}

//Function Number: 31
lib_A723::artendvisionfileexport()
{
	return common_scripts\utility::fileprint_launcher_end_file("\\share\\raw\\vision\\" + level.script + ".vision",1);
}

//Function Number: 32
lib_A723::artstartfogfileexport()
{
	common_scripts\utility::fileprint_launcher_start_file();
}

//Function Number: 33
lib_A723::artendfogfileexport()
{
	return common_scripts\utility::fileprint_launcher_end_file("\\share\\raw\\maps\\createart\\" + level.script + "_art.gsc",1);
}

//Function Number: 34
lib_A723::artfxprintlnfog()
{
	common_scripts\utility::fileprint_launcher("");
	common_scripts\utility::fileprint_launcher("\t//* Fog section * ");
	common_scripts\utility::fileprint_launcher("");
	common_scripts\utility::fileprint_launcher("\tsetDevDvar( \"scr_fog_disable\", \" + getdvarint("scr_fog_disable") + "\" + " );");
	common_scripts\utility::fileprint_launcher("");
	common_scripts\utility::fileprint_launcher("\t/$");
	if(function_0235())
	{
		common_scripts\utility::fileprint_launcher("\tlevel._art_fog_setup = maps\\createart\\" + level.script + "_fog_hdr::main;");
	}
	else
	{
		common_scripts\utility::fileprint_launcher("\tlevel._art_fog_setup = maps\\createart\\" + level.script + "_fog::main;");
	}

	common_scripts\utility::fileprint_launcher("\t$/");
}

//Function Number: 35
lib_A723::art_print_fog()
{
}

//Function Number: 36
lib_A723::create_light_set(param_00)
{
	if(!isdefined(level.light_set))
	{
		level.light_set = [];
	}

	var_01 = spawnstruct();
	var_01.name = param_00;
	level.light_set[param_00] = var_01;
	return var_01;
}