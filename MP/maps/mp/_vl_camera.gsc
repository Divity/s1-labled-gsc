/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _vl_camera - 42844.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 121
 * Decompile Time: 4660 ms
 * Timestamp: 4/20/2022 8:18:07 PM
*******************************************************************/

//Function Number: 1
delayed_luinotifyserver(param_00,param_01,param_02)
{
	wait(param_00);
	self notify("luinotifyserver",param_01,param_02);
}

//Function Number: 2
setup_camparams()
{
	var_00 = spawnstruct();
	var_00.targetzoff = 40;
	var_00.basedelta = 0.25;
	var_00.tgtdelta = var_00.basedelta;
	var_00.accel = 0.01;
	var_00.delta = 0;
	var_00.basedangle = 0.5;
	var_00.angleaccel = 0.01;
	var_00.tgtdangle = var_00.basedangle;
	var_00.dangle = 0;
	var_00.maxorbitangle = 60;
	var_00.minorbitdist = 60;
	var_00.maxorbitdist = 120;
	var_00.angle = 0;
	var_00.dist = 120;
	var_00.dof_time = 12;
	var_00.face_dof_mod = -10;
	var_00.caotolobbyframedelay = 3;
	var_00.caotolobbyframetimer = 0;
	var_00.gamelobbygroup_camoffset_angle_ratio = 0;
	var_00.gamelobbygroup_camerazoff_zoom = 45;
	var_00.gamelobbygroup_targetzoff_zoom = 50;
	var_00.gamelobbygroup_camera_offset = 6;
	var_00.gamelobbygroup_camera_targetoffset = 6;
	var_00.gamelobbygroup_camera_upclosez = 513;
	var_00.gamelobbygroup_camera_normalz = 507;
	var_00.gamelobbygroup_camera_crouchz = 483;
	var_00.gamelobbygroup_camera_hunchz = 502;
	var_00.gamelobbygroup_camera_closedistance = 71.5;
	var_00.gamelobbygroup_camera_normaldistance = 96.8;
	var_00.gamelobbygroup_camera_crouchdistance = 96.8;
	var_00.gamelobbygroup_camera_hunchdistance = 96.8;
	var_00.gamelobbygroup_camera_crouchthreshold = 490;
	var_00.gamelobbygroup_camera_hunchthreshold = 504.5;
	var_00.gamelobbygroup_camera_normalthreshold = 509.5;
	var_00.gamelobbygroup_movespeed_modifier = 0.95;
	var_00.var_197A = 0;
	var_00.cac_camerazoff_zoom = 7;
	var_00.cac_targetzoff_zoom = 13;
	var_00.cac_camera_offset = 0;
	var_00.cac_camera_targetoffset = 0;
	var_00.camoffset_ratio_cac = 0.1;
	var_00.cac_ratio_zoom = 0.2;
	var_00.cac_framedelay = 0;
	var_00.cac_camerazoff = 17;
	var_00.cac_targetzoff = 14.5;
	var_00.cac_dist = 69;
	var_00.cac_weap_offset = 8;
	var_00.cac_weap_tuning = 0;
	var_00.cac_weap_tuning_camoffset = 0;
	var_00.cac_weap_tuning_weap_sideoffset = 0;
	var_00.cac_weap_tuning_weap_zoffset = 0;
	var_00.cacweapondelaytime = 0.35;
	var_00.cacweaponanimdelaytime = 0.1;
	var_00.cacweaponattachdelaytime = 0.05;
	var_00.gamelobby_movespeed = 150;
	var_00.gamelobby_camoffset_angle_ratio = 0.2;
	var_00.gamelobby_camerazoff_zoom = 45;
	var_00.gamelobby_targetzoff_zoom = 55;
	var_00.gamelobby_camera_offset = 16;
	var_00.gamelobby_camera_targetoffset = 24;
	var_00.gamelobby_camera_rotation_speed = 0.5;
	var_00.var_1C1 = "avatar";
	var_00.gamelobby_camera_curve_modify = 0.005;
	var_00.gamelobby_camera_curve_storedy = 0;
	var_00.gamelobby_camera_curve_movex = 64;
	var_00.gamelobby_camera_depth_scaler = 0;
	var_00.tgt_camoffset_ratio = var_00.camoffset_ratio_prelobby;
	var_00.cur_camoffset_ratio = var_00.tgt_camoffset_ratio;
	var_00.cac_camoffset_ratio = 0;
	var_00.cac_weap_loot_offset = (-0.02,0,-0.08);
	var_00.cac_weap_screen_offset = (0.05,0,-0.06);
	var_00.camoffset_ratio_maxspeed = 0.25;
	var_00.camzoff = 10;
	var_00.movespeed = 150;
	var_00.angspeed = 800;
	var_00.prelobbyzoom = 0;
	var_01 = self method_844D();
	var_00.oldrotx = var_01[0];
	var_00.oldroty = var_01[1];
	var_00.var_A3F0 = 0.5;
	var_00.rotate = 0.5;
	var_00.framedelay = 0;
	var_00.old_vl_focus = 4;
	var_00.delayed_cut = 0;
	var_00.dof_near_start = 0;
	var_00.dof_near_end = 0;
	var_00.dof_far_start = 159.8;
	var_00.dof_far_end = 205.59;
	var_00.dof_near_blur = 7.5;
	var_00.dof_far_blur = 2;
	var_00.origin_offset = (0,0,40);
	var_00.prelobby_movespeed = 300;
	var_00.prelobby_targetzoff_zoom = 10;
	var_00.prelobby_targetzoff = 42;
	var_00.prelobby_neardist = 40;
	var_00.prelobby_fardist = 200;
	var_00.prelobby_camerazoff = 0;
	var_00.prelobby_camerazoff_zoom = 20;
	var_00.prelobby_camera_ratio = 0.325;
	var_00.prelobby_ratio_zoom = 0.2;
	var_00.camoffset_ratio_lobby = -0.1;
	var_00.camoffset_ratio_prelobby = 0.19;
	var_00.camoffset_ratio_prelobby_loot = -1;
	var_00.ch_cyl_zoff_far = 36;
	var_00.ch_cyl_zoff_near = 42;
	var_00.var_970D = 0;
	var_00.cao_targetzoff_zoom = 10;
	var_00.cao_targetzoff = 31;
	var_00.cao_neardist = 40;
	var_00.cao_fardist = 200;
	var_00.cao_camerazoff = 0;
	var_00.cao_camerazoff_zoom = 20;
	var_00.cao_camera_ratio = 0.77;
	var_00.cao_ratio_zoom = 0.2;
	var_00.cao_camoffset_ratio = 0.25;
	var_02 = getdvarint("virtualLobbyMode",0);
	if(var_02 == 0)
	{
		var_00.var_5D32 = "game_lobby";
		start_prelobby_anims();
		setdvar("virtualLobbyReady","0");
	}
	else
	{
		var_00.var_5D32 = "transition";
		var_00.tgt_camoffset_ratio = var_00.camoffset_ratio_lobby;
		var_00.cur_camoffset_ratio = var_00.tgt_camoffset_ratio;
		start_lobby_anims();
		if(getdvarint("virtualLobbyReady",0) == 0)
		{
			setdvar("virtualLobbyReady","1");
		}

		if(var_02 == 2)
		{
			thread delayed_luinotifyserver(0.1,"cac",0);
		}
		else if(var_02 == 3)
		{
			thread delayed_luinotifyserver(0.1,"cao",0);
		}
	}

	var_00.var_60B0 = var_00.var_5D32;
	level.camdirectionforward = var_00;
}

//Function Number: 3
update_camera_params_ratio(param_00)
{
	if(isdefined(self.cut))
	{
		param_00.cur_camoffset_ratio = param_00.tgt_camoffset_ratio;
		return;
	}

	var_01 = param_00.tgt_camoffset_ratio - param_00.cur_camoffset_ratio;
	if(var_01 < -1 * param_00.camoffset_ratio_maxspeed)
	{
		var_01 = -1 * param_00.camoffset_ratio_maxspeed;
	}
	else if(var_01 > param_00.camoffset_ratio_maxspeed)
	{
		var_01 = param_00.camoffset_ratio_maxspeed;
	}

	param_00.cur_camoffset_ratio = param_00.cur_camoffset_ratio + var_01;
}

//Function Number: 4
vlobby_lighting_setup()
{
	var_00 = self;
	if(isdefined(level.vl_lighting_setup))
	{
		var_00 [[ level.vl_lighting_setup ]]();
		return;
	}

	var_00 method_84A9();
	var_00 method_84AB(0.613159,89.8318,level.camdirectionforward.dof_time,level.camdirectionforward.dof_time);
}

//Function Number: 5
set_avatar_dof()
{
	if(isdefined(level.camdirectionforward.var_1C1))
	{
		if(level.camdirectionforward.var_1C1 == "moving" || level.camdirectionforward.var_1C1 == "finding_new_position" || level.is_cao_agent[level.var_9E99] != level.is_cao_agent[level.var_63BB])
		{
			return;
		}
	}

	if(isdefined(level.camdirectionforward.camera.cut) && level.camdirectionforward.camera.cut == 1)
	{
		return;
	}

	var_00 = self;
	if(isdefined(level.camdirectionforward.camera.goal_location))
	{
		var_01 = level.camdirectionforward.camera.goal_location;
	}
	else
	{
		var_02 = level.is_cao_agent[level.var_63BB];
		var_03 = var_02 gettagorigin("TAG_STOWED_BACK");
		var_04 = distance2d(var_03,var_02.avatar_spawnpoint.var_2E6);
		var_05 = var_02.avatar_spawnpoint.var_2E6 + anglestoforward(var_02.avatar_spawnpoint.var_41) * var_04;
		var_01 = (var_05[0],var_05[1],var_03[2]);
	}

	var_06 = checkcamposition(level.camdirectionforward.camera,var_01,1.5);
	if(var_06 == 1)
	{
		var_07 = var_01;
	}
	else
	{
		var_07 = level.camdirectionforward.camera.var_2E6;
	}

	var_08 = distance(level.is_cao_agent[level.var_63BB] gettagorigin("j_spine4"),var_07);
	var_00 vlobby_dof_based_on_focus(var_08 + level.camdirectionforward.face_dof_mod);
}

//Function Number: 6
vlobby_dof_based_on_focus(param_00)
{
	if(param_00 <= 0)
	{
		return;
	}

	var_01 = self;
	var_02 = level.camdirectionforward.dof_time;
	if(isdefined(level.vl_dof_based_on_focus))
	{
		var_01 [[ level.vl_dof_based_on_focus ]](param_00);
		return;
	}

	var_03 = param_00;
	var_01 = self;
	var_04 = 0.025;
	var_05 = 0.65;
	var_06 = 0.613159;
	var_07 = 94.9504;
	var_08 = var_07 - var_03 * var_04;
	var_09 = var_06 + var_08 + var_08 * var_05;
	if(var_09 < 0.125)
	{
		var_09 = 0.125;
	}
	else if(var_09 > 128)
	{
		var_09 = 128;
	}

	var_01 method_84AB(var_09,var_03,level.camdirectionforward.dof_time,level.camdirectionforward.dof_time * 2);
}

//Function Number: 7
vlobby_handle_mode_change(param_00,param_01,param_02)
{
	var_03 = self;
	if(isdefined(level.vl_handle_mode_change))
	{
		var_03 [[ level.vl_handle_mode_change ]](param_00,param_01,param_02);
		return;
	}

	if(param_00 == "cac")
	{
		var_03 setdefaultpostfx();
	}
	else if(param_00 == "cao")
	{
	}

	if(param_01 == "cac")
	{
		var_03 visionsetnakedforplayer("mp_vlobby_refraction_cac",0);
		var_03 method_83C0("mp_vl_create_a_class");
		return;
	}

	if(param_01 == "cao")
	{
		var_03 method_84AB(1.53,130,level.camdirectionforward.dof_time,level.camdirectionforward.dof_time);
		return;
	}

	if(param_01 == "clanprofile")
	{
		var_03 setdefaultdof();
		return;
	}

	if(param_01 == "prelobby")
	{
		var_03 setdefaultpostfx();
		return;
	}

	if(param_00 == "prelobby_members")
	{
		return;
	}

	if(param_00 == "prelobby_loadout")
	{
		return;
	}

	if(param_00 == "prelobby_loot")
	{
		return;
	}

	if(param_01 == "game_lobby")
	{
		var_03 setdefaultpostfx();
		return;
	}

	if(param_00 == "startmenu")
	{
		return;
	}

	if(param_00 == "transition")
	{
		return;
	}
}

//Function Number: 8
setdefaultpostfx()
{
	var_00 = self;
	var_00 visionsetnakedforplayer("mp_vlobby_room",0);
	var_00 method_83C0("mp_vlobby_room");
}

//Function Number: 9
setdefaultdof()
{
	var_00 = self;
	var_00 method_84AB(0.613159,89.8318,level.camdirectionforward.dof_time,level.camdirectionforward.dof_time);
}

//Function Number: 10
fixlocalfocus()
{
	if(!isdefined(level.is_cao_agent[level.var_9E99]))
	{
		foreach(var_02, var_01 in level.is_cao_agent)
		{
			level.var_9E99 = var_02;
			break;
		}
	}

	if(!isdefined(level.is_cao_agent[level.var_9E9F]))
	{
		level.var_9E9F = level.var_9E99;
	}
}

