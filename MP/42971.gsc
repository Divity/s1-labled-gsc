/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42971.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 101
 * Decompile Time: 17 ms
 * Timestamp: 4/20/2022 8:18:35 PM
*******************************************************************/

//Function Number: 1
lib_A7DB::setcrouchmovement()
{
	thread lib_A7DB::crouchstatelistener();
	lib_A7DB::crouchmovementsetspeed();
}

//Function Number: 2
lib_A7DB::crouchstatelistener()
{
	self endon("death");
	self endon("disconnect");
	self endon("unsetCrouchMovement");
	self notifyonplayercommand("adjustedStance","+stance");
	self notifyonplayercommand("adjustedStance","+goStand");
	for(;;)
	{
		common_scripts\utility::waittill_any("adjustedStance","sprint_begin","weapon_change");
		wait(0.5);
		lib_A7DB::crouchmovementsetspeed();
	}
}

//Function Number: 3
lib_A7DB::crouchmovementsetspeed()
{
	self.stancecrouchmovement = self getstance();
	var_00 = 0;
	if(isdefined(self.adrenaline_speed_scalar))
	{
		var_00 = self.adrenaline_speed_scalar;
	}
	else if(self.stancecrouchmovement == "crouch")
	{
		var_00 = self.crouch_speed_scalar;
	}
	else if(maps\mp\_utility::_hasperk("specialty_lightweight"))
	{
		var_00 = maps\mp\_utility::lightweightscalar();
	}

	self.movespeedscaler = var_00;
	maps\mp\gametypes\_weapons::updatemovespeedscale();
}

//Function Number: 4
lib_A7DB::unsetcrouchmovement()
{
	self notify("unsetCrouchMovement");
	var_00 = 1;
	if(maps\mp\_utility::_hasperk("specialty_lightweight"))
	{
		var_00 = maps\mp\_utility::lightweightscalar();
	}

	self.movespeedscaler = var_00;
	maps\mp\gametypes\_weapons::updatemovespeedscale();
}

//Function Number: 5
lib_A7DB::setpersonaluav()
{
	var_00 = spawn("script_model",self.var_2E6);
	var_00.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_00 makeportableradar(self);
	self.var_67E0 = var_00;
	thread lib_A7DB::radarmover(var_00);
}

//Function Number: 6
lib_A7DB::radarmover(param_00)
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("personal_uav_remove");
	self endon("personal_uav_removed");
	for(;;)
	{
		param_00 moveto(self.var_2E6,0.05);
		wait(0.05);
	}
}

//Function Number: 7
lib_A7DB::unsetpersonaluav()
{
	if(isdefined(self.var_67E0))
	{
		self notify("personal_uav_removed");
		level maps\mp\gametypes\_portable_radar::deleteportableradar(self.var_67E0);
		self.var_67E0 = undefined;
	}
}

//Function Number: 8
lib_A7DB::setoverkillpro()
{
}

//Function Number: 9
lib_A7DB::unsetoverkillpro()
{
}

//Function Number: 10
lib_A7DB::setempimmune()
{
}

//Function Number: 11
lib_A7DB::unsetempimmune()
{
}

//Function Number: 12
lib_A7DB::setautospot()
{
	lib_A7DB::autospotadswatcher();
	lib_A7DB::autospotdeathwatcher();
}

//Function Number: 13
lib_A7DB::autospotdeathwatcher()
{
	self waittill("death");
	self endon("disconnect");
	self endon("endAutoSpotAdsWatcher");
	level endon("game_ended");
	self method_80BB();
}

//Function Number: 14
lib_A7DB::unsetautospot()
{
	self notify("endAutoSpotAdsWatcher");
	self method_80BB();
}

//Function Number: 15
lib_A7DB::autospotadswatcher()
{
	self endon("death");
	self endon("disconnect");
	self endon("endAutoSpotAdsWatcher");
	level endon("game_ended");
	var_00 = 0;
	for(;;)
	{
		wait(0.05);
		if(self isusingturret())
		{
			self method_80BB();
			continue;
		}

		var_01 = self playerads();
		if(var_01 < 1 && var_00)
		{
			var_00 = 0;
			self method_80BB();
		}

		if(var_01 < 1 && !var_00)
		{
			continue;
		}

		if(var_01 == 1 && !var_00)
		{
			var_00 = 1;
			self method_80BA();
		}
	}
}

