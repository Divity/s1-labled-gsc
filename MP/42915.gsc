/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42915.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 66
 * Decompile Time: 28 ms
 * Timestamp: 4/20/2022 8:18:28 PM
*******************************************************************/

//Function Number: 1
lib_A7A3::precacheorbital()
{
	precachemodel("tag_player");
	precachemodel("vehicle_ac130_coop");
	precachemodel("vehicle_drop_pod_base");
	precachemodel("vehicle_drop_pod_base_enemy");
	precachempanim("mp_orbital_pod_base_unfold");
	game["dialog"]["orbital_pod_destroyed"] = "orbital_pod_destroyed";
	game["dialog"]["orbital_pod_destroyed_enemy"] = "orbital_pod_destroyed_enemy";
	game["dialog"]["orbital_dropin"] = "orbital_dropin";
	game["dialog"]["orbital_notgood_tryhard"] = "orbital_notgood_tryhard";
	level.drop_pod_effect["pod_base_destroyed"] = loadfx("vfx/explosion/orbital_pod_base_explosion");
	level.drop_pod_effect["dome_impact_flash"] = loadfx("vfx/unique/orbital_dome_impact_flash");
	level.drop_pod_effect["dome_shutdown_friendly"] = loadfx("vfx/unique/orbital_dome_shutdown_friendly");
	level.drop_pod_effect["dome_shutdown_enemy"] = loadfx("vfx/unique/orbital_dome_shutdown_enemy");
	level.drop_pod_effect["player_spawn_from_pod"] = loadfx("vfx/ui/drop_pod_spawn_point_active");
	level.drop_pod_effect["drop_pod_fire_flash"] = loadfx("vfx/unique/orbital_drop_pod_fire_flash");
	level.drop_pod_effect["decel_explosion"] = loadfx("vfx/explosion/orbital_pod_decel_explosion");
	level.drop_pod_effect["dome_impact"] = loadfx("vfx/explosion/orbital_pod_impact_dome");
	level.drop_pod_effect["landing_impact"] = loadfx("vfx/smoke/drop_pod_landing_impact");
	level.drop_pod_effect["drop_pod_explode"] = loadfx("vfx/explosion/orbital_drop_pod_explode");
	level.drop_pod_effect["drop_pod_spike_impact"] = loadfx("vfx/weaponimpact/drop_pod_spike_impact");
	var_00 = getdvar("mapname");
	switch(var_00)
	{
		case "mp_refraction":
			break;

		default:
			break;
	}
}

//Function Number: 2
lib_A7A3::initializeoribtalmode()
{
	lib_A7A3::precacheorbital();
	level.drop_pod = spawnstruct();
	level.drop_pod.model = "vehicle_drop_pod_base";
	level.drop_pod.enemy_model = "vehicle_drop_pod_base_enemy";
	level.drop_pod.deploy_delay = 2;
	level.drop_pod_volume_array = getentarray("drop_pod_volume","targetname");
	level.drop_pod_bad_spawn_overlay = getentarray("orbital_bad_spawn_overlay","targetname");
	level.orbital_ships = spawnstruct();
	level.forcerespawn_time = 15;
	var_00 = getdvar("mapname");
	switch(var_00)
	{
		case "mp_refraction":
			break;

		default:
			break;
	}
}

//Function Number: 3
lib_A7A3::monitortrackswitching()
{
	level endon("game_ended");
	self.started_bank = 0;
	level.ship_pos_wait_delay = 0.5;
	var_00 = 4;
	wait(2);
	var_01 = "none";
	var_02 = self.track;
	switch(var_02)
	{
		case "right":
			break;

		case "left_big":
			break;

		case "left":
			break;

		case "right_big":
			break;

		default:
			break;
	}
}

//Function Number: 4
lib_A7A3::rotateorbitalships()
{
	level endon("game_ended");
	for(;;)
	{
		self rotateyaw(3600,1200);
		wait(1199);
	}
}

//Function Number: 5
lib_A7A3::rotateorbitalshippivots()
{
	level endon("game_ended");
	for(;;)
	{
		level.left_pivot rotateyaw(-5400,1200);
		level.left_big_pivot rotateyaw(-700,1200);
		level.right_pivot rotateyaw(5400,1200);
		level.right_big_pivot rotateyaw(700,1200);
		wait(1199);
	}
}

//Function Number: 6
lib_A7A3::spawnplayerinorbital()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("player_spawned",var_00);
		var_00 setclientomnvar("ui_orbital_toggle_hud",1);
		var_00 setclientomnvar("ui_orbital_is_dropping",1);
		if(!isbot(var_00))
		{
			var_00 disableweapons();
			var_00 playerhide();
			var_00 method_8482();
			var_00 thread lib_A7A3::setfovscale(1,0);
			var_00.isdropping = 1;
			var_00 thread lib_A7A3::showdroppodfx();
			var_00 thread lib_A7A3::playerinorbital();
			var_00 thread lib_A7A3::waitforspawnfinished();
		}
	}
}

//Function Number: 7
lib_A7A3::showdroppodfx()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	for(;;)
	{
		lib_A7A3::hidepodfx();
		foreach(var_01 in level.var_328)
		{
			if(isdefined(var_01.isdropping))
			{
				if(var_01.isdropping == 1)
				{
					var_01 lib_A7A3::showpoddroppingfxtoplayer();
					continue;
				}

				var_01 lib_A7A3::showpodgroundfxtoplayer();
			}
		}

		wait(0.05);
	}
}

//Function Number: 8
lib_A7A3::hidepodfx()
{
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01.drop_pod))
		{
			if(isdefined(var_01.drop_pod.trophyfx_friendly))
			{
				var_01.drop_pod.trophyfx_friendly hide();
			}

			if(isdefined(var_01.drop_pod.trophyfx_enemy))
			{
				var_01.drop_pod.trophyfx_enemy hide();
			}

			if(isdefined(var_01.drop_pod.trophyfx_ground_friendly))
			{
				var_01.drop_pod.trophyfx_ground_friendly hide();
			}

			if(isdefined(var_01.drop_pod.trophyfx_ground_enemy))
			{
				var_01.drop_pod.trophyfx_ground_enemy hide();
			}
		}
	}
}