//Function Number: 11
vlobby_player()
{
	self endon("disconnect");
	wait(0.05);
	var_00 = self;
	var_00 setclientomnvar("ui_vlobby_round_state",0);
	var_00 setclientomnvar("ui_vlobby_round_timer",0);
	var_00 grab_players_classes();
	var_01 = var_00.var_2E6;
	var_02 = var_00.var_41;
	var_03 = var_01 - (0,0,30);
	var_00 setup_camparams();
	var_00 vlobby_lighting_setup();
	var_04 = anglestoforward(var_00.var_41);
	var_05 = anglestoright(var_00.var_41);
	var_06 = var_04;
	var_07 = getgroundposition(var_01,20,512,120);
	var_08 = var_00 getxuid();
	var_09 = var_08 == "";
	var_0A = undefined;
	level.needlocalmemberid = 1;
	level.var_9E99 = 0;
	level.var_9E9F = 0;
	var_00.inliveplayerkillstreak = "spectator";
	var_0B = "iw5_hbra3_mp";
	var_0C = "iw5_hbra3";
	if(isdefined(var_00.loadouts["customClasses"][0]["primary"]) && var_00.loadouts["customClasses"][0]["primary"] != "none")
	{
		var_0D = var_00.loadouts["customClasses"][0]["primary"];
		var_0E = var_00.loadouts["customClasses"][0]["primaryAttachment1"];
		var_0F = var_00.loadouts["customClasses"][0]["primaryAttachment2"];
		var_10 = var_00.loadouts["customClasses"][0]["primaryAttachment3"];
		var_11 = var_00.loadouts["customClasses"][0]["primaryCamo"];
		var_12 = var_00.loadouts["customClasses"][0]["primaryReticule"];
		if(isdefined(var_11))
		{
			var_11 = int(tablelookup("mp/camoTable.csv",1,var_11,0));
		}
		else
		{
			var_11 = undefined;
		}

		if(isdefined(var_12))
		{
			var_12 = int(tablelookup("mp/reticleTable.csv",1,var_12,0));
		}
		else
		{
			var_12 = undefined;
		}

		var_0B = maps\mp\gametypes\_class::buildweaponname(var_0D,var_0E,var_0F,var_10,var_11,var_12);
		var_0C = var_00.loadouts["customClasses"][0]["primary"];
	}
	else if(isdefined(var_00.alias))
	{
		var_0B = var_00.alias;
		var_0C = var_00.connectedpostgame["primaryWeapon"];
	}

	var_13 = getent("cao_spawnpoint","targetname");
	if(!var_09)
	{
		maps\mp\_vl_base::vlprintln("adding xuid " + var_08 + "from vlobby_player");
		var_14 = maps\mp\_vl_base::add_avatar(var_08);
		var_00 spawn_an_avatar(var_00.avatar_spawnpoint,var_0B,var_00.secondaryweapon,var_0C,var_00.loadoutequipment,var_00.loadoutoffhand,var_00.perks,var_00.cam_percent_away,var_00.name,var_14,0);
		function_02D4(level.is_cao_agent[var_14],var_08);
		thread setvirtuallobbypresentable();
	}
	else
	{
		level.needtopresent = 1;
	}

	setdvar("virtuallobbymembers",level.xuid2ownerid.size);
	var_00.var_1B06 = var_00 spawn_an_avatar(var_13,var_0B,var_00.secondaryweapon,var_0C,var_00.loadoutequipment,var_00.loadoutoffhand,var_00.perks,var_00.cam_percent_away,var_00.name,0,1);
	function_02D4(var_00.var_1B06,var_08);
	hide_avatar(var_00.var_1B06);
	var_00.clan_agents = [];
	var_15 = [0,1,4];
	for(var_16 = 0;var_16 < 3;var_16++)
	{
		var_17 = maps\mp\gametypes\vlobby::getspawnpoint(var_15[var_16]);
		var_00.clan_agents[var_16] = var_00 spawn_an_avatar(var_17,var_0B,var_00.secondaryweapon,var_0C,var_00.loadoutequipment,var_00.loadoutoffhand,var_00.perks,var_00.cam_percent_away,var_00.name,0,0,1);
		hide_avatar(var_00.clan_agents[var_16]);
	}

	var_00 thread monitor_class_select_or_weapon_change(0);
	if(!var_09)
	{
		var_0A = level.is_cao_agent[level.var_9E99];
		var_0A.membertimeout = gettime();
		var_0A.currentselectedclass = var_00.currentselectedclass;
		var_0A.var_31D = var_00;
		var_0A.cam_percent_away = var_0A.costume;
		virtual_lobby_set_class(0,"lobby" + var_0A.currentselectedclass + 1,1);
	}

	thread monitor_debug_addfakemembers(var_00,level.camdirectionforward);
	var_18 = (-70.7675,-691.293,507.472);
	var_19 = var_00.avatar_spawnpoint.var_2E6 - var_18;
	var_1A = (0,87,0);
	var_19 = vectornormalize(var_19);
	var_1B = spawn("script_model",var_18);
	var_1B.var_41 = var_1A;
	var_1B setmodel("tag_player");
	var_1B.var_8D2D = var_18;
	var_1B.var_8CF9 = var_1A;
	var_1B.var_7817 = (0,0,0);
	var_1B.var_1A0D = 0;
	var_1B.var_473C = 1;
	var_1B.vlcamera = 1;
	var_1B.cut = 1;
	var_1B.var_3C07 = 0;
	var_1B.finished = 1;
	var_1B.goal_location = var_18;
	storecameratargets(var_1B);
	var_1C = 400;
	var_00.camera = var_1B;
	var_1B.var_31D = var_00;
	var_00.var_4748 = 0;
	var_1D = (0,90,0);
	var_1B.var_5FA6 = "starting";
	level.var_9EA3 = var_1B;
	var_00 setorigin(var_1B.var_2E6);
	var_00 playerlinkto(var_1B,"tag_player");
	var_00 cameralinkto(var_1B,"tag_player");
	level.in_firingrange = 0;
	var_00 method_8131(0);
	var_00 maps\mp\_vl_base::prep_for_controls(var_00.spawned_avatar,var_00.spawned_avatar.spawn_angles);
	var_00 maps\mp\_vl_base::prep_for_controls(var_00.var_1B06,var_00.var_1B06.spawn_angles);
	var_00 maps\mp\_vl_base::prep_for_controls(var_00.clan_agents[0],var_00.clan_agents[0].spawn_angles);
	var_00 maps\mp\_vl_base::prep_for_controls(var_00.clan_agents[1],var_00.clan_agents[1].spawn_angles);
	var_00 maps\mp\_vl_base::prep_for_controls(var_00.clan_agents[2],var_00.clan_agents[2].spawn_angles);
	maps\mp\_utility::updatesessionstate("spectator");
	var_1E = level.camdirectionforward;
	var_1E.camera = var_1B;
	init_path_constants(var_1B);
	var_1F = 300;
	level.var_63BB = level.var_9E99;
	var_1C = 1000;
	var_20 = anglestoforward(var_1B.var_41);
	var_21 = undefined;
	var_22 = undefined;
	var_23 = undefined;
	var_24 = undefined;
	level.camdirectionforward.framedelay = level.camdirectionforward.old_vl_focus;
	thread monitor_player_removed();
	thread monitor_vl_mode_change();
	var_25 = 0;
	var_26 = 0;
	var_00 setclientdvar("cg_fovscale","0.6153");
	var_00 notify("fade_in");
	for(;;)
	{
		maps\mp\_vl_base::avatar_after_spawn();
		if(level.is_cao_agent.size == 0)
		{
			if(var_1E.var_5D32 == "game_lobby" || var_1E.var_5D32 == "prelobby_loot")
			{
				hide_avatar(var_00.var_1B06);
				for(var_16 = 0;var_16 < 3;var_16++)
				{
					hide_avatar(var_00.clan_agents[var_16]);
				}

				var_1B.cut = 1;
				var_00.avatar_spawnpoint = maps\mp\gametypes\vlobby::getspawnpoint(0);
				lobby_update_group_new(var_1B,undefined,var_1E,var_00.avatar_spawnpoint);
				vlobby_vegnette(1,"ac130_overlay_pip_vignette_vlobby");
			}

			wait(0.05);
			continue;
		}

		var_0A = level.is_cao_agent[level.var_9E99];
		if(var_26)
		{
			var_26 = 0;
			var_00 thread debug_pathing();
		}

		if(getdvarint("scr_vl_debugfly") > 0)
		{
			if(!var_25)
			{
				var_25 = 1;
				setdvar("lui_enabled","0");
				level.debug_fly = undefined;
				var_00 method_8131(1);
			}

			var_00 debug_fly(var_1B);
		}
		else if(var_25)
		{
			setdvar("lui_enabled","1");
			var_25 = 0;
			var_1B.var_2E6 = var_1B.var_8D2D;
			var_1B.var_41 = var_1B.var_8CF9;
			var_00 method_8131(0);
		}

		if(!level.in_firingrange)
		{
			if(level.var_9E99 != level.var_63BB)
			{
				var_00 maps\mp\_vl_base::prep_for_controls(level.is_cao_agent[level.var_9E99],level.is_cao_agent[level.var_9E99].var_41);
				if(var_1E.var_5D32 != "game_lobby")
				{
					var_1E.var_60B0 = "transition";
				}

				level.var_63BB = level.var_9E99;
				var_1E.var_970D = 1;
			}

			if(isdefined(level.prv_cac_weapon) || isdefined(level.var_7046))
			{
				if(!isdefined(level.prv_cac_weapon))
				{
					var_1E.var_60B0 = var_1E.var_705C;
					level.var_7046 = undefined;
				}
				else if(!isdefined(level.var_7046))
				{
					var_1E.var_60B0 = "cao";
					var_1E.var_705C = var_1E.var_5D32;
					level.var_7046 = level.prv_cac_weapon;
				}
				else if(level.prv_cac_weapon != level.var_7046)
				{
					level.var_7046 = level.prv_cac_weapon;
				}
			}

			if(isdefined(level.cac) || isdefined(level.var_7044))
			{
				if(!isdefined(level.cac))
				{
					var_1E.var_60B0 = var_1E.var_705C;
					level.var_7044 = undefined;
					level.var_7045 = "none";
				}
				else if(!isdefined(level.var_7044))
				{
					var_1E.var_60B0 = "cac";
					var_1E.var_705C = var_1E.var_5D32;
					level.var_7044 = level.cac;
				}
			}

			if(isdefined(level.clanmemberownerids) || isdefined(level.prv_vl_clanprofile_focus))
			{
				if(!isdefined(level.clanmemberownerids))
				{
					var_1E.var_60B0 = var_1E.var_705C;
					level.prv_vl_clanprofile_focus = undefined;
				}
				else if(!isdefined(level.prv_vl_clanprofile_focus))
				{
					var_1E.var_60B0 = "clanprofile";
					var_1E.var_705C = var_1E.var_5D32;
					level.prv_vl_clanprofile_focus = level.clanmemberownerids;
				}
				else if(level.clanmemberownerids != level.prv_vl_clanprofile_focus)
				{
					level.prv_vl_clanprofile_focus = level.clanmemberownerids;
					var_00 maps\mp\_vl_base::prep_for_controls(var_00.clan_agents[level.clanmemberownerids],var_00.clan_agents[level.clanmemberownerids].var_41);
				}
			}

			if(level.is_cao_agent.size == 0)
			{
				continue;
			}

			fixlocalfocus();
			var_0A = level.is_cao_agent[level.var_9E99];
			if(var_1E.var_60B0 != var_1E.var_5D32)
			{
				var_00 vlobby_handle_mode_change(var_1E.var_5D32,var_1E.var_60B0,var_1E);
				if(var_1E.var_60B0 == "cac")
				{
					hide_avatar(var_00.var_1B06);
					for(var_16 = 0;var_16 < 3;var_16++)
					{
						hide_avatar(var_00.clan_agents[var_16]);
					}

					var_00.var_4748 = 0;
					var_1E.var_5D32 = var_1E.var_60B0;
					var_1E.tgt_camoffset_ratio = var_1E.var_197A;
					var_0A = level.is_cao_agent[level.var_9E99];
					var_00 maps\mp\_vl_base::prep_for_controls(var_0A,var_0A.var_41);
				}
				else if(var_1E.var_5D32 == "cac")
				{
					maps\mp\_vl_base::show_non_owner_avatars();
					var_0A = level.is_cao_agent[level.var_9E99];
					var_00.var_4748 = 0;
				}

				if(var_1E.var_60B0 == "cao")
				{
					if(isdefined(level.var_9E9F) && isdefined(level.is_cao_agent[level.var_9E9F]))
					{
						var_27 = level.is_cao_agent[level.var_9E9F];
						level.var_328[0].costume = var_27.costume;
						var_28 = level.var_328[0] maps\mp\gametypes\_teams::playercostume();
						var_28 = var_27 maps\mp\gametypes\_teams::playercostume();
						var_29 = level.var_328[0].var_1B06;
						vl_avatar_costume(var_29,var_27.costume);
						var_28 = var_29 maps\mp\gametypes\_teams::playercostume();
						foreach(var_08, var_2B in level.xuid2ownerid)
						{
							if(var_2B == level.var_9E9F)
							{
								if(isdefined(level.cao_xuid) && level.cao_xuid != var_08)
								{
									function_02D4(var_29,level.cao_xuid,1);
								}

								function_02D4(var_29,var_08);
								level.cao_xuid = var_08;
								break;
							}
						}
					}

					show_avatar(var_00.var_1B06);
					var_00.var_1B06 hackagentangles(var_00.var_1B06.spawn_angles);
					hide_avatars();
					for(var_16 = 0;var_16 < 3;var_16++)
					{
						hide_avatar(var_00.clan_agents[var_16]);
					}

					var_0A = var_00.var_1B06;
					var_00 maps\mp\_vl_base::prep_for_controls(var_00.var_1B06,var_00.var_1B06.var_41);
					start_cao_anims();
					var_1E.var_5D32 = var_1E.var_60B0;
					var_1B.cut = 1;
					var_00 setorigin(var_0A.var_2E6);
				}
				else if(var_1E.var_60B0 == "clanprofile")
				{
					hide_avatar(var_00.var_1B06);
					hide_avatars();
					for(var_16 = 0;var_16 < 3;var_16++)
					{
						var_00.clan_agents[var_16] hackagentangles(var_00.clan_agents[var_16].spawn_angles);
						var_00 maps\mp\_vl_base::prep_for_controls(var_00.clan_agents[var_16],var_00.clan_agents[var_16].var_41);
					}

					var_0A = var_00.clan_agents[0];
					var_1E.var_5D32 = var_1E.var_60B0;
					var_00 setorigin(var_0A.var_2E6);
				}
				else if(var_1E.var_60B0 == "prelobby_loot")
				{
					var_1B.cut = 1;
				}
				else if(var_1E.var_60B0 == "transition")
				{
					var_1E.var_60B0 = "game_lobby";
				}

				if(var_1E.var_60B0 == "game_lobby")
				{
					fixlocalfocus();
					if(var_1E.var_5D32 == "cac" && isdefined(level.var_9E99))
					{
						var_2C = level.var_9E99;
					}
					else
					{
						var_2C = 0;
						foreach(var_2B, var_2E in level.is_cao_agent)
						{
							var_2C = var_2B;
							break;
						}
					}

					if(var_1E.var_5D32 == "cao" || var_1E.var_5D32 == "cac" || var_1E.var_5D32 == "clanprofile")
					{
						var_1B.finished = 1;
						if(isdefined(level.prv_cac_weapon))
						{
							level.var_9E9F = var_2C;
							var_2C = getfocusfromcontroller(level.prv_cac_weapon);
						}
						else if(isdefined(level.clanmemberownerids))
						{
							level.var_9E9F = var_2C;
							var_2C = getfocusfromcontroller(level.clanmemberownerids);
						}
						else
						{
							level.var_9E9F = var_2C;
						}
					}

					if(isdefined(level.is_cao_agent) && isdefined(level.var_63BB) && isdefined(level.is_cao_agent[level.var_63BB]))
					{
						var_00 maps\mp\_vl_base::prep_for_controls(level.is_cao_agent[level.var_63BB],level.is_cao_agent[level.var_63BB].var_41);
					}

					var_1E.var_1C1 = "waiting";
					if(var_1E.var_5D32 != "cac")
					{
						show_avatars();
					}

					level.var_9E99 = var_2C;
					level.var_63BB = var_2C;
					var_0A = level.is_cao_agent[var_2C];
					if(var_1E.var_5D32 != "cac")
					{
						var_1B.cut = 1;
					}
					else if(var_1E.var_5D32 == "cac" && isdefined(var_1B.avatar_spawnpoint) && var_1B.avatar_spawnpoint != var_0A.avatar_spawnpoint)
					{
						var_1B.cut = 1;
					}

					start_lobby_anims();
					var_1B.var_5508 = var_0A.avatar_spawnpoint;
					var_1B.avatar_spawnpoint = var_0A.avatar_spawnpoint;
					var_00 maps\mp\_vl_base::prep_for_controls(var_0A,var_0A.var_41);
					var_1B.var_5FA6 = "starting";
					var_00 setorigin(var_0A.var_2E6);
				}

				var_1E.var_5D32 = var_1E.var_60B0;
			}

			if(var_1E.var_5D32 == "startmenu")
			{
				start_menu_update(var_1B,var_1E);
			}
			else if(var_1E.var_5D32 == "cao")
			{
				var_0A = var_00.var_1B06;
				cao_update(var_1B,var_0A,var_1E);
				vlobby_vegnette(1,"ac130_overlay_pip_vignette_vlobby_cao");
			}
			else if(var_1E.var_5D32 == "clanprofile")
			{
				var_0A = var_00.clan_agents[level.clanmemberownerids];
				clan_profile_update(var_1B,var_0A,var_1E);
				vlobby_vegnette(1,"ac130_overlay_pip_vignette_vlobby");
			}
			else if(var_1E.var_5D32 == "cac")
			{
				lobby_update_group_new(var_1B,level.is_cao_agent[level.var_9E99],var_1E,var_00.avatar_spawnpoint);
			}
			else if(var_1E.var_5D32 == "transition")
			{
				var_1E.var_60B0 = "game_lobby";
			}
			else if(var_1E.caotolobbyframetimer <= 0)
			{
				hide_avatar(var_00.var_1B06);
				for(var_16 = 0;var_16 < 3;var_16++)
				{
					hide_avatar(var_00.clan_agents[var_16]);
				}

				lobby_update_group_new(var_1B,var_0A,var_1E,var_00.avatar_spawnpoint);
				vlobby_vegnette(1,"ac130_overlay_pip_vignette_vlobby");
			}
			else
			{
				var_1E.caotolobbyframetimer = var_1E.caotolobbyframetimer - 1;
			}
		}

		if(level.in_firingrange)
		{
			vlobby_vegnette(0,"ac130_overlay_pip_vignette_vlobby");
		}

		wait(0.05);
	}
}

//Function Number: 12
tablelookupweaponoffsets(param_00,param_01,param_02)
{
	var_03 = float(tablelookup("mp/vlobby_cac_offsets.csv",param_01,param_00,param_02));
	if(!isdefined(var_03))
	{
		var_03 = 0;
	}

	return var_03;
}

//Function Number: 13
storecameratargets(param_00)
{
	var_01 = getentarray("player_pos","targetname");
	param_00.camerhelperarray = [];
	foreach(var_03 in var_01)
	{
		param_00.camerhelperarray[param_00.camerhelperarray.size] = var_03;
	}

	foreach(var_03 in var_01)
	{
		var_06 = getent(var_03.target,"targetname");
		if(var_06.var_39B == "camera_target")
		{
			var_03.camera_lookat = var_06;
		}

		var_07 = getent(var_06.target,"targetname");
		if(var_07.var_39B == "camera")
		{
			var_03.camera_helper = var_07;
			var_07.camera_goal = var_03;
			var_07.camera_lookat = var_03.camera_lookat;
		}

		if(var_03.var_39B == "0")
		{
			level.camdirectionforward.last_camera_helper = var_03.camera_helper;
		}

		var_08 = int(var_03.var_39B);
		param_00.camerhelperarray[var_08] = var_03;
	}
}

//Function Number: 14
calc_target_dir(param_00,param_01,param_02)
{
	var_03 = param_01 - param_00;
	var_04 = length2d(var_03);
	var_05 = var_04 / sqrt(1 + param_02.cur_camoffset_ratio * param_02.cur_camoffset_ratio);
	var_06 = var_03[0] - param_02.cur_camoffset_ratio * var_03[1];
	var_07 = param_02.cur_camoffset_ratio * var_03[0] + var_03[1];
	var_08 = var_05 * vectornormalize((var_06,var_07,0));
	var_08 = var_08 + (0,0,var_03[2]);
	return var_08;
}

//Function Number: 15
hacky_get_delta_xrot(param_00,param_01)
{
	var_02 = param_01 - param_00.oldrotx;
	if(var_02 < -180)
	{
		var_02 = 360 + var_02;
	}
	else if(var_02 > 180)
	{
		var_02 = 360 - var_02;
	}

	param_00.oldrotx = param_01;
	return var_02;
}

//Function Number: 16
hacky_get_delta_yrot(param_00,param_01)
{
	var_02 = param_01 - param_00.oldroty;
	if(var_02 < -180)
	{
		var_02 = -1;
	}
	else if(var_02 > 180)
	{
		var_02 = 1;
	}
	else
	{
		var_02 = 0;
	}

	param_00.oldroty = param_01;
	return var_02;
}

//Function Number: 17
cammove(param_00,param_01,param_02,param_03)
{
	if(isdefined(self.cut))
	{
		self.var_2E6 = param_00;
		return;
	}

	self moveto(param_00,param_01,param_02,param_03);
}

//Function Number: 18
camrotate(param_00,param_01,param_02,param_03)
{
	if(isdefined(self.cut))
	{
		self.var_41 = param_00;
		return;
	}

	self rotateto(param_00,param_01,param_02,param_03);
}

//Function Number: 19
rotateavatartagcamera(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		var_02 = spawnstruct();
		var_02.camera_tag_origin = (-70.8,-691.3,502.2);
		var_02.camera_tag_angles = (0,87,0);
		return var_02;
	}

	var_03 = param_01 gettagorigin("TAG_STOWED_BACK");
	var_04 = param_01 gettagangles("TAG_STOWED_BACK");
	var_05 = param_01.spawn_angles[1] - param_01.var_41[1];
	var_06 = (0,0,1);
	var_07 = var_03 - param_01.var_2E6;
	var_08 = rotatepointaroundvector(var_06,var_07,var_05);
	var_09 = param_01.var_2E6 + var_08;
	param_01.camera_tag_origin = var_09;
	param_01.camera_tag_angles = (var_04[0],angleclamp360(var_04[1] + var_05),var_04[2]);
	var_02 = spawnstruct();
	var_09.camera_tag_origin = param_00.camera_tag_origin;
	var_09.camera_tag_angles = param_00.camera_tag_angles;
	return var_09;
}

