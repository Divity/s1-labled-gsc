/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42216.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 137
 * Decompile Time: 79 ms
 * Timestamp: 4/20/2022 8:18:13 PM
*******************************************************************/

//Function Number: 1
lib_A4E8::soundonly()
{
	return getdvar("scr_createfx_type","0") == "2";
}

//Function Number: 2
lib_A4E8::fxonly()
{
	return getdvar("scr_createfx_type","0") == "1";
}

//Function Number: 3
lib_A4E8::tracknoneditfx(param_00)
{
	if(isdefined(level.tracked_ent))
	{
		if(!isdefined(level.tracked_ents))
		{
			level.tracked_ents = [];
		}

		level.tracked_ents[level.tracked_ents.size] = level.tracked_ent.v;
	}

	level.tracked_ent = param_00;
}

//Function Number: 4
lib_A4E8::createeffect(param_00,param_01)
{
	var_02 = spawnstruct();
	if(lib_A4E8::soundonly())
	{
		lib_A4E8::tracknoneditfx(var_02);
	}
	else
	{
		if(!isdefined(level.createfxent))
		{
			level.createfxent = [];
		}

		level.createfxent[level.createfxent.size] = var_02;
	}

	var_02.v = [];
	var_02.v["type"] = param_00;
	var_02.v["fxid"] = param_01;
	var_02.v["angles"] = (0,0,0);
	var_02.v["origin"] = (0,0,0);
	var_02.drawn = 1;
	if(isdefined(param_01) && isdefined(level.createfxbyfxid))
	{
		var_03 = level.createfxbyfxid[param_01];
		if(!isdefined(var_03))
		{
			var_03 = [];
		}

		var_03[var_03.size] = var_02;
		level.createfxbyfxid[param_01] = var_03;
	}

	return var_02;
}

//Function Number: 5
lib_A4E8::getloopeffectdelaydefault()
{
	return 0.5;
}

//Function Number: 6
lib_A4E8::getoneshoteffectdelaydefault()
{
	return -15;
}

//Function Number: 7
lib_A4E8::getexploderdelaydefault()
{
	return 0;
}

//Function Number: 8
lib_A4E8::getintervalsounddelaymindefault()
{
	return 0.75;
}

//Function Number: 9
lib_A4E8::getintervalsounddelaymaxdefault()
{
	return 2;
}

//Function Number: 10
lib_A4E8::createloopsound()
{
	var_00 = spawnstruct();
	if(lib_A4E8::fxonly())
	{
		lib_A4E8::tracknoneditfx(var_00);
	}
	else
	{
		if(!isdefined(level.createfxent))
		{
			level.createfxent = [];
		}

		level.createfxent[level.createfxent.size] = var_00;
	}

	var_00.v = [];
	var_00.v["type"] = "soundfx";
	var_00.v["fxid"] = "No FX";
	var_00.v["soundalias"] = "nil";
	var_00.v["angles"] = (0,0,0);
	var_00.v["origin"] = (0,0,0);
	var_00.v["server_culled"] = 1;
	if(getdvar("serverCulledSounds") != "1")
	{
		var_00.v["server_culled"] = 0;
	}

	var_00.drawn = 1;
	return var_00;
}

//Function Number: 11
lib_A4E8::createintervalsound()
{
	var_00 = lib_A4E8::createloopsound();
	var_00.v["type"] = "soundfx_interval";
	var_00.v["delay_min"] = lib_A4E8::getintervalsounddelaymindefault();
	var_00.v["delay_max"] = lib_A4E8::getintervalsounddelaymaxdefault();
	return var_00;
}

//Function Number: 12
lib_A4E8::createdynamicambience()
{
	var_00 = spawnstruct();
	if(lib_A4E8::fxonly())
	{
		lib_A4E8::tracknoneditfx(var_00);
	}
	else
	{
		if(!isdefined(level.createfxent))
		{
			level.createfxent = [];
		}

		level.createfxent[level.createfxent.size] = var_00;
	}

	var_00.v = [];
	var_00.v["origin"] = (0,0,0);
	var_00.v["dynamic_distance"] = 1000;
	var_00.v["fxid"] = "No FX";
	var_00.v["type"] = "soundfx_dynamic";
	var_00.v["ambiencename"] = "nil";
	return var_00;
}

//Function Number: 13
lib_A4E8::createnewexploder()
{
	var_00 = spawnstruct();
	if(lib_A4E8::fxonly())
	{
		lib_A4E8::tracknoneditfx(var_00);
	}
	else
	{
		if(!isdefined(level.createfxent))
		{
			level.createfxent = [];
		}

		level.createfxent[level.createfxent.size] = var_00;
	}

	var_00.v = [];
	var_00.v["type"] = "exploder";
	var_00.v["fxid"] = "No FX";
	var_00.v["soundalias"] = "nil";
	var_00.v["loopsound"] = "nil";
	var_00.v["angles"] = (0,0,0);
	var_00.v["origin"] = (0,0,0);
	var_00.v["exploder"] = 1;
	var_00.v["flag"] = "nil";
	var_00.v["exploder_type"] = "normal";
	var_00.drawn = 1;
	return var_00;
}

//Function Number: 14
lib_A4E8::createexploderex(param_00,param_01)
{
	var_02 = common_scripts\utility::createexploder(param_00);
	var_02.v["exploder"] = param_01;
	return var_02;
}

//Function Number: 15
lib_A4E8::createreactiveent()
{
	var_00 = spawnstruct();
	if(lib_A4E8::soundonly())
	{
		lib_A4E8::tracknoneditfx(var_00);
	}
	else
	{
		if(!isdefined(level.createfxent))
		{
			level.createfxent = [];
		}

		level.createfxent[level.createfxent.size] = var_00;
	}

	var_00.v = [];
	var_00.v["origin"] = (0,0,0);
	var_00.v["reactive_radius"] = 200;
	var_00.v["fxid"] = "No FX";
	var_00.v["type"] = "reactive_fx";
	var_00.v["soundalias"] = "nil";
	return var_00;
}

//Function Number: 16
lib_A4E8::set_origin_and_angles(param_00,param_01)
{
	if(isdefined(level.createfx_offset))
	{
		param_00 = param_00 + level.createfx_offset;
	}

	self.v["origin"] = param_00;
	self.v["angles"] = param_01;
}

//Function Number: 17
lib_A4E8::set_forward_and_up_vectors()
{
	self.v["up"] = anglestoup(self.v["angles"]);
	self.v["forward"] = anglestoforward(self.v["angles"]);
}

//Function Number: 18
lib_A4E8::convertoneshotfx()
{
	setdvarifuninitialized("curr_exp_num",1);
	var_00 = getdvarint("curr_exp_num");
	for(var_01 = 0;var_01 < level._createfx.selected_fx_ents.size;var_01++)
	{
		var_02 = level._createfx.selected_fx_ents[var_01];
		function_0155(var_02.looper,1);
		wait 0.05;
		var_02 common_scripts\utility::pauseeffect();
		var_02.v["type"] = "exploder";
		var_02.v["exploder"] = var_00;
		var_02.v["exploder_type"] = "normal";
		var_02 common_scripts\utility::activate_individual_exploder();
	}

	level._createfx.justconvertedoneshot = 1;
}

//Function Number: 19
lib_A4E8::createfx_common()
{
	precacheshader("black");
	level._createfx = spawnstruct();
	level._createfx.grenade = spawn("script_origin",(0,0,0));
	level._createfx.grenade.fx = loadfx("vfx/explosion/frag_grenade_default");
	level._createfx.grenade.sound = "null";
	level._createfx.grenade.radius = 256;
	if(level.mp_createfx)
	{
		lib_A4E8::hack_start("painter_mp");
	}
	else
	{
		lib_A4E8::hack_start("painter");
	}

	common_scripts\utility::flag_init("createfx_saving");
	common_scripts\utility::flag_init("createfx_started");
	if(!isdefined(level.createfx))
	{
		level.createfx = [];
	}

	level.createfx_loopcounter = 0;
	setdvar("ui_hidehud","1");
	level notify("createfx_common_done");
}

//Function Number: 20
lib_A4E8::init_level_variables()
{
	level._createfx.selectedmove_up = 0;
	level._createfx.selectedmove_forward = 0;
	level._createfx.selectedmove_right = 0;
	level._createfx.selectedrotate_pitch = 0;
	level._createfx.selectedrotate_roll = 0;
	level._createfx.selectedrotate_yaw = 0;
	level._createfx.selected_fx = [];
	level._createfx.selected_fx_ents = [];
	level._createfx.justconvertedoneshot = 0;
	level._createfx.rate = 1;
	level._createfx.snap2normal = 0;
	level._createfx.snap90deg = 0;
	level._createfx.localrot = 0;
	level._createfx.axismode = 0;
	level._createfx.select_by_name = 0;
	level._createfx.player_speed = getdvarfloat("g_speed");
	lib_A4E8::set_player_speed_hud();
}

//Function Number: 21
lib_A4E8::init_locked_list()
{
	level._createfx.lockedlist = [];
	level._createfx.lockedlist["escape"] = 1;
	level._createfx.lockedlist["BUTTON_LSHLDR"] = 1;
	level._createfx.lockedlist["BUTTON_RSHLDR"] = 1;
	level._createfx.lockedlist["mouse1"] = 1;
	level._createfx.lockedlist["ctrl"] = 1;
}

//Function Number: 22
lib_A4E8::init_colors()
{
	var_00 = [];
	var_00["loopfx"]["selected"] = (1,1,0.2);
	var_00["loopfx"]["highlighted"] = (0.4,0.95,1);
	var_00["loopfx"]["default"] = (0.3,0.8,1);
	var_00["oneshotfx"]["selected"] = (1,1,0.2);
	var_00["oneshotfx"]["highlighted"] = (0.3,0.6,1);
	var_00["oneshotfx"]["default"] = (0.1,0.2,1);
	var_00["exploder"]["selected"] = (1,1,0.2);
	var_00["exploder"]["highlighted"] = (1,0.2,0.2);
	var_00["exploder"]["default"] = (1,0.1,0.1);
	var_00["rainfx"]["selected"] = (1,1,0.2);
	var_00["rainfx"]["highlighted"] = (0.95,0.4,0.95);
	var_00["rainfx"]["default"] = (0.78,0,0.73);
	var_00["soundfx"]["selected"] = (1,1,0.2);
	var_00["soundfx"]["highlighted"] = (0.2,1,0.2);
	var_00["soundfx"]["default"] = (0.1,1,0.1);
	var_00["soundfx_interval"]["selected"] = (1,1,0.2);
	var_00["soundfx_interval"]["highlighted"] = (0.3,1,0.3);
	var_00["soundfx_interval"]["default"] = (0.1,1,0.1);
	var_00["reactive_fx"]["selected"] = (1,1,0.2);
	var_00["reactive_fx"]["highlighted"] = (0.5,1,0.75);
	var_00["reactive_fx"]["default"] = (0.2,0.9,0.2);
	var_00["soundfx_dynamic"]["selected"] = (1,1,0.2);
	var_00["soundfx_dynamic"]["highlighted"] = (0.3,1,0.3);
	var_00["soundfx_dynamic"]["default"] = (0.1,1,0.1);
	level._createfx.colors = var_00;
}