//Function Number: 16
lib_A7DB::setregenspeed()
{
}

//Function Number: 17
lib_A7DB::unsetregenspeed()
{
}

//Function Number: 18
lib_A7DB::setsharpfocus()
{
	self setviewkickscale(0.5);
}

//Function Number: 19
lib_A7DB::unsetsharpfocus()
{
	self setviewkickscale(1);
}

//Function Number: 20
lib_A7DB::setdoubleload()
{
	self endon("death");
	self endon("disconnect");
	self endon("endDoubleLoad");
	level endon("game_ended");
	for(;;)
	{
		self waittill("reload");
		var_00 = self getweaponslist("primary");
		foreach(var_02 in var_00)
		{
			var_03 = self getweaponammoclip(var_02);
			var_04 = weaponclipsize(var_02);
			var_05 = var_04 - var_03;
			var_06 = self getweaponammostock(var_02);
			if(var_03 != var_04 && var_06 > 0)
			{
				if(var_03 + var_06 >= var_04)
				{
					self setweaponammoclip(var_02,var_04);
					self setweaponammostock(var_02,var_06 - var_05);
					continue;
				}

				self setweaponammoclip(var_02,var_03 + var_06);
				if(var_06 - var_05 > 0)
				{
					self setweaponammostock(var_02,var_06 - var_05);
					continue;
				}

				self setweaponammostock(var_02,0);
			}
		}
	}
}

//Function Number: 21
lib_A7DB::unsetdoubleload()
{
	self notify("endDoubleLoad");
}

//Function Number: 22
lib_A7DB::setmarksman(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	if(!isdefined(param_00))
	{
		param_00 = 10;
	}
	else
	{
		param_00 = int(param_00) * 2;
	}

	maps\mp\_utility::setrecoilscale(param_00);
	self.recoilscale = param_00;
}

//Function Number: 23
lib_A7DB::unsetmarksman()
{
	maps\mp\_utility::setrecoilscale(0);
	self.recoilscale = 0;
}

//Function Number: 24
lib_A7DB::setstunresistance(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	if(!isdefined(param_00))
	{
		self.stunscaler = 0.5;
		return;
	}

	self.stunscaler = int(param_00) / 10;
}

//Function Number: 25
lib_A7DB::unsetstunresistance()
{
	self.stunscaler = 1;
}

//Function Number: 26
lib_A7DB::setsteadyaimpro()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self setaimspreadmovementscale(0.5);
}

//Function Number: 27
lib_A7DB::unsetsteadyaimpro()
{
	self notify("end_SteadyAimPro");
	self setaimspreadmovementscale(1);
}

//Function Number: 28
lib_A7DB::blastshieldusetracker(param_00,param_01)
{
	self endon("death");
	self endon("disconnect");
	self endon("end_perkUseTracker");
	level endon("game_ended");
	for(;;)
	{
		self waittill("empty_offhand");
		if(!common_scripts\utility::isoffhandweaponenabled())
		{
			continue;
		}

		self [[ param_01 ]](maps\mp\_utility::_hasperk("_specialty_blastshield"));
	}
}

//Function Number: 29
lib_A7DB::perkusedeathtracker()
{
	self endon("disconnect");
	self waittill("death");
	self._useperkenabled = undefined;
}

//Function Number: 30
lib_A7DB::setrearview()
{
}

//Function Number: 31
lib_A7DB::unsetrearview()
{
	self notify("end_perkUseTracker");
}

//Function Number: 32
lib_A7DB::setendgame()
{
	if(isdefined(self.endgame))
	{
		return;
	}

	self.var_275 = maps\mp\gametypes\_tweakables::gettweakablevalue("player","maxhealth") * 4;
	self.health = self.var_275;
	self.endgame = 1;
	self.attackertable[0] = "";
	self visionsetnakedforplayer("end_game",5);
	thread lib_A7DB::endgamedeath(7);
	self.hasdonecombat = 1;
}

//Function Number: 33
lib_A7DB::unsetendgame()
{
	self notify("stopEndGame");
	self.endgame = undefined;
	maps\mp\_utility::revertvisionsetforplayer();
	if(!isdefined(self.endgametimer))
	{
		return;
	}

	self.endgametimer maps\mp\gametypes\_hud_util::destroyelem();
	self.endgameicon maps\mp\gametypes\_hud_util::destroyelem();
}