//Function Number: 20
checkcamposition(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 2;
	}

	var_03 = distance(param_01,param_00.var_2E6);
	if(var_03 >= param_02)
	{
		return 1;
	}

	return 0;
}

//Function Number: 21
lobby_update_group_new(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		level.camdirectionforward.framedelay = level.camdirectionforward.old_vl_focus;
		var_04 = param_00.var_8CF9;
		if(isdefined(param_03))
		{
			var_04 = (0,param_03.var_41[1] + 180,0);
		}

		var_05 = param_00.var_8D2D;
		var_06 = distance(param_00.var_2E6,var_05);
		var_07 = var_06 / param_02.prelobby_movespeed;
		if(var_07 < 0.1)
		{
			var_07 = 0.1;
		}

		param_00 cammove(var_05,var_07,var_07 * 0.5,var_07 * 0.5);
		param_00 camrotate(var_04,var_07,var_07 * 0.5,var_07 * 0.5);
	}
	else
	{
		if(level.camdirectionforward.framedelay == level.camdirectionforward.old_vl_focus)
		{
			maps\mp\_vl_base::prep_for_controls(var_04,var_04.var_41);
		}

		var_04 = (0,87,0);
		if(isdefined(param_03.avatar_spawnpoint))
		{
			var_07 = (0,param_03.avatar_spawnpoint.var_41[1] + 180,0);
		}

		var_08 = param_03 gettagorigin("TAG_STOWED_BACK");
		if(!isdefined(param_01.camera_state))
		{
			param_01.camera_state = "stand";
		}

		if(param_01.camera_state == "crouch")
		{
			var_09 = param_01.avatar_spawnpoint.var_2E6 + anglestoforward(param_01.avatar_spawnpoint.var_41) * param_02.gamelobbygroup_camera_crouchdistance;
			var_0A = (var_09[0],var_09[1],param_02.gamelobbygroup_camera_crouchz);
		}
		else if(param_03.camera_state == "hunch")
		{
			var_09 = param_03.avatar_spawnpoint.var_2E6 + anglestoforward(param_03.avatar_spawnpoint.var_41) * var_04.gamelobbygroup_camera_hunchdistance;
			var_0A = (var_0A[0],var_0A[1],param_03.gamelobbygroup_camera_hunchz);
		}
		else if(param_03.camera_state == "stand")
		{
			var_09 = param_03.avatar_spawnpoint.var_2E6 + anglestoforward(param_03.avatar_spawnpoint.var_41) * var_04.gamelobbygroup_camera_normaldistance;
			var_0A = (var_0A[0],var_0A[1],param_03.gamelobbygroup_camera_normalz);
		}
		else if(param_03.camera_state == "zoom_high")
		{
			var_09 = param_03.avatar_spawnpoint.var_2E6 + anglestoforward(param_03.avatar_spawnpoint.var_41) * var_04.gamelobbygroup_camera_closedistance;
			var_0A = (var_0A[0],var_0A[1],param_03.gamelobbygroup_camera_upclosez);
		}
		else
		{
			var_09 = param_03.avatar_spawnpoint.var_2E6 + anglestoforward(param_03.avatar_spawnpoint.var_41) * var_04.gamelobbygroup_camera_normaldistance;
			var_0A = (var_0A[0],var_0A[1],param_03.gamelobbygroup_camera_normalz);
		}

		param_00.goal_location = var_0A;
		var_0B = 0;
		if(level.camdirectionforward.framedelay == 0)
		{
			var_0B = checkcamposition(param_00,var_0A,1.5);
		}

		param_02.cur_camoffset_ratio = param_02.gamelobbygroup_camoffset_angle_ratio;
		param_02.tgt_camoffset_ratio = param_02.gamelobbygroup_camoffset_angle_ratio;
		param_00 update_camera_params_ratio(param_02);
		var_0C = 0;
		var_0D = 0;
		var_06 = distance(param_00.var_2E6,var_0A);
		var_07 = var_06 / param_02.gamelobby_movespeed;
		if(var_07 < 0.1)
		{
			var_07 = 0.1;
		}

		var_0E = var_06 / param_02.gamelobby_movespeed * level.camdirectionforward.gamelobbygroup_movespeed_modifier;
		if(var_0E < 0.1)
		{
			var_0E = 0.1;
		}

		var_0F = 1;
		var_10 = getdvarint("virtualLobbyMode",0);
		if(var_10 != 2 && var_10 != 4 && var_10 != 3)
		{
			maps\mp\_vl_base::rightstickrotateavatar(param_01,0.5);
		}
		else if(var_10 == 4 || var_10 == 3)
		{
			maps\mp\_vl_base::prep_for_controls(param_01,param_01.var_41);
			param_00.cut = 1;
		}
		else if(var_10 == 2)
		{
			maps\mp\_vl_base::prep_for_controls(param_01,param_01.var_41);
		}

		if(level.camdirectionforward.framedelay > 0)
		{
			level.camdirectionforward.framedelay = level.camdirectionforward.framedelay - 1;
		}

		if(isdefined(param_01.avatar_spawnpoint) && isdefined(param_00.avatar_spawnpoint) && param_01.avatar_spawnpoint != param_00.avatar_spawnpoint)
		{
			param_00.lastavatarpositionent = param_00.avatar_spawnpoint;
			param_00.avatar_spawnpoint = param_01.avatar_spawnpoint;
			param_02.var_1C1 = "finding_new_position";
			var_0B = 1;
			param_00.finished = 0;
		}
		else if(var_0B == 1)
		{
			param_02.var_1C1 = "moving";
		}

		if(param_02.var_1C1 == "waiting")
		{
			if(var_0B == 1)
			{
				param_02.var_1C1 = "moving";
				param_00.finished = 1;
			}

			param_00.var_5508 = param_01.avatar_spawnpoint;
		}

		if(param_02.var_1C1 == "finding_new_position")
		{
			if(var_0B == 1)
			{
				param_00.lastavatarpositionent = param_00.avatar_spawnpoint;
				param_00.avatar_spawnpoint = param_01.avatar_spawnpoint;
				param_00.obstacles = [];
				var_11 = 16;
				foreach(var_13 in level.is_cao_agent)
				{
					var_14 = [];
					var_14["center"] = var_13.avatar_spawnpoint.var_2E6;
					var_14["radius"] = var_11;
					param_00.obstacles[param_00.obstacles.size] = var_14;
				}

				build_path_info(param_00,param_02,param_00.var_2E6,var_0A,var_04);
				param_00.fparams = calc_f_from_avatar(param_01);
				param_00.target_from_avatar = get_target_from_avatar(param_01);
				param_02.var_1C1 = "moving";
			}

			param_02.var_1C1 = "moving";
		}

		if(param_02.var_1C1 == "moving")
		{
			if(level.camdirectionforward.framedelay <= 0)
			{
				level.camdirectionforward.framedelay = 0;
				if(param_00.finished == 0)
				{
					if(isdefined(param_00.cut))
					{
						param_00 cammove(var_0A,var_07,var_0C,var_0D);
						param_00 camrotate(var_04,var_0F,var_0F * 0.5,var_0F * 0.5);
						param_00.finished = 1;
					}
					else
					{
						param_00.finished = update_camera_on_path(param_00,param_02);
					}
				}

				if(param_00.finished)
				{
					param_00 cammove(var_0A,var_0E,var_0E * 0.5,var_0E * 0.5);
					param_00 camrotate(var_04,var_0E,var_0E * 0.5,var_0E * 0.5);
					param_02.var_1C1 = "waiting";
				}
			}
		}

		level.var_328[0] set_avatar_dof();
	}

	if(isdefined(param_00.cut))
	{
		param_00 dontinterpolate();
		param_00.cut = undefined;
	}

	if(getdvarint("virtualLobbyReady",0) == 0)
	{
		wait(1);
		setdvar("virtualLobbyReady","1");
		thread setvirtuallobbypresentable();
	}
}

//Function Number: 22
setvirtuallobbypresentable()
{
	level notify("cancel_vlp");
	level endon("cancel_vlp");
	if(level.is_cao_agent.size > 0 && isdefined(level.is_cao_agent[0]) && isdefined(level.is_cao_agent[0].alias) && isweaponloaded(level.is_cao_agent[0].alias))
	{
		level.needtopresent = undefined;
		wait(0.5);
		setdvar("virtualLobbyPresentable","1");
		return;
	}

	level.needtopresent = 1;
}

//Function Number: 23
resetvirtuallobbypresentable()
{
	level notify("cancel_vlp");
	level endon("cancel_vlp");
	level.needtopresent = undefined;
	wait(0.25);
	setdvar("virtualLobbyPresentable","0");
}

//Function Number: 24
moveplayereyetocam(param_00)
{
	var_01 = level.var_328[0];
	var_02 = var_01 geteye();
	var_03 = var_02 - var_01.var_2E6;
	var_01 setorigin(param_00.var_2E6 - var_03,0);
	var_01 setplayerangles((var_01.var_41[0],param_00.var_41[1],var_01.var_41[2]));
}

//Function Number: 25
getaspectratio()
{
	var_00 = spawnstruct();
	var_01 = getdvar("r_mode","1280x720 [16:9]");
	var_02 = strtok(var_01," ");
	var_03 = strtok(var_02[0],"x");
	var_00.width = maps\mp\_utility::stringtofloat(var_03[0]);
	var_00.height = maps\mp\_utility::stringtofloat(var_03[1]);
	var_00.aspectratio = maps\mp\_utility::rounddecimalplaces(var_00.width / var_00.height,3);
	return var_00;
}

//Function Number: 26
getmodifiedrotationangle(param_00,param_01,param_02)
{
	if(abs(param_01 - param_00.rotation_total) > 100)
	{
		if(param_01 >= 270)
		{
			param_00.addtobaseangle = param_00.addtobaseangle + -360 * param_02;
			if(param_00.addtobaseangle == -360)
			{
				param_00.addtobaseangle = 0;
			}
		}

		if(param_01 <= 100)
		{
			param_00.addtobaseangle = param_00.addtobaseangle + 360 * param_02;
			if(param_00.addtobaseangle == 360)
			{
				param_00.addtobaseangle = 0;
			}
		}
	}

	param_00.rotation_total = param_01;
	var_03 = param_01 * param_02 + param_00.addtobaseangle;
	return var_03;
}

//Function Number: 27
cao_update(param_00,param_01,param_02)
{
	maps\mp\_vl_base::rightstickrotateavatar(param_01,0.5);
	param_02.caotolobbyframetimer = param_02.caotolobbyframedelay;
	var_03 = param_01.var_2E6 + (0,0,-20) + anglestoforward(param_01.spawn_angles) * 120;
	param_02.var_A3F0 = param_02.cao_camera_ratio;
	param_02.dist = param_02.cao_neardist + param_02.cao_fardist - param_02.cao_neardist * param_02.var_A3F0;
	var_04 = param_02.cao_camerazoff + param_02.cao_camerazoff_zoom * param_02.var_A3F0;
	var_05 = param_02.cao_targetzoff + param_02.cao_targetzoff_zoom * 1 - param_02.var_A3F0;
	param_02.tgt_camoffset_ratio = param_02.cao_camoffset_ratio + param_02.prelobby_ratio_zoom * param_02.var_A3F0 - 1;
	param_00 update_camera_params_ratio(param_02);
	var_06 = param_02.ch_cyl_zoff_near + param_02.ch_cyl_zoff_far - param_02.ch_cyl_zoff_near * param_02.var_A3F0;
	var_07 = param_01.var_2E6 + (0,0,var_05);
	var_08 = var_07 - var_03 + param_02.origin_offset;
	var_08 = param_02.dist * vectornormalize(var_08);
	var_08 = (var_08[0],var_08[1],-1 * var_04);
	var_08 = param_02.dist * vectornormalize(var_08);
	var_09 = var_07 - var_08;
	if(isdefined(level.caoavatarposoffset))
	{
		var_07 = var_07 + level.caoavatarposoffset;
		var_09 = var_09 + level.caoavatarposoffset;
	}

	var_0A = -1 * var_08;
	var_0B = vectortoangles(var_0A);
	param_02.angle = var_0B[1] - param_01.var_8CF9[1];
	var_0C = distance(param_00.var_2E6,var_09);
	var_0D = var_0C / param_02.prelobby_movespeed;
	if(var_0D < 0.1)
	{
		var_0D = 0.1;
	}

	param_00 cammove(var_09,var_0D,var_0D * 0.5,var_0D * 0.5);
	var_0E = calc_target_dir(var_09,var_07,param_02);
	var_0F = vectortoangles(var_0E);
	param_00 camrotate(var_0F,var_0D,var_0D * 0.5,var_0D * 0.5);
	if(isdefined(param_00.cut))
	{
		param_00 dontinterpolate();
		param_00.cut = undefined;
	}
}

//Function Number: 28
start_menu_update(param_00,param_01)
{
}

//Function Number: 29
clan_profile_update(param_00,param_01,param_02)
{
	var_03 = (0,87,0);
	if(isdefined(param_01.avatar_spawnpoint))
	{
		var_03 = (0,param_01.avatar_spawnpoint.var_41[1] + 180,0);
	}

	param_00 update_camera_params_ratio(param_02);
	var_04 = (14,0,0);
	var_05 = param_01.var_2E6 + var_04 + anglestoforward(param_01.avatar_spawnpoint.var_41) * 110;
	var_06 = (var_05[0],var_05[1],param_02.gamelobbygroup_camera_normalz);
	param_00.goal_location = var_06;
	var_07 = distance(param_00.var_2E6,var_06);
	var_08 = max(var_07 / param_02.gamelobby_movespeed,0.1);
	var_09 = 0.2;
	param_00 cammove(var_06,var_08,0,0);
	param_00 camrotate(var_03,var_09,0,0);
	maps\mp\_vl_base::rightstickrotateavatar(param_01,0.5);
}

//Function Number: 30
monitor_vl_mode_change()
{
	self endon("disconnect");
	for(;;)
	{
		var_00 = getdvarint("virtualLobbyMode",0);
		if(level.camdirectionforward.var_5D32 != "cao")
		{
			if(level.camdirectionforward.var_5D32 != "prelobby" && var_00 == 0)
			{
				level.camdirectionforward.var_60B0 = "game_lobby";
			}

			if(common_scripts\utility::string_find(level.camdirectionforward.var_5D32,"prelobby") >= 0 && var_00 == 1)
			{
				level.camdirectionforward.var_60B0 = "game_lobby";
			}
		}

		wait(0.05);
	}
}

//Function Number: 31
findpositionnum()
{
	var_00 = self.var_39B;
	var_00 = int(var_00);
	return var_00;
}

//Function Number: 32
monitor_player_removed()
{
	self waittill("disconnect");
	self.camera delete();
	maps\mp\_vl_base::vlprint("remove all ownerIds due to disconnect\n");
	foreach(var_01 in level.xuid2ownerid)
	{
		remove_avatar(var_01);
	}
}

//Function Number: 33
set_agent_values(param_00,param_01)
{
	maps\mp\agents\_agent_utility::set_agent_team(param_00);
	self.agent_gameparticipant = 0;
	self.isactive = 1;
	self.spawntime = gettime();
	self.issniper = 0;
	self.sessionteam = param_01;
}

//Function Number: 34
bot_disable_tactical_goals()
{
	self.disable_tactical_goals = 1;
	self.tactical_goals = [];
}

//Function Number: 35
wait_load_costume_show(param_00)
{
	if(isalive(param_00))
	{
		var_01 = isdefined(level.cac);
		var_02 = getdvarint("practiceroundgame") && param_00.ownerid != 0;
		if(!var_01 && !var_02)
		{
			show_avatar(param_00);
		}
	}
}

//Function Number: 36
wait_load_costume_timeout(param_00,param_01)
{
	self endon("disconnect");
	param_01 endon("wait_load_costume");
	param_01 endon("death");
	wait(param_00);
	wait_load_costume_show(param_01);
	param_01 notify("wait_load_costume");
}

//Function Number: 37
wait_load_costume(param_00,param_01)
{
	self endon("disconnect");
	param_00 notify("wait_load_costume");
	param_00 endon("wait_load_costume");
	param_00 endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	hide_avatar(param_00);
	thread wait_load_costume_timeout(5,param_00);
	var_02 = self method_84EF(param_00.costume,param_00.inliveplayerkillstreak);
	while(!var_02)
	{
		wait(0.1);
		var_02 = self method_84EF(param_00.costume,param_00.inliveplayerkillstreak);
	}

	if(param_01)
	{
		wait_load_costume_show(param_00);
	}

	param_00 notify("wait_load_costume");
}