//Function Number: 9
lib_A7A3::showpoddroppingfxtoplayer()
{
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01.drop_pod))
		{
			if(var_01.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				if(isdefined(var_01.drop_pod.trophyfx_friendly))
				{
					var_01.drop_pod.trophyfx_friendly showtoplayer(self);
				}
			}

			if(!var_01.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				if(isdefined(var_01.drop_pod.trophyfx_enemy))
				{
					var_01.drop_pod.trophyfx_enemy showtoplayer(self);
				}
			}
		}
	}
}

//Function Number: 10
lib_A7A3::showpodgroundfxtoplayer()
{
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01.drop_pod))
		{
			if(var_01.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				if(isdefined(var_01.drop_pod.trophyfx_ground_friendly))
				{
					var_01.drop_pod.trophyfx_ground_friendly showtoplayer(self);
				}
			}

			if(!var_01.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				if(isdefined(var_01.drop_pod.trophyfx_ground_enemy))
				{
					var_01.drop_pod.trophyfx_ground_enemy showtoplayer(self);
				}
			}
		}
	}
}

//Function Number: 11
lib_A7A3::waitforspawnfinished()
{
	level endon("game_ended");
	self endon("disconnect");
	common_scripts\utility::waittill_any("player_drop_pod_spawned","player_spawned_at_drop_pod");
	self.isdropping = 0;
	thread lib_A7A3::setorbitalview("off",0);
	thread lib_A7A3::hideoverlays();
	thread lib_A7A3::destroyplayericons();
}

//Function Number: 12
lib_A7A3::playerinorbital()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	level endon("game_ended");
	if(!isbot(self))
	{
		if(!isdefined(self.prematch_over))
		{
			self.prematch_over = 0;
		}

		if(!isdefined(self.respawn_mode))
		{
			self.respawn_mode = 0;
		}

		if(!isdefined(self.mode_button_released))
		{
			self.mode_button_released = 0;
		}

		self.spawn_button_released = 0;
		self.is_linked_to_pod = 0;
		self.is_linked_to_ship = 0;
		if(self.prematch_over == 0)
		{
			self disableweapons();
			self method_8482();
			if(!self islinked())
			{
				lib_A7A3::linkplayerorbitalship();
			}
		}

		maps\mp\_utility::gameflagwait("prematch_done");
		self.prematch_over = 1;
		self disableweapons();
		self method_8482();
		self.forcerespawn_timer = level.forcerespawn_time;
		var_00 = level.forcerespawn_time * 1000 + gettime();
		self setclientomnvar("ui_orbital_toggle_color",0);
		self setclientomnvar("ui_orbital_timer_time",var_00);
		thread lib_A7A3::droppodforcerespawn();
		self.forcerespawn = 0;
		if(isdefined(self.drop_pod) && self.drop_pod.destroyed == 0)
		{
			self.respawn_mode = 1;
		}

		for(;;)
		{
			if(isdefined(self.drop_pod) && self.drop_pod.destroyed == 0 && self.respawn_mode == 1)
			{
				if(self.is_linked_to_pod == 0)
				{
					if(self islinked())
					{
						self unlink();
					}

					lib_A7A3::linkplayerpod();
				}
			}

			if(!isdefined(self.drop_pod) || self.drop_pod.destroyed == 1 || self.respawn_mode == 0)
			{
				if(self.is_linked_to_ship == 0)
				{
					if(self islinked())
					{
						self unlink();
					}

					lib_A7A3::linkplayerorbitalship();
				}
			}

			if(!self adsbuttonpressed())
			{
				self.mode_button_released = 1;
			}

			if(!self attackbuttonpressed())
			{
				self.spawn_button_released = 1;
			}

			if(self adsbuttonpressed() && self.mode_button_released == 1)
			{
				self.mode_button_released = 0;
				if(self.respawn_mode == 0 && isdefined(self.drop_pod) && self.drop_pod.destroyed == 0)
				{
					self.respawn_mode = 1;
					if(self.is_linked_to_pod == 0)
					{
						if(self islinked())
						{
							self unlink();
						}

						lib_A7A3::linkplayerpod();
					}
				}
				else if(self.respawn_mode == 1)
				{
					self.respawn_mode = 0;
					if(self.is_linked_to_ship == 0)
					{
						if(self islinked())
						{
							self unlink();
						}

						lib_A7A3::linkplayerorbitalship();
					}
				}

				continue;
			}

			if((self attackbuttonpressed() && self.spawn_button_released == 1) || self.forcerespawn)
			{
				self.spawn_button_released = 0;
				if(isdefined(self.drop_pod) && self.drop_pod.destroyed == 0 && self.respawn_mode == 1 && self.is_linked_to_pod == 1)
				{
					if(isdefined(self.drop_pod))
					{
						if(isdefined(self.drop_pod.spawn_fx))
						{
							self.drop_pod.spawn_fx delete();
						}
					}

					var_01 = self getplayerangles();
					self unlink();
					self notify("player_spawned_at_drop_pod");
					thread lib_A7A3::setorbitalview("off",0);
					self setplayerangles(var_01);
					self setorigin(self.drop_pod.var_2E6);
					self enableweapons();
					self method_8006();
					self method_8481();
					return;
				}
				else if(self.respawn_mode == 0 && self.is_linked_to_ship == 1)
				{
					var_02 = lib_A7A3::_fire(self.lifeid,self);
					return;
				}
			}

			wait(0.05);
		}

		return;
	}

	lib_A7A3::linkplayerorbitalship();
	var_02 = lib_A7A3::_fire(self.lifeid,self);
	if(isdefined(var_02))
	{
		self setorigin(var_02.var_2E6);
		lib_A7A3::createplayerdroppod(var_02.var_2E6);
		self.drop_pod thread lib_A7A3::drop_pod_handledeath();
		wait(0.05);
	}
}

