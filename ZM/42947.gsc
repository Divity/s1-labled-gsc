/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42947.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 79
 * Decompile Time: 71 ms
 * Timestamp: 4/20/2022 8:24:14 PM
*******************************************************************/

//Function Number: 1
lib_A7C3::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(!isdefined(var_00.connectedpostgame["killstreaks"]))
		{
			var_00.connectedpostgame["killstreaks"] = [];
		}

		if(!isdefined(var_00.connectedpostgame["kID"]))
		{
			var_00.connectedpostgame["kID"] = 10;
		}

		var_00.lifeid = 0;
		var_00.curdefvalue = 0;
		if(isdefined(var_00.connectedpostgame["deaths"]))
		{
			var_00.lifeid = var_00.connectedpostgame["deaths"];
		}

		var_00.spupdatetotal = 0;
		if(getdvarint("virtualLobbyActive",0))
		{
			return;
		}

		var_00 thread lib_A7C3::onplayerspawned();
	}
}

//Function Number: 2
lib_A7C3::onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		common_scripts\utility::waittill_any("spawned_player","faux_spawn");
		thread lib_A7C3::killstreakusewaiter();
		thread lib_A7C3::streaknotifytracker();
		thread lib_A7C3::waitforchangeteam();
		thread lib_A7C3::streakselectuptracker();
		thread lib_A7C3::streakselectdowntracker();
		if(!level.console)
		{
			thread lib_A7C3::pc_watchstreakuse();
		}

		if(!isdefined(self.connectedpostgame["killstreaks"][0]))
		{
			lib_A7C3::initplayerkillstreaks();
		}

		if(!isdefined(self.earnedstreaklevel))
		{
			self.earnedstreaklevel = 0;
		}

		if(!isdefined(self.adrenaline) || self.adrenaline == 0)
		{
			self.adrenaline = self.connectedpostgame["ks_totalPoints"];
			self.adrenalinesupport = self.connectedpostgame["ks_totalPointsSupport"];
			lib_A7C3::updatestreakcount();
			for(var_00 = 0;var_00 < level.killstreak_stacking_start_slot;var_00++)
			{
				var_01 = self.connectedpostgame["killstreaks"][var_00].streakname;
				var_02 = self.connectedpostgame["killstreaks"][var_00].available;
				if(isdefined(var_01))
				{
					if(var_00 == level.killstreak_gimme_slot && !isdefined(var_02) || !var_02)
					{
						continue;
					}

					var_03 = maps\mp\_utility::getkillstreakindex(self.connectedpostgame["killstreaks"][var_00].streakname);
					var_04 = "ks_icon" + common_scripts\utility::tostring(var_00);
					self setclientomnvar(var_04,var_03);
				}
			}

			updatestreakicons(0);
		}

		lib_A7C3::updatestreakslots();
		lib_A7C3::giveownedkillstreakitem();
		lib_A7C3::updatestreakcount();
	}
}

//Function Number: 3
updatestreakicons(param_00)
{
	for(var_01 = 0;var_01 < level.killstreak_stacking_start_slot;var_01++)
	{
		if(!param_00 && var_01 == level.killstreak_gimme_slot)
		{
			continue;
		}

		var_02 = "ks_icon" + common_scripts\utility::tostring(var_01);
		self setclientomnvar(var_02,0);
		var_03 = self getclientomnvar("ks_hasStreak");
		var_04 = var_03 & ~1 << var_01 & ~1 << var_01 + level.killstreak_stacking_start_slot;
		self setclientomnvar("ks_hasStreak",var_04);
	}

	var_05 = 1;
	if(isdefined(self.killstreaks))
	{
		foreach(var_07 in self.killstreaks)
		{
			var_08 = self.connectedpostgame["killstreaks"][var_05];
			var_08.streakname = var_07;
			var_09 = var_08.streakname;
			var_02 = "ks_icon" + common_scripts\utility::tostring(var_05);
			self setclientomnvar(var_02,maps\mp\_utility::getkillstreakindex(var_09));
			var_03 = self getclientomnvar("ks_hasStreak");
			var_04 = var_03 & ~1 << var_05;
			if(lib_A7C3::issupportstreak(self,var_07))
			{
				var_04 = var_04 | 1 << var_05 + level.killstreak_stacking_start_slot;
			}
			else
			{
				var_04 = var_04 & ~1 << var_05 + level.killstreak_stacking_start_slot;
			}

			self setclientomnvar("ks_hasStreak",var_04);
			var_05++;
		}
	}
}

//Function Number: 4
lib_A7C3::initplayerkillstreaks()
{
	var_00 = spawnstruct();
	var_00.available = 0;
	var_00.streakname = undefined;
	var_00.earned = 0;
	var_00.awardxp = undefined;
	var_00.owner = undefined;
	var_00.kid = undefined;
	var_00.lifeid = undefined;
	var_00.isgimme = 1;
	var_00.nextslot = undefined;
	self.connectedpostgame["killstreaks"][level.killstreak_gimme_slot] = var_00;
	for(var_01 = level.killstreak_slot_1;var_01 < level.killstreak_stacking_start_slot;var_01++)
	{
		var_02 = spawnstruct();
		var_02.available = 0;
		var_02.streakname = undefined;
		var_02.earned = 1;
		var_02.awardxp = 1;
		var_02.owner = undefined;
		var_02.kid = undefined;
		var_02.lifeid = -1;
		var_02.isgimme = 0;
		self.connectedpostgame["killstreaks"][var_01] = var_02;
	}

	updatestreakicons(1);
	self setclientomnvar("ks_selectedIndex",-1);
	var_03 = self getclientomnvar("ks_hasStreak");
	var_04 = var_03 & ~1 << level.killstreak_stacking_start_slot;
	self setclientomnvar("ks_hasStreak",var_04);
}

