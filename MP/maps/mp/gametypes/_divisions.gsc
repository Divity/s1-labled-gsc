/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _divisions - 42886.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 26
 * Decompile Time: 1659 ms
 * Timestamp: 4/20/2022 8:13:49 PM
*******************************************************************/

//Function Number: 1
checkforseason1start()
{
	if(!isvalidplayer())
	{
		return;
	}

	if(isdefined(level.iszombiegame) && level.iszombiegame)
	{
		return;
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		return;
	}

	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(isdefined(self.connectedpostgame["division"]) && isdefined(self.connectedpostgame["division"]["seasonStart"]))
	{
		return;
	}

	var_00 = self getrankedplayerdata("currentSeason");
	var_01 = getdvarint("scr_game_season");
	if(var_01 > 0 && var_00 == 0)
	{
		self setrankedplayerdata("division",0);
		self setrankedplayerdata("mmr",-31768);
		self setrankedplayerdata("divisionRelegationCounter",0);
		self setrankedplayerdata("divisionChallengePlayed",0);
		self setrankedplayerdata("divisionChallengeWon",0);
		self setcommonplayerdata("round","matchPrediction",0);
		self setcommonplayerdata("round","matchDp",0);
		self setrankedplayerdata("currentSeason",var_01);
		self.connectedpostgame["division"]["seasonStart"] = 1;
	}
}

//Function Number: 2
init()
{
	if(maps\mp\_utility::invirtuallobby())
	{
		return;
	}

	if(getdvarint("scr_game_division") == 1)
	{
		level.teammmr["allies"] = 0;
		level.teammmr["axis"] = 0;
		thread onrankedmatchstart();
		thread onmatchend();
		return;
	}

	thread onnonrankedmatchstart();
}

//Function Number: 3
isvalidplayer()
{
	return !isbot(self) && !isagent(self) && !function_0286(self);
}

//Function Number: 4
onnonrankedmatchstart()
{
	level endon("game_win");
	level endon("exitLevel_called");
	foreach(var_01 in level.var_328)
	{
		var_01 checkforseason1start();
		var_01 clearmatchprediction();
		var_01.connectedpostgame["division"]["index"] = 0;
	}

	for(;;)
	{
		level waittill("connected",var_01);
		var_01 checkforseason1start();
		var_01 clearmatchprediction();
		var_01.connectedpostgame["division"]["index"] = 0;
	}
}

//Function Number: 5
onrankedmatchstart()
{
	level endon("game_win");
	level endon("exitLevel_called");
	foreach(var_01 in level.var_328)
	{
		var_01 thread onplayerconnect();
	}

	for(;;)
	{
		level waittill("connected",var_01);
		var_01 thread onplayerconnect();
	}
}

//Function Number: 6
onplayerconnect()
{
	level endon("game_win");
	level endon("exitLevel_called");
	if(isvalidplayer())
	{
		checkforseason1start();
		initloss();
		self method_854F(self.connectedpostgame["division"]["init"]["dp"]);
	}
}

//Function Number: 7
onmatchend()
{
	level endon("exitLevel_called");
	for(;;)
	{
		level waittill("game_win",var_00);
		if(!isdefined(var_00) || var_00 != "axis" && var_00 != "allies" && var_00 != "tie")
		{
			continue;
		}

		calculateteammmrs();
		checkforfeit();
		foreach(var_02 in level.var_328)
		{
			if(!var_02 isvalidplayer())
			{
				continue;
			}

			var_02 calculatematchprediction();
			var_03 = var_02.connectedpostgame["division"]["init"]["dp"];
			if(var_02.connectedpostgame["division"]["wonByForfeit"] || var_02.inliveplayerkillstreak == var_00)
			{
				var_02 ondivisionwin(var_03);
			}
			else if(var_00 == "tie")
			{
				var_02 ondivisiontie(var_03);
			}
			else
			{
				var_02 ondivisionloss(var_03);
			}

			var_04 = var_02 getrankedplayerdata("division");
			var_02 setcommonplayerdata("round","matchDp",var_04 - var_03 + 128);
			var_02 setrankedplayerdatareservedint("rankedPlaylistLockTime",0);
		}

		break;
	}
}