//Function Number: 13
lib_A7A3::linkplayerpod()
{
	self.is_linked_to_pod = 1;
	self.is_linked_to_ship = 0;
	self.isdropping = 0;
	lib_A7A3::destroyplayericons();
	lib_A7A3::showplayericons("friendly");
	self notify("switched_to_pod_view");
	thread lib_A7A3::setorbitalview("pod",0);
	self dontinterpolate();
	self playerlinkto(self.drop_pod.camera,"tag_player",0);
	self.drop_pod.spawn_fx = spawnfx(level.drop_pod_effect["player_spawn_from_pod"],self.drop_pod.var_2E6,self.drop_pod.forward);
	triggerfx(self.drop_pod.spawn_fx);
	thread lib_A7A3::centerpodspawnview();
}

//Function Number: 14
lib_A7A3::linkplayerorbitalship()
{
	self.is_linked_to_pod = 0;
	self.is_linked_to_ship = 1;
	self.isdropping = 1;
	lib_A7A3::destroyplayericons();
	thread lib_A7A3::showplayericons("both");
	if(!isdefined(self.is_first_drop))
	{
		self.is_first_drop = 0;
	}
	else
	{
		thread maps\mp\_utility::leaderdialogonplayer("orbital_dropin",undefined,undefined,self.var_2E6);
	}

	if(isdefined(self.drop_pod))
	{
		self setclientomnvar("ui_orbital_toggle_switch",0);
		if(isdefined(self.drop_pod.spawn_fx))
		{
			self.drop_pod.spawn_fx delete();
		}
	}
	else
	{
		self setclientomnvar("ui_orbital_toggle_switch",1);
	}

	var_00 = 0.3;
	thread lib_A7A3::setorbitalview("ship",0);
	var_01 = getdvar("mapname");
	self dontinterpolate();
	switch(var_01)
	{
		case "mp_refraction":
			break;

		default:
			break;
	}
}

//Function Number: 15
lib_A7A3::unlinkplayer()
{
	self dontinterpolate();
	self controlsunlink();
	self cameraunlink();
	self unlink();
	self freezecontrols(1);
	self enableweapons();
	self method_8481();
}

//Function Number: 16
lib_A7A3::centerorbitalview()
{
	var_00 = level.orbital_ships.cameraview[self.connectedpostgame["team"]].var_2E6;
	var_01 = level.orbital_ships.missilespawn["target"].var_2E6;
	var_02 = vectortoangles(var_01 - var_00);
	self setplayerangles(var_02);
}

//Function Number: 17
lib_A7A3::centerpodspawnview()
{
	var_00 = self.drop_pod.camera.var_2E6;
	var_01 = level.orbital_ships.missilespawn["target"].var_2E6;
	var_02 = vectortoangles(var_01 - var_00);
	var_02 = var_02 * (0,1,0);
	self setplayerangles(var_02);
}

//Function Number: 18
lib_A7A3::setorbitalview(param_00,param_01)
{
	self setclientomnvar("ui_orbital_toggle_ship_view",2);
	self setclientomnvar("ui_orbital_toggle_pod_view",2);
	self setclientomnvar("ui_orbital_toggle_drop_view",2);
	wait(param_01);
	switch(param_00)
	{
		case "ship":
			break;

		case "pod":
			break;

		case "drop":
			break;

		case "off":
			break;

		default:
			break;
	}
}

//Function Number: 19
lib_A7A3::tracecollisionwarn()
{
	self endon("player_drop_pod_spawned");
	self endon("disconnect");
	self endon("player_spawned_at_drop_pod");
	self endon("joined_team");
	self endon("death");
	self endon("switched_to_pod_view");
	for(;;)
	{
		var_00 = self getplayerangles();
		var_01 = self geteye() + anglestoforward(var_00) * 20;
		var_02 = var_01 + anglestoforward(var_00) * 30000;
		var_03 = function_0238(var_01,var_02);
		var_03["position"] = var_03["position"] + (0,0,10);
		level.trace = var_03;
		if(isdefined(var_03["position"]))
		{
			var_04 = var_03["position"];
			var_05 = 0;
			var_06 = spawn("script_origin",var_04);
			var_06.targetname = "orbital_trace_position";
			foreach(var_08 in level.drop_pod_volume_array)
			{
				var_09 = var_06 istouching(var_08);
				var_0A = canspawn(var_04);
				if(var_09 && var_0A)
				{
					var_05 = 1;
					break;
				}
			}

			var_06 delete();
			if(var_05 == 1)
			{
				self setclientomnvar("ui_orbital_collision_warn",0);
			}
			else
			{
				self setclientomnvar("ui_orbital_collision_warn",1);
			}
		}

		wait(0.15);
	}
}