//Function Number: 5
lib_A7C3::issupportstreak(param_00,param_01)
{
	var_02 = getarraykeys(self.killstreakmodules);
	foreach(var_04 in var_02)
	{
		var_05 = lib_A7C3::getstreakmodulebasekillstreak(var_04);
		if(var_05 == param_01)
		{
			var_06 = tablelookup(level.ks_modules_table,level.ks_module_ref_column,var_04,level.ks_module_support_column);
			if(isdefined(var_06) && var_06 != "" && var_06 != "0")
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 6
lib_A7C3::updatestreakcount()
{
	if(!isdefined(self.connectedpostgame["killstreaks"]))
	{
		for(var_00 = level.killstreak_slot_1;var_00 < level.killstreak_stacking_start_slot;var_00++)
		{
			self setclientomnvar("ks_count" + common_scripts\utility::tostring(var_00),0);
		}

		self setclientomnvar("ks_count_updated",1);
		return;
	}

	for(var_00 = level.killstreak_slot_1;var_00 < level.killstreak_stacking_start_slot;var_00++)
	{
		var_01 = self.connectedpostgame["killstreaks"][var_00].streakname;
		var_02 = "ks_count" + common_scripts\utility::tostring(var_00);
		var_03 = "ks_points" + common_scripts\utility::tostring(var_00);
		if(!isdefined(var_01))
		{
			self setclientomnvar(var_02,0);
			continue;
		}

		var_04 = lib_A7C3::getstreakcost(self.connectedpostgame["killstreaks"][var_00].streakname);
		if(lib_A7C3::issupportstreak(self,var_01))
		{
			var_05 = self.adrenalinesupport / var_04;
			var_06 = var_04 - self.adrenalinesupport;
		}
		else
		{
			var_05 = self.adrenaline / var_04;
			var_06 = var_04 - self.adrenaline;
		}

		if(var_05 >= 1)
		{
			var_05 = 0;
			var_06 = var_04;
		}

		self setclientomnvar(var_03,var_06);
		self setclientomnvar(var_02,var_05);
	}

	self setclientomnvar("ks_count_updated",1);
}

//Function Number: 7
lib_A7C3::getmaxstreakcost(param_00)
{
	if(!isdefined(self.killstreaks))
	{
		return 0;
	}

	var_01 = 0;
	foreach(var_03 in self.killstreaks)
	{
		var_04 = lib_A7C3::issupportstreak(self,var_03);
		if((param_00 && !var_04) || !param_00 && var_04)
		{
			continue;
		}

		var_05 = lib_A7C3::getstreakcost(var_03);
		if(var_05 > var_01)
		{
			var_01 = var_05;
		}
	}

	return var_01;
}

//Function Number: 8
lib_A7C3::updatestreakslots()
{
	if(!maps\mp\_utility::isreallyalive(self))
	{
		return;
	}

	var_00 = self.connectedpostgame["killstreaks"];
	var_01 = 0;
	for(var_02 = 0;var_02 < level.killstreak_stacking_start_slot;var_02++)
	{
		if(isdefined(var_00[var_02]) && isdefined(var_00[var_02].streakname))
		{
			var_03 = self getclientomnvar("ks_hasStreak");
			if(var_00[var_02].available == 1)
			{
				var_04 = var_03 | 1 << var_02;
			}
			else
			{
				var_04 = var_04 & ~1 << var_03;
			}

			self setclientomnvar("ks_hasStreak",var_04);
			if(var_00[var_02].available == 1)
			{
				var_01++;
			}
		}
	}

	if(isdefined(self.killstreakindexweapon))
	{
		self setclientomnvar("ks_selectedIndex",self.killstreakindexweapon);
		return;
	}

	self setclientomnvar("ks_selectedIndex",-1);
}

//Function Number: 9
lib_A7C3::waitforchangeteam()
{
	self endon("disconnect");
	self endon("faux_spawn");
	self notify("waitForChangeTeam");
	self endon("waitForChangeTeam");
	for(;;)
	{
		self waittill("joined_team");
		lib_A7C3::clearkillstreaks(1);
	}
}

//Function Number: 10
lib_A7C3::killstreakusepressed()
{
	var_00 = self.connectedpostgame["killstreaks"];
	var_01 = var_00[self.killstreakindexweapon].streakname;
	var_02 = var_00[self.killstreakindexweapon].lifeid;
	var_03 = var_00[self.killstreakindexweapon].earned;
	var_04 = var_00[self.killstreakindexweapon].awardxp;
	var_05 = var_00[self.killstreakindexweapon].kid;
	var_06 = var_00[self.killstreakindexweapon].isgimme;
	var_07 = var_00[self.killstreakindexweapon].var_5D57;
	var_08 = undefined;
	var_09 = undefined;
	var_0A = undefined;
	if(self.killstreakindexweapon == level.killstreak_gimme_slot)
	{
		var_09 = var_00[level.killstreak_gimme_slot].nextslot;
	}

	if(!maps\mp\_utility::validateusestreak(var_01))
	{
		return 0;
	}

	var_0B = 0;
	if(maps\mp\_utility::_hasperk("specialty_explosivebullets") && !issubstr(var_01,"explosive_ammo"))
	{
		var_0B = 1;
	}

	if(issubstr(var_01,"airdrop"))
	{
		if(!self [[ level.killstreakfuncs[var_01] ]](var_02,var_05,var_07))
		{
			return 0;
		}
	}
	else if(!self [[ level.killstreakfuncs[var_01] ]](var_02,var_07))
	{
		return 0;
	}

	if(var_0B)
	{
		maps\mp\_utility::_unsetperk("specialty_explosivebullets");
	}

	if(isdefined(var_09) && var_01 != var_00[self.killstreakindexweapon].streakname)
	{
		var_0A = 1;
		var_08 = var_09;
	}

	thread lib_A7C3::updatekillstreaks(var_0A,var_08);
	lib_A7C3::usedkillstreak(var_01,var_07,var_04);
	return 1;
}

//Function Number: 11
lib_A7C3::usedkillstreak(param_00,param_01,param_02)
{
	maps\mp\_utility::incplayerstat("killStreaksUsed",1);
	if(param_02)
	{
		thread maps\mp\gametypes\_missions::usehardpoint(param_00);
	}

	var_03 = self.inliveplayerkillstreak;
	var_04 = var_03 + "_friendly_" + param_00 + "_inbound";
	var_05 = var_03 + "_enemy_" + param_00 + "_inbound";
	if(param_00 == "emp")
	{
		var_06 = maps\mp\killstreaks\_emp::getmodulelineemp(param_01);
		var_04 = var_04 + var_06;
		var_05 = var_05 + var_06;
	}

	if(level.teambased)
	{
		thread maps\mp\_utility::leaderdialog(var_04,var_03);
		if(lib_A7C3::getkillstreakinformenemy(param_00))
		{
			thread maps\mp\_utility::leaderdialog(var_05,level.matchbonus[var_03]);
		}
	}
	else
	{
		thread maps\mp\_utility::leaderdialogonplayer(var_04);
		if(lib_A7C3::getkillstreakinformenemy(param_00))
		{
			var_07[0] = self;
			thread maps\mp\_utility::leaderdialog(var_05,undefined,undefined,var_07);
		}
	}

	if(isdefined(level.mapkillstreak))
	{
		if(param_00 == level.mapkillstreak)
		{
			var_08 = getmatchdata("players",self.clientid,"numberOfMapstreaksUsed");
			var_08++;
			setmatchdata("players",self.clientid,"numberOfMapstreaksUsed",maps\mp\_utility::clamptobyte(var_08));
		}
	}
}

//Function Number: 12
lib_A7C3::updatekillstreaks(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		self.connectedpostgame["killstreaks"][self.killstreakindexweapon].available = 0;
		if(self.killstreakindexweapon == level.killstreak_gimme_slot)
		{
			self.connectedpostgame["killstreaks"][self.connectedpostgame["killstreaks"][level.killstreak_gimme_slot].nextslot] = undefined;
			var_02 = undefined;
			var_03 = undefined;
			var_04 = self.connectedpostgame["killstreaks"];
			for(var_05 = level.killstreak_stacking_start_slot;var_05 < var_04.size;var_05++)
			{
				if(!isdefined(var_04[var_05]) || !isdefined(var_04[var_05].streakname))
				{
					continue;
				}

				var_02 = var_04[var_05].streakname;
				if(isdefined(var_04[var_05].var_5D57))
				{
					var_03 = var_04[var_05].var_5D57;
				}

				var_04[level.killstreak_gimme_slot].nextslot = var_05;
			}

			if(isdefined(var_02))
			{
				var_04[level.killstreak_gimme_slot].available = 1;
				var_04[level.killstreak_gimme_slot].streakname = var_02;
				if(isdefined(var_03))
				{
					var_04[level.killstreak_gimme_slot].var_5D57 = var_03;
				}

				var_06 = maps\mp\_utility::getkillstreakindex(var_02);
				var_07 = "ks_icon" + common_scripts\utility::tostring(level.killstreak_gimme_slot);
				self setclientomnvar(var_07,var_06);
				if(!level.console && !common_scripts\utility::is_player_gamepad_enabled())
				{
					var_08 = maps\mp\_utility::getkillstreakweapon(var_02,var_03);
					maps\mp\_utility::_setactionslot(4,"weapon",var_08);
				}
			}
			else
			{
				var_07 = "ks_icon" + common_scripts\utility::tostring(level.killstreak_gimme_slot);
				self setclientomnvar(var_07,0);
			}
		}
	}

	if(isdefined(param_01))
	{
		self.connectedpostgame["killstreaks"][param_01] = undefined;
	}

	var_09 = undefined;
	for(var_05 = 0;var_05 < level.killstreak_stacking_start_slot;var_05++)
	{
		var_0A = self.connectedpostgame["killstreaks"][var_05];
		if(isdefined(var_0A) && isdefined(var_0A.streakname) && var_0A.available)
		{
			var_09 = var_05;
		}
	}

	if(isdefined(var_09))
	{
		if(level.console || common_scripts\utility::is_player_gamepad_enabled())
		{
			self.killstreakindexweapon = var_09;
			self.connectedpostgame["lastEarnedStreak"] = self.connectedpostgame["killstreaks"][var_09].streakname;
			lib_A7C3::giveselectedkillstreakitem();
		}
		else
		{
			for(var_05 = 0;var_05 < level.killstreak_stacking_start_slot;var_05++)
			{
				var_0A = self.connectedpostgame["killstreaks"][var_05];
				if(isdefined(var_0A) && isdefined(var_0A.streakname) && var_0A.available)
				{
					var_08 = maps\mp\_utility::getkillstreakweapon(var_0A.streakname,var_0A.var_5D57);
					var_0B = self getweaponslistitems();
					var_0C = 0;
					for(var_0D = 0;var_0D < var_0B.size;var_0D++)
					{
						if(var_08 == var_0B[var_0D])
						{
							var_0C = 1;
							break;
						}
					}

					if(!var_0C)
					{
						maps\mp\_utility::_giveweapon(var_08);
					}
					else if(issubstr(var_08,"airdrop_"))
					{
						self setweaponammoclip(var_08,1);
					}

					maps\mp\_utility::_setactionslot(var_05 + 4,"weapon",var_08);
				}
			}

			self.killstreakindexweapon = undefined;
			self.connectedpostgame["lastEarnedStreak"] = self.connectedpostgame["killstreaks"][var_09].streakname;
			lib_A7C3::updatestreakslots();
		}
	}
	else
	{
		self.killstreakindexweapon = undefined;
		self.connectedpostgame["lastEarnedStreak"] = undefined;
		lib_A7C3::updatestreakslots();
	}

	self setclientomnvar("ks_used",1);
}

//Function Number: 13
lib_A7C3::clearkillstreaks(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	var_01 = self.connectedpostgame["killstreaks"];
	if(!isdefined(var_01))
	{
		return;
	}

	for(var_02 = var_01.size - 1;var_02 > -1;var_02--)
	{
		self.connectedpostgame["killstreaks"][var_02] = undefined;
	}

	lib_A7C3::initplayerkillstreaks();
	lib_A7C3::resetadrenaline(param_00);
	self.killstreakindexweapon = undefined;
	lib_A7C3::updatestreakslots();
}

//Function Number: 14
lib_A7C3::getfirstprimaryweapon()
{
	var_00 = self getweaponslistprimaries();
	return var_00[0];
}

//Function Number: 15
lib_A7C3::istryingtousekillstreakslot()
{
	return isdefined(self.tryingtouseks) && self.tryingtouseks && isdefined(self.killstreakindexweapon);
}

//Function Number: 16
lib_A7C3::waitforkillstreakweaponswitchstarted()
{
	self endon("weapon_switch_invalid");
	self waittill("weapon_switch_started",var_00);
	self notify("killstreak_weapon_change","switch_started",var_00);
}

//Function Number: 17
lib_A7C3::waitforkillstreakweaponswitchinvalid()
{
	self endon("weapon_switch_started");
	self waittill("weapon_switch_invalid",var_00);
	self notify("killstreak_weapon_change","switch_invalid",var_00);
}

//Function Number: 18
lib_A7C3::waitforkillstreakweaponchange()
{
	childthread lib_A7C3::waitforkillstreakweaponswitchstarted();
	childthread lib_A7C3::waitforkillstreakweaponswitchinvalid();
	self waittill("killstreak_weapon_change",var_00,var_01);
	if(var_00 == "switch_started")
	{
		return var_01;
	}

	var_02 = maps\mp\_utility::getkillstreakweapon(self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname,self.connectedpostgame["killstreaks"][self.killstreakindexweapon].var_5D57);
	self switchtoweapon(var_02);
	self waittill("weapon_switch_started",var_03);
	if(var_03 != var_02)
	{
		return undefined;
	}

	return var_02;
}

//Function Number: 19
lib_A7C3::updateaerialkillstreakmarker()
{
	foreach(var_01 in level.var_328)
	{
		var_01 notify("updateKillStreakMarker");
	}
}

//Function Number: 20
lib_A7C3::aerialkillstreakmarker()
{
	self endon("disconnect");
	self endon("finish_death");
	self endon("joined_team");
	self endon("faux_spawn");
	level endon("game_ended");
	var_00 = maps\mp\gametypes\_gameobjects::getenemyteam(self.inliveplayerkillstreak);
	for(;;)
	{
		common_scripts\utility::waittill_any("weapon_change","updateKillStreakMarker");
		var_01 = self getcurrentweapon();
		var_02 = weaponclass(var_01);
		if(var_02 != "rocketlauncher")
		{
			continue;
		}

		var_03 = [];
		var_03 = lib_A7C3::getaerialkillstreakarray(var_00);
		if(var_03.size == 0)
		{
			continue;
		}

		foreach(var_05 in var_03)
		{
			lib_A7C3::createthreaticon(var_05,self);
		}
	}
}

//Function Number: 21
lib_A7C3::getaerialkillstreakarray(param_00)
{
	var_01 = [];
	var_02 = [];
	if(maps\mp\_utility::invirtuallobby())
	{
		return var_01;
	}

	if(level.teambased)
	{
		var_02 = level.uavmodels[param_00];
	}
	else
	{
		var_02 = level.uavmodels;
	}

	foreach(var_04 in var_02)
	{
		if(isdefined(var_04.isleaving) && var_04.isleaving)
		{
			continue;
		}

		if(isdefined(var_04.orbit) && var_04.orbit)
		{
			continue;
		}

		var_01[var_01.size] = var_04;
	}

	foreach(var_07 in level.planes)
	{
		if(!level.teambased || var_07.inliveplayerkillstreak == param_00)
		{
			var_01[var_01.size] = var_07;
		}
	}

	if(level.orbitalsupportinuse && isdefined(level.orbitalsupport_planemodel) && isdefined(level.orbitalsupport_planemodel.owner) && isdefined(level.orbitalsupport_planemodel.showthreatmarker) && level.orbitalsupport_planemodel.showthreatmarker)
	{
		if(level.teambased && level.orbitalsupport_planemodel.owner.inliveplayerkillstreak == param_00)
		{
			var_01[var_01.size] = level.orbitalsupport_planemodel;
		}

		if(!level.teambased)
		{
			var_01[var_01.size] = level.orbitalsupport_planemodel;
		}
	}

	if(isdefined(level.getaerialkillstreakarray))
	{
		var_09 = [[ level.getaerialkillstreakarray ]](param_00);
		foreach(var_0B in var_09)
		{
			var_01[var_01.size] = var_0B;
		}
	}

	return var_01;
}

//Function Number: 22
lib_A7C3::createthreaticon(param_00,param_01)
{
	if(!isdefined(param_00.waypoint))
	{
		param_00.waypoint = [];
	}

	var_02 = param_01.assistedsuicide;
	if(isdefined(param_00.waypoint[var_02]))
	{
		return;
	}

	param_00.waypoint[var_02] = newhudelem();
	param_00.waypoint[var_02] setshader("waypoint_threat_hostile",1,1);
	param_00.waypoint[var_02].alpha = 0.75;
	param_00.waypoint[var_02].color = (1,1,1);
	param_00.waypoint[var_02].x = param_00.var_2E6[0];
	param_00.waypoint[var_02].y = param_00.var_2E6[1];
	param_00.waypoint[var_02].z = param_00.var_2E6[2];
	param_00.waypoint[var_02] setwaypoint(1,1,1);
	param_00.waypoint[var_02] method_80CD(param_00);
	param_00.waypoint[var_02].showinkillcam = 0;
	param_00.waypoint[var_02].archived = 0;
	level thread lib_A7C3::removethreaticon(self,param_00,param_00.waypoint[var_02]);
}

//Function Number: 23
lib_A7C3::removethreaticon(param_00,param_01,param_02)
{
	level endon("game_ended");
	param_00 common_scripts\utility::waittill_any_ents(param_00,"death",param_01,"death",param_00,"weapon_change",param_00,"disconnect",param_01,"leaving");
	param_02 destroy();
}

//Function Number: 24
lib_A7C3::killstreakusewaiter()
{
	self endon("disconnect");
	self endon("finish_death");
	self endon("joined_team");
	self endon("faux_spawn");
	level endon("game_ended");
	self notify("killstreakUseWaiter");
	self endon("killstreakUseWaiter");
	self.lastkillstreak = 0;
	if(!isdefined(self.connectedpostgame["lastEarnedStreak"]))
	{
		self.connectedpostgame["lastEarnedStreak"] = undefined;
	}

	thread lib_A7C3::finishdeathwaiter();
	if(!isdefined(self.justswitchedtokillstreakweapon))
	{
		self waittill("weapon_change",var_00);
	}
	else
	{
		var_00 = self.justswitchedtokillstreakweapon;
		self.justswitchedtokillstreakweapon = undefined;
	}

	var_01 = maps\mp\_utility::iskillstreakweapon(var_00);
	if(!isalive(self))
	{
		continue;
	}

	if(var_01)
	{
	}

	if(isdefined(self.ball_carried))
	{
		continue;
	}

	if(var_01)
	{
	}

	if(!isdefined(self.killstreakindexweapon))
	{
		if(!level.console)
		{
			if(isdefined(self.var_5595) && var_00 == "killstreak_predator_missile_mp")
			{
				self switchtoweapon(self.var_5595);
			}
		}

		continue;
	}

	if(var_01)
	{
	}

	if(isdefined(self.manuallyjoiningkillstreak) && self.manuallyjoiningkillstreak)
	{
		continue;
	}

	if(var_01)
	{
	}

	if(isdefined(self.iscarrying) && self.iscarrying)
	{
		continue;
	}

	if(var_01)
	{
	}

	if(!isdefined(self.connectedpostgame["killstreaks"][self.killstreakindexweapon]) || !isdefined(self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname))
	{
		continue;
	}

	if(var_01)
	{
	}

	var_02 = maps\mp\_utility::getkillstreakweapon(self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname,self.connectedpostgame["killstreaks"][self.killstreakindexweapon].var_5D57);
	if(var_00 != var_02)
	{
		if(issubstr(var_00,"turrethead"))
		{
			self switchtoweapon(self.var_5595);
		}

		if(maps\mp\_utility::isstrstart(var_00,"airdrop_"))
		{
			self takeweapon(var_00);
			self switchtoweapon(self.var_5595);
		}

		continue;
	}

	if(var_01)
	{
	}

	waittillframeend;
	var_03 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname;
	var_04 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].isgimme;
	var_05 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].var_5D57;
	var_06 = lib_A7C3::playergetkillstreaklastweapon();
	var_07 = self.killstreakindexweapon;
	if(lib_A7C3::shouldswitchweaponafterraiseanimation(var_02))
	{
		childthread lib_A7C3::switchweaponafterraiseanimation(var_02,var_06);
	}

	var_08 = gettime();
	var_09 = lib_A7C3::killstreakusepressed();
	var_0A = gettime();
	var_0B = var_0A - var_08 / 1000;
	if(!var_09 && !isalive(self) && !self hasweapon(common_scripts\utility::getlastweapon()))
	{
		var_06 = lib_A7C3::playergetkillstreaklastweapon(var_09);
		maps\mp\_utility::_giveweapon(var_06);
	}

	if(var_09)
	{
		thread lib_A7C3::waittakekillstreakweapon(var_02);
	}

	if(lib_A7C3::shouldswitchweaponpostkillstreak(var_09,var_02,var_03,var_05) && !isdefined(self.justswitchedtokillstreakweapon))
	{
		switch(var_02)
		{
			case "killstreak_predator_missile_mp":
				break;
		}
	}
}