//Function Number: 34
lib_A7DB::endgamedeath(param_00)
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	level endon("game_ended");
	self endon("stopEndGame");
	wait(param_00 + 1);
	maps\mp\_utility::_suicide();
}

//Function Number: 35
lib_A7DB::stancestatelistener()
{
	self endon("death");
	self endon("disconnect");
	self notifyonplayercommand("adjustedStance","+stance");
	for(;;)
	{
		self waittill("adjustedStance");
		if(self.movespeedscaler != 0)
		{
			continue;
		}

		lib_A7DB::unsetsiege();
	}
}

//Function Number: 36
lib_A7DB::jumpstatelistener()
{
	self endon("death");
	self endon("disconnect");
	self notifyonplayercommand("jumped","+goStand");
	for(;;)
	{
		self waittill("jumped");
		if(self.movespeedscaler != 0)
		{
			continue;
		}

		lib_A7DB::unsetsiege();
	}
}

//Function Number: 37
lib_A7DB::unsetsiege()
{
	self.movespeedscaler = level.baseplayermovescale;
	self resetspreadoverride();
	maps\mp\gametypes\_weapons::updatemovespeedscale();
	self playerrecoilscaleoff();
	self allowjump(1);
}

//Function Number: 38
lib_A7DB::setsaboteur()
{
	self.exocount = 2;
}

//Function Number: 39
lib_A7DB::unsetsaboteur()
{
	self.exocount = 1;
}

//Function Number: 40
lib_A7DB::setlightweight(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 10;
	}

	self.movespeedscaler = maps\mp\_utility::lightweightscalar(param_00);
	maps\mp\gametypes\_weapons::updatemovespeedscale();
}

//Function Number: 41
lib_A7DB::unsetlightweight()
{
	self.movespeedscaler = level.baseplayermovescale;
	maps\mp\gametypes\_weapons::updatemovespeedscale();
}

//Function Number: 42
lib_A7DB::setblackbox()
{
	self.var_53A2 = 1.5;
}

//Function Number: 43
lib_A7DB::unsetblackbox()
{
	self.var_53A2 = 1;
}

//Function Number: 44
lib_A7DB::setsteelnerves()
{
	maps\mp\_utility::giveperk("specialty_bulletaccuracy",1);
	maps\mp\_utility::giveperk("specialty_holdbreath",0);
}

//Function Number: 45
lib_A7DB::unsetsteelnerves()
{
	maps\mp\_utility::_unsetperk("specialty_bulletaccuracy");
	maps\mp\_utility::_unsetperk("specialty_holdbreath");
}

//Function Number: 46
lib_A7DB::setdelaymine()
{
}

//Function Number: 47
lib_A7DB::unsetdelaymine()
{
}

//Function Number: 48
lib_A7DB::setlocaljammer()
{
	if(!maps\mp\_utility::isemped())
	{
		self method_8212(0);
	}
}

//Function Number: 49
lib_A7DB::unsetlocaljammer()
{
	self method_8212(1);
}

//Function Number: 50
lib_A7DB::setthermal()
{
	self method_80B6();
}

//Function Number: 51
lib_A7DB::unsetthermal()
{
	self method_80B7();
}

//Function Number: 52
lib_A7DB::setonemanarmy()
{
	thread lib_A7DB::onemanarmyweaponchangetracker();
}

//Function Number: 53
lib_A7DB::unsetonemanarmy()
{
	self notify("stop_oneManArmyTracker");
}

//Function Number: 54
lib_A7DB::onemanarmyweaponchangetracker()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self endon("stop_oneManArmyTracker");
	for(;;)
	{
		self waittill("weapon_change",var_00);
		if(var_00 != "onemanarmy_mp")
		{
			continue;
		}

		thread lib_A7DB::selectonemanarmyclass();
	}
}

//Function Number: 55
lib_A7DB::isonemanarmymenu(param_00)
{
	if(param_00 == game["menu_onemanarmy"])
	{
		return 1;
	}

	if(isdefined(game["menu_onemanarmy_defaults_splitscreen"]) && param_00 == game["menu_onemanarmy_defaults_splitscreen"])
	{
		return 1;
	}

	if(isdefined(game["menu_onemanarmy_custom_splitscreen"]) && param_00 == game["menu_onemanarmy_custom_splitscreen"])
	{
		return 1;
	}

	return 0;
}