//Function Number: 8
ondivisionwin(param_00)
{
	getdivisionpointrange(param_00);
	if(!isdefined(self.connectedpostgame["division"]["minDP"]))
	{
		return;
	}

	var_01 = getdivisionpointsdelta(self.connectedpostgame["division"]["matchPrediction"],"win");
	var_02 = self.connectedpostgame["division"]["init"]["deltaDP"];
	setplayermmr(var_01);
	savematchprediction("win");
	self.connectedpostgame["division"]["dp"] = param_00;
	if(self.connectedpostgame["division"]["minDP"] == param_00)
	{
		self setrankedplayerdata("divisionRelegationCounter",self.connectedpostgame["division"]["init"]["relegation"]);
	}

	if(isdefined(self.connectedpostgame["division"]["maxDP"]))
	{
		if(self.connectedpostgame["division"]["maxDP"] == param_00)
		{
			if(self.connectedpostgame["division"]["init"]["winBits"] > 0)
			{
				self setrankedplayerdata("division",param_00 + 1);
				self setrankedplayerdata("divisionRelegationCounter",0);
			}
			else
			{
				self setrankedplayerdata("division",param_00);
			}

			updatedivisionchallengestatus(1);
			return;
		}

		self setrankedplayerdata("division",int(min(float(self.connectedpostgame["division"]["maxDP"]),float(param_00 + var_01))));
		return;
	}

	self setrankedplayerdata("division",param_00 + var_01);
}

//Function Number: 9
ondivisionloss(param_00)
{
	getdivisionpointrange(param_00);
	if(!isdefined(self.connectedpostgame["division"]["minDP"]))
	{
		return;
	}

	var_01 = getdivisionpointsdelta(self.connectedpostgame["division"]["matchPrediction"],"loss");
	var_02 = self.connectedpostgame["division"]["init"]["deltaDP"];
	var_03 = var_01 - var_02;
	savematchprediction("loss");
	if(var_03 == 0)
	{
		return;
	}

	setplayermmr(var_01);
	if(isdefined(self.connectedpostgame["division"]["maxDP"]) && self.connectedpostgame["division"]["maxDP"] == param_00)
	{
		return;
	}

	if(self.connectedpostgame["division"]["minDP"] == param_00)
	{
		return;
	}

	self setrankedplayerdata("division",int(max(float(self.connectedpostgame["division"]["minDP"]),float(param_00 + var_01))));
}

//Function Number: 10
ondivisiontie(param_00)
{
	getdivisionpointrange(param_00);
	if(!isdefined(self.connectedpostgame["division"]["minDP"]))
	{
		return;
	}

	var_01 = getdivisionpointsdelta(self.connectedpostgame["division"]["matchPrediction"],"tie");
	var_02 = self.connectedpostgame["division"]["init"]["deltaDP"];
	var_03 = var_01 - var_02;
	savematchprediction("tie");
	if(var_03 == 0)
	{
		return;
	}

	setplayermmr(var_01);
	if(self.connectedpostgame["division"]["minDP"] == param_00)
	{
		self setrankedplayerdata("divisionRelegationCounter",self.connectedpostgame["division"]["init"]["relegation"]);
	}

	if(isdefined(self.connectedpostgame["division"]["maxDP"]))
	{
		if(self.connectedpostgame["division"]["maxDP"] == param_00)
		{
			self setrankedplayerdata("division",param_00);
			self setrankedplayerdata("divisionChallengePlayed",self.connectedpostgame["division"]["init"]["playBits"]);
			self setrankedplayerdata("divisionChallengeWon",self.connectedpostgame["division"]["init"]["winBits"]);
			return;
		}
		else if(var_01 > 0)
		{
			self setrankedplayerdata("division",int(min(float(self.connectedpostgame["division"]["maxDP"]),float(param_00 + var_01))));
			return;
		}
	}

	self setrankedplayerdata("division",int(max(float(self.connectedpostgame["division"]["minDP"]),float(param_00 + var_01))));
}