//Function Number: 38
spawn_an_avatar(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B)
{
	if(!isdefined(param_0A))
	{
		param_0A = 0;
	}

	if(!isdefined(param_0B))
	{
		param_0B = 0;
	}

	var_0C = !param_0B;
	var_0D = "spectator";
	var_0E = "none";
	var_0F = maps\mp\_vl_base::alloc_avatar();
	param_00.spawned_avatar = var_0F;
	var_0F.avatar_spawnpoint = param_00;
	var_0F.costume = param_07;
	var_0F.activecostume = 0;
	var_0F.rotation_offset = 0;
	var_0F set_agent_values(var_0D,var_0E);
	var_10 = getgroundposition(var_0F.avatar_spawnpoint.var_2E6,20,512,120);
	var_0F.spawn_angles = (param_00.var_41[0],param_00.var_41[1] + var_0F.rotation_offset,param_00.var_41[2]);
	var_0F.var_41 = var_0F.spawn_angles;
	if(!param_0B)
	{
		var_0F show();
	}

	var_0F.ownerid = param_09;
	var_0F setplayerangles(var_0F.spawn_angles);
	var_0F setorigin(var_10,1);
	var_0F.var_41 = var_0F.spawn_angles;
	var_0F.var_8CF9 = var_0F.spawn_angles;
	var_0F.storedangley = var_0F.var_41[1];
	var_0F.mouserot = 0;
	var_0F.storedrightsticky = 0;
	var_0F.rotation_total = 0;
	var_0F.addtobaseangle = 0;
	var_0F.rotation_parent = spawn("script_origin",var_0F.var_2E6);
	var_0F.camera_cut = 1;
	var_0F.camera_tag_origin = (0,0,0);
	var_0F.camera_tag_angles = (0,0,0);
	var_0F method_83FC();
	if(!isdefined(self.spawned_avatar))
	{
		self.spawned_avatar = var_0F;
	}

	var_0F enableanimstate(1);
	if(param_0A == 1)
	{
		var_0F.var_5006 = 1;
		param_01 = undefined;
		var_0F.alias = undefined;
		param_03 = undefined;
		var_0F use_animstate("cao_01",1,"lobby_idle");
	}
	else if(param_0B == 1)
	{
		param_01 = undefined;
		var_0F.alias = undefined;
		param_03 = undefined;
		var_0F use_animstate("cao_01",1,"lobby_idle");
	}
	else
	{
		level.is_cao_agent[param_09] = var_0F;
		var_11 = var_0F getanimdata(param_03);
		var_0F use_animstate(var_11.var_9D6,1,var_11.animstate);
		var_0F thread checkweapchange(param_01);
	}

	var_0F maps\mp\gametypes\_spawnlogic::addtocharactersarray();
	if(isalive(var_0F))
	{
		vl_avatar_loadout(undefined,param_09,param_01,param_02,param_03,param_04,param_05,param_06,param_07,var_0F);
		if(level.var_328.size > 0)
		{
			level.var_328[0] thread wait_load_costume(var_0F,var_0C);
		}
	}

	if(isdefined(level.cac))
	{
	}

	if((getdvarint("practiceroundgame") && param_09 != 0) || param_0B)
	{
		hide_avatar(var_0F);
	}
	else
	{
		show_avatar(var_0F);
	}

	return var_0F;
}

//Function Number: 39
checkweapchange(param_00)
{
	self endon("disconnect");
	self endon("death");
	self endon("free_avatar");
	if(!isdefined(self.alias))
	{
		self.alias = param_00;
	}

	self.stored_weapon = self.alias;
	var_01 = undefined;
	for(;;)
	{
		if(!isdefined(self.primaryweaponent) || !isdefined(self.var_9AE))
		{
			wait(0.05);
			continue;
		}

		if(isdefined(self) && isdefined(self.alias) && isalive(self))
		{
			var_02 = strtok(self.alias,"_");
			if((issubstr(var_02[1],"dlcgun3") || var_02[1] == "dlcgun10loot5" || var_02[1] == "dlcgun5loot5") && common_scripts\utility::array_contains(var_02,"akimbo"))
			{
				var_01 = var_02[0] + "_" + var_02[1] + "_akimbo";
			}
			else
			{
				var_01 = var_02[0] + "_" + var_02[1];
			}
		}

		var_03 = self getanimentry();
		var_04 = self getanimentry("lobby_idle","cao_01");
		var_05 = getanimdata(var_01);
		var_06 = self getanimentry(var_05.animstate,var_05.var_9D6);
		if(isdefined(level.camdirectionforward.var_5D32))
		{
			if(level.camdirectionforward.var_60B0 != "cao" && level.camdirectionforward.var_5D32 != "cao")
			{
				if(isdefined(self) && isdefined(var_01) && isalive(self))
				{
					var_09 = isweaponloaded(self.alias);
					var_0A = self.stored_weapon != self.alias;
					var_0B = var_0A || var_03 != var_06;
					var_0C = getweaponbasename(self.stored_weapon) != getweaponbasename(self.alias);
					if(var_0B)
					{
						if(var_09)
						{
							if(var_0C)
							{
								hide_avatar_primary_weapon(self);
								hide_avatar_akimbo_weapon(self);
								thread attachweapondelayed(self);
								thread showprimarydelayed(self);
							}

							self.primaryweaponent method_8483(self.alias);
							self.var_9AE method_8483(self.alias);
							if(issubstr(self.alias,"akimbo") || issubstr(self.alias,"akimboxmg"))
							{
								if(var_0C)
								{
									thread showakimbodelayed(self);
								}
							}
							else
							{
								self.var_9AE hide();
								self.var_9AE hideallparts();
							}

							self.stored_weapon = self.alias;
							var_05 = getanimdata(var_01);
							self.camera_state = var_05.camera_state;
							thread animdelayed(var_05.var_9D6,var_05.animstate);
							thread vl_vfx_for_avatar();
						}
						else
						{
						}
					}
				}
			}
		}

		wait(0.5);
	}
}

//Function Number: 40
isweaponloaded(param_00)
{
	var_01 = 0;
	if(level.var_328.size > 0)
	{
		var_01 = level.var_328[0] method_8535(param_00);
		if(!var_01)
		{
			level.var_328[0] method_8511(param_00);
		}
	}

	return var_01;
}

//Function Number: 41
attachweapondelayed(param_00)
{
	wait(level.camdirectionforward.cacweaponattachdelaytime);
	attachprimaryweapon(param_00);
}

//Function Number: 42
animdelayed(param_00,param_01)
{
	wait(level.camdirectionforward.cacweaponanimdelaytime);
	use_animstate(param_00,undefined,param_01);
}

//Function Number: 43
getanimdata(param_00)
{
	var_01 = spawnstruct();
	var_01.var_9D6 = param_00;
	if(isdefined(param_00) && param_00 != "" && param_00 != "none")
	{
		var_01.animstate = tablelookup("mp/vlobby_cac_offsets.csv",0,param_00,5);
		var_01.camera_state = tablelookup("mp/vlobby_cac_offsets.csv",0,param_00,6);
		if(isdefined(var_01.camera_state))
		{
			self.camera_state = var_01.camera_state;
		}
	}

	if(!isdefined(var_01.animstate) || var_01.animstate == "")
	{
		var_01.animstate = "lobby_idle";
		var_01.var_9D6 = "cao_01";
		var_01.camera_state = "stand";
	}

	self setanimclass("vlobby_animclass");
	if(!isdefined(var_01.camera_state))
	{
		var_01.camera_state = "stand";
	}

	if(!isdefined(self.camera_state))
	{
		self.camera_state = var_01.camera_state;
	}

	return var_01;
}

//Function Number: 44
vl_give_weapons(param_00,param_01)
{
	if(param_01.isfree)
	{
		return;
	}

	addlaunchers(param_01);
	if(!isdefined(param_01.alias))
	{
		return;
	}

	if(!isdefined(param_01.var_C4C))
	{
		return;
	}

	if(param_01.alias != "none")
	{
		if(!isdefined(param_01.primaryweaponent))
		{
			var_02 = spawn("weapon_" + param_01.alias,(0,0,0));
			var_03 = get_xuid_for_avatar(param_01);
			function_02D4(var_02,var_03);
			param_01.primaryweaponent = var_02;
			var_02.alias = param_01.alias;
			param_01.primaryweaponent show();
			param_01.primaryweaponent showallparts();
			param_01.primaryweaponent method_8483(param_01.alias);
			attachprimaryweapon(param_01);
		}
		else if(param_01.primaryweaponent.alias != param_01.alias)
		{
			param_01.primaryweaponent.alias = param_01.alias;
		}

		if(!isdefined(param_01.var_9AE))
		{
			var_04 = spawn("weapon_" + param_01.alias,(0,0,0));
			var_03 = get_xuid_for_avatar(param_01);
			function_02D4(var_04,var_03);
			param_01.var_9AE = var_04;
			var_04.alias = param_01.alias;
		}
		else if(param_01.var_9AE.alias != param_01.alias)
		{
			param_01.var_9AE.alias = param_01.alias;
		}

		var_05 = "tag_weapon_left";
		if(issubstr(param_01.var_9AE.alias,"combatknife"))
		{
			var_05 = "tag_inhand";
		}

		if(issubstr(param_01.var_9AE.alias,"riotshield"))
		{
			var_05 = "tag_weapon_left";
		}

		param_01.var_9AE unlink();
		param_01.var_9AE.var_2E6 = param_01 gettagorigin(var_05);
		param_01.var_9AE.var_41 = param_01 gettagangles(var_05);
		param_01.var_9AE method_8446(param_01,var_05);
		param_01.var_9AE method_8530(param_00);
		if(issubstr(param_01.primaryweaponent.alias,"akimbo") || issubstr(param_01.primaryweaponent.alias,"akimboxmg"))
		{
			thread showakimbodelayed(param_01);
		}
		else if(!isdefined(param_01.stored_weapon))
		{
			param_01.var_9AE hide();
			param_01.var_9AE hideallparts();
		}
	}

	if(param_01.secondaryweapon != "none")
	{
		if(issubstr(param_01.secondaryweapon,"combatknife"))
		{
			if(isdefined(param_01.var_7BF7))
			{
				if(param_01.var_7BF7 islinked())
				{
					param_01.var_7BF7 unlink();
				}

				param_01.var_7BF7 delete();
				return;
			}

			return;
		}

		if(!isdefined(param_01.var_7BF7))
		{
			var_06 = spawn("weapon_" + param_01.secondaryweapon,(0,0,0));
			var_03 = get_xuid_for_avatar(param_01);
			function_02D4(var_06,var_03);
			param_01.var_7BF7 = var_06;
			var_06.secondaryweapon = param_01.secondaryweapon;
		}
		else if(param_01.var_7BF7.secondaryweapon != param_01.secondaryweapon)
		{
			param_01.var_7BF7 method_8483(param_01.secondaryweapon);
			param_01.var_7BF7.secondaryweapon = param_01.secondaryweapon;
		}

		var_07 = "tag_stowed_back";
		param_01.var_7BF7 unlink();
		param_01.var_7BF7.var_2E6 = param_01 gettagorigin(var_07);
		param_01.var_7BF7.var_41 = param_01 gettagangles(var_07);
		param_01.var_7BF7 method_8446(param_01,var_07);
		param_01.var_7BF7 showallparts();
		param_01.var_7BF7 method_8530(param_00);
		return;
	}
}

//Function Number: 45
attachprimaryweapon(param_00)
{
	var_01 = undefined;
	if(isdefined(param_00.var_31D))
	{
		var_01 = param_00.var_31D;
	}

	var_02 = "tag_weapon_right";
	if(issubstr(param_00.primaryweaponent.alias,"combatknife"))
	{
		var_02 = "tag_inhand";
	}

	if(issubstr(param_00.primaryweaponent.alias,"riotshield"))
	{
		var_02 = "tag_weapon_left";
	}

	param_00.primaryweaponent unlink();
	param_00.primaryweaponent.var_2E6 = param_00 gettagorigin(var_02);
	param_00.primaryweaponent.var_41 = param_00 gettagangles(var_02);
	param_00.primaryweaponent method_8446(param_00,var_02);
	param_00.primaryweaponent method_8530(var_01);
}

//Function Number: 46
addlaunchers(param_00)
{
	param_00 detach("npc_exo_arm_launcher_R","J_Elbow_RI",0);
	param_00 detach("npc_exo_arm_launcher_L","J_Elbow_LE",0);
	if(isdefined(param_00.lethal) && param_00.lethal != "specialty_null")
	{
		if(!param_00 maps\mp\_utility::_hasperk("specialty_wildcard_dualtacticals"))
		{
			param_00 attach("npc_exo_arm_launcher_R","J_Elbow_RI",1);
		}
		else
		{
		}
	}

	if(isdefined(param_00.tactical) && param_00.tactical != "specialty_null")
	{
		if(param_00 maps\mp\_utility::_hasperk("specialty_wildcard_duallethals"))
		{
			param_00 attach("npc_exo_arm_launcher_L","J_Elbow_LE",1);
			return;
		}
	}
}

//Function Number: 47
showakimbodelayed(param_00)
{
	param_00 endon("death");
	param_00.primaryweaponent endon("death");
	param_00 endon("hide_akimbo_weapon");
	wait(level.camdirectionforward.cacweapondelaytime);
	if(level.camdirectionforward.var_60B0 != "cao" && level.camdirectionforward.var_5D32 != "cao")
	{
		if(issubstr(param_00.primaryweaponent.alias,"akimbo") || issubstr(param_00.primaryweaponent.alias,"akimboxmg"))
		{
			param_00.var_9AE show();
			param_00.var_9AE showallparts();
		}
	}
}

//Function Number: 48
showprimarydelayed(param_00)
{
	param_00 endon("death");
	param_00.primaryweaponent endon("death");
	param_00 endon("hide_primary_weapon");
	wait(level.camdirectionforward.cacweapondelaytime);
	if(param_00.isfree)
	{
		return;
	}

	var_01 = getdvarint("practiceroundgame") && param_00.ownerid != 0;
	if(level.camdirectionforward.var_60B0 != "cao" && level.camdirectionforward.var_5D32 != "cao" && !var_01)
	{
		param_00.primaryweaponent show();
		param_00.primaryweaponent showallparts();
	}
}

//Function Number: 49
vl_avatar_costume(param_00,param_01,param_02)
{
	param_00 takeallweapons();
	param_00 detachall();
	param_00.headmodel = undefined;
	if(isdefined(param_01))
	{
		param_00.costume = param_01;
	}

	if(!isdefined(param_00.costume) || !maps\mp\gametypes\_teams::validcostume(param_00.costume))
	{
		if(isdefined(param_00.cam_percent_away) && maps\mp\gametypes\_teams::validcostume(param_00.cam_percent_away))
		{
			param_00.costume = param_00.cam_percent_away;
		}
		else
		{
			param_00.costume = maps\mp\gametypes\_teams::getdefaultcostume();
			param_00.cam_percent_away = param_00.costume;
		}
	}

	if(isdefined(param_02) && param_02)
	{
		level.var_328[0].costume = param_00.costume;
		var_03 = level.var_328[0] maps\mp\gametypes\_teams::playercostume();
		var_03 = param_00 maps\mp\gametypes\_teams::playercostume();
		var_04 = level.var_328[0].var_1B06;
		vl_avatar_costume(var_04,param_00.costume);
		var_03 = var_04 maps\mp\gametypes\_teams::playercostume();
	}
}

//Function Number: 50
vl_avatar_loadout(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	if(!isdefined(param_09))
	{
		param_09 = level.is_cao_agent[param_01];
	}

	var_0A = 0;
	if(isdefined(param_09.loadout) && param_09.loadout.var_31E >= 0)
	{
		var_0A = 1;
	}

	vl_avatar_costume(param_09,param_08);
	param_09 maps\mp\gametypes\_teams::playermodelforweapon(param_04,maps\mp\_utility::getbaseweaponname(param_03));
	if(var_0A && isdefined(level.var_328[0]))
	{
		level.var_328[0] method_84BA(param_09.costume);
	}

	param_09.alias = param_02;
	param_09.secondaryweapon = "none";
	param_09.tactical = param_06;
	param_09.lethal = param_05;
	param_09.perks = param_07;
	vl_give_weapons(param_00,param_09);
	param_09 thread vl_vfx_for_avatar();
}

//Function Number: 51
monitor_class_select_or_weapon_change(param_00)
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("luinotifyserver",var_01,var_02);
		if((var_01 == "classpreview" || var_01 == "classpreview_postcopy") && isdefined(var_02))
		{
			if(var_02 >= 0)
			{
				var_03 = var_02 & 15;
				var_04 = int(var_02 / 16);
				maps\mp\_vl_base::vlprint("classpreview " + var_01 + " controller=" + var_03 + "  class=" + var_04);
				if(var_04 > 0)
				{
					level.cac = 1;
					self.currentselectedclass = var_04 - 1;
				}

				param_00 = getfocusfromcontroller(var_03);
				var_05 = var_01 == "classpreview_postcopy";
				var_06 = level.is_cao_agent[param_00];
				if(isdefined(var_06))
				{
					level.var_9E99 = param_00;
					level.var_9E9F = param_00;
					virtual_lobby_set_class(param_00,"lobby" + self.currentselectedclass + 1,!var_05);
					level.cac_weapon = var_06.alias;
				}

				level.var_39AB = var_05;
				continue;
			}

			level.cac = undefined;
		}
	}
}

//Function Number: 52
monitor_cac_set_weapon(param_00,param_01)
{
	var_02 = "";
	if(param_01 != "current" && param_01 != "none" && var_02 == "")
	{
		var_03 = tablelookup("mp/statstable.csv",4,param_01,40);
		if(var_03 == "")
		{
			var_03 = "none";
		}

		var_04 = maps\mp\gametypes\_class::buildweaponname(param_01,var_03,"none","none");
	}
	else if(var_02 == "none")
	{
		var_04 = "none";
	}
	else
	{
		var_05 = level.is_cao_agent[param_01];
		var_04 = var_05.alias;
	}

	level.cac_weapon = var_04;
}