//Function Number: 25
lib_A7C3::switchweaponafterraiseanimation(param_00,param_01)
{
	switch(param_00)
	{
		case "killstreak_uav_mp":
			break;

		default:
			break;
	}
}

//Function Number: 26
lib_A7C3::playergetkillstreaklastweapon(param_00)
{
	if((!isdefined(param_00) || isdefined(param_00) && !param_00) && !isalive(self) && !self hasweapon(common_scripts\utility::getlastweapon()))
	{
		return common_scripts\utility::getlastweapon();
	}

	if(!self hasweapon(common_scripts\utility::getlastweapon()))
	{
		return lib_A7C3::getfirstprimaryweapon();
	}

	return common_scripts\utility::getlastweapon();
}

//Function Number: 27
lib_A7C3::waittakekillstreakweapon(param_00)
{
	self endon("disconnect");
	self endon("finish_death");
	self endon("joined_team");
	level endon("game_ended");
	self endon("faux_spawn");
	self notify("waitTakeKillstreakWeapon");
	self endon("waitTakeKillstreakWeapon");
	var_01 = self getcurrentweapon() == "none";
	self waittill("weapon_change",var_02);
	var_03 = self getweaponslistprimaries();
	if(common_scripts\utility::array_contains(var_03,var_02))
	{
		lib_A7C3::takekillstreakweaponifnodupe(param_00);
		if(!level.console && !common_scripts\utility::is_player_gamepad_enabled())
		{
			self.killstreakindexweapon = undefined;
			return;
		}

		return;
	}

	if(var_02 != param_00)
	{
		thread lib_A7C3::waittakekillstreakweapon(param_00);
		return;
	}

	if(var_01 && self getcurrentweapon() == param_00)
	{
		thread lib_A7C3::waittakekillstreakweapon(param_00);
		return;
	}
}

