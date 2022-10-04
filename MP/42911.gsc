/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42911.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 7 ms
 * Timestamp: 4/20/2022 8:18:27 PM
*******************************************************************/

//Function Number: 1
lib_A79F::init()
{
	if(!isdefined(game["gamestarted"]))
	{
		game["menu_team"] = "team_marinesopfor";
		if(level.multiteambased)
		{
			game["menu_team"] = "team_mt_options";
		}

		game["menu_class"] = "class";
		game["menu_class_allies"] = "class_marines";
		game["menu_class_axis"] = "class_opfor";
		game["menu_changeclass_allies"] = "changeclass_marines";
		game["menu_changeclass_axis"] = "changeclass_opfor";
		if(level.multiteambased)
		{
			for(var_00 = 0;var_00 < level.teamnamelist.size;var_00++)
			{
				var_01 = "menu_class_" + level.teamnamelist[var_00];
				var_02 = "menu_changeclass_" + level.teamnamelist[var_00];
				game[var_01] = game["menu_class_allies"];
				game[var_02] = "changeclass_marines";
			}
		}

		game["menu_changeclass"] = "changeclass";
		if(level.console)
		{
			game["menu_controls"] = "ingame_controls";
			if(level.splitscreen)
			{
				if(level.multiteambased)
				{
					for(var_00 = 0;var_00 < level.teamnamelist.size;var_00++)
					{
						var_01 = "menu_class_" + level.teamnamelist[var_00];
						var_02 = "menu_changeclass_" + level.teamnamelist[var_00];
						game[var_01] = game[var_01] + "_splitscreen";
						game[var_02] = game[var_02] + "_splitscreen";
					}
				}

				game["menu_team"] = game["menu_team"] + "_splitscreen";
				game["menu_class_allies"] = game["menu_class_allies"] + "_splitscreen";
				game["menu_class_axis"] = game["menu_class_axis"] + "_splitscreen";
				game["menu_changeclass_allies"] = game["menu_changeclass_allies"] + "_splitscreen";
				game["menu_changeclass_axis"] = game["menu_changeclass_axis"] + "_splitscreen";
				game["menu_controls"] = game["menu_controls"] + "_splitscreen";
				game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
				game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
			}
		}

		precachestring(&"MP_HOST_ENDED_GAME");
		precachestring(&"MP_HOST_ENDGAME_RESPONSE");
	}

	level thread lib_A79F::onplayerconnect();
}

//Function Number: 2
lib_A79F::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A79F::watchforclasschange();
		var_00 thread lib_A79F::watchforteamchange();
		var_00 thread lib_A79F::watchforleavegame();
		var_00 thread lib_A79F::connectedmenus();
	}
}

//Function Number: 3
lib_A79F::connectedmenus()
{
}

//Function Number: 4
lib_A79F::getclasschoice(param_00)
{
	if(param_00 <= 100)
	{
		if(maps\mp\_utility::practiceroundgame())
		{
			param_00 = "practice" + param_00;
		}
		else
		{
			param_00 = "custom" + param_00;
		}
	}
	else if(param_00 <= 200)
	{
		param_00 = param_00 - 101;
		param_00 = "class" + param_00;
	}
	else if(param_00 <= 206)
	{
		param_00 = param_00 - 200;
		param_00 = "axis_recipe" + param_00;
	}
	else
	{
		param_00 = param_00 - 206;
		param_00 = "allies_recipe" + param_00;
	}

	return param_00;
}

