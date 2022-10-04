/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42923.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 17
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:18:29 PM
*******************************************************************/

//Function Number: 1
lib_A7AB::playersethudempscrambled(param_00,param_01,param_02)
{
	var_03 = gettime();
	if(var_03 > param_00)
	{
		return;
	}

	if(!isdefined(self.scrambleevents))
	{
		self.scrambleevents = [];
	}

	lib_A7AB::_playercleanupscrambleevents();
	var_04 = spawnstruct();
	var_04.endtime = param_00;
	var_04.textid = param_01;
	var_04.typeid = lib_A7AB::_getscrambletypeidforstring(param_02);
	var_04.scrambleid = lib_A7AB::_playergetuniquescrambleid();
	self.scrambleevents[self.scrambleevents.size] = var_04;
	if(!isdefined(self.scrambleeventcurrent) || lib_A7AB::isevent1highpriority(var_04,self.scrambleeventcurrent))
	{
		self setclientomnvar("ui_exo_reboot_end_time",var_04.endtime);
		self setclientomnvar("ui_exo_reboot_text",var_04.textid);
		self setclientomnvar("ui_exo_reboot_type",var_04.typeid);
		self.scrambleeventcurrent = var_04;
		thread lib_A7AB::_playermonitorscrambleevents(var_04);
	}

	return var_04.scrambleid;
}

//Function Number: 2
lib_A7AB::playersethudempscrambledoff(param_00)
{
	if(!isdefined(self.scrambleevents))
	{
		return;
	}

	var_01 = lib_A7AB::_playergetscrambleevent(param_00);
	lib_A7AB::_playercleanupscrambleevents();
	if(isdefined(var_01))
	{
		self.scrambleevents = common_scripts\utility::array_remove(self.scrambleevents,var_01);
		var_01 notify("done");
		if(var_01 == self.scrambleeventcurrent)
		{
			var_02 = lib_A7AB::_playergetnextevent();
			if(isdefined(var_02))
			{
				self setclientomnvar("ui_exo_reboot_end_time",var_02.endtime);
				self setclientomnvar("ui_exo_reboot_text",var_02.textid);
				self setclientomnvar("ui_exo_reboot_type",var_02.typeid);
				self.scrambleeventcurrent = var_02;
			}
		}
	}

	if(self.scrambleevents.size == 0)
	{
		self setclientomnvar("ui_exo_reboot_end_time",0);
		self setclientomnvar("ui_exo_reboot_type",0);
		self.scrambleevents = undefined;
		self.scrambleeventcurrent = undefined;
	}
}

//Function Number: 3
lib_A7AB::_playermonitorscrambleevents(param_00)
{
	self notify("_waitToStartNextScrambleEvent");
	self endon("_waitToStartNextScrambleEvent");
	level endon("game_ended");
	self endon("disconnect");
	while(isdefined(self.scrambleeventcurrent))
	{
		var_01 = self.scrambleeventcurrent.endtime - gettime() / 1000;
		var_02 = self.scrambleeventcurrent common_scripts\utility::waittill_notify_or_timeout_return("done",var_01);
		if(isdefined(var_02) && var_02 == "timeout")
		{
			lib_A7AB::playersethudempscrambledoff(self.scrambleeventcurrent.scrambleid);
		}
	}
}

//Function Number: 4
lib_A7AB::_getscrambletypeidforstring(param_00)
{
	switch(param_00)
	{
		case "emp":
			break;

		case "systemHack":
			break;

		default:
			break;
	}
}

//Function Number: 5
lib_A7AB::_playercleanupscrambleevents()
{
	if(self.scrambleevents.size == 0)
	{
		return;
	}

	var_00 = [];
	var_01 = gettime();
	foreach(var_03 in self.scrambleevents)
	{
		if(var_01 < var_03.endtime)
		{
			var_00[var_00.size] = var_03;
		}
	}

	self.scrambleevents = var_00;
}