//Function Number: 28
lib_A7C3::takekillstreakweaponifnodupe(param_00)
{
	var_01 = 0;
	var_02 = self.connectedpostgame["killstreaks"];
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(isdefined(var_02[var_03]) && isdefined(var_02[var_03].streakname) && var_02[var_03].available)
		{
			if(param_00 == maps\mp\_utility::getkillstreakweapon(var_02[var_03].streakname,var_02[var_03].var_5D57))
			{
				var_01 = 1;
				break;
			}
		}
	}

	if(var_01)
	{
		if(level.console || common_scripts\utility::is_player_gamepad_enabled())
		{
			if(isdefined(self.killstreakindexweapon) && param_00 != maps\mp\_utility::getkillstreakweapon(var_02[self.killstreakindexweapon].streakname,var_02[self.killstreakindexweapon].var_5D57))
			{
				self takeweapon(param_00);
				return;
			}

			if(isdefined(self.killstreakindexweapon) && param_00 == maps\mp\_utility::getkillstreakweapon(var_02[self.killstreakindexweapon].streakname,var_02[self.killstreakindexweapon].var_5D57))
			{
				self takeweapon(param_00);
				maps\mp\_utility::_giveweapon(param_00,0);
				maps\mp\_utility::_setactionslot(4,"weapon",param_00);
				return;
			}

			return;
		}

		self takeweapon(param_00);
		maps\mp\_utility::_giveweapon(param_00,0);
		return;
	}

	self takeweapon(param_00);
}

//Function Number: 29
lib_A7C3::shouldswitchweaponpostkillstreak(param_00,param_01,param_02,param_03)
{
	if(lib_A7C3::shouldswitchweaponafterraiseanimation(param_01))
	{
		return 0;
	}

	if(!param_00)
	{
		return 1;
	}

	switch(param_02)
	{
		case "warbird":
			break;

		case "zm_ugv":
		case "assault_ugv":
			break;
	}
}

//Function Number: 30
lib_A7C3::shouldswitchweaponafterraiseanimation(param_00)
{
	switch(param_00)
	{
		case "killstreak_uav_mp":
			break;

		default:
			break;
	}
}

//Function Number: 31
lib_A7C3::finishdeathwaiter()
{
	self endon("disconnect");
	level endon("game_ended");
	self endon("faux_spawn");
	self notify("finishDeathWaiter");
	self endon("finishDeathWaiter");
	self waittill("death");
	wait(0.05);
	self notify("finish_death");
	self.connectedpostgame["lastEarnedStreak"] = undefined;
}

//Function Number: 32
lib_A7C3::checkstreakreward()
{
	foreach(var_01 in self.killstreaks)
	{
		var_02 = lib_A7C3::getstreakcost(var_01);
		var_03 = self.adrenaline;
		var_04 = self.previousadrenaline;
		if(lib_A7C3::issupportstreak(self,var_01))
		{
			var_03 = self.adrenalinesupport;
			var_04 = self.previousadrenalinesupport;
		}

		if(var_02 > var_03 && var_03 > var_04)
		{
			continue;
		}

		if(var_04 < var_02 && var_03 >= var_02 || var_03 <= var_04)
		{
			lib_A7C3::earnkillstreak(var_01,var_02);
		}
	}
}

//Function Number: 33
lib_A7C3::killstreakearned(param_00)
{
	if(isdefined(self.class_num))
	{
		var_01 = self.class_num;
		if(var_01 == -1)
		{
			var_02 = self.connectedpostgame["copyCatLoadout"]["className"];
			var_01 = maps\mp\_utility::getclassindex(var_02);
			if(issubstr(var_02,"practice"))
			{
				var_01 = self.connectedpostgame["copyCatLoadout"]["practiceClassNum"];
			}
		}

		if(issubstr(self.class,"custom"))
		{
			if(self getcacplayerdata(var_01,"assaultStreaks",0,"streak") == param_00)
			{
				self.firstkillstreakearned = gettime();
				return;
			}

			if(self getcacplayerdata(var_01,"assaultStreaks",2,"streak") == param_00 && isdefined(self.firstkillstreakearned))
			{
				if(gettime() - self.firstkillstreakearned < 20000)
				{
					thread maps\mp\gametypes\_missions::genericchallenge("wargasm");
					return;
				}

				return;
			}

			return;
		}
	}
}

//Function Number: 34
lib_A7C3::earnkillstreak(param_00,param_01)
{
	self.earnedstreaklevel = param_01;
	var_02 = lib_A7C3::getkillstreakmodules(self,param_00);
	var_03 = getnextkillstreakslotindex(param_00,1);
	thread maps\mp\_events::earnedkillstreakevent(param_00,param_01,var_02,var_03);
	thread lib_A7C3::killstreakearned(param_00);
	self.connectedpostgame["lastEarnedStreak"] = param_00;
	lib_A7C3::givekillstreak(param_00,1,1,self,var_02);
	if(maps\mp\_utility::_hasperk("specialty_class_hardline"))
	{
		maps\mp\gametypes\_missions::processchallenge("ch_perk_hardline");
	}
}

