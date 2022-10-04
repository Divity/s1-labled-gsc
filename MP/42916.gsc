/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42916.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 22
 * Decompile Time: 22 ms
 * Timestamp: 4/20/2022 8:18:28 PM
*******************************************************************/

//Function Number: 1
lib_A7A4::init()
{
	level.var_67D7 = [];
	maps\mp\gametypes\_class::init();
	maps\mp\gametypes\_missions::init();
	maps\mp\gametypes\_playercards::init();
	maps\mp\gametypes\_rank::init();
	if(getdvarint("virtualLobbyActive",0) > 0)
	{
		return;
	}

	level thread lib_A7A4::func_9AF2();
	level thread lib_A7A4::func_9BC2();
}

//Function Number: 2
lib_A7A4::func_4D92()
{
	self.var_1838 = [];
	if(maps\mp\_utility::rankingenabled())
	{
		self.var_1838["totalShots"] = self getrankedplayerdata("totalShots");
		self.var_1838["accuracy"] = self getrankedplayerdata("accuracy");
		self.var_1838["misses"] = self getrankedplayerdata("misses");
		self.var_1838["hits"] = self getrankedplayerdata("hits");
		self.var_1838["timePlayedAllies"] = self getrankedplayerdata("timePlayedAllies");
		self.var_1838["timePlayedOpfor"] = self getrankedplayerdata("timePlayedOpfor");
		self.var_1838["timePlayedOther"] = self getrankedplayerdata("timePlayedOther");
		self.var_1838["timePlayedTotal"] = self getrankedplayerdata("timePlayedTotal");
	}

	self.var_1837 = [];
	self.var_1837["round"] = [];
	self.var_1837["round"]["timePlayed"] = self getcommonplayerdata("round","timePlayed");
}

//Function Number: 3
lib_A7A4::func_8D62(param_00)
{
	return self getrankedplayerdata(param_00);
}

//Function Number: 4
lib_A7A4::func_8D72(param_00,param_01)
{
	if(!maps\mp\_utility::rankingenabled() || maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	self setrankedplayerdata(param_00,param_01);
}

//Function Number: 5
lib_A7A4::func_8D4A(param_00,param_01,param_02)
{
	if(!maps\mp\_utility::rankingenabled() || maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	if(isdefined(param_02))
	{
		var_03 = self getrankedplayerdata(param_00,param_02);
		self setrankedplayerdata(param_00,param_02,param_01 + var_03);
		return;
	}

	var_03 = self getrankedplayerdata(param_01);
	self setrankedplayerdata(param_00,param_01 + var_03);
}

//Function Number: 6
lib_A7A4::func_8D64(param_00,param_01)
{
	if(param_00 == "round")
	{
		return self getcommonplayerdata(param_00,param_01);
	}

	return self getrankedplayerdata(param_00,param_01);
}

//Function Number: 7
lib_A7A4::func_8D74(param_00,param_01,param_02)
{
	if(isagent(self))
	{
		return;
	}

	if(maps\mp\_utility::invirtuallobby())
	{
		return;
	}

	if(param_00 == "round")
	{
		self setcommonplayerdata(param_00,param_01,param_02);
		return;
	}

	if(!maps\mp\_utility::rankingenabled() || maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	self setrankedplayerdata(param_00,param_01,param_02);
}

//Function Number: 8
lib_A7A4::func_8D4D(param_00,param_01,param_02)
{
	if(!maps\mp\_utility::rankingenabled() || maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	var_03 = self getrankedplayerdata(param_00,param_01);
	self setrankedplayerdata(param_00,param_01,var_03 + param_02);
}

//Function Number: 9
lib_A7A4::func_8D65(param_00,param_01)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return 0;
	}

	return self.var_1837[param_00][param_01];
}

//Function Number: 10
lib_A7A4::func_8D75(param_00,param_01,param_02)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	self.var_1837[param_00][param_01] = param_02;
}

//Function Number: 11
lib_A7A4::func_8D4E(param_00,param_01,param_02)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	var_03 = lib_A7A4::func_8D65(param_00,param_01);
	lib_A7A4::func_8D75(param_00,param_01,var_03 + param_02);
}

//Function Number: 12
lib_A7A4::func_8D4C(param_00,param_01,param_02)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	var_03 = lib_A7A4::func_8D63(param_00) + param_01;
	if(var_03 > param_02)
	{
		var_03 = param_02;
	}

	if(var_03 < lib_A7A4::func_8D63(param_00))
	{
		var_03 = param_02;
	}

	lib_A7A4::func_8D73(param_00,var_03);
}

//Function Number: 13
lib_A7A4::func_8D4F(param_00,param_01,param_02,param_03)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	var_04 = lib_A7A4::func_8D65(param_00,param_01) + param_02;
	if(var_04 > param_03)
	{
		var_04 = param_03;
	}

	if(var_04 < lib_A7A4::func_8D65(param_00,param_01))
	{
		var_04 = param_03;
	}

	lib_A7A4::func_8D75(param_00,param_01,var_04);
}