//Function Number: 56
lib_A7DB::selectonemanarmyclass()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	common_scripts\utility::_disableweaponswitch();
	common_scripts\utility::_disableoffhandweapons();
	common_scripts\utility::_disableusability();
	self method_8323(game["menu_onemanarmy"]);
	thread lib_A7DB::closeomamenuondeath();
	self waittill("menuresponse",var_00,var_01);
	common_scripts\utility::_enableweaponswitch();
	common_scripts\utility::_enableoffhandweapons();
	common_scripts\utility::_enableusability();
	if(var_01 == "back" || !lib_A7DB::isonemanarmymenu(var_00) || maps\mp\_utility::isusingremote())
	{
		if(self getcurrentweapon() == "onemanarmy_mp")
		{
			common_scripts\utility::_disableweaponswitch();
			common_scripts\utility::_disableoffhandweapons();
			common_scripts\utility::_disableusability();
			self switchtoweapon(common_scripts\utility::getlastweapon());
			self waittill("weapon_change");
			common_scripts\utility::_enableweaponswitch();
			common_scripts\utility::_enableoffhandweapons();
			common_scripts\utility::_enableusability();
		}

		return;
	}

	thread lib_A7DB::giveonemanarmyclass(var_01);
}

//Function Number: 57
lib_A7DB::closeomamenuondeath()
{
	self endon("menuresponse");
	self endon("disconnect");
	level endon("game_ended");
	self waittill("death");
	common_scripts\utility::_enableweaponswitch();
	common_scripts\utility::_enableoffhandweapons();
	common_scripts\utility::_enableusability();
	self method_8325();
}

//Function Number: 58
lib_A7DB::giveonemanarmyclass(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	if(maps\mp\_utility::_hasperk("specialty_omaquickchange"))
	{
		var_01 = 3;
		self method_82F4("foly_onemanarmy_bag3_plr");
		self playsoundtoteam("foly_onemanarmy_bag3_npc","allies",self);
		self playsoundtoteam("foly_onemanarmy_bag3_npc","axis",self);
	}
	else
	{
		var_01 = 6;
		self method_82F4("foly_onemanarmy_bag6_plr");
		self playsoundtoteam("foly_onemanarmy_bag6_npc","allies",self);
		self playsoundtoteam("foly_onemanarmy_bag6_npc","axis",self);
	}

	thread lib_A7DB::omausebar(var_01);
	common_scripts\utility::_disableweapon();
	common_scripts\utility::_disableoffhandweapons();
	common_scripts\utility::_disableusability();
	wait(var_01);
	common_scripts\utility::_enableweapon();
	common_scripts\utility::_enableoffhandweapons();
	common_scripts\utility::_enableusability();
	self.omaclasschanged = 1;
	maps\mp\gametypes\_class::giveandapplyloadout(self.connectedpostgame["team"],param_00,0);
	if(isdefined(self.carryflag))
	{
		self attach(self.carryflag,"J_spine4",1);
	}

	self notify("changed_kit");
	level notify("changed_kit");
}

//Function Number: 59
lib_A7DB::omausebar(param_00)
{
	self endon("disconnect");
	var_01 = maps\mp\gametypes\_hud_util::createprimaryprogressbar(0,-25);
	var_02 = maps\mp\gametypes\_hud_util::createprimaryprogressbartext(0,-25);
	var_02 settext(&"MPUI_CHANGING_KIT");
	var_01 maps\mp\gametypes\_hud_util::updatebar(0,1 / param_00);
	var_03 = 0;
	while(var_03 < param_00 && isalive(self) && !level.gameended)
	{
		wait(0.05);
		var_03 = var_03 + 0.05;
	}

	var_01 maps\mp\gametypes\_hud_util::destroyelem();
	var_02 maps\mp\gametypes\_hud_util::destroyelem();
}

//Function Number: 60
lib_A7DB::setblastshield()
{
	self setweaponhudiconoverride("primaryoffhand","specialty_s1_temp");
}

//Function Number: 61
lib_A7DB::unsetblastshield()
{
	self setweaponhudiconoverride("primaryoffhand","none");
}

//Function Number: 62
lib_A7DB::setfreefall()
{
}

