/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42793.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 36
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:18:17 PM
*******************************************************************/

//Function Number: 1
lib_A729::init()
{
	precacheshellshock("frag_grenade_mp");
	lib_A729::radial_button_definitions();
	lib_A729::radial_init();
	lib_A729::view_path_setup();
	lib_A729::player_init();
}

//Function Number: 2
lib_A729::radial_button_definitions()
{
	lib_A729::newradialbuttongroup("main","player_view1_start","player_view1_end");
	var_00 = lib_A729::newradialbutton("main","Primary Weapon","radial_weapons_primary",::lib_A729::action_weapons_primary);
	var_01 = lib_A729::newradialbutton("main","Secondary Weapon","radial_weapons_secondary",::lib_A729::action_weapons_secondary);
	var_02 = lib_A729::newradialbutton("main","Gears","radial_gears",::lib_A729::action_gears);
	var_03 = lib_A729::newradialbutton("main","Kill Streaks","radial_killstreaks",::lib_A729::action_killstreak);
	var_04 = lib_A729::newradialbutton("main","Leaderboards","radial_leaderboards",::lib_A729::action_leaderboards);
	lib_A729::newradialbuttongroup("gears","player_view2_start","player_view2_end");
	lib_A729::newradialbuttongroup("weapons_primary","player_view3_start","player_view3_end");
	lib_A729::newradialbuttongroup("weapons_secondary","player_view3_start","player_view3_end");
	lib_A729::newradialbuttongroup("killstreak","player_view4_start","player_view4_end");
	lib_A729::newradialbuttongroup("leaderboards","player_view5_start","player_view5_end");
}

//Function Number: 3
lib_A729::radial_init()
{
	foreach(var_01 in level.radial_button_group)
	{
		lib_A729::sort_buttons_by_angle(var_01);
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			if(isdefined(var_01[var_02 + 1]))
			{
				var_03 = lib_A729::getmidangle(var_01[var_02].pos_angle,var_01[var_02 + 1].pos_angle);
				var_01[var_02].end_angle = var_03;
				var_01[var_02 + 1].start_angle = var_03;
				continue;
			}

			var_03 = lib_A729::getmidangle(var_01[var_02].pos_angle,var_01[0].pos_angle) + 180;
			if(var_03 > 360)
			{
				var_03 = var_03 - 360;
			}

			var_01[var_02].end_angle = var_03;
			var_01[0].start_angle = var_03;
		}
	}

	thread lib_A729::updateselectedbutton();
	thread lib_A729::watchselectbuttonpress();
	thread lib_A729::watchbackbuttonpress();
	thread lib_A729::debug_toggle();
}

//Function Number: 4
lib_A729::debug_toggle()
{
	level endon("game_ended");
	level.crib_debug = 1;
	for(;;)
	{
		if(!isdefined(level.observer))
		{
			wait(0.05);
			continue;
		}

		var_00 = 1;
		while(!level.observer buttonpresseddevonly("BUTTON_Y"))
		{
			wait(0.05);
		}

		level.observer playsoundasmaster("mouse_click");
		if(var_00)
		{
			level.crib_debug = level.crib_debug * -1;
			var_00 = 0;
		}

		while(level.observer buttonpresseddevonly("BUTTON_Y"))
		{
			wait(0.05);
		}
	}
}

//Function Number: 5
lib_A729::player_init()
{
	level thread lib_A729::onplayerconnect();
	level thread lib_A729::return_hud();
}

//Function Number: 6
lib_A729::return_hud()
{
	level waittill("game_ended");
	setdvar("cg_draw2d",1);
}

//Function Number: 7
lib_A729::onplayerconnect()
{
	level waittill("connected",var_00);
	var_00 thread lib_A729::readyplayer();
	var_00 waittill("spawned_player");
	wait(1);
	var_00 takeallweapons();
	setdvar("cg_draw2d",0);
	if(!isdefined(var_00))
	{
		return;
	}
	else
	{
		level.observer = var_00;
	}

	var_00 thread lib_A729::get_right_stick_angle();
	lib_A729::zoom_to_radial_menu("main");
}

//Function Number: 8
lib_A729::readyplayer()
{
	self endon("disconnect");
	var_00 = "autoassign";
	while(!isdefined(self.connectedpostgame["team"]))
	{
		wait(0.05);
	}

	self notify("menuresponse",game["menu_team"],var_00);
	wait(0.5);
	var_01 = getarraykeys(level.agentcostumetablename);
	var_02 = [];
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		if(!issubstr(var_01[var_03],"custom"))
		{
			var_02[var_02.size] = var_01[var_03];
		}
	}

	for(;;)
	{
		var_04 = var_02[0];
		self notify("menuresponse","changeclass",var_04);
		self waittill("spawned_player");
		wait(0.1);
	}
}