//Function Number: 11
initloss()
{
	if(isdefined(self.connectedpostgame["division"]) && isdefined(self.connectedpostgame["division"]["init"]))
	{
		return;
	}

	clearmatchprediction();
	var_00 = self getrankedplayerdata("division");
	var_01 = int(tablelookup("mp/divisiontable.csv",0,"forfeit",1));
	getdivisionchallengestatus();
	getmmr();
	if(self.connectedpostgame["division"]["wins"] >= 2 || self.connectedpostgame["division"]["losses"] >= 2)
	{
		cleardivisionchallengestatus();
	}

	if(self getrankedplayerdata("divisionRelegationCounter") >= 3)
	{
		self setrankedplayerdata("divisionRelegationCounter",0);
	}

	self.connectedpostgame["division"]["init"]["dp"] = var_00;
	self.connectedpostgame["division"]["init"]["deltaDP"] = var_01;
	self.connectedpostgame["division"]["init"]["relegation"] = self getrankedplayerdata("divisionRelegationCounter");
	self.connectedpostgame["division"]["init"]["playBits"] = self getrankedplayerdata("divisionChallengePlayed");
	self.connectedpostgame["division"]["init"]["winBits"] = self getrankedplayerdata("divisionChallengeWon");
	self.connectedpostgame["division"]["init"]["MMR"] = self.connectedpostgame["division"]["MMR"];
	thread updatelockouttime();
	self.connectedpostgame["division"]["dp"] = var_00;
	getdivisionpointrange(var_00);
	if(!isdefined(self.connectedpostgame["division"]["minDP"]))
	{
		return;
	}

	setplayermmr(var_01);
	if(isdefined(self.connectedpostgame["division"]["maxDP"]) && self.connectedpostgame["division"]["maxDP"] == var_00)
	{
		self.connectedpostgame["division"]["losses"]++;
		if(self.connectedpostgame["division"]["losses"] >= 2)
		{
			self setrankedplayerdata("division",self.connectedpostgame["division"]["minDP"] + getdivisionresetoffset());
		}
		else
		{
		}

		updatedivisionchallengestatus(0);
		return;
	}

	if(self.connectedpostgame["division"]["minDP"] == var_00)
	{
		if(self.connectedpostgame["division"]["minDP"] > 0)
		{
			var_02 = self.connectedpostgame["division"]["init"]["relegation"] + 1;
			if(var_02 >= 3)
			{
				getdivisionpointrange(var_00 - 1);
				self setrankedplayerdata("division",self.connectedpostgame["division"]["minDP"] + getdivisionresetoffset());
			}
			else
			{
			}

			self setrankedplayerdata("divisionRelegationCounter",var_02);
			return;
		}

		return;
	}

	self setrankedplayerdata("division",int(max(float(self.connectedpostgame["division"]["minDP"]),float(var_01 + var_02))));
}

//Function Number: 12
updatelockouttime()
{
	level endon("exitLevel_called");
	level endon("game_win");
	self endon("disconnect");
	for(;;)
	{
		if(function_0294(self))
		{
			break;
		}

		self setrankedplayerdatareservedint("rankedPlaylistLockTime",function_003E());
		wait(10);
	}
}