//Function Number: 35
lib_A7C3::getkillstreakmodules(param_00,param_01)
{
	var_02 = [];
	var_03 = getarraykeys(self.killstreakmodules);
	foreach(var_05 in var_03)
	{
		var_06 = lib_A7C3::getstreakmodulebasekillstreak(var_05);
		if(var_06 == param_01)
		{
			var_02[var_02.size] = var_05;
		}
	}

	return var_02;
}

//Function Number: 36
getnexthordekillstreakslotindex(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = level.killstreak_gimme_slot;
	}

	return param_00;
}

//Function Number: 37
lib_A7C3::givehordekillstreak(param_00,param_01,param_02,param_03,param_04)
{
	self endon("givingLoadout");
	if(!isdefined(level.killstreakfuncs[param_00]) || tablelookup(level.killstreak_string_table,1,param_00,0) == "")
	{
		return;
	}

	if(!isdefined(self.connectedpostgame["killstreaks"]))
	{
		return;
	}

	self endon("disconnect");
	var_05 = undefined;
	var_06 = self.connectedpostgame["killstreaks"].size;
	if(isdefined(param_03))
	{
		var_06 = param_03;
	}

	if(!isdefined(self.connectedpostgame["killstreaks"][var_06]))
	{
		self.connectedpostgame["killstreaks"][var_06] = spawnstruct();
	}

	var_07 = self.connectedpostgame["killstreaks"][var_06];
	var_07.available = 0;
	var_07.streakname = param_00;
	var_07.earned = 0;
	var_07.awardxp = 0;
	var_07.owner = param_01;
	var_07.kid = self.connectedpostgame["kID"];
	var_07.lifeid = -1;
	var_07.isgimme = 1;
	var_05 = getnexthordekillstreakslotindex(param_03);
	if(!isdefined(param_02) || !isarray(param_02))
	{
		param_02 = lib_A7C3::getkillstreakmodules(self,param_00);
	}

	var_07.var_5D57 = param_02;
	self.connectedpostgame["killstreaks"][var_05].nextslot = var_06;
	self.connectedpostgame["killstreaks"][var_05].streakname = param_00;
	var_08 = maps\mp\_utility::getkillstreakindex(param_00);
	var_09 = "ks_icon" + common_scripts\utility::tostring(var_05);
	self setclientomnvar(var_09,var_08);
	if(!param_04)
	{
		lib_A7C3::updatestreakslots();
		if(isdefined(level.killstreaksetupfuncs[param_00]))
		{
			self [[ level.killstreaksetupfuncs[param_00] ]]();
		}

		self setclientomnvar("ks_acquired",1);
		return;
	}

	var_0A = self.connectedpostgame["killstreaks"][var_05];
	var_0A.available = 1;
	var_0A.earned = 0;
	var_0A.awardxp = 0;
	var_0A.owner = param_01;
	var_0A.kid = self.connectedpostgame["kID"];
	if(isdefined(param_02) && isarray(param_02))
	{
		var_0A.var_5D57 = param_02;
	}
	else
	{
		var_0A.var_5D57 = lib_A7C3::getkillstreakmodules(self,param_00);
	}

	self.connectedpostgame["kID"]++;
	var_0A.lifeid = -1;
	if(level.console || common_scripts\utility::is_player_gamepad_enabled())
	{
		var_0B = maps\mp\_utility::getkillstreakweapon(param_00,param_02);
		lib_A7C3::givekillstreakweapon(var_0B);
		if(isdefined(self.killstreakindexweapon))
		{
			param_00 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname;
			var_0C = maps\mp\_utility::getkillstreakweapon(param_00,param_02);
			var_0D = self getcurrentweapon();
			if(var_0D != var_0C && !issubstr(var_0D,"turrethead"))
			{
				self.killstreakindexweapon = var_05;
			}
		}
		else
		{
			self.killstreakindexweapon = var_05;
		}
	}
	else
	{
		if(level.killstreak_gimme_slot == var_05 && self.connectedpostgame["killstreaks"][level.killstreak_gimme_slot].nextslot > level.killstreak_stacking_start_slot)
		{
			var_0E = self.connectedpostgame["killstreaks"][level.killstreak_gimme_slot].nextslot - 1;
			var_0F = maps\mp\_utility::getkillstreakweapon(self.connectedpostgame["killstreaks"][var_0E].streakname,self.connectedpostgame["killstreaks"][var_0E].var_5D57);
			self takeweapon(var_0F);
		}

		var_0C = maps\mp\_utility::getkillstreakweapon(param_00,param_02);
		maps\mp\_utility::_giveweapon(var_0C,0);
		maps\mp\_utility::_setactionslot(var_05 + 4,"weapon",var_0C);
	}

	lib_A7C3::updatestreakslots();
	if(isdefined(level.killstreaksetupfuncs[param_00]))
	{
		self [[ level.killstreaksetupfuncs[param_00] ]]();
	}

	self setclientomnvar("ks_acquired",1);
}

//Function Number: 38
getnextkillstreakslotindex(param_00,param_01,param_02)
{
	var_03 = undefined;
	if(!isdefined(param_01) || param_01 == 0)
	{
		if(!isdefined(param_02))
		{
			var_03 = level.killstreak_gimme_slot;
		}
		else
		{
			var_03 = param_02;
		}
	}
	else
	{
		for(var_04 = level.killstreak_slot_1;var_04 < level.killstreak_stacking_start_slot;var_04++)
		{
			var_05 = self.connectedpostgame["killstreaks"][var_04];
			if(isdefined(var_05) && isdefined(var_05.streakname) && param_00 == var_05.streakname)
			{
				var_03 = var_04;
				break;
			}
		}
	}

	return var_03;
}

//Function Number: 39
lib_A7C3::givekillstreak(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("givingLoadout");
	if(!isdefined(level.killstreakfuncs[param_00]) || tablelookup(level.killstreak_string_table,1,param_00,0) == "")
	{
		return;
	}

	if(!isdefined(self.connectedpostgame["killstreaks"]))
	{
		return;
	}

	self endon("disconnect");
	var_06 = undefined;
	if(!isdefined(param_01) || param_01 == 0)
	{
		var_07 = self.connectedpostgame["killstreaks"].size;
		if(isdefined(param_05))
		{
			var_07 = param_05;
		}

		if(!isdefined(self.connectedpostgame["killstreaks"][var_07]))
		{
			self.connectedpostgame["killstreaks"][var_07] = spawnstruct();
		}

		var_08 = self.connectedpostgame["killstreaks"][var_07];
		var_08.available = 0;
		var_08.streakname = param_00;
		var_08.earned = 0;
		var_08.awardxp = isdefined(param_02) && param_02;
		var_08.owner = param_03;
		var_08.kid = self.connectedpostgame["kID"];
		var_08.lifeid = -1;
		var_08.isgimme = 1;
		var_06 = getnextkillstreakslotindex(param_00,param_01,param_05);
		if(!isdefined(param_04) || !isarray(param_04))
		{
			param_04 = lib_A7C3::getkillstreakmodules(self,param_00);
		}

		var_08.var_5D57 = param_04;
		self.connectedpostgame["killstreaks"][var_06].nextslot = var_07;
		self.connectedpostgame["killstreaks"][var_06].streakname = param_00;
		var_09 = maps\mp\_utility::getkillstreakindex(param_00);
		var_0A = "ks_icon" + common_scripts\utility::tostring(var_06);
		self setclientomnvar(var_0A,var_09);
	}
	else
	{
		var_06 = getnextkillstreakslotindex(param_00,param_01,param_05);
		if(!isdefined(var_06))
		{
			return;
		}
	}

	var_0E = self.connectedpostgame["killstreaks"][var_06];
	var_0E.available = 1;
	var_0E.earned = isdefined(param_01) && param_01;
	var_0E.awardxp = isdefined(param_02) && param_02;
	var_0E.owner = param_03;
	var_0E.kid = self.connectedpostgame["kID"];
	if(isdefined(param_04) && isarray(param_04))
	{
		var_0E.var_5D57 = param_04;
	}
	else
	{
		var_0E.var_5D57 = lib_A7C3::getkillstreakmodules(self,param_00);
	}

	self.connectedpostgame["kID"]++;
	if(!var_0E.earned)
	{
		var_0E.lifeid = -1;
	}
	else
	{
		var_0E.lifeid = self.connectedpostgame["deaths"];
	}

	if(level.console || common_scripts\utility::is_player_gamepad_enabled())
	{
		var_0F = maps\mp\_utility::getkillstreakweapon(param_00,param_04);
		lib_A7C3::givekillstreakweapon(var_0F);
		if(isdefined(self.killstreakindexweapon))
		{
			param_00 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname;
			var_10 = maps\mp\_utility::getkillstreakweapon(param_00,param_04);
			var_11 = self getcurrentweapon();
			if(var_11 != var_10 && !issubstr(var_11,"turrethead"))
			{
				self.killstreakindexweapon = var_06;
			}
		}
		else
		{
			self.killstreakindexweapon = var_06;
		}
	}
	else
	{
		if(level.killstreak_gimme_slot == var_06 && self.connectedpostgame["killstreaks"][level.killstreak_gimme_slot].nextslot > level.killstreak_stacking_start_slot)
		{
			var_12 = self.connectedpostgame["killstreaks"][level.killstreak_gimme_slot].nextslot - 1;
			var_13 = maps\mp\_utility::getkillstreakweapon(self.connectedpostgame["killstreaks"][var_12].streakname,self.connectedpostgame["killstreaks"][var_12].var_5D57);
			self takeweapon(var_13);
		}

		var_10 = maps\mp\_utility::getkillstreakweapon(param_00,param_04);
		maps\mp\_utility::_giveweapon(var_10,0);
		maps\mp\_utility::_setactionslot(var_06 + 4,"weapon",var_10);
	}

	lib_A7C3::updatestreakslots();
	if(isdefined(level.killstreaksetupfuncs[param_00]))
	{
		self [[ level.killstreaksetupfuncs[param_00] ]]();
	}

	if(isdefined(param_01) && param_01 && isdefined(param_02) && param_02)
	{
		self notify("received_earned_killstreak");
	}

	self setclientomnvar("ks_acquired",1);
}