//Function Number: 23
lib_A4E8::createfxlogic()
{
	waittillframeend;
	wait(0.05);
	if(!isdefined(level._effect))
	{
		level._effect = [];
	}

	if(getdvar("createfx_map") == "")
	{
	}
	else if(getdvar("createfx_map") == common_scripts\utility::get_template_level())
	{
		[[ level.func_position_player ]]();
	}

	lib_A4E8::init_crosshair();
	common_scripts\_createfxmenu::init_menu();
	lib_A4E8::init_huds();
	lib_A4E8::init_tool_hud();
	lib_A4E8::init_crosshair();
	lib_A4E8::init_level_variables();
	lib_A4E8::init_locked_list();
	lib_A4E8::init_colors();
	if(getdvar("createfx_use_f4") == "")
	{
	}

	if(getdvar("createfx_no_autosave") == "")
	{
	}

	level.createfx_draw_enabled = 1;
	level.last_displayed_ent = undefined;
	level.buttonisheld = [];
	var_00 = (0,0,0);
	common_scripts\utility::flag_set("createfx_started");
	if(!level.mp_createfx)
	{
		var_00 = level.var_31D.var_2E6;
	}

	var_01 = undefined;
	level.fx_rotating = 0;
	common_scripts\_createfxmenu::setmenu("none");
	level.createfx_selecting = 0;
	var_02 = newhudelem();
	var_02.x = -120;
	var_02.y = 200;
	var_02.foreground = 0;
	var_02 setshader("black",250,160);
	var_02.alpha = 0;
	level.createfx_inputlocked = 0;
	foreach(var_04 in level.createfxent)
	{
		var_04 lib_A4E8::post_entity_creation_function();
	}

	thread lib_A4E8::draw_distance();
	var_06 = undefined;
	thread lib_A4E8::createfx_autosave();
	level.createfx_last_movement_timer = 0;
	thread lib_A4E8::save_undo_buffer();
	thread lib_A4E8::setup_last_movement_timer();
	for(;;)
	{
		var_07 = 0;
		var_08 = anglestoright(level.var_31D getplayerangles());
		var_09 = anglestoforward(level.var_31D getplayerangles());
		var_0A = anglestoup(level.var_31D getplayerangles());
		var_0B = 0.85;
		var_0C = var_09 * 750;
		level.createfxcursor = bullettrace(level.var_31D geteye(),level.var_31D geteye() + var_0C,0,undefined);
		var_0D = undefined;
		level.buttonclick = [];
		level.button_is_kb = [];
		lib_A4E8::process_button_held_and_clicked();
		var_0E = lib_A4E8::button_is_held("ctrl","BUTTON_LSHLDR");
		var_0F = lib_A4E8::button_is_clicked("mouse1","BUTTON_A");
		var_10 = lib_A4E8::button_is_held("mouse1","BUTTON_A");
		var_11 = lib_A4E8::button_is_held("shift");
		common_scripts\_createfxmenu::create_fx_menu();
		var_12 = "F5";
		if(getdvarint("createfx_use_f4"))
		{
			var_12 = "F4";
		}

		if(lib_A4E8::button_is_clicked(var_12))
		{
		}

		if(getdvarint("scr_createfx_dump"))
		{
			lib_A4E8::generate_fx_log();
		}

		if(lib_A4E8::button_is_clicked("F2"))
		{
			lib_A4E8::toggle_createfx_drawing();
		}

		if(lib_A4E8::button_is_clicked("ins"))
		{
			lib_A4E8::insert_effect();
		}

		if(lib_A4E8::button_is_clicked("del"))
		{
			lib_A4E8::delete_pressed();
		}

		if(lib_A4E8::button_is_clicked("escape"))
		{
			lib_A4E8::clear_settable_fx();
		}

		if(lib_A4E8::button_is_clicked("rightarrow","space") && !level.createfx_menu_list_active)
		{
			lib_A4E8::set_off_exploders();
		}

		if(lib_A4E8::button_is_clicked("leftarrow") && !level.createfx_menu_list_active)
		{
			lib_A4E8::turn_off_exploders();
		}

		if(lib_A4E8::button_is_clicked("f"))
		{
			lib_A4E8::frame_selected();
		}

		if(lib_A4E8::button_is_clicked("u"))
		{
			lib_A4E8::select_by_name_list();
		}

		if(lib_A4E8::button_is_clicked("c"))
		{
			lib_A4E8::convertoneshotfx();
		}

		lib_A4E8::modify_player_speed();
		if(!var_0E && lib_A4E8::button_is_clicked("g"))
		{
			lib_A4E8::select_all_exploders_of_currently_selected("exploder");
			lib_A4E8::select_all_exploders_of_currently_selected("flag");
		}

		if(lib_A4E8::button_is_clicked("h","F1"))
		{
			lib_A4E8::show_help();
		}

		if(lib_A4E8::button_is_clicked("BUTTON_LSTICK"))
		{
			lib_A4E8::copy_ents();
		}

		if(lib_A4E8::button_is_clicked("BUTTON_RSTICK"))
		{
			lib_A4E8::paste_ents();
		}

		if(lib_A4E8::button_is_clicked("z"))
		{
			lib_A4E8::undo();
		}

		if(lib_A4E8::button_is_clicked("z") && var_11)
		{
			lib_A4E8::redo();
		}

		if(var_0E)
		{
			if(lib_A4E8::button_is_clicked("c"))
			{
				lib_A4E8::copy_ents();
			}

			if(lib_A4E8::button_is_clicked("v"))
			{
				lib_A4E8::paste_ents();
			}

			if(lib_A4E8::button_is_clicked("g"))
			{
				lib_A4E8::spawn_grenade();
			}
		}

		if(isdefined(level._createfx.selected_fx_option_index))
		{
			common_scripts\_createfxmenu::menu_fx_option_set();
		}

		for(var_13 = 0;var_13 < level.createfxent.size;var_13++)
		{
			var_04 = level.createfxent[var_13];
			var_14 = vectornormalize(var_04.v["origin"] - level.var_31D.var_2E6 + (0,0,55));
			var_15 = vectordot(var_09,var_14);
			if(var_15 < var_0B)
			{
				continue;
			}

			var_0B = var_15;
			var_0D = var_04;
		}

		level.fx_highlightedent = var_0D;
		if(isdefined(var_0D))
		{
			if(isdefined(var_01))
			{
				if(var_01 != var_0D)
				{
					if(!lib_A4E8::ent_is_selected(var_01))
					{
						var_01 thread lib_A4E8::entity_highlight_disable();
					}

					if(!lib_A4E8::ent_is_selected(var_0D))
					{
						var_0D thread lib_A4E8::entity_highlight_enable();
					}
				}
			}
			else if(!lib_A4E8::ent_is_selected(var_0D))
			{
				var_0D thread lib_A4E8::entity_highlight_enable();
			}
		}

		lib_A4E8::manipulate_createfx_ents(var_0D,var_0F,var_10,var_0E,var_08);
		var_07 = lib_A4E8::handle_selected_ents(var_07);
		wait(0.05);
		if(var_07)
		{
			lib_A4E8::update_selected_entities();
		}

		if(!level.mp_createfx)
		{
			var_00 = [[ level.func_position_player_get ]](var_00);
		}

		var_01 = var_0D;
		if(lib_A4E8::last_selected_entity_has_changed(var_06))
		{
			level.effect_list_offset = 0;
			lib_A4E8::clear_settable_fx();
			common_scripts\_createfxmenu::setmenu("none");
		}

		if(level._createfx.selected_fx_ents.size)
		{
			var_06 = level._createfx.selected_fx_ents[level._createfx.selected_fx_ents.size - 1];
			continue;
		}

		var_06 = undefined;
	}
}

//Function Number: 24
lib_A4E8::modify_player_speed()
{
	var_00 = 0;
	var_01 = lib_A4E8::button_is_held("ctrl");
	if(lib_A4E8::button_is_held("."))
	{
		if(var_01)
		{
			if(level._createfx.player_speed < 190)
			{
				level._createfx.player_speed = 190;
			}
			else
			{
				level._createfx.player_speed = level._createfx.player_speed + 10;
			}
		}
		else
		{
			level._createfx.player_speed = level._createfx.player_speed + 5;
		}

		var_00 = 1;
	}
	else if(lib_A4E8::button_is_held(","))
	{
		if(var_01)
		{
			if(level._createfx.player_speed > 190)
			{
				level._createfx.player_speed = 190;
			}
			else
			{
				level._createfx.player_speed = level._createfx.player_speed - 10;
			}
		}
		else
		{
			level._createfx.player_speed = level._createfx.player_speed - 5;
		}

		var_00 = 1;
	}

	if(var_00)
	{
		level._createfx.player_speed = clamp(level._createfx.player_speed,5,500);
		[[ level.func_player_speed ]]();
		lib_A4E8::set_player_speed_hud();
	}
}

//Function Number: 25
lib_A4E8::set_player_speed_hud()
{
	if(!isdefined(level._createfx.player_speed_hud))
	{
		var_00 = newhudelem();
		var_00.alignx = "right";
		var_00.foreground = 1;
		var_00.var_18C = 1.2;
		var_00.alpha = 1;
		var_00.x = 120;
		var_00.y = 420;
		var_01 = newhudelem();
		var_01.alignx = "left";
		var_01.foreground = 1;
		var_01.var_18C = 1.2;
		var_01.alpha = 1;
		var_01.x = 120;
		var_01.y = 420;
		var_00.hud_value = var_01;
		level._createfx.player_speed_hud = var_00;
	}

	level._createfx.player_speed_hud.hud_value setvalue(level._createfx.player_speed);
}

//Function Number: 26
lib_A4E8::toggle_createfx_drawing()
{
	level.createfx_draw_enabled = !level.createfx_draw_enabled;
}

//Function Number: 27
lib_A4E8::insert_effect()
{
	common_scripts\_createfxmenu::setmenu("creation");
	level.effect_list_offset = 0;
	lib_A4E8::clear_fx_hudelements();
	lib_A4E8::set_fx_hudelement("Pick effect type to create:");
	lib_A4E8::set_fx_hudelement("1. One Shot FX");
	lib_A4E8::set_fx_hudelement("2. Looping FX");
	lib_A4E8::set_fx_hudelement("3. Looping sound");
	lib_A4E8::set_fx_hudelement("4. Exploder");
	lib_A4E8::set_fx_hudelement("5. One Shot Sound");
	lib_A4E8::set_fx_hudelement("6. Reactive Sound");
	lib_A4E8::set_fx_hudelement("7. Dynamic Ambience");
	lib_A4E8::set_fx_hudelement("(c) Cancel >");
	lib_A4E8::set_fx_hudelement("(x) Exit >");
}