//Function Number: 20
lib_A7A3::_fire(param_00,param_01)
{
	param_01 endon("death");
	var_02 = 0.3;
	param_01 thread lib_A7A3::setorbitalview("drop",0);
	thread lib_A7A3::setfovscale(4.333,0.1);
	param_01 lib_A7A3::destroyplayericons();
	param_01 lib_A7A3::showplayericons("friendly");
	if(!isbot(param_01))
	{
		param_01.orbital_location = param_01 geteye();
		param_01.orbital_viewangles = param_01 getplayerangles();
		param_01.orbital_forward = anglestoforward(param_01.orbital_viewangles);
		param_01.orbital_endpoint = param_01.orbital_location + param_01.orbital_forward * 5000;
		var_03 = magicbullet("orbital_drop_pod_mp",param_01.orbital_location,self.orbital_endpoint,param_01);
		var_03 thread lib_A7A3::aud_drop_pod_fire(param_01);
		var_03 thread lib_A7A3::aud_play_rocket_travel_loops(param_01);
	}
	else
	{
		var_02.orbital_location = level.orbital_ships.cameraview[self.connectedpostgame["team"]].var_2E6;
		var_04 = level.orbital_ships.cameraview[self.connectedpostgame["team"]].var_2E6;
		var_05 = level.orbital_ships.missilespawn["target"].var_2E6;
		param_01.orbital_viewangles = vectortoangles(var_05 - var_04);
		param_01.orbital_forward = anglestoforward(param_01.orbital_viewangles);
		param_01.orbital_endpoint = var_04 + param_01.orbital_forward * 5000;
		var_03 = magicbullet("orbital_drop_pod_mp",var_04,self.orbital_endpoint,param_01);
		var_03 thread lib_A7A3::aud_drop_pod_fire(param_01);
		var_03 thread lib_A7A3::aud_play_rocket_travel_loops(param_01);
	}

	playfx(level.drop_pod_effect["drop_pod_fire_flash"],param_01.orbital_location,param_01.orbital_forward);
	thread lib_A7A3::destroyplayerdroppod();
	self notify("drop_pod_spawned");
	if(!isdefined(var_03))
	{
		return;
	}

	var_03.trigger = spawn("trigger_radius",var_03.var_2E6,0,128,256);
	if(param_01 islinked())
	{
		param_01 unlink();
		param_01 dontinterpolate();
		param_01 playerlinkto(var_03);
	}

	var_03.owner = param_01;
	var_03.lifeid = param_00;
	var_03.type = "orbital_drop_pod_mp";
	var_03.inliveplayerkillstreak = param_01.inliveplayerkillstreak;
	level.remotemissileinprogress = 1;
	var_03 thread lib_A7A3::createkillcamentity();
	param_01.rocket = var_03;
	wait(0.1);
	var_06 = lib_A7A3::missileeyes(param_01,var_03);
	return var_06;
}

//Function Number: 21
lib_A7A3::setfovscale(param_00,param_01)
{
	if(isdefined(param_01))
	{
		wait(param_01);
	}

	self setclientdvar("cg_fovScale",param_00);
}

//Function Number: 22
lib_A7A3::missileeyes(param_00,param_01)
{
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	param_00 endon("death");
	param_01 thread lib_A7A3::rocket_cleanupondeath();
	param_00 thread lib_A7A3::player_cleanupongameended(param_01);
	param_00 thread lib_A7A3::player_cleanuponteamchange(param_01);
	param_01 thread lib_A7A3::waitforrocketimpact(param_00);
	param_01 thread lib_A7A3::waitforrocketdeath(param_00);
	var_02 = getdvar("mapname");
	param_00 visionsetmissilecamforplayer(var_02,0);
	param_00 endon("disconnect");
	param_00.spawn_was_good = 0;
	var_03 = undefined;
	var_04 = (0,0,0);
	if(isdefined(param_01))
	{
		param_00 cameralinkto(param_01,"tag_origin");
		param_00 controlslinkto(param_01);
		param_01 thread lib_A7A3::trackrocket(param_00);
		param_01 thread lib_A7A3::droppodtrophysystem();
		if(getdvarint("camera_thirdPerson"))
		{
			param_00 maps\mp\_utility::setthirdpersondof(0);
		}

		param_00 common_scripts\utility::waittill_any("rocket_impacted","rocket_destroyed");
		param_01 thread lib_A7A3::aud_play_pod_impact(param_00);
		param_00 lib_A7A3::destroyplayericons();
		param_00 notify("player_drop_pod_spawned");
		param_00 lib_A7A3::unlinkplayer();
		if(!level.gameended || isdefined(param_00.finalkill))
		{
			thread lib_A7A3::setfovscale(1,0);
		}

		if(getdvarint("camera_thirdPerson"))
		{
			param_00 maps\mp\_utility::setthirdpersondof(1);
		}
	}
	else
	{
	}

	var_05 = 0.3;
	if(param_00.spawn_was_good == 1 && isdefined(param_00.nearest_node))
	{
		param_00 lib_A7A3::createplayerdroppod(param_00.nearest_node.var_2E6);
		param_00 setorigin(param_00.drop_pod.var_2E6);
		param_00 setplayerangles((0,param_00.var_41[1],0));
		param_00 thread lib_A7A3::unfreezecontrolsdelay(var_05);
		param_00 method_8006();
		param_00.nearest_node = undefined;
		param_00 thread lib_A7A3::droppodbaseunfold();
		param_00.drop_pod thread lib_A7A3::drop_pod_handledeath();
		param_00.drop_pod thread lib_A7A3::aud_drop_pod_land_success(param_00);
	}
	else
	{
		param_00 setorigin(param_00.impact_info["rocket_position"]);
		param_00 thread lib_A7A3::droppodbadspawndeathfx();
		param_00 maps\mp\gametypes\_damage::addattacker(param_00,param_00,param_00.rocket.killcament,"orbital_drop_pod_mp",999999,(0,0,0),param_00.var_2E6,"none",0,"MOD_EXPLOSIVE");
		param_00 thread lib_A7A3::unfreezecontrolsdelay(var_05);
		thread lib_A7A3::aud_drop_pod_land_fail(param_00);
		param_00 thread maps\mp\gametypes\_damage::finishplayerdamagewrapper(param_00.rocket.killcament,param_00,999999,0,"MOD_EXPLOSIVE","orbital_drop_pod_mp",param_00.var_2E6,param_00.var_2E6,"none",0,0);
		param_00 thread maps\mp\_utility::leaderdialogonplayer("orbital_notgood_tryhard",undefined,undefined,self.var_2E6);
	}

	return var_03;
}