//Function Number: 5
lib_A79F::watchforclasschange()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("luinotifyserver",var_00,var_01);
		if(var_00 != "class_select")
		{
			continue;
		}

		if(maps\mp\_utility::ismlgsplitscreen() && self ismlgspectator() && !maps\mp\_utility::invirtuallobby())
		{
			self setclientomnvar("ui_options_menu",0);
			continue;
		}

		if(!function_0286(self) && !isai(self))
		{
			if("" + var_01 != "callback")
			{
				self setclientomnvar("ui_loadout_selected",var_01);
			}
		}

		if(isdefined(self.waitingtoselectclass) && self.waitingtoselectclass)
		{
			continue;
		}

		if(!maps\mp\_utility::allowclasschoice())
		{
			continue;
		}

		self setclientomnvar("ui_options_menu",0);
		if("" + var_01 != "callback")
		{
			if(isbot(self) || function_0286(self))
			{
				self.connectedpostgame["class"] = var_01;
				self.class = var_01;
				maps\mp\gametypes\_class::clearcopycatloadout();
			}
			else
			{
				var_02 = var_01 + 1;
				var_02 = lib_A79F::getclasschoice(var_02);
				if(!isdefined(self.connectedpostgame["class"]) || var_02 == self.connectedpostgame["class"])
				{
					continue;
				}

				self.connectedpostgame["class"] = var_02;
				self.class = var_02;
				maps\mp\gametypes\_class::clearcopycatloadout();
				thread lib_A79F::menugiveclass();
			}

			continue;
		}

		lib_A79F::menuclass("callback");
	}
}

//Function Number: 6
lib_A79F::watchforleavegame()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("luinotifyserver",var_00,var_01);
		if(var_00 != "end_game")
		{
			continue;
		}

		level thread maps\mp\gametypes\_gamelogic::forceend();
	}
}

//Function Number: 7
lib_A79F::watchforteamchange()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("luinotifyserver",var_00,var_01);
		if(var_00 != "team_select")
		{
			continue;
		}

		if(maps\mp\_utility::matchmakinggame() && !getdvarint("force_ranking"))
		{
			continue;
		}

		if(var_01 != 3)
		{
			thread lib_A79F::showloadoutmenu();
		}

		if(var_01 == 3)
		{
			self setclientomnvar("ui_options_menu",0);
			self setclientomnvar("ui_spectator_selected",1);
			self setclientomnvar("ui_loadout_selected",-1);
			self.spectating_actively = 1;
			if(maps\mp\_utility::ismlgsplitscreen())
			{
				self setmlgspectator(1);
				self setclientomnvar("ui_use_mlg_hud",1);
				thread maps\mp\gametypes\_spectating::setspectatepermissions();
			}
		}
		else
		{
			self setclientomnvar("ui_spectator_selected",-1);
			self.spectating_actively = 0;
			if(maps\mp\_utility::ismlgsplitscreen())
			{
				self setmlgspectator(0);
				self setclientomnvar("ui_use_mlg_hud",0);
			}
		}

		self setclientomnvar("ui_team_selected",var_01);
		if(var_01 == 0)
		{
			var_01 = "axis";
		}
		else if(var_01 == 1)
		{
			var_01 = "allies";
		}
		else if(var_01 == 2)
		{
			var_01 = "random";
		}
		else
		{
			var_01 = "spectator";
		}

		if(isdefined(self.connectedpostgame["team"]) && var_01 == self.connectedpostgame["team"])
		{
			self notify("selected_same_team");
			continue;
		}

		self setclientomnvar("ui_loadout_selected",-1);
		if(var_01 == "axis")
		{
			thread lib_A79F::setteam("axis");
			continue;
		}

		if(var_01 == "allies")
		{
			thread lib_A79F::setteam("allies");
			continue;
		}

		if(var_01 == "random")
		{
			self thread [[ level.autoassign ]]();
			continue;
		}

		if(var_01 == "spectator")
		{
			thread lib_A79F::setspectator();
		}
	}
}

//Function Number: 8
lib_A79F::showloadoutmenu()
{
	self endon("disconnect");
	level endon("game_ended");
	common_scripts\utility::waittill_any("joined_team","selected_same_team");
	self setclientomnvar("ui_options_menu",2);
}

