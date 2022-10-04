/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42830.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:18:22 PM
*******************************************************************/

//Function Number: 1
lib_A74E::processlobbyscoreboards()
{
	foreach(var_01 in level.placement["all"])
	{
		var_01 lib_A74E::setplayerscoreboardinfo();
	}

	if(level.multiteambased)
	{
		lib_A74E::buildscoreboardtype("multiteam");
		foreach(var_01 in level.var_328)
		{
			var_01 setcommonplayerdata("round","scoreboardType","multiteam");
		}

		setclientmatchdata("alliesScore",-1);
		setclientmatchdata("axisScore",-1);
	}
	else if(level.teambased)
	{
		var_05 = getteamscore("allies");
		var_06 = getteamscore("axis");
		if(var_05 == var_06)
		{
			var_07 = "tied";
		}
		else if(var_06 > var_07)
		{
			var_07 = "allies";
		}
		else
		{
			var_07 = "axis";
		}

		setclientmatchdata("alliesScore",var_05);
		setclientmatchdata("axisScore",var_06);
		if(var_07 == "tied")
		{
			lib_A74E::buildscoreboardtype("allies");
			lib_A74E::buildscoreboardtype("axis");
			foreach(var_01 in level.var_328)
			{
				var_09 = var_01.connectedpostgame["team"];
				if(!isdefined(var_09))
				{
					continue;
				}

				if(var_09 == "spectator")
				{
					var_01 setcommonplayerdata("round","scoreboardType","allies");
					continue;
				}

				var_01 setcommonplayerdata("round","scoreboardType",var_09);
			}
		}
		else
		{
			lib_A74E::buildscoreboardtype(var_07);
			foreach(var_01 in level.var_328)
			{
				var_01 setcommonplayerdata("round","scoreboardType",var_07);
			}
		}
	}
	else
	{
		lib_A74E::buildscoreboardtype("neutral");
		foreach(var_01 in level.var_328)
		{
			var_01 setcommonplayerdata("round","scoreboardType","neutral");
		}

		setclientmatchdata("alliesScore",-1);
		setclientmatchdata("axisScore",-1);
	}

	foreach(var_01 in level.var_328)
	{
		var_10 = 0;
		if(!var_01 maps\mp\_utility::rankingenabled() || maps\mp\_utility::practiceroundgame())
		{
			var_10 = var_01.connectedpostgame["summary"]["xp"];
		}
		else
		{
			var_10 = var_01 method_8507() - var_01.connectedpostgame["summary"]["matchStartXp"];
		}

		var_01 setcommonplayerdata("round","totalXp",var_10);
		var_01 setcommonplayerdata("round","scoreXp",var_01.connectedpostgame["summary"]["score"]);
		var_01 setcommonplayerdata("round","challengeXp",var_01.connectedpostgame["summary"]["challenge"]);
		var_01 setcommonplayerdata("round","matchXp",var_01.connectedpostgame["summary"]["match"]);
		var_01 setcommonplayerdata("round","miscXp",var_01.connectedpostgame["summary"]["misc"]);
		var_01 setcommonplayerdata("round","entitlementXp",var_01.connectedpostgame["summary"]["entitlementXP"]);
		var_01 setcommonplayerdata("round","clanWarsXp",var_01.connectedpostgame["summary"]["clanWarsXP"]);
	}
}

//Function Number: 2
lib_A74E::setplayerscoreboardinfo()
{
	var_00 = getclientmatchdata("scoreboardPlayerCount");
	if(var_00 <= 24)
	{
		setclientmatchdata("players",self.clientmatchdataid,"score",self.connectedpostgame["score"]);
		var_01 = self.connectedpostgame["kills"];
		setclientmatchdata("players",self.clientmatchdataid,"kills",var_01);
		if(level.gametype == "ctf" || level.gametype == "sr" || level.gametype == "gun")
		{
			var_02 = self.assists;
		}
		else
		{
			var_02 = self.connectedpostgame["assists"];
		}

		setclientmatchdata("players",self.clientmatchdataid,"assists",var_02);
		var_03 = self.connectedpostgame["deaths"];
		setclientmatchdata("players",self.clientmatchdataid,"deaths",var_03);
		var_04 = self.connectedpostgame["headshots"];
		setclientmatchdata("players",self.clientmatchdataid,"headshots",var_04);
		var_05 = self.connectedpostgame["team"];
		setclientmatchdata("players",self.clientmatchdataid,"team",var_05);
		var_06 = game[self.connectedpostgame["team"]];
		setclientmatchdata("players",self.clientmatchdataid,"faction",var_06);
		var_07 = self.connectedpostgame["extrascore0"];
		setclientmatchdata("players",self.clientmatchdataid,"extrascore0",var_07);
		var_08 = self.connectedpostgame["extrascore1"];
		setclientmatchdata("players",self.clientmatchdataid,"extrascore1",var_08);
		var_09 = 0;
		if(isdefined(self.connectedpostgame["division"]) && isdefined(self.connectedpostgame["division"]["index"]))
		{
			var_09 = self.connectedpostgame["division"]["index"];
		}

		setclientmatchdata("players",self.clientmatchdataid,"division",var_09);
		var_00++;
		setclientmatchdata("scoreboardPlayerCount",var_00);
	}
}

//Function Number: 3
lib_A74E::buildscoreboardtype(param_00)
{
	if(param_00 == "multiteam")
	{
		var_01 = 0;
		foreach(var_03 in level.teamnamelist)
		{
			foreach(var_05 in level.placement[var_03])
			{
				setclientmatchdata("scoreboards","multiteam",var_01,var_05.clientmatchdataid);
				var_01++;
			}
		}

		return;
	}

	if(var_05 == "neutral")
	{
		var_01 = 0;
		foreach(var_05 in level.placement["all"])
		{
			setclientmatchdata("scoreboards",param_00,var_01,var_05.clientmatchdataid);
			var_01++;
		}

		return;
	}

	var_0A = maps\mp\_utility::getotherteam(var_05);
	var_01 = 0;
	foreach(var_05 in level.placement[param_00])
	{
		setclientmatchdata("scoreboards",param_00,var_01,var_05.clientmatchdataid);
		var_01++;
	}

	foreach(var_05 in level.placement[var_0A])
	{
		setclientmatchdata("scoreboards",param_00,var_01,var_05.clientmatchdataid);
		var_01++;
	}
}