/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42938.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 56
 * Decompile Time: 29 ms
 * Timestamp: 4/20/2022 8:18:31 PM
*******************************************************************/

//Function Number: 1
lib_A7BA::init()
{
	if(!isdefined(level.sentrytype))
	{
		level.sentrytype = [];
	}

	level.sentrytype["sentry_minigun"] = "sentry";
	level.sentrytype["sam_turret"] = "sam_turret";
	level.killstreakfuncs[level.sentrytype["sentry_minigun"]] = ::lib_A7BA::tryuseautosentry;
	level.killstreakfuncs[level.sentrytype["sam_turret"]] = ::lib_A7BA::tryusesam;
	if(!isdefined(level.sentrysettings))
	{
		level.sentrysettings = [];
	}

	level.sentrysettings["sentry_minigun"] = spawnstruct();
	level.sentrysettings["sentry_minigun"].health = 999999;
	level.sentrysettings["sentry_minigun"].var_275 = 1000;
	level.sentrysettings["sentry_minigun"].burstmin = 20;
	level.sentrysettings["sentry_minigun"].burstmax = 120;
	level.sentrysettings["sentry_minigun"].pausemin = 0.15;
	level.sentrysettings["sentry_minigun"].pausemax = 0.35;
	level.sentrysettings["sentry_minigun"].sentrymodeon = "sentry";
	level.sentrysettings["sentry_minigun"].sentrymodeoff = "sentry_offline";
	level.sentrysettings["sentry_minigun"].timeout = 90;
	level.sentrysettings["sentry_minigun"].spinuptime = 0.05;
	level.sentrysettings["sentry_minigun"].overheattime = 8;
	level.sentrysettings["sentry_minigun"].cooldowntime = 0.1;
	level.sentrysettings["sentry_minigun"].fxtime = 0.3;
	level.sentrysettings["sentry_minigun"].streakname = "sentry";
	level.sentrysettings["sentry_minigun"].energyturret = "sentry_minigun_mp";
	level.sentrysettings["sentry_minigun"].modelbase = "sentry_minigun_weak";
	level.sentrysettings["sentry_minigun"].modelplacement = "sentry_minigun_weak_obj";
	level.sentrysettings["sentry_minigun"].modelplacementfailed = "sentry_minigun_weak_obj_red";
	level.sentrysettings["sentry_minigun"].modeldestroyed = "sentry_minigun_weak_destroyed";
	level.sentrysettings["sentry_minigun"].hintstring = &"SENTRY_PICKUP";
	level.sentrysettings["sentry_minigun"].headicon = 1;
	level.sentrysettings["sentry_minigun"].teamsplash = "used_sentry";
	level.sentrysettings["sentry_minigun"].shouldsplash = 0;
	level.sentrysettings["sentry_minigun"].vodestroyed = "sentry_destroyed";
	level.sentrysettings["sam_turret"] = spawnstruct();
	level.sentrysettings["sam_turret"].health = 999999;
	level.sentrysettings["sam_turret"].var_275 = 1000;
	level.sentrysettings["sam_turret"].burstmin = 20;
	level.sentrysettings["sam_turret"].burstmax = 120;
	level.sentrysettings["sam_turret"].pausemin = 0.15;
	level.sentrysettings["sam_turret"].pausemax = 0.35;
	level.sentrysettings["sam_turret"].sentrymodeon = "sentry_manual";
	level.sentrysettings["sam_turret"].sentrymodeoff = "sentry_offline";
	level.sentrysettings["sam_turret"].timeout = 90;
	level.sentrysettings["sam_turret"].spinuptime = 0.05;
	level.sentrysettings["sam_turret"].overheattime = 8;
	level.sentrysettings["sam_turret"].cooldowntime = 0.1;
	level.sentrysettings["sam_turret"].fxtime = 0.3;
	level.sentrysettings["sam_turret"].streakname = "sam_turret";
	level.sentrysettings["sam_turret"].energyturret = "sam_mp";
	level.sentrysettings["sam_turret"].modelbase = "mp_sam_turret";
	level.sentrysettings["sam_turret"].modelplacement = "mp_sam_turret_placement";
	level.sentrysettings["sam_turret"].modelplacementfailed = "mp_sam_turret_placement_failed";
	level.sentrysettings["sam_turret"].modeldestroyed = "mp_sam_turret";
	level.sentrysettings["sam_turret"].hintstring = &"SENTRY_PICKUP";
	level.sentrysettings["sam_turret"].headicon = 1;
	level.sentrysettings["sam_turret"].teamsplash = "used_sam_turret";
	level.sentrysettings["sam_turret"].shouldsplash = 0;
	level.sentrysettings["sam_turret"].vodestroyed = "sam_destroyed";
	level._effect["sentry_overheat_mp"] = loadfx("vfx/distortion/sentrygun_overheat");
	level._effect["sentry_explode_mp"] = loadfx("vfx/explosion/vehicle_pdrone_explosion");
	level._effect["sentry_smoke_mp"] = loadfx("vfx/smoke/vehicle_sentrygun_damaged_smoke");
	level._effect["sentry_stunned"] = loadfx("vfx/sparks/direct_hack_stun");
}