//Function Number: 23
lib_A7A3::waitforrocketimpact(param_00)
{
	level endon("game_ended");
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	param_00 endon("death");
	for(;;)
	{
		param_00 waittill("projectile_impact",var_01,var_02,var_03,var_04);
		if(var_01 == "orbital_drop_pod_mp")
		{
			break;
		}
	}

	param_00.spawn_was_good = 1;
	param_00 notify("rocket_impacted");
}

//Function Number: 24
lib_A7A3::waitforrocketdeath(param_00)
{
	level endon("game_ended");
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	param_00 endon("death");
	self waittill("death");
	if(isdefined(self))
	{
		self delete();
	}

	param_00 cameraunlink();
	param_00 controlsunlink();
	param_00 lib_A7A3::setfovscale(1,0);
	param_00 notify("rocket_destroyed");
}

//Function Number: 25
lib_A7A3::vmlandingimpact()
{
	wait(0.5);
	self stunplayer(0.3);
}

//Function Number: 26
lib_A7A3::droppodbaseunfold()
{
	wait(level.drop_pod.deploy_delay - 1);
	self.drop_pod thread lib_A7A3::droppodspikeimpacts();
	self.drop_pod_enemy_model thread lib_A7A3::droppodspikeimpacts();
	self.drop_pod scriptmodelplayanimdeltamotion("mp_orbital_pod_base_unfold");
	self.drop_pod_enemy_model scriptmodelplayanimdeltamotion("mp_orbital_pod_base_unfold");
}

//Function Number: 27
lib_A7A3::droppodspikeimpacts()
{
	wait(0.68);
	var_00 = 2;
	var_01 = [];
	var_02 = [];
	var_01[0] = self gettagorigin("J_spike_FL");
	var_02[0] = self gettagangles("J_spike_FL");
	var_01[1] = self gettagorigin("J_spike_BL");
	var_02[1] = self gettagangles("J_spike_BL");
	var_01[2] = self gettagorigin("J_spike_BR");
	var_02[2] = self gettagangles("J_spike_BR");
	var_01[3] = self gettagorigin("J_spike_FR");
	var_02[3] = self gettagangles("J_spike_FR");
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		var_04 = var_01[var_03] - 8 * anglestoforward(var_02[var_03]);
		var_05 = var_01[var_03] + var_00 * anglestoforward(var_02[var_03]);
		var_06 = bullettrace(var_04,var_05,0,self);
		if(isdefined(var_06["position"]))
		{
			playfx(level.drop_pod_effect["drop_pod_spike_impact"],var_06["position"],anglestoforward((270,0,0)));
		}
	}
}

//Function Number: 28
lib_A7A3::trackrocket(param_00)
{
	self endon("death");
	self.owner endon("disconnect");
	self.owner endon("joined_team");
	self.owner endon("joined_spectators");
	for(;;)
	{
		param_00.impact_info["rocket_position"] = self.var_2E6;
		var_01 = self.var_2E6;
		var_02 = self.var_41;
		var_03 = anglestoforward(var_02);
		var_04 = var_01 + var_03 * 512;
		var_05 = function_0238(var_01,var_04);
		self.trigger dontinterpolate();
		self.trigger.var_2E6 = var_05["position"] + (0,0,-128);
		var_06 = self.trigger thread lib_A7A3::getnearestpathnode();
		if(isdefined(var_06))
		{
			self.owner.nearest_node = var_06;
			self hide();
			playfxontag(level.drop_pod_effect["decel_explosion"],self,"tag_origin");
			var_01 = self.var_2E6;
			var_04 = var_06.var_2E6;
			var_02 = vectortoangles(var_04 - var_01);
			self.var_41 = var_02;
			self.trigger delete();
			break;
		}

		wait(0.05);
	}
}

//Function Number: 29
lib_A7A3::unfreezecontrolsdelay(param_00)
{
	wait(param_00);
	self freezecontrols(0);
}

//Function Number: 30
lib_A7A3::droppodbadspawndeathfx()
{
	self endon("disconnect");
	self waittill("death");
	playfx(level.drop_pod_effect["drop_pod_explode"],self.var_2E6 + (0,0,10));
}

//Function Number: 31
lib_A7A3::getnearestpathnode()
{
	var_00 = getnodesintrigger(self);
	if(isdefined(var_00) && var_00.size > 0)
	{
		var_01 = 0;
		var_02 = distancesquared(self.var_2E6,var_00[0].var_2E6);
		var_03 = 0;
		if(var_03 < var_00.size)
		{
			switch(var_00[var_03].type)
			{
				case "Cover Right":
				case "Cover Left":
				case "Begin":
				case "Cover Stand":
				case "End":
					break;

				default:
					break;
			}
		}
	}
}

//Function Number: 32
lib_A7A3::rocket_cleanupondeath()
{
	var_00 = self getentitynumber();
	level.rockets[var_00] = self;
	self waittill("death");
	level.rockets[var_00] = undefined;
	level.remotemissileinprogress = undefined;
}

//Function Number: 33
lib_A7A3::player_cleanupongameended(param_00)
{
	param_00 endon("death");
	self endon("death");
	level waittill("game_ended");
	self controlsunlink();
	self cameraunlink();
	if(getdvarint("camera_thirdPerson"))
	{
		maps\mp\_utility::setthirdpersondof(1);
	}
}

//Function Number: 34
lib_A7A3::player_cleanuponteamchange(param_00)
{
	param_00 endon("death");
	self endon("disconnect");
	common_scripts\utility::waittill_any("joined_team","joined_spectators");
	if(self.inliveplayerkillstreak != "spectator")
	{
		self controlsunlink();
		self cameraunlink();
		if(getdvarint("camera_thirdPerson"))
		{
			maps\mp\_utility::setthirdpersondof(1);
		}
	}

	lib_A7A3::setfovscale(1,0);
	level.remotemissileinprogress = undefined;
}