//Function Number: 13
getdivisionpointrange(param_00)
{
	var_01 = lookupsoundlength("mp/divisiontable.csv");
	var_02 = tablelookuprownum("mp/divisiontable.csv",0,"bronze");
	for(var_03 = var_02;var_03 < var_01;var_03++)
	{
		var_04 = tablelookupbyrow("mp/divisiontable.csv",var_03,2);
		if(!isdefined(var_04) || var_04 == "")
		{
			self.connectedpostgame["division"]["minDP"] = int(tablelookupbyrow("mp/divisiontable.csv",var_03,1));
			self.connectedpostgame["division"]["maxDP"] = undefined;
			self.connectedpostgame["division"]["index"] = var_03 - var_02;
			return;
		}

		var_05 = int(var_04);
		if(param_00 <= var_05)
		{
			self.connectedpostgame["division"]["minDP"] = int(tablelookupbyrow("mp/divisiontable.csv",var_03,1));
			self.connectedpostgame["division"]["maxDP"] = var_05;
			self.connectedpostgame["division"]["index"] = var_03 - var_02;
			return;
		}
	}

	self.connectedpostgame["division"]["minDP"] = undefined;
	self.connectedpostgame["division"]["maxDP"] = undefined;
}

//Function Number: 14
getdivisionchallengestatus()
{
	var_00 = self getrankedplayerdata("divisionChallengePlayed");
	var_01 = self getrankedplayerdata("divisionChallengeWon");
	var_02 = 0;
	var_03 = 0;
	for(var_04 = 0;var_04 < 3;var_04++)
	{
		if(var_00 >> var_04 & 1)
		{
			if(var_01 >> var_04 & 1)
			{
				var_02++;
			}
			else
			{
				var_03++;
			}

			continue;
		}

		break;
	}

	self.connectedpostgame["division"]["wins"] = var_02;
	self.connectedpostgame["division"]["losses"] = var_03;
}

//Function Number: 15
cleardivisionchallengestatus()
{
	self setrankedplayerdata("divisionChallengePlayed",0);
	self setrankedplayerdata("divisionChallengeWon",0);
	self.connectedpostgame["division"]["wins"] = 0;
	self.connectedpostgame["division"]["losses"] = 0;
}

//Function Number: 16
updatedivisionchallengestatus(param_00)
{
	var_01 = self.connectedpostgame["division"]["init"]["playBits"];
	var_02 = self.connectedpostgame["division"]["init"]["winBits"];
	var_01 = var_01 << 1 | 1;
	var_02 = var_02 << 1;
	if(param_00)
	{
		var_02 = var_02 | 1;
	}

	self setrankedplayerdata("divisionChallengePlayed",var_01);
	self setrankedplayerdata("divisionChallengeWon",var_02);
}

//Function Number: 17
getmmr()
{
	var_00 = self getrankedplayerdata("mmr");
	var_00 = var_00 - -32768;
	self.connectedpostgame["division"]["MMR"] = var_00;
}

//Function Number: 18
savemmr()
{
	var_00 = self.connectedpostgame["division"]["MMR"] + -32768;
	self setrankedplayerdata("mmr",var_00);
}

//Function Number: 19
savematchprediction(param_00)
{
	var_01 = 8;
	var_02 = self.connectedpostgame["division"]["matchPrediction"];
	if(var_02 == "win")
	{
		var_01 = var_01 | 1;
	}
	else if(var_02 == "loss")
	{
		var_01 = var_01 | 2;
	}

	if(param_00 == "win")
	{
		var_01 = var_01 | 16;
	}
	else if(param_00 == "loss")
	{
		var_01 = var_01 | 32;
	}

	self setcommonplayerdata("round","matchPrediction",var_01);
}

//Function Number: 20
clearmatchprediction()
{
	if(!isvalidplayer())
	{
		return;
	}

	self setcommonplayerdata("round","matchPrediction",0);
}