//Function Number: 28
lib_A4E8::manipulate_createfx_ents(param_00,param_01,param_02,param_03,param_04)
{
	if(!level.createfx_draw_enabled)
	{
		return;
	}

	if(level._createfx.select_by_name)
	{
		level._createfx.select_by_name = 0;
		param_00 = undefined;
	}
	else if(lib_A4E8::select_by_substring())
	{
		param_00 = undefined;
	}

	for(var_05 = 0;var_05 < level.createfxent.size;var_05++)
	{
		var_06 = level.createfxent[var_05];
		if(!var_06.drawn)
		{
			continue;
		}

		var_07 = getdvarfloat("createfx_scaleid");
		if(isdefined(param_00) && var_06 == param_00)
		{
			if(!common_scripts\_createfxmenu::entities_are_selected())
			{
				common_scripts\_createfxmenu::display_fx_info(var_06);
			}

			if(param_01)
			{
				var_08 = lib_A4E8::index_is_selected(var_05);
				level.createfx_help_active = 0;
				level.createfx_selecting = !var_08;
				if(!param_03)
				{
					var_09 = level._createfx.selected_fx_ents.size;
					lib_A4E8::clear_entity_selection();
					if(var_08 && var_09 == 1)
					{
						lib_A4E8::select_entity(var_05,var_06);
					}
				}

				lib_A4E8::toggle_entity_selection(var_05,var_06);
			}
			else if(param_02)
			{
				if(param_03)
				{
					if(level.createfx_selecting)
					{
						lib_A4E8::select_entity(var_05,var_06);
					}

					if(!level.createfx_selecting)
					{
						lib_A4E8::deselect_entity(var_05,var_06);
					}
				}
			}

			var_0A = "highlighted";
		}
		else
		{
			var_0A = "default";
		}

		if(lib_A4E8::index_is_selected(var_05))
		{
			var_0A = "selected";
		}

		var_06 lib_A4E8::createfx_print3d(var_0A,var_07,param_04);
	}
}

//Function Number: 29
lib_A4E8::createfx_print3d(param_00,param_01,param_02)
{
	if(getdvarint("fx_showLightGridSampleOffset") != 0)
	{
		var_03 = getdvarfloat("fx_lightGridSampleOffset");
		var_04 = anglestoforward(self.v["angles"]) * var_03;
	}

	if(self.textalpha > 0)
	{
		var_05 = lib_A4E8::get_print3d_text();
		var_06 = param_02 * var_05.size * -2.93;
		var_07 = level._createfx.colors[self.v["type"]][param_00];
		if(isdefined(self.is_playing))
		{
			var_07 = (1,0.5,0);
		}

		if(isdefined(self.v["reactive_radius"]))
		{
			return;
		}

		if(isdefined(self.v["dynamic_distance"]))
		{
			return;
		}
	}
}

//Function Number: 30
lib_A4E8::get_print3d_text()
{
	switch(self.v["type"])
	{
		case "reactive_fx":
			break;

		case "soundfx_interval":
			break;

		case "soundfx_dynamic":
			break;

		case "soundfx":
			break;

		case "exploder":
			break;

		case "oneshotfx":
			break;

		default:
			break;
	}
}

//Function Number: 31
lib_A4E8::select_by_name_list()
{
	level.effect_list_offset = 0;
	lib_A4E8::clear_fx_hudelements();
	common_scripts\_createfxmenu::setmenu("select_by_name");
	common_scripts\_createfxmenu::draw_effects_list();
}

//Function Number: 32
lib_A4E8::handle_selected_ents(param_00)
{
	if(level._createfx.selected_fx_ents.size > 0 && level.createfx_help_active == 0)
	{
		param_00 = lib_A4E8::selected_ent_buttons(param_00);
		if(!lib_A4E8::current_mode_hud("selected_ents"))
		{
			lib_A4E8::new_tool_hud("selected_ents");
			lib_A4E8::set_tool_hudelem("Mode:","move");
			lib_A4E8::set_tool_hudelem("Move Rate( -/+ ):",level._createfx.rate);
			if(level._createfx.snap2normal)
			{
				var_01 = "on";
				var_02 = (0,1,0);
			}
			else
			{
				var_01 = "off";
				var_02 = (0.5,0.5,0.5);
			}

			lib_A4E8::set_tool_hudelem("Snap2Normal( S ):",var_01,var_02);
			if(level._createfx.snap90deg)
			{
				var_03 = "on";
				var_04 = (0,1,0);
			}
			else
			{
				var_03 = "off";
				var_04 = (0.5,0.5,0.5);
			}

			lib_A4E8::set_tool_hudelem("90deg Snap( L ):",var_03,var_04);
			if(level._createfx.localrot)
			{
				var_05 = "on";
				var_06 = (0,1,0);
			}
			else
			{
				var_05 = "off";
				var_06 = (0.5,0.5,0.5);
			}

			lib_A4E8::set_tool_hudelem("Local Rotation( R ):",var_05,var_06);
		}

		if(level._createfx.axismode && level._createfx.selected_fx_ents.size > 0)
		{
			lib_A4E8::set_tool_hudelem("Mode:","rotate");
			thread [[ level.func_process_fx_rotater ]]();
			if(lib_A4E8::button_is_clicked("p"))
			{
				lib_A4E8::reset_axis_of_selected_ents();
			}

			if(lib_A4E8::button_is_clicked("o"))
			{
				lib_A4E8::aim_axis_of_selected_ents();
			}

			if(lib_A4E8::button_is_clicked("v"))
			{
				lib_A4E8::copy_angles_of_selected_ents();
			}

			for(var_07 = 0;var_07 < level._createfx.selected_fx_ents.size;var_07++)
			{
				level._createfx.selected_fx_ents[var_07] lib_A4E8::draw_axis();
			}

			if(level.selectedrotate_pitch != 0 || level.selectedrotate_yaw != 0 || level.selectedrotate_roll != 0)
			{
				param_00 = 1;
			}
		}
		else
		{
			lib_A4E8::set_tool_hudelem("Mode:","move");
			var_08 = lib_A4E8::get_selected_move_vector();
			for(var_07 = 0;var_07 < level._createfx.selected_fx_ents.size;var_07++)
			{
				var_09 = level._createfx.selected_fx_ents[var_07];
				if(isdefined(var_09.model))
				{
					continue;
				}

				var_09 lib_A4E8::draw_cross();
				var_09.v["origin"] = var_09.v["origin"] + var_08;
			}

			if(distance((0,0,0),var_08) > 0)
			{
				thread lib_A4E8::save_undo_buffer();
				level.createfx_last_movement_timer = 0;
				param_00 = 1;
			}
		}
	}
	else
	{
		lib_A4E8::clear_tool_hud();
	}

	return param_00;
}

//Function Number: 33
lib_A4E8::selected_ent_buttons(param_00)
{
	if(lib_A4E8::button_is_clicked("BUTTON_X"))
	{
		lib_A4E8::toggle_axismode();
	}

	lib_A4E8::modify_rate();
	if(lib_A4E8::button_is_clicked("s"))
	{
		lib_A4E8::toggle_snap2normal();
	}

	if(lib_A4E8::button_is_clicked("l"))
	{
		lib_A4E8::toggle_snap90deg();
	}

	if(lib_A4E8::button_is_clicked("r"))
	{
		lib_A4E8::toggle_localrot();
	}

	if(lib_A4E8::button_is_clicked("end"))
	{
		lib_A4E8::drop_selection_to_ground();
		param_00 = 1;
	}

	if(lib_A4E8::button_is_clicked("tab","BUTTON_RSHLDR"))
	{
		lib_A4E8::move_selection_to_cursor();
		param_00 = 1;
	}

	return param_00;
}

//Function Number: 34
lib_A4E8::modify_rate()
{
	var_00 = lib_A4E8::button_is_held("shift");
	var_01 = lib_A4E8::button_is_held("ctrl");
	if(lib_A4E8::button_is_clicked("="))
	{
		if(var_00)
		{
			level._createfx.rate = level._createfx.rate + 0.025;
		}
		else if(var_01)
		{
			if(level._createfx.rate < 1)
			{
				level._createfx.rate = 1;
			}
			else
			{
				level._createfx.rate = level._createfx.rate + 10;
			}
		}
		else
		{
			level._createfx.rate = level._createfx.rate + 0.1;
		}
	}
	else if(lib_A4E8::button_is_clicked("-"))
	{
		if(var_00)
		{
			level._createfx.rate = level._createfx.rate - 0.025;
		}
		else if(var_01)
		{
			if(level._createfx.rate > 1)
			{
				level._createfx.rate = 1;
			}
			else
			{
				level._createfx.rate = 0.1;
			}
		}
		else
		{
			level._createfx.rate = level._createfx.rate - 0.1;
		}
	}

	level._createfx.rate = clamp(level._createfx.rate,0.025,100);
	lib_A4E8::set_tool_hudelem("Move Rate( -/+ ):",level._createfx.rate);
}

//Function Number: 35
lib_A4E8::toggle_axismode()
{
	level._createfx.axismode = !level._createfx.axismode;
}

//Function Number: 36
lib_A4E8::toggle_snap2normal()
{
	level._createfx.snap2normal = !level._createfx.snap2normal;
	if(level._createfx.snap2normal)
	{
		var_00 = "on";
		var_01 = (0,1,0);
	}
	else
	{
		var_00 = "off";
		var_01 = (0.5,0.5,0.5);
	}

	lib_A4E8::set_tool_hudelem("Snap2Normal( S ):",var_00,var_01);
}

//Function Number: 37
lib_A4E8::toggle_snap90deg()
{
	level._createfx.snap90deg = !level._createfx.snap90deg;
	if(level._createfx.snap90deg)
	{
		var_00 = "on";
		var_01 = (0,1,0);
	}
	else
	{
		var_00 = "off";
		var_01 = (0.5,0.5,0.5);
	}

	lib_A4E8::set_tool_hudelem("90deg Snap( L ):",var_00,var_01);
}

//Function Number: 38
lib_A4E8::toggle_localrot()
{
	level._createfx.localrot = !level._createfx.localrot;
	if(level._createfx.localrot)
	{
		var_00 = "on";
		var_01 = (0,1,0);
	}
	else
	{
		var_00 = "off";
		var_01 = (0.5,0.5,0.5);
	}

	lib_A4E8::set_tool_hudelem("Local Rotation( R ):",var_00,var_01);
}

//Function Number: 39
lib_A4E8::copy_angles_of_selected_ents()
{
	thread lib_A4E8::save_undo_buffer();
	level notify("new_ent_selection");
	for(var_00 = 0;var_00 < level._createfx.selected_fx_ents.size;var_00++)
	{
		var_01 = level._createfx.selected_fx_ents[var_00];
		var_01.v["angles"] = level._createfx.selected_fx_ents[level._createfx.selected_fx_ents.size - 1].v["angles"];
		var_01 lib_A4E8::set_forward_and_up_vectors();
	}

	lib_A4E8::update_selected_entities();
	level.createfx_last_movement_timer = 0;
}

