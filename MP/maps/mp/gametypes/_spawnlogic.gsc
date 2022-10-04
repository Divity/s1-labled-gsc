/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _spawnlogic - 42927.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 43
 * Decompile Time: 2653 ms
 * Timestamp: 4/20/2022 8:14:47 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.var_53A5 = 5000;
	level.forcebuddyspawn = 0;
	level.supportbuddyspawn = 0;
	level.spawnmins = (0,0,0);
	level.spawnmaxs = (0,0,0);
	level.var_1F11 = undefined;
	level.disableclientspawntraces = 0;
	level.var_62A9 = 0;
	level.numplayerswaitingtoenterkillcam = 0;
	level.var_328 = [];
	level.participants = [];
	level.characters = [];
	level.spawnpointarray = [];
	level.grenades = [];
	level.missiles = [];
	level.carepackages = [];
	level.turrets = [];
	level.scramblers = [];
	level.ugvs = [];
	level.trackingdrones = [];
	level.explosivedrones = [];
	level thread onplayerconnect();
	level thread spawnpointupdate();
	level thread trackgrenades();
	level thread trackmissiles();
	level thread trackcarepackages();
	level thread trackhostmigrationend();
	for(var_00 = 0;var_00 < level.teamnamelist.size;var_00++)
	{
		level.teamspawnpoints[level.teamnamelist[var_00]] = [];
	}
}

//Function Number: 2
trackhostmigrationend()
{
	for(;;)
	{
		self waittill("host_migration_end");
		foreach(var_01 in level.participants)
		{
			var_01.canperformclienttraces = canperformclienttraces(var_01);
		}
	}
}

//Function Number: 3
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		level thread startclientspawnpointtraces(var_00);
	}
}

//Function Number: 4
startclientspawnpointtraces(param_00)
{
	param_00 endon("disconnect");
	param_00.canperformclienttraces = canperformclienttraces(param_00);
	if(!param_00.canperformclienttraces)
	{
		return;
	}

	wait(0.05);
	param_00 setclientspawnsighttraces(level.var_1F11);
}