//Function Number: 63
lib_A7DB::unsetfreefall()
{
}

//Function Number: 64
lib_A7DB::settacticalinsertion()
{
	maps\mp\_utility::_giveweapon("s1_tactical_insertion_device_mp",0);
	self givestartammo("s1_tactical_insertion_device_mp");
	thread lib_A7DB::monitortiuse();
}

//Function Number: 65
lib_A7DB::clearprevioustispawnpoint()
{
	self notify("clearPreviousTISpawnpointStarted");
	self endon("clearPreviousTISpawnpointStarted");
	common_scripts\utility::waittill_any("disconnect","joined_team","joined_spectators");
	if(isdefined(self.var_800F))
	{
		lib_A7DB::deleteti(self.var_800F);
	}
}

//Function Number: 66
lib_A7DB::updatetispawnposition()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	level endon("game_ended");
	while(maps\mp\_utility::isreallyalive(self))
	{
		if(lib_A7DB::isvalidtispawnposition())
		{
			self.tispawnposition = self.var_2E6;
		}

		wait(0.05);
	}
}

//Function Number: 67
lib_A7DB::isvalidtispawnposition()
{
	if(canspawn(self.var_2E6) && self isonground())
	{
		return 1;
	}

	return 0;
}

//Function Number: 68
lib_A7DB::monitortiuse()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	level endon("game_ended");
	thread lib_A7DB::clearprevioustispawnpoint();
	thread lib_A7DB::updatetispawnposition();
	thread lib_A7DB::monitorthirdpersonmodel();
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 != "s1_tactical_insertion_device_mp")
		{
			continue;
		}

		if(isdefined(self.var_800F))
		{
			lib_A7DB::deleteti(self.var_800F);
		}

		if(!isdefined(self.tispawnposition))
		{
			continue;
		}

		if(maps\mp\_utility::touchingbadtrigger())
		{
			continue;
		}

		var_02 = playerphysicstrace(self.tispawnposition + (0,0,16),self.tispawnposition - (0,0,2048)) + (0,0,1);
		var_03 = spawn("script_model",var_02);
		var_03.var_41 = self.var_41;
		var_03.inliveplayerkillstreak = self.inliveplayerkillstreak;
		var_03.owner = self;
		var_03.var_32C6 = spawn("script_origin",var_02);
		var_03 thread lib_A7DB::glowsticksetupandwaitfordeath(self);
		var_03.playerspawnpos = self.tispawnposition;
		var_03 method_8383(self);
		var_03 common_scripts\utility::make_entity_sentient_mp(self.inliveplayerkillstreak,1);
		var_03 playloopsound("tac_insert_spark_lp");
		self.var_800F = var_03;
	}
}

//Function Number: 69
lib_A7DB::monitorthirdpersonmodel()
{
	self notify("third_person_ti");
	self endon("third_person_ti");
	for(;;)
	{
		if(isdefined(self.attachmodelti))
		{
			self detach("npc_tactical_insertion_device","tag_inhand");
			self.attachmodelti = undefined;
		}

		self waittillmatch("s1_tactical_insertion_device_mp","grenade_pullback");
		self attach("npc_tactical_insertion_device","tag_inhand",1);
		self.attachmodelti = "npc_tactical_insertion_device";
		maps\mp\_utility::waitfortimeornotify(3,"death");
		self detach("npc_tactical_insertion_device","tag_inhand");
		self.attachmodelti = undefined;
	}
}

//Function Number: 70
lib_A7DB::glowsticksetupandwaitfordeath(param_00)
{
	self setmodel(level.var_89D9["enemy"]);
	thread maps\mp\gametypes\_damage::setentitydamagecallback(100,undefined,::lib_A7DB::ondeathti,undefined,0);
	thread lib_A7DB::glowstickenemyuselistener(param_00);
	thread lib_A7DB::glowstickuselistener(param_00);
	thread lib_A7DB::glowstickteamupdater(self.inliveplayerkillstreak,level.spawnglow["enemy"],param_00);
	var_01 = spawn("script_model",self.var_2E6 + (0,0,0));
	var_01.var_41 = self.var_41;
	var_01 setmodel(level.var_89D9["friendly"]);
	var_01 setcontents(0);
	var_01 thread lib_A7DB::glowstickteamupdater(self.inliveplayerkillstreak,level.spawnglow["friendly"],param_00);
	var_01 playloopsound("tac_insert_spark_lp");
	self waittill("death");
	var_01 stoploopsound();
	var_01 delete();
}