//Function Number: 2
lib_A7BA::tryuseautosentry(param_00,param_01)
{
	var_02 = lib_A7BA::givesentry("sentry_minigun");
	if(var_02)
	{
		maps\mp\_matchdata::logkillstreakevent(level.sentrysettings["sentry_minigun"].streakname,self.var_2E6);
	}

	return var_02;
}

//Function Number: 3
lib_A7BA::tryusesam(param_00,param_01)
{
	var_02 = lib_A7BA::givesentry("sam_turret");
	if(var_02)
	{
		maps\mp\_matchdata::logkillstreakevent(level.sentrysettings["sam_turret"].streakname,self.var_2E6);
	}

	return var_02;
}

//Function Number: 4
lib_A7BA::givesentry(param_00)
{
	if(!maps\mp\_utility::validateusestreak())
	{
		return 0;
	}

	self.last_sentry = param_00;
	var_01 = lib_A7BA::createsentryforplayer(param_00,self);
	lib_A7BA::removeperks();
	var_02 = lib_A7BA::setcarryingsentry(var_01,1);
	thread lib_A7BA::waitrestoreperks();
	self.iscarrying = 0;
	if(isdefined(var_01))
	{
		return 1;
	}

	return 0;
}

//Function Number: 5
lib_A7BA::setcarryingsentry(param_00,param_01)
{
	self endon("death");
	self endon("disconnect");
	param_00 lib_A7BA::sentry_setcarried(self);
	common_scripts\utility::_disableweapon();
	if(!isai(self))
	{
		self notifyonplayercommand("place_sentry","+attack");
		self notifyonplayercommand("place_sentry","+attack_akimbo_accessible");
		self notifyonplayercommand("cancel_sentry","+actionslot 4");
		if(!level.console)
		{
			self notifyonplayercommand("cancel_sentry","+actionslot 5");
			self notifyonplayercommand("cancel_sentry","+actionslot 6");
			self notifyonplayercommand("cancel_sentry","+actionslot 7");
			self notifyonplayercommand("cancel_sentry","+actionslot 8");
		}
	}

	for(;;)
	{
		var_02 = common_scripts\utility::waittill_any_return("place_sentry","cancel_sentry","force_cancel_placement");
		if(var_02 == "cancel_sentry" || var_02 == "force_cancel_placement")
		{
			if(!param_01 && var_02 == "cancel_sentry")
			{
				continue;
			}

			if(level.console)
			{
				var_03 = maps\mp\_utility::getkillstreakweapon(level.sentrysettings[param_00.sentrytype].streakname);
				if(isdefined(self.killstreakindexweapon) && var_03 == maps\mp\_utility::getkillstreakweapon(self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname) && !self getweaponslistitems().size)
				{
					maps\mp\_utility::_giveweapon(var_03,0);
					maps\mp\_utility::_setactionslot(4,"weapon",var_03);
				}
			}

			param_00 lib_A7BA::sentry_setcancelled();
			common_scripts\utility::_enableweapon();
			return 0;
		}

		if(!param_00.canbeplaced)
		{
			continue;
		}

		param_00 lib_A7BA::sentry_setplaced();
		common_scripts\utility::_enableweapon();
		return 1;
	}
}

//Function Number: 6
lib_A7BA::removeweapons()
{
	if(self hasweapon("riotshield_mp"))
	{
		self.restoreweapon = "riotshield_mp";
		self takeweapon("riotshield_mp");
	}
}

//Function Number: 7
lib_A7BA::removeperks()
{
	if(maps\mp\_utility::_hasperk("specialty_explosivebullets"))
	{
		self.restoreperk = "specialty_explosivebullets";
		maps\mp\_utility::_unsetperk("specialty_explosivebullets");
	}
}

//Function Number: 8
lib_A7BA::restoreweapons()
{
	if(isdefined(self.restoreweapon))
	{
		maps\mp\_utility::_giveweapon(self.restoreweapon);
		self.restoreweapon = undefined;
	}
}

//Function Number: 9
lib_A7BA::restoreperks()
{
	if(isdefined(self.restoreperk))
	{
		maps\mp\_utility::giveperk(self.restoreperk,0);
		self.restoreperk = undefined;
	}
}

//Function Number: 10
lib_A7BA::waitrestoreperks()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	wait(0.05);
	lib_A7BA::restoreperks();
}

//Function Number: 11
lib_A7BA::createsentryforplayer(param_00,param_01)
{
	var_02 = spawnturret("misc_turret",param_01.var_2E6,level.sentrysettings[param_00].energyturret);
	var_02.var_41 = param_01.var_41;
	var_02 lib_A7BA::sentry_initsentry(param_00,param_01);
	return var_02;
}

//Function Number: 12
lib_A7BA::sentry_initsentry(param_00,param_01)
{
	self.sentrytype = param_00;
	self.canbeplaced = 1;
	self setmodel(level.sentrysettings[self.sentrytype].modelbase);
	self.shouldsplash = 1;
	self setcandamage(1);
	switch(param_00)
	{
		case "sam_turret":
			break;

		default:
			break;
	}
}