//Function Number: 53
has_suffix(param_00,param_01)
{
	if(param_00.size >= param_01.size)
	{
		if(getsubstr(param_00,param_00.size - param_01.size,param_00.size) == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 54
monitor_create_a_class(param_00)
{
	self endon("disconnect");
	var_01 = [];
	while(!isdefined(level.camdirectionforward))
	{
		self waittill("luinotifyserver",var_02,var_03);
		if(isdefined(var_03))
		{
			var_01[var_01.size] = [var_02,var_03];
			continue;
		}

		var_01[var_01.size] = [var_02];
	}

	for(;;)
	{
		if(var_01.size > 0)
		{
			var_04 = var_01[0];
			var_05 = [];
			for(var_06 = 1;var_06 < var_01.size;var_06++)
			{
				var_05[var_05.size] = var_01[var_06];
			}

			var_01 = var_05;
			var_02 = var_04[0];
			if(var_04.size > 1)
			{
				var_03 = var_04[1];
			}
			else
			{
				var_03 = undefined;
			}
		}
		else
		{
			self waittill("luinotifyserver",var_02,var_03);
		}

		if(var_02 == "cac" && isdefined(var_03))
		{
			if(var_03 == 0)
			{
				level.cac = undefined;
			}
			else
			{
				level.cac = 1;
			}

			level.prv_cac_weapon = undefined;
			continue;
		}

		if(var_02 == "weapon_highlighted" && isdefined(var_03))
		{
			if(issubstr(var_03,"stream:"))
			{
				var_07 = strtok(var_03,":");
				if(var_07.size > 1)
				{
					var_08 = var_07[var_07.size - 1];
					if(!has_suffix(var_08,"_mp"))
					{
						var_08 = var_08 + "_mp";
					}

					maps\mp\_vl_base::vlprintln("weapon_stream: " + var_08);
					var_09 = [var_08];
					self method_8511(var_09);
				}

				monitor_cac_set_weapon(param_00,"none");
			}
			else
			{
				maps\mp\_vl_base::vlprintln("weapon_highlighted  " + var_03);
				monitor_cac_set_weapon(param_00,var_03);
			}

			continue;
		}

		if(var_02 == "lootscreen_weapon_highlighted" && isdefined(var_03))
		{
			if(var_03 == "none")
			{
				level.cac = undefined;
			}
			else if(var_03 == "reset")
			{
				level.cac = 1;
			}
			else
			{
				level.cac = 1;
			}

			level.prv_cac_weapon = undefined;
			continue;
		}

		var_0A = 0;
		if(var_02 == "preview_attach1")
		{
			var_0A = 1;
		}
		else if(var_02 == "preview_attach2")
		{
			var_0A = 2;
		}
		else if(var_02 == "preview_attach3")
		{
			var_0A = 3;
		}

		if(var_0A > 0 && isdefined(var_03))
		{
			var_0B = level.is_cao_agent[param_00];
			var_0C = var_0B.loadout;
			var_0D = tablelookup("mp/statstable.csv",0,var_0C.primary,4);
			var_0E = tablelookup("mp/attachmenttable.csv",0,var_0C.primaryattachment1,3);
			var_0F = tablelookup("mp/attachmenttable.csv",0,var_0C.primaryattachment2,3);
			var_10 = tablelookup("mp/attachmenttable.csv",0,var_0C.primaryattachment3,3);
			var_11 = var_0C.primarycamo;
			if(var_03 != "current")
			{
				if(var_0A == 1)
				{
					var_0E = var_03;
				}
				else if(var_0A == 2)
				{
					var_0F = var_03;
				}
				else if(var_0A == 3)
				{
					var_10 = var_03;
				}
			}

			level.cac_weapon = maps\mp\gametypes\_class::buildweaponname(var_0D,var_0E,var_0F,var_10,var_11,undefined);
		}
	}
}

//Function Number: 55
getfocusfromcontroller(param_00)
{
	foreach(var_03, var_02 in level.is_cao_agent)
	{
		if(isdefined(var_02.loadout) && isdefined(var_02.loadout.var_31E) && var_02.loadout.var_31E == param_00)
		{
			return var_03;
		}
	}

	maps\mp\_vl_base::vlprintln("unable to find avatar for controller " + param_00);
	return -1;
}

//Function Number: 56
virtual_lobby_set_class(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(self.connectedpostgame["class"]) && self.connectedpostgame["class"] == param_01 && !isdefined(param_03) || !param_03)
	{
		return;
	}

	self.connectedpostgame["class"] = param_01;
	self.class = param_01;
	maps\mp\gametypes\_class::setclass(self.connectedpostgame["class"]);
	self.tag_stowed_back = undefined;
	self.tag_stowed_hip = undefined;
	maps\mp\gametypes\_class::giveandapplyloadout(self.connectedpostgame["team"],self.connectedpostgame["class"]);
	if(param_02)
	{
		vl_avatar_loadout(self,param_00,self.alias,self.secondaryweapon,self.connectedpostgame["primaryWeapon"],self.loadoutequipment,self.loadoutoffhand,self.perks,self.costume);
		if(isdefined(self.var_1B06))
		{
			vl_avatar_loadout(self,param_00,undefined,self.secondaryweapon,self.connectedpostgame["primaryWeapon"],self.loadoutequipment,self.loadoutoffhand,self.perks,self.costume,self.var_1B06);
		}
	}
}

//Function Number: 57
grab_players_classes()
{
	var_00 = ["privateMatchCustomClasses","customClasses"];
	var_01 = [60,60];
	var_02 = 0;
	self.loadouts = [];
	self.currentselectedclass = 0;
	foreach(var_04 in var_00)
	{
		level.forcecustomclassloc = var_04;
		self.loadouts[var_04] = [];
		var_05 = var_01[var_02];
		var_02++;
		for(var_06 = 0;var_06 < var_05;var_06++)
		{
			var_07 = [];
			var_07["primary"] = maps\mp\gametypes\_class::cac_getweapon(var_06,0);
			var_07["primaryAttachment1"] = maps\mp\gametypes\_class::cac_getweaponattachment(var_06,0);
			var_07["primaryAttachment2"] = maps\mp\gametypes\_class::cac_getweaponattachmenttwo(var_06,0);
			var_07["primaryAttachment3"] = maps\mp\gametypes\_class::cac_getweaponattachmentthree(var_06,0);
			var_07["primaryCamo"] = maps\mp\gametypes\_class::cac_getweaponcamo(var_06,0);
			var_07["primaryReticle"] = maps\mp\gametypes\_class::cac_getweaponreticle(var_06,0);
			for(var_08 = 0;var_08 < 6;var_08++)
			{
				var_07["perk" + var_08] = maps\mp\gametypes\_class::cac_getperk(var_06,var_08);
			}

			for(var_08 = 0;var_08 < 3;var_08++)
			{
				var_07["wildcard" + var_08] = maps\mp\gametypes\_class::cac_getwildcard(var_06,var_08);
			}

			var_07["secondary"] = maps\mp\gametypes\_class::cac_getweapon(var_06,1);
			var_07["secondaryAttachment1"] = maps\mp\gametypes\_class::cac_getweaponattachment(var_06,1);
			var_07["secondaryAttachment2"] = maps\mp\gametypes\_class::cac_getweaponattachmenttwo(var_06,1);
			var_07["secondaryAttachment3"] = maps\mp\gametypes\_class::cac_getweaponattachmentthree(var_06,1);
			var_07["secondaryCamo"] = maps\mp\gametypes\_class::cac_getweaponcamo(var_06,1);
			var_07["secondaryReticle"] = maps\mp\gametypes\_class::cac_getweaponreticle(var_06,1);
			var_07["equipment"] = maps\mp\gametypes\_class::cac_getequipment(var_06,0);
			var_07["offhand"] = maps\mp\gametypes\_class::cac_getequipment(var_06,1);
			self.loadouts[var_04][var_06] = var_07;
		}
	}

	level.forcecustomclassloc = undefined;
}

//Function Number: 58
update_local_class(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D,param_0E,param_0F,param_10,param_11,param_12,param_13,param_14,param_15)
{
	var_16 = int(self.currentselectedclass);
	var_17 = maps\mp\_utility::cac_getcustomclassloc();
	self.loadouts[var_17][var_16]["primary"] = param_00;
	self.loadouts[var_17][var_16]["primaryAttachment1"] = param_01;
	self.loadouts[var_17][var_16]["primaryAttachment2"] = param_02;
	self.loadouts[var_17][var_16]["primaryAttachment3"] = param_03;
	self.loadouts[var_17][var_16]["primaryCamo"] = param_04;
	self.loadouts[var_17][var_16]["primaryReticle"] = param_05;
	self.loadouts[var_17][var_16]["secondary"] = param_06;
	self.loadouts[var_17][var_16]["secondaryAttachment1"] = param_07;
	self.loadouts[var_17][var_16]["secondaryAttachment2"] = param_08;
	self.loadouts[var_17][var_16]["secondaryCamo"] = param_09;
	self.loadouts[var_17][var_16]["secondaryReticle"] = param_0A;
	self.loadouts[var_17][var_16]["equipment"] = param_0B;
	self.loadouts[var_17][var_16]["lethal"] = param_0B;
	self.loadouts[var_17][var_16]["offhand"] = param_0C;
	self.loadouts[var_17][var_16]["tactical"] = param_0C;
	self.loadouts[var_17][var_16]["wildcard0"] = param_0D;
	self.loadouts[var_17][var_16]["wildcard1"] = param_0E;
	self.loadouts[var_17][var_16]["wildcard2"] = param_0F;
	self.loadouts[var_17][var_16]["perk0"] = param_10;
	self.loadouts[var_17][var_16]["perk1"] = param_11;
	self.loadouts[var_17][var_16]["perk2"] = param_12;
	self.loadouts[var_17][var_16]["perk3"] = param_13;
	self.loadouts[var_17][var_16]["perk4"] = param_14;
	self.loadouts[var_17][var_16]["perk5"] = param_15;
}

//Function Number: 59
loadout_changed(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return 1;
	}

	if(param_00.primary != param_01.primary)
	{
		return 1;
	}

	if(param_00.primaryattachment1 != param_01.primaryattachment1)
	{
		return 1;
	}

	if(param_00.primaryattachment2 != param_01.primaryattachment2)
	{
		return 1;
	}

	if(param_00.primaryattachment3 != param_01.primaryattachment3)
	{
		return 1;
	}

	if(param_00.primarycamo != param_01.primarycamo)
	{
		return 1;
	}

	if(param_00.secondary != param_01.secondary)
	{
		return 1;
	}

	if(param_00.secondaryattachment1 != param_01.secondaryattachment1)
	{
		return 1;
	}

	if(param_00.secondaryattachment2 != param_01.secondaryattachment2)
	{
		return 1;
	}

	if(param_00.secondarycamo != param_01.secondarycamo)
	{
		return 1;
	}

	if(param_00.tactical != param_01.tactical)
	{
		return 1;
	}

	if(param_00.lethal != param_01.lethal)
	{
		return 1;
	}

	return 0;
}

//Function Number: 60
costume_changed(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		if(!isdefined(param_01))
		{
			return 0;
		}

		return 1;
	}

	if(param_00.size != param_01.size)
	{
		return 1;
	}

	if(!maps\mp\gametypes\_teams::validcostume(param_01))
	{
		return 0;
	}

	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		if(param_01[var_02] < 0)
		{
			return 0;
		}

		if(param_00[var_02] != param_01[var_02])
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 61
setdefaultcostumeifneeded(param_00)
{
	if(param_00[level.costumecat2idx["head"]] == 0)
	{
		param_00[level.costumecat2idx["head"]] = 1;
	}

	if(!param_00[level.costumecat2idx["shirt"]])
	{
		param_00[level.costumecat2idx["shirt"]] = 1;
	}

	if(!param_00[level.costumecat2idx["pants"]])
	{
		param_00[level.costumecat2idx["pants"]] = 1;
	}

	if(!param_00[level.costumecat2idx["gloves"]])
	{
		param_00[level.costumecat2idx["gloves"]] = 1;
	}

	if(!param_00[level.costumecat2idx["shoes"]])
	{
		param_00[level.costumecat2idx["shoes"]] = 1;
	}

	if(!param_00[level.costumecat2idx["gear"]])
	{
		param_00[level.costumecat2idx["gear"]] = 1;
	}

	if(!param_00[level.costumecat2idx["exo"]])
	{
		param_00[level.costumecat2idx["exo"]] = 1;
	}

	return param_00;
}

//Function Number: 62
monitor_member_class_changes()
{
	level.mccqueue = [];
	for(;;)
	{
		while(!isdefined(level.var_328) || level.var_328.size == 0 || !isdefined(level.camdirectionforward))
		{
			wait(0.05);
		}

		while(isdefined(level.var_328) && level.var_328.size > 0)
		{
			foreach(var_01 in level.mccqueue)
			{
				var_02 = tablelookup("mp/statstable.csv",0,var_01.primary,4);
				var_03 = tablelookup("mp/attachmenttable.csv",0,var_01.primaryattachment1,3);
				var_04 = tablelookup("mp/attachmenttable.csv",0,var_01.primaryattachment2,3);
				var_05 = tablelookup("mp/attachmenttable.csv",0,var_01.primaryattachment3,3);
				var_06 = var_01.primarycamo;
				var_07 = tablelookup("mp/camoTable.csv",0,var_01.primarycamo,1);
				var_08 = var_01.primaryreticle;
				var_09 = tablelookup("mp/reticleTable.csv",0,var_01.primaryreticle,1);
				var_0A = tablelookup("mp/statstable.csv",0,var_01.secondary,4);
				var_0B = tablelookup("mp/attachmenttable.csv",0,var_01.secondaryattachment1,3);
				var_0C = tablelookup("mp/attachmenttable.csv",0,var_01.secondaryattachment2,3);
				var_0D = "none";
				var_0E = var_01.secondarycamo;
				var_0F = tablelookup("mp/camoTable.csv",0,var_01.secondarycamo,1);
				var_10 = var_01.secondaryreticle;
				var_11 = tablelookup("mp/reticleTable.csv",0,var_01.secondaryreticle,1);
				var_12 = tablelookup("mp/perktable.csv",0,var_01.lethal,1);
				var_13 = tablelookup("mp/perktable.csv",0,var_01.tactical,1);
				var_14 = tablelookup("mp/perktable.csv",0,var_01.wildcard1,1);
				var_15 = tablelookup("mp/perktable.csv",0,var_01.wildcard2,1);
				var_16 = tablelookup("mp/perktable.csv",0,var_01.wildcard3,1);
				var_17 = tablelookup("mp/perktable.csv",0,var_01.perk1,1);
				var_18 = tablelookup("mp/perktable.csv",0,var_01.perk2,1);
				var_19 = tablelookup("mp/perktable.csv",0,var_01.perk3,1);
				var_1A = tablelookup("mp/perktable.csv",0,var_01.perk4,1);
				var_1B = tablelookup("mp/perktable.csv",0,var_01.perk5,1);
				var_1C = tablelookup("mp/perktable.csv",0,var_01.perk6,1);
				var_1D = maps\mp\gametypes\_class::buildweaponname(var_02,var_03,var_04,var_05,var_06,var_08);
				var_1E = maps\mp\gametypes\_class::buildweaponname(var_0A,var_0B,var_0C,var_0D,var_0E,var_10);
				var_1F = maps\mp\_utility::getbaseweaponname(var_1D);
				var_20 = [];
				var_20[level.costumecat2idx["gender"]] = var_01.gender;
				var_20[level.costumecat2idx["shirt"]] = var_01.shirt;
				var_20[level.costumecat2idx["head"]] = var_01.head;
				var_20[level.costumecat2idx["pants"]] = var_01.pants;
				var_20[level.costumecat2idx["eyewear"]] = var_01.eyewear;
				var_20[level.costumecat2idx["hat"]] = var_01.hat;
				var_20[level.costumecat2idx["kneepads"]] = var_01.kneepads;
				var_20[level.costumecat2idx["gloves"]] = var_01.gloves;
				var_20[level.costumecat2idx["shoes"]] = var_01.shoes;
				var_20[level.costumecat2idx["gear"]] = var_01.gear;
				var_20[level.costumecat2idx["exo"]] = var_01.exo;
				var_21 = [];
				if(isdefined(var_14))
				{
					var_21[var_14] = 1;
				}

				if(isdefined(var_15))
				{
					var_21[var_15] = 1;
				}

				if(isdefined(var_16))
				{
					var_21[var_16] = 1;
				}

				if(!isdefined(level.xuid2ownerid[var_01.num_lobby_idles]) && maps\mp\_vl_base::all_avatars_scheduled_for_delete())
				{
					maps\mp\_vl_base::reuse_avatar(var_01.num_lobby_idles);
				}

				if(!isdefined(level.xuid2ownerid[var_01.num_lobby_idles]))
				{
					var_22 = maps\mp\_vl_base::add_avatar(var_01.num_lobby_idles);
					maps\mp\_vl_base::vlprint("PartyMemberClassChange " + var_01.num_lobby_idles + " : " + var_1D + "," + var_1E + "," + var_12 + "," + var_13 + "\n");
					setdvar("virtuallobbymembers",level.xuid2ownerid.size);
					var_23 = maps\mp\gametypes\vlobby::getspawnpoint(var_22);
					spawn_an_avatar(var_23,var_1D,var_1E,var_1F,var_12,var_13,var_21,var_20,var_01.name,var_22,0);
					maps\mp\_vl_base::avatar_after_spawn(var_22);
					function_02D4(level.is_cao_agent[var_22],var_01.num_lobby_idles);
					level.is_cao_agent[var_22].loadout = var_01;
					level.is_cao_agent[var_22].membertimeout = gettime() + 4000;
					if(level.is_cao_agent.size == 1)
					{
						var_24 = level.var_328[0].var_1B06;
						vl_avatar_costume(var_24,level.is_cao_agent[var_22].costume);
						var_25 = var_24 maps\mp\gametypes\_teams::playercostume();
					}

					if(isdefined(level.clanmemberownerids))
					{
						hide_avatar(level.is_cao_agent[var_22]);
					}

					continue;
				}

				var_22 = level.xuid2ownerid[var_01.num_lobby_idles];
				var_26 = level.is_cao_agent[var_22];
				if(var_01.var_31E >= 0)
				{
					if(level.var_9E9F == var_22)
					{
						level.var_328[0] update_local_class(var_02,var_03,var_04,var_05,var_07,var_09,var_0A,var_0B,var_0C,var_0F,var_11,var_12,var_13,var_14,var_15,var_16,var_17,var_18,var_19,var_1A,var_1B,var_1C);
					}

					if(isdefined(var_26.previewcostume))
					{
						if(isdefined(var_26.costumes) && isdefined(var_26.costumes[var_26.previewcostume]))
						{
							var_20 = var_26.costumes[var_26.previewcostume];
						}
						else
						{
							var_20 = level.var_328[0] maps\mp\gametypes\_class::cao_getcostumebyindex(var_26.previewcostume);
						}

						var_20 = setdefaultcostumeifneeded(var_20);
						if(!isdefined(var_26.costumes))
						{
							var_26.costumes = [];
						}

						var_26.costumes[var_26.previewcostume] = var_20;
						if(var_26.previewgearcategory != "none")
						{
							var_27 = level.costumecat2idx[var_26.previewgearcategory];
							var_20[var_27] = var_26.previewgearid;
						}
					}
				}

				if(loadout_changed(var_26.loadout,var_01) || costume_changed(var_26.costume,var_20) || isdefined(level.var_39AB) && level.var_39AB)
				{
					maps\mp\_vl_base::vlprint("Updating xuid " + var_01.num_lobby_idles + " with ownerId=" + var_22 + "\n");
					maps\mp\_vl_base::vlprint("PartyMemberClassChange " + var_01.num_lobby_idles + " : " + var_1D + "," + var_1E + "," + var_12 + "," + var_13 + "\n");
					if(isdefined(var_26.var_31D))
					{
						var_26.var_31D.costume = var_20;
					}

					vl_avatar_loadout(var_26.var_31D,var_22,var_1D,var_1E,var_1F,var_12,var_13,var_21,var_20);
					if(var_01.var_31E >= 0)
					{
						vl_avatar_loadout(var_26.var_31D,var_22,undefined,var_1E,var_1F,var_12,var_13,var_21,var_20,level.var_328[0].var_1B06);
					}

					var_26.loadout = var_01;
					level.var_39AB = 0;
				}
			}

			level.mccqueue = [];
			maps\mp\_vl_base::update_avatars();
			wait(0.05);
		}
	}
}

//Function Number: 63
vl_vfx_for_avatar()
{
	if(isdefined(self) && !function_0294(self))
	{
		maps\mp\gametypes\_class::checkforcostumeset();
		if(isdefined(self.costumebonus) && isdefined(self.costumebonus["xp"]))
		{
			self.set_bonus_vfx = 1;
			if(!isdefined(self.camera_state) || self.camera_state != "crouch" || self == level.var_328[0].var_1B06)
			{
				if(!isdefined(self.spawned_vfx_setbonus_stand) || function_0294(self.spawned_vfx_setbonus_stand))
				{
					if(isdefined(self.spawned_vfx_setbonus_crouch) && !function_0294(self.spawned_vfx_setbonus_crouch))
					{
						self.spawned_vfx_setbonus_crouch delete();
					}

					self.spawned_vfx_setbonus_stand = spawnfx(level.vfx_setbonus_stand_01,self.var_2E6);
					function_0155(self.spawned_vfx_setbonus_stand,1);
					triggerfx(self.spawned_vfx_setbonus_stand,-6);
					return;
				}

				return;
			}

			if(!isdefined(self.spawned_vfx_setbonus_crouch) || function_0294(self.spawned_vfx_setbonus_crouch))
			{
				if(isdefined(self.spawned_vfx_setbonus_stand) && !function_0294(self.spawned_vfx_setbonus_stand))
				{
					self.spawned_vfx_setbonus_stand delete();
				}

				self.spawned_vfx_setbonus_crouch = spawnfx(level.vfx_setbonus_crouch_01,self.var_2E6);
				function_0155(self.spawned_vfx_setbonus_crouch,1);
				triggerfx(self.spawned_vfx_setbonus_crouch,-6);
				return;
			}

			return;
		}

		self.set_bonus_vfx = 0;
		if(isdefined(self.spawned_vfx_setbonus_crouch) && !function_0294(self.spawned_vfx_setbonus_crouch))
		{
			self.spawned_vfx_setbonus_crouch delete();
		}

		if(isdefined(self.spawned_vfx_setbonus_stand) && !function_0294(self.spawned_vfx_setbonus_stand))
		{
			self.spawned_vfx_setbonus_stand delete();
			return;
		}
	}
}

//Function Number: 64
override_member_loadout_for_practice_round(param_00)
{
	if(!isdefined(level.practice_round_costume))
	{
		level.practice_round_max_costumes = function_0296(level.practiceroundcostumetablename) - 1;
		level.practice_round_costume = randomint(level.practice_round_max_costumes);
	}

	if(!isdefined(level.practice_round_class))
	{
		var_01 = function_0296(level.practiceroundclasstablename) - 1;
		level.practice_round_class = randomint(var_01);
	}

	var_04 = param_00;
	var_05 = function_02CF(level.practiceroundcostumetablename,level.practice_round_costume + 1);
	var_04.gender = var_05[level.costumecat2idx["gender"]];
	var_04.shirt = var_05[level.costumecat2idx["shirt"]];
	var_04.head = var_05[level.costumecat2idx["head"]];
	var_04.pants = var_05[level.costumecat2idx["pants"]];
	var_04.eyewear = var_05[level.costumecat2idx["eyewear"]];
	var_04.hat = var_05[level.costumecat2idx["hat"]];
	var_04.gear = var_05[level.costumecat2idx["gear"]];
	var_04.kneepads = var_05[level.costumecat2idx["kneepads"]];
	var_04.gloves = var_05[level.costumecat2idx["gloves"]];
	var_04.shoes = var_05[level.costumecat2idx["shoes"]];
	var_04.exo = var_05[level.costumecat2idx["exo"]];
	var_06 = level.practice_round_class;
	var_07 = var_06 + 1;
	var_08 = tablelookup(level.practiceroundclasstablename,0,"loadoutPrimary",var_07);
	var_09 = tablelookup(level.practiceroundclasstablename,0,"loadoutPrimaryAttachment",var_07);
	var_0A = tablelookup(level.practiceroundclasstablename,0,"loadoutPrimaryAttachment2",var_07);
	var_0B = tablelookup(level.practiceroundclasstablename,0,"loadoutPrimaryAttachment3",var_07);
	var_0C = tablelookup(level.practiceroundclasstablename,0,"loadoutPrimaryCamo",var_07);
	var_0D = tablelookup(level.practiceroundclasstablename,0,"loadoutPrimaryReticle",var_07);
	var_04.primary = int(tablelookup("mp/statstable.csv",4,var_08,0));
	var_04.primaryattachment1 = int(tablelookup("mp/attachmenttable.csv",3,var_09,0));
	var_04.primaryattachment2 = int(tablelookup("mp/attachmenttable.csv",3,var_0A,0));
	var_04.primaryattachment3 = int(tablelookup("mp/attachmenttable.csv",3,var_0B,0));
	var_04.primarycamo = int(tablelookup("mp/camoTable.csv",1,var_0C,0));
	var_04.primaryreticle = int(tablelookup("mp/reticleTable.csv",1,var_0D,0));
	var_0E = tablelookup(level.practiceroundclasstablename,0,"loadoutSecondary",var_07);
	var_0F = tablelookup(level.practiceroundclasstablename,0,"loadoutSecondaryAttachment",var_07);
	var_10 = tablelookup(level.practiceroundclasstablename,0,"loadoutSecondaryAttachment2",var_07);
	var_11 = tablelookup(level.practiceroundclasstablename,0,"loadoutSecondaryCamo",var_07);
	var_12 = tablelookup(level.practiceroundclasstablename,0,"loadoutSecondaryReticle",var_07);
	var_04.secondary = int(tablelookup("mp/statstable.csv",4,var_0E,0));
	var_04.secondaryattachment1 = int(tablelookup("mp/attachmenttable.csv",3,var_0F,0));
	var_04.secondaryattachment2 = int(tablelookup("mp/attachmenttable.csv",3,var_10,0));
	var_04.secondarycamo = int(tablelookup("mp/camoTable.csv",1,var_11,0));
	var_04.secondaryreticle = int(tablelookup("mp/reticleTable.csv",1,var_12,0));
	var_13 = tablelookup(level.practiceroundclasstablename,0,"loadoutWildcard1",var_07);
	var_14 = tablelookup(level.practiceroundclasstablename,0,"loadoutWildcard2",var_07);
	var_15 = tablelookup(level.practiceroundclasstablename,0,"loadoutWildcard3",var_07);
	var_04.wildcard1 = int(tablelookup("mp/perktable.csv",1,var_13,0));
	var_04.wildcard2 = int(tablelookup("mp/perktable.csv",1,var_14,0));
	var_04.wildcard3 = int(tablelookup("mp/perktable.csv",1,var_15,0));
	return var_04;
}

//Function Number: 65
add_party_member_class_change(param_00)
{
	if(getdvarint("practiceroundgame"))
	{
		param_00 = override_member_loadout_for_practice_round(param_00);
	}

	for(var_01 = 0;var_01 < level.mccqueue.size;var_01++)
	{
		if(level.mccqueue[var_01].num_lobby_idles == param_00.num_lobby_idles)
		{
			level.mccqueue[var_01] = param_00;
			param_00 = undefined;
			break;
		}
	}

	if(isdefined(param_00))
	{
		level.mccqueue[level.mccqueue.size] = param_00;
	}
}

//Function Number: 66
party_members(param_00)
{
	if(!isdefined(level.xuid2ownerid))
	{
		return;
	}

	foreach(var_02 in param_00)
	{
		var_03 = var_02.num_lobby_idles;
		var_04 = level.xuid2ownerid[var_03];
		if(isdefined(var_04))
		{
			var_05 = level.is_cao_agent[var_04];
			if(isdefined(var_05))
			{
				var_05.membertimeout = gettime() + 2000;
				var_05.memberhastimedout = undefined;
			}
		}

		if(var_02.primary >= 0)
		{
			add_party_member_class_change(var_02);
		}
	}
}

//Function Number: 67
monitor_member_timeouts()
{
	for(;;)
	{
		var_00 = getdvarint("splitscreen",0);
		var_01 = function_02BB();
		var_02 = function_02BC();
		foreach(var_05, var_04 in level.is_cao_agent)
		{
			if(maps\mp\_vl_base::avatar_scheduled_for_removal(var_05))
			{
				continue;
			}

			if(var_04.membertimeout >= 0)
			{
				if(var_04.membertimeout < gettime())
				{
					if(var_05 == 0 && !isdefined(var_04.memberhastimedout))
					{
						var_04.membertimeout = gettime() + 2000;
						var_04.memberhastimedout = 1;
						continue;
					}

					maps\mp\_vl_base::vlprint("Schedule removal of ownerId " + var_05 + " from timeout\n");
					maps\mp\_vl_base::schedule_remove_avatar(var_05);
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 68
get_e3_costume(param_00)
{
	var_01 = "mp/E3CostumeTable.csv";
	var_02 = [];
	for(var_03 = 0;var_03 < level.costumecat2idx.size;var_03++)
	{
		var_02[var_03] = int(tablelookupbyrow(var_01,var_03 + 1,param_00 + 1));
	}

	return var_02;
}

//Function Number: 69
monitor_debug_addfakemembers(param_00,param_01)
{
}

//Function Number: 70
monitor_member_focus_change()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("luinotifyserver",var_00,var_01);
		if(var_00 == "member_select")
		{
			level.var_9E99 = level.xuid2ownerid[var_01];
			if(!isdefined(level.var_9E99))
			{
				maps\mp\_vl_base::vlprint("vl_focus undefined, setting to 0\n");
				level.var_9E99 = 0;
			}

			maps\mp\_vl_base::vlprint("selected member " + var_01 + " ownerId=" + level.var_9E99 + "\n");
		}

		if(var_00 == "vlpresentable")
		{
			maps\mp\_vl_base::vlprint("in main menu\n");
			thread setvirtuallobbypresentable();
		}

		if(var_00 == "leave_lobby")
		{
			maps\mp\_vl_base::vlprint("leave_lobby xuid=" + var_01 + "\n");
			if(var_01 == "0")
			{
				foreach(var_03 in level.xuid2ownerid)
				{
					maps\mp\_vl_base::vlprint("Schedule removal of ownerId " + var_03 + "\n");
					maps\mp\_vl_base::schedule_remove_avatar(var_03,0.25);
				}
			}
			else
			{
				var_03 = level.xuid2ownerid[var_03];
				if(isdefined(var_03))
				{
					maps\mp\_vl_base::vlprint("Schedule removal of ownerId " + var_03 + "\n");
					maps\mp\_vl_base::schedule_remove_avatar(var_03,0.25);
				}
			}

			thread resetvirtuallobbypresentable();
		}
	}
}

//Function Number: 71
monitor_cao_set_cao_focus(param_00)
{
	if(param_00 < 0)
	{
		level.prv_cac_weapon = undefined;
		return;
	}

	level.var_9E9F = getfocusfromcontroller(param_00);
	level.prv_cac_weapon = 1;
	maps\mp\_vl_base::vlprint("cao ctrl = " + param_00 + " focus = " + level.var_9E9F + "\n");
}

//Function Number: 72
cao_set_costumes_from_lua(param_00)
{
	maps\mp\_vl_base::vlprintln("Cao set costumes from lua:" + param_00);
	var_01 = strtok(param_00,"#");
	foreach(var_03 in var_01)
	{
		var_04 = strtok(var_03,"|");
		if(var_04.size > 0)
		{
			var_05 = int(var_04[0]);
			var_06 = getfocusfromcontroller(var_05);
			var_07 = level.is_cao_agent[var_06];
			if(isdefined(var_07))
			{
				var_07.activecostume = int(var_04[1]);
				for(var_08 = 2;var_08 < var_04.size;var_08++)
				{
					var_09 = strtok(var_04[var_08],",");
					var_0A = [];
					for(var_0B = 1;var_0B < var_09.size;var_0B++)
					{
						var_0A[var_0A.size] = int(var_09[var_0B]);
					}

					if(!isdefined(var_07.costumes))
					{
						var_07.costumes = [];
					}

					var_07.costumes[int(var_09[0])] = var_0A;
				}
			}
		}
	}
}

//Function Number: 73
monitor_cao_set_costume_preview(param_00)
{
	var_01 = strtok(param_00,":");
	var_02 = int(var_01[0]);
	var_03 = strtok(var_01[1],",");
	var_04 = getfocusfromcontroller(var_02);
	level.var_9E9F = var_04;
	var_05 = level.is_cao_agent[var_04];
	if(isdefined(var_05))
	{
		var_05.previewcostume = int(var_03[0]);
		var_05.previewgearcategory = var_03[1];
		var_05.previewgearid = int(var_03[2]);
	}

	return var_05;
}

//Function Number: 74
monitor_create_an_operator(param_00)
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("luinotifyserver",var_01,var_02);
		if(var_01 == "cao")
		{
			monitor_cao_set_cao_focus(var_02);
			level.caoavatarposoffset = undefined;
			if(isdefined(level.var_9E9F))
			{
				var_03 = level.is_cao_agent[level.var_9E9F];
			}
			else
			{
				var_03 = level.is_cao_agent[var_01];
			}

			if(var_02 < 0 && isdefined(var_03))
			{
				var_03.previewgearcategory = undefined;
				var_03.previewgearid = undefined;
				var_03.previewcostume = undefined;
				if(isdefined(var_03.costumes))
				{
					vl_avatar_costume(var_03,var_03.costumes[var_03.activecostume],1);
				}
			}

			continue;
		}

		if(var_01 == "lootscreen_gear_highlighted")
		{
			level.cac = undefined;
			monitor_cao_set_cao_focus(var_02);
			if(isdefined(level.prv_cac_weapon))
			{
				level.caoavatarposoffset = (56,0,5);
			}
			else
			{
				level.caoavatarposoffset = undefined;
			}

			level.camdirectionforward.var_705C = "prelobby_loot";
			continue;
		}

		if(var_01 == "costumes")
		{
			cao_set_costumes_from_lua(var_02);
			continue;
		}

		if(var_01 == "costume_preview")
		{
			monitor_cao_set_costume_preview(var_02);
			continue;
		}

		if(var_01 == "costume_apply")
		{
			var_03 = monitor_cao_set_costume_preview(var_02);
			if(isdefined(var_03))
			{
				var_04 = level.costumecat2idx[var_03.previewgearcategory];
				if(isdefined(var_03.costumes) && isdefined(var_03.costumes[var_03.previewcostume]))
				{
					var_03.costumes[var_03.previewcostume][var_04] = var_03.previewgearid;
					if(var_03.previewcostume == var_03.activecostume)
					{
						var_03 method_84BA(var_03.costumes[var_03.previewcostume]);
					}
				}
			}

			continue;
		}

		if(var_01 == "costume_set_apply")
		{
			var_05 = strtok(var_02,":");
			var_06 = int(var_05[0]);
			var_07 = int(var_05[1]);
			param_00 = getfocusfromcontroller(var_06);
			var_03 = level.is_cao_agent[param_00];
			if(!isdefined(var_03.costumes) || !isdefined(var_03.costumes[var_07]))
			{
				var_08 = level.var_328[0] maps\mp\gametypes\_class::cao_getcostumebyindex(var_07);
				var_08 = setdefaultcostumeifneeded(var_08);
				if(!isdefined(var_03.costumes))
				{
					var_03.costumes = [];
				}

				var_03.costumes[var_07] = var_08;
			}

			var_09 = strtok(var_05[2],"|");
			foreach(var_0B in var_09)
			{
				var_0C = strtok(var_0B,",");
				var_0D = var_0C[0];
				var_0E = int(var_0C[1]);
				var_04 = level.costumecat2idx[var_0D];
				var_03.costumes[var_07][var_04] = var_0E;
			}

			var_03 method_84BA(var_03.costumes[var_07]);
		}
	}
}

//Function Number: 75
clans_set_highlight_gear_from_lua(param_00)
{
	setdvar("vl_clan_models_loaded",0);
	var_01 = strtok(param_00,"#");
	foreach(var_03 in var_01)
	{
		var_04 = strtok(var_03,"|");
		if(var_04.size > 0)
		{
			var_05 = int(var_04[0]);
			var_06 = level.var_328[0].clan_agents[var_05];
			if(isdefined(var_06))
			{
				var_06.activecostume = 0;
				var_06.isvalidhighlight = int(var_04[1]) > 0;
				for(var_07 = 2;var_07 < var_04.size;var_07++)
				{
					var_08 = strtok(var_04[var_07],",");
					var_09 = [];
					for(var_0A = 1;var_0A < var_08.size;var_0A++)
					{
						var_09[var_09.size] = int(var_08[var_0A]);
					}

					if(!isdefined(var_06.costumes))
					{
						var_06.costumes = [];
					}

					var_06.costumes[int(var_08[0])] = var_09;
					vl_avatar_costume(var_06,var_09,1);
					if(var_06.isvalidhighlight)
					{
						wait_load_costume(var_06);
						continue;
					}

					hide_avatar(var_06);
				}
			}
		}
	}

	setdvar("vl_clan_models_loaded",1);
}

//Function Number: 76
monitor_clans()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("luinotifyserver",var_00,var_01);
		if(var_00 == "clanprofile")
		{
			maps\mp\_vl_base::vlprint("Using clan profile VL settings\n");
			if(var_01 < 0)
			{
				level.clanmemberownerids = undefined;
			}
			else
			{
				level.clanmemberownerids = var_01;
			}

			continue;
		}

		if(var_00 == "clan_highlight_data")
		{
			maps\mp\_vl_base::vlprint("Handling clan highlight information\n");
			clans_set_highlight_gear_from_lua(var_01);
		}
	}
}