//Function Number: 9
lib_A79F::autoassign()
{
	if(maps\mp\_utility::iscoop())
	{
		thread lib_A79F::setteam("allies");
		self.sessionteam = "allies";
		return;
	}

	if(!isdefined(self.inliveplayerkillstreak))
	{
		if(self ismlgspectator() && !maps\mp\_utility::invirtuallobby())
		{
			thread lib_A79F::setspectator();
		}
		else if(level.teamcount["axis"] < level.teamcount["allies"])
		{
			thread lib_A79F::setteam("axis");
		}
		else if(level.teamcount["allies"] < level.teamcount["axis"])
		{
			thread lib_A79F::setteam("allies");
		}
		else if(getteamscore("allies") > getteamscore("axis"))
		{
			thread lib_A79F::setteam("axis");
		}
		else
		{
			thread lib_A79F::setteam("allies");
		}

		return;
	}

	if(self ismlgspectator() && !maps\mp\_utility::invirtuallobby())
	{
		thread lib_A79F::setspectator();
		return;
	}

	if(level.teamcount["axis"] < level.teamcount["allies"] && self.inliveplayerkillstreak != "axis")
	{
		thread lib_A79F::setteam("axis");
		return;
	}

	if(level.teamcount["allies"] < level.teamcount["axis"] && self.inliveplayerkillstreak != "allies")
	{
		thread lib_A79F::setteam("allies");
		return;
	}

	if(level.teamcount["allies"] == level.teamcount["axis"])
	{
		if(getteamscore("allies") > getteamscore("axis") && self.inliveplayerkillstreak != "axis")
		{
			thread lib_A79F::setteam("axis");
			return;
		}

		if(self.inliveplayerkillstreak != "allies")
		{
			thread lib_A79F::setteam("allies");
			return;
		}

		return;
	}
}

//Function Number: 10
lib_A79F::setteam(param_00)
{
	self endon("disconnect");
	if(!isai(self) && level.teambased && !maps\mp\gametypes\_teams::getjointeampermissions(param_00))
	{
		return;
	}

	if(level.ingraceperiod && !self.hasdonecombat)
	{
		self.afk = 0;
	}

	if(self.sessionstate == "playing")
	{
		self.commanding_bot = 1;
		self.joining_team = param_00;
		self.leaving_team = self.connectedpostgame["team"];
	}

	lib_A79F::addtoteam(param_00);
	if(self.sessionstate == "playing")
	{
		self suicide();
	}

	lib_A79F::waitforclassselect();
	lib_A79F::endrespawnnotify();
	if(self.sessionstate == "spectator")
	{
		if(game["state"] == "postgame")
		{
			return;
		}

		if(game["state"] == "playing" && !maps\mp\_utility::isinkillcam())
		{
			if(isdefined(self.forcespawnorigin) && self.forcespawnorigin)
			{
				return;
			}

			maps\mp\gametypes\_playerlogic::spawnclient();
		}

		thread maps\mp\gametypes\_spectating::setspectatepermissions();
	}
}

//Function Number: 11
lib_A79F::setspectator()
{
	if(isdefined(self.connectedpostgame["team"]) && self.connectedpostgame["team"] == "spectator")
	{
		return;
	}

	if(isalive(self))
	{
		self.commanding_bot = 1;
		self.joining_team = "spectator";
		self.leaving_team = self.connectedpostgame["team"];
		self suicide();
	}

	self notify("becameSpectator");
	lib_A79F::addtoteam("spectator");
	self.connectedpostgame["class"] = undefined;
	self.class = undefined;
	thread maps\mp\gametypes\_playerlogic::spawnspectator();
}

//Function Number: 12
handleclasschoicedisallowed()
{
	if(!isai(self) && maps\mp\_utility::showgenericmenuonmatchstart())
	{
		thread maps\mp\gametypes\_playerlogic::setuioptionsmenu(3);
		for(;;)
		{
			self waittill("luinotifyserver",var_00,var_01);
			if(var_00 == "class_select")
			{
				break;
			}
		}
	}

	self notify("notWaitingToSelectClass");
	self.waitingtoselectclass = 0;
	lib_A79F::bypassclasschoice();
}

//Function Number: 13
lib_A79F::waitforclassselect()
{
	self endon("disconnect");
	level endon("game_ended");
	self.waitingtoselectclass = 1;
	if(maps\mp\_utility::allowclasschoice())
	{
		for(;;)
		{
			self waittill("luinotifyserver",var_00,var_01);
			if(var_00 == "class_select")
			{
				break;
			}
		}

		if("" + var_01 != "callback")
		{
			if(isbot(self) || function_0286(self))
			{
				self.connectedpostgame["class"] = var_01;
				self.class = var_01;
				maps\mp\gametypes\_class::clearcopycatloadout();
			}
			else
			{
				var_01 = var_01 + 1;
				self.connectedpostgame["class"] = lib_A79F::getclasschoice(var_01);
				self.class = lib_A79F::getclasschoice(var_01);
				maps\mp\gametypes\_class::clearcopycatloadout();
			}

			self notify("notWaitingToSelectClass");
			self.waitingtoselectclass = 0;
			return;
		}

		self notify("notWaitingToSelectClass");
		self.waitingtoselectclass = 0;
		lib_A79F::menuclass("callback");
		return;
	}

	handleclasschoicedisallowed();
}