//Function Number: 40
lib_A4E8::aim_axis_of_selected_ents()
{
	thread lib_A4E8::save_undo_buffer();
	level notify("new_ent_selection");
	var_00 = level._createfx.selected_fx_ents[level._createfx.selected_fx_ents.size - 1];
	for(var_01 = 0;var_01 < level._createfx.selected_fx_ents.size - 1;var_01++)
	{
		var_02 = level._createfx.selected_fx_ents[var_01];
		var_03 = vectortoangles(var_00.v["origin"] - var_02.v["origin"]);
		var_02.v["angles"] = var_03;
		var_02 lib_A4E8::set_forward_and_up_vectors();
	}

	lib_A4E8::update_selected_entities();
	level.createfx_last_movement_timer = 0;
}

//Function Number: 41
lib_A4E8::reset_axis_of_selected_ents()
{
	level notify("new_ent_selection");
	thread lib_A4E8::save_undo_buffer();
	for(var_00 = 0;var_00 < level._createfx.selected_fx_ents.size;var_00++)
	{
		var_01 = level._createfx.selected_fx_ents[var_00];
		var_01.v["angles"] = (0,0,0);
		var_01 lib_A4E8::set_forward_and_up_vectors();
	}

	lib_A4E8::update_selected_entities();
	level.createfx_last_movement_timer = 0;
}

//Function Number: 42
lib_A4E8::last_selected_entity_has_changed(param_00)
{
	if(isdefined(param_00))
	{
		if(!common_scripts\_createfxmenu::entities_are_selected())
		{
			return 1;
		}
	}
	else
	{
		return common_scripts\_createfxmenu::entities_are_selected();
	}

	return param_00 != level._createfx.selected_fx_ents[level._createfx.selected_fx_ents.size - 1];
}

//Function Number: 43
lib_A4E8::drop_selection_to_ground()
{
	thread lib_A4E8::save_undo_buffer();
	for(var_00 = 0;var_00 < level._createfx.selected_fx_ents.size;var_00++)
	{
		var_01 = level._createfx.selected_fx_ents[var_00];
		var_02 = bullettrace(var_01.v["origin"],var_01.v["origin"] + (0,0,-2048),0,undefined);
		var_01.v["origin"] = var_02["position"];
	}

	level.createfx_last_movement_timer = 0;
}

//Function Number: 44
lib_A4E8::set_off_exploders()
{
	level notify("createfx_exploder_reset");
	var_00 = [];
	for(var_01 = 0;var_01 < level._createfx.selected_fx_ents.size;var_01++)
	{
		var_02 = level._createfx.selected_fx_ents[var_01];
		if(isdefined(var_02.v["exploder"]))
		{
			var_00[var_02.v["exploder"]] = 1;
		}
	}

	var_03 = getarraykeys(var_00);
	for(var_01 = 0;var_01 < var_03.size;var_01++)
	{
		common_scripts\_exploder::exploder(var_03[var_01]);
	}
}

//Function Number: 45
lib_A4E8::turn_off_exploders()
{
	level notify("createfx_exploder_reset");
	var_00 = [];
	for(var_01 = 0;var_01 < level._createfx.selected_fx_ents.size;var_01++)
	{
		var_02 = level._createfx.selected_fx_ents[var_01];
		if(isdefined(var_02.v["exploder"]))
		{
			var_00[var_02.v["exploder"]] = 1;
		}
	}

	var_03 = getarraykeys(var_00);
	for(var_01 = 0;var_01 < var_03.size;var_01++)
	{
		common_scripts\_exploder::kill_exploder(var_03[var_01]);
	}
}

//Function Number: 46
lib_A4E8::draw_distance()
{
	var_00 = 0;
	if(getdvarint("createfx_drawdist") == 0)
	{
	}

	for(;;)
	{
		var_01 = getdvarint("createfx_drawdist");
		var_01 = var_01 * var_01;
		for(var_02 = 0;var_02 < level.createfxent.size;var_02++)
		{
			var_03 = level.createfxent[var_02];
			var_03.drawn = distancesquared(level.var_31D.var_2E6,var_03.v["origin"]) <= var_01;
			var_00++;
			if(var_00 > 100)
			{
				var_00 = 0;
				wait(0.05);
			}
		}

		if(level.createfxent.size == 0)
		{
			wait(0.05);
		}
	}
}

//Function Number: 47
lib_A4E8::createfx_autosave()
{
	setdvarifuninitialized("createfx_autosave_time","300");
	for(;;)
	{
		wait(getdvarint("createfx_autosave_time"));
		common_scripts\utility::flag_waitopen("createfx_saving");
		if(getdvarint("createfx_no_autosave"))
		{
			continue;
		}

		lib_A4E8::generate_fx_log(1);
	}
}

//Function Number: 48
lib_A4E8::rotate_over_time(param_00,param_01)
{
	level endon("new_ent_selection");
	var_02 = 0.1;
	for(var_03 = 0;var_03 < var_02 * 20;var_03++)
	{
		if(level.selectedrotate_pitch != 0)
		{
			param_00 addpitch(level.selectedrotate_pitch);
		}
		else if(level.selectedrotate_roll != 0)
		{
			param_00 addyaw(level.selectedrotate_roll);
		}
		else
		{
			param_00 addroll(level.selectedrotate_yaw);
		}

		wait(0.05);
		param_00 lib_A4E8::draw_axis();
		for(var_04 = 0;var_04 < level._createfx.selected_fx_ents.size;var_04++)
		{
			var_05 = level._createfx.selected_fx_ents[var_04];
			if(isdefined(var_05.model))
			{
				continue;
			}

			var_05.v["origin"] = param_01[var_04].var_2E6;
			var_05.v["angles"] = param_01[var_04].var_41;
		}
	}
}

//Function Number: 49
lib_A4E8::delete_pressed()
{
	if(level.createfx_inputlocked)
	{
		lib_A4E8::remove_selected_option();
		return;
	}

	lib_A4E8::delete_selection();
}

//Function Number: 50
lib_A4E8::remove_selected_option()
{
	if(!isdefined(level._createfx.selected_fx_option_index))
	{
		return;
	}

	var_00 = level._createfx.options[level._createfx.selected_fx_option_index]["name"];
	for(var_01 = 0;var_01 < level.createfxent.size;var_01++)
	{
		var_02 = level.createfxent[var_01];
		if(!lib_A4E8::ent_is_selected(var_02))
		{
			continue;
		}

		var_02 lib_A4E8::remove_option(var_00);
	}

	lib_A4E8::update_selected_entities();
	lib_A4E8::clear_settable_fx();
}

//Function Number: 51
lib_A4E8::remove_option(param_00)
{
	self.v[param_00] = undefined;
}

//Function Number: 52
lib_A4E8::delete_selection()
{
	lib_A4E8::save_undo_buffer();
	var_00 = [];
	for(var_01 = 0;var_01 < level.createfxent.size;var_01++)
	{
		var_02 = level.createfxent[var_01];
		if(lib_A4E8::ent_is_selected(var_02))
		{
			if(isdefined(var_02.looper))
			{
				var_02.looper delete();
			}

			var_02 notify("stop_loop");
			continue;
		}

		var_00[var_00.size] = var_02;
	}

	level.createfxent = var_00;
	level._createfx.selected_fx = [];
	level._createfx.selected_fx_ents = [];
	lib_A4E8::clear_fx_hudelements();
	lib_A4E8::save_redo_buffer();
}

//Function Number: 53
lib_A4E8::move_selection_to_cursor()
{
	thread lib_A4E8::save_undo_buffer();
	var_00 = level.createfxcursor["position"];
	if(level._createfx.selected_fx_ents.size <= 0)
	{
		return;
	}

	var_01 = lib_A4E8::get_center_of_array(level._createfx.selected_fx_ents);
	var_02 = var_01 - var_00;
	for(var_03 = 0;var_03 < level._createfx.selected_fx_ents.size;var_03++)
	{
		var_04 = level._createfx.selected_fx_ents[var_03];
		if(isdefined(var_04.model))
		{
			continue;
		}

		var_04.v["origin"] = var_04.v["origin"] - var_02;
		if(level._createfx.snap2normal)
		{
			if(isdefined(level.createfxcursor["normal"]))
			{
				var_04.v["angles"] = vectortoangles(level.createfxcursor["normal"]);
			}
		}
	}

	level.createfx_last_movement_timer = 0;
}

//Function Number: 54
lib_A4E8::select_last_entity()
{
	lib_A4E8::select_entity(level.createfxent.size - 1,level.createfxent[level.createfxent.size - 1]);
}

//Function Number: 55
lib_A4E8::reselect_entitites()
{
	var_00 = [];
	for(var_01 = 0;var_01 < level.createfxent.size;var_01++)
	{
		if(lib_A4E8::index_is_selected(var_01))
		{
			var_00[var_00.size] = var_01;
		}
	}

	lib_A4E8::clear_entity_selection();
	lib_A4E8::select_index_array(var_00);
}

//Function Number: 56
lib_A4E8::select_all_exploders_of_currently_selected(param_00)
{
	var_01 = [];
	foreach(var_03 in level._createfx.selected_fx_ents)
	{
		if(!isdefined(var_03.v[param_00]))
		{
			continue;
		}

		var_04 = var_03.v[param_00];
		var_01[var_04] = 1;
	}

	foreach(var_04, var_07 in var_01)
	{
		foreach(var_09, var_03 in level.createfxent)
		{
			if(lib_A4E8::index_is_selected(var_09))
			{
				continue;
			}

			if(!isdefined(var_03.v[param_00]))
			{
				continue;
			}

			if(var_03.v[param_00] != var_04)
			{
				continue;
			}

			lib_A4E8::select_entity(var_09,var_03);
		}
	}

	lib_A4E8::update_selected_entities();
}

//Function Number: 57
lib_A4E8::copy_ents()
{
	if(level._createfx.selected_fx_ents.size <= 0)
	{
		return;
	}

	var_00 = [];
	for(var_01 = 0;var_01 < level._createfx.selected_fx_ents.size;var_01++)
	{
		var_02 = level._createfx.selected_fx_ents[var_01];
		var_03 = spawnstruct();
		var_03.v = var_02.v;
		var_03 lib_A4E8::post_entity_creation_function();
		var_00[var_00.size] = var_03;
	}

	level.stored_ents = var_00;
}

//Function Number: 58
lib_A4E8::post_entity_creation_function()
{
	self.textalpha = 0;
	self.drawn = 1;
}

//Function Number: 59
lib_A4E8::paste_ents()
{
	if(!isdefined(level.stored_ents))
	{
		return;
	}

	lib_A4E8::clear_entity_selection();
	for(var_00 = 0;var_00 < level.stored_ents.size;var_00++)
	{
		lib_A4E8::add_and_select_entity(level.stored_ents[var_00]);
	}

	lib_A4E8::move_selection_to_cursor();
	lib_A4E8::update_selected_entities();
	level.stored_ents = [];
	lib_A4E8::copy_ents();
}

//Function Number: 60
lib_A4E8::add_and_select_entity(param_00)
{
	level.createfxent[level.createfxent.size] = param_00;
	lib_A4E8::select_last_entity();
}