//Function Number: 5
canperformclienttraces(param_00)
{
	if(level.disableclientspawntraces || isdefined(level.skipspawnsighttraces) && level.skipspawnsighttraces)
	{
		return 0;
	}

	if(!isdefined(level.var_1F11))
	{
		return 0;
	}

	if(isai(param_00) || function_0286(param_00))
	{
		return 0;
	}

	if(param_00 ishost())
	{
		if(getdvarint("enableS1TUSpawnSightTraces") > 0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 6
addstartspawnpoints(param_00)
{
	var_01 = getspawnpointarray(param_00);
	if(!var_01.size)
	{
		return;
	}

	if(!isdefined(level.startspawnpoints))
	{
		level.startspawnpoints = [];
	}

	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_01[var_02] spawnpointinit();
		var_01[var_02].selected = 0;
		level.startspawnpoints[level.startspawnpoints.size] = var_01[var_02];
	}

	foreach(var_04 in var_01)
	{
		var_04.infront = 1;
		var_05 = anglestoforward(var_04.var_41);
		foreach(var_07 in var_01)
		{
			if(var_04 == var_07)
			{
				continue;
			}

			var_08 = vectornormalize(var_07.var_2E6 - var_04.var_2E6);
			var_09 = vectordot(var_05,var_08);
			if(var_09 > 0.86)
			{
				var_04.infront = 0;
				break;
			}
		}
	}
}

//Function Number: 7
addspawnpoints(param_00,param_01)
{
	if(!isdefined(level.spawnpoints))
	{
		level.spawnpoints = [];
	}

	if(!isdefined(level.teamspawnpoints[param_00]))
	{
		level.teamspawnpoints[param_00] = [];
	}

	var_02 = [];
	var_02 = getspawnpointarray(param_01);
	if(!isdefined(level.var_1F11))
	{
		level.var_1F11 = param_01;
	}

	if(!var_02.size)
	{
		return;
	}

	foreach(var_04 in var_02)
	{
		if(!isdefined(var_04.inited))
		{
			var_04 spawnpointinit();
			level.spawnpoints[level.spawnpoints.size] = var_04;
		}

		level.teamspawnpoints[param_00][level.teamspawnpoints[param_00].size] = var_04;
	}
}

//Function Number: 8
spawnpointinit()
{
	var_00 = self;
	level.spawnmins = expandmins(level.spawnmins,var_00.var_2E6);
	level.spawnmaxs = expandmaxs(level.spawnmaxs,var_00.var_2E6);
	var_00.forward = anglestoforward(var_00.var_41);
	var_00.sighttracepoint = var_00.var_2E6 + (0,0,50);
	var_00.lastspawntime = gettime();
	var_00.outside = 1;
	var_00.inited = 1;
	var_00.alternates = [];
	var_01 = 1024;
	if(!bullettracepassed(var_00.sighttracepoint,var_00.sighttracepoint + (0,0,var_01),0,undefined))
	{
		var_02 = var_00.sighttracepoint + var_00.forward * 100;
		if(!bullettracepassed(var_02,var_02 + (0,0,var_01),0,undefined))
		{
			var_00.outside = 0;
		}
	}

	var_03 = anglestoright(var_00.var_41);
	addalternatespawnpoint(var_00,var_00.var_2E6 + var_03 * 45);
	addalternatespawnpoint(var_00,var_00.var_2E6 - var_03 * 45);
	initspawnpointvalues(var_00);
}

//Function Number: 9
addalternatespawnpoint(param_00,param_01)
{
	var_02 = playerphysicstrace(param_00.var_2E6,param_00.var_2E6 + (0,0,18));
	var_03 = var_02[2] - param_00.var_2E6[2];
	var_04 = (param_01[0],param_01[1],param_01[2] + var_03);
	var_05 = playerphysicstrace(var_02,var_04);
	if(var_05 != var_04)
	{
		return;
	}

	var_06 = function_024F(var_04);
	if(abs(var_06[2] - param_01[2]) > 128)
	{
		return;
	}

	param_00.alternates[param_00.alternates.size] = var_06;
}

//Function Number: 10
getspawnpointarray(param_00)
{
	if(!isdefined(level.spawnpointarray))
	{
		level.spawnpointarray = [];
	}

	if(!isdefined(level.spawnpointarray[param_00]))
	{
		level.spawnpointarray[param_00] = [];
		level.spawnpointarray[param_00] = getspawnarray(param_00);
		foreach(var_02 in level.spawnpointarray[param_00])
		{
			var_02.classname = param_00;
		}
	}

	return level.spawnpointarray[param_00];
}

//Function Number: 11
getspawnpoint_random(param_00)
{
	if(!isdefined(param_00))
	{
		return undefined;
	}

	var_01 = undefined;
	param_00 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns(param_00);
	param_00 = common_scripts\utility::array_randomize(param_00);
	foreach(var_03 in param_00)
	{
		var_01 = var_03;
		if(canspawn(var_01.var_2E6) && !positionwouldtelefrag(var_01.var_2E6))
		{
			break;
		}
	}

	return var_01;
}

//Function Number: 12
getspawnpoint_startspawn(param_00)
{
	if(!isdefined(param_00))
	{
		return undefined;
	}

	var_01 = undefined;
	param_00 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns(param_00);
	foreach(var_03 in param_00)
	{
		if(var_03.selected)
		{
			continue;
		}

		if(var_03.infront)
		{
			var_01 = var_03;
			break;
		}

		var_01 = var_03;
	}

	if(!isdefined(var_01))
	{
		var_01 = getspawnpoint_random(param_00);
	}

	var_01.selected = 1;
	return var_01;
}

//Function Number: 13
getspawnpoint_nearteam(param_00,param_01)
{
	wait(5);
}

//Function Number: 14
trackgrenades()
{
	for(;;)
	{
		level.grenades = getentarray("grenade","classname");
		wait(0.05);
	}
}

//Function Number: 15
trackmissiles()
{
	for(;;)
	{
		level.missiles = getentarray("rocket","classname");
		wait(0.05);
	}
}

//Function Number: 16
trackcarepackages()
{
	for(;;)
	{
		level.carepackages = getentarray("care_package","targetname");
		wait(0.05);
	}
}

//Function Number: 17
getteamspawnpoints(param_00)
{
	return level.teamspawnpoints[param_00];
}

//Function Number: 18
ispathdataavailable()
{
	if(!isdefined(level.pathdataavailable))
	{
		var_00 = getallnodes();
		level.pathdataavailable = isdefined(var_00) && var_00.size > 150;
	}

	return level.pathdataavailable;
}

//Function Number: 19
addtoparticipantsarray()
{
	if(isdefined(level.var_511A) && level.var_511A)
	{
		level notify("participant_added",self);
	}

	level.participants[level.participants.size] = self;
}

//Function Number: 20
removefromparticipantsarray()
{
	var_00 = 0;
	for(var_01 = 0;var_01 < level.participants.size;var_01++)
	{
		if(level.participants[var_01] == self)
		{
			var_00 = 1;
			while(var_01 < level.participants.size - 1)
			{
				level.participants[var_01] = level.participants[var_01 + 1];
				var_01++;
			}

			level.participants[var_01] = undefined;
			break;
		}
	}
}

//Function Number: 21
addtocharactersarray()
{
	level.characters[level.characters.size] = self;
}

//Function Number: 22
removefromcharactersarray()
{
	var_00 = 0;
	for(var_01 = 0;var_01 < level.characters.size;var_01++)
	{
		if(level.characters[var_01] == self)
		{
			var_00 = 1;
			while(var_01 < level.characters.size - 1)
			{
				level.characters[var_01] = level.characters[var_01 + 1];
				var_01++;
			}

			level.characters[var_01] = undefined;
			break;
		}
	}
}

//Function Number: 23
spawnpointupdate()
{
	while(!isdefined(level.spawnpoints) || level.spawnpoints.size == 0)
	{
		wait(0.05);
	}

	level thread spawnpointsightupdate();
	level thread spawnpointdistanceupdate();
	for(;;)
	{
		level.disableclientspawntraces = getdvarint("scr_disableClientSpawnTraces") > 0;
		wait(0.05);
	}
}

//Function Number: 24
getactiveplayerlist()
{
	var_00 = [];
	level.var_719 = 0;
	var_01 = level.gametype;
	var_02 = 0;
	if(var_01 == "dm" || var_01 == "gun")
	{
		var_02 = 1;
	}

	foreach(var_04 in level.characters)
	{
		if(isplayer(var_04) && var_02 && var_04.sessionstate == "playing" || var_04.sessionstate == "dead")
		{
			level.var_719++;
		}

		if(!maps\mp\_utility::isreallyalive(var_04))
		{
			continue;
		}

		if(isplayer(var_04) && var_04.sessionstate != "playing")
		{
			continue;
		}

		var_04.var_89E7 = getspawnteam(var_04);
		if(var_04.var_89E7 == "spectator")
		{
			continue;
		}

		if(isagent(var_04) && var_04.agent_type == "dog")
		{
			var_04.var_89E8 = getplayertraceheight(var_04,1);
			var_04.spawnlogictraceheight = var_04.var_2E6 + (0,0,var_04.var_89E8);
		}
		else if(!var_04.canperformclienttraces)
		{
			var_05 = "";
			if(var_04 maps\mp\_utility::isusingremote())
			{
				var_05 = var_04 maps\mp\_utility::getremotename();
			}

			if(!var_05 == "orbitalsupport" || var_05 == "Warbird")
			{
				var_06 = getplayertraceheight(var_04);
				var_07 = var_04 geteye();
				var_07 = (var_07[0],var_07[1],var_04.var_2E6[2] + var_06);
				var_04.var_89E8 = var_06;
				var_04.spawnlogictraceheight = var_07;
			}
		}

		var_00[var_00.size] = var_04;
	}

	return var_00;
}

//Function Number: 25
spawnpointsightupdate()
{
	if(isdefined(level.skipspawnsighttraces) && level.skipspawnsighttraces)
	{
		return;
	}

	var_00 = 18;
	var_01 = 0;
	var_02 = 0;
	var_03 = 0;
	var_04 = 3;
	var_05 = getdvarint("enableS1TUSpawnSightTraces");
	var_06 = function_02DD();
	var_07 = getactiveplayerlist();
	for(;;)
	{
		if(var_02)
		{
			wait(0.05);
			var_01 = 0;
			var_02 = 0;
			var_07 = getactiveplayerlist();
		}

		var_08 = getdvarint("enableS1TUSpawnSightTraces");
		if(var_08)
		{
			level.spawnsighttracesused_posts1tu = 1;
		}
		else
		{
			level.spawnsighttracesused_pres1tu = 1;
		}

		if(var_08 != var_05)
		{
			foreach(var_0A in level.participants)
			{
				var_0A.canperformclienttraces = canperformclienttraces(var_0A);
				if(var_0A.canperformclienttraces)
				{
					var_0A setclientspawnsighttraces(level.var_1F11);
					continue;
				}

				var_0A setclientspawnsighttraces();
			}

			var_05 = var_08;
		}

		var_0D = level.spawnpoints;
		var_0D = maps\mp\gametypes\_spawnscoring::checkdynamicspawns(var_0D);
		var_02 = 1;
		foreach(var_0F in var_0D)
		{
			var_0F.var_5606 = gettime();
			clearspawnpointsightdata(var_0F);
			foreach(var_0A in var_07)
			{
				if(!isdefined(var_0A.var_89E8) || !isdefined(var_0A.spawnlogictraceheight))
				{
					var_0A.var_89E8 = getplayertraceheight(var_0A);
					var_11 = var_0A.var_2E6;
					var_0A.spawnlogictraceheight = (var_11[0],var_11[1],var_11[2] + var_0A.var_89E8);
				}

				if(var_0F.fullsights[var_0A.var_89E7])
				{
					continue;
				}

				if(var_0A.canperformclienttraces)
				{
					var_12 = var_0A clientspawnsighttracepassed(var_0F.index);
				}
				else
				{
					if(var_08)
					{
						if(var_03 % 3 == 1)
						{
							var_13 = (0,0,0);
						}
						else
						{
							var_13 = (randomfloatrange(-16,16),randomfloatrange(-16,16),0);
						}

						var_14 = var_0F.var_2E6 + var_13;
						var_14 = var_14 + (0,0,var_03 % 3 * 36);
						var_15 = var_0A.spawnlogictraceheight + var_13;
					}
					else
					{
						var_14 = var_0A.var_2E6 + (0,0,var_16.var_89E8);
						var_15 = var_12.spawnlogictraceheight;
					}

					var_12 = spawnsighttrace(var_0F,var_14,var_15,var_0F.index);
					var_01++;
				}

				if(var_08)
				{
					var_16 = var_0A getentitynumber();
					if(!isdefined(var_0F.fullsightdelay) || !isdefined(var_0F.fullsightdelay[var_16]))
					{
						var_0F.fullsightdelay[var_16] = 0;
					}

					if(!isdefined(var_0F.cornersightdelay) || !isdefined(var_0F.cornersightdelay[var_16]))
					{
						var_0F.cornersightdelay[var_16] = 0;
					}
				}
				else
				{
					var_16 = 0;
				}

				if(!var_12)
				{
					if(var_08)
					{
						if(var_0F.fullsightdelay[var_16])
						{
							var_0F.fullsightdelay[var_16]--;
						}

						if(var_0F.cornersightdelay[var_16])
						{
							var_0F.cornersightdelay[var_16]--;
						}

						if(var_0F.fullsightdelay[var_16])
						{
							var_0F.fullsights[var_0A.var_89E7]++;
						}
						else if(var_0F.cornersightdelay[var_16])
						{
							var_0F.cornersights[var_0A.var_89E7]++;
						}
					}

					continue;
				}

				if(var_12 > 0.95)
				{
					if(var_08)
					{
						var_0F.fullsightdelay[var_16] = var_04;
						if(var_0F.cornersightdelay[var_16])
						{
							var_0F.cornersightdelay[var_16]--;
						}
					}

					var_0F.fullsights[var_0A.var_89E7]++;
					continue;
				}

				if(level.var_719 > 8)
				{
					continue;
				}

				if(var_08)
				{
					if(var_0F.fullsightdelay[var_16])
					{
						var_0F.fullsightdelay[var_16]--;
					}

					var_0F.cornersightdelay[var_16] = var_04;
					if(var_0F.fullsightdelay[var_16])
					{
						var_0F.fullsights[var_0A.var_89E7]++;
					}
					else
					{
						var_0F.cornersights[var_0A.var_89E7]++;
					}

					continue;
				}

				var_0F.cornersights[var_0A.var_89E7]++;
			}

			additionalsighttraceentities(var_0F,level.turrets);
			additionalsighttraceentities(var_0F,level.ugvs);
			if(shouldsighttracewait(var_00,var_01))
			{
				wait(0.05);
				var_01 = 0;
				var_02 = 0;
				var_07 = getactiveplayerlist();
			}
		}

		var_03++;
	}
}

//Function Number: 26
shouldsighttracewait(param_00,param_01)
{
	var_02 = 0;
	foreach(var_04 in level.participants)
	{
		if(!var_04.canperformclienttraces)
		{
			var_02++;
		}
	}

	if(param_01 + var_02 > param_00)
	{
		return 1;
	}

	return 0;
}

//Function Number: 27
spawnpointdistanceupdate()
{
	var_00 = getactiveplayerlist();
	var_01 = gettime();
	var_02 = 4;
	var_03 = 0;
	for(;;)
	{
		var_04 = level.spawnpoints;
		var_04 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns(var_04);
		var_05 = 0;
		foreach(var_07 in var_04)
		{
			clearspawnpointdistancedata(var_07);
			var_03++;
			foreach(var_09 in var_00)
			{
				if(var_09.var_89E7 == "spectator")
				{
					continue;
				}

				if(isdefined(level.spawndistanceteamskip) && var_09.var_89E7 == level.spawndistanceteamskip)
				{
					continue;
				}

				var_0A = distancesquared(var_09.var_2E6,var_07.var_2E6);
				if(var_0A < var_07.mindistsquared[var_09.var_89E7])
				{
					var_07.mindistsquared[var_09.var_89E7] = var_0A;
				}

				var_07.var_2B82[var_09.var_89E7] = var_07.var_2B82[var_09.var_89E7] + var_0A;
				var_07.totalplayers[var_09.var_89E7]++;
				if(var_0A < 1638400)
				{
					if(maps\mp\_utility::isreallyalive(var_09))
					{
						var_07.nearbyplayers[var_09.var_89E7]++;
					}
				}
			}

			if(var_03 == var_02)
			{
				var_05 = 1;
				wait(0.05);
				var_00 = getactiveplayerlist();
				var_01 = gettime();
				var_03 = 0;
			}
		}

		if(!var_05)
		{
			wait(0.05);
			var_00 = getactiveplayerlist();
			var_01 = gettime();
			var_03 = 0;
		}
	}
}

//Function Number: 28
getspawnteam(param_00)
{
	var_01 = "all";
	if(level.teambased)
	{
		var_01 = param_00.inliveplayerkillstreak;
	}

	return var_01;
}

//Function Number: 29
initspawnpointvalues(param_00)
{
	clearspawnpointsightdata(param_00);
	clearspawnpointdistancedata(param_00);
}

//Function Number: 30
clearspawnpointsightdata(param_00)
{
	if(level.teambased)
	{
		foreach(var_02 in level.teamnamelist)
		{
			clearteamspawnpointsightdata(param_00,var_02);
		}

		return;
	}

	clearteamspawnpointsightdata(param_00,"all");
}

//Function Number: 31
clearspawnpointdistancedata(param_00)
{
	if(level.teambased)
	{
		foreach(var_02 in level.teamnamelist)
		{
			clearteamspawnpointdistancedata(param_00,var_02);
		}

		return;
	}

	clearteamspawnpointdistancedata(param_00,"all");
}

//Function Number: 32
clearteamspawnpointsightdata(param_00,param_01)
{
	param_00.fullsights[param_01] = 0;
	param_00.cornersights[param_01] = 0;
}

//Function Number: 33
clearteamspawnpointdistancedata(param_00,param_01)
{
	param_00.var_2B82[param_01] = 0;
	param_00.mindistsquared[param_01] = 9999999;
	param_00.totalplayers[param_01] = 0;
	param_00.nearbyplayers[param_01] = 0;
}

//Function Number: 34
getplayertraceheight(param_00,param_01)
{
	if(isdefined(param_01) && param_01)
	{
		return 64;
	}

	var_02 = param_00 getstance();
	if(var_02 == "stand")
	{
		return 64;
	}

	if(var_02 == "crouch")
	{
		return 44;
	}

	return 32;
}

//Function Number: 35
additionalsighttraceentities(param_00,param_01)
{
	foreach(var_03 in param_01)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_04 = getspawnteam(var_03);
		if(param_00.fullsights[var_04])
		{
			continue;
		}

		var_05 = spawnsighttrace(param_00,param_00.sighttracepoint,var_03.var_2E6 + (0,0,50),param_00.index);
		if(!var_05)
		{
			continue;
		}

		if(var_05 > 0.95)
		{
			param_00.fullsights[var_04]++;
			continue;
		}

		param_00.cornersights[var_04]++;
	}
}

//Function Number: 36
finalizespawnpointchoice(param_00)
{
	var_01 = gettime();
	self.lastspawnpoint = param_00;
	self.lastspawntime = var_01;
	param_00.lastspawntime = var_01;
	param_00.lastspawnteam = self.inliveplayerkillstreak;
}

//Function Number: 37
expandspawnpointbounds(param_00)
{
	var_01 = getspawnpointarray(param_00);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		level.spawnmins = expandmins(level.spawnmins,var_01[var_02].var_2E6);
		level.spawnmaxs = expandmaxs(level.spawnmaxs,var_01[var_02].var_2E6);
	}
}