//Function Number: 71
lib_A7DB::glowstickteamupdater(param_00,param_01,param_02)
{
	self endon("death");
	wait(0.05);
	var_03 = self gettagangles("tag_fire_fx");
	var_04 = spawnfx(param_01,self gettagorigin("tag_fire_fx"),anglestoforward(var_03),anglestoup(var_03));
	triggerfx(var_04);
	thread lib_A7DB::perk_deleteondeath(var_04);
	for(;;)
	{
		self hide();
		var_04 hide();
		foreach(var_06 in level.var_328)
		{
			if(var_06.inliveplayerkillstreak == param_00 && level.teambased && param_01 == level.spawnglow["friendly"])
			{
				self showtoplayer(var_06);
				var_04 showtoplayer(var_06);
				continue;
			}

			if(var_06.inliveplayerkillstreak != param_00 && level.teambased && param_01 == level.spawnglow["enemy"])
			{
				self showtoplayer(var_06);
				var_04 showtoplayer(var_06);
				continue;
			}

			if(!level.teambased && var_06 == param_02 && param_01 == level.spawnglow["friendly"])
			{
				self showtoplayer(var_06);
				var_04 showtoplayer(var_06);
				continue;
			}

			if(!level.teambased && var_06 != param_02 && param_01 == level.spawnglow["enemy"])
			{
				self showtoplayer(var_06);
				var_04 showtoplayer(var_06);
			}
		}

		level common_scripts\utility::waittill_either("joined_team","player_spawned");
	}
}