//Function Number: 14
lib_A7A4::func_8D63(param_00)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return 0;
	}

	return self.var_1838[param_00];
}

//Function Number: 15
lib_A7A4::func_8D73(param_00,param_01)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	self.var_1838[param_00] = param_01;
}

//Function Number: 16
lib_A7A4::func_8D4B(param_00,param_01)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	var_02 = lib_A7A4::func_8D63(param_00);
	lib_A7A4::func_8D73(param_00,var_02 + param_01);
}

//Function Number: 17
lib_A7A4::func_9AF2()
{
	wait(0.15);
	var_00 = 0;
	while(!level.gameended)
	{
		maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
		var_00++;
		if(var_00 >= level.var_328.size)
		{
			var_00 = 0;
		}

		if(isdefined(level.var_328[var_00]))
		{
			level.var_328[var_00] lib_A7A4::func_A357();
			level.var_328[var_00] lib_A7A4::func_9B9C();
		}

		wait(2);
	}

	foreach(var_02 in level.var_328)
	{
		var_02 lib_A7A4::func_A357();
		var_02 lib_A7A4::func_9B9C();
	}
}

//Function Number: 18
lib_A7A4::func_A357()
{
	var_00 = maps\mp\_utility::rankingenabled() && !maps\mp\_utility::practiceroundgame();
	if(var_00)
	{
		foreach(var_03, var_02 in self.var_1838)
		{
			self setrankedplayerdata(var_03,var_02);
		}
	}

	foreach(var_03, var_02 in self.var_1837)
	{
		foreach(var_07, var_06 in var_02)
		{
			if(var_03 == "round")
			{
				self setcommonplayerdata(var_03,var_07,var_06);
				continue;
			}

			if(var_00)
			{
				self setrankedplayerdata(var_03,var_07,var_06);
			}
		}
	}
}

//Function Number: 19
lib_A7A4::func_4C3D(param_00,param_01,param_02)
{
	if(maps\mp\_utility::iskillstreakweapon(param_00))
	{
		return;
	}

	if(isdefined(level.var_2B2D) && level.var_2B2D)
	{
		return;
	}

	if(maps\mp\_utility::rankingenabled() && !maps\mp\_utility::practiceroundgame())
	{
		var_03 = self getrankedplayerdata("weaponStats",param_00,param_01);
		self setrankedplayerdata("weaponStats",param_00,param_01,var_03 + param_02);
	}
}

//Function Number: 20
lib_A7A4::func_4C3A(param_00,param_01,param_02)
{
	if(maps\mp\_utility::rankingenabled() && !maps\mp\_utility::practiceroundgame())
	{
		var_03 = self getrankedplayerdata("attachmentsStats",param_00,param_01);
		self setrankedplayerdata("attachmentsStats",param_00,param_01,var_03 + param_02);
	}
}