//Function Number: 40
lib_A7C3::givekillstreakweapon(param_00)
{
	self endon("disconnect");
	if(!level.console && !common_scripts\utility::is_player_gamepad_enabled())
	{
		return;
	}

	var_01 = self getweaponslistitems();
	foreach(var_03 in var_01)
	{
		if(!maps\mp\_utility::isstrstart(var_03,"killstreak_") && !maps\mp\_utility::isstrstart(var_03,"airdrop_") && !maps\mp\_utility::isstrstart(var_03,"deployable_"))
		{
			continue;
		}

		if(self getcurrentweapon() == var_03)
		{
			continue;
		}

		while(maps\mp\_utility::ischangingweapon())
		{
			wait(0.05);
		}

		self takeweapon(var_03);
	}

	if(isdefined(self.killstreakindexweapon))
	{
		var_05 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname;
		var_06 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].var_5D57;
		var_07 = maps\mp\_utility::getkillstreakweapon(var_05,var_06);
		if(self getcurrentweapon() != var_07)
		{
			maps\mp\_utility::_giveweapon(param_00,0);
			maps\mp\_utility::_setactionslot(4,"weapon",param_00);
			return;
		}

		return;
	}

	maps\mp\_utility::_giveweapon(param_00,0);
	maps\mp\_utility::_setactionslot(4,"weapon",param_00);
}

//Function Number: 41
lib_A7C3::getstreakmodulecost(param_00)
{
	return int(tablelookup(level.ks_modules_table,level.ks_module_ref_column,param_00,level.ks_module_added_points_column));
}

//Function Number: 42
lib_A7C3::getstreakmodulebasekillstreak(param_00)
{
	return tablelookup(level.ks_modules_table,level.ks_module_ref_column,param_00,level.ks_module_killstreak_ref_column);
}

//Function Number: 43
lib_A7C3::getallstreakmodulescost(param_00)
{
	var_01 = 0;
	var_02 = getarraykeys(self.killstreakmodules);
	foreach(var_04 in var_02)
	{
		var_05 = lib_A7C3::getstreakmodulebasekillstreak(var_04);
		if(var_05 == param_00)
		{
			var_01 = var_01 + self.killstreakmodules[var_04];
		}
	}

	return var_01;
}

//Function Number: 44
lib_A7C3::getstreakcost(param_00)
{
	var_01 = int(maps\mp\_utility::getkillstreakkills(param_00));
	if(isplayer(self))
	{
		var_01 = var_01 + lib_A7C3::getallstreakmodulescost(param_00);
	}

	if(isdefined(self) && isplayer(self))
	{
		if(var_01 > 100 && maps\mp\_utility::_hasperk("specialty_hardline"))
		{
			var_01 = var_01 - 100;
		}
	}

	return var_01;
}

//Function Number: 45
lib_A7C3::getkillstreakhint(param_00)
{
	return tablelookupistring(level.killstreak_string_table,1,param_00,5);
}

//Function Number: 46
lib_A7C3::getkillstreakinformenemy(param_00)
{
	return int(tablelookup(level.killstreak_string_table,1,param_00,10));
}

//Function Number: 47
lib_A7C3::getkillstreakdialog(param_00)
{
	return tablelookup(level.killstreak_string_table,1,param_00,7);
}

//Function Number: 48
lib_A7C3::getkillstreakcrateicon(param_00,param_01)
{
	var_02 = 14;
	if(isdefined(param_01) && param_01.size > 0)
	{
		switch(param_01.size)
		{
			case 1:
				break;

			case 2:
				break;

			case 3:
				break;

			default:
				break;
		}
	}
}

//Function Number: 49
lib_A7C3::giveownedkillstreakitem(param_00)
{
	var_01 = self.connectedpostgame["killstreaks"];
	if(level.console || common_scripts\utility::is_player_gamepad_enabled())
	{
		var_02 = -1;
		var_03 = -1;
		for(var_04 = 0;var_04 < level.killstreak_stacking_start_slot;var_04++)
		{
			if(isdefined(var_01[var_04]) && isdefined(var_01[var_04].streakname) && var_01[var_04].available && lib_A7C3::getstreakcost(var_01[var_04].streakname) > var_03)
			{
				var_03 = 0;
				if(!var_01[var_04].isgimme)
				{
					var_03 = lib_A7C3::getstreakcost(var_01[var_04].streakname);
				}

				var_02 = var_04;
			}
		}

		if(var_02 != -1)
		{
			self.killstreakindexweapon = var_02;
			var_05 = var_01[self.killstreakindexweapon].streakname;
			var_06 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].var_5D57;
			var_07 = maps\mp\_utility::getkillstreakweapon(var_05,var_06);
			lib_A7C3::givekillstreakweapon(var_07);
		}
		else
		{
			self.killstreakindexweapon = undefined;
		}
	}
	else
	{
		var_02 = -1;
		var_03 = -1;
		for(var_04 = 0;var_04 < level.killstreak_stacking_start_slot;var_04++)
		{
			if(isdefined(var_01[var_04]) && isdefined(var_01[var_04].streakname) && var_01[var_04].available)
			{
				var_08 = maps\mp\_utility::getkillstreakweapon(var_01[var_04].streakname,var_01[var_04].var_5D57);
				var_09 = self getweaponslistitems();
				var_0A = 0;
				for(var_0B = 0;var_0B < var_09.size;var_0B++)
				{
					if(var_08 == var_09[var_0B])
					{
						var_0A = 1;
						break;
					}
				}

				if(!var_0A)
				{
					maps\mp\_utility::_giveweapon(var_08);
				}
				else if(issubstr(var_08,"airdrop_"))
				{
					self setweaponammoclip(var_08,1);
				}

				maps\mp\_utility::_setactionslot(var_04 + 4,"weapon",var_08);
				if(lib_A7C3::getstreakcost(var_01[var_04].streakname) > var_03)
				{
					var_03 = 0;
					if(!var_01[var_04].isgimme)
					{
						var_03 = lib_A7C3::getstreakcost(var_01[var_04].streakname);
					}

					var_02 = var_04;
				}
			}
		}

		if(var_02 != -1)
		{
			var_05 = var_01[var_02].streakname;
		}

		self.killstreakindexweapon = undefined;
	}

	lib_A7C3::updatestreakslots();
}

//Function Number: 50
lib_A7C3::playerwaittillridekillstreakcomplete()
{
	if(!isdefined(self.remoteridetransition))
	{
		return;
	}

	self endon("rideKillstreakComplete");
	self waittill("rideKillstreakFailed");
}

//Function Number: 51
lib_A7C3::playerwaittillridekillstreakblack()
{
	if(!isdefined(self.remoteridetransition))
	{
		return;
	}

	self endon("rideKillstreakBlack");
	self waittill("rideKillstreakFailed");
}

//Function Number: 52
lib_A7C3::initridekillstreak(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	lib_A7C3::playerdestroyglassbelow();
	common_scripts\utility::_disableusability();
	maps\mp\_utility::freezecontrolswrapper(1);
	self.remoteridetransition = 1;
	var_04 = lib_A7C3::initridekillstreak_internal(param_00,param_01,param_02,param_03);
	if(isdefined(self))
	{
		maps\mp\_utility::freezecontrolswrapper(0);
		common_scripts\utility::_enableusability();
		self.remoteridetransition = undefined;
		if(var_04 == "success")
		{
			self notify("rideKillstreakBlack");
		}
		else
		{
			maps\mp\_utility::playerremotekillstreakshowhud();
			self notify("rideKillstreakFailed");
		}
	}

	return var_04;
}