//Function Number: 14
lib_A79F::beginclasschoice(param_00)
{
	var_01 = self.connectedpostgame["team"];
	if(maps\mp\_utility::allowclasschoice())
	{
		thread maps\mp\gametypes\_playerlogic::setuioptionsmenu(2);
		if(!self ismlgspectator() || maps\mp\_utility::invirtuallobby())
		{
			lib_A79F::waitforclassselect();
		}

		lib_A79F::endrespawnnotify();
		if(self.sessionstate == "spectator")
		{
			if(game["state"] == "postgame")
			{
				return;
			}

			if(game["state"] == "playing" && !maps\mp\_utility::isinkillcam())
			{
				if(isdefined(self.forcespawnorigin) && self.forcespawnorigin)
				{
					return;
				}

				thread maps\mp\gametypes\_playerlogic::spawnclient();
			}

			thread maps\mp\gametypes\_spectating::setspectatepermissions();
		}

		self.connecttime = gettime();
		return;
	}

	thread lib_A79F::bypassclasschoice();
}

//Function Number: 15
lib_A79F::bypassclasschoice()
{
	maps\mp\gametypes\_class::clearcopycatloadout();
	self.selectedclass = 1;
	self.class = "class0";
	if(isdefined(level.bypassclasschoicefunc))
	{
		self [[ level.bypassclasschoicefunc ]]();
	}
}

//Function Number: 16
lib_A79F::beginteamchoice()
{
	thread maps\mp\gametypes\_playerlogic::setuioptionsmenu(1);
}

//Function Number: 17
lib_A79F::showmainmenuforteam()
{
	var_00 = self.connectedpostgame["team"];
	self method_8323(game["menu_class_" + var_00]);
}

//Function Number: 18
lib_A79F::menuspectator()
{
	if(isdefined(self.connectedpostgame["team"]) && self.connectedpostgame["team"] == "spectator")
	{
		return;
	}

	if(isalive(self))
	{
		self.commanding_bot = 1;
		self.joining_team = "spectator";
		self.leaving_team = self.connectedpostgame["team"];
		self suicide();
	}

	lib_A79F::addtoteam("spectator");
	self.connectedpostgame["class"] = undefined;
	self.class = undefined;
	maps\mp\gametypes\_class::clearcopycatloadout();
	thread maps\mp\gametypes\_playerlogic::spawnspectator();
}

//Function Number: 19
lib_A79F::watchhasdonecombat()
{
	if(!self.hasdonecombat)
	{
		self endon("death");
		self endon("disconnect");
		self endon("streamClassWeaponsComplete");
		level endon("game_ended");
		self waittill("hasDoneCombat");
		self notify("endStreamClassWeapons");
		self iprintlnbold(game["strings"]["change_class_cancel"]);
		wait(2);
		self iprintlnbold(game["strings"]["change_class"]);
	}
}

//Function Number: 20
lib_A79F::menugiveclass()
{
	if(level.ingraceperiod && !self.hasdonecombat)
	{
		thread maps\mp\gametypes\_playerlogic::streamclassweapons(1);
		if(self.classweaponswait)
		{
			self endon("death");
			self endon("disconnect");
			level endon("game_ended");
			self endon("endStreamClassWeapons");
			thread lib_A79F::watchhasdonecombat();
			self iprintlnbold(game["strings"]["change_class_wait"]);
			self waittill("streamClassWeaponsComplete");
			self iprintlnbold("");
			self method_8538(0);
		}

		maps\mp\gametypes\_class::setclass(self.connectedpostgame["class"]);
		self.tag_stowed_back = undefined;
		self.tag_stowed_hip = undefined;
		maps\mp\gametypes\_class::giveloadout(self.connectedpostgame["team"],self.connectedpostgame["class"]);
		if(!isdefined(self.spawnplayergivingloadout))
		{
			maps\mp\gametypes\_class::applyloadout();
		}

		if(maps\mp\_utility::_hasperk("specialty_moreminimap"))
		{
			setomnvar("ui_minimap_extend_grace_period",1);
			return;
		}

		setomnvar("ui_minimap_extend_grace_period",0);
		return;
	}

	maps\mp\gametypes\_playerlogic::streamclassweapons();
	self iprintlnbold(game["strings"]["change_class"]);
}