//Function Number: 13
lib_A7BA::sentry_watchdisabled()
{
	self endon("carried");
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		self waittill("emp_damage",var_00,var_01);
		playfxontag(common_scripts\utility::getfx("sentry_stunned"),self,"tag_aim");
		self setdefaultdroppitch(40);
		self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
		wait(var_01);
		stopfxontag(common_scripts\utility::getfx("sentry_stunned"),self,"tag_aim");
		self setdefaultdroppitch(-89);
		self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
	}
}

//Function Number: 14
lib_A7BA::sentry_directhacked()
{
	self endon("death");
	level endon("game_ended");
	self.directhackduration = 0.25;
	if(isdefined(self.directhackendtime) && gettime() < self.directhackendtime)
	{
		self.directhackendtime = gettime() + self.directhackduration * 1000;
		return;
	}

	playfxontag(common_scripts\utility::getfx("sentry_stunned"),self,"tag_aim");
	self.directhackendtime = gettime() + self.directhackduration * 1000;
	self setdefaultdroppitch(40);
	self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
	for(;;)
	{
		if(gettime() > self.directhackendtime)
		{
			break;
		}

		wait(0.05);
	}

	self setdefaultdroppitch(-89);
	self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
	stopfxontag(common_scripts\utility::getfx("sentry_stunned"),self,"tag_aim");
}

//Function Number: 15
lib_A7BA::sentry_handledeath()
{
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	self setmodel(level.sentrysettings[self.sentrytype].modeldestroyed);
	lib_A7BA::sentry_setinactive();
	self setdefaultdroppitch(40);
	self setsentryowner(undefined);
	self setturretminimapvisible(0);
	if(isdefined(self.ownertrigger))
	{
		self.ownertrigger delete();
	}

	self playsoundasmaster("sentry_explode");
	if(isdefined(self.inuseby))
	{
		playfxontag(common_scripts\utility::getfx("sentry_explode_mp"),self,"tag_origin");
		playfxontag(common_scripts\utility::getfx("sentry_smoke_mp"),self,"tag_aim");
		self.inuseby.turret_overheat_bar maps\mp\gametypes\_hud_util::destroyelem();
		self.inuseby lib_A7BA::restoreperks();
		self.inuseby lib_A7BA::restoreweapons();
		self notify("deleting");
		wait(1);
		stopfxontag(common_scripts\utility::getfx("sentry_explode_mp"),self,"tag_origin");
		stopfxontag(common_scripts\utility::getfx("sentry_smoke_mp"),self,"tag_aim");
	}
	else
	{
		playfxontag(common_scripts\utility::getfx("sentry_explode_mp"),self,"tag_aim");
		wait(1.5);
		self playsoundasmaster("sentry_explode_smoke");
		var_00 = 8;
		while(var_00 > 0)
		{
			playfxontag(common_scripts\utility::getfx("sentry_smoke_mp"),self,"tag_aim");
			wait(0.4);
			var_00 = var_00 - 0.4;
		}

		self notify("deleting");
	}

	if(isdefined(self.killcament))
	{
		self.killcament delete();
	}

	self delete();
}

//Function Number: 16
lib_A7BA::sentry_handleuse()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		self waittill("trigger",var_00);
		if(!maps\mp\_utility::isreallyalive(var_00))
		{
			continue;
		}

		if(self.sentrytype == "sam_turret")
		{
			self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
		}

		var_00 lib_A7BA::setcarryingsentry(self,0);
	}
}

//Function Number: 17
lib_A7BA::turret_handlepickup(param_00)
{
	self endon("disconnect");
	level endon("game_ended");
	param_00 endon("death");
	if(!isdefined(param_00.ownertrigger))
	{
		return;
	}

	var_01 = 0;
	for(;;)
	{
		if(isalive(self) && self istouching(param_00.ownertrigger) && !isdefined(param_00.inuseby) && !isdefined(param_00.carriedby) && self isonground())
		{
			if(self usebuttonpressed())
			{
				if(isdefined(self.using_remote_turret) && self.using_remote_turret)
				{
					continue;
				}

				var_01 = 0;
				while(self usebuttonpressed())
				{
					var_01 = var_01 + 0.05;
					wait(0.05);
				}

				if(var_01 >= 0.5)
				{
					continue;
				}

				var_01 = 0;
				while(!self usebuttonpressed() && var_01 < 0.5)
				{
					var_01 = var_01 + 0.05;
					wait(0.05);
				}

				if(var_01 >= 0.5)
				{
					continue;
				}

				if(!maps\mp\_utility::isreallyalive(self))
				{
					continue;
				}

				if(isdefined(self.using_remote_turret) && self.using_remote_turret)
				{
					continue;
				}

				param_00 setmode(level.sentrysettings[param_00.sentrytype].sentrymodeoff);
				thread lib_A7BA::setcarryingsentry(param_00,0);
				param_00.ownertrigger delete();
				return;
			}
		}

		wait(0.05);
	}
}