//Function Number: 6
lib_A7AB::_playergetuniquescrambleid()
{
	var_00 = 0;
	foreach(var_02 in self.scrambleevents)
	{
		if(var_02.scrambleid >= var_00)
		{
			var_00 = var_02.scrambleid + 1;
		}
	}

	return var_00;
}

//Function Number: 7
lib_A7AB::_playergetscrambleevent(param_00)
{
	foreach(var_02 in self.scrambleevents)
	{
		if(var_02.scrambleid == param_00)
		{
			return var_02;
		}
	}
}

//Function Number: 8
lib_A7AB::_playergetnextevent()
{
	if(self.scrambleevents.size == 0)
	{
		return;
	}

	var_00 = self.scrambleevents[0];
	for(var_01 = 1;var_01 < self.scrambleevents.size;var_01++)
	{
		var_02 = self.scrambleevents[var_01];
		if(lib_A7AB::isevent1highpriority(var_02,var_00))
		{
			var_00 = var_02;
		}
	}

	return var_00;
}

//Function Number: 9
lib_A7AB::isevent1highpriority(param_00,param_01)
{
	return param_00.typeid > param_01.typeid || param_00.typeid == param_01.typeid && param_00.endtime > param_01.endtime;
}

//Function Number: 10
lib_A7AB::deletescrambler(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	foreach(var_02 in level.var_328)
	{
		if(isdefined(var_02))
		{
			var_02.inplayerscrambler = undefined;
		}
	}

	param_00 notify("death");
	param_00 delete();
	self.deployedscrambler = undefined;
	var_04 = [];
	var_04 = maps\mp\_utility::cleanarray(level.scramblers);
	level.scramblers = var_04;
}

//Function Number: 11
lib_A7AB::monitorscrambleruse()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "scrambler" || var_01 == "scrambler_mp")
		{
			if(!isalive(self))
			{
				var_00 delete();
				return;
			}

			var_00 hide();
			var_00 waittill("missile_stuck");
			var_02 = 40;
			if(var_02 * var_02 < distancesquared(var_00.var_2E6,self.var_2E6))
			{
				var_03 = bullettrace(self.var_2E6,self.var_2E6 - (0,0,var_02),0,self);
				if(var_03["fraction"] == 1)
				{
					var_00 delete();
					self setweaponammostock("scrambler_mp",self getweaponammostock("scrambler_mp") + 1);
					continue;
				}

				var_00.var_2E6 = var_03["position"];
			}

			var_00 show();
			if(isdefined(self.deployedscrambler))
			{
				lib_A7AB::deletescrambler(self.deployedscrambler);
			}

			var_04 = var_00.var_2E6;
			var_05 = spawn("script_model",var_04);
			var_05.health = 100;
			var_05.inliveplayerkillstreak = self.inliveplayerkillstreak;
			var_05.owner = self;
			var_05 setcandamage(1);
			var_05 makescrambler(self);
			var_05 common_scripts\utility::make_entity_sentient_mp(self.inliveplayerkillstreak,1);
			var_05 lib_A7AB::scramblersetup(self);
			var_05 thread maps\mp\gametypes\_weapons::createbombsquadmodel("weapon_jammer_bombsquad","tag_origin",self);
			level.scramblers[level.scramblers.size] = var_05;
			self.deployedscrambler = var_05;
			self.changingweapon = undefined;
			wait(0.05);
			if(isdefined(var_00))
			{
				var_00 delete();
			}
		}
	}
}

//Function Number: 12
lib_A7AB::scramblersetup(param_00)
{
	self setmodel("weapon_jammer");
	if(level.teambased)
	{
		maps\mp\_entityheadicons::setteamheadicon(self.inliveplayerkillstreak,(0,0,20));
	}
	else
	{
		maps\mp\_entityheadicons::setplayerheadicon(param_00,(0,0,20));
	}

	thread lib_A7AB::scramblerdamagelistener(param_00);
	thread lib_A7AB::scrambleruselistener(param_00);
	param_00 thread lib_A7AB::scramblerwatchowner(self);
	thread lib_A7AB::scramblerbeepsounds();
	thread maps\mp\_utility::notusableforjoiningplayers(param_00);
}