//Function Number: 38
expandmins(param_00,param_01)
{
	if(param_00[0] > param_01[0])
	{
		param_00 = (param_01[0],param_00[1],param_00[2]);
	}

	if(param_00[1] > param_01[1])
	{
		param_00 = (param_00[0],param_01[1],param_00[2]);
	}

	if(param_00[2] > param_01[2])
	{
		param_00 = (param_00[0],param_00[1],param_01[2]);
	}

	return param_00;
}

//Function Number: 39
expandmaxs(param_00,param_01)
{
	if(param_00[0] < param_01[0])
	{
		param_00 = (param_01[0],param_00[1],param_00[2]);
	}

	if(param_00[1] < param_01[1])
	{
		param_00 = (param_00[0],param_01[1],param_00[2]);
	}

	if(param_00[2] < param_01[2])
	{
		param_00 = (param_00[0],param_00[1],param_01[2]);
	}

	return param_00;
}

//Function Number: 40
findboxcenter(param_00,param_01)
{
	var_02 = (0,0,0);
	var_02 = param_01 - param_00;
	var_02 = (var_02[0] / 2,var_02[1] / 2,var_02[2] / 2) + param_00;
	return var_02;
}

//Function Number: 41
setmapcenterfordev()
{
	level.spawnmins = (0,0,0);
	level.spawnmaxs = (0,0,0);
	expandspawnpointbounds("mp_tdm_spawn_allies_start");
	expandspawnpointbounds("mp_tdm_spawn_axis_start");
	level.var_5983 = findboxcenter(level.spawnmins,level.spawnmaxs);
	setmapcenter(level.var_5983);
}

//Function Number: 42
shoulduseteamstartspawn()
{
	return level.ingraceperiod && !isdefined(level.numkills) || level.numkills == 0;
}

//Function Number: 43
recon_set_spawnpoint(param_00)
{
	if(!isdefined(self.var_89DE))
	{
		self.var_89DE = spawnstruct();
	}

	if(isdefined(self.var_89DE.var_126D) && self.var_89DE.var_126D)
	{
		if(!isdefined(self.var_89DE.pastbadspawns))
		{
			self.var_89DE.pastbadspawns = [];
			self.var_89DE.pastbadspawncount = 0;
		}

		self.var_89DE.pastbadspawns[self.var_89DE.pastbadspawncount] = self.var_89DE.var_89F7;
		self.var_89DE.pastbadspawncount++;
	}
	else
	{
		self.var_89DE.pastbadspawns = [];
		self.var_89DE.pastbadspawncount = 0;
	}

	self.var_89DE.var_89F7 = param_00;
}