//Function Number: 18
lib_A7BA::turret_handleuse()
{
	self notify("turret_handluse");
	self endon("turret_handleuse");
	self endon("deleting");
	level endon("game_ended");
	self.forcedisable = 0;
	var_00 = (1,0.9,0.7);
	var_01 = (1,0.65,0);
	var_02 = (1,0.25,0);
	for(;;)
	{
		self waittill("trigger",var_03);
		if(isdefined(self.carriedby))
		{
			continue;
		}

		if(isdefined(self.inuseby))
		{
			continue;
		}

		if(!maps\mp\_utility::isreallyalive(var_03))
		{
			continue;
		}

		var_03 lib_A7BA::removeperks();
		var_03 lib_A7BA::removeweapons();
		self.inuseby = var_03;
		self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
		lib_A7BA::sentry_setowner(var_03);
		self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
		var_03 thread lib_A7BA::turret_shotmonitor(self);
		var_03.turret_overheat_bar = var_03 maps\mp\gametypes\_hud_util::createbar(var_00,100,6);
		var_03.turret_overheat_bar maps\mp\gametypes\_hud_util::setpoint("CENTER","BOTTOM",0,-70);
		var_03.turret_overheat_bar.alpha = 0.65;
		var_03.turret_overheat_bar.bar.alpha = 0.65;
		var_04 = 0;
		for(;;)
		{
			if(!maps\mp\_utility::isreallyalive(var_03))
			{
				self.inuseby = undefined;
				var_03.turret_overheat_bar maps\mp\gametypes\_hud_util::destroyelem();
				break;
			}

			if(!var_03 isusingturret())
			{
				self notify("player_dismount");
				self.inuseby = undefined;
				var_03.turret_overheat_bar maps\mp\gametypes\_hud_util::destroyelem();
				var_03 lib_A7BA::restoreperks();
				var_03 lib_A7BA::restoreweapons();
				self sethintstring(level.sentrysettings[self.sentrytype].hintstring);
				self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
				lib_A7BA::sentry_setowner(self.originalowner);
				self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
				break;
			}

			if(self.heatlevel >= level.sentrysettings[self.sentrytype].overheattime)
			{
				var_05 = 1;
			}
			else
			{
				var_05 = self.heatlevel / level.sentrysettings[self.sentrytype].overheattime;
			}

			var_03.turret_overheat_bar maps\mp\gametypes\_hud_util::updatebar(var_05);
			if(self.forcedisable || self.overheated)
			{
				self turretfiredisable();
				var_03.turret_overheat_bar.bar.color = var_02;
				var_04 = 0;
			}
			else
			{
				var_03.turret_overheat_bar.bar.color = var_00;
				self turretfireenable();
				var_04 = 0;
				self notify("not_overheated");
			}

			wait(0.05);
		}

		self setdefaultdroppitch(0);
	}
}

//Function Number: 19
lib_A7BA::sentry_handleownerdisconnect()
{
	self endon("death");
	level endon("game_ended");
	self notify("sentry_handleOwner");
	self endon("sentry_handleOwner");
	self.owner common_scripts\utility::waittill_any("disconnect","joined_team","joined_spectators");
	self notify("death");
}

//Function Number: 20
lib_A7BA::sentry_setowner(param_00)
{
	self.owner = param_00;
	self setsentryowner(self.owner);
	self setturretminimapvisible(1,self.sentrytype);
	if(level.teambased)
	{
		self.inliveplayerkillstreak = self.owner.inliveplayerkillstreak;
		self setturretteam(self.inliveplayerkillstreak);
	}

	thread lib_A7BA::sentry_handleownerdisconnect();
}

//Function Number: 21
lib_A7BA::sentry_setplaced()
{
	self setmodel(level.sentrysettings[self.sentrytype].modelbase);
	if(self getmode() == "manual")
	{
		self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
	}

	self setsentrycarrier(undefined);
	self setcandamage(1);
	lib_A7BA::sentry_makesolid();
	self.carriedby forceusehintoff();
	self.carriedby = undefined;
	if(isdefined(self.owner))
	{
		self.owner.iscarrying = 0;
	}

	lib_A7BA::sentry_setactive();
	self playsoundasmaster("sentry_gun_plant");
	self notify("placed");
}

//Function Number: 22
lib_A7BA::sentry_setcancelled()
{
	self.carriedby forceusehintoff();
	if(isdefined(self.owner))
	{
		self.owner.iscarrying = 0;
	}

	self delete();
}

//Function Number: 23
lib_A7BA::sentry_setcarried(param_00)
{
	if(isdefined(self.originalowner))
	{
	}
	else
	{
	}

	self setmodel(level.sentrysettings[self.sentrytype].modelplacement);
	self setsentrycarrier(param_00);
	self setcandamage(0);
	lib_A7BA::sentry_makenotsolid();
	self.carriedby = param_00;
	param_00.iscarrying = 1;
	param_00 thread lib_A7BA::updatesentryplacement(self);
	thread lib_A7BA::sentry_oncarrierdeath(param_00);
	thread lib_A7BA::sentry_oncarrierdisconnect(param_00);
	thread lib_A7BA::sentry_oncarrierchangedteam(param_00);
	thread lib_A7BA::sentry_ongameended();
	self setdefaultdroppitch(-89);
	lib_A7BA::sentry_setinactive();
	self notify("carried");
}