//Function Number: 35
lib_A7A3::droppod_cleanuponteamchange()
{
	self.drop_pod endon("death");
	common_scripts\utility::waittill_any("joined_team","joined_spectators");
	lib_A7A3::deleteplayerdroppod();
}

//Function Number: 36
lib_A7A3::droppod_cleanupondisconnect()
{
	self.drop_pod endon("death");
	self waittill("disconnect");
	lib_A7A3::deleteplayerdroppod();
}

//Function Number: 37
lib_A7A3::createplayerdroppod(param_00)
{
	lib_A7A3::deleteplayerdroppod();
	if(!isdefined(param_00))
	{
	}

	var_01 = param_00 + (0,0,32);
	var_02 = param_00 + (0,0,-1024);
	var_03 = function_0238(var_01,var_02);
	var_04 = var_03["position"];
	var_05 = vectortoangles(var_03["normal"]);
	var_06 = anglestoforward(var_05);
	var_05 = var_05 + (180,0,0);
	playfx(level.drop_pod_effect["landing_impact"],var_04,var_03["normal"]);
	self.drop_pod = spawn("script_model",var_04);
	self.drop_pod.var_41 = var_05;
	self.drop_pod.forward = var_06;
	self.drop_pod setmodel(level.drop_pod.model);
	self.drop_pod solid();
	self.drop_pod setcandamage(1);
	self.drop_pod setcanradiusdamage(1);
	self.drop_pod.hidden = 0;
	self.drop_pod.owner = self;
	self.drop_pod.destroyed = 0;
	self.drop_pod.health = 999999;
	self.drop_pod.var_275 = 100;
	self.drop_pod.damagetaken = 0;
	self.drop_pod hide();
	self.drop_pod_enemy_model = spawn("script_model",self.drop_pod.var_2E6);
	self.drop_pod_enemy_model setmodel(level.drop_pod.enemy_model);
	self.drop_pod_enemy_model.var_41 = self.drop_pod.var_41;
	self.drop_pod_enemy_model.owner = self;
	self.drop_pod_enemy_model hide();
	self.drop_pod_enemy_model notsolid();
	foreach(var_08 in level.var_328)
	{
		if(var_08.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			self.drop_pod showtoplayer(var_08);
			continue;
		}

		self.drop_pod_enemy_model showtoplayer(var_08);
	}

	self.drop_pod thread lib_A7A3::aud_setup_drop_pod_loop();
	self.drop_pod.camera = spawn("script_model",self.drop_pod.var_2E6);
	self.drop_pod.camera setmodel("tag_player");
	self.drop_pod.camera.var_41 = (0,0,0);
	self.drop_pod.camera hide();
	self.isdropping = 0;
	self.drop_pod thread lib_A7A3::podsetuptrophyfx(self);
	thread lib_A7A3::droppod_cleanupondisconnect();
	thread lib_A7A3::droppod_cleanuponteamchange();
}

//Function Number: 38
lib_A7A3::destroyplayerdroppod()
{
	if(!isdefined(self.drop_pod))
	{
		return;
	}

	self endon("player_drop_pod_spawned");
	var_00 = self.drop_pod;
	var_01 = level.drop_pod_effect["pod_base_destroyed"];
	var_02 = level.drop_pod_effect["dome_shutdown_friendly"];
	var_03 = level.drop_pod_effect["dome_shutdown_enemy"];
	playfx(var_01,var_00.var_2E6,var_00.forward);
	var_00 hide();
	self.drop_pod_enemy_model hide();
	var_00.shutdown_fx_friendly = spawnfx(var_02,var_00.var_2E6,var_00.forward);
	var_00.shutdown_fx_enemy = spawnfx(var_03,var_00.var_2E6,var_00.forward);
	triggerfx(var_00.shutdown_fx_friendly);
	var_00.shutdown_fx_friendly hide();
	triggerfx(var_00.shutdown_fx_enemy);
	var_00.shutdown_fx_enemy hide();
	var_00 thread lib_A7A3::aud_destroy_deployed_pod();
	foreach(var_05 in level.var_328)
	{
		if(var_05.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			var_00.shutdown_fx_friendly showtoplayer(var_05);
			continue;
		}

		var_00.shutdown_fx_enemy showtoplayer(var_05);
	}

	wait(0.7);
	lib_A7A3::deleteplayerdroppod();
}

//Function Number: 39
lib_A7A3::deleteplayerdroppod()
{
	if(isdefined(self.drop_pod_enemy_model))
	{
		self.drop_pod_enemy_model delete();
	}

	if(isdefined(self.drop_pod))
	{
		lib_A7A3::deleteplayerdroppodvfx();
		if(isdefined(self.drop_pod.camera))
		{
			self.drop_pod.camera delete();
		}

		self.drop_pod delete();
	}
}

//Function Number: 40
lib_A7A3::deleteplayerdroppodvfx()
{
	if(isdefined(self.drop_pod))
	{
		if(isdefined(self.drop_pod.trophyfx_friendly))
		{
			self.drop_pod.trophyfx_friendly delete();
		}

		if(isdefined(self.drop_pod.trophyfx_enemy))
		{
			self.drop_pod.trophyfx_enemy delete();
		}

		if(isdefined(self.drop_pod.trophyfx_ground_friendly))
		{
			self.drop_pod.trophyfx_ground_friendly delete();
		}

		if(isdefined(self.drop_pod.trophyfx_ground_enemy))
		{
			self.drop_pod.trophyfx_ground_enemy delete();
		}

		if(isdefined(self.drop_pod.shutdown_fx_enemy))
		{
			self.drop_pod.shutdown_fx_enemy delete();
		}

		if(isdefined(self.drop_pod.shutdown_fx_enemy))
		{
			self.drop_pod.shutdown_fx_enemy delete();
		}

		if(isdefined(self.drop_pod.spawn_fx))
		{
			self.drop_pod.spawn_fx delete();
		}
	}
}