//Function Number: 21
calculateteammmrs()
{
	var_00["axis"] = 0;
	var_00["allies"] = 0;
	level.teammmr["axis"] = 0;
	level.teammmr["allies"] = 0;
	foreach(var_02 in level.var_328)
	{
		if(!var_02 isvalidplayer())
		{
			continue;
		}

		if(!isdefined(var_02.inliveplayerkillstreak) || var_02.inliveplayerkillstreak != "allies" && var_02.inliveplayerkillstreak != "axis")
		{
			continue;
		}

		if(!isdefined(var_02.connectedpostgame["division"]["init"]["MMR"]))
		{
			continue;
		}

		var_00[var_02.inliveplayerkillstreak]++;
		level.teammmr[var_02.inliveplayerkillstreak] = level.teammmr[var_02.inliveplayerkillstreak] + var_02.connectedpostgame["division"]["init"]["MMR"];
	}

	if(var_00["axis"] > 0)
	{
		level.teammmr["axis"] = level.teammmr["axis"] / var_00["axis"];
	}

	if(var_00["allies"] > 0)
	{
		level.teammmr["allies"] = level.teammmr["allies"] / var_00["allies"];
	}
}

//Function Number: 22
calculatematchprediction()
{
	if(!isdefined(self.connectedpostgame["division"]["init"]["MMR"]))
	{
		return;
	}

	var_00 = self.connectedpostgame["division"]["init"]["MMR"];
	var_01 = var_00;
	self.connectedpostgame["division"]["matchPrediction"] = "tie";
	if(!isdefined(self.inliveplayerkillstreak))
	{
		return;
	}
	else if(self.inliveplayerkillstreak == "axis")
	{
		var_01 = level.teammmr["allies"];
	}
	else if(self.inliveplayerkillstreak == "allies")
	{
		var_01 = level.teammmr["axis"];
	}
	else
	{
		return;
	}

	if(var_00 < var_01 - 25)
	{
		self.connectedpostgame["division"]["matchPrediction"] = "loss";
	}

	if(var_00 > var_01 + 25)
	{
		self.connectedpostgame["division"]["matchPrediction"] = "win";
	}
}

//Function Number: 23
getdivisionpointsdelta(param_00,param_01)
{
	var_02 = tablelookuprownum("mp/divisiontable.csv",0,param_00);
	if(param_01 == "win")
	{
		return int(tablelookupbyrow("mp/divisiontable.csv",var_02,1));
	}

	if(param_01 == "loss")
	{
		return int(tablelookupbyrow("mp/divisiontable.csv",var_02,3));
	}

	return int(tablelookupbyrow("mp/divisiontable.csv",var_02,2));
}

//Function Number: 24
getdivisionresetoffset()
{
	return int(tablelookup("mp/divisiontable.csv",0,"resetOffset",1));
}

//Function Number: 25
setplayermmr(param_00)
{
	if(!isdefined(self.connectedpostgame["division"]["init"]["MMR"]))
	{
		return;
	}

	var_01 = self.connectedpostgame["division"]["init"]["MMR"];
	if(param_00 < 0 && var_01 < 0 - param_00)
	{
		param_00 = 0 - var_01;
	}

	if(65535 - var_01 < param_00)
	{
		param_00 = 65535 - var_01;
	}

	var_01 = var_01 + param_00;
	self.connectedpostgame["division"]["MMR"] = var_01;
	savemmr();
}

//Function Number: 26
checkforfeit()
{
	var_00["allies"] = 0;
	var_00["axis"] = 0;
	foreach(var_02 in level.var_328)
	{
		if(isdefined(var_02.inliveplayerkillstreak) && isdefined(var_00[var_02.inliveplayerkillstreak]))
		{
			var_00[var_02.inliveplayerkillstreak]++;
		}
	}

	foreach(var_02 in level.var_328)
	{
		if(isdefined(var_02.inliveplayerkillstreak))
		{
			if(var_02.inliveplayerkillstreak == "allies" && var_00["axis"] == 0)
			{
				var_02.connectedpostgame["division"]["wonByForfeit"] = 1;
				continue;
			}

			if(var_02.inliveplayerkillstreak == "axis" && var_00["allies"] == 0)
			{
				var_02.connectedpostgame["division"]["wonByForfeit"] = 1;
				continue;
			}

			var_02.connectedpostgame["division"]["wonByForfeit"] = 0;
		}
	}
}