//Function Number: 77
hide_avatar(param_00)
{
	param_00 hide();
	param_00 hideallparts();
	if(isdefined(param_00.spawned_vfx_setbonus_crouch) && !function_0294(param_00.spawned_vfx_setbonus_crouch))
	{
		param_00.spawned_vfx_setbonus_crouch delete();
	}

	if(isdefined(param_00.spawned_vfx_setbonus_stand) && !function_0294(param_00.spawned_vfx_setbonus_stand))
	{
		param_00.spawned_vfx_setbonus_stand delete();
	}

	hide_avatar_weapons(param_00);
}

//Function Number: 78
show_avatar(param_00)
{
	if(param_00.isfree)
	{
		return;
	}

	addlaunchers(param_00);
	param_00 show();
	param_00 showallparts();
	if(isdefined(param_00.primaryweaponent))
	{
		param_00.primaryweaponent show();
		param_00.primaryweaponent showallparts();
	}

	if(isdefined(param_00.var_7BF7))
	{
		param_00.var_7BF7 show();
		param_00.var_7BF7 showallparts();
	}

	if(isdefined(param_00.var_9AE) && isdefined(param_00.var_9AE.alias))
	{
		if(issubstr(param_00.var_9AE.alias,"akimbo") || issubstr(param_00.var_9AE.alias,"akimboxmg"))
		{
			param_00.var_9AE show();
			param_00.var_9AE showallparts();
		}
	}

	param_00 thread vl_vfx_for_avatar();
}