//Function Number: 41
lib_A7A3::createkillcamentity()
{
	var_00 = (-512,0,128);
	self.killcament = spawn("script_model",self.var_2E6);
	self.killcament setscriptmoverkillcam("explosive");
	self.killcament linkto(self,"tag_origin",var_00,(0,0,0));
	self.killcament setcontents(0);
	self.killcament.starttime = gettime();
	self.killcament.var_5166 = 1;
}

//Function Number: 42
lib_A7A3::removekillcamentity()
{
	if(isdefined(self.killcament))
	{
		self.killcament delete();
	}
}

//Function Number: 43
lib_A7A3::drop_pod_handledeath()
{
	var_00 = self getentitynumber();
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	self.owner thread maps\mp\_utility::leaderdialogonplayer("orbital_pod_destroyed_enemy",undefined,undefined,self.owner.var_2E6);
	self.owner lib_A7A3::destroyplayerdroppod();
}

//Function Number: 44
lib_A7A3::droppodtrophysystem()
{
	self endon("death");
	self.owner endon("disconnect");
	self.owner endon("joined_team");
	self.owner endon("joined_spectators");
	while(isdefined(self))
	{
		foreach(var_01 in level.var_328)
		{
			if(var_01.inliveplayerkillstreak != self.owner.inliveplayerkillstreak)
			{
				if(isdefined(var_01.drop_pod))
				{
					if(distancesquared(self.var_2E6,var_01.drop_pod.var_2E6) < 40000 && self.owner.health > 0)
					{
						var_01.drop_pod thread lib_A7A3::droppodtrophykill(self,var_01);
					}
				}
			}
		}

		foreach(var_04 in level.trophies)
		{
			if(isdefined(var_04))
			{
				if(distancesquared(self.var_2E6,var_04.var_2E6) < 40000 && var_04.owner.health > 0)
				{
					var_04 thread lib_A7A3::droppodtrophykill(self,var_04.owner);
					var_04.ammo--;
					if(var_04.ammo <= 0)
					{
						var_04 thread maps\mp\gametypes\_equipment::trophybreak();
					}
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 45
lib_A7A3::droppodtrophykill(param_00,param_01)
{
	param_00 notify("destroyed");
	playfx(level.sentry_fire,self.var_2E6 + (0,0,0),param_00.var_2E6 - self.var_2E6,anglestoup(self.var_41));
	self playsoundasmaster("trophy_detect_projectile");
	if(isdefined(param_00.classname) && param_00.classname == "rocket" && isdefined(param_00.type) && param_00.type == "remote")
	{
		if(isdefined(param_00.type) && param_00.type == "remote")
		{
			level thread maps\mp\gametypes\_missions::vehiclekilled(param_00.owner,param_01,undefined,param_01,undefined,"MOD_EXPLOSIVE","trophy_mp");
			level thread maps\mp\_utility::teamplayercardsplash("callout_destroyed_predator_missile",param_01);
			level thread maps\mp\gametypes\_rank::awardgameevent("kill",param_01,"trophy_mp",undefined,"MOD_EXPLOSIVE");
		}

		thread lib_A7A3::aud_drop_pod_trophy_kill();
	}

	param_01 thread lib_A7A3::projectileexplode(param_00,self);
}

//Function Number: 46
lib_A7A3::projectileexplode(param_00,param_01)
{
	var_02 = param_00.var_2E6;
	var_03 = param_00.model;
	var_04 = param_00.var_41;
	var_05 = param_00.owner;
	var_06 = param_01.owner;
	var_07 = var_06.drop_pod;
	var_08 = level.drop_pod_effect["dome_impact_flash"];
	var_09 = level.drop_pod_effect["dome_impact"];
	var_0A = param_01.var_2E6;
	var_0B = var_02;
	var_0C = vectortoangles(var_0B - var_0A);
	var_0D = anglestoforward(var_0C);
	var_0E = anglestoup(var_0C);
	playfx(var_09,var_02,var_0D,var_0E);
	playfxontag(var_08,var_07,"tag_origin");
	waittillframeend;
	if(var_05.health <= 0)
	{
		return;
	}

	var_05 thread lib_A7A3::setfovscale(1,0);
	var_05 unlink();
	var_05 cameraunlink();
	var_05 setorigin(var_02);
	var_05 maps\mp\gametypes\_damage::addattacker(var_05,var_05,var_05.rocket.killcament,"orbital_drop_pod_mp",999999,(0,0,0),var_05.var_2E6,"none",0,"MOD_EXPLOSIVE");
	var_05 thread maps\mp\gametypes\_damage::finishplayerdamagewrapper(var_05.rocket.killcament,var_05,999999,0,"MOD_EXPLOSIVE","orbital_drop_pod_mp",var_05.var_2E6,var_05.var_2E6,"none",0,0);
	if(isdefined(param_00))
	{
		param_00 delete();
	}

	param_01 thread lib_A7A3::aud_play_trophy_fire();
	radiusdamage(var_02,128,105,10,self,"MOD_EXPLOSIVE","trophy_mp");
	var_05 thread maps\mp\_utility::leaderdialogonplayer("orbital_pod_destroyed",undefined,undefined,var_05.var_2E6);
}

//Function Number: 47
lib_A7A3::podsetuptrophyfx(param_00)
{
	self endon("death");
	param_00 endon("disconnect");
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	self.trophyfx_friendly = spawnfx(level.drop_pod_dome["friendly"],self.var_2E6,self.forward);
	triggerfx(self.trophyfx_friendly);
	self.trophyfx_friendly hide();
	self.trophyfx_enemy = spawnfx(level.drop_pod_dome["enemy"],self.var_2E6,self.forward);
	triggerfx(self.trophyfx_enemy);
	self.trophyfx_enemy hide();
	wait(level.drop_pod.deploy_delay - 0.5);
	self.trophyfx_ground_friendly = spawnfx(level.drop_pod_dome_ground["friendly"],self.var_2E6,self.forward);
	triggerfx(self.trophyfx_ground_friendly);
	self.trophyfx_ground_enemy = spawnfx(level.drop_pod_dome_ground["enemy"],self.var_2E6,self.forward);
	triggerfx(self.trophyfx_ground_enemy);
	self.trophyfx_ground_enemy hide();
	thread lib_A7A3::deletepodtrophyfxondeath(param_00);
	thread lib_A7A3::deletepodtrophyfxondisconnect(param_00);
	thread lib_A7A3::deletepodtrophyfxonteamchange(param_00);
}

//Function Number: 48
lib_A7A3::showplayericons(param_00)
{
	self endon("death");
	var_01 = level.var_328;
	var_03 = getfirstarraykey(var_01);
	if(isdefined(var_03))
	{
		var_02 = var_01[var_03];
		if(var_02 == self || isdefined(var_02.isdropping))
		{
			continue;
		}

		switch(param_00)
		{
			case "friendly":
				break;

			case "enemy":
				break;

			case "both":
				break;

			default:
				break;
		}
	}
}

//Function Number: 49
lib_A7A3::destroyplayericons()
{
	level endon("game_ended");
	self endon("disconnect");
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01.entityheadicons))
		{
			if(isdefined(var_01.entityheadicons[self.assistedsuicide]))
			{
				var_01.entityheadicons[self.assistedsuicide] destroy();
				var_01.entityheadicons[self.assistedsuicide] = undefined;
			}
		}
	}
}

//Function Number: 50
lib_A7A3::showdroppodbadspawnoverlay()
{
	level endon("game_ended");
	for(;;)
	{
		lib_A7A3::hideoverlays();
		foreach(var_01 in level.var_328)
		{
			if(isdefined(var_01.isdropping))
			{
				if(var_01.isdropping)
				{
					var_01 lib_A7A3::showoverlaystoplayer();
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 51
lib_A7A3::showoverlaystoplayer()
{
	foreach(var_01 in level.drop_pod_bad_spawn_overlay)
	{
		var_01 showtoplayer(self);
	}
}

//Function Number: 52
lib_A7A3::hideoverlays()
{
	foreach(var_01 in level.drop_pod_bad_spawn_overlay)
	{
		var_01 hide();
	}
}

//Function Number: 53
lib_A7A3::deletepodtrophyfxondeath(param_00)
{
	param_00 endon("disconnect");
	self waittill("death");
	lib_A7A3::deletepodtrophyfx();
}

//Function Number: 54
lib_A7A3::deletepodtrophyfxondisconnect(param_00)
{
	self endon("death");
	param_00 waittill("disconnect");
	lib_A7A3::deletepodtrophyfx();
}

//Function Number: 55
lib_A7A3::deletepodtrophyfxonteamchange(param_00)
{
	self endon("death");
	param_00 common_scripts\utility::waittill_any("joined_team","joined_spectators");
	lib_A7A3::deletepodtrophyfx();
}

//Function Number: 56
lib_A7A3::deletepodtrophyfx()
{
	if(isdefined(self.trophyfx_friendly))
	{
		self.trophyfx_friendly delete();
	}

	if(isdefined(self.trophyfx_enemy))
	{
		self.trophyfx_enemy delete();
	}
}

//Function Number: 57
lib_A7A3::droppodforcerespawn()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	self endon("player_drop_pod_spawned");
	self endon("player_spawned_at_drop_pod");
	level endon("game_ended");
	self.forcerespawn = 0;
	if(!isdefined(self.forcerespawn_timer))
	{
		self.forcerespawn_timer = level.forcerespawn_time;
	}

	while(self.forcerespawn_timer > 0)
	{
		if(self.forcerespawn_timer <= 5)
		{
			self setclientomnvar("ui_orbital_toggle_color",1);
		}

		self.forcerespawn_timer--;
		wait(1);
	}

	self.forcerespawn = 1;
}

//Function Number: 58
lib_A7A3::aud_play_rocket_travel_loops(param_00)
{
	var_01 = self;
	thread maps\mp\_audio::snd_play_linked_loop("orbital_drop_pod_proj",var_01);
}

//Function Number: 59
lib_A7A3::aud_play_pod_impact(param_00)
{
	var_01 = self;
}

//Function Number: 60
lib_A7A3::aud_drop_pod_fire(param_00)
{
	var_01 = self;
	param_00 method_82F4("orbital_drop_pod_fire_plr");
}

//Function Number: 61
lib_A7A3::aud_drop_pod_land_success(param_00)
{
	var_01 = self;
	thread maps\mp\_audio::snd_play_linked("orbital_drop_pod_impact",var_01);
	param_00 method_82F4("orbital_drop_pod_impact");
}

//Function Number: 62
lib_A7A3::aud_drop_pod_land_fail(param_00)
{
	var_01 = self;
	thread maps\mp\_audio::snd_play_linked("orbital_drop_pod_impact",var_01);
	param_00 method_82F4("orbital_drop_pod_impact");
}

//Function Number: 63
lib_A7A3::aud_destroy_deployed_pod()
{
	var_00 = self;
	var_00 playsoundasmaster("orbital_drop_pod_platform_exp");
}

//Function Number: 64
lib_A7A3::aud_drop_pod_trophy_kill()
{
	var_00 = self;
}

//Function Number: 65
lib_A7A3::aud_play_trophy_fire()
{
	var_00 = self;
}

//Function Number: 66
lib_A7A3::aud_setup_drop_pod_loop()
{
	thread maps\mp\_audio::snd_play_linked_loop("orbital_drop_pod_platform_lp",self);
	self waittill("Death");
	if(isdefined(self))
	{
		self stopsounds();
	}
}