//Function Number: 24
lib_A7BA::updatesentryplacement(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	param_00 endon("placed");
	param_00 endon("death");
	param_00.canbeplaced = 1;
	var_01 = -1;
	for(;;)
	{
		var_02 = self canplayerplacesentry(1,22);
		param_00.var_2E6 = var_02["origin"];
		param_00.var_41 = var_02["angles"];
		param_00.canbeplaced = self isonground() && var_02["result"] && abs(param_00.var_2E6[2] - self.var_2E6[2]) < 30;
		if(param_00.canbeplaced != var_01)
		{
			if(param_00.canbeplaced)
			{
				param_00 setmodel(level.sentrysettings[param_00.sentrytype].modelplacement);
				self forceusehinton(&"SENTRY_PLACE");
			}
			else
			{
				param_00 setmodel(level.sentrysettings[param_00.sentrytype].modelplacementfailed);
				self forceusehinton(&"SENTRY_CANNOT_PLACE");
			}
		}

		var_01 = param_00.canbeplaced;
		wait(0.05);
	}
}

//Function Number: 25
lib_A7BA::sentry_oncarrierdeath(param_00)
{
	self endon("placed");
	self endon("death");
	param_00 waittill("death");
	if(self.canbeplaced)
	{
		lib_A7BA::sentry_setplaced();
		return;
	}

	self delete();
}

//Function Number: 26
lib_A7BA::sentry_oncarrierdisconnect(param_00)
{
	self endon("placed");
	self endon("death");
	param_00 waittill("disconnect");
	self delete();
}

//Function Number: 27
lib_A7BA::sentry_oncarrierchangedteam(param_00)
{
	self endon("placed");
	self endon("death");
	param_00 common_scripts\utility::waittill_any("joined_team","joined_spectators");
	self delete();
}

//Function Number: 28
lib_A7BA::sentry_ongameended(param_00)
{
	self endon("placed");
	self endon("death");
	level waittill("game_ended");
	self delete();
}

//Function Number: 29
lib_A7BA::sentry_setactive()
{
	self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
	self setcursorhint("HINT_NOICON");
	self sethintstring(level.sentrysettings[self.sentrytype].hintstring);
	if(level.sentrysettings[self.sentrytype].headicon)
	{
		if(level.teambased)
		{
			maps\mp\_entityheadicons::setteamheadicon(self.inliveplayerkillstreak,(0,0,65));
		}
		else
		{
			maps\mp\_entityheadicons::setplayerheadicon(self.owner,(0,0,65));
		}
	}

	self makeusable();
	foreach(var_01 in level.var_328)
	{
		var_02 = self getentitynumber();
		lib_A7BA::addtoturretlist(var_02);
		if(var_01 == self.owner)
		{
			self enableplayeruse(var_01);
			continue;
		}

		self disableplayeruse(var_01);
	}

	if(self.shouldsplash)
	{
		level thread maps\mp\_utility::teamplayercardsplash(level.sentrysettings[self.sentrytype].teamsplash,self.owner,self.owner.inliveplayerkillstreak);
		self.shouldsplash = 0;
	}

	if(self.sentrytype == "sam_turret")
	{
		thread lib_A7BA::sam_attacktargets();
	}

	thread lib_A7BA::sentry_watchdisabled();
}

//Function Number: 30
lib_A7BA::sentry_setinactive()
{
	self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
	self makeunusable();
	self sentient_freeentitysentient();
	var_00 = self getentitynumber();
	lib_A7BA::removefromturretlist(var_00);
	if(level.teambased)
	{
		maps\mp\_entityheadicons::setteamheadicon("none",(0,0,0));
		return;
	}

	if(isdefined(self.owner))
	{
		maps\mp\_entityheadicons::setplayerheadicon(undefined,(0,0,0));
	}
}

//Function Number: 31
lib_A7BA::sentry_makesolid()
{
	self maketurretsolid();
}

//Function Number: 32
lib_A7BA::sentry_makenotsolid()
{
	self setcontents(0);
}

//Function Number: 33
lib_A7BA::isfriendlytosentry(param_00)
{
	if(level.teambased && self.inliveplayerkillstreak == param_00.inliveplayerkillstreak)
	{
		return 1;
	}

	return 0;
}

//Function Number: 34
lib_A7BA::addtoturretlist(param_00)
{
	level.turrets[param_00] = self;
}

//Function Number: 35
lib_A7BA::removefromturretlist(param_00)
{
	level.turrets[param_00] = undefined;
}

//Function Number: 36
lib_A7BA::sentry_attacktargets()
{
	self endon("death");
	level endon("game_ended");
	self.momentum = 0;
	self.heatlevel = 0;
	self.overheated = 0;
	thread lib_A7BA::sentry_heatmonitor();
	for(;;)
	{
		common_scripts\utility::waittill_either("turretstatechange","cooled");
		if(self isfiringturret())
		{
			thread lib_A7BA::sentry_burstfirestart();
			continue;
		}

		lib_A7BA::sentry_spindown();
		thread lib_A7BA::sentry_burstfirestop();
	}
}