//Function Number: 79
hide_avatar_primary_weapon(param_00)
{
	if(isdefined(param_00.primaryweaponent))
	{
		param_00 notify("hide_primary_weapon");
		param_00.primaryweaponent hide();
		param_00.primaryweaponent hideallparts();
	}
}

//Function Number: 80
hide_avatar_secondary_weapon(param_00)
{
	if(isdefined(param_00.var_7BF7))
	{
		param_00 notify("hide_secondary_weapon");
		param_00.var_7BF7 hide();
		param_00.var_7BF7 hideallparts();
	}
}

//Function Number: 81
hide_avatar_akimbo_weapon(param_00)
{
	if(isdefined(param_00.var_9AE))
	{
		param_00 notify("hide_akimbo_weapon");
		param_00.var_9AE hide();
		param_00.var_9AE hideallparts();
	}
}

//Function Number: 82
hide_avatar_weapons(param_00)
{
	hide_avatar_primary_weapon(param_00);
	hide_avatar_secondary_weapon(param_00);
	hide_avatar_akimbo_weapon(param_00);
}

//Function Number: 83
hide_avatars()
{
	foreach(var_01 in level.is_cao_agent)
	{
		hide_avatar(var_01);
	}
}

//Function Number: 84
show_avatars()
{
	foreach(var_01 in level.is_cao_agent)
	{
		show_avatar(var_01);
	}
}

//Function Number: 85
get_xuid_for_avatar(param_00)
{
	foreach(var_03, var_02 in level.xuid2ownerid)
	{
		if(isdefined(level.is_cao_agent[var_02]) && level.is_cao_agent[var_02] == param_00)
		{
			return var_03;
		}
	}

	return "";
}

//Function Number: 86
remove_avatar(param_00)
{
	var_01 = -1;
	foreach(var_01 in level.xuid2ownerid)
	{
		if(var_01 == param_00)
		{
			break;
		}
	}

	maps\mp\_vl_base::vlprint("Removing xuid " + var_03 + " for ownerId " + param_00 + "\n");
	function_02D4(level.is_cao_agent[param_00],var_03,1);
	level.xuid2ownerid[var_03] = undefined;
	level.var_117B[param_00].var_9379 = 0;
	level.var_117B[param_00].avatar = undefined;
	setdvar("virtuallobbymembers",level.xuid2ownerid.size);
	var_04 = level.is_cao_agent[param_00];
	level.is_cao_agent[param_00] = undefined;
	if(level.var_9E99 == param_00)
	{
		if(level.is_cao_agent.size > 0)
		{
			foreach(var_07, var_06 in level.is_cao_agent)
			{
				level.var_9E99 = var_07;
				break;
			}
		}
	}

	hide_avatar(var_04);
	var_04 takeallweapons();
	var_04 detachall();
	var_04.headmodel = undefined;
	var_04 hideallparts();
	if(isdefined(var_04.avatar_spawnpoint.spawned_avatar))
	{
		var_04.avatar_spawnpoint.spawned_avatar = undefined;
	}

	if(isdefined(var_04.primaryweaponent))
	{
		function_02D4(var_04.primaryweaponent,var_03,1);
		var_04.primaryweaponent delete();
		var_04.primaryweaponent = undefined;
	}

	if(isdefined(var_04.var_7BF7))
	{
		function_02D4(var_04.var_7BF7,var_03,1);
		var_04.var_7BF7 delete();
		var_04.var_7BF7 = undefined;
	}

	if(isdefined(var_04.var_9AE))
	{
		function_02D4(var_04.var_9AE,var_03,1);
		var_04.var_9AE delete();
		var_04.var_9AE = undefined;
	}

	var_04.alias = undefined;
	var_04.stored_weapon = undefined;
	maps\mp\_vl_base::free_avatar(var_04);
	if(level.var_9E99 == param_00)
	{
		level.var_9E99 = 0;
	}
}

//Function Number: 87
reset_bot_settings_for_a_few_frames()
{
	level notify("stop_reset_bot_settings");
	level endon("stop_reset_bot_settings");
	for(var_00 = 0;var_00 < 2;var_00++)
	{
		maps\mp\agents\_agent_common::set_agent_health(100);
		self botclearscriptenemy();
		self botclearscriptgoal();
		bot_disable_tactical_goals();
		self botsetflag("disable_movement",1);
		self botsetflag("disable_rotation",1);
		wait(0.05);
	}
}

//Function Number: 88
hackagentangles(param_00)
{
	self setplayerangles(param_00);
}

//Function Number: 89
use_animstate(param_00,param_01,param_02)
{
	var_03 = randomfloatrange(0.85,1.15);
	var_04 = 0;
	if(!isdefined(self.var_C4C))
	{
		self setanimclass("vlobby_animclass");
		var_04 = 1;
		level notify("stop_reset_bot_settings");
		hackagentangles(self.spawn_angles);
	}

	if(!isdefined(param_02))
	{
		param_02 = "lobby_idle";
		param_00 = "assault_pose_06";
	}

	self.var_C4C = param_00;
	self.animstate = param_02;
	self setanimstate(param_02,param_00,var_03);
	if(!isdefined(param_01) || !param_01)
	{
		self.var_C4C = param_00;
		if(var_04)
		{
			vl_give_weapons(self);
		}
	}
}

//Function Number: 90
start_anim()
{
	if(isdefined(level.camdirectionforward) && isdefined(level.camdirectionforward.var_5D32))
	{
		switch(level.camdirectionforward.var_5D32)
		{
			case "prelobby_loot":
			case "prelobby":
				break;

			case "cac":
			case "transition":
			case "game_lobby":
				break;

			case "clanprofile":
			case "cao":
				break;

			default:
				break;
		}
	}
}

//Function Number: 91
start_prelobby_anims()
{
	if(!isdefined(level.is_cao_agent))
	{
		return;
	}

	foreach(var_01 in level.is_cao_agent)
	{
		if(!isdefined(var_01.var_C4C) || !isdefined(var_01.animstate))
		{
			var_02 = var_01 getanimdata(var_01.alias);
			var_01 use_animstate(var_02.var_9D6,undefined,var_02.animstate);
		}
	}
}

//Function Number: 92
start_lobby_anims()
{
	if(!isdefined(level.is_cao_agent))
	{
		return;
	}

	foreach(var_01 in level.is_cao_agent)
	{
		if(!isdefined(var_01.var_C4C) || !isdefined(var_01.animstate))
		{
			var_02 = var_01 getanimdata(var_01.alias);
			var_01 use_animstate(var_02.var_9D6,undefined,var_02.animstate);
		}
	}
}

//Function Number: 93
start_cao_anims()
{
	if(!isdefined(level.is_cao_agent))
	{
		return;
	}

	foreach(var_01 in level.is_cao_agent)
	{
		if(!isdefined(var_01.var_C4C) || !isdefined(var_01.animstate))
		{
			var_02 = var_01 getanimdata(var_01.alias);
			var_01 use_animstate(var_02.var_9D6,undefined,var_02.animstate);
		}
	}
}

//Function Number: 94
find_best_cam_path(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	var_03[1] = param_01;
	var_04 = 20;
	var_05 = 1;
	while(var_05 && var_04 > 0)
	{
		var_04--;
		var_05 = 0;
		var_06 = [];
		var_06[var_06.size] = var_03[0];
		var_07 = 0;
		var_08 = 0;
		for(var_09 = 0;var_09 < var_03.size - 1 && !var_07;var_09++)
		{
			var_0A = 1;
			var_0B = var_03[var_09];
			var_0C = var_03[var_09 + 1];
			while(var_0A)
			{
				var_0A = 0;
				var_0D = undefined;
				var_0E = undefined;
				foreach(var_10 in param_02)
				{
					var_11 = trace2d(var_0B,var_0C,var_10);
					if(var_11["intersect"])
					{
						if(distance2d(var_06[var_06.size - 1],var_11["closestpoint"]) > 0.1 && distance2d(var_0C,var_11["closestpoint"]) > 0.1)
						{
							var_0A = 1;
							if(!isdefined(var_0E) || var_0E["radratio"] > var_11["radratio"])
							{
								var_0D = var_10;
								var_0E = var_11;
							}
						}
					}
				}

				if(var_0A)
				{
					var_05 = 1;
					if(length2d(var_0B,var_0D["center"]) < var_0D["radius"])
					{
						var_0B = move_outside_circle(var_0B,var_0D);
						var_06[var_06.size - 1] = var_0B;
						var_0A = 0;
						var_07 = 1;
						var_08 = var_09 + 1;
					}
					else if(length2d(var_0C,var_0D["center"]) < var_0D["radius"])
					{
						var_0C = move_outside_circle(var_0C,var_0D);
						var_06[var_06.size] = var_0C;
						var_0A = 0;
						var_07 = 1;
						var_08 = var_09 + 2;
					}
					else
					{
						var_06[var_06.size] = var_0E["closestpoint"];
						var_06[var_06.size] = var_0C;
						var_0A = 0;
					}

					continue;
				}

				var_06[var_06.size] = var_0C;
			}
		}

		if(var_07)
		{
			for(var_09 = var_08;var_09 < var_03.size;var_09++)
			{
				var_06[var_06.size] = var_03[var_09];
			}
		}

		var_03 = var_06;
	}

	return var_03;
}

//Function Number: 95
move_outside_circle(param_00,param_01)
{
	var_02 = param_01["center"];
	var_03 = param_01["radius"];
	var_04 = vectornormalize((param_00[0] - var_02[0],param_00[1] - var_02[1],0));
	param_00 = (var_02[0] + var_03 * var_04[0],var_02[1] + var_03 * var_04[1],param_00[2]);
	return param_00;
}

//Function Number: 96
trace2d(param_00,param_01,param_02)
{
	var_03 = 5;
	var_04 = param_02["center"];
	var_05 = param_02["radius"];
	var_06 = var_05 + var_03;
	var_07 = (param_01[0] - param_00[0],param_01[1] - param_00[1],0);
	var_08 = vectornormalize(var_07);
	var_09 = length2d(var_07);
	var_0A = (var_04[0] - param_00[0],var_04[1] - param_00[1],0);
	var_0B = vectordot(var_08,var_0A);
	if(var_0B < 0)
	{
		var_0B = 0;
	}
	else if(var_0B > var_09)
	{
		var_0B = var_09;
	}

	var_0C = (param_00[0] + var_0B * var_08[0],param_00[1] + var_0B * var_08[1],0);
	var_0D = var_0B / var_09;
	var_0E = (var_0C[0] - var_04[0],var_0C[1] - var_04[1],0);
	var_09 = length2d(var_0E);
	var_0F = 0;
	var_10 = 1;
	if(var_09 < var_05)
	{
		var_0F = 1;
		var_0E = vectornormalize(var_0E);
		var_0C = (var_04[0] + var_06 * var_0E[0],var_04[1] + var_06 * var_0E[1],param_00[2] + var_0D * param_01[2] - param_00[2]);
		var_10 = var_09 / var_05;
	}

	var_11 = [];
	var_11["intersect"] = var_0F;
	var_11["fraction"] = var_0D;
	var_11["closestpoint"] = var_0C;
	var_11["radratio"] = var_10;
	return var_11;
}

//Function Number: 97
calc_new_pos(param_00,param_01,param_02)
{
	var_03 = distance(param_00,param_02);
	if(var_03 > param_01)
	{
		var_04 = vectornormalize(param_02 - param_00);
		param_02 = param_00 + param_01 * var_04;
	}

	return param_02;
}

//Function Number: 98
lookahead_path(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_04[param_00];
	if(param_00 + 1 >= param_04.size)
	{
		return [param_00,calc_new_pos(param_01,param_02,param_04[param_00])];
	}

	var_06 = param_04[param_00 + 1];
	var_07 = distance(var_05,var_06);
	var_08 = vectornormalize(var_06 - var_05);
	var_09 = vectordot(var_08,param_01 - var_05);
	if(var_09 < 0)
	{
		var_09 = 0;
	}

	if(var_09 > var_07)
	{
		var_09 = var_07;
	}

	var_0A = var_05 + var_09 * var_08;
	var_0B = param_03;
	var_0C = var_07 - var_09;
	var_0D = param_04[param_04.size - 1];
	while(var_0B > 0)
	{
		if(var_0C > var_0B)
		{
			var_0D = var_0A + var_0B * var_08;
			var_0B = 0;
			continue;
		}

		if(param_00 + 1 >= param_04.size)
		{
			var_0D = param_04[param_00];
			var_0B = 0;
		}

		var_0B = var_0B - var_0C;
		param_00++;
		var_0A = param_04[param_00];
	}

	return [param_00,calc_new_pos(param_01,param_02,var_0D)];
}

//Function Number: 99
init_path_traversal(param_00)
{
	param_00.distanceonpath = 0;
	param_00.pathidx = 0;
	param_00.distonpathsegment = 0;
	param_00.pathspeed = 0;
	var_01 = param_00.pathinfo_len / param_00.path_idealtime;
	if(var_01 < param_00.path_minspeed)
	{
		var_01 = param_00.path_minspeed;
	}

	if(var_01 > param_00.path_maxspeed)
	{
		var_01 = param_00.path_maxspeed;
	}

	param_00.pathaccel = 0.05 * var_01 / param_00.path_accel_time;
	param_00.pathdeccel = 0.05 * var_01 / param_00.path_deccel_time;
	param_00.pathtgtspeed = var_01;
	param_00.pathaccelmode = 1;
	param_00.pathinfo_t = 0;
	param_00.pathinfo_totalt = param_00.path_idealtime;
	var_02 = param_00.path_deccel_time / 0.05;
	var_03 = 0;
	var_04 = var_01;
	for(var_05 = 0;var_05 < var_02;var_05++)
	{
		var_04 = var_04 - param_00.pathdeccel;
		if(var_04 < param_00.path_mindeccelspeed)
		{
			var_04 = param_00.path_mindeccelspeed;
		}

		var_03 = var_03 + var_04;
	}

	param_00.pathstartdecceldist = param_00.pathinfo_len - var_03;
	param_00.pitch = param_00.pathinfo_startpitch;
}

//Function Number: 100
update_path_speed(param_00)
{
	if(param_00.distanceonpath < param_00.pathstartdecceldist)
	{
		param_00.pathspeed = param_00.pathspeed + param_00.pathaccel;
		if(param_00.pathspeed > param_00.pathtgtspeed)
		{
			param_00.pathspeed = param_00.pathtgtspeed;
			return;
		}

		return;
	}

	param_00.pathspeed = param_00.pathspeed - param_00.pathdeccel;
	if(param_00.pathspeed < param_00.path_mindeccelspeed)
	{
		param_00.pathspeed = param_00.path_mindeccelspeed;
	}
}

//Function Number: 101
init_path_constants(param_00)
{
	param_00.path_maxspeed = 15;
	param_00.path_minspeed = 1.8;
	param_00.path_mindeccelspeed = 0.3;
	param_00.path_idealtime = 0.5;
	param_00.path_accel_time = 0.15 * param_00.path_idealtime;
	param_00.path_deccel_time = 0.15 * param_00.path_idealtime;
	param_00.pathmaxrotz = 4.5;
	param_00.pathmaxrotx = 4.5;
}