//Function Number: 72
lib_A7DB::perk_deleteondeath(param_00)
{
	self waittill("death");
	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 73
lib_A7DB::ondeathti(param_00,param_01,param_02,param_03)
{
	if(isdefined(self.owner) && param_00 != self.owner)
	{
		param_00 notify("destroyed_explosive");
		param_00 thread maps\mp\gametypes\_missions::processchallenge("ch_darkbringer");
	}

	playfx(level.var_89CB,self.var_2E6);
	self.owner thread maps\mp\_utility::leaderdialogonplayer("ti_destroyed",undefined,undefined,self.var_2E6);
	param_00 thread lib_A7DB::deleteti(self);
}

//Function Number: 74
lib_A7DB::glowstickuselistener(param_00)
{
	self endon("death");
	level endon("game_ended");
	param_00 endon("disconnect");
	self setcursorhint("HINT_NOICON");
	self sethintstring(&"MP_PATCH_PICKUP_TI");
	thread lib_A7DB::updateenemyuse(param_00);
	for(;;)
	{
		self waittill("trigger",var_01);
		var_01 playsoundasmaster("tac_insert_pickup_plr");
		var_01 thread lib_A7DB::settacticalinsertion();
		var_01 thread lib_A7DB::deleteti(self);
	}
}

//Function Number: 75
lib_A7DB::updateenemyuse(param_00)
{
	self endon("death");
	for(;;)
	{
		maps\mp\_utility::setselfusable(param_00);
		level common_scripts\utility::waittill_either("joined_team","player_spawned");
	}
}

//Function Number: 76
lib_A7DB::deleteti(param_00)
{
	if(isdefined(param_00.var_32C6))
	{
		param_00.var_32C6 delete();
	}

	param_00 stoploopsound();
	param_00 delete();
}

//Function Number: 77
lib_A7DB::glowstickenemyuselistener(param_00)
{
	self endon("death");
	level endon("game_ended");
	param_00 endon("disconnect");
	self.var_32C6 setcursorhint("HINT_NOICON");
	self.var_32C6 sethintstring(&"MP_PATCH_DESTROY_TI");
	self.var_32C6 maps\mp\_utility::makeenemyusable(param_00);
	for(;;)
	{
		self.var_32C6 waittill("trigger",var_01);
		thread lib_A7DB::ondeathti(var_01);
	}
}

//Function Number: 78
lib_A7DB::setpainted(param_00)
{
	if(isplayer(self))
	{
		if(isdefined(param_00.specialty_paint_time) && !maps\mp\_utility::_hasperk("specialty_coldblooded"))
		{
			self.painted = 1;
			self setperk("specialty_radararrow",1,0);
			thread lib_A7DB::unsetpainted(param_00.specialty_paint_time);
			thread lib_A7DB::watchpainteddeath();
		}
	}
}

//Function Number: 79
lib_A7DB::watchpainteddeath()
{
	self endon("disconnect");
	level endon("game_ended");
	self endon("unsetPainted");
	self waittill("death");
	self.painted = 0;
}

//Function Number: 80
lib_A7DB::unsetpainted(param_00)
{
	self notify("painted_again");
	self endon("painted_again");
	self endon("disconnect");
	self endon("death");
	level endon("game_ended");
	wait(param_00);
	self.painted = 0;
	self unsetperk("specialty_radararrow",1);
	self notify("unsetPainted");
}

//Function Number: 81
lib_A7DB::ispainted()
{
	return isdefined(self.painted) && self.painted;
}

//Function Number: 82
lib_A7DB::setrefillgrenades()
{
	if(isdefined(self.primarygrenade))
	{
		self givemaxammo(self.primarygrenade);
	}

	if(isdefined(self.secondarygrenade))
	{
		self givemaxammo(self.secondarygrenade);
	}
}

//Function Number: 83
lib_A7DB::setfinalstand()
{
	maps\mp\_utility::giveperk("specialty_pistoldeath",0);
}

//Function Number: 84
lib_A7DB::unsetfinalstand()
{
	maps\mp\_utility::_unsetperk("specialty_pistoldeath");
}

//Function Number: 85
lib_A7DB::setcarepackage()
{
	thread maps\mp\killstreaks\_killstreaks::givekillstreak("airdrop_assault",0,0,self);
}

//Function Number: 86
lib_A7DB::unsetcarepackage()
{
}

//Function Number: 87
lib_A7DB::setuav()
{
	thread maps\mp\killstreaks\_killstreaks::givekillstreak("uav",0,0,self);
}

//Function Number: 88
lib_A7DB::unsetuav()
{
}

//Function Number: 89
lib_A7DB::setstoppingpower()
{
	maps\mp\_utility::giveperk("specialty_bulletdamage",0);
	thread lib_A7DB::watchstoppingpowerkill();
}

//Function Number: 90
lib_A7DB::watchstoppingpowerkill()
{
	self notify("watchStoppingPowerKill");
	self endon("watchStoppingPowerKill");
	self endon("disconnect");
	level endon("game_ended");
	self waittill("killed_enemy");
	lib_A7DB::unsetstoppingpower();
}

//Function Number: 91
lib_A7DB::unsetstoppingpower()
{
	maps\mp\_utility::_unsetperk("specialty_bulletdamage");
	self notify("watchStoppingPowerKill");
}

//Function Number: 92
lib_A7DB::setjuiced(param_00,param_01,param_02)
{
	self endon("death");
	self endon("faux_spawn");
	self endon("disconnect");
	self endon("unset_juiced");
	level endon("end_game");
	self.var_5134 = 1;
	if(!isdefined(param_00))
	{
		param_00 = 1.25;
	}

	self.movespeedscaler = param_00;
	maps\mp\gametypes\_weapons::updatemovespeedscale();
	if(level.splitscreen)
	{
		var_03 = 56;
		var_04 = 21;
	}
	else
	{
		var_03 = 80;
		var_04 = 32;
	}

	if(!isdefined(param_01))
	{
		param_01 = 7;
	}

	if(!isdefined(param_02) || param_02 == 1)
	{
		self.juicedtimer = maps\mp\gametypes\_hud_util::createtimer("hudsmall",1);
		self.juicedtimer maps\mp\gametypes\_hud_util::setpoint("CENTER","CENTER",0,var_03);
		self.juicedtimer settimer(param_01);
		self.juicedtimer.color = (0.8,0.8,0);
		self.juicedtimer.archived = 0;
		self.juicedtimer.foreground = 1;
		self.juicedicon = maps\mp\gametypes\_hud_util::createicon(level.specialty_juiced_icon,var_04,var_04);
		self.juicedicon.alpha = 0;
		self.juicedicon maps\mp\gametypes\_hud_util::setparent(self.juicedtimer);
		self.juicedicon maps\mp\gametypes\_hud_util::setpoint("BOTTOM","TOP");
		self.juicedicon.archived = 1;
		self.juicedicon.fontscale = 1;
		self.juicedicon.foreground = 1;
		self.juicedicon fadeovertime(1);
		self.juicedicon.alpha = 0.85;
	}

	thread lib_A7DB::unsetjuicedondeath();
	thread lib_A7DB::unsetjuicedonride();
	wait(param_01 - 2);
	if(isdefined(self.juicedicon))
	{
		self.juicedicon fadeovertime(2);
		self.juicedicon.alpha = 0;
	}

	if(isdefined(self.juicedtimer))
	{
		self.juicedtimer fadeovertime(2);
		self.juicedtimer.alpha = 0;
	}

	wait(2);
	lib_A7DB::unsetjuiced();
}

//Function Number: 93
lib_A7DB::unsetjuiced(param_00)
{
	if(!isdefined(param_00))
	{
		if(maps\mp\_utility::isjuggernaut())
		{
			if(isdefined(self.juggmovespeedscaler))
			{
				self.movespeedscaler = self.juggmovespeedscaler;
			}
			else
			{
				self.movespeedscaler = 0.7;
			}
		}
		else
		{
			self.movespeedscaler = level.baseplayermovescale;
			if(maps\mp\_utility::_hasperk("specialty_lightweight"))
			{
				self.movespeedscaler = maps\mp\_utility::lightweightscalar();
			}
		}

		maps\mp\gametypes\_weapons::updatemovespeedscale();
	}

	if(isdefined(self.juicedicon))
	{
		self.juicedicon destroy();
	}

	if(isdefined(self.juicedtimer))
	{
		self.juicedtimer destroy();
	}

	self.var_5134 = undefined;
	self notify("unset_juiced");
}

//Function Number: 94
lib_A7DB::unsetjuicedonride()
{
	self endon("disconnect");
	self endon("unset_juiced");
	for(;;)
	{
		wait(0.05);
		if(maps\mp\_utility::isusingremote())
		{
			thread lib_A7DB::unsetjuiced();
			break;
		}
	}
}

//Function Number: 95
lib_A7DB::unsetjuicedondeath()
{
	self endon("disconnect");
	self endon("unset_juiced");
	common_scripts\utility::waittill_any("death","faux_spawn");
	thread lib_A7DB::unsetjuiced(1);
}

//Function Number: 96
lib_A7DB::setlightarmorhp(param_00)
{
	if(isdefined(param_00))
	{
		self.lightarmorhp = param_00;
		if(isplayer(self) && isdefined(self.maxlightarmorhp) && self.maxlightarmorhp > 0)
		{
			var_01 = clamp(self.lightarmorhp / self.maxlightarmorhp,0,1);
			self setclientomnvar("ui_light_armor_percent",var_01);
			return;
		}

		return;
	}

	self.lightarmorhp = undefined;
	self.maxlightarmorhp = undefined;
	self setclientomnvar("ui_light_armor_percent",0);
}

//Function Number: 97
lib_A7DB::setlightarmor(param_00)
{
	self notify("give_light_armor");
	if(isdefined(self.lightarmorhp))
	{
		lib_A7DB::unsetlightarmor();
	}

	thread lib_A7DB::removelightarmorondeath();
	thread lib_A7DB::removelightarmoronmatchend();
	if(isdefined(param_00))
	{
		self.maxlightarmorhp = param_00;
	}
	else
	{
		self.maxlightarmorhp = 150;
	}

	lib_A7DB::setlightarmorhp(self.maxlightarmorhp);
}

//Function Number: 98
lib_A7DB::removelightarmorondeath()
{
	self endon("disconnect");
	self endon("give_light_armor");
	self endon("remove_light_armor");
	self waittill("death");
	lib_A7DB::unsetlightarmor();
}

//Function Number: 99
lib_A7DB::unsetlightarmor()
{
	lib_A7DB::setlightarmorhp(undefined);
	self notify("remove_light_armor");
}

//Function Number: 100
lib_A7DB::removelightarmoronmatchend()
{
	self endon("disconnect");
	self endon("remove_light_armor");
	level common_scripts\utility::waittill_any("round_end_finished","game_ended");
	thread lib_A7DB::unsetlightarmor();
}

//Function Number: 101
lib_A7DB::haslightarmor()
{
	return isdefined(self.lightarmorhp) && self.lightarmorhp > 0;
}