//Function Number: 9
lib_A729::get_right_stick_angle()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		var_00 = self getnormalizedmovement();
		var_01 = vectortoangles(var_00);
		level.rs_angle = int(var_01[1]);
		wait(0.05);
	}
}

//Function Number: 10
lib_A729::newradialbuttongroup(param_00,param_01,param_02)
{
	if(isdefined(level.radial_button_group) && level.radial_button_group.size)
	{
	}

	var_03 = getent(param_02,"targetname");
	var_04 = vectornormalize(anglestoforward(var_03.var_41)) * 40;
	level.radial_button_group[param_00] = [];
	level.radial_button_group_info[param_00]["view_start"] = param_01;
	level.radial_button_group_info[param_00]["view_pos"] = var_03.var_2E6 + var_04;
	level.radial_button_group_info[param_00]["player_view_pos"] = var_03.var_2E6;
	level.radial_button_group_info[param_00]["view_angles"] = var_03.var_41;
}

//Function Number: 11
lib_A729::newradialbutton(param_00,param_01,param_02,param_03)
{
	var_04 = getent(param_02,"targetname");
	var_05 = lib_A729::getradialanglefroment(param_00,var_04);
	var_06 = spawnstruct();
	var_06.pos = var_04.var_2E6;
	var_06.label = param_01;
	var_06.font_size = 1;
	var_06.font_color = (0.5,0.5,1);
	var_06.pos_angle = var_05;
	var_06.action_func = param_03;
	var_06.radius_pos = 8;
	level.radial_button_group[param_00][level.radial_button_group[param_00].size] = var_06;
	return var_06;
}

//Function Number: 12
lib_A729::updateselectedbutton()
{
	level endon("game_ended");
	for(;;)
	{
		if(!isdefined(level.radial_button_current_group))
		{
			wait(0.05);
			continue;
		}

		var_00 = level.active_button;
		foreach(var_02 in level.radial_button_group[level.radial_button_current_group])
		{
			if(lib_A729::isinrange(var_02.start_angle,var_02.end_angle))
			{
				level.active_button = var_02;
				continue;
			}

			var_02.font_color = (0.5,0.5,1);
		}

		if(isdefined(level.active_button))
		{
			level.active_button.font_color = (1,1,0.5);
			if(isdefined(var_00) && var_00 != level.active_button)
			{
				level.observer playsoundasmaster("mouse_over");
			}
		}

		wait(0.05);
	}
}

//Function Number: 13
lib_A729::watchselectbuttonpress()
{
	level endon("game_ended");
	for(;;)
	{
		if(!isdefined(level.observer))
		{
			wait(0.05);
			continue;
		}

		var_00 = 1;
		while(!level.observer buttonpresseddevonly("BUTTON_A"))
		{
			wait(0.05);
		}

		level.observer playsoundasmaster("mouse_click");
		if(isdefined(level.active_button) && var_00)
		{
			level.active_button notify("select_button_pressed");
			[[ level.active_button.action_func ]]();
			var_00 = 0;
		}

		while(level.observer buttonpresseddevonly("BUTTON_A"))
		{
			wait(0.05);
		}
	}
}

//Function Number: 14
lib_A729::watchbackbuttonpress()
{
	level endon("game_ended");
	for(;;)
	{
		if(!isdefined(level.observer))
		{
			wait(0.05);
			continue;
		}

		var_00 = 1;
		while(!level.observer buttonpresseddevonly("BUTTON_X"))
		{
			wait(0.05);
		}

		level.observer playsoundasmaster("mouse_click");
		if(var_00)
		{
			lib_A729::action_back();
			var_00 = 0;
		}

		while(level.observer buttonpresseddevonly("BUTTON_X"))
		{
			wait(0.05);
		}
	}
}

//Function Number: 15
lib_A729::sort_buttons_by_angle(param_00)
{
	for(var_01 = 0;var_01 < param_00.size - 1;var_01++)
	{
		for(var_02 = 0;var_02 < param_00.size - 1 - var_01;var_02++)
		{
			if(param_00[var_02 + 1].pos_angle < param_00[var_02].pos_angle)
			{
				lib_A729::button_switch(param_00[var_02],param_00[var_02 + 1]);
			}
		}
	}
}

//Function Number: 16
lib_A729::button_switch(param_00,param_01)
{
	var_02 = param_00.pos;
	var_03 = param_00.label;
	var_04 = param_00.pos_angle;
	var_05 = param_00.action_func;
	var_06 = param_00.radius_pos;
	param_00.pos = param_01.pos;
	param_00.label = param_01.label;
	param_00.pos_angle = param_01.pos_angle;
	param_00.action_func = param_01.action_func;
	param_00.radius_pos = param_01.radius_pos;
	param_01.pos = var_02;
	param_01.label = var_03;
	param_01.pos_angle = var_04;
	param_01.action_func = var_05;
	param_01.radius_pos = var_06;
}