//Function Number: 37
lib_A7BA::sentry_timeout()
{
	self endon("death");
	level endon("game_ended");
	var_00 = level.sentrysettings[self.sentrytype].timeout;
	while(var_00)
	{
		wait(1);
		maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
		if(!isdefined(self.carriedby))
		{
			var_00 = max(0,var_00 - 1);
		}
	}

	if(isdefined(self.owner))
	{
		if(self.sentrytype == "sam_turret")
		{
			self.owner thread maps\mp\_utility::leaderdialogonplayer("sam_gone");
		}
		else
		{
			self.owner thread maps\mp\_utility::leaderdialogonplayer("sentry_gone");
		}
	}

	self notify("death");
}

//Function Number: 38
lib_A7BA::sentry_targetlocksound()
{
	self endon("death");
	self playsoundasmaster("sentry_gun_beep");
	wait(0.1);
	self playsoundasmaster("sentry_gun_beep");
	wait(0.1);
	self playsoundasmaster("sentry_gun_beep");
}

//Function Number: 39
lib_A7BA::sentry_spinup()
{
	thread lib_A7BA::sentry_targetlocksound();
	while(self.momentum < level.sentrysettings[self.sentrytype].spinuptime)
	{
		self.momentum = self.momentum + 0.1;
		wait(0.1);
	}
}

//Function Number: 40
lib_A7BA::sentry_spindown()
{
	self.momentum = 0;
}

//Function Number: 41
lib_A7BA::sentry_burstfirestart()
{
	self endon("death");
	self endon("stop_shooting");
	level endon("game_ended");
	lib_A7BA::sentry_spinup();
	var_00 = weaponfiretime(level.sentrysettings[self.sentrytype].energyturret);
	var_01 = level.sentrysettings[self.sentrytype].burstmin;
	var_02 = level.sentrysettings[self.sentrytype].burstmax;
	var_03 = level.sentrysettings[self.sentrytype].pausemin;
	var_04 = level.sentrysettings[self.sentrytype].pausemax;
	for(;;)
	{
		var_05 = randomintrange(var_01,var_02 + 1);
		for(var_06 = 0;var_06 < var_05 && !self.overheated;var_06++)
		{
			self shootturret();
			self.heatlevel = self.heatlevel + var_00;
			wait(var_00);
		}

		wait(randomfloatrange(var_03,var_04));
	}
}

//Function Number: 42
lib_A7BA::sentry_burstfirestop()
{
	self notify("stop_shooting");
}

//Function Number: 43
lib_A7BA::turret_shotmonitor(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	param_00 endon("death");
	param_00 endon("player_dismount");
	var_01 = weaponfiretime(level.sentrysettings[param_00.sentrytype].energyturret);
	for(;;)
	{
		param_00 waittill("turret_fire");
		param_00.heatlevel = param_00.heatlevel + var_01;
		param_00.cooldownwaittime = var_01;
	}
}

//Function Number: 44
lib_A7BA::sentry_heatmonitor()
{
	self endon("death");
	var_00 = weaponfiretime(level.sentrysettings[self.sentrytype].energyturret);
	var_01 = 0;
	var_02 = 0;
	var_03 = level.sentrysettings[self.sentrytype].overheattime;
	var_04 = level.sentrysettings[self.sentrytype].cooldowntime;
	for(;;)
	{
		if(self.heatlevel != var_01)
		{
			wait(var_00);
		}
		else
		{
			self.heatlevel = max(0,self.heatlevel - 0.05);
		}

		if(self.heatlevel > var_03)
		{
			self.overheated = 1;
			thread lib_A7BA::playheatfx();
			while(self.heatlevel)
			{
				self.heatlevel = max(0,self.heatlevel - var_04);
				wait(0.1);
			}

			self.overheated = 0;
			self notify("not_overheated");
		}

		var_01 = self.heatlevel;
		wait(0.05);
	}
}

//Function Number: 45
lib_A7BA::turret_heatmonitor()
{
	self endon("death");
	var_00 = level.sentrysettings[self.sentrytype].overheattime;
	for(;;)
	{
		if(self.heatlevel > var_00)
		{
			self.overheated = 1;
			thread lib_A7BA::playheatfx();
			while(self.heatlevel)
			{
				wait(0.1);
			}

			self.overheated = 0;
			self notify("not_overheated");
		}

		wait(0.05);
	}
}

//Function Number: 46
lib_A7BA::turret_coolmonitor()
{
	self endon("death");
	for(;;)
	{
		if(self.heatlevel > 0)
		{
			if(self.cooldownwaittime <= 0)
			{
				self.heatlevel = max(0,self.heatlevel - 0.05);
			}
			else
			{
				self.cooldownwaittime = max(0,self.cooldownwaittime - 0.05);
			}
		}

		wait(0.05);
	}
}

//Function Number: 47
lib_A7BA::playheatfx()
{
	self endon("death");
	self endon("not_overheated");
	level endon("game_ended");
	self notify("playing_heat_fx");
	self endon("playing_heat_fx");
	for(;;)
	{
		playfxontag(common_scripts\utility::getfx("sentry_overheat_mp"),self,"tag_flash");
		wait(level.sentrysettings[self.sentrytype].fxtime);
	}
}