//Function Number: 53
lib_A7C3::initridekillstreak_internal(param_00,param_01,param_02,param_03)
{
	thread lib_A7C3::resetplayeronteamchange();
	var_04 = "none";
	var_05 = 0.75;
	if(isdefined(param_00) && param_00 == "coop")
	{
		var_05 = 0.05;
	}

	var_04 = common_scripts\utility::waittill_any_timeout(var_05,"disconnect","death","weapon_switch_started");
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	if(var_04 == "disconnect")
	{
		return "disconnect";
	}

	if(var_04 == "death")
	{
		return "fail";
	}

	if(var_04 == "weapon_switch_started")
	{
		return "fail";
	}

	if(!isdefined(self) || !isalive(self))
	{
		return "fail";
	}

	if(!self isonground() && !self islinked())
	{
		return "fail";
	}

	if(isdefined(self.underwater) && self.underwater)
	{
		return "fail";
	}

	if(level.gameended)
	{
		return "fail";
	}

	if(maps\mp\_utility::isemped() || maps\mp\_utility::isairdenied())
	{
		return "fail";
	}

	maps\mp\_utility::playerremotekillstreakhidehud();
	lib_A7C3::playerdestroyglassbelow();
	if(param_01)
	{
		if(!isdefined(param_02))
		{
			param_02 = 1;
		}
	}
	else
	{
		if(!isdefined(param_02))
		{
			param_02 = 0.8;
		}

		self setclientomnvar("ui_killstreak_blackout",1);
		self setclientomnvar("ui_killstreak_blackout_fade_end",gettime() + int(param_02 * 1000));
		thread lib_A7C3::clearrideintroonteamchange();
		thread clearrideintroonroundtransition();
	}

	var_04 = common_scripts\utility::waittill_any_timeout(param_02,"disconnect","death");
	if(var_04 == "disconnect" || !isdefined(self))
	{
		return "disconnect";
	}

	if(!isdefined(param_03))
	{
		param_03 = 0.6;
	}

	if(param_01)
	{
		self notify("intro_cleared");
	}
	else
	{
		thread lib_A7C3::clearrideintro(param_03);
	}

	if(var_04 == "death")
	{
		return "fail";
	}

	if(!isdefined(self) || !isalive(self))
	{
		return "fail";
	}

	if(!self isonground() && !self islinked())
	{
		return "fail";
	}

	if(isdefined(self.underwater) && self.underwater)
	{
		return "fail";
	}

	if(level.gameended)
	{
		return "fail";
	}

	if(maps\mp\_utility::isemped() || maps\mp\_utility::isairdenied())
	{
		return "fail";
	}

	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	return "success";
}

//Function Number: 54
lib_A7C3::clearrideintro(param_00)
{
	self endon("disconnect");
	self endon("joined_team");
	if(isdefined(param_00))
	{
		maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(param_00);
	}

	var_01 = 0.5;
	self setclientomnvar("ui_killstreak_blackout",0);
	self setclientomnvar("ui_killstreak_blackout_fade_end",gettime() + int(var_01 * 1000));
	wait(var_01);
	if(!isdefined(self))
	{
		return;
	}

	self notify("rideKillstreakComplete");
}

//Function Number: 55
lib_A7C3::resetplayeronteamchange()
{
	self endon("rideKillstreakComplete");
	self endon("rideKillstreakFailed");
	self waittill("joined_team");
	maps\mp\_utility::freezecontrolswrapper(0);
	self.remoteridetransition = undefined;
	if(self.disabledusability)
	{
		common_scripts\utility::_enableusability();
	}

	if(maps\mp\_utility::isusingremote())
	{
		maps\mp\_utility::clearusingremote();
	}
}

//Function Number: 56
lib_A7C3::clearrideintroonteamchange()
{
	self endon("rideKillstreakComplete");
	self endon("rideKillstreakFailed");
	self waittill("joined_team");
	self setclientomnvar("ui_killstreak_blackout",0);
	self setclientomnvar("ui_killstreak_blackout_fade_end",0);
	maps\mp\_utility::playerremotekillstreakshowhud();
	self notify("rideKillstreakComplete");
}

//Function Number: 57
clearrideintroonroundtransition()
{
	self endon("rideKillstreakComplete");
	self endon("rideKillstreakFailed");
	level waittill("game_ended");
	self setclientomnvar("ui_killstreak_blackout",0);
	self setclientomnvar("ui_killstreak_blackout_fade_end",0);
	maps\mp\_utility::playerremotekillstreakshowhud();
	self notify("rideKillstreakComplete");
}

//Function Number: 58
lib_A7C3::playerdestroyglassbelow()
{
	if(self isonground())
	{
		var_00 = bullettrace(self.var_2E6 + (0,0,5),self.var_2E6 + (0,0,-5),0);
		if(isdefined(var_00["glass"]))
		{
			destroyglass(var_00["glass"]);
		}
	}
}

//Function Number: 59
lib_A7C3::giveselectedkillstreakitem()
{
	var_00 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname;
	var_01 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].var_5D57;
	var_02 = maps\mp\_utility::getkillstreakweapon(var_00,var_01);
	lib_A7C3::givekillstreakweapon(var_02);
	lib_A7C3::updatestreakslots();
}

//Function Number: 60
lib_A7C3::getkillstreakcount()
{
	var_00 = 0;
	for(var_01 = 0;var_01 < level.killstreak_stacking_start_slot;var_01++)
	{
		if(isdefined(self.connectedpostgame["killstreaks"][var_01]) && isdefined(self.connectedpostgame["killstreaks"][var_01].streakname) && self.connectedpostgame["killstreaks"][var_01].available)
		{
			var_00++;
		}
	}

	return var_00;
}

//Function Number: 61
lib_A7C3::shufflekillstreaksup()
{
	if(lib_A7C3::getkillstreakcount() > 1)
	{
		for(;;)
		{
			self.killstreakindexweapon++;
			if(self.killstreakindexweapon >= level.killstreak_stacking_start_slot)
			{
				self.killstreakindexweapon = 0;
			}

			if(self.connectedpostgame["killstreaks"][self.killstreakindexweapon].available == 1)
			{
				break;
			}
		}

		lib_A7C3::giveselectedkillstreakitem();
	}
}

//Function Number: 62
lib_A7C3::shufflekillstreaksdown()
{
	if(lib_A7C3::getkillstreakcount() > 1)
	{
		for(;;)
		{
			self.killstreakindexweapon--;
			if(self.killstreakindexweapon < 0)
			{
				self.killstreakindexweapon = level.killstreak_stacking_start_slot - 1;
			}

			if(self.connectedpostgame["killstreaks"][self.killstreakindexweapon].available == 1)
			{
				break;
			}
		}

		lib_A7C3::giveselectedkillstreakitem();
	}
}

//Function Number: 63
lib_A7C3::streakselectuptracker()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	level endon("game_ended");
	if(isdefined(level.var_511A) && level.var_511A)
	{
		self endon("horde_end_spectate");
	}

	for(;;)
	{
		self waittill("toggled_up");
		if(!level.console && !common_scripts\utility::is_player_gamepad_enabled())
		{
			continue;
		}

		if(lib_A7C3::canshufflekillstreaks())
		{
			lib_A7C3::shufflekillstreaksup();
		}

		wait(0.12);
	}
}

//Function Number: 64
lib_A7C3::streakselectdowntracker()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	level endon("game_ended");
	if(isdefined(level.var_511A) && level.var_511A)
	{
		self endon("horde_end_spectate");
	}

	for(;;)
	{
		self waittill("toggled_down");
		if(!level.console && !common_scripts\utility::is_player_gamepad_enabled())
		{
			continue;
		}

		if(lib_A7C3::canshufflekillstreaks())
		{
			lib_A7C3::shufflekillstreaksdown();
		}

		wait(0.12);
	}
}

//Function Number: 65
lib_A7C3::canshufflekillstreaks()
{
	return !self ismantling() && !isdefined(self.changingweapon) || isdefined(self.changingweapon) && self.changingweapon == "none" && lib_A7C3::canshufflewithkillstreakweapon() && !isdefined(self.iscarrying) || isdefined(self.iscarrying) && self.iscarrying == 0;
}

//Function Number: 66
lib_A7C3::canshufflewithkillstreakweapon()
{
	var_00 = self getcurrentweapon();
	return !maps\mp\_utility::iskillstreakweapon(var_00) || maps\mp\_utility::iskillstreakweapon(var_00) && maps\mp\_utility::isjuggernaut();
}