//Function Number: 17
lib_A729::draw_radial_buttons(param_00)
{
	foreach(var_02 in level.radial_button_group[param_00])
	{
		var_02 thread lib_A729::draw_radial_button(param_00);
	}
}

//Function Number: 18
lib_A729::draw_radial_button(param_00)
{
	level endon("game_ended");
	self endon("remove_button");
	var_01 = level.radial_button_group_info[param_00]["view_pos"];
	var_02 = var_01 + lib_A729::radial_angle_to_vector(self.pos_angle,4);
	for(;;)
	{
		var_03 = (1,0,0);
		if(lib_A729::isinrange(self.start_angle,self.end_angle))
		{
			var_03 = (1,1,0);
		}

		if(isdefined(level.crib_debug) && level.crib_debug > 0)
		{
			var_04 = var_01 + lib_A729::radial_angle_to_vector(level.rs_angle,2);
		}

		wait(0.05);
	}
}

//Function Number: 19
lib_A729::zoom_to_radial_menu(param_00,param_01)
{
	level.active_button = undefined;
	if(isdefined(level.radial_button_current_group) && level.radial_button_current_group != "")
	{
		level.radial_button_previous_group = level.radial_button_current_group;
	}
	else
	{
		level.radial_button_previous_group = "main";
		level.radial_button_current_group = "main";
	}

	foreach(var_03 in level.radial_button_group[level.radial_button_previous_group])
	{
		var_03 notify("remove_button");
	}

	if(isdefined(param_01) && param_01)
	{
		level.observer lib_A729::go_path_by_targetname_reverse(level.radial_button_group_info[level.radial_button_previous_group]["view_start"],param_00);
	}
	else
	{
		level.observer lib_A729::go_path_by_targetname(level.radial_button_group_info[param_00]["view_start"]);
	}

	level thread lib_A729::draw_radial_buttons(param_00);
	level.radial_button_current_group = param_00;
}

//Function Number: 20
lib_A729::getradialanglefroment(param_00,param_01)
{
	var_02 = level.radial_button_group_info[param_00]["view_angles"];
	var_03 = level.radial_button_group_info[param_00]["view_pos"];
	var_03 = var_03 + vectornormalize(anglestoforward(var_02)) * 40;
	var_04 = anglestoforward(var_02);
	var_05 = vectornormalize(anglestoup(var_02));
	var_06 = param_01.var_41;
	var_07 = param_01.var_2E6;
	var_08 = vectornormalize(vectorfromlinetopoint(var_03,var_03 + var_04,var_07));
	var_09 = acos(vectordot(var_08,var_05));
	if(vectordot(anglestoright(var_02),var_08) < 0)
	{
		var_09 = 360 - var_09;
	}

	return var_09;
}

//Function Number: 21
lib_A729::radial_angle_to_vector(param_00,param_01)
{
	var_02 = (270 - param_00,0,0);
	var_03 = anglestoforward(var_02);
	var_04 = vectornormalize(var_03);
	var_05 = var_04 * param_01;
	return var_05;
}

//Function Number: 22
lib_A729::getmidangle(param_00,param_01)
{
	var_02 = param_00 + param_01 + 720 / 2 - 360;
	return var_02;
}

//Function Number: 23
lib_A729::isinrange(param_00,param_01)
{
	var_02 = level.rs_angle > param_00 && level.rs_angle < 360;
	var_03 = level.rs_angle > 0 && level.rs_angle < param_01;
	if(param_00 > param_01)
	{
		var_04 = var_02 || var_03;
	}
	else
	{
		var_04 = level.rs_angle > param_01 && level.rs_angle < var_02;
	}

	return var_04;
}

//Function Number: 24
lib_A729::action_back()
{
	if(isdefined(level.radial_button_current_group) && level.radial_button_current_group != "main")
	{
		lib_A729::zoom_to_radial_menu("main",1);
		return;
	}
}

//Function Number: 25
lib_A729::action_weapons_primary()
{
	iprintlnbold("action_weapons_primary");
	lib_A729::zoom_to_radial_menu("weapons_primary");
}

//Function Number: 26
lib_A729::action_weapons_secondary()
{
	iprintlnbold("action_weapons_secondary");
	lib_A729::zoom_to_radial_menu("weapons_secondary");
}

//Function Number: 27
lib_A729::action_gears()
{
	iprintlnbold("action_gears");
	lib_A729::zoom_to_radial_menu("gears");
}

//Function Number: 28
lib_A729::action_killstreak()
{
	iprintlnbold("action_killstreak");
	lib_A729::zoom_to_radial_menu("killstreak");
}

