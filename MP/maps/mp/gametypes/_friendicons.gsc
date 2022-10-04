/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _friendicons - 42888.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 421 ms
 * Timestamp: 4/20/2022 8:13:51 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.drawfriend = 0;
	game["headicon_allies"] = maps\mp\gametypes\_teams::getteamheadicon("allies");
	game["headicon_axis"] = maps\mp\gametypes\_teams::getteamheadicon("axis");
	level thread onplayerconnect();
	for(;;)
	{
		updatefriendiconsettings();
		wait(5);
	}
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread onplayerspawned();
		var_00 thread onplayerkilled();
	}
}

//Function Number: 3
onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		thread showfriendicon();
	}
}

//Function Number: 4
onplayerkilled()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("killed_player");
		self.headicon = "";
	}
}

//Function Number: 5
showfriendicon()
{
	if(level.drawfriend)
	{
		if(self.connectedpostgame["team"] == "allies")
		{
			self.headicon = game["headicon_allies"];
			self.headiconteam = "allies";
			return;
		}

		self.headicon = game["headicon_axis"];
		self.headiconteam = "axis";
	}
}

//Function Number: 6
updatefriendiconsettings()
{
	var_00 = maps\mp\_utility::getintproperty("scr_drawfriend",level.drawfriend);
	if(level.drawfriend != var_00)
	{
		level.drawfriend = var_00;
		updatefriendicons();
	}
}

//Function Number: 7
updatefriendicons()
{
	var_00 = level.var_328;
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		if(isdefined(var_02.connectedpostgame["team"]) && var_02.connectedpostgame["team"] != "spectator" && var_02.sessionstate == "playing")
		{
			if(level.drawfriend)
			{
				if(var_02.connectedpostgame["team"] == "allies")
				{
					var_02.headicon = game["headicon_allies"];
					var_02.headiconteam = "allies";
				}
				else
				{
					var_02.headicon = game["headicon_axis"];
					var_02.headiconteam = "axis";
				}

				continue;
			}

			var_00 = level.var_328;
			for(var_01 = 0;var_01 < var_00.size;var_01++)
			{
				var_02 = var_00[var_01];
				if(isdefined(var_02.connectedpostgame["team"]) && var_02.connectedpostgame["team"] != "spectator" && var_02.sessionstate == "playing")
				{
					var_02.headicon = "";
				}
			}
		}
	}
}