//Function Number: 102
build_path_info(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = find_best_cam_path(param_00.var_2E6,param_03,param_00.obstacles);
	param_00.path = var_05;
	var_06 = 0;
	foreach(var_09, var_08 in param_00.path)
	{
		if(var_09 > 0)
		{
			var_06 = var_06 + distance(param_00.path[var_09],param_00.path[var_09 - 1]);
		}
	}

	param_00.pathinfo_t = 0;
	param_00.pathinfo_totalt = param_00.path_idealtime;
	param_00.pathinfo_len = var_06;
	param_00.pathinfo_startaim = anglestoforward(param_00.var_41);
	param_00.pathinfo_endaim = anglestoforward(param_04);
	param_00.pathinfo_startpitch = angleclamp180(param_00.var_41[0]);
	param_00.pathinfo_curstartpitch = param_00.pathinfo_startpitch;
	param_00.pathinfo_endpitch = angleclamp180(param_04[0]);
	param_00.pathinfo_startyaw = angleclamp180(param_00.var_41[1]);
	param_00.pathinfo_endyaw = angleclamp180(param_04[1]);
	param_00.pathinfo_start_loc = param_02;
	param_00.pathinfo_end_loc = param_03;
	param_00.pathinfo_velocity = (0,0,0);
	var_0A = vectornormalize(param_00.pathinfo_end_loc - param_00.pathinfo_start_loc);
	var_0B = vectordot(var_0A,param_00.pathinfo_startaim);
	var_0C = vectordot(var_0A,param_00.pathinfo_endaim);
	var_0D = 0;
	if(var_0C < -0.707 && var_0B < -0.707)
	{
		var_0D = 1;
	}

	param_00.pathinfo_mode = var_0D;
	init_path_traversal(param_00);
}

//Function Number: 103
findnewtargetpos(param_00,param_01,param_02)
{
	var_03 = anglestoforward(param_00);
	var_04 = param_02 - param_01;
	var_05 = vectordot(var_04,var_03);
	var_06 = param_01 + var_03 * var_05;
	return var_06;
}

//Function Number: 104
sigmoid(param_00,param_01)
{
	var_02 = -0.5;
	param_00 = param_00 + var_02;
	param_00 = param_00 * 2 * param_01;
	var_03 = sqrt(1 + param_01 * param_01) / 2 * param_01;
	var_04 = 0.5;
	var_05 = var_03 * param_00 / sqrt(1 + param_00 * param_00) + var_04;
	return var_05;
}

//Function Number: 105
lerp_towards_desiredangle(param_00,param_01)
{
	var_02 = angleclamp180(param_01[0]);
	var_03 = angleclamp180(param_00.var_41[0]);
	var_04 = angleclamp180(param_01[1] - param_00.var_41[1]);
	var_05 = angleclamp180(var_02 - var_03);
	if(var_04 < -1 * param_00.pathmaxrotz)
	{
		var_04 = -1 * param_00.pathmaxrotz;
	}

	if(var_04 > param_00.pathmaxrotz)
	{
		var_04 = param_00.pathmaxrotz;
	}

	if(var_05 < -1 * param_00.pathmaxrotx)
	{
		var_05 = -1 * param_00.pathmaxrotx;
	}

	if(var_05 > param_00.pathmaxrotx)
	{
		var_05 = param_00.pathmaxrotx;
	}

	var_06 = (var_05,var_04,0);
	param_00.var_41 = param_00.var_41 + var_06;
	if(abs(var_05) < 0.1 && abs(var_04) < 0.1)
	{
		return 1;
	}

	return 0;
}

//Function Number: 106
update_camera_angles_on_path(param_00,param_01)
{
	var_02 = param_00.pathinfo_t / param_00.pathinfo_totalt;
	var_02 = sigmoid(var_02,2);
	var_03 = param_00.var_41;
	var_04 = var_02 * param_00.pathinfo_endpitch - param_00.pathinfo_startpitch + param_00.pathinfo_startpitch;
	var_05 = param_00.pathinfo_startyaw + var_02 * param_00.pathinfo_endyaw - param_00.pathinfo_startyaw;
	var_06 = param_00.var_41[1] + angleclamp180(var_05 - param_00.var_41[1]);
	var_03 = (var_04,var_06,var_03[2]);
	return lerp_towards_desiredangle(param_00,var_03);
}

//Function Number: 107
update_camera_position_on_path(param_00)
{
	var_01 = param_00.pathinfo_t / param_00.pathinfo_totalt;
	var_01 = sigmoid(var_01,2);
	var_02 = var_01 * param_00.pathinfo_len;
	param_00.pathidx = 0;
	param_00.distonpathsegment = 0;
	param_00.distanceonpath = 0;
	while(var_02 > 0)
	{
		var_03 = distance(param_00.path[param_00.pathidx],param_00.path[param_00.pathidx + 1]);
		var_04 = var_03 - param_00.distonpathsegment;
		if(var_04 > var_02)
		{
			param_00.distonpathsegment = param_00.distonpathsegment + var_02;
			var_05 = param_00.path[param_00.pathidx] + param_00.distonpathsegment * vectornormalize(param_00.path[param_00.pathidx + 1] - param_00.path[param_00.pathidx]);
			param_00.pathinfo_velocity = var_05 - param_00.var_2E6;
			param_00.var_2E6 = var_05;
			param_00.distanceonpath = param_00.distanceonpath + var_02;
			var_02 = 0;
			continue;
		}

		var_02 = var_02 - var_04;
		param_00.pathidx++;
		if(param_00.pathidx >= param_00.path.size - 1)
		{
			if(param_00.pathidx < param_00.path.size)
			{
				var_05 = param_00.path[param_00.pathidx];
			}
			else
			{
				var_05 = var_01.path[var_01.path.size - 1];
			}

			param_00.pathinfo_velocity = var_05 - param_00.var_2E6;
			param_00.var_2E6 = var_05;
			param_00.distanceonpath = param_00.pathinfo_len;
			var_02 = 0;
			continue;
		}

		param_00.distanceonpath = param_00.distanceonpath + var_04;
		param_00.distonpathsegment = 0;
	}
}

//Function Number: 108
update_camera_on_path(param_00,param_01)
{
	var_02 = 0;
	param_00.pathinfo_t = param_00.pathinfo_t + 0.05;
	if(param_00.pathinfo_t >= param_00.pathinfo_totalt)
	{
		param_00.pathinfo_t = param_00.pathinfo_totalt;
		var_02 = 1;
		param_00.pathinfo_velocity = (0,0,0);
	}

	update_camera_position_on_path(param_00);
	update_camera_angles_on_path(param_00,param_01);
	return var_02;
}

//Function Number: 109
get_target_from_avatar(param_00)
{
	var_01 = "j_neck";
	var_02 = param_00 gettagorigin(var_01);
	return var_02;
}

//Function Number: 110
calc_f_from_avatar(param_00)
{
	var_01 = rotateavatartagcamera(param_00);
	var_02 = var_01.camera_tag_origin;
	var_03 = var_01.camera_tag_angles;
	var_04 = get_target_from_avatar(param_00);
	var_05 = var_02;
	var_06 = var_02 + anglestoforward(var_03) * 64;
	return calc_f(var_05,var_06,var_04);
}

//Function Number: 111
calc_f_from_avatar_spawnpoint(param_00)
{
	var_01 = param_00.var_2E6;
	var_02 = param_00.camera_helper.var_2E6;
	var_03 = param_00.camera_lookat.var_2E6;
	return calc_f(var_02,var_03,var_01);
}

//Function Number: 112
calc_f(param_00,param_01,param_02)
{
	var_03 = param_01;
	var_04 = param_00;
	var_05 = param_02;
	var_06 = [];
	var_07 = vectornormalize(vectorcross(var_03 - var_04,(0,0,1)));
	var_08 = vectornormalize(vectorcross(var_07,var_03 - var_04));
	var_09 = var_05 - var_04;
	var_0A = var_05 - vectordot(var_08,var_09) * var_08;
	var_0B = var_05 - vectordot(var_07,var_09) * var_07;
	var_0C = distance(var_0A,var_03);
	var_0D = distance(var_0A,var_04);
	var_0E = var_0C / var_0D;
	var_0F = 1;
	if(vectordot(var_09,var_07) < 0)
	{
		var_0F = -1;
	}

	var_06["fx"] = var_0E;
	var_06["sx"] = var_0F;
	var_10 = distance(var_0B,var_03);
	var_11 = distance(var_0B,var_04);
	var_12 = var_10 / var_11;
	var_13 = 1;
	if(vectordot(var_09,var_08) < 0)
	{
		var_13 = -1;
	}

	var_06["fz"] = var_12;
	var_06["sz"] = var_13;
	return var_06;
}

//Function Number: 113
calc_f_fromscreen(param_00,param_01)
{
	var_02 = getdvarfloat("cg_fov",45) * getdvarfloat("cg_fovScale",1);
	var_03 = 1;
	var_04 = tan(var_02);
	var_05 = [];
	var_06 = var_04 * abs(param_00);
	var_07 = 1;
	if(param_00 < 0)
	{
		var_07 = -1;
	}

	var_08 = var_06 / sqrt(1 - var_06 * var_06);
	var_05["sx"] = var_07;
	var_05["fx"] = var_08;
	var_09 = var_03 * var_04 * abs(param_01);
	var_0A = 1;
	if(param_01 < 0)
	{
		var_0A = -1;
	}

	var_0B = var_09 / sqrt(1 - var_09 * var_09);
	var_05["sz"] = var_0A;
	var_05["fz"] = var_0B;
	return var_05;
}

//Function Number: 114
calc_cam_lookat(param_00,param_01,param_02)
{
	var_03 = param_01;
	var_04 = param_02;
	var_05 = var_04 - var_03;
	var_06 = vectornormalize(vectorcross(var_05,(0,0,1)));
	var_07 = vectornormalize(vectorcross(var_06,var_05));
	var_08 = var_05 - vectordot(var_05,var_07) * var_07;
	var_09 = length(var_08);
	var_0A = param_00["fx"];
	var_0B = param_00["sx"];
	var_0C = var_09 * var_0A;
	var_09 = var_09 * var_0A * var_0A;
	var_0D = var_09 * var_0A * sqrt(1 - var_0A * var_0A);
	var_0E = var_09 * var_08 + var_0D * var_06;
	var_0F = var_05 - vectordot(var_05,var_06) * var_06;
	var_10 = length(var_0F);
	var_11 = param_00["fz"];
	var_12 = param_00["sz"];
	var_13 = var_10 * var_11;
	var_10 = var_10 * var_11 * var_11;
	var_14 = var_10 * var_11 * sqrt(1 - var_11 * var_11);
	var_15 = var_10 * var_0F + var_14 * var_07;
	var_16 = var_04 + var_0B * var_0E + var_12 * var_15;
	return var_16;
}

//Function Number: 115
debug_draw_path(param_00)
{
	var_01 = (1,1,1);
	var_02 = param_00[0];
	var_03 = var_02;
	var_04 = 0;
	var_05 = 10;
	var_06 = 30;
	if(level.use_lookahead)
	{
		for(;;)
		{
			var_07 = lookahead_path(var_04,var_02,var_05,var_06,param_00);
			var_04 = var_07[0];
			var_03 = var_07[1];
			if(distance(var_02,var_03) < 0.1)
			{
				break;
			}

			var_02 = var_03;
			if(var_04 >= param_00.size)
			{
				break;
			}
		}

		return;
	}

	for(var_08 = 0;var_08 < param_00.size - 1;var_08++)
	{
	}
}

//Function Number: 116
debug_draw_obstacles(param_00)
{
	var_01 = (1,0.5,0);
	foreach(var_03 in param_00)
	{
		var_04 = var_03["center"];
		var_05 = var_03["radius"];
	}
}

//Function Number: 117
debug_draw_aim(param_00)
{
	var_01 = 1;
	var_02 = var_01;
	var_03 = 36;
	init_path_traversal(param_00);
	param_00.target_from_avatar = get_target_from_avatar(param_00.targetavatar);
	while(!update_camera_on_path(param_00))
	{
		var_04 = param_00.target_from_avatar;
		var_05 = calc_cam_lookat(param_00.fparams,param_00.var_2E6,var_04);
		var_02--;
		if(var_02 <= 0)
		{
			var_02 = var_01;
		}
	}

	param_00.var_41 = (angleclamp180(param_00.var_41[0]),angleclamp180(param_00.var_41[1]),angleclamp180(param_00.var_41[2]));
	param_00 dontinterpolate();
}

//Function Number: 118
test_pathing(param_00,param_01,param_02,param_03)
{
	level notify("stop_test_pathing");
	level endon("stop_test_pathing");
	var_04 = getentarray("player_pos","targetname");
	var_05 = param_02.spawned_avatar;
	var_06 = rotateavatartagcamera(var_05);
	var_07 = var_06.camera_tag_origin;
	var_08 = var_06.camera_tag_angles;
	var_09 = var_07;
	var_0A = var_08;
	var_0B = param_00.var_2E6;
	var_0C = var_0B + anglestoforward(param_00.var_41) * 64;
	var_0D = var_09 + anglestoforward(var_0A) * 64;
	param_00.var_2E6 = var_0B;
	param_00.var_41 = var_0A;
	param_00.obstacles = param_03;
	init_path_constants(param_00);
	build_path_info(param_00,undefined,param_00.var_2E6,var_09,var_0A);
	param_00.fparams = calc_f_from_avatar(var_05);
	param_00.targetavatar = var_05;
	for(;;)
	{
		param_00.var_2E6 = var_0B;
		param_00.var_41 = var_0A;
		debug_draw_path(param_00.path);
		debug_draw_obstacles(param_00.obstacles);
		debug_draw_aim(param_00);
		wait(0.05);
	}
}

//Function Number: 119
debug_pathing()
{
	var_00 = 0;
	var_01 = getentarray("player_pos","targetname");
	foreach(var_03 in var_01)
	{
		var_04 = getent(var_03.target,"targetname");
		if(var_04.var_39B == "camera_target")
		{
			var_03.camera_lookat = var_04;
		}

		var_05 = getent(var_04.target,"targetname");
		if(var_05.var_39B == "camera")
		{
			var_03.camera_helper = var_05;
			var_05.camera_goal = var_03;
			var_05.camera_lookat = var_03.camera_lookat;
		}
	}

	var_07 = spawn("script_model",(0,0,0));
	var_07 setmodel("tag_player");
	level.use_lookahead = 0;
	var_08 = 0;
	var_09 = 1;
	var_0A = "111111111111111111";
	var_0B = 16;
	for(;;)
	{
		if(self fragbuttonpressed())
		{
			while(self fragbuttonpressed())
			{
				wait(0.05);
			}

			var_09++;
			if(var_09 >= 12)
			{
				var_09 = 0;
			}

			if(var_09 == var_08)
			{
				var_09++;
				if(var_09 >= 12)
				{
					var_09 = 0;
				}
			}

			var_00 = 1;
		}

		if(self secondaryoffhandbuttonpressed())
		{
			while(self secondaryoffhandbuttonpressed())
			{
				wait(0.05);
			}

			var_08++;
			if(var_08 >= 12)
			{
				var_08 = 0;
			}

			if(var_09 == var_08)
			{
				var_08++;
				if(var_08 >= 12)
				{
					var_08 = 0;
				}
			}

			var_00 = 1;
		}

		if(var_00)
		{
			var_00 = 0;
			var_0C = [];
			var_0D = undefined;
			var_0E = undefined;
			foreach(var_12, var_10 in var_01)
			{
				if(getsubstr(var_0A,var_12,var_12 + 1) == "0")
				{
					continue;
				}

				var_11 = [];
				var_11["center"] = var_10.var_2E6;
				var_11["radius"] = var_0B;
				var_0C[var_0C.size] = var_11;
				if(var_10.var_39B == "" + var_08)
				{
					var_0D = var_10;
				}

				if(var_10.var_39B == "" + var_09)
				{
					var_0E = var_10;
				}
			}

			thread test_pathing(var_07,var_0D,var_0E,var_0C);
		}

		wait(0.2);
	}
}

//Function Number: 120
debug_fly(param_00)
{
	level.debug_fly = 1;
	var_01 = 30;
	var_02 = 10;
	var_03 = 10;
	var_04 = self method_844D();
	var_05 = self getnormalizedmovement();
	var_06 = anglestoforward(var_04);
	var_07 = anglestoup(var_04);
	var_08 = anglestoright(var_04);
	var_09 = 0;
	if(self adsbuttonpressed())
	{
		var_09 = -1;
	}
	else if(self attackbuttonpressed())
	{
		var_09 = 1;
	}

	if(self secondaryoffhandbuttonpressed())
	{
		var_01 = var_01 * 0.1;
		var_02 = var_02 * 0.1;
		var_03 = var_03 * 0.1;
	}

	param_00.var_41 = var_04;
	param_00.var_2E6 = param_00.var_2E6 + var_05[0] * var_01 * var_06 + var_05[1] * var_02 * var_08 + var_09 * var_03 * var_07;
}

//Function Number: 121
vlobby_vegnette(param_00,param_01)
{
	if(!isdefined(self.vegnette))
	{
		self.vegnette = newclienthudelem(self);
		self.vegnette.x = 0;
		self.vegnette.y = 0;
		self.vegnette setshader(param_01,640,480);
		self.vegnette.alignx = "left";
		self.vegnette.aligny = "top";
		self.vegnette.horzalign = "fullscreen";
		self.vegnette.vertalign = "fullscreen";
		self.vegnette.alpha = param_00;
	}

	if(isdefined(self.vegnette) && self.vegnette.alpha > 0 && param_00 == 0)
	{
		self.vegnette setshader(param_01,640,480);
		self.vegnette.alpha = 0;
	}

	if(isdefined(self.vegnette) && self.vegnette.alpha < 1 && param_00 == 1)
	{
		self.vegnette setshader(param_01,640,480);
		self.vegnette.alpha = 1;
	}
}