//Function Number: 29
lib_A729::action_leaderboards()
{
	iprintlnbold("action_leaderboards");
	lib_A729::zoom_to_radial_menu("leaderboards");
}

//Function Number: 30
lib_A729::view_path_setup()
{
	level.view_paths = [];
	lib_A729::build_path_by_targetname("player_view1_start");
	lib_A729::build_path_by_targetname("player_view2_start");
	lib_A729::build_path_by_targetname("player_view3_start");
	lib_A729::build_path_by_targetname("player_view4_start");
	lib_A729::build_path_by_targetname("player_view5_start");
}

//Function Number: 31
lib_A729::build_path_by_targetname(param_00)
{
	level.view_paths[param_00] = [];
	var_01 = getent(param_00,"targetname");
	level.view_paths[param_00][level.view_paths[param_00].size] = var_01;
	while(isdefined(var_01) && isdefined(var_01.target))
	{
		var_02 = getent(var_01.target,"targetname");
		level.view_paths[param_00][level.view_paths[param_00].size] = var_02;
		var_01 = var_02;
	}
}

//Function Number: 32
lib_A729::go_path_by_targetname(param_00)
{
	if(!isdefined(level.dummy_mover))
	{
		var_01 = level.view_paths[param_00][0];
		level.dummy_mover = spawn("script_model",var_01.var_2E6);
		level.dummy_mover.var_41 = var_01.var_41;
		self setorigin(level.dummy_mover.var_2E6 - (0,0,65));
		self linkto(level.dummy_mover);
		wait(0.05);
		self setplayerangles(level.dummy_mover.var_41);
		thread lib_A729::force_player_angles();
	}

	var_02 = 1;
	var_03 = abs(distance(level.dummy_mover.var_2E6,level.view_paths[param_00][level.view_paths[param_00].size - 1].var_2E6));
	var_02 = var_02 * var_03 / 1200;
	var_02 = max(var_02,0.1);
	var_04 = var_02;
	if(!1)
	{
		var_04 = var_04 * var_02 * level.view_paths[param_00].size + 1;
	}

	thread lib_A729::blur_sine(3,var_04);
	foreach(var_07, var_06 in level.view_paths[param_00])
	{
		if(1)
		{
			if(var_07 != level.view_paths[param_00].size - 1)
			{
				continue;
			}
		}

		level.dummy_mover moveto(var_06.var_2E6,var_02,var_02 * 0.5,0);
		level.dummy_mover rotateto(var_06.var_41,var_02,var_02 * 0.5,0);
		wait(var_02);
	}
}

//Function Number: 33
lib_A729::go_path_by_targetname_reverse(param_00,param_01)
{
	var_02 = 1;
	var_03 = abs(distance(level.dummy_mover.var_2E6,level.radial_button_group_info[param_01]["player_view_pos"]));
	var_02 = var_02 * var_03 / 1200;
	var_02 = max(var_02,0.1);
	var_04 = var_02;
	if(!1)
	{
		var_04 = var_04 * var_02 * level.view_paths[param_00].size + 1;
	}

	thread lib_A729::blur_sine(3,var_04);
	if(!1)
	{
		for(var_05 = level.view_paths[param_00].size - 1;var_05 >= 0;var_05--)
		{
			var_06 = level.view_paths[param_00][var_05];
			level.dummy_mover moveto(var_06.var_2E6,var_02);
			level.dummy_mover rotateto(var_06.var_41,var_02);
			wait(var_02);
		}
	}

	thread lib_A729::blur_sine(3,var_02);
	var_07 = level.radial_button_group_info[param_01]["player_view_pos"];
	var_08 = level.radial_button_group_info[param_01]["view_angles"];
	level.dummy_mover moveto(var_07,var_02,var_02 * 0.5,0);
	level.dummy_mover rotateto(var_08,var_02,var_02 * 0.5,0);
	wait(var_02);
}

//Function Number: 34
lib_A729::travel_view_fx(param_00)
{
	self setblurforplayer(20,param_00 + 0.2 / 2);
	self setblurforplayer(0,param_00 + 0.2 / 2);
	self shellshock("frag_grenade_mp",param_00 + 0.2);
}

//Function Number: 35
lib_A729::blur_sine(param_00,param_01)
{
	var_02 = int(param_01 / 0.05);
	for(var_03 = 0;var_03 < var_02;var_03++)
	{
		var_04 = var_03 / var_02;
		var_05 = sin(180 * var_04);
		var_06 = param_00 * var_05;
		setdvar("r_blur",var_06);
		wait(0.05);
	}

	setdvar("r_blur",0);
}

//Function Number: 36
lib_A729::force_player_angles()
{
	level endon("game_ended");
	self endon("disconnect");
	level.dummy_mover endon("remove_dummy");
	for(;;)
	{
		self setplayerangles(level.dummy_mover.var_41);
		wait(0.05);
	}
}