//Function Number: 61
lib_A4E8::get_center_of_array(param_00)
{
	var_01 = (0,0,0);
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		var_01 = (var_01[0] + param_00[var_02].v["origin"][0],var_01[1] + param_00[var_02].v["origin"][1],var_01[2] + param_00[var_02].v["origin"][2]);
	}

	return (var_01[0] / param_00.size,var_01[1] / param_00.size,var_01[2] / param_00.size);
}

//Function Number: 62
lib_A4E8::get_radius_of_array(param_00)
{
	var_01 = param_00[0].v["origin"];
	var_02 = param_00[0].v["origin"];
	var_03 = var_01[0];
	var_04 = var_01[1];
	var_05 = var_01[2];
	var_06 = var_02[0];
	var_07 = var_02[1];
	var_08 = var_02[2];
	for(var_09 = 0;var_09 < param_00.size;var_09++)
	{
		var_0A = param_00[var_09].v["origin"];
		if(var_0A[0] < var_01[0])
		{
			var_03 = var_0A[0];
		}

		if(var_0A[0] > var_02[0])
		{
			var_06 = var_0A[0];
		}

		if(var_0A[1] < var_01[1])
		{
			var_04 = var_0A[1];
		}

		if(var_0A[1] > var_02[1])
		{
			var_07 = var_0A[1];
		}

		if(var_0A[2] < var_01[2])
		{
			var_05 = var_0A[2];
		}

		if(var_0A[2] > var_02[2])
		{
			var_08 = var_0A[2];
		}
	}

	var_01 = (var_03,var_04,var_05);
	var_02 = (var_06,var_07,var_08);
	var_0B = distance(var_02,var_01);
	return var_0B;
}

//Function Number: 63
lib_A4E8::ent_draw_axis()
{
	self endon("death");
	for(;;)
	{
		lib_A4E8::draw_axis();
		wait(0.05);
	}
}

//Function Number: 64
lib_A4E8::rotation_is_occuring()
{
	if(level.selectedrotate_roll != 0)
	{
		return 1;
	}

	if(level.selectedrotate_pitch != 0)
	{
		return 1;
	}

	return level.selectedrotate_yaw != 0;
}

//Function Number: 65
lib_A4E8::print_fx_options(param_00,param_01,param_02)
{
	for(var_03 = 0;var_03 < level._createfx.options.size;var_03++)
	{
		var_04 = level._createfx.options[var_03];
		if(isdefined(var_04["nowrite"]) && var_04["nowrite"])
		{
			continue;
		}

		var_05 = var_04["name"];
		if(!isdefined(param_00.v[var_05]))
		{
			continue;
		}

		if(!common_scripts\_createfxmenu::mask(var_04["mask"],param_00.v["type"]))
		{
			continue;
		}

		if(!level.mp_createfx)
		{
			if(common_scripts\_createfxmenu::mask("fx",param_00.v["type"]) && var_05 == "fxid")
			{
				continue;
			}

			if(param_00.v["type"] == "exploder" && var_05 == "exploder")
			{
				continue;
			}

			var_06 = param_00.v["type"] + "/" + var_05;
			if(isdefined(level._createfx.defaults[var_06]) && level._createfx.defaults[var_06] == param_00.v[var_05])
			{
				continue;
			}
		}

		if(var_04["type"] == "string")
		{
			var_07 = param_00.v[var_05] + "";
			if(var_07 == "nil")
			{
				continue;
			}

			if(var_05 == "platform" && var_07 == "all")
			{
				continue;
			}

			lib_A4E8::cfxprintln(param_01 + "ent.v[ \" + var_05 + "\" ] = \" + param_00.v[var_05] + "\";");
			continue;
		}

		lib_A4E8::cfxprintln(param_01 + "ent.v[ \" + var_05 + "\" ] = " + param_00.v[var_05] + ";");
	}
}

//Function Number: 66
lib_A4E8::entity_highlight_disable()
{
	self notify("highlight change");
	self endon("highlight change");
	for(;;)
	{
		self.textalpha = self.textalpha * 0.85;
		self.textalpha = self.textalpha - 0.05;
		if(self.textalpha < 0)
		{
			break;
		}

		wait(0.05);
	}

	self.textalpha = 0;
}

//Function Number: 67
lib_A4E8::entity_highlight_enable()
{
	self notify("highlight change");
	self endon("highlight change");
	for(;;)
	{
		self.textalpha = self.textalpha + 0.05;
		self.textalpha = self.textalpha * 1.25;
		if(self.textalpha > 1)
		{
			break;
		}

		wait(0.05);
	}

	self.textalpha = 1;
}

//Function Number: 68
lib_A4E8::clear_settable_fx()
{
	level.createfx_inputlocked = 0;
	level._createfx.selected_fx_option_index = undefined;
	lib_A4E8::reset_fx_hud_colors();
}

//Function Number: 69
lib_A4E8::reset_fx_hud_colors()
{
	for(var_00 = 0;var_00 < level._createfx.hudelem_count;var_00++)
	{
		level._createfx.hudelems[var_00][0].color = (1,1,1);
	}
}

//Function Number: 70
lib_A4E8::toggle_entity_selection(param_00,param_01)
{
	if(isdefined(level._createfx.selected_fx[param_00]))
	{
		lib_A4E8::deselect_entity(param_00,param_01);
		return;
	}

	lib_A4E8::select_entity(param_00,param_01);
}

//Function Number: 71
lib_A4E8::select_entity(param_00,param_01)
{
	if(isdefined(level._createfx.selected_fx[param_00]))
	{
		return;
	}

	lib_A4E8::clear_settable_fx();
	level notify("new_ent_selection");
	param_01 thread lib_A4E8::entity_highlight_enable();
	level._createfx.selected_fx[param_00] = 1;
	level._createfx.selected_fx_ents[level._createfx.selected_fx_ents.size] = param_01;
	level.createfx_menu_list_active = 0;
}

//Function Number: 72
lib_A4E8::ent_is_highlighted(param_00)
{
	if(!isdefined(level.fx_highlightedent))
	{
		return 0;
	}

	return param_00 == level.fx_highlightedent;
}

//Function Number: 73
lib_A4E8::deselect_entity(param_00,param_01)
{
	if(!isdefined(level._createfx.selected_fx[param_00]))
	{
		return;
	}

	lib_A4E8::clear_settable_fx();
	level notify("new_ent_selection");
	level._createfx.selected_fx[param_00] = undefined;
	if(!lib_A4E8::ent_is_highlighted(param_01))
	{
		param_01 thread lib_A4E8::entity_highlight_disable();
	}

	var_02 = [];
	for(var_03 = 0;var_03 < level._createfx.selected_fx_ents.size;var_03++)
	{
		if(level._createfx.selected_fx_ents[var_03] != param_01)
		{
			var_02[var_02.size] = level._createfx.selected_fx_ents[var_03];
		}
	}

	level._createfx.selected_fx_ents = var_02;
}

//Function Number: 74
lib_A4E8::index_is_selected(param_00)
{
	return isdefined(level._createfx.selected_fx[param_00]);
}