//Function Number: 48
lib_A7BA::playsmokefx()
{
	self endon("death");
	self endon("not_overheated");
	level endon("game_ended");
	for(;;)
	{
		playfxontag(common_scripts\utility::getfx("sentry_smoke_mp"),self,"tag_aim");
		wait(0.4);
	}
}

//Function Number: 49
lib_A7BA::sentry_beepsounds()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		wait(3);
		if(!isdefined(self.carriedby))
		{
			self playsoundasmaster("sentry_gun_beep");
		}
	}
}

//Function Number: 50
lib_A7BA::sam_attacktargets()
{
	self endon("carried");
	self endon("death");
	level endon("game_ended");
	self.samtargetent = undefined;
	self.sammissilegroups = [];
	for(;;)
	{
		self.samtargetent = lib_A7BA::sam_acquiretarget();
		lib_A7BA::sam_fireontarget();
		wait(0.05);
	}
}

//Function Number: 51
lib_A7BA::sam_acquiretarget()
{
	var_00 = self gettagorigin("tag_laser");
	if(!isdefined(self.samtargetent))
	{
		if(level.teambased)
		{
			var_01 = [];
			if(level.multiteambased)
			{
				foreach(var_03 in level.teamnamelist)
				{
					if(var_03 != self.inliveplayerkillstreak)
					{
						foreach(var_05 in level.uavmodels[var_03])
						{
							var_01[var_01.size] = var_05;
						}
					}
				}
			}
			else if(isdefined(self.inliveplayerkillstreak))
			{
				var_01 = level.uavmodels[level.matchbonus[self.inliveplayerkillstreak]];
			}

			foreach(var_09 in var_01)
			{
				if(isdefined(var_09.isleaving) && var_09.isleaving)
				{
					continue;
				}

				if(isdefined(var_09.orbit) && var_09.orbit)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_09.var_2E6,0,self))
				{
					return var_09;
				}
			}

			foreach(var_0C in level.littlebirds)
			{
				if(isdefined(var_0C.inliveplayerkillstreak) && var_0C.inliveplayerkillstreak == self.inliveplayerkillstreak)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_0C.var_2E6,0,self))
				{
					return var_0C;
				}
			}

			foreach(var_0F in level.helis)
			{
				if(isdefined(var_0F.inliveplayerkillstreak) && var_0F.inliveplayerkillstreak == self.inliveplayerkillstreak)
				{
					continue;
				}

				if(isdefined(var_0F.cloakstate) && var_0F.cloakstate < 1)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_0F.var_2E6,0,self,var_0F))
				{
					return var_0F;
				}
			}

			if(level.orbitalsupportinuse && isdefined(level.orbitalsupport_planemodel.owner) && level.orbitalsupport_planemodel.owner.inliveplayerkillstreak != self.inliveplayerkillstreak)
			{
				if(sighttracepassed(var_00,level.orbitalsupport_planemodel.var_2E6,0,self))
				{
					return level.orbitalsupport_planemodel;
				}
			}

			if(isdefined(level._orbital_care_pod))
			{
				foreach(var_12 in level._orbital_care_pod)
				{
					if(isdefined(var_12.podrocket) && var_12.owner.inliveplayerkillstreak != self.inliveplayerkillstreak)
					{
						if(sighttracepassed(var_00,var_12.podrocket.var_2E6,0,self))
						{
							return var_12.podrocket;
						}
					}
				}
			}

			foreach(var_15 in level.planes)
			{
				if(isdefined(var_15.inliveplayerkillstreak) && var_15.inliveplayerkillstreak == self.inliveplayerkillstreak)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_15.var_2E6,0,self))
				{
					return var_15;
				}
			}
		}
		else
		{
			foreach(var_09 in level.uavmodels)
			{
				if(isdefined(var_09.isleaving) && var_09.isleaving)
				{
					continue;
				}

				if(isdefined(var_09.owner) && isdefined(self.owner) && var_09.owner == self.owner)
				{
					continue;
				}

				if(isdefined(var_09.orbit) && var_09.orbit)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_09.var_2E6,0,self))
				{
					return var_09;
				}
			}

			foreach(var_0C in level.littlebirds)
			{
				if(isdefined(var_0C.owner) && isdefined(self.owner) && var_0C.owner == self.owner)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_0C.var_2E6,0,self))
				{
					return var_0C;
				}
			}

			foreach(var_0F in level.helis)
			{
				if(isdefined(var_0F.owner) && isdefined(self.owner) && var_0F.owner == self.owner)
				{
					continue;
				}

				if(isdefined(var_0F.cloakstate) && var_0F.cloakstate < 1)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_0F.var_2E6,0,self,var_0F))
				{
					return var_0F;
				}
			}

			if(level.orbitalsupportinuse && isdefined(level.orbitalsupport_planemodel.owner) && isdefined(self.owner) && level.orbitalsupport_planemodel.owner != self.owner)
			{
				if(sighttracepassed(var_00,level.orbitalsupport_planemodel.owner.var_2E6,0,self))
				{
					return level.orbitalsupport_planemodel.owner;
				}
			}

			if(isdefined(level._orbital_care_pod))
			{
				foreach(var_12 in level._orbital_care_pod)
				{
					if(isdefined(var_12.podrocket) && var_12.owner != self)
					{
						if(sighttracepassed(var_00,var_12.podrocket.var_2E6,0,self))
						{
							return var_12.podrocket;
						}
					}
				}
			}

			foreach(var_15 in level.planes)
			{
				if(isdefined(var_15.inliveplayerkillstreak) && var_15.owner == self.owner)
				{
					continue;
				}

				if(sighttracepassed(var_00,var_15.var_2E6,0,self))
				{
					return var_15;
				}
			}
		}

		self cleartargetentity();
		return undefined;
	}

	if(!sighttracepassed(var_15,self.samtargetent.var_2E6,0,self,self.samtargetent))
	{
		self cleartargetentity();
		return undefined;
	}

	return self.samtargetent;
}