//Function Number: 21
lib_A7A4::func_9B9C()
{
	if(!isdefined(self.trackingweaponname))
	{
		return;
	}

	if(self.trackingweaponname == "" || self.trackingweaponname == "none")
	{
		return;
	}

	var_00 = self.trackingweaponname;
	if(maps\mp\_utility::iskillstreakweapon(var_00) || maps\mp\_utility::isenvironmentweapon(var_00))
	{
		return;
	}

	var_01 = maps\mp\_utility::getweaponnametokens(var_00);
	if(var_01[0] == "iw5")
	{
		var_01[0] = var_01[0] + "_" + var_01[1];
	}

	if(var_01[0] == "alt")
	{
		foreach(var_03 in var_01)
		{
			if(var_03 == "gl" || var_03 == "gp25" || var_03 == "m320")
			{
				var_01[0] = "gl";
				break;
			}

			if(var_03 == "shotgun")
			{
				var_01[0] = "shotgun";
				break;
			}
		}

		if(var_01[0] == "alt")
		{
			var_01[0] = var_01[1] + "_" + var_01[2];
		}
	}

	if(var_01[0] == "gl" || var_01[0] == "shotgun")
	{
		if(self.trackingweaponshots > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"shots",self.trackingweaponshots);
		}

		if(self.trackingweaponkills > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"kills",self.trackingweaponkills);
		}

		if(self.trackingweaponhits > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"hits",self.trackingweaponhits);
		}

		if(self.trackingweaponheadshots > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"headShots",self.trackingweaponheadshots);
		}

		if(self.trackingweapondeaths > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"deaths",self.trackingweapondeaths);
		}

		if(self.trackingweaponhipfirekills > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"hipfirekills",self.trackingweaponhipfirekills);
		}

		if(self.trackingweaponusetime > 0)
		{
			lib_A7A4::func_4C3A(var_01[0],"timeInUse",self.trackingweaponusetime);
		}

		self.trackingweaponname = "none";
		self.trackingweaponshots = 0;
		self.trackingweaponkills = 0;
		self.trackingweaponhits = 0;
		self.trackingweaponheadshots = 0;
		self.trackingweapondeaths = 0;
		self.trackingweaponhipfirekills = 0;
		self.trackingweaponusetime = 0;
		return;
	}

	if(!maps\mp\_utility::iscacprimaryweapon(var_01[0]) && !maps\mp\_utility::iscacsecondaryweapon(var_01[0]))
	{
		return;
	}

	if(self.trackingweaponshots > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"shots",self.trackingweaponshots);
		maps\mp\_matchdata::logweaponstat(var_01[0],"shots",self.trackingweaponshots);
	}

	if(self.trackingweaponkills > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"kills",self.trackingweaponkills);
		maps\mp\_matchdata::logweaponstat(var_01[0],"kills",self.trackingweaponkills);
	}

	if(self.trackingweaponhits > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"hits",self.trackingweaponhits);
		maps\mp\_matchdata::logweaponstat(var_01[0],"hits",self.trackingweaponhits);
	}

	if(self.trackingweaponheadshots > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"headShots",self.trackingweaponheadshots);
		maps\mp\_matchdata::logweaponstat(var_01[0],"headShots",self.trackingweaponheadshots);
	}

	if(self.trackingweapondeaths > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"deaths",self.trackingweapondeaths);
		maps\mp\_matchdata::logweaponstat(var_01[0],"deaths",self.trackingweapondeaths);
	}

	if(self.trackingweaponhipfirekills > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"hipfirekills",self.trackingweaponhipfirekills);
		maps\mp\_matchdata::logweaponstat(var_01[0],"hipfirekills",self.trackingweaponhipfirekills);
	}

	if(self.trackingweaponusetime > 0)
	{
		lib_A7A4::func_4C3D(var_01[0],"timeInUse",self.trackingweaponusetime);
		maps\mp\_matchdata::logweaponstat(var_01[0],"timeInUse",self.trackingweaponusetime);
	}

	var_05 = getweaponattachments(var_00);
	foreach(var_07 in var_05)
	{
		var_08 = maps\mp\_utility::attachmentmap_tobase(var_07);
		if(var_08 == "gl" || var_08 == "shotgun")
		{
			continue;
		}

		if(self.trackingweaponshots > 0)
		{
			if(var_08 != "tactical")
			{
				lib_A7A4::func_4C3A(var_08,"shots",self.trackingweaponshots);
			}
		}

		if(self.trackingweaponkills > 0)
		{
			if(var_08 != "tactical")
			{
				lib_A7A4::func_4C3A(var_08,"kills",self.trackingweaponkills);
			}
		}

		if(self.trackingweaponhits > 0)
		{
			if(var_08 != "tactical")
			{
				lib_A7A4::func_4C3A(var_08,"hits",self.trackingweaponhits);
			}
		}

		if(self.trackingweaponheadshots > 0)
		{
			if(var_08 != "tactical")
			{
				lib_A7A4::func_4C3A(var_08,"headShots",self.trackingweaponheadshots);
			}
		}

		if(self.trackingweaponhipfirekills > 0)
		{
			if(var_08 != "tactical")
			{
				lib_A7A4::func_4C3A(var_08,"hipfirekills",self.trackingweaponhipfirekills);
			}
		}

		if(self.trackingweaponusetime > 0)
		{
			if(var_08 != "tactical")
			{
				lib_A7A4::func_4C3A(var_08,"timeInUse",self.trackingweaponusetime);
			}
		}

		if(self.trackingweapondeaths > 0)
		{
			lib_A7A4::func_4C3A(var_08,"deaths",self.trackingweapondeaths);
		}
	}

	self.trackingweaponname = "none";
	self.trackingweaponshots = 0;
	self.trackingweaponkills = 0;
	self.trackingweaponhits = 0;
	self.trackingweaponheadshots = 0;
	self.trackingweapondeaths = 0;
	self.trackingweaponhipfirekills = 0;
	self.trackingweaponusetime = 0;
}

//Function Number: 22
lib_A7A4::func_9BC2()
{
	level waittill("game_ended");
	if(!maps\mp\_utility::matchmakinggame())
	{
		return;
	}

	var_00 = 0;
	var_01 = 0;
	var_02 = 0;
	var_03 = 0;
	var_04 = 0;
	var_05 = 0;
	foreach(var_07 in level.var_328)
	{
		var_05 = var_05 + var_07.timeplayed["total"];
	}

	incrementcounter("global_minutes",int(var_05 / 60));
	if(!maps\mp\_utility::waslastround())
	{
		return;
	}

	wait(0.05);
	foreach(var_07 in level.var_328)
	{
		var_00 = var_00 + var_07.kills;
		var_01 = var_01 + var_07.deaths;
		var_02 = var_02 + var_07.assists;
		var_03 = var_03 + var_07.headshots;
		var_04 = var_04 + var_07.suicides;
	}

	incrementcounter("global_kills",var_00);
	incrementcounter("global_deaths",var_01);
	incrementcounter("global_assists",var_02);
	incrementcounter("global_headshots",var_03);
	incrementcounter("global_suicides",var_04);
	incrementcounter("global_games",1);
}