//Function Number: 21
lib_A79F::menuclass(param_00)
{
	var_01 = self.connectedpostgame["team"];
	var_02 = maps\mp\gametypes\_class::getclasschoice(param_00);
	var_03 = maps\mp\gametypes\_class::getweaponchoice(param_00);
	if(var_02 == "restricted")
	{
		lib_A79F::beginclasschoice();
		return;
	}

	if(isdefined(self.connectedpostgame["class"]) && self.connectedpostgame["class"] == var_02 && isdefined(self.connectedpostgame["primary"]) && self.connectedpostgame["primary"] == var_03)
	{
		return;
	}

	if(self.sessionstate == "playing")
	{
		if(isdefined(self.connectedpostgame["lastClass"]) && isdefined(self.connectedpostgame["class"]))
		{
			self.connectedpostgame["lastClass"] = self.connectedpostgame["class"];
			self.lastclass = self.connectedpostgame["lastClass"];
		}

		self.connectedpostgame["class"] = var_02;
		self.class = var_02;
		maps\mp\gametypes\_class::clearcopycatloadout();
		self.connectedpostgame["primary"] = var_03;
		if(game["state"] == "postgame")
		{
			return;
		}

		thread lib_A79F::menugiveclass();
	}
	else
	{
		if(isdefined(self.connectedpostgame["lastClass"]) && isdefined(self.connectedpostgame["class"]))
		{
			self.connectedpostgame["lastClass"] = self.connectedpostgame["class"];
			self.lastclass = self.connectedpostgame["lastClass"];
		}

		self.connectedpostgame["class"] = var_02;
		self.class = var_02;
		maps\mp\gametypes\_class::clearcopycatloadout();
		self.connectedpostgame["primary"] = var_03;
		if(game["state"] == "postgame")
		{
			return;
		}

		if(game["state"] == "playing" && !maps\mp\_utility::isinkillcam())
		{
			thread maps\mp\gametypes\_playerlogic::spawnclient();
		}
	}

	thread maps\mp\gametypes\_spectating::setspectatepermissions();
}

//Function Number: 22
lib_A79F::addtoteam(param_00,param_01,param_02)
{
	if(isdefined(self.inliveplayerkillstreak))
	{
		maps\mp\gametypes\_playerlogic::removefromteamcount();
		if(isdefined(param_02) && param_02)
		{
			maps\mp\gametypes\_playerlogic::decrementalivecount(self.inliveplayerkillstreak);
		}
	}

	self.connectedpostgame["team"] = param_00;
	self.inliveplayerkillstreak = param_00;
	if(!getdvarint("party_playersCoop",0) && !maps\mp\_utility::matchmakinggame() || isbot(self) || function_0286(self) || !maps\mp\_utility::allowteamchoice() || getdvarint("force_ranking"))
	{
		if(level.teambased)
		{
			self.sessionteam = param_00;
		}
		else if(param_00 == "spectator")
		{
			self.sessionteam = "spectator";
		}
		else
		{
			self.sessionteam = "none";
		}
	}

	if(game["state"] != "postgame")
	{
		maps\mp\gametypes\_playerlogic::addtoteamcount();
		if(isdefined(param_02) && param_02)
		{
			maps\mp\gametypes\_playerlogic::incrementalivecount(self.inliveplayerkillstreak);
		}
	}

	maps\mp\_utility::updateobjectivetext();
	if(isdefined(param_01) && param_01)
	{
		waittillframeend;
	}

	maps\mp\_utility::updatemainmenu();
	if(param_00 == "spectator")
	{
		self notify("joined_spectators");
		level notify("joined_team",self);
		return;
	}

	self notify("joined_team");
	level notify("joined_team",self);
}

//Function Number: 23
lib_A79F::endrespawnnotify()
{
	self.waitingtospawn = 0;
	self notify("end_respawn");
}