//Function Number: 67
lib_A7C3::streaknotifytracker()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self endon("faux_spawn");
	if(isbot(self))
	{
		return;
	}

	maps\mp\_utility::gameflagwait("prematch_done");
	self notifyonplayercommand("toggled_up","+actionslot 1");
	self notifyonplayercommand("toggled_down","+actionslot 2");
	if(!level.console)
	{
		self notifyonplayercommand("streakUsed1","+actionslot 4");
		self notifyonplayercommand("streakUsed2","+actionslot 5");
		self notifyonplayercommand("streakUsed3","+actionslot 6");
		self notifyonplayercommand("streakUsed4","+actionslot 7");
		self notifyonplayercommand("streakUsed5","+actionslot 8");
	}
}

//Function Number: 68
lib_A7C3::giveadrenalinedirect(param_00)
{
	if(!param_00)
	{
		return;
	}

	var_01 = self.adrenaline + param_00;
	var_02 = lib_A7C3::getmaxstreakcost(0);
	if(var_01 >= var_02)
	{
		var_01 = var_01 - var_02;
	}

	lib_A7C3::setadrenaline(var_01);
	var_01 = self.adrenalinesupport + param_00;
	var_02 = lib_A7C3::getmaxstreakcost(1);
	if(var_01 >= var_02)
	{
		var_01 = var_01 - var_02;
	}

	lib_A7C3::setadrenalinesupport(var_01);
	lib_A7C3::updatestreakcount();
	lib_A7C3::checkstreakreward();
}

//Function Number: 69
lib_A7C3::roundup(param_00)
{
	if(int(param_00) != param_00)
	{
		return int(param_00 + 1);
	}

	return int(param_00);
}

//Function Number: 70
lib_A7C3::giveadrenaline(param_00)
{
	var_01 = maps\mp\gametypes\_rank::getscoreinfovalue(param_00);
	if(maps\mp\_utility::isreallyalive(self))
	{
		lib_A7C3::giveadrenalinedirect(var_01);
	}

	lib_A7C3::displaykillstreakpoints(param_00,var_01);
}

//Function Number: 71
lib_A7C3::displaykillstreakpoints(param_00,param_01)
{
	if(!level.hardcoremode)
	{
		thread maps\mp\gametypes\_rank::xppointspopup(param_00,param_01);
	}
}

//Function Number: 72
lib_A7C3::resetadrenaline(param_00)
{
	self.earnedstreaklevel = 0;
	lib_A7C3::setadrenaline(0);
	if(param_00)
	{
		lib_A7C3::setadrenalinesupport(0);
		self.connectedpostgame["ks_totalPointsSupport"] = 0;
	}

	lib_A7C3::updatestreakcount();
	self.connectedpostgame["ks_totalPoints"] = 0;
	self.connectedpostgame["lastEarnedStreak"] = undefined;
}

//Function Number: 73
lib_A7C3::setadrenaline(param_00)
{
	if(param_00 < 0)
	{
		param_00 = 0;
	}

	if(isdefined(self.adrenaline) && self.adrenaline != 0)
	{
		self.previousadrenaline = self.adrenaline;
	}
	else
	{
		self.previousadrenaline = 0;
	}

	self.adrenaline = param_00;
	self.connectedpostgame["ks_totalPoints"] = self.adrenaline;
}

//Function Number: 74
lib_A7C3::setadrenalinesupport(param_00)
{
	if(param_00 < 0)
	{
		param_00 = 0;
	}

	if(isdefined(self.adrenalinesupport) && self.adrenalinesupport != 0)
	{
		self.previousadrenalinesupport = self.adrenalinesupport;
	}
	else
	{
		self.previousadrenalinesupport = 0;
	}

	self.adrenalinesupport = param_00;
	self.connectedpostgame["ks_totalPointsSupport"] = self.adrenalinesupport;
}

//Function Number: 75
pc_watchcontrolschanged()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	var_00 = common_scripts\utility::is_player_gamepad_enabled();
	for(;;)
	{
		if(maps\mp\_utility::isinremotetransition() || maps\mp\_utility::isusingremote() || maps\mp\_utility::ischangingweapon())
		{
			while(maps\mp\_utility::isinremotetransition() || maps\mp\_utility::isusingremote() || maps\mp\_utility::ischangingweapon())
			{
				wait 0.05;
			}

			wait 0.05;
		}

		if(var_00 != common_scripts\utility::is_player_gamepad_enabled())
		{
			thread lib_A7C3::updatekillstreaks(1);
			var_00 = common_scripts\utility::is_player_gamepad_enabled();
		}

		wait 0.05;
	}
}

//Function Number: 76
lib_A7C3::pc_watchstreakuse()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self endon("faux_spawn");
	self.actionslotenabled = [];
	self.actionslotenabled[level.killstreak_gimme_slot] = 1;
	self.actionslotenabled[level.killstreak_slot_1] = 1;
	self.actionslotenabled[level.killstreak_slot_2] = 1;
	self.actionslotenabled[level.killstreak_slot_3] = 1;
	self.actionslotenabled[level.killstreak_slot_4] = 1;
	if(!isbot(self))
	{
		thread pc_watchcontrolschanged();
	}

	var_00 = common_scripts\utility::waittill_any_return("streakUsed1","streakUsed2","streakUsed3","streakUsed4","streakUsed5");
	if(common_scripts\utility::is_player_gamepad_enabled())
	{
		continue;
	}

	if(!isdefined(var_00))
	{
		continue;
	}

	if(isdefined(self.changingweapon) && self.changingweapon == "none")
	{
		continue;
	}

	switch(var_00)
	{
		case "streakUsed1":
			break;

		case "streakUsed2":
			break;

		case "streakUsed3":
			break;

		case "streakUsed4":
			break;

		case "streakUsed5":
			break;
	}
}

//Function Number: 77
lib_A7C3::disablekillstreakactionslots()
{
	for(var_00 = 0;var_00 < level.killstreak_stacking_start_slot;var_00++)
	{
		if(!isdefined(self.killstreakindexweapon))
		{
			break;
		}

		if(self.killstreakindexweapon == var_00)
		{
			continue;
		}

		maps\mp\_utility::_setactionslot(var_00 + 4,"");
		self.actionslotenabled[var_00] = 0;
	}
}

//Function Number: 78
lib_A7C3::enablekillstreakactionslots()
{
	for(var_00 = 0;var_00 < level.killstreak_stacking_start_slot;var_00++)
	{
		if(self.connectedpostgame["killstreaks"][var_00].available)
		{
			var_01 = maps\mp\_utility::getkillstreakweapon(self.connectedpostgame["killstreaks"][var_00].streakname,self.connectedpostgame["killstreaks"][var_00].var_5D57);
			maps\mp\_utility::_setactionslot(var_00 + 4,"weapon",var_01);
		}
		else
		{
			maps\mp\_utility::_setactionslot(var_00 + 4,"");
		}

		self.actionslotenabled[var_00] = 1;
	}
}

//Function Number: 79
lib_A7C3::killstreakhit(param_00,param_01,param_02)
{
	if(isdefined(param_01) && isplayer(param_00) && isdefined(param_02.owner) && isdefined(param_02.owner.inliveplayerkillstreak))
	{
		if(((level.teambased && param_02.owner.inliveplayerkillstreak != param_00.inliveplayerkillstreak) || !level.teambased) && param_00 != param_02.owner)
		{
			if(maps\mp\_utility::iskillstreakweapon(param_01))
			{
				return;
			}

			if(!isdefined(param_00.currentweaponatspawn[param_01]))
			{
				param_00.currentweaponatspawn[param_01] = 0;
			}

			if(param_00.currentweaponatspawn[param_01] == gettime())
			{
				return;
			}

			param_00.currentweaponatspawn[param_01] = gettime();
			param_00 thread maps\mp\gametypes\_gamelogic::threadedsetweaponstatbyname(param_01,1,"hits");
			var_03 = param_00 maps\mp\gametypes\_persistance::func_8D63("totalShots");
			var_04 = param_00 maps\mp\gametypes\_persistance::func_8D63("hits") + 1;
			if(var_04 <= var_03)
			{
				param_00 maps\mp\gametypes\_persistance::func_8D73("hits",var_04);
				param_00 maps\mp\gametypes\_persistance::func_8D73("misses",int(var_03 - var_04));
				var_05 = clamp(float(var_04) / float(var_03),0,1) * 10000;
				param_00 maps\mp\gametypes\_persistance::func_8D73("accuracy",int(var_05));
				return;
			}
		}
	}
}