//Function Number: 52
lib_A7BA::sam_fireontarget()
{
	if(isdefined(self.samtargetent))
	{
		if((self.samtargetent == level.ac130.planemodel && !isdefined(level.ac130player)) || isdefined(level.orbitalsupport_planemodel) && self.samtargetent == level.orbitalsupport_planemodel && !isdefined(level.orbitalsupport_player))
		{
			self.samtargetent = undefined;
			self cleartargetentity();
			return;
		}

		self settargetentity(self.samtargetent);
		self waittill("turret_on_target");
		if(!isdefined(self.samtargetent))
		{
			return;
		}

		if(!self.var_54D7)
		{
			thread lib_A7BA::sam_watchlaser();
			thread lib_A7BA::sam_watchcrashing();
			thread lib_A7BA::sam_watchleaving();
			thread lib_A7BA::sam_watchlineofsight();
		}

		wait(2);
		if(!isdefined(self.samtargetent))
		{
			return;
		}

		if(self.samtargetent == level.ac130.planemodel && !isdefined(level.ac130player))
		{
			self.samtargetent = undefined;
			self cleartargetentity();
			return;
		}

		var_00 = [];
		var_00[0] = self gettagorigin("tag_le_missile1");
		var_00[1] = self gettagorigin("tag_le_missile2");
		var_00[2] = self gettagorigin("tag_ri_missile1");
		var_00[3] = self gettagorigin("tag_ri_missile2");
		var_01 = self.sammissilegroups.size;
		for(var_02 = 0;var_02 < 4;var_02++)
		{
			if(!isdefined(self.samtargetent))
			{
				return;
			}

			if(isdefined(self.carriedby))
			{
				return;
			}

			self shootturret();
			var_03 = magicbullet("sam_projectile_mp",var_00[var_02],self.samtargetent.var_2E6,self.owner);
			var_03 missilesettargetent(self.samtargetent);
			var_03 missilesetflightmodedirect();
			var_03.samturret = self;
			var_03.sammissilegroup = var_01;
			self.sammissilegroups[var_01][var_02] = var_03;
			level notify("sam_missile_fired",self.owner,var_03,self.samtargetent);
			if(var_02 == 3)
			{
				break;
			}

			wait(0.25);
		}

		level notify("sam_fired",self.owner,self.sammissilegroups[var_01],self.samtargetent);
		wait(3);
	}
}

//Function Number: 53
lib_A7BA::sam_watchlineofsight()
{
	level endon("game_ended");
	self endon("death");
	self endon("fakedeath");
	while(isdefined(self.samtargetent) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == self.samtargetent)
	{
		var_00 = self gettagorigin("tag_laser");
		if(!sighttracepassed(var_00,self.samtargetent.var_2E6,0,self,self.samtargetent))
		{
			self cleartargetentity();
			self.samtargetent = undefined;
			break;
		}

		wait(0.05);
	}
}

//Function Number: 54
lib_A7BA::sam_watchlaser()
{
	self endon("death");
	self method_80B2();
	self.var_54D7 = 1;
	self notify("laser_on");
	while(isdefined(self.samtargetent) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == self.samtargetent)
	{
		wait(0.05);
	}

	self method_80B3();
	self.var_54D7 = 0;
	self notify("laser_off");
}

//Function Number: 55
lib_A7BA::sam_watchcrashing()
{
	self endon("death");
	self endon("fakedeath");
	self.samtargetent endon("death");
	if(!isdefined(self.samtargetent.helitype))
	{
		return;
	}

	self.samtargetent waittill("crashing");
	self cleartargetentity();
	self.samtargetent = undefined;
}

//Function Number: 56
lib_A7BA::sam_watchleaving()
{
	self endon("death");
	self endon("fakedeath");
	self.samtargetent endon("death");
	if(!isdefined(self.samtargetent.model))
	{
		return;
	}

	if(self.samtargetent.model == "vehicle_uav_static_mp")
	{
		self.samtargetent waittill("leaving");
		self cleartargetentity();
		self.samtargetent = undefined;
	}
}