//Function Number: 13
lib_A7AB::scramblerwatchowner(param_00)
{
	param_00 endon("death");
	level endon("game_ended");
	common_scripts\utility::waittill_any("disconnect","joined_team","joined_spectators","death");
	level thread lib_A7AB::deletescrambler(param_00);
}

//Function Number: 14
lib_A7AB::scramblerbeepsounds()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		wait(3);
		self playsoundasmaster("scrambler_beep");
	}
}

//Function Number: 15
lib_A7AB::scramblerdamagelistener(param_00)
{
	self endon("death");
	self.health = 999999;
	self.var_275 = 100;
	self.damagetaken = 0;
	self waittill("damage",var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A);
	if(!maps\mp\gametypes\_weapons::friendlyfirecheck(self.owner,var_02))
	{
		continue;
	}

	if(isdefined(var_0A))
	{
		var_0B = maps\mp\_utility::strip_suffix(var_0A,"_lefthand");
		switch(var_0B)
		{
			case "smoke_grenade_var_mp":
			case "stun_grenade_var_mp":
			case "smoke_grenade_mp":
			case "stun_grenade_mp":
			case "concussion_grenade_mp":
			case "flash_grenade_mp":
				break;
		}
	}
}

//Function Number: 16
lib_A7AB::scrambleruselistener(param_00)
{
	self endon("death");
	level endon("game_ended");
	param_00 endon("disconnect");
	self setcursorhint("HINT_NOICON");
	self sethintstring(&"MP_PATCH_PICKUP_SCRAMBLER");
	maps\mp\_utility::setselfusable(param_00);
	for(;;)
	{
		self waittill("trigger",param_00);
		var_01 = param_00 getweaponammostock("scrambler_mp");
		if(var_01 < weaponmaxammo("scrambler_mp"))
		{
			param_00 method_82F4("scavenger_pack_pickup");
			param_00 setweaponammostock("scrambler_mp",var_01 + 1);
			param_00 thread lib_A7AB::deletescrambler(self);
		}
	}
}

//Function Number: 17
lib_A7AB::scramblerproximitytracker()
{
	self endon("disconnect");
	self endon("death");
	self endon("faux_spawn");
	level endon("game_ended");
	self.scramproxyactive = 0;
	var_00 = 512;
	for(;;)
	{
		wait(0.05);
		self.scramproxyactive = 0;
		foreach(var_02 in level.scramblers)
		{
			if(!isdefined(var_02))
			{
				continue;
			}

			if(!maps\mp\_utility::isreallyalive(self))
			{
				continue;
			}

			var_03 = distancesquared(var_02.var_2E6,self.var_2E6);
			if((level.teambased && var_02.inliveplayerkillstreak != self.inliveplayerkillstreak) || !level.teambased && isdefined(var_02.owner) && var_02.owner != self)
			{
				if(var_03 < var_00 * var_00)
				{
					self.inplayerscrambler = var_02.owner;
				}
				else
				{
					self.inplayerscrambler = undefined;
				}

				continue;
			}

			if(var_03 < var_00 * var_00)
			{
				self.scramproxyactive = 1;
				break;
			}
		}

		if(self.scramproxyactive)
		{
			if(!maps\mp\_utility::_hasperk("specialty_blindeye"))
			{
				maps\mp\_utility::giveperk("specialty_blindeye",0);
				self.scramproxyperk = 1;
			}

			continue;
		}

		if(isdefined(self.scramproxyperk) && self.scramproxyperk)
		{
			self.scramproxyperk = 0;
		}
	}
}