//Function Number: 75
lib_A4E8::ent_is_selected(param_00)
{
	for(var_01 = 0;var_01 < level._createfx.selected_fx_ents.size;var_01++)
	{
		if(level._createfx.selected_fx_ents[var_01] == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 76
lib_A4E8::clear_entity_selection()
{
	for(var_00 = 0;var_00 < level._createfx.selected_fx_ents.size;var_00++)
	{
		if(!lib_A4E8::ent_is_highlighted(level._createfx.selected_fx_ents[var_00]))
		{
			level._createfx.selected_fx_ents[var_00] thread lib_A4E8::entity_highlight_disable();
		}
	}

	level._createfx.selected_fx = [];
	level._createfx.selected_fx_ents = [];
}

//Function Number: 77
lib_A4E8::draw_axis()
{
}

//Function Number: 78
lib_A4E8::draw_cross()
{
}

//Function Number: 79
lib_A4E8::createfx_centerprint(param_00)
{
	thread lib_A4E8::createfx_centerprint_thread(param_00);
}

//Function Number: 80
lib_A4E8::createfx_centerprint_thread(param_00)
{
	level notify("new_createfx_centerprint");
	level endon("new_createfx_centerprint");
	for(var_01 = 0;var_01 < 5;var_01++)
	{
	}

	wait(4.5);
	for(var_01 = 0;var_01 < 5;var_01++)
	{
	}
}

//Function Number: 81
lib_A4E8::get_selected_move_vector()
{
	var_00 = level.var_31D getplayerangles()[1];
	var_01 = (0,var_00,0);
	var_02 = anglestoright(var_01);
	var_03 = anglestoforward(var_01);
	var_04 = anglestoup(var_01);
	var_05 = 0;
	var_06 = level._createfx.rate;
	if(lib_A4E8::buttondown("DPAD_UP"))
	{
		if(level.selectedmove_forward < 0)
		{
			level.selectedmove_forward = 0;
		}

		level.selectedmove_forward = level.selectedmove_forward + var_06;
	}
	else if(lib_A4E8::buttondown("DPAD_DOWN"))
	{
		if(level.selectedmove_forward > 0)
		{
			level.selectedmove_forward = 0;
		}

		level.selectedmove_forward = level.selectedmove_forward - var_06;
	}
	else
	{
		level.selectedmove_forward = 0;
	}

	if(lib_A4E8::buttondown("DPAD_RIGHT"))
	{
		if(level.selectedmove_right < 0)
		{
			level.selectedmove_right = 0;
		}

		level.selectedmove_right = level.selectedmove_right + var_06;
	}
	else if(lib_A4E8::buttondown("DPAD_LEFT"))
	{
		if(level.selectedmove_right > 0)
		{
			level.selectedmove_right = 0;
		}

		level.selectedmove_right = level.selectedmove_right - var_06;
	}
	else
	{
		level.selectedmove_right = 0;
	}

	if(lib_A4E8::buttondown("BUTTON_Y"))
	{
		if(level.selectedmove_up < 0)
		{
			level.selectedmove_up = 0;
		}

		level.selectedmove_up = level.selectedmove_up + var_06;
	}
	else if(lib_A4E8::buttondown("BUTTON_B"))
	{
		if(level.selectedmove_up > 0)
		{
			level.selectedmove_up = 0;
		}

		level.selectedmove_up = level.selectedmove_up - var_06;
	}
	else
	{
		level.selectedmove_up = 0;
	}

	var_07 = (0,0,0);
	var_07 = var_07 + var_03 * level.selectedmove_forward;
	var_07 = var_07 + var_02 * level.selectedmove_right;
	var_07 = var_07 + var_04 * level.selectedmove_up;
	return var_07;
}

//Function Number: 82
lib_A4E8::set_anglemod_move_vector()
{
	if(!level._createfx.snap90deg)
	{
		var_00 = level._createfx.rate;
	}
	else
	{
		var_00 = 90;
	}

	if(lib_A4E8::buttondown("kp_uparrow","DPAD_UP"))
	{
		if(level.selectedrotate_pitch < 0)
		{
			level.selectedrotate_pitch = 0;
		}

		level.selectedrotate_pitch = level.selectedrotate_pitch + var_00;
	}
	else if(lib_A4E8::buttondown("kp_downarrow","DPAD_DOWN"))
	{
		if(level.selectedrotate_pitch > 0)
		{
			level.selectedrotate_pitch = 0;
		}

		level.selectedrotate_pitch = level.selectedrotate_pitch - var_00;
	}
	else
	{
		level.selectedrotate_pitch = 0;
	}

	if(lib_A4E8::buttondown("DPAD_LEFT"))
	{
		if(level.selectedrotate_yaw < 0)
		{
			level.selectedrotate_yaw = 0;
		}

		level.selectedrotate_yaw = level.selectedrotate_yaw + var_00;
	}
	else if(lib_A4E8::buttondown("DPAD_RIGHT"))
	{
		if(level.selectedrotate_yaw > 0)
		{
			level.selectedrotate_yaw = 0;
		}

		level.selectedrotate_yaw = level.selectedrotate_yaw - var_00;
	}
	else
	{
		level.selectedrotate_yaw = 0;
	}

	if(lib_A4E8::buttondown("BUTTON_Y"))
	{
		if(level.selectedrotate_roll < 0)
		{
			level.selectedrotate_roll = 0;
		}

		level.selectedrotate_roll = level.selectedrotate_roll + var_00;
		return;
	}

	if(lib_A4E8::buttondown("BUTTON_B"))
	{
		if(level.selectedrotate_roll > 0)
		{
			level.selectedrotate_roll = 0;
		}

		level.selectedrotate_roll = level.selectedrotate_roll - var_00;
		return;
	}

	level.selectedrotate_roll = 0;
}

//Function Number: 83
lib_A4E8::update_selected_entities()
{
	var_00 = 0;
	foreach(var_02 in level._createfx.selected_fx_ents)
	{
		if(var_02.v["type"] == "reactive_fx")
		{
			var_00 = 1;
		}

		var_02 [[ level.func_updatefx ]]();
	}

	if(var_00)
	{
		lib_A4E8::refresh_reactive_fx_ents();
	}
}

//Function Number: 84
lib_A4E8::hack_start(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "painter_mp";
	}

	precachemenu(param_00);
	wait(0.05);
	if(param_00 == "painter_mp")
	{
		return;
	}

	level.var_31D method_8323(param_00);
	level.var_31D method_8325(param_00);
}

//Function Number: 85
lib_A4E8::stop_fx_looper()
{
	if(isdefined(self.looper))
	{
		self.looper delete();
	}

	lib_A4E8::stop_loopsound();
}

//Function Number: 86
lib_A4E8::stop_loopsound()
{
	self notify("stop_loop");
}

//Function Number: 87
lib_A4E8::func_get_level_fx()
{
	if(!isdefined(level._effect_keys))
	{
		var_00 = getarraykeys(level._effect);
	}
	else
	{
		var_00 = getarraykeys(level._effect);
		if(var_00.size == level._effect_keys.size)
		{
			return level._effect_keys;
		}
	}

	var_00 = common_scripts\utility::alphabetize(var_00);
	level._effect_keys = var_00;
	return var_00;
}

//Function Number: 88
lib_A4E8::restart_fx_looper()
{
	lib_A4E8::stop_fx_looper();
	lib_A4E8::set_forward_and_up_vectors();
	switch(self.v["type"])
	{
		case "loopfx":
			break;

		case "oneshotfx":
			break;

		case "soundfx":
			break;

		case "soundfx_interval":
			break;

		case "soundfx_dynamic":
			break;
	}
}

//Function Number: 89
lib_A4E8::refresh_reactive_fx_ents()
{
	level._fx.reactive_fx_ents = undefined;
	foreach(var_01 in level.createfxent)
	{
		if(var_01.v["type"] == "reactive_fx")
		{
			var_01 lib_A4E8::set_forward_and_up_vectors();
			var_01 common_scripts\_fx::add_reactive_fx();
		}
	}
}

//Function Number: 90
lib_A4E8::process_fx_rotater()
{
	if(level.fx_rotating)
	{
		thread lib_A4E8::save_undo_buffer();
		level.createfx_last_movement_timer = 0;
		return;
	}

	lib_A4E8::set_anglemod_move_vector();
	if(!lib_A4E8::rotation_is_occuring())
	{
		return;
	}

	level.fx_rotating = 1;
	if(level._createfx.selected_fx_ents.size > 1 && !level._createfx.localrot)
	{
		var_00 = lib_A4E8::get_center_of_array(level._createfx.selected_fx_ents);
		var_01 = spawn("script_origin",var_00);
		var_01.v["angles"] = level._createfx.selected_fx_ents[0].v["angles"];
		var_01.v["origin"] = var_00;
		var_02 = [];
		for(var_03 = 0;var_03 < level._createfx.selected_fx_ents.size;var_03++)
		{
			var_02[var_03] = spawn("script_origin",level._createfx.selected_fx_ents[var_03].v["origin"]);
			var_02[var_03].var_41 = level._createfx.selected_fx_ents[var_03].v["angles"];
			var_02[var_03] method_8446(var_01);
		}

		lib_A4E8::rotate_over_time(var_01,var_02);
		var_01 delete();
		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			var_02[var_03] delete();
		}
	}
	else if(level._createfx.selected_fx_ents.size > 0)
	{
		foreach(var_05 in level._createfx.selected_fx_ents)
		{
			var_02 = spawn("script_origin",(0,0,0));
			var_02.var_41 = var_05.v["angles"];
			if(level.selectedrotate_pitch != 0)
			{
				var_02 addpitch(level.selectedrotate_pitch);
			}
			else if(level.selectedrotate_yaw != 0)
			{
				var_02 addyaw(level.selectedrotate_yaw);
			}
			else
			{
				var_02 addroll(level.selectedrotate_roll);
			}

			var_05.v["angles"] = var_02.var_41;
			var_02 delete();
		}

		wait(0.05);
	}

	level.fx_rotating = 0;
}

//Function Number: 91
lib_A4E8::spawn_grenade()
{
	playfx(level._createfx.grenade.fx,level.createfxcursor["position"]);
	level._createfx.grenade playsoundasmaster(level._createfx.grenade.sound);
	radiusdamage(level.createfxcursor["position"],level._createfx.grenade.radius,50,5,undefined,"MOD_EXPLOSIVE");
	level notify("code_damageradius",undefined,level._createfx.grenade.radius,level.createfxcursor["position"]);
}

//Function Number: 92
lib_A4E8::show_help()
{
	if(level.createfx_help_active == 1)
	{
		lib_A4E8::clear_fx_hudelements();
		level.createfx_help_active = 0;
		level.createfx_menu_list_active = 0;
		lib_A4E8::reselect_entitites();
	}
	else
	{
		level.createfx_help_active = 1;
		level.createfx_menu_list_active = 1;
		common_scripts\_createfxmenu::draw_help_list();
		thread common_scripts\_createfxmenu::help_navigation_buttons();
		lib_A4E8::clear_tool_hud();
	}

	wait(0.2);
}

//Function Number: 93
lib_A4E8::generate_fx_log(param_00)
{
}

//Function Number: 94
lib_A4E8::write_entity(param_00,param_01)
{
	var_02 = "\t";
	if(getdvarint("scr_map_exploder_dump"))
	{
		if(!isdefined(param_00.model))
		{
			return;
		}
	}
	else if(isdefined(param_00.model))
	{
		return;
	}

	if(param_00.v["type"] == "loopfx")
	{
		lib_A4E8::cfxprintln(var_02 + "ent = createLoopEffect( \" + param_00.v["fxid"] + "\" );");
	}

	if(param_00.v["type"] == "oneshotfx")
	{
		lib_A4E8::cfxprintln(var_02 + "ent = createOneshotEffect( \" + param_00.v["fxid"] + "\" );");
	}

	if(param_00.v["type"] == "exploder")
	{
		if(isdefined(param_00.v["exploder"]) && !level.mp_createfx)
		{
			lib_A4E8::cfxprintln(var_02 + "ent = createExploderEx( \" + param_00.v["fxid"] + "\", \" + param_00.v["exploder"] + "\" );");
		}
		else
		{
			lib_A4E8::cfxprintln(var_02 + "ent = createExploder( \" + param_00.v["fxid"] + "\" );");
		}
	}

	if(param_00.v["type"] == "soundfx")
	{
		lib_A4E8::cfxprintln(var_02 + "ent = createLoopSound();");
	}

	if(param_00.v["type"] == "soundfx_interval")
	{
		lib_A4E8::cfxprintln(var_02 + "ent = createIntervalSound();");
	}

	if(param_00.v["type"] == "reactive_fx")
	{
		lib_A4E8::cfxprintln(var_02 + "ent = createReactiveEnt();");
	}

	if(param_00.v["type"] == "soundfx_dynamic")
	{
		lib_A4E8::cfxprintln(var_02 + "ent = createDynamicAmbience();");
	}

	lib_A4E8::cfxprintln(var_02 + "ent set_origin_and_angles( " + param_00.v["origin"] + ", " + param_00.v["angles"] + " );");
	lib_A4E8::print_fx_options(param_00,var_02,param_01);
	lib_A4E8::cfxprintln("");
}

//Function Number: 95
lib_A4E8::write_log(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = "\t";
	lib_A4E8::cfxprintlnstart();
	lib_A4E8::cfxprintln("//_createfx generated. Do not touch!!");
	lib_A4E8::cfxprintln("#include common_scripts\\utility;");
	lib_A4E8::cfxprintln("#include common_scripts\\_createfx;\n");
	lib_A4E8::cfxprintln("");
	lib_A4E8::cfxprintln("main()");
	lib_A4E8::cfxprintln("{");
	var_06 = param_00.size;
	if(isdefined(param_04))
	{
		var_06 = var_06 + param_04.size;
	}

	lib_A4E8::cfxprintln(var_05 + "// CreateFX " + param_01 + " entities placed: " + var_06);
	foreach(var_08 in param_00)
	{
		if(level.createfx_loopcounter > 16)
		{
			level.createfx_loopcounter = 0;
			wait(0.1);
		}

		level.createfx_loopcounter++;
		lib_A4E8::write_entity(var_08,param_02);
	}

	if(isdefined(param_04))
	{
		foreach(var_0B in param_04)
		{
			if(level.createfx_loopcounter > 16)
			{
				level.createfx_loopcounter = 0;
				wait(0.1);
			}

			level.createfx_loopcounter++;
			var_08 = spawnstruct();
			var_08.v = var_0B;
			lib_A4E8::write_entity(var_08,param_02);
		}
	}

	lib_A4E8::cfxprintln("}");
	lib_A4E8::cfxprintln(" ");
	lib_A4E8::cfxprintlnend(param_02,param_03,param_01);
}

//Function Number: 96
lib_A4E8::createfx_adjust_array()
{
	var_00 = 0.1;
	foreach(var_02 in level.createfxent)
	{
		var_03 = [];
		var_04 = [];
		for(var_05 = 0;var_05 < 3;var_05++)
		{
			var_03[var_05] = var_02.v["origin"][var_05];
			var_04[var_05] = var_02.v["angles"][var_05];
			if(var_03[var_05] < var_00 && var_03[var_05] > var_00 * -1)
			{
				var_03[var_05] = 0;
			}

			if(var_04[var_05] < var_00 && var_04[var_05] > var_00 * -1)
			{
				var_04[var_05] = 0;
			}
		}

		var_02.v["origin"] = (var_03[0],var_03[1],var_03[2]);
		var_02.v["angles"] = (var_04[0],var_04[1],var_04[2]);
	}
}

//Function Number: 97
lib_A4E8::get_createfx_array(param_00)
{
	var_01 = lib_A4E8::get_createfx_types(param_00);
	var_02 = [];
	foreach(var_05, var_04 in var_01)
	{
		var_02[var_05] = [];
	}

	foreach(var_07 in level.createfxent)
	{
		var_08 = 0;
		foreach(var_05, param_00 in var_01)
		{
			if(var_07.v["type"] != param_00)
			{
				continue;
			}

			var_08 = 1;
			var_02[var_05][var_02[var_05].size] = var_07;
			break;
		}
	}

	var_0B = [];
	for(var_0C = 0;var_0C < var_01.size;var_0C++)
	{
		foreach(var_07 in var_02[var_0C])
		{
			var_0B[var_0B.size] = var_07;
		}
	}

	return var_0B;
}

//Function Number: 98
lib_A4E8::get_createfx_types(param_00)
{
	var_01 = [];
	if(param_00 == "fx")
	{
		var_01[0] = "loopfx";
		var_01[1] = "oneshotfx";
		var_01[2] = "exploder";
	}
	else
	{
		var_01[0] = "soundfx";
		var_01[1] = "soundfx_interval";
		var_01[2] = "reactive_fx";
		var_01[3] = "soundfx_dynamic";
	}

	return var_01;
}

//Function Number: 99
lib_A4E8::is_createfx_type(param_00,param_01)
{
	var_02 = lib_A4E8::get_createfx_types(param_01);
	foreach(var_04 in var_02)
	{
		if(param_00.v["type"] == var_04)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 100
lib_A4E8::createfx_filter_types()
{
	var_00 = [];
	var_00[0] = "soundfx";
	var_00[1] = "loopfx";
	var_00[2] = "oneshotfx";
	var_00[3] = "exploder";
	var_00[4] = "soundfx_interval";
	var_00[5] = "reactive_fx";
	var_00[6] = "soundfx_dynamic";
	var_01 = [];
	foreach(var_04, var_03 in var_00)
	{
		var_01[var_04] = [];
	}

	foreach(var_06 in level.createfxent)
	{
		var_07 = 0;
		foreach(var_04, var_09 in var_00)
		{
			if(var_06.v["type"] != var_09)
			{
				continue;
			}

			var_07 = 1;
			var_01[var_04][var_01[var_04].size] = var_06;
			break;
		}
	}

	var_0B = [];
	for(var_0C = 0;var_0C < var_00.size;var_0C++)
	{
		foreach(var_06 in var_01[var_0C])
		{
			var_0B[var_0B.size] = var_06;
		}
	}

	level.createfxent = var_0B;
}

//Function Number: 101
lib_A4E8::cfxprintlnstart()
{
	common_scripts\utility::fileprint_launcher_start_file();
}

//Function Number: 102
lib_A4E8::cfxprintln(param_00)
{
	common_scripts\utility::fileprint_launcher(param_00);
}

//Function Number: 103
lib_A4E8::cfxprintlnend(param_00,param_01,param_02)
{
	var_03 = 1;
	if(param_01 != "" || param_00)
	{
		var_03 = 0;
	}

	if(common_scripts\utility::issp())
	{
		var_04 = common_scripts\utility::get_template_level() + param_01 + "_" + param_02 + ".gsc";
		if(param_00)
		{
			var_04 = "backup_" + param_02 + ".gsc";
		}
	}
	else
	{
		var_04 = common_scripts\utility::get_template_level() + param_02 + "_" + var_03 + ".gsc";
		if(param_00)
		{
			var_04 = "backup.gsc";
		}
	}

	common_scripts\utility::fileprint_launcher_end_file("/share/raw/maps/createfx/" + var_04,var_03);
}

//Function Number: 104
lib_A4E8::process_button_held_and_clicked()
{
	lib_A4E8::add_button("mouse1");
	lib_A4E8::add_button("BUTTON_RSHLDR");
	lib_A4E8::add_button("BUTTON_LSHLDR");
	lib_A4E8::add_button("BUTTON_RSTICK");
	lib_A4E8::add_button("BUTTON_LSTICK");
	lib_A4E8::add_button("BUTTON_A");
	lib_A4E8::add_button("BUTTON_B");
	lib_A4E8::add_button("BUTTON_X");
	lib_A4E8::add_button("BUTTON_Y");
	lib_A4E8::add_button("DPAD_UP");
	lib_A4E8::add_button("DPAD_LEFT");
	lib_A4E8::add_button("DPAD_RIGHT");
	lib_A4E8::add_button("DPAD_DOWN");
	lib_A4E8::add_kb_button("shift");
	lib_A4E8::add_kb_button("ctrl");
	lib_A4E8::add_kb_button("escape");
	lib_A4E8::add_kb_button("F1");
	lib_A4E8::add_kb_button("F5");
	lib_A4E8::add_kb_button("F4");
	lib_A4E8::add_kb_button("F2");
	lib_A4E8::add_kb_button("a");
	lib_A4E8::add_kb_button("g");
	lib_A4E8::add_kb_button("c");
	lib_A4E8::add_kb_button("h");
	lib_A4E8::add_kb_button("i");
	lib_A4E8::add_kb_button("f");
	lib_A4E8::add_kb_button("k");
	lib_A4E8::add_kb_button("l");
	lib_A4E8::add_kb_button("m");
	lib_A4E8::add_kb_button("o");
	lib_A4E8::add_kb_button("p");
	lib_A4E8::add_kb_button("r");
	lib_A4E8::add_kb_button("s");
	lib_A4E8::add_kb_button("u");
	lib_A4E8::add_kb_button("v");
	lib_A4E8::add_kb_button("x");
	lib_A4E8::add_kb_button("y");
	lib_A4E8::add_kb_button("z");
	lib_A4E8::add_kb_button("del");
	lib_A4E8::add_kb_button("end");
	lib_A4E8::add_kb_button("tab");
	lib_A4E8::add_kb_button("ins");
	lib_A4E8::add_kb_button("add");
	lib_A4E8::add_kb_button("space");
	lib_A4E8::add_kb_button("enter");
	lib_A4E8::add_kb_button("1");
	lib_A4E8::add_kb_button("2");
	lib_A4E8::add_kb_button("3");
	lib_A4E8::add_kb_button("4");
	lib_A4E8::add_kb_button("5");
	lib_A4E8::add_kb_button("6");
	lib_A4E8::add_kb_button("7");
	lib_A4E8::add_kb_button("8");
	lib_A4E8::add_kb_button("9");
	lib_A4E8::add_kb_button("0");
	lib_A4E8::add_kb_button("-");
	lib_A4E8::add_kb_button("=");
	lib_A4E8::add_kb_button(",");
	lib_A4E8::add_kb_button(".");
	lib_A4E8::add_kb_button("[");
	lib_A4E8::add_kb_button("]");
	lib_A4E8::add_kb_button("leftarrow");
	lib_A4E8::add_kb_button("rightarrow");
	lib_A4E8::add_kb_button("uparrow");
	lib_A4E8::add_kb_button("downarrow");
}

//Function Number: 105
lib_A4E8::locked(param_00)
{
	if(isdefined(level._createfx.lockedlist[param_00]))
	{
		return 0;
	}

	return lib_A4E8::kb_locked(param_00);
}

//Function Number: 106
lib_A4E8::kb_locked(param_00)
{
	return level.createfx_inputlocked && isdefined(level.button_is_kb[param_00]);
}

//Function Number: 107
lib_A4E8::add_button(param_00)
{
	if(lib_A4E8::locked(param_00))
	{
		return;
	}

	if(!isdefined(level.buttonisheld[param_00]))
	{
		if(level.var_31D buttonpresseddevonly(param_00))
		{
			level.buttonisheld[param_00] = 1;
			level.buttonclick[param_00] = 1;
			return;
		}

		return;
	}

	if(!level.var_31D buttonpresseddevonly(param_00))
	{
		level.buttonisheld[param_00] = undefined;
	}
}

//Function Number: 108
lib_A4E8::add_kb_button(param_00)
{
	level.button_is_kb[param_00] = 1;
	lib_A4E8::add_button(param_00);
}

//Function Number: 109
lib_A4E8::buttondown(param_00,param_01)
{
	return lib_A4E8::buttonpressed_internal(param_00) || lib_A4E8::buttonpressed_internal(param_01);
}

//Function Number: 110
lib_A4E8::buttonpressed_internal(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(lib_A4E8::kb_locked(param_00))
	{
		return 0;
	}

	return level.var_31D buttonpresseddevonly(param_00);
}

//Function Number: 111
lib_A4E8::button_is_held(param_00,param_01)
{
	if(isdefined(param_01))
	{
		if(isdefined(level.buttonisheld[param_01]))
		{
			return 1;
		}
	}

	return isdefined(level.buttonisheld[param_00]);
}

//Function Number: 112
lib_A4E8::button_is_clicked(param_00,param_01)
{
	if(isdefined(param_01))
	{
		if(isdefined(level.buttonclick[param_01]))
		{
			return 1;
		}
	}

	return isdefined(level.buttonclick[param_00]);
}

//Function Number: 113
lib_A4E8::init_huds()
{
	level._createfx.hudelems = [];
	level._createfx.hudelem_count = 30;
	var_00 = [];
	var_01 = [];
	var_00[0] = 0;
	var_01[0] = 0;
	var_00[1] = 1;
	var_01[1] = 1;
	var_00[2] = -2;
	var_01[2] = 1;
	var_00[3] = 1;
	var_01[3] = -1;
	var_00[4] = -2;
	var_01[4] = -1;
	level.cleartextmarker = newhudelem();
	level.cleartextmarker.alpha = 0;
	for(var_02 = 0;var_02 < level._createfx.hudelem_count;var_02++)
	{
		var_03 = [];
		for(var_04 = 0;var_04 < 1;var_04++)
		{
			var_05 = newhudelem();
			var_05.alignx = "left";
			var_05.location = 0;
			var_05.foreground = 1;
			var_05.var_18C = 1.4;
			var_05.fontscale = 20 - var_04;
			var_05.alpha = 1;
			var_05.x = 0 + var_00[var_04];
			var_05.y = 60 + var_01[var_04] + var_02 * 15;
			if(var_04 > 0)
			{
				var_05.color = (0,0,0);
			}

			var_03[var_03.size] = var_05;
		}

		level._createfx.hudelems[var_02] = var_03;
	}

	var_03 = [];
	for(var_04 = 0;var_04 < 5;var_04++)
	{
		var_05 = newhudelem();
		var_05.alignx = "center";
		var_05.location = 0;
		var_05.foreground = 1;
		var_05.var_18C = 1.4;
		var_05.fontscale = 20 - var_04;
		var_05.alpha = 1;
		var_05.x = 320 + var_00[var_04];
		var_05.y = 80 + var_01[var_04];
		if(var_04 > 0)
		{
			var_05.color = (0,0,0);
		}

		var_03[var_03.size] = var_05;
	}

	level.createfx_centerprint = var_03;
}

//Function Number: 114
lib_A4E8::init_crosshair()
{
	var_00 = newhudelem();
	var_00.location = 0;
	var_00.alignx = "center";
	var_00.aligny = "middle";
	var_00.foreground = 1;
	var_00.var_18C = 2;
	var_00.fontscale = 20;
	var_00.alpha = 1;
	var_00.x = 320;
	var_00.y = 233;
}

//Function Number: 115
lib_A4E8::clear_fx_hudelements()
{
	level.cleartextmarker method_80CB();
	for(var_00 = 0;var_00 < level._createfx.hudelem_count;var_00++)
	{
		for(var_01 = 0;var_01 < 1;var_01++)
		{
		}
	}

	level.fxhudelements = 0;
}

//Function Number: 116
lib_A4E8::set_fx_hudelement(param_00)
{
	for(var_01 = 0;var_01 < 1;var_01++)
	{
	}

	level.fxhudelements++;
}

//Function Number: 117
lib_A4E8::init_tool_hud()
{
	if(!isdefined(level._createfx.tool_hudelems))
	{
		level._createfx.tool_hudelems = [];
	}

	if(!isdefined(level._createfx.tool_hud_visible))
	{
		level._createfx.tool_hud_visible = 1;
	}

	if(!isdefined(level._createfx.tool_hud))
	{
		level._createfx.tool_hud = "";
	}
}

//Function Number: 118
lib_A4E8::new_tool_hud(param_00)
{
	foreach(var_03, var_02 in level._createfx.tool_hudelems)
	{
		if(isdefined(var_02.value_hudelem))
		{
			var_02.value_hudelem destroy();
		}

		var_02 destroy();
		level._createfx.tool_hudelems[var_03] = undefined;
	}

	level._createfx.tool_hud = param_00;
}

//Function Number: 119
lib_A4E8::current_mode_hud(param_00)
{
	return level._createfx.tool_hud == param_00;
}

//Function Number: 120
lib_A4E8::clear_tool_hud()
{
	lib_A4E8::new_tool_hud("");
}

//Function Number: 121
lib_A4E8::new_tool_hudelem(param_00)
{
	var_01 = newhudelem();
	var_01.alignx = "left";
	var_01.location = 0;
	var_01.foreground = 1;
	var_01.var_18C = 1.2;
	var_01.alpha = 1;
	var_01.x = 0;
	var_01.y = 320 + param_00 * 15;
	return var_01;
}

//Function Number: 122
lib_A4E8::get_tool_hudelem(param_00)
{
	if(isdefined(level._createfx.tool_hudelems[param_00]))
	{
		return level._createfx.tool_hudelems[param_00];
	}

	return undefined;
}

//Function Number: 123
lib_A4E8::set_tool_hudelem(param_00,param_01,param_02)
{
	var_03 = lib_A4E8::get_tool_hudelem(param_00);
	if(!isdefined(var_03))
	{
		var_03 = lib_A4E8::new_tool_hudelem(level._createfx.tool_hudelems.size);
		level._createfx.tool_hudelems[param_00] = var_03;
		var_03.text = param_00;
	}

	if(isdefined(param_01))
	{
		if(isdefined(var_03.value_hudelem))
		{
			var_04 = var_03.value_hudelem;
		}
		else
		{
			var_04 = lib_A4E8::new_tool_hudelem(level._createfx.tool_hudelems.size);
			var_04.x = var_04.x + 110;
			var_04.y = var_03.y;
			var_03.value_hudelem = var_04;
		}

		if(isdefined(var_04.text) && var_04.text == param_01)
		{
			return;
		}

		var_04.text = param_01;
		if(!isdefined(param_02))
		{
			param_02 = (1,1,1);
		}

		var_04.color = param_02;
	}
}

//Function Number: 124
lib_A4E8::select_by_substring()
{
	var_00 = getdvar("select_by_substring");
	if(var_00 == "")
	{
		return 0;
	}

	setdvar("select_by_substring","");
	var_01 = [];
	foreach(var_04, var_03 in level.createfxent)
	{
		if(issubstr(var_03.v["fxid"],var_00))
		{
			var_01[var_01.size] = var_04;
		}
	}

	if(var_01.size == 0)
	{
		return 0;
	}

	lib_A4E8::deselect_all_ents();
	lib_A4E8::select_index_array(var_01);
	foreach(var_06 in var_01)
	{
		var_03 = level.createfxent[var_06];
		lib_A4E8::select_entity(var_06,var_03);
	}

	return 1;
}

//Function Number: 125
lib_A4E8::select_index_array(param_00)
{
	foreach(var_02 in param_00)
	{
		var_03 = level.createfxent[var_02];
		lib_A4E8::select_entity(var_02,var_03);
	}
}

//Function Number: 126
lib_A4E8::deselect_all_ents()
{
	foreach(var_02, var_01 in level._createfx.selected_fx_ents)
	{
		lib_A4E8::deselect_entity(var_02,var_01);
	}
}

//Function Number: 127
lib_A4E8::setup_last_movement_timer()
{
	wait(0.5);
	for(;;)
	{
		level.createfx_last_movement_timer = level.createfx_last_movement_timer + 0.05;
		if(level.createfx_last_movement_timer == 0.15)
		{
			foreach(var_01 in level._createfx.selected_fx_ents)
			{
				if(var_01.v["type"] == "exploder")
				{
					var_01 common_scripts\utility::activate_individual_exploder();
				}
			}

			common_scripts\_createfxmenu::display_current_translation();
			lib_A4E8::save_redo_buffer();
		}

		if(level.createfx_last_movement_timer == 0.05)
		{
			var_01 = common_scripts\_createfxmenu::get_last_selected_ent();
			common_scripts\_createfxmenu::display_current_translation();
		}

		wait(0.05);
	}
}

//Function Number: 128
lib_A4E8::frame_selected()
{
	if(level._createfx.selected_fx_ents.size < 1)
	{
		return;
	}

	if(level._createfx.selected_fx_ents.size > 1)
	{
		var_00 = lib_A4E8::get_center_of_array(level._createfx.selected_fx_ents);
		var_01 = lib_A4E8::get_radius_of_array(level._createfx.selected_fx_ents) + 200;
	}
	else
	{
		var_00 = level._createfx.selected_fx_ents[0].v["origin"];
		var_01 = 200;
	}

	var_02 = anglestoforward(level.var_31D getplayerangles());
	var_03 = var_02 * -1 * var_01;
	var_04 = level.var_31D geteye();
	var_05 = var_04 - level.var_31D.var_2E6;
	level.var_31D setorigin(var_00 + var_03 - var_05);
}

//Function Number: 129
lib_A4E8::clear_all_loopers()
{
	foreach(var_01 in level.createfxent)
	{
		if(isdefined(var_01.looper))
		{
			var_01.looper delete();
		}

		var_01 lib_A4E8::stop_loopsound();
	}
}

//Function Number: 130
lib_A4E8::restart_oneshots()
{
	foreach(var_01 in level.createfxent)
	{
		if(var_01.v["type"] == "oneshotfx")
		{
			var_01 lib_A4E8::restart_fx_looper();
		}
	}
}

//Function Number: 131
lib_A4E8::restart_selected_exploders()
{
	foreach(var_01 in level._createfx.selected_fx_ents)
	{
		if(isdefined(var_01) && var_01.v["type"] == "exploder")
		{
			var_01 common_scripts\utility::activate_individual_exploder();
		}
	}
}

//Function Number: 132
lib_A4E8::save_undo_buffer()
{
	if(isdefined(level.createfxent) && level.createfx_last_movement_timer > 0.15)
	{
		level.createfxent_undo = lib_A4E8::copystructarrayvalues(level.createfxent);
	}
}

//Function Number: 133
lib_A4E8::save_redo_buffer()
{
	if(isdefined(level.createfxent))
	{
		level.createfxent_redo = lib_A4E8::copystructarrayvalues(level.createfxent);
	}
}

//Function Number: 134
lib_A4E8::undo()
{
	if(isdefined(level.createfxent_undo))
	{
		lib_A4E8::clear_all_loopers();
		level.createfxent = [];
		level.createfxent = lib_A4E8::copystructarrayvalues(level.createfxent_undo);
		lib_A4E8::clear_fx_hudelements();
		lib_A4E8::reselect_entitites();
		lib_A4E8::restart_oneshots();
		lib_A4E8::restart_selected_exploders();
	}
}

//Function Number: 135
lib_A4E8::redo()
{
	if(isdefined(level.createfxent_redo))
	{
		lib_A4E8::clear_all_loopers();
		level.createfxent = [];
		level.createfxent = lib_A4E8::copystructarrayvalues(level.createfxent_redo);
		lib_A4E8::clear_fx_hudelements();
		lib_A4E8::reselect_entitites();
		lib_A4E8::restart_oneshots();
		lib_A4E8::restart_selected_exploders();
	}
}

//Function Number: 136
lib_A4E8::copystructarrayvalues(param_00)
{
	var_01 = [];
	if(param_00.size > 0)
	{
		for(var_02 = 0;var_02 < param_00.size;var_02++)
		{
			var_03 = spawnstruct();
			if(isdefined(param_00[var_02].v))
			{
				var_03.v = [];
				var_03.v["type"] = param_00[var_02].v["type"];
				var_03.v["fxid"] = param_00[var_02].v["fxid"];
				var_03.v["soundalias"] = param_00[var_02].v["soundalias"];
				var_03.v["loopsound"] = param_00[var_02].v["loopsound"];
				var_03.v["angles"] = param_00[var_02].v["angles"];
				var_03.v["origin"] = param_00[var_02].v["origin"];
				var_03.v["exploder"] = param_00[var_02].v["exploder"];
				var_03.v["flag"] = param_00[var_02].v["flag"];
				var_03.v["exploder_type"] = param_00[var_02].v["exploder_type"];
				var_03.v["server_culled"] = param_00[var_02].v["server_culled"];
				var_03.v["delay_min"] = param_00[var_02].v["delay_min"];
				var_03.v["delay_max"] = param_00[var_02].v["delay_max"];
				var_03.v["soundalias"] = param_00[var_02].v["soundalias"];
				var_03.v["delay"] = param_00[var_02].v["delay"];
				var_03.v["forward"] = param_00[var_02].v["forward"];
				var_03.v["up"] = param_00[var_02].v["up"];
				var_01[var_02] = var_03;
			}

			var_01[var_02].drawn = param_00[var_02].drawn;
			var_01[var_02].textalpha = param_00[var_02].textalpha;
		}
	}

	return var_01;
}

//Function Number: 137
lib_A4E8::removefxentwithentity(param_00)
{
	var_01 = [];
	foreach(var_03 in level.createfxent)
	{
		if(isdefined(var_03.model) && var_03.model == param_00)
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	level.createfxent = var_01;
}