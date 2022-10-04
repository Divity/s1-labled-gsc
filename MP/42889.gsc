/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42889.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 97
 * Decompile Time: 84 ms
 * Timestamp: 4/20/2022 8:18:26 PM
*******************************************************************/

//Function Number: 1
lib_A789::onforfeit(param_00)
{
	if(isdefined(level.forfeitinprogress))
	{
		return;
	}

	level endon("abort_forfeit");
	level thread lib_A789::forfeitwaitforabort();
	level.forfeitinprogress = 1;
	if(!level.teambased && level.var_328.size > 1)
	{
		wait(10);
	}
	else
	{
		wait(1.05);
	}

	level.forfeit_aborted = 0;
	var_01 = 20;
	lib_A789::matchforfeittimer(var_01);
	var_02 = &"";
	if(!isdefined(param_00))
	{
		level.finalkillcam_winner = "none";
		var_02 = game["end_reason"]["players_forfeited"];
		var_03 = level.var_328[0];
	}
	else if(var_01 == "axis")
	{
		level.finalkillcam_winner = "axis";
		var_03 = game["end_reason"]["allies_forfeited"];
		if(level.gametype == "infect")
		{
			var_03 = game["end_reason"]["survivors_forfeited"];
		}

		var_03 = "axis";
	}
	else if(var_01 == "allies")
	{
		level.finalkillcam_winner = "allies";
		var_03 = game["end_reason"]["axis_forfeited"];
		if(level.gametype == "infect")
		{
			var_03 = game["end_reason"]["infected_forfeited"];
		}

		var_03 = "allies";
	}
	else if(level.multiteambased && issubstr(var_01,"team_"))
	{
		var_03 = var_01;
	}
	else
	{
		level.finalkillcam_winner = "none";
		var_03 = "tie";
	}

	level.forcedend = 1;
	if(isplayer(var_03))
	{
		function_0196("forfeit, win: " + var_03 getxuid() + "(" + var_03.name + ")");
	}
	else
	{
		function_0196("forfeit, win: " + var_03 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
	}

	thread lib_A789::endgame(var_03,var_02);
}

//Function Number: 2
lib_A789::forfeitwaitforabort()
{
	level endon("game_ended");
	level waittill("abort_forfeit");
	level.forfeit_aborted = 1;
	setomnvar("ui_match_countdown",0);
	setomnvar("ui_match_countdown_title",0);
	setomnvar("ui_match_countdown_toggle",0);
}

//Function Number: 3
lib_A789::matchforfeittimer_internal(param_00)
{
	waittillframeend;
	level endon("match_forfeit_timer_beginning");
	setomnvar("ui_match_countdown_title",3);
	setomnvar("ui_match_countdown_toggle",1);
	while(param_00 > 0 && !level.gameended && !level.forfeit_aborted && !level.ingraceperiod)
	{
		setomnvar("ui_match_countdown",param_00);
		wait(1);
		param_00--;
	}
}

//Function Number: 4
lib_A789::matchforfeittimer(param_00)
{
	level notify("match_forfeit_timer_beginning");
	var_01 = int(param_00);
	lib_A789::matchforfeittimer_internal(var_01);
	setomnvar("ui_match_countdown",0);
	setomnvar("ui_match_countdown_title",0);
	setomnvar("ui_match_countdown_toggle",0);
}

//Function Number: 5
lib_A789::default_ondeadevent(param_00)
{
	level.finalkillcam_winner = "none";
	if(param_00 == "allies")
	{
		function_0196("team eliminated, win: opfor, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
		level.finalkillcam_winner = "axis";
		thread lib_A789::endgame("axis",game["end_reason"]["allies_eliminated"]);
		return;
	}

	if(param_00 == "axis")
	{
		function_0196("team eliminated, win: allies, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
		level.finalkillcam_winner = "allies";
		thread lib_A789::endgame("allies",game["end_reason"]["axis_eliminated"]);
		return;
	}

	function_0196("tie, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
	level.finalkillcam_winner = "none";
	if(level.teambased)
	{
		thread lib_A789::endgame("tie",game["end_reason"]["tie"]);
		return;
	}

	thread lib_A789::endgame(undefined,game["end_reason"]["tie"]);
}

//Function Number: 6
lib_A789::default_ononeleftevent(param_00)
{
	if(level.teambased)
	{
		var_01 = maps\mp\_utility::getlastlivingplayer(param_00);
		var_01 thread lib_A789::givelastonteamwarning();
	}
	else
	{
		var_01 = maps\mp\_utility::getlastlivingplayer();
		function_0196("last one alive, win: " + var_01.name);
		level.finalkillcam_winner = "none";
		thread lib_A789::endgame(var_01,game["end_reason"]["enemies_eliminated"]);
	}

	return 1;
}

//Function Number: 7
lib_A789::default_ontimelimit()
{
	var_00 = undefined;
	level.finalkillcam_winner = "none";
	if(level.teambased)
	{
		if(game["teamScores"]["allies"] == game["teamScores"]["axis"])
		{
			var_00 = "tie";
		}
		else if(game["teamScores"]["axis"] > game["teamScores"]["allies"])
		{
			level.finalkillcam_winner = "axis";
			var_00 = "axis";
		}
		else
		{
			level.finalkillcam_winner = "allies";
			var_00 = "allies";
		}

		if(maps\mp\_utility::practiceroundgame())
		{
			var_00 = "none";
		}

		function_0196("time limit, win: " + var_00 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
	}
	else
	{
		var_00 = maps\mp\gametypes\_gamescore::gethighestscoringplayer();
		if(isdefined(var_00))
		{
			function_0196("time limit, win: " + var_00.name);
		}
		else
		{
			function_0196("time limit, tie");
		}
	}

	thread lib_A789::endgame(var_00,game["end_reason"]["time_limit_reached"]);
}

//Function Number: 8
lib_A789::default_onhalftime(param_00)
{
	var_01 = undefined;
	level.finalkillcam_winner = "none";
	thread lib_A789::endgame("halftime",game["end_reason"][param_00]);
}

//Function Number: 9
lib_A789::forceend()
{
	if(level.hostforcedend || level.forcedend)
	{
		return;
	}

	var_00 = undefined;
	level.finalkillcam_winner = "none";
	if(level.teambased)
	{
		if(isdefined(level.var_511A))
		{
			var_00 = "axis";
		}
		else if(game["teamScores"]["allies"] == game["teamScores"]["axis"])
		{
			var_00 = "tie";
		}
		else if(game["teamScores"]["axis"] > game["teamScores"]["allies"])
		{
			level.finalkillcam_winner = "axis";
			var_00 = "axis";
		}
		else
		{
			level.finalkillcam_winner = "allies";
			var_00 = "allies";
		}

		function_0196("host ended game, win: " + var_00 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
	}
	else
	{
		var_00 = maps\mp\gametypes\_gamescore::gethighestscoringplayer();
		if(isdefined(var_00))
		{
			function_0196("host ended game, win: " + var_00.name);
		}
		else
		{
			function_0196("host ended game, tie");
		}
	}

	level.forcedend = 1;
	level.hostforcedend = 1;
	if(level.splitscreen)
	{
		var_01 = game["end_reason"]["ended_game"];
	}
	else
	{
		var_01 = game["end_reason"]["host_ended_game"];
	}

	thread lib_A789::endgame(var_00,var_01);
}

//Function Number: 10
lib_A789::onscorelimit()
{
	var_00 = game["end_reason"]["score_limit_reached"];
	var_01 = undefined;
	level.finalkillcam_winner = "none";
	if(level.multiteambased)
	{
		var_01 = maps\mp\gametypes\_gamescore::getwinningteam();
		if(var_01 == "none")
		{
			var_01 = "tie";
		}
	}
	else if(level.teambased)
	{
		if(game["teamScores"]["allies"] == game["teamScores"]["axis"])
		{
			var_01 = "tie";
		}
		else if(game["teamScores"]["axis"] > game["teamScores"]["allies"])
		{
			var_01 = "axis";
			level.finalkillcam_winner = "axis";
		}
		else
		{
			var_01 = "allies";
			level.finalkillcam_winner = "allies";
		}

		function_0196("scorelimit, win: " + var_01 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"]);
	}
	else
	{
		var_01 = maps\mp\gametypes\_gamescore::gethighestscoringplayer();
		if(isdefined(var_01))
		{
			function_0196("scorelimit, win: " + var_01.name);
		}
		else
		{
			function_0196("scorelimit, tie");
		}
	}

	thread lib_A789::endgame(var_01,var_00);
	return 1;
}

//Function Number: 11
lib_A789::updategameevents()
{
	if(maps\mp\_utility::matchmakinggame() && !level.ingraceperiod && !getdvarint("force_ranking") && !isdefined(level.disableforfeit) || !level.disableforfeit)
	{
		if(level.multiteambased)
		{
			var_00 = 0;
			var_01 = 0;
			for(var_02 = 0;var_02 < level.teamnamelist.size;var_02++)
			{
				var_00 = var_00 + level.teamcount[level.teamnamelist[var_02]];
				if(level.teamcount[level.teamnamelist[var_02]])
				{
					var_01 = var_01 + 1;
				}
			}

			for(var_02 = 0;var_02 < level.teamnamelist.size;var_02++)
			{
				if(var_00 == level.teamcount[level.teamnamelist[var_02]] && game["state"] == "playing")
				{
					thread lib_A789::onforfeit(level.teamnamelist[var_02]);
					return;
				}
			}

			if(var_01 > 1)
			{
				level.forfeitinprogress = undefined;
				level notify("abort_forfeit");
			}
		}
		else if(level.teambased)
		{
			if(level.teamcount["allies"] < 1 && level.teamcount["axis"] > 0 && game["state"] == "playing")
			{
				thread lib_A789::onforfeit("axis");
				return;
			}

			if(level.teamcount["axis"] < 1 && level.teamcount["allies"] > 0 && game["state"] == "playing")
			{
				thread lib_A789::onforfeit("allies");
				return;
			}

			if(level.teamcount["axis"] > 0 && level.teamcount["allies"] > 0)
			{
				level.forfeitinprogress = undefined;
				level notify("abort_forfeit");
			}
		}
		else
		{
			if(level.teamcount["allies"] + level.teamcount["axis"] == 1 && level.maxplayercount >= 1 && !getdvarint("virtualLobbyActive",0))
			{
				thread lib_A789::onforfeit();
				return;
			}

			if(level.teamcount["axis"] + level.teamcount["allies"] > 1)
			{
				level.forfeitinprogress = undefined;
				level notify("abort_forfeit");
			}
		}
	}

	if(!maps\mp\_utility::getgametypenumlives() && !isdefined(level.disablespawning) || !level.disablespawning)
	{
		return;
	}

	if(!maps\mp\_utility::gamehasstarted())
	{
		return;
	}

	if(level.ingraceperiod)
	{
		return;
	}

	if(level.multiteambased)
	{
		return;
	}

	if(level.teambased)
	{
		var_03["allies"] = level.livescount["allies"];
		var_03["axis"] = level.livescount["axis"];
		if(isdefined(level.disablespawning) && level.disablespawning)
		{
			var_03["allies"] = 0;
			var_03["axis"] = 0;
		}

		if(!level.alivecount["allies"] && !level.alivecount["axis"] && !var_03["allies"] && !var_03["axis"])
		{
			return [[ level.ondeadevent ]]("all");
		}

		if(!level.alivecount["allies"] && !var_03["allies"])
		{
			return [[ level.ondeadevent ]]("allies");
		}

		if(!level.alivecount["axis"] && !var_03["axis"])
		{
			return [[ level.ondeadevent ]]("axis");
		}

		var_04 = level.alivecount["allies"] == 1 && !var_03["allies"];
		var_05 = level.alivecount["axis"] == 1 && !var_03["axis"];
		if((var_04 || var_05) && !isdefined(level.bot_spawn_from_devgui_in_progress))
		{
			var_06 = undefined;
			if(var_04 && !isdefined(level.onelefttime["allies"]))
			{
				level.onelefttime["allies"] = gettime();
				var_07 = [[ level.ononeleftevent ]]("allies");
				if(isdefined(var_07))
				{
					if(!isdefined(var_06))
					{
						var_06 = var_07;
					}

					var_06 = var_06 || var_07;
				}
			}

			if(var_05 && !isdefined(level.onelefttime["axis"]))
			{
				level.onelefttime["axis"] = gettime();
				var_08 = [[ level.ononeleftevent ]]("axis");
				if(isdefined(var_08))
				{
					if(!isdefined(var_06))
					{
						var_06 = var_08;
					}

					var_06 = var_06 || var_08;
				}
			}

			return var_06;
		}

		return;
	}

	if(!level.alivecount["allies"] && !level.alivecount["axis"] && !level.livescount["allies"] && !level.livescount["axis"])
	{
		return [[ level.ondeadevent ]]("all");
	}

	var_09 = maps\mp\_utility::getpotentiallivingplayers();
	if(var_09.size == 1)
	{
		return [[ level.ononeleftevent ]]("all");
	}
}

//Function Number: 12
lib_A789::waittillfinalkillcamdone()
{
	if(!isdefined(level.finalkillcam_winner))
	{
		return 0;
	}

	level waittill("final_killcam_done");
	return 1;
}

//Function Number: 13
lib_A789::timelimitclock_intermission(param_00)
{
	setgameendtime(gettime() + int(param_00 * 1000));
	var_01 = spawn("script_origin",(0,0,0));
	var_01 hide();
	if(param_00 >= 10)
	{
		wait(param_00 - 10);
	}

	for(;;)
	{
		var_01 playsoundasmaster("ui_mp_timer_countdown");
		wait(1);
	}
}

//Function Number: 14
lib_A789::waitforplayers(param_00)
{
	var_01 = gettime();
	var_02 = var_01 + param_00 * 1000 - 200;
	if(param_00 > 5)
	{
		var_03 = gettime() + getdvarint("min_wait_for_players") * 1000;
	}
	else
	{
		var_03 = 0;
	}

	if(isdefined(level.iszombiegame) && level.iszombiegame)
	{
		var_04 = level.var_214B;
	}
	else
	{
		var_04 = level.var_214B / 3;
	}

	var_05 = 0;
	for(;;)
	{
		if(isdefined(game["roundsPlayed"]) && game["roundsPlayed"])
		{
			break;
		}

		var_06 = level.maxplayercount;
		var_07 = gettime();
		if((var_06 >= var_04 && var_07 > var_03) || var_07 > var_02)
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 15
lib_A789::prematchperiod()
{
	level endon("game_ended");
	level.var_214B = getdvarint("party_partyPlayerCountNum");
	if(level.prematchperiod > 0)
	{
		level.var_A03F = 1;
		lib_A789::matchstarttimerwaitforplayers();
		level.var_A03F = 0;
	}
	else
	{
		lib_A789::matchstarttimerskip();
	}

	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		level.var_328[var_00] maps\mp\_utility::freezecontrolswrapper(0);
		level.var_328[var_00] enableweapons();
		level.var_328[var_00] method_800C();
		var_01 = maps\mp\_utility::getobjectivehinttext(level.var_328[var_00].connectedpostgame["team"]);
		if(!isdefined(var_01) || !level.var_328[var_00].afk)
		{
			continue;
		}

		level.var_328[var_00] thread maps\mp\gametypes\_hud_message::hintmessage(var_01);
	}

	if(game["state"] != "playing")
	{
	}
}

//Function Number: 16
lib_A789::graceperiod()
{
	level endon("game_ended");
	if(!isdefined(game["clientActive"]))
	{
		while(getactiveclientcount() == 0)
		{
			wait(0.05);
		}

		game["clientActive"] = 1;
	}

	while(level.ingraceperiod > 0)
	{
		wait(1);
		level.ingraceperiod--;
	}

	level notify("grace_period_ending");
	wait(0.05);
	maps\mp\_utility::gameflagset("graceperiod_done");
	level.ingraceperiod = 0;
	if(game["state"] != "playing")
	{
		return;
	}

	level thread lib_A789::updategameevents();
}

//Function Number: 17
lib_A789::sethasdonecombat(param_00,param_01)
{
	param_00.hasdonecombat = param_01;
	param_00 notify("hasDoneCombat");
	var_02 = !isdefined(param_00.hasdoneanycombat) || !param_00.hasdoneanycombat;
	if(var_02 && param_01)
	{
		param_00.hasdoneanycombat = 1;
		param_00.connectedpostgame["participation"] = 1;
		if(isdefined(param_00.connectedpostgame["hasMatchLoss"]) && param_00.connectedpostgame["hasMatchLoss"])
		{
			return;
		}

		lib_A789::updatelossstats(param_00);
	}
}

//Function Number: 18
lib_A789::updatewinstats(param_00)
{
	if(!param_00 maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if((!isdefined(param_00.hasdoneanycombat) || !param_00.hasdoneanycombat) && !level.gametype == "infect")
	{
		return;
	}

	param_00 maps\mp\gametypes\_persistance::func_8D4A("losses",-1);
	param_00 maps\mp\gametypes\_persistance::func_8D4A("wins",1);
	param_00 maps\mp\_utility::updatepersratio("winLossRatio","wins","losses");
	param_00 maps\mp\gametypes\_persistance::func_8D4A("currentWinStreak",1);
	var_01 = param_00 maps\mp\gametypes\_persistance::func_8D62("currentWinStreak");
	if(var_01 > param_00 maps\mp\gametypes\_persistance::func_8D62("winStreak"))
	{
		param_00 maps\mp\gametypes\_persistance::func_8D72("winStreak",var_01);
	}

	param_00 maps\mp\gametypes\_persistance::func_8D74("round","win",1);
	param_00 maps\mp\gametypes\_persistance::func_8D74("round","loss",0);
	param_00 maps\mp\gametypes\_missions::processchallenge("ch_" + level.gametype + "_wins");
	param_00.combatrecordwin = 1;
	param_00 maps\mp\gametypes\_missions::processchallengedaily(25,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(26,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(27,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(28,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(29,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(30,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(36,undefined,undefined);
	param_00 maps\mp\gametypes\_missions::processchallengedaily(37,undefined,undefined);
	if(maps\mp\_utility::isgrapplinghookgamemode())
	{
		param_00 maps\mp\gametypes\_missions::processchallenge("ch_tier2_4_iw5_dlcgun12");
	}

	if(level.var_328.size > 5)
	{
		lib_A789::superstarchallenge(param_00);
		switch(level.gametype)
		{
			case "war":
				break;

			case "hp":
				break;

			case "conf":
				break;

			case "ball":
				break;

			case "infect":
				break;

			case "dm":
				break;

			case "gun":
				break;

			case "twar":
			case "ctf":
				break;
		}
	}
}

//Function Number: 19
lib_A789::superstarchallenge(param_00)
{
	var_01 = 0;
	var_02 = 9999;
	foreach(var_04 in level.var_328)
	{
		if(var_04.kills > var_01)
		{
			var_01 = var_04.kills;
		}

		if(var_04.deaths < var_02)
		{
			var_02 = var_04.deaths;
		}
	}

	if(param_00.kills >= var_01 && param_00.deaths <= var_02 && param_00.kills > 0 && !isai(param_00))
	{
		param_00 maps\mp\gametypes\_missions::processchallenge("ch_" + level.gametype + "_star");
	}
}

//Function Number: 20
lib_A789::checkgameendchallenges()
{
	if(level.gametype == "dom")
	{
		var_00 = level.domflags;
		var_06 = getfirstarraykey(var_00);
		if(isdefined(var_06))
		{
			var_01 = var_00[var_06];
			if(!isdefined(var_01.ownedtheentireround) || !var_01.ownedtheentireround)
			{
				continue;
			}

			var_02 = var_01 maps\mp\gametypes\_gameobjects::getownerteam();
			var_03 = level.var_328;
			var_05 = getfirstarraykey(var_03);
			if(isdefined(var_05))
			{
				var_04 = var_03[var_05];
				if(var_04.inliveplayerkillstreak != var_02)
				{
					continue;
				}

				switch(var_01.label)
				{
					case "_a":
						break;

					case "_b":
						break;

					case "_c":
						break;
				}
			}
		}
	}
}

//Function Number: 21
lib_A789::updatelossstats(param_00)
{
	if(!param_00 maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(!isdefined(param_00.hasdoneanycombat) || !param_00.hasdoneanycombat)
	{
		return;
	}

	param_00.connectedpostgame["hasMatchLoss"] = 1;
	param_00 maps\mp\gametypes\_persistance::func_8D4A("losses",1);
	param_00 maps\mp\_utility::updatepersratio("winLossRatio","wins","losses");
	param_00 maps\mp\gametypes\_persistance::func_8D74("round","loss",1);
}

//Function Number: 22
lib_A789::updatetiestats(param_00)
{
	if(!param_00 maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(!isdefined(param_00.hasdoneanycombat) || !param_00.hasdoneanycombat)
	{
		return;
	}

	param_00 maps\mp\gametypes\_persistance::func_8D4A("losses",-1);
	param_00 maps\mp\gametypes\_persistance::func_8D4A("ties",1);
	param_00 maps\mp\_utility::updatepersratio("winLossRatio","wins","losses");
	param_00 maps\mp\gametypes\_persistance::func_8D72("currentWinStreak",0);
	param_00.combatrecordtie = 1;
}

//Function Number: 23
lib_A789::updatewinlossstats(param_00)
{
	if(maps\mp\_utility::privatematch())
	{
		return;
	}

	if(maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	if(!isdefined(param_00) || isdefined(param_00) && isstring(param_00) && param_00 == "tie")
	{
		foreach(var_02 in level.var_328)
		{
			if(isdefined(var_02.var_214A))
			{
				continue;
			}

			if(level.hostforcedend && var_02 ishost())
			{
				var_02 maps\mp\gametypes\_persistance::func_8D72("currentWinStreak",0);
				continue;
			}

			lib_A789::updatetiestats(var_02);
		}
	}
	else if(isplayer(param_00))
	{
		var_04[0] = param_00;
		if(level.var_328.size > 5)
		{
			var_04 = maps\mp\gametypes\_gamescore::gethighestscoringplayersarray(3);
		}

		foreach(var_02 in var_04)
		{
			if(isdefined(var_02.var_214A))
			{
				continue;
			}

			if(level.hostforcedend && var_02 ishost())
			{
				var_02 maps\mp\gametypes\_persistance::func_8D72("currentWinStreak",0);
				continue;
			}

			lib_A789::updatewinstats(var_02);
		}
	}
	else if(isstring(param_00))
	{
		foreach(var_02 in level.var_328)
		{
			if(isdefined(var_02.var_214A))
			{
				continue;
			}

			if(level.hostforcedend && var_02 ishost())
			{
				var_02 maps\mp\gametypes\_persistance::func_8D72("currentWinStreak",0);
				continue;
			}

			if(param_00 == "tie")
			{
				lib_A789::updatetiestats(var_02);
				continue;
			}

			if(var_02.connectedpostgame["team"] == param_00)
			{
				lib_A789::updatewinstats(var_02);
				continue;
			}

			var_02 maps\mp\gametypes\_persistance::func_8D72("currentWinStreak",0);
		}
	}

	if(level.var_328.size > 5)
	{
		var_04 = maps\mp\gametypes\_gamescore::gethighestscoringplayersarray(3);
		for(var_09 = 0;var_09 < var_04.size;var_09++)
		{
			if(var_09 == 0)
			{
				var_04[var_09] maps\mp\gametypes\_missions::processchallenge("ch_" + level.gametype + "_mvp");
			}

			var_04[var_09] maps\mp\gametypes\_missions::processchallenge("ch_" + level.gametype + "_superior");
		}
	}
}

//Function Number: 24
lib_A789::freezeplayerforroundend(param_00)
{
	self endon("disconnect");
	maps\mp\_utility::clearlowermessages();
	if(!isdefined(param_00))
	{
		param_00 = 0.05;
	}

	self method_8325();
	self closeingamemenu();
	wait(param_00);
	maps\mp\_utility::freezecontrolswrapper(1);
}

//Function Number: 25
lib_A789::updatematchbonusscores(param_00)
{
	if(!game["timePassed"])
	{
		return;
	}

	if(!maps\mp\_utility::matchmakinggame())
	{
		return;
	}

	if(maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	if(level.teambased)
	{
		if(param_00 == "allies")
		{
			var_01 = "allies";
			var_02 = "axis";
		}
		else if(var_02 == "axis")
		{
			var_01 = "axis";
			var_02 = "allies";
		}
		else
		{
			var_01 = "tie";
			var_02 = "tie";
		}

		if(var_01 != "tie")
		{
			setwinningteam(var_01);
		}

		foreach(var_04 in level.var_328)
		{
			if(isdefined(var_04.var_214A))
			{
				continue;
			}

			if(!var_04 maps\mp\_utility::rankingenabled())
			{
				continue;
			}

			if(var_04.timeplayed["total"] < 1 || var_04.connectedpostgame["participation"] < 1)
			{
				continue;
			}

			if(level.hostforcedend && var_04 ishost())
			{
				continue;
			}

			var_05 = 0;
			if(var_01 == "tie")
			{
				var_05 = maps\mp\gametypes\_rank::getscoreinfovalue("tie");
				var_04.var_2A4E = 1;
				var_04.var_5207 = 0;
			}
			else if(isdefined(var_04.connectedpostgame["team"]) && var_04.connectedpostgame["team"] == var_01)
			{
				var_05 = maps\mp\gametypes\_rank::getscoreinfovalue("win");
				var_04.var_5207 = 1;
			}
			else if(isdefined(var_04.connectedpostgame["team"]) && var_04.connectedpostgame["team"] == var_02)
			{
				var_05 = maps\mp\gametypes\_rank::getscoreinfovalue("loss");
				var_04.var_5207 = 0;
			}

			var_04.var_59DC = int(var_05);
		}
	}
	else
	{
		foreach(var_04 in level.var_328)
		{
			if(isdefined(var_04.var_214A))
			{
				continue;
			}

			if(!var_04 maps\mp\_utility::rankingenabled())
			{
				continue;
			}

			if(var_04.timeplayed["total"] < 1 || var_04.connectedpostgame["participation"] < 1)
			{
				continue;
			}

			if(level.hostforcedend && var_04 ishost())
			{
				continue;
			}

			var_04.var_5207 = 0;
			for(var_08 = 0;var_08 < min(level.placement["all"].size,3);var_08++)
			{
				if(level.placement["all"][var_08] != var_04)
				{
					continue;
				}

				var_04.var_5207 = 1;
			}

			var_05 = 0;
			if(var_04.var_5207)
			{
				var_05 = maps\mp\gametypes\_rank::getscoreinfovalue("win");
			}
			else
			{
				var_05 = maps\mp\gametypes\_rank::getscoreinfovalue("loss");
			}

			var_04.var_59DC = int(var_05);
		}
	}

	foreach(var_04 in level.var_328)
	{
		if(!isdefined(var_04))
		{
			continue;
		}

		if(!isdefined(var_04.var_5207))
		{
			continue;
		}

		var_0B = "loss";
		if(var_04.var_5207)
		{
			var_0B = "win";
		}

		if(isdefined(var_04.var_2A4E) && var_04.var_2A4E)
		{
			var_0B = "tie";
		}

		var_04 thread lib_A789::givematchbonus(var_0B,var_04.var_59DC);
	}
}

//Function Number: 26
lib_A789::givematchbonus(param_00,param_01)
{
	self endon("disconnect");
	level waittill("give_match_bonus");
	maps\mp\gametypes\_rank::giverankxp(param_00,param_01);
	maps\mp\_utility::logxpgains();
}

//Function Number: 27
lib_A789::setxenonranks(param_00)
{
	var_01 = level.var_328;
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		if(!isdefined(var_03.score) || !isdefined(var_03.connectedpostgame["team"]))
		{
			continue;
		}
	}

	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		if(!isdefined(var_03.score) || !isdefined(var_03.connectedpostgame["team"]))
		{
			continue;
		}

		var_04 = var_03.score;
		if(maps\mp\_utility::getminutespassed())
		{
			var_04 = var_03.score / maps\mp\_utility::getminutespassed();
		}

		setplayerteamrank(var_03,var_03.clientid,int(var_04));
	}
}

//Function Number: 28
lib_A789::checktimelimit(param_00)
{
	if(isdefined(level.timelimitoverride) && level.timelimitoverride)
	{
		return;
	}

	if(game["state"] != "playing")
	{
		setgameendtime(0);
		return;
	}

	if(maps\mp\_utility::gettimelimit() <= 0)
	{
		if(isdefined(level.starttime))
		{
			setgameendtime(level.starttime);
		}
		else
		{
			setgameendtime(0);
		}

		return;
	}

	if(!maps\mp\_utility::gameflag("prematch_done"))
	{
		setgameendtime(0);
		return;
	}

	if(!isdefined(level.starttime))
	{
		return;
	}

	if(maps\mp\_utility::gettimepassedpercentage() > level.timepercentagecutoff)
	{
		setnojiptime(1);
	}

	var_01 = lib_A789::gettimeremaining();
	if(maps\mp\_utility::gethalftime() && game["status"] != "halftime")
	{
		setgameendtime(gettime() + int(var_01) - int(maps\mp\_utility::gettimelimit() * 60 * 1000 * 0.5));
	}
	else
	{
		setgameendtime(gettime() + int(var_01));
	}

	if(var_01 > 0)
	{
		if(maps\mp\_utility::gethalftime() && lib_A789::checkhalftime(param_00))
		{
			[[ level.onhalftime ]]("time_limit_reached");
		}

		return;
	}

	[[ level.ontimelimit ]]();
}

//Function Number: 29
lib_A789::checkhalftimescore()
{
	if(!level.halftimeonscorelimit)
	{
		return 0;
	}

	if(!level.teambased)
	{
		return 0;
	}

	if(game["status"] != "normal")
	{
		return 0;
	}

	var_00 = maps\mp\_utility::getwatcheddvar("scorelimit");
	if(var_00)
	{
		if(game["teamScores"]["allies"] >= var_00 || game["teamScores"]["axis"] >= var_00)
		{
			return 0;
		}

		var_01 = int(var_00 / 2 + 0.5);
		if(game["teamScores"]["allies"] >= var_01 || game["teamScores"]["axis"] >= var_01)
		{
			game["roundMillisecondsAlreadyPassed"] = maps\mp\_utility::gettimepassed();
			game["round_time_to_beat"] = maps\mp\_utility::getminutespassed();
			return 1;
		}
	}

	return 0;
}

//Function Number: 30
lib_A789::checkhalftime(param_00)
{
	if(!level.teambased)
	{
		return 0;
	}

	if(game["status"] != "normal")
	{
		return 0;
	}

	if(maps\mp\_utility::gettimelimit())
	{
		var_01 = maps\mp\_utility::gettimelimit() * 60 * 1000 * 0.5;
		if(maps\mp\_utility::gettimepassed() >= var_01 && param_00 < var_01 && param_00 > 0)
		{
			game["roundMillisecondsAlreadyPassed"] = maps\mp\_utility::gettimepassed();
			return 1;
		}
	}

	return 0;
}

//Function Number: 31
lib_A789::gettimeremaining()
{
	var_00 = maps\mp\_utility::gettimepassed();
	var_01 = maps\mp\_utility::gettimelimit() * 60 * 1000;
	if(maps\mp\_utility::gethalftime() && game["status"] == "halftime" && isdefined(level.firsthalftimepassed))
	{
		var_02 = var_01 * 0.5;
		if(level.firsthalftimepassed < var_02)
		{
			if(level.halftimeonscorelimit)
			{
				var_00 = var_01 - level.firsthalftimepassed + var_00 - level.firsthalftimepassed;
			}
			else
			{
				var_00 = var_00 + var_02 - level.firsthalftimepassed;
			}
		}
	}

	return var_01 - var_00;
}

//Function Number: 32
lib_A789::checkteamscorelimitsoon(param_00)
{
	if(maps\mp\_utility::getwatcheddvar("scorelimit") <= 0 || maps\mp\_utility::isobjectivebased())
	{
		return;
	}

	if(isdefined(level.scorelimitoverride) && level.scorelimitoverride)
	{
		return;
	}

	if(level.gametype == "conf")
	{
		return;
	}

	if(!level.teambased)
	{
		return;
	}

	if(maps\mp\_utility::gettimepassed() < 60000)
	{
		return;
	}

	var_01 = lib_A789::estimatedtimetillscorelimit(param_00);
	if(var_01 < 2)
	{
		level notify("match_ending_soon","score");
	}
}

//Function Number: 33
lib_A789::checkplayerscorelimitsoon()
{
	if(maps\mp\_utility::getwatcheddvar("scorelimit") <= 0 || maps\mp\_utility::isobjectivebased())
	{
		return;
	}

	if(level.teambased)
	{
		return;
	}

	if(maps\mp\_utility::gettimepassed() < 60000)
	{
		return;
	}

	var_00 = lib_A789::estimatedtimetillscorelimit();
	if(var_00 < 2)
	{
		level notify("match_ending_soon","score");
	}
}

//Function Number: 34
lib_A789::checkscorelimit()
{
	if(maps\mp\_utility::isobjectivebased())
	{
		return 0;
	}

	if(isdefined(level.scorelimitoverride) && level.scorelimitoverride)
	{
		return 0;
	}

	if(game["state"] != "playing")
	{
		return 0;
	}

	if(maps\mp\_utility::getwatcheddvar("scorelimit") <= 0)
	{
		return 0;
	}

	if(maps\mp\_utility::gethalftime() && lib_A789::checkhalftimescore())
	{
		return [[ level.onhalftime ]]("score_limit_reached");
	}
	else if(level.multiteambased)
	{
		var_00 = 0;
		for(var_01 = 0;var_01 < level.teamnamelist.size;var_01++)
		{
			if(game["teamScores"][level.teamnamelist[var_01]] >= maps\mp\_utility::getwatcheddvar("scorelimit"))
			{
				var_00 = 1;
			}
		}

		if(!var_00)
		{
			return 0;
		}
	}
	else if(level.teambased)
	{
		if(game["teamScores"]["allies"] < maps\mp\_utility::getwatcheddvar("scorelimit") && game["teamScores"]["axis"] < maps\mp\_utility::getwatcheddvar("scorelimit"))
		{
			return 0;
		}
	}
	else
	{
		if(!isplayer(self))
		{
			return 0;
		}

		if(self.score < maps\mp\_utility::getwatcheddvar("scorelimit"))
		{
			return 0;
		}
	}

	return lib_A789::onscorelimit();
}

//Function Number: 35
lib_A789::updategametypedvars()
{
	level endon("game_ended");
	while(game["state"] == "playing")
	{
		if(isdefined(level.starttime))
		{
			if(lib_A789::gettimeremaining() < 3000)
			{
				wait(0.1);
				continue;
			}
		}

		wait(1);
	}
}

//Function Number: 36
lib_A789::matchstarttimerwaitforplayers()
{
	setomnvar("ui_match_countdown_title",6);
	setomnvar("ui_match_countdown_toggle",0);
	if(level.currentgen)
	{
		setomnvar("ui_cg_world_blur",1);
	}

	lib_A789::waitforplayers(level.prematchperiod);
	if(level.prematchperiodend > 0 && !isdefined(level.hostmigrationtimer))
	{
		lib_A789::matchstarttimer(level.prematchperiodend);
	}
}

//Function Number: 37
lib_A789::matchstarttimer_internal(param_00)
{
	waittillframeend;
	level endon("match_start_timer_beginning");
	setomnvar("ui_match_countdown_title",1);
	setomnvar("ui_match_countdown_toggle",1);
	while(param_00 > 0 && !level.gameended)
	{
		setomnvar("ui_match_countdown",param_00);
		param_00--;
		if(level.currentgen)
		{
			setomnvar("ui_cg_world_blur",1);
		}

		wait(1);
	}

	if(level.currentgen)
	{
		setomnvar("ui_cg_world_blur_fade_out",1);
	}

	if(level.xpscale > 1 && !isdefined(level.var_511A) && level.var_511A && !maps\mp\_utility::privatematch() && !maps\mp\_utility::practiceroundgame() && !isdefined(level.iszombiegame) && level.iszombiegame)
	{
		foreach(var_02 in level.var_328)
		{
			var_02 thread maps\mp\gametypes\_hud_message::splashnotify("double_xp");
		}
	}

	setomnvar("ui_match_countdown_toggle",0);
	setomnvar("ui_match_countdown",0);
	setomnvar("ui_match_countdown_title",2);
	level endon("match_forfeit_timer_beginning");
	wait(1.5);
	setomnvar("ui_match_countdown_title",0);
}

//Function Number: 38
lib_A789::matchstarttimer(param_00)
{
	self notify("matchStartTimer");
	self endon("matchStartTimer");
	level notify("match_start_timer_beginning");
	var_01 = int(param_00);
	if(var_01 >= 2)
	{
		lib_A789::matchstarttimer_internal(var_01);
		visionsetnaked("",3);
		return;
	}

	if(level.currentgen)
	{
		setomnvar("ui_cg_world_blur_fade_out",1);
	}

	if(level.xpscale > 1 && !isdefined(level.var_511A) && level.var_511A && !maps\mp\_utility::privatematch() && !maps\mp\_utility::practiceroundgame() && !isdefined(level.iszombiegame) && level.iszombiegame)
	{
		foreach(var_03 in level.var_328)
		{
			var_03 thread maps\mp\gametypes\_hud_message::splashnotify("double_xp");
		}
	}

	visionsetnaked("",1);
}

//Function Number: 39
lib_A789::matchstarttimerskip()
{
	visionsetnaked("",0);
}

//Function Number: 40
lib_A789::onroundswitch()
{
	if(!isdefined(game["switchedsides"]))
	{
		game["switchedsides"] = 0;
	}

	if(game["roundsWon"]["allies"] == maps\mp\_utility::getwatcheddvar("winlimit") - 1 && game["roundsWon"]["axis"] == maps\mp\_utility::getwatcheddvar("winlimit") - 1)
	{
		var_00 = lib_A789::getbetterteam();
		if(var_00 != game["defenders"])
		{
			game["switchedsides"] = !game["switchedsides"];
		}

		level.halftimetype = "overtime";
		game["dynamicEvent_Overtime"] = 1;
		return;
	}

	level.halftimetype = "halftime";
	game["switchedsides"] = !game["switchedsides"];
}

//Function Number: 41
lib_A789::checkroundswitch()
{
	if(!level.teambased)
	{
		return 0;
	}

	if(!isdefined(level.roundswitch) || !level.roundswitch)
	{
		return 0;
	}

	if(game["roundsPlayed"] % level.roundswitch == 0)
	{
		lib_A789::onroundswitch();
		return 1;
	}

	return 0;
}

//Function Number: 42
lib_A789::timeuntilroundend()
{
	if(level.gameended)
	{
		var_00 = gettime() - level.gameendtime / 1000;
		var_01 = level.postroundtime - var_00;
		if(var_01 < 0)
		{
			return 0;
		}

		return var_01;
	}

	if(maps\mp\_utility::gettimelimit() <= 0)
	{
		return undefined;
	}

	if(!isdefined(level.starttime))
	{
		return undefined;
	}

	var_02 = maps\mp\_utility::gettimelimit();
	var_00 = gettime() - level.starttime / 1000;
	var_01 = maps\mp\_utility::gettimelimit() * 60 - var_02;
	if(isdefined(level.timepaused))
	{
		var_02 = var_02 + level.timepaused;
	}

	return var_02 + level.postroundtime;
}

//Function Number: 43
lib_A789::freegameplayhudelems()
{
	if(isdefined(self.perkicon))
	{
		if(isdefined(self.perkicon[0]))
		{
			self.perkicon[0] maps\mp\gametypes\_hud_util::destroyelem();
			self.perkname[0] maps\mp\gametypes\_hud_util::destroyelem();
		}

		if(isdefined(self.perkicon[1]))
		{
			self.perkicon[1] maps\mp\gametypes\_hud_util::destroyelem();
			self.perkname[1] maps\mp\gametypes\_hud_util::destroyelem();
		}

		if(isdefined(self.perkicon[2]))
		{
			self.perkicon[2] maps\mp\gametypes\_hud_util::destroyelem();
			self.perkname[2] maps\mp\gametypes\_hud_util::destroyelem();
		}
	}

	self notify("perks_hidden");
	self.lowermessage maps\mp\gametypes\_hud_util::destroyelem();
	self.lowertimer maps\mp\gametypes\_hud_util::destroyelem();
	if(isdefined(self.proxbar))
	{
		self.proxbar maps\mp\gametypes\_hud_util::destroyelem();
	}

	if(isdefined(self.proxbartext))
	{
		self.proxbartext maps\mp\gametypes\_hud_util::destroyelem();
	}
}

//Function Number: 44
lib_A789::gethostplayer()
{
	var_00 = getentarray("player","classname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(var_00[var_01] ishost())
		{
			return var_00[var_01];
		}
	}
}

//Function Number: 45
lib_A789::hostidledout()
{
	var_00 = lib_A789::gethostplayer();
	if(isdefined(var_00) && !var_00.afk && !isdefined(var_00.selectedclass))
	{
		return 1;
	}

	return 0;
}

//Function Number: 46
lib_A789::roundendwait(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		var_03 maps\mp\gametypes\_damage::streamfinalkillcam();
	}

	var_05 = 0;
	while(!var_05)
	{
		var_06 = level.var_328;
		var_05 = 1;
		foreach(var_03 in var_06)
		{
			if(!isdefined(var_03.doingsplash))
			{
				continue;
			}

			if(!var_03 maps\mp\gametypes\_hud_message::isdoingsplash())
			{
				continue;
			}

			var_05 = 0;
		}

		wait(0.5);
	}

	if(!param_01)
	{
		wait(param_00);
		var_06 = level.var_328;
		foreach(var_03 in var_06)
		{
			var_03 setclientomnvar("ui_round_end",0);
		}

		level notify("round_end_finished");
		return;
	}

	wait(var_02 / 2);
	level notify("give_match_bonus");
	wait(var_02 / 2);
	var_07 = 0;
	while(!var_07)
	{
		var_08 = level.var_328;
		var_07 = 1;
		foreach(var_05 in var_08)
		{
			if(!isdefined(var_05.doingsplash))
			{
				continue;
			}

			if(!var_05 maps\mp\gametypes\_hud_message::isdoingsplash())
			{
				continue;
			}

			var_07 = 0;
		}

		wait(0.5);
	}

	var_08 = level.var_328;
	foreach(var_05 in var_08)
	{
		var_05 setclientomnvar("ui_round_end",0);
	}

	level notify("round_end_finished");
}

//Function Number: 47
lib_A789::roundenddof(param_00)
{
	self setdepthoffield(0,128,512,4000,6,1.8);
}

//Function Number: 48
lib_A789::callback_startgametype()
{
	maps\mp\_load::main();
	maps\mp\_utility::levelflaginit("round_over",0);
	maps\mp\_utility::levelflaginit("game_over",0);
	maps\mp\_utility::levelflaginit("block_notifies",0);
	level.prematchperiod = 0;
	level.prematchperiodend = 0;
	level.var_6E86 = 0;
	level.intermission = 0;
	setdvar("bg_compassShowEnemies",getdvar("scr_game_forceuav"));
	if(!isdefined(game["gamestarted"]))
	{
		game["clientid"] = 0;
		var_00 = getmapcustomfield("allieschar");
		if(!isdefined(var_00) || var_00 == "")
		{
			if(!isdefined(game["allies"]))
			{
				var_00 = "sentinel";
			}
			else
			{
				var_00 = game["allies"];
			}
		}

		var_01 = getmapcustomfield("axischar");
		if(!isdefined(var_01) || var_01 == "")
		{
			if(!isdefined(game["axis"]))
			{
				var_01 = "atlas";
			}
			else
			{
				var_01 = game["axis"];
			}
		}

		if(level.multiteambased)
		{
			var_02 = getmapcustomfield("allieschar");
			if(!isdefined(var_02) || var_02 == "")
			{
				var_02 = "delta_multicam";
			}

			for(var_03 = 0;var_03 < level.teamnamelist.size;var_03++)
			{
				game[level.teamnamelist[var_03]] = var_02;
			}
		}

		game["allies"] = var_00;
		game["axis"] = var_01;
		if(!isdefined(game["attackers"]) || !isdefined(game["defenders"]))
		{
			thread common_scripts\utility::error("No attackers or defenders team defined in level .gsc.");
		}

		if(!isdefined(game["attackers"]))
		{
			game["attackers"] = "allies";
		}

		if(!isdefined(game["defenders"]))
		{
			game["defenders"] = "axis";
		}

		if(!isdefined(game["state"]))
		{
			game["state"] = "playing";
		}

		if(level.teambased)
		{
			game["strings"]["waiting_for_teams"] = &"MP_WAITING_FOR_TEAMS";
			game["strings"]["opponent_forfeiting_in"] = &"MP_OPPONENT_FORFEITING_IN";
		}
		else
		{
			game["strings"]["waiting_for_teams"] = &"MP_WAITING_FOR_MORE_PLAYERS";
			game["strings"]["opponent_forfeiting_in"] = &"MP_OPPONENT_FORFEITING_IN";
		}

		game["strings"]["press_to_spawn"] = &"PLATFORM_PRESS_TO_SPAWN";
		game["strings"]["match_starting_in"] = &"MP_MATCH_STARTING_IN";
		game["strings"]["match_resuming_in"] = &"MP_MATCH_RESUMING_IN";
		game["strings"]["waiting_for_players"] = &"MP_WAITING_FOR_PLAYERS";
		game["strings"]["spawn_tag_wait"] = &"MP_SPAWN_TAG_WAIT";
		game["strings"]["spawn_next_round"] = &"MP_SPAWN_NEXT_ROUND";
		game["strings"]["waiting_to_spawn"] = &"MP_WAITING_TO_SPAWN";
		game["strings"]["match_starting"] = &"MP_MATCH_STARTING";
		game["strings"]["change_class"] = &"MP_CHANGE_CLASS_NEXT_SPAWN";
		game["strings"]["change_class_cancel"] = &"MP_CHANGE_CLASS_CANCEL";
		game["strings"]["change_class_wait"] = &"MP_CHANGE_CLASS_WAIT";
		game["strings"]["last_stand"] = &"MPUI_LAST_STAND";
		game["strings"]["final_stand"] = &"MPUI_FINAL_STAND";
		game["strings"]["cowards_way"] = &"PLATFORM_COWARDS_WAY_OUT";
		game["colors"]["blue"] = (0.25,0.25,0.75);
		game["colors"]["red"] = (0.75,0.25,0.25);
		game["colors"]["white"] = (1,1,1);
		game["colors"]["black"] = (0,0,0);
		game["colors"]["grey"] = (0.5,0.5,0.5);
		game["colors"]["green"] = (0.25,0.75,0.25);
		game["colors"]["yellow"] = (0.65,0.65,0);
		game["colors"]["orange"] = (1,0.45,0);
		game["colors"]["cyan"] = (0.35,0.7,0.9);
		game["strings"]["allies_name"] = maps\mp\gametypes\_teams::getteamname("allies");
		game["icons"]["allies"] = maps\mp\gametypes\_teams::getteamicon("allies");
		game["colors"]["allies"] = maps\mp\gametypes\_teams::getteamcolor("allies");
		game["strings"]["axis_name"] = maps\mp\gametypes\_teams::getteamname("axis");
		game["icons"]["axis"] = maps\mp\gametypes\_teams::getteamicon("axis");
		game["colors"]["axis"] = maps\mp\gametypes\_teams::getteamcolor("axis");
		if(game["colors"]["allies"] == (0,0,0))
		{
			game["colors"]["allies"] = (0.5,0.5,0.5);
		}

		if(game["colors"]["axis"] == (0,0,0))
		{
			game["colors"]["axis"] = (0.5,0.5,0.5);
		}

		[[ level.onprecachegametype ]]();
		setdvarifuninitialized("min_wait_for_players",5);
		if(level.console)
		{
			if(!level.splitscreen)
			{
				if(isdedicatedserver())
				{
					level.prematchperiod = maps\mp\gametypes\_tweakables::gettweakablevalue("game","graceperiod_ds");
				}
				else
				{
					level.prematchperiod = maps\mp\gametypes\_tweakables::gettweakablevalue("game","graceperiod");
				}

				level.prematchperiodend = maps\mp\gametypes\_tweakables::gettweakablevalue("game","matchstarttime");
			}
		}
		else
		{
			if(isdedicatedserver())
			{
				level.prematchperiod = maps\mp\gametypes\_tweakables::gettweakablevalue("game","playerwaittime_ds");
			}
			else
			{
				level.prematchperiod = maps\mp\gametypes\_tweakables::gettweakablevalue("game","playerwaittime");
			}

			level.prematchperiodend = maps\mp\gametypes\_tweakables::gettweakablevalue("game","matchstarttime");
		}
	}
	else
	{
		setdvarifuninitialized("min_wait_for_players",5);
		if(level.console)
		{
			if(!level.splitscreen)
			{
				level.prematchperiod = 5;
				level.prematchperiodend = maps\mp\gametypes\_tweakables::gettweakablevalue("game","roundstarttime");
			}
		}
		else
		{
			level.prematchperiod = 5;
			level.prematchperiodend = maps\mp\gametypes\_tweakables::gettweakablevalue("game","roundstarttime");
		}
	}

	if(!isdefined(game["status"]))
	{
		game["status"] = "normal";
	}

	if(game["status"] != "overtime" && game["status"] != "halftime" && game["status"] != "overtime_halftime")
	{
		game["teamScores"]["allies"] = 0;
		game["teamScores"]["axis"] = 0;
		if(level.multiteambased)
		{
			for(var_03 = 0;var_03 < level.teamnamelist.size;var_03++)
			{
				game["teamScores"][level.teamnamelist[var_03]] = 0;
			}
		}
	}

	if(!isdefined(game["timePassed"]))
	{
		game["timePassed"] = 0;
	}

	if(!isdefined(game["roundsPlayed"]))
	{
		game["roundsPlayed"] = 0;
	}

	setomnvar("ui_current_round",game["roundsPlayed"] + 1);
	if(!isdefined(game["roundsWon"]))
	{
		game["roundsWon"] = [];
	}

	if(level.teambased)
	{
		if(!isdefined(game["roundsWon"]["axis"]))
		{
			game["roundsWon"]["axis"] = 0;
		}

		if(!isdefined(game["roundsWon"]["allies"]))
		{
			game["roundsWon"]["allies"] = 0;
		}

		if(level.multiteambased)
		{
			for(var_03 = 0;var_03 < level.teamnamelist.size;var_03++)
			{
				if(!isdefined(game["roundsWon"][level.teamnamelist[var_03]]))
				{
					game["roundsWon"][level.teamnamelist[var_03]] = 0;
				}
			}
		}
	}

	level.gameended = 0;
	level.forcedend = 0;
	level.hostforcedend = 0;
	level.hardcoremode = getdvarint("g_hardcore");
	if(level.hardcoremode)
	{
		function_0196("game mode: hardcore");
	}

	level.diehardmode = getdvarint("scr_diehard");
	if(!level.teambased)
	{
		level.diehardmode = 0;
	}

	if(level.diehardmode)
	{
		function_0196("game mode: diehard");
	}

	level.killstreakrewards = getdvarint("scr_game_hardpoints");
	if(!isdefined(level.iszombiegame))
	{
		level.iszombiegame = 0;
	}

	level.usestartspawns = 1;
	level.objectivepointsmod = 1;
	level.baseplayermovescale = 1;
	level.maxallowedteamkills = 2;
	thread maps\mp\_teleport::main();
	thread maps\mp\gametypes\_persistance::init();
	thread maps\mp\gametypes\_menus::init();
	thread maps\mp\gametypes\_hud::init();
	thread maps\mp\gametypes\_serversettings::init();
	thread maps\mp\gametypes\_teams::init();
	thread maps\mp\gametypes\_weapons::init();
	thread maps\mp\gametypes\_killcam::init();
	thread maps\mp\gametypes\_shellshock::init();
	thread maps\mp\gametypes\_deathicons::init();
	thread maps\mp\gametypes\_damagefeedback::init();
	thread maps\mp\gametypes\_healthoverlay::init();
	thread maps\mp\gametypes\_spectating::init();
	thread maps\mp\gametypes\_objpoints::init();
	thread maps\mp\gametypes\_gameobjects::init();
	thread maps\mp\gametypes\_spawnlogic::init();
	thread maps\mp\gametypes\_battlechatter_mp::init();
	thread maps\mp\gametypes\_music_and_dialog::init();
	thread maps\mp\gametypes\_high_jump_mp::init();
	thread maps\mp\_grappling_hook::init();
	thread maps\mp\_matchdata::init();
	thread maps\mp\_awards::init();
	thread maps\mp\_areas::init();
	if(!maps\mp\_utility::invirtuallobby())
	{
		thread maps\mp\killstreaks\_killstreaks_init::init();
	}

	thread maps\mp\perks\_perks::init();
	thread maps\mp\_events::init();
	thread maps\mp\gametypes\_damage::initfinalkillcam();
	thread maps\mp\_threatdetection::init();
	thread maps\mp\_exo_suit::init();
	thread maps\mp\_reinforcements::init();
	thread maps\mp\_snd_common_mp::init();
	thread maps\mp\_utility::buildattachmentmaps();
	if(level.teambased)
	{
		thread maps\mp\gametypes\_friendicons::init();
	}

	thread maps\mp\gametypes\_hud_message::init();
	thread maps\mp\gametypes\_divisions::init();
	foreach(var_05 in game["strings"])
	{
		precachestring(var_05);
	}

	foreach(var_08 in game["icons"])
	{
		precacheshader(var_08);
	}

	game["gamestarted"] = 1;
	level.maxplayercount = 0;
	level.wavedelay["allies"] = 0;
	level.wavedelay["axis"] = 0;
	level.lastwave["allies"] = 0;
	level.lastwave["axis"] = 0;
	level.var_A2A4["allies"] = 0;
	level.var_A2A4["axis"] = 0;
	level.aliveplayers["allies"] = [];
	level.aliveplayers["axis"] = [];
	level.activeplayers = [];
	if(level.multiteambased)
	{
		for(var_03 = 0;var_03 < level.teamnamelist.size;var_03++)
		{
			level._wavedelay[level.teamnamelist[var_03]] = 0;
			level._lastwave[level.teamnamelist[var_03]] = 0;
			level._waveplayerspawnindex[level.teamnamelist[var_03]] = 0;
			level._aliveplayers[level.teamnamelist[var_03]] = [];
		}
	}

	setdvar("ui_scorelimit",0);
	setdvar("ui_allow_teamchange",1);
	if(maps\mp\_utility::getgametypenumlives())
	{
		setdvar("g_deadChat",0);
	}
	else
	{
		setdvar("g_deadChat",1);
	}

	var_0A = getdvarfloat("scr_" + level.gametype + "_waverespawndelay");
	if(var_0A > 0)
	{
		level.wavedelay["allies"] = var_0A;
		level.wavedelay["axis"] = var_0A;
		level.lastwave["allies"] = 0;
		level.lastwave["axis"] = 0;
		if(level.multiteambased)
		{
			for(var_03 = 0;var_03 < level.teamnamelist.size;var_03++)
			{
				level._wavedelay[level.teamnamelist[var_03]] = var_0A;
				level._lastwave[level.teamnamelist[var_03]] = 0;
			}
		}

		level thread lib_A789::wavespawntimer();
	}

	maps\mp\_utility::gameflaginit("prematch_done",0);
	level.graceperiod = 15;
	level.ingraceperiod = level.graceperiod;
	maps\mp\_utility::gameflaginit("graceperiod_done",0);
	level.roundenddelay = 4;
	level.halftimeroundenddelay = 4;
	level.noragdollents = getentarray("noragdoll","targetname");
	if(level.teambased)
	{
		maps\mp\gametypes\_gamescore::updateteamscore("axis");
		maps\mp\gametypes\_gamescore::updateteamscore("allies");
		if(level.multiteambased)
		{
			for(var_03 = 0;var_03 < level.teamnamelist.size;var_03++)
			{
				maps\mp\gametypes\_gamescore::updateteamscore(level.teamnamelist[var_03]);
			}
		}
	}
	else
	{
		thread maps\mp\gametypes\_gamescore::initialdmscoreupdate();
	}

	thread lib_A789::updateuiscorelimit();
	level notify("update_scorelimit");
	[[ level.onstartgametype ]]();
	level.scorepercentagecutoff = getdvarint("scr_" + level.gametype + "_score_percentage_cut_off",80);
	level.timepercentagecutoff = getdvarint("scr_" + level.gametype + "_time_percentage_cut_off",80);
	if(!level.console && getdvar("dedicated") == "dedicated LAN server" || getdvar("dedicated") == "dedicated internet server")
	{
		thread lib_A789::verifydedicatedconfiguration();
	}

	lib_A789::setattackingteam();
	thread lib_A789::startgame();
	level thread maps\mp\_utility::updatewatcheddvars();
	level thread lib_A789::timelimitthread();
	level thread maps\mp\gametypes\_damage::dofinalkillcam();
}

//Function Number: 49
lib_A789::setattackingteam()
{
	if(game["attackers"] == "axis")
	{
		var_00 = 1;
	}
	else if(game["attackers"] == "allies")
	{
		var_00 = 2;
	}
	else
	{
		var_00 = 0;
	}

	setomnvar("ui_attacking_team",var_00);
}

//Function Number: 50
lib_A789::callback_codeendgame()
{
	function_0174();
	if(!level.gameended)
	{
		level thread lib_A789::forceend();
	}
}

//Function Number: 51
lib_A789::verifydedicatedconfiguration()
{
	for(;;)
	{
		if(level.rankedmatch)
		{
			exitlevel(0);
		}

		if(!getdvarint("xblive_privatematch"))
		{
			exitlevel(0);
		}

		if(getdvar("dedicated") != "dedicated LAN server" && getdvar("dedicated") != "dedicated internet server")
		{
			exitlevel(0);
		}

		wait(5);
	}
}

//Function Number: 52
lib_A789::timelimitthread()
{
	level endon("game_ended");
	var_00 = maps\mp\_utility::gettimepassed();
	while(game["state"] == "playing")
	{
		thread lib_A789::checktimelimit(var_00);
		var_00 = maps\mp\_utility::gettimepassed();
		if(isdefined(level.starttime))
		{
			if(lib_A789::gettimeremaining() < 3000)
			{
				wait(0.1);
				continue;
			}
		}

		wait(1);
	}
}

//Function Number: 53
lib_A789::updateuiscorelimit()
{
	for(;;)
	{
		level common_scripts\utility::waittill_either("update_scorelimit","update_winlimit");
		if(!maps\mp\_utility::isroundbased() || !maps\mp\_utility::isobjectivebased())
		{
			setdvar("ui_scorelimit",maps\mp\_utility::getwatcheddvar("scorelimit"));
			thread lib_A789::checkscorelimit();
			continue;
		}

		setdvar("ui_scorelimit",maps\mp\_utility::getwatcheddvar("winlimit"));
	}
}

//Function Number: 54
lib_A789::playtickingsound()
{
	self endon("death");
	self endon("stop_ticking");
	level endon("game_ended");
	var_00 = level.bombtimer;
	for(;;)
	{
		self playsoundasmaster("ui_mp_suitcasebomb_timer");
		if(var_00 > 10)
		{
			var_00 = var_00 - 1;
			wait(1);
		}
		else if(var_00 > 4)
		{
			var_00 = var_00 - 0.5;
			wait(0.5);
		}
		else if(var_00 > 1)
		{
			var_00 = var_00 - 0.4;
			wait(0.4);
		}
		else
		{
			var_00 = var_00 - 0.3;
			wait(0.3);
		}

		maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	}
}

//Function Number: 55
lib_A789::stoptickingsound()
{
	self notify("stop_ticking");
}

//Function Number: 56
lib_A789::timelimitclock()
{
	level endon("game_ended");
	wait(0.05);
	var_00 = spawn("script_origin",(0,0,0));
	var_00 hide();
	while(game["state"] == "playing")
	{
		if(!level.timerstopped && maps\mp\_utility::gettimelimit())
		{
			var_01 = lib_A789::gettimeremaining() / 1000;
			var_02 = int(var_01 + 0.5);
			var_03 = int(maps\mp\_utility::gettimelimit() * 60 * 0.5);
			if(maps\mp\_utility::gethalftime() && var_02 > var_03)
			{
				var_02 = var_02 - var_03;
			}

			if(var_02 >= 30 && var_02 <= 60)
			{
				level notify("match_ending_soon","time");
			}

			if(var_02 <= 10 || var_02 <= 30 && var_02 % 2 == 0)
			{
				level notify("match_ending_very_soon");
				if(var_02 == 0)
				{
					break;
				}

				var_00 playsoundasmaster("ui_mp_timer_countdown");
			}

			if(var_01 - floor(var_01) >= 0.05)
			{
				wait(var_01 - floor(var_01));
			}
		}

		wait(1);
	}
}

//Function Number: 57
lib_A789::gametimer()
{
	level endon("game_ended");
	level waittill("prematch_over");
	level.starttime = gettime();
	level.discardtime = 0;
	level.matchdurationstarttime = gettime();
	if(isdefined(game["roundMillisecondsAlreadyPassed"]))
	{
		level.starttime = level.starttime - game["roundMillisecondsAlreadyPassed"];
		level.firsthalftimepassed = game["roundMillisecondsAlreadyPassed"];
		game["roundMillisecondsAlreadyPassed"] = undefined;
	}

	var_00 = gettime();
	while(game["state"] == "playing")
	{
		if(!level.timerstopped)
		{
			game["timePassed"] = game["timePassed"] + gettime() - var_00;
		}

		var_00 = gettime();
		wait(1);
	}
}

//Function Number: 58
lib_A789::updatetimerpausedness()
{
	var_00 = level.timerstoppedforgamemode || isdefined(level.hostmigrationtimer);
	if(!maps\mp\_utility::gameflag("prematch_done"))
	{
		var_00 = 0;
	}

	if(!level.timerstopped && var_00)
	{
		level.timerstopped = 1;
		level.timerpausetime = gettime();
		return;
	}

	if(level.timerstopped && !var_00)
	{
		level.timerstopped = 0;
		level.discardtime = level.discardtime + gettime() - level.timerpausetime;
	}
}

//Function Number: 59
lib_A789::pausetimer()
{
	level.timerstoppedforgamemode = 1;
	lib_A789::updatetimerpausedness();
}

//Function Number: 60
lib_A789::resumetimer()
{
	level.timerstoppedforgamemode = 0;
	lib_A789::updatetimerpausedness();
}

//Function Number: 61
lib_A789::startgame()
{
	thread lib_A789::gametimer();
	level.timerstopped = 0;
	level.timerstoppedforgamemode = 0;
	setdvar("ui_inprematch",1);
	lib_A789::prematchperiod();
	maps\mp\_utility::gameflagset("prematch_done");
	level notify("prematch_over");
	setdvar("ui_inprematch",0);
	level.var_6F04 = gettime();
	lib_A789::updatetimerpausedness();
	thread lib_A789::timelimitclock();
	thread lib_A789::graceperiod();
	thread maps\mp\gametypes\_missions::roundbegin();
	thread maps\mp\_matchdata::matchstarted();
	var_00 = isdefined(level.var_511A) && level.var_511A;
	var_01 = isdefined(level.iszombiegame) && level.iszombiegame;
	if(var_00 || var_01)
	{
		thread updategameduration();
	}

	function_0240();
}

//Function Number: 62
lib_A789::wavespawntimer()
{
	level endon("game_ended");
	while(game["state"] == "playing")
	{
		var_00 = gettime();
		if(var_00 - level.lastwave["allies"] > level.wavedelay["allies"] * 1000)
		{
			level notify("wave_respawn_allies");
			level.lastwave["allies"] = var_00;
			level.var_A2A4["allies"] = 0;
		}

		if(var_00 - level.lastwave["axis"] > level.wavedelay["axis"] * 1000)
		{
			level notify("wave_respawn_axis");
			level.lastwave["axis"] = var_00;
			level.var_A2A4["axis"] = 0;
		}

		if(level.multiteambased)
		{
			for(var_01 = 0;var_01 < level.teamnamelist.size;var_01++)
			{
				if(var_00 - level.lastwave[level.teamnamelist[var_01]] > level._wavedelay[level.teamnamelist[var_01]] * 1000)
				{
					var_02 = "wave_rewpawn_" + level.teamnamelist[var_01];
					level notify(var_02);
					level.lastwave[level.teamnamelist[var_01]] = var_00;
					level.var_A2A4[level.teamnamelist[var_01]] = 0;
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 63
lib_A789::getbetterteam()
{
	var_00["allies"] = 0;
	var_00["axis"] = 0;
	var_01["allies"] = 0;
	var_01["axis"] = 0;
	var_02["allies"] = 0;
	var_02["axis"] = 0;
	foreach(var_04 in level.var_328)
	{
		var_05 = var_04.connectedpostgame["team"];
		if(isdefined(var_05) && var_05 == "allies" || var_05 == "axis")
		{
			var_00[var_05] = var_00[var_05] + var_04.score;
			var_01[var_05] = var_01[var_05] + var_04.kills;
			var_02[var_05] = var_02[var_05] + var_04.deaths;
		}
	}

	if(var_00["allies"] > var_00["axis"])
	{
		return "allies";
	}
	else if(var_00["axis"] > var_00["allies"])
	{
		return "axis";
	}

	if(var_01["allies"] > var_01["axis"])
	{
		return "allies";
	}
	else if(var_01["axis"] > var_01["allies"])
	{
		return "axis";
	}

	if(var_02["allies"] < var_02["axis"])
	{
		return "allies";
	}
	else if(var_02["axis"] < var_02["allies"])
	{
		return "axis";
	}

	if(randomint(2) == 0)
	{
		return "allies";
	}

	return "axis";
}

//Function Number: 64
lib_A789::rankedmatchupdates(param_00)
{
	if(!maps\mp\_utility::waslastround())
	{
		return;
	}

	param_00 = lib_A789::getgamewinner(param_00,0);
	if(maps\mp\_utility::matchmakinggame())
	{
		lib_A789::setxenonranks();
		if(lib_A789::hostidledout())
		{
			level.hostforcedend = 1;
			function_0196("host idled out");
			endlobby();
		}

		lib_A789::updatematchbonusscores(param_00);
	}

	lib_A789::updatewinlossstats(param_00);
}

//Function Number: 65
lib_A789::displayroundend(param_00,param_01)
{
	if(!maps\mp\_utility::practiceroundgame())
	{
		foreach(var_03 in level.var_328)
		{
			if(isdefined(var_03.var_214A) || var_03.connectedpostgame["team"] == "spectator" && !var_03 ismlgspectator())
			{
				continue;
			}

			if(level.teambased)
			{
				var_03 thread maps\mp\gametypes\_hud_message::teamoutcomenotify(param_00,1,param_01);
				continue;
			}

			var_03 thread maps\mp\gametypes\_hud_message::outcomenotify(param_00,param_01);
		}
	}

	if(!maps\mp\_utility::waslastround())
	{
		level notify("round_win",param_00);
	}

	if(maps\mp\_utility::waslastround())
	{
		lib_A789::roundendwait(level.roundenddelay,0);
		return;
	}

	lib_A789::roundendwait(level.roundenddelay,1);
}

//Function Number: 66
lib_A789::displaygameend(param_00,param_01)
{
	if(!maps\mp\_utility::practiceroundgame())
	{
		foreach(var_03 in level.var_328)
		{
			if(isdefined(var_03.var_214A) || var_03.connectedpostgame["team"] == "spectator" && !var_03 ismlgspectator())
			{
				continue;
			}

			if(level.teambased)
			{
				var_03 thread maps\mp\gametypes\_hud_message::teamoutcomenotify(param_00,0,param_01,1);
				continue;
			}

			var_03 thread maps\mp\gametypes\_hud_message::outcomenotify(param_00,param_01);
		}
	}

	level notify("game_win",param_00);
	lib_A789::roundendwait(level.postroundtime,1);
}

//Function Number: 67
lib_A789::displayroundswitch()
{
	var_00 = level.halftimetype;
	if(var_00 == "halftime")
	{
		if(maps\mp\_utility::getwatcheddvar("roundlimit"))
		{
			if(game["roundsPlayed"] * 2 == maps\mp\_utility::getwatcheddvar("roundlimit"))
			{
				var_00 = "halftime";
			}
			else
			{
				var_00 = "intermission";
			}
		}
		else if(maps\mp\_utility::getwatcheddvar("winlimit"))
		{
			if(game["roundsPlayed"] == maps\mp\_utility::getwatcheddvar("winlimit") - 1)
			{
				var_00 = "halftime";
			}
			else
			{
				var_00 = "intermission";
			}
		}
		else
		{
			var_00 = "intermission";
		}
	}

	level notify("round_switch",var_00);
	foreach(var_02 in level.var_328)
	{
		if(isdefined(var_02.var_214A) || var_02.connectedpostgame["team"] == "spectator" && !var_02 ismlgspectator())
		{
			continue;
		}

		var_02 thread maps\mp\gametypes\_hud_message::teamoutcomenotify(var_00,1,game["end_reason"]["switching_sides"]);
	}

	lib_A789::roundendwait(level.halftimeroundenddelay,0);
}

//Function Number: 68
lib_A789::freezeallplayers(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	foreach(var_03 in level.var_328)
	{
		var_03 method_800D();
		var_03 thread lib_A789::freezeplayerforroundend(param_00);
		var_03 thread lib_A789::roundenddof(4);
		var_03 lib_A789::freegameplayhudelems();
		if(isdefined(param_01) && param_01)
		{
			var_03 setclientdvars("cg_everyoneHearsEveryone",1,"cg_fovScale",1);
			var_03 setclientomnvar("fov_scale",1);
			continue;
		}

		var_03 setclientdvars("cg_everyoneHearsEveryone",1);
	}

	if(isdefined(level.agentarray))
	{
		foreach(var_06 in level.agentarray)
		{
			var_06 maps\mp\_utility::freezecontrolswrapper(1);
		}
	}
}

//Function Number: 69
lib_A789::endgameovertime(param_00,param_01)
{
	setdvar("bg_compassShowEnemies",0);
	lib_A789::freezeallplayers(1,1);
	foreach(var_03 in level.var_328)
	{
		var_03.connectedpostgame["stats"] = var_03.stats;
		var_03.connectedpostgame["segments"] = var_03.segments;
	}

	level notify("round_switch","overtime");
	var_05 = 0;
	var_06 = param_00 == "overtime";
	if(level.gametype == "ctf")
	{
		param_00 = "tie";
		var_05 = 1;
		if(game["teamScores"]["axis"] > game["teamScores"]["allies"])
		{
			param_00 = "axis";
		}

		if(game["teamScores"]["allies"] > game["teamScores"]["axis"])
		{
			param_00 = "allies";
		}
	}

	foreach(var_03 in level.var_328)
	{
		if(isdefined(var_03.var_214A) || var_03.connectedpostgame["team"] == "spectator" && !var_03 ismlgspectator())
		{
			continue;
		}

		if(level.teambased)
		{
			var_03 thread maps\mp\gametypes\_hud_message::teamoutcomenotify(param_00,var_05,param_01);
			continue;
		}

		var_03 thread maps\mp\gametypes\_hud_message::outcomenotify(param_00,param_01);
	}

	lib_A789::roundendwait(level.roundenddelay,0);
	if(level.gametype == "ctf")
	{
		param_00 = "overtime_halftime";
	}

	if(isdefined(level.finalkillcam_winner) && var_06)
	{
		level.finalkillcam_timegameended[level.finalkillcam_winner] = maps\mp\_utility::getsecondspassed();
		foreach(var_03 in level.var_328)
		{
			var_03 notify("reset_outcome");
		}

		level notify("game_cleanup");
		lib_A789::waittillfinalkillcamdone();
		if(level.gametype == "ctf")
		{
			param_00 = "overtime";
			param_01 = game["end_reason"]["tie"];
		}

		foreach(var_03 in level.var_328)
		{
			if(isdefined(var_03.var_214A) || var_03.connectedpostgame["team"] == "spectator" && !var_03 ismlgspectator())
			{
				continue;
			}

			if(level.teambased)
			{
				var_03 thread maps\mp\gametypes\_hud_message::teamoutcomenotify(param_00,0,param_01);
				continue;
			}

			var_03 thread maps\mp\gametypes\_hud_message::outcomenotify(param_00,param_01);
		}

		lib_A789::roundendwait(level.halftimeroundenddelay,0);
	}

	game["status"] = param_00;
	level notify("restarting");
	game["state"] = "playing";
	setdvar("ui_game_state",game["state"]);
	maprestart(1);
}

//Function Number: 70
lib_A789::endgamehalftime(param_00)
{
	setdvar("bg_compassShowEnemies",0);
	var_01 = "halftime";
	var_02 = 1;
	if(isdefined(level.halftime_switch_sides) && !level.halftime_switch_sides)
	{
		var_02 = 0;
	}

	if(var_02)
	{
		game["switchedsides"] = !game["switchedsides"];
		var_03 = game["end_reason"]["switching_sides"];
	}
	else
	{
		var_03 = var_01;
	}

	lib_A789::freezeallplayers(1,1);
	if(level.gametype == "ctf")
	{
		var_03 = param_00;
		var_01 = "tie";
		if(game["teamScores"]["axis"] > game["teamScores"]["allies"])
		{
			var_01 = "axis";
		}

		if(game["teamScores"]["allies"] > game["teamScores"]["axis"])
		{
			var_01 = "allies";
		}
	}

	foreach(var_05 in level.var_328)
	{
		var_05.connectedpostgame["stats"] = var_05.stats;
		var_05.connectedpostgame["segments"] = var_05.segments;
	}

	level notify("round_switch","halftime");
	foreach(var_05 in level.var_328)
	{
		if(isdefined(var_05.var_214A) || var_05.connectedpostgame["team"] == "spectator" && !var_05 ismlgspectator())
		{
			continue;
		}

		var_05 thread maps\mp\gametypes\_hud_message::teamoutcomenotify(var_01,1,var_03);
	}

	lib_A789::roundendwait(level.roundenddelay,0);
	if(isdefined(level.finalkillcam_winner))
	{
		level.finalkillcam_timegameended[level.finalkillcam_winner] = maps\mp\_utility::getsecondspassed();
		foreach(var_05 in level.var_328)
		{
			var_05 notify("reset_outcome");
		}

		level notify("game_cleanup");
		lib_A789::waittillfinalkillcamdone();
		var_0B = game["end_reason"]["switching_sides"];
		if(!var_02)
		{
			var_0B = var_03;
		}

		foreach(var_05 in level.var_328)
		{
			if(isdefined(var_05.var_214A) || var_05.connectedpostgame["team"] == "spectator" && !var_05 ismlgspectator())
			{
				continue;
			}

			var_05 thread maps\mp\gametypes\_hud_message::teamoutcomenotify("halftime",1,var_0B);
		}

		lib_A789::roundendwait(level.halftimeroundenddelay,0);
	}

	game["status"] = "halftime";
	level notify("restarting");
	game["state"] = "playing";
	setdvar("ui_game_state",game["state"]);
	maprestart(1);
}

//Function Number: 71
updategameduration()
{
	level endon("game_ended");
	for(;;)
	{
		var_00 = getgameduration();
		setomnvar("ui_game_duration",var_00 * 1000);
		wait(1);
	}
}

//Function Number: 72
getgameduration()
{
	var_00 = maps\mp\_utility::getgametimepassedseconds();
	if(isdefined(level.var_511A) && level.var_511A)
	{
		var_00 = gamedurationclamp(var_00);
	}

	return var_00;
}

//Function Number: 73
gamedurationclamp(param_00)
{
	if(param_00 > 86399)
	{
		return 86399;
	}

	return param_00;
}

//Function Number: 74
lib_A789::endgame(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(game["state"] == "postgame" || level.gameended)
	{
		return;
	}

	game["state"] = "postgame";
	setdvar("ui_game_state","postgame");
	level.gameendtime = gettime();
	level.gameended = 1;
	level.ingraceperiod = 0;
	level notify("game_ended",param_00);
	maps\mp\_utility::levelflagset("game_over");
	maps\mp\_utility::levelflagset("block_notifies");
	var_03 = getgameduration();
	setomnvar("ui_game_duration",var_03 * 1000);
	wait 0.05;
	setgameendtime(0);
	setmatchdata("gameLengthSeconds",var_03);
	setmatchdata("endTimeUTC",function_0138());
	lib_A789::checkgameendchallenges();
	if(isdefined(param_00) && isstring(param_00) && maps\mp\_utility::isovertimetext(param_00))
	{
		level.finalkillcam_winner = "none";
		lib_A789::endgameovertime(param_00,param_01);
		return;
	}

	if(isdefined(param_00) && isstring(param_00) && param_00 == "halftime")
	{
		level.finalkillcam_winner = "none";
		lib_A789::endgamehalftime(param_01);
		return;
	}

	if(isdefined(level.finalkillcam_winner))
	{
		level.finalkillcam_timegameended[level.finalkillcam_winner] = maps\mp\_utility::getsecondspassed();
	}

	game["roundsPlayed"]++;
	setomnvar("ui_current_round",game["roundsPlayed"]);
	if(level.teambased)
	{
		if((param_00 == "axis" || param_00 == "allies") && level.gametype != "ctf")
		{
			game["roundsWon"][param_00]++;
		}

		maps\mp\gametypes\_gamescore::updateteamscore("axis");
		maps\mp\gametypes\_gamescore::updateteamscore("allies");
	}
	else if(isdefined(param_00) && isplayer(param_00))
	{
		game["roundsWon"][param_00.assistedsuicide]++;
	}

	maps\mp\gametypes\_gamescore::updateplacement();
	lib_A789::rankedmatchupdates(param_00);
	foreach(var_05 in level.var_328)
	{
		var_05 setclientdvar("ui_opensummary",1);
		if(maps\mp\_utility::wasonlyround() || maps\mp\_utility::waslastround())
		{
			var_05 maps\mp\killstreaks\_killstreaks::clearkillstreaks(1);
		}
	}

	setdvar("g_deadChat",1);
	setdvar("ui_allow_teamchange",0);
	setdvar("bg_compassShowEnemies",0);
	lib_A789::freezeallplayers(1,1);
	if(!maps\mp\_utility::wasonlyround() && !param_02)
	{
		lib_A789::displayroundend(param_00,param_01);
		if(isdefined(level.finalkillcam_winner))
		{
			foreach(var_05 in level.var_328)
			{
				var_05 notify("reset_outcome");
			}

			level notify("game_cleanup");
			lib_A789::waittillfinalkillcamdone();
		}

		if(!maps\mp\_utility::waslastround())
		{
			maps\mp\_utility::levelflagclear("block_notifies");
			if(lib_A789::checkroundswitch())
			{
				lib_A789::displayroundswitch();
			}

			foreach(var_05 in level.var_328)
			{
				var_05.connectedpostgame["stats"] = var_05.stats;
				var_05.connectedpostgame["segments"] = var_05.segments;
			}

			level notify("restarting");
			game["state"] = "playing";
			setdvar("ui_game_state","playing");
			maprestart(1);
			return;
		}

		if(!level.forcedend)
		{
			var_03 = lib_A789::updateendreasontext(param_02);
		}
	}

	if(!isdefined(game["clientMatchDataDef"]))
	{
		game["clientMatchDataDef"] = "mp/clientmatchdata.def";
		function_0134(game["clientMatchDataDef"]);
	}

	maps\mp\gametypes\_missions::roundend(param_02);
	param_02 = lib_A789::getgamewinner(param_02,1);
	if(level.teambased)
	{
		setomnvar("ui_game_victor",0);
		if(param_02 == "allies")
		{
			setomnvar("ui_game_victor",2);
		}
		else if(param_02 == "axis")
		{
			setomnvar("ui_game_victor",1);
		}
	}

	lib_A789::displaygameend(param_02,var_03);
	var_0B = gettime();
	if(isdefined(level.finalkillcam_winner) && maps\mp\_utility::wasonlyround())
	{
		foreach(var_09 in level.var_328)
		{
			var_09 notify("reset_outcome");
		}

		level notify("game_cleanup");
		lib_A789::waittillfinalkillcamdone();
	}

	maps\mp\_utility::levelflagclear("block_notifies");
	level.intermission = 1;
	level notify("spawning_intermission");
	foreach(var_09 in level.var_328)
	{
		var_09 method_8325();
		var_09 closeingamemenu();
		var_09 notify("reset_outcome");
		var_09 thread maps\mp\gametypes\_playerlogic::spawnintermission();
	}

	lib_A789::processlobbydata();
	wait(1);
	lib_A789::checkforpersonalbests();
	lib_A789::updatecombatrecord();
	if(level.teambased)
	{
		if(param_02 == "axis" || param_02 == "allies")
		{
			setmatchdata("victor",param_02);
		}
		else
		{
			setmatchdata("victor","none");
		}

		setmatchdata("alliesScore",game["teamScores"]["allies"]);
		setmatchdata("axisScore",game["teamScores"]["axis"]);
		function_0242(param_02);
	}
	else
	{
		setmatchdata("victor","none");
	}

	level maps\mp\_matchdata::endofgamesummarylogger();
	foreach(var_09 in level.var_328)
	{
		if(var_09 maps\mp\_utility::rankingenabled())
		{
			var_09 maps\mp\_matchdata::logfinalstats();
		}

		var_09 maps\mp\gametypes\_playerlogic::logplayerstats();
	}

	setmatchdata("host",maps\mp\gametypes\_playerlogic::truncateplayername(level.hostname));
	if(maps\mp\_utility::matchmakinggame())
	{
		setmatchdata("playlistVersion",getplaylistversion());
		setmatchdata("playlistID",function_027C());
		setmatchdata("isDedicated",isdedicatedserver());
	}

	setmatchdata("levelMaxClients",level.maxclients);
	sendmatchdata();
	foreach(var_09 in level.var_328)
	{
		var_09.connectedpostgame["stats"] = var_09.stats;
		var_09.connectedpostgame["segments"] = var_09.segments;
	}

	function_0243();
	var_14 = 0;
	if(maps\mp\_utility::practiceroundgame())
	{
		var_14 = 5;
	}

	if(isdefined(level.endgamewaitfunc))
	{
		[[ level.endgamewaitfunc ]](var_04,level.var_6E86,var_14,param_02);
	}
	else if(!var_04 && !level.var_6E86)
	{
		if(!maps\mp\_utility::wasonlyround())
		{
			wait(6 + var_14);
		}
		else
		{
			wait(min(10,4 + var_14 + level.var_6E86));
		}
	}
	else
	{
		wait(min(10,4 + var_14 + level.var_6E86));
	}

	var_15 = "_gamelogic.gsc";
	var_16 = "all";
	if(level.teambased && isdefined(param_02))
	{
		var_16 = param_02;
	}

	var_17 = "undefined";
	if(isdefined(var_03))
	{
		switch(var_03)
		{
			case 1:
				break;

			case 2:
				break;

			case 3:
				break;

			case 4:
				break;

			case 5:
				break;

			case 6:
				break;

			case 7:
				break;

			case 8:
				break;

			case 9:
				break;

			case 10:
				break;

			case 11:
				break;

			case 12:
				break;

			case 13:
				break;

			case 14:
				break;

			case 15:
				break;

			case 16:
				break;

			case 17:
				break;

			default:
				break;
		}
	}
}

//Function Number: 75
lib_A789::getgamewinner(param_00,param_01)
{
	if(!isstring(param_00))
	{
		return param_00;
	}

	var_02 = param_00;
	if(level.teambased && maps\mp\_utility::isroundbased() || level.gametype == "ctf" && level.gameended)
	{
		var_03 = "roundsWon";
		if(isdefined(level.var_A322) && level.var_A322)
		{
			var_03 = "teamScores";
		}

		if(game[var_03]["allies"] == game[var_03]["axis"])
		{
			var_02 = "tie";
		}
		else if(game[var_03]["axis"] > game[var_03]["allies"])
		{
			var_02 = "axis";
		}
		else
		{
			var_02 = "allies";
		}
	}

	if(param_01 && var_02 == "allies" || var_02 == "axis")
	{
		level.finalkillcam_winner = var_02;
	}

	return var_02;
}

//Function Number: 76
lib_A789::updateendreasontext(param_00)
{
	if(!level.teambased)
	{
		return 1;
	}

	if(maps\mp\_utility::hitroundlimit())
	{
		return game["end_reason"]["round_limit_reached"];
	}

	if(maps\mp\_utility::hitwinlimit())
	{
		return game["end_reason"]["score_limit_reached"];
	}

	return game["end_reason"]["objective_completed"];
}

//Function Number: 77
lib_A789::estimatedtimetillscorelimit(param_00)
{
	var_01 = lib_A789::getscoreperminute(param_00);
	var_02 = lib_A789::getscoreremaining(param_00);
	var_03 = 999999;
	if(var_01)
	{
		var_03 = var_02 / var_01;
	}

	return var_03;
}

//Function Number: 78
lib_A789::getscoreperminute(param_00)
{
	var_01 = maps\mp\_utility::getwatcheddvar("scorelimit");
	var_02 = maps\mp\_utility::gettimelimit();
	var_03 = maps\mp\_utility::gettimepassed() / 60000 + 0.0001;
	if(isplayer(self))
	{
		var_04 = self.score / var_03;
	}
	else
	{
		var_04 = getteamscore(var_01) / var_04;
	}

	return var_04;
}

//Function Number: 79
lib_A789::getscoreremaining(param_00)
{
	var_01 = maps\mp\_utility::getwatcheddvar("scorelimit");
	if(isplayer(self))
	{
		var_02 = var_01 - self.score;
	}
	else
	{
		var_02 = var_02 - getteamscore(var_01);
	}

	return var_02;
}

//Function Number: 80
lib_A789::givelastonteamwarning()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	maps\mp\_utility::waittillrecoveredhealth(3);
	thread maps\mp\_utility::teamplayercardsplash("callout_lastteammemberalive",self,self.connectedpostgame["team"]);
	if(level.multiteambased)
	{
		foreach(var_01 in level.teamnamelist)
		{
			if(self.connectedpostgame["team"] != var_01)
			{
				thread maps\mp\_utility::teamplayercardsplash("callout_lastenemyalive",self,var_01);
			}
		}
	}
	else
	{
		var_03 = maps\mp\_utility::getotherteam(self.connectedpostgame["team"]);
		thread maps\mp\_utility::teamplayercardsplash("callout_lastenemyalive",self,var_03);
	}

	level notify("last_alive",self);
}

//Function Number: 81
lib_A789::processlobbydata()
{
	var_00 = 0;
	foreach(var_02 in level.var_328)
	{
		if(!isdefined(var_02))
		{
			continue;
		}

		var_02.clientmatchdataid = var_00;
		var_00++;
		if(isdefined(level.iszombiegame) && level.iszombiegame)
		{
			var_02.clientmatchdataid = var_02 getentitynumber();
		}

		setclientmatchdata("players",var_02.clientmatchdataid,"name",maps\mp\gametypes\_playerlogic::truncateplayername(var_02.name));
		setclientmatchdata("players",var_02.clientmatchdataid,"xuid",var_02.num_lobby_idles);
	}

	maps\mp\_awards::assignawards();
	maps\mp\_scoreboard::processlobbyscoreboards();
	function_0135();
	function_023E();
}

//Function Number: 82
lib_A789::trackleaderboarddeathstats(param_00,param_01)
{
	thread lib_A789::threadedsetweaponstatbyname(param_00,1,"deaths");
}

//Function Number: 83
lib_A789::trackattackerleaderboarddeathstats(param_00,param_01,param_02)
{
	if(isdefined(self) && isplayer(self))
	{
		if(param_01 != "MOD_FALLING")
		{
			if(maps\mp\_utility::ismeleemod(param_01) && issubstr(param_00,"tactical"))
			{
				return;
			}

			if(maps\mp\_utility::ismeleemod(param_01) && !issubstr(param_00,"riotshield") && !issubstr(param_00,"combatknife"))
			{
				return;
			}

			thread lib_A789::threadedsetweaponstatbyname(param_00,1,"kills");
			var_03 = 0;
			if(isdefined(param_02) && isdefined(param_02.firedads))
			{
				var_03 = param_02.firedads;
			}
			else
			{
				var_03 = self playerads();
			}

			if(var_03 < 0.2)
			{
				thread lib_A789::threadedsetweaponstatbyname(param_00,1,"hipfirekills");
			}
		}

		if(param_01 == "MOD_HEAD_SHOT")
		{
			thread lib_A789::threadedsetweaponstatbyname(param_00,1,"headShots");
		}
	}
}

//Function Number: 84
lib_A789::setweaponstat(param_00,param_01,param_02)
{
	if(!param_01)
	{
		return;
	}

	var_03 = maps\mp\_utility::getweaponclass(param_00);
	if(var_03 == "killstreak" || var_03 == "other")
	{
		return;
	}

	if(maps\mp\_utility::isenvironmentweapon(param_00))
	{
		return;
	}

	if(maps\mp\_utility::isbombsiteweapon(param_00))
	{
		return;
	}

	if(param_00 == maps\mp\_grappling_hook::get_grappling_hook_weapon())
	{
		return;
	}

	if(var_03 == "weapon_grenade" || var_03 == "weapon_explosive")
	{
		var_04 = maps\mp\_utility::strip_suffix(param_00,"_lefthand");
		var_04 = maps\mp\_utility::strip_suffix(var_04,"_mp");
		maps\mp\gametypes\_persistance::func_4C3D(var_04,param_02,param_01);
		maps\mp\_matchdata::logweaponstat(var_04,param_02,param_01);
		return;
	}

	var_05 = maps\mp\gametypes\_weapons::isprimaryorsecondaryprojectileweapon(param_01);
	if(var_03 != "timeInUse" && var_03 != "deaths" && !var_05)
	{
		var_06 = param_01;
		param_01 = self getcurrentweapon();
		if(param_01 != var_06 && maps\mp\_utility::iskillstreakweapon(param_01))
		{
			return;
		}
	}

	if(!isdefined(self.trackingweaponname))
	{
		self.trackingweaponname = param_01;
	}

	if(param_01 != self.trackingweaponname)
	{
		maps\mp\gametypes\_persistance::func_9B9C();
		self.trackingweaponname = param_01;
		self.var_2515 = 0;
	}

	switch(var_03)
	{
		case "shots":
			break;

		case "hits":
			break;

		case "headShots":
			break;

		case "kills":
			break;

		case "hipfirekills":
			break;

		case "timeInUse":
			break;
	}
}

//Function Number: 85
lib_A789::setinflictorstat(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_01 lib_A789::setweaponstat(param_02,1,"hits");
		return;
	}

	if(!isdefined(param_00.playeraffectedarray))
	{
		param_00.playeraffectedarray = [];
	}

	var_03 = 1;
	for(var_04 = 0;var_04 < param_00.playeraffectedarray.size;var_04++)
	{
		if(param_00.playeraffectedarray[var_04] == self)
		{
			var_03 = 0;
			break;
		}
	}

	if(var_03)
	{
		param_00.playeraffectedarray[param_00.playeraffectedarray.size] = self;
		param_01 lib_A789::setweaponstat(param_02,1,"hits");
	}
}

//Function Number: 86
lib_A789::threadedsetweaponstatbyname(param_00,param_01,param_02)
{
	self endon("disconnect");
	waittillframeend;
	lib_A789::setweaponstat(param_00,param_01,param_02);
}

//Function Number: 87
lib_A789::checkforpersonalbests()
{
	foreach(var_01 in level.var_328)
	{
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01 maps\mp\_utility::rankingenabled())
		{
			var_02 = var_01 getcommonplayerdata("round","kills");
			var_03 = var_01 getcommonplayerdata("round","deaths");
			var_04 = var_01.connectedpostgame["summary"]["xp"];
			var_05 = var_01.score;
			var_06 = lib_A789::getroundaccuracy(var_01);
			var_07 = var_01 getrankedplayerdata("bestKills");
			var_08 = var_01 getrankedplayerdata("mostDeaths");
			var_09 = var_01 getrankedplayerdata("mostXp");
			var_0A = var_01 getrankedplayerdata("bestScore");
			var_0B = var_01 getrankedplayerdata("bestAccuracy");
			if(var_02 > var_07)
			{
				var_01 setrankedplayerdata("bestKills",var_02);
			}

			if(var_04 > var_09)
			{
				var_01 setrankedplayerdata("mostXp",var_04);
			}

			if(var_03 > var_08)
			{
				var_01 setrankedplayerdata("mostDeaths",var_03);
			}

			if(var_05 > var_0A)
			{
				var_01 setrankedplayerdata("bestScore",var_05);
			}

			if(var_06 > var_0B)
			{
				var_01 setrankedplayerdata("bestAccuracy",var_06);
			}

			var_01 lib_A789::checkforbestweapon();
			var_01 maps\mp\_matchdata::logplayerxp(var_04,"totalXp");
			var_01 maps\mp\_matchdata::logplayerxp(var_01.connectedpostgame["summary"]["score"],"scoreXp");
			var_01 maps\mp\_matchdata::logplayerxp(var_01.connectedpostgame["summary"]["challenge"],"challengeXp");
			var_01 maps\mp\_matchdata::logplayerxp(var_01.connectedpostgame["summary"]["match"],"matchXp");
			var_01 maps\mp\_matchdata::logplayerxp(var_01.connectedpostgame["summary"]["misc"],"miscXp");
		}

		if(isdefined(var_01.connectedpostgame["confirmed"]))
		{
			var_01 maps\mp\_matchdata::logkillsconfirmed();
		}

		if(isdefined(var_01.connectedpostgame["denied"]))
		{
			var_01 maps\mp\_matchdata::logkillsdenied();
		}
	}
}

//Function Number: 88
lib_A789::getroundaccuracy(param_00)
{
	var_01 = float(param_00 getrankedplayerdata("totalShots") - param_00.connectedpostgame["previous_shots"]);
	if(var_01 == 0)
	{
		return 0;
	}

	var_02 = float(param_00 getrankedplayerdata("hits") - param_00.connectedpostgame["previous_hits"]);
	var_03 = clamp(var_02 / var_01,0,1) * 10000;
	return int(var_03);
}

//Function Number: 89
lib_A789::checkforbestweapon()
{
	var_00 = maps\mp\_matchdata::buildbaseweaponlist();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		var_02 = maps\mp\_utility::getbaseweaponname(var_02);
		var_03 = maps\mp\_utility::getweaponclass(var_02);
		if(!maps\mp\_utility::iskillstreakweapon(var_02) && var_03 != "killstreak" && var_03 != "other")
		{
			var_04 = self getrankedplayerdata("bestWeapon","kills");
			var_05 = 0;
			if(isdefined(self.connectedpostgame["mpWeaponStats"][var_02]) && isdefined(self.connectedpostgame["mpWeaponStats"][var_02]["kills"]))
			{
				var_05 = self.connectedpostgame["mpWeaponStats"][var_02]["kills"];
				if(var_05 > var_04)
				{
					self setrankedplayerdata("bestWeapon","kills",var_05);
					var_06 = 0;
					if(isdefined(self.connectedpostgame["mpWeaponStats"][var_02]["shots"]))
					{
						var_06 = self.connectedpostgame["mpWeaponStats"][var_02]["shots"];
					}

					var_07 = 0;
					if(isdefined(self.connectedpostgame["mpWeaponStats"][var_02]["headShots"]))
					{
						var_07 = self.connectedpostgame["mpWeaponStats"][var_02]["headShots"];
					}

					var_08 = 0;
					if(isdefined(self.connectedpostgame["mpWeaponStats"][var_02]["hits"]))
					{
						var_08 = self.connectedpostgame["mpWeaponStats"][var_02]["hits"];
					}

					var_09 = 0;
					if(isdefined(self.connectedpostgame["mpWeaponStats"][var_02]["deaths"]))
					{
						var_09 = self.connectedpostgame["mpWeaponStats"][var_02]["deaths"];
					}

					self setrankedplayerdata("bestWeapon","shots",var_06);
					self setrankedplayerdata("bestWeapon","headShots",var_07);
					self setrankedplayerdata("bestWeapon","hits",var_08);
					self setrankedplayerdata("bestWeapon","deaths",var_09);
					var_0A = int(tablelookup("mp/statstable.csv",4,var_02,0));
					self setrankedplayerdata("bestWeaponIndex",var_0A);
				}
			}
		}
	}
}

//Function Number: 90
lib_A789::updatecombatrecordforplayertrends()
{
	var_00 = 5;
	var_01 = self getrankedplayerdata("combatRecord","numTrends");
	var_01++;
	if(var_01 > var_00)
	{
		var_01 = var_00;
		if(var_00 > 1)
		{
			for(var_02 = 0;var_02 < var_00 - 1;var_02++)
			{
				var_03 = self getrankedplayerdata("combatRecord","trend",var_02 + 1,"timestamp");
				var_04 = self getrankedplayerdata("combatRecord","trend",var_02 + 1,"kills");
				var_05 = self getrankedplayerdata("combatRecord","trend",var_02 + 1,"deaths");
				self setrankedplayerdata("combatRecord","trend",var_02,"timestamp",var_03);
				self setrankedplayerdata("combatRecord","trend",var_02,"kills",var_04);
				self setrankedplayerdata("combatRecord","trend",var_02,"deaths",var_05);
			}
		}
	}

	var_03 = maps\mp\_utility::gettimeutc_for_stat_recording();
	var_04 = self.kills;
	var_05 = self.deaths;
	self setrankedplayerdata("combatRecord","trend",var_01 - 1,"timestamp",var_03);
	self setrankedplayerdata("combatRecord","trend",var_01 - 1,"kills",var_04);
	self setrankedplayerdata("combatRecord","trend",var_01 - 1,"deaths",var_05);
	self setrankedplayerdata("combatRecord","numTrends",var_01);
}

//Function Number: 91
lib_A789::updatecombatrecordcommondata()
{
	var_00 = maps\mp\_utility::gettimeutc_for_stat_recording();
	lib_A789::setcombatrecordstat("timeStampLastGame",var_00);
	lib_A789::incrementcombatrecordstat("numMatches",1);
	lib_A789::incrementcombatrecordstat("timePlayed",self.timeplayed["total"]);
	lib_A789::incrementcombatrecordstat("kills",self.kills);
	lib_A789::incrementcombatrecordstat("deaths",self.deaths);
	lib_A789::incrementcombatrecordstat("xpEarned",self.connectedpostgame["summary"]["xp"]);
	if(isdefined(self.combatrecordwin))
	{
		lib_A789::incrementcombatrecordstat("wins",1);
	}

	if(isdefined(self.combatrecordtie))
	{
		lib_A789::incrementcombatrecordstat("ties",1);
	}

	var_01 = self getrankedplayerdata("combatRecord",level.gametype,"timeStampFirstGame");
	if(var_01 == 0)
	{
		lib_A789::setcombatrecordstat("timeStampFirstGame",var_00);
	}
}

//Function Number: 92
lib_A789::incrementcombatrecordstat(param_00,param_01)
{
	var_02 = self getrankedplayerdata("combatRecord",level.gametype,param_00);
	var_02 = var_02 + param_01;
	self setrankedplayerdata("combatRecord",level.gametype,param_00,var_02);
}

//Function Number: 93
lib_A789::setcombatrecordstat(param_00,param_01)
{
	self setrankedplayerdata("combatRecord",level.gametype,param_00,param_01);
}

//Function Number: 94
lib_A789::setcombatrecordstatifgreater(param_00,param_01)
{
	var_02 = self getrankedplayerdata("combatRecord",level.gametype,param_00);
	if(param_01 > var_02)
	{
		lib_A789::setcombatrecordstat(param_00,param_01);
	}
}

//Function Number: 95
lib_A789::updatecombatrecordforplayergamemodes()
{
	if(level.gametype == "war" || level.gametype == "dm")
	{
		lib_A789::updatecombatrecordcommondata();
		var_00 = self.deaths;
		if(var_00 == 0)
		{
			var_00 = 1;
		}

		var_01 = int(self.kills / var_00) * 1000;
		lib_A789::setcombatrecordstatifgreater("mostkills",self.kills);
		lib_A789::setcombatrecordstatifgreater("bestkdr",var_01);
		return;
	}

	if(level.gametype == "ctf")
	{
		lib_A789::updatecombatrecordcommondata();
		var_02 = maps\mp\_utility::getpersstat("captures");
		var_03 = maps\mp\_utility::getpersstat("returns");
		lib_A789::incrementcombatrecordstat("captures",var_02);
		lib_A789::incrementcombatrecordstat("returns",var_03);
		lib_A789::setcombatrecordstatifgreater("mostcaptures",var_02);
		lib_A789::setcombatrecordstatifgreater("mostreturns",var_03);
		return;
	}

	if(level.gametype == "dom")
	{
		lib_A789::updatecombatrecordcommondata();
		var_02 = maps\mp\_utility::getpersstat("captures");
		var_04 = maps\mp\_utility::getpersstat("defends");
		lib_A789::incrementcombatrecordstat("captures",var_02);
		lib_A789::incrementcombatrecordstat("defends",var_04);
		lib_A789::setcombatrecordstatifgreater("mostcaptures",var_02);
		lib_A789::setcombatrecordstatifgreater("mostdefends",var_04);
		return;
	}

	if(level.gametype == "conf")
	{
		lib_A789::updatecombatrecordcommondata();
		var_05 = maps\mp\_utility::getpersstat("confirmed");
		var_06 = maps\mp\_utility::getpersstat("denied");
		lib_A789::incrementcombatrecordstat("confirms",var_05);
		lib_A789::incrementcombatrecordstat("denies",var_06);
		lib_A789::setcombatrecordstatifgreater("mostconfirms",var_05);
		lib_A789::setcombatrecordstatifgreater("mostdenies",var_06);
		return;
	}

	if(level.gametype == "sd")
	{
		lib_A789::updatecombatrecordcommondata();
		var_07 = maps\mp\_utility::getpersstat("plants");
		var_08 = maps\mp\_utility::getpersstat("defuses");
		var_09 = maps\mp\_utility::getpersstat("destructions");
		lib_A789::incrementcombatrecordstat("plants",var_07);
		lib_A789::incrementcombatrecordstat("defuses",var_08);
		lib_A789::incrementcombatrecordstat("detonates",var_09);
		lib_A789::setcombatrecordstatifgreater("mostplants",var_07);
		lib_A789::setcombatrecordstatifgreater("mostdefuses",var_08);
		lib_A789::setcombatrecordstatifgreater("mostdetonates",var_09);
		return;
	}

	if(level.gametype == "hp")
	{
		lib_A789::updatecombatrecordcommondata();
		var_02 = maps\mp\_utility::getpersstat("captures");
		var_04 = maps\mp\_utility::getpersstat("defends");
		lib_A789::incrementcombatrecordstat("captures",var_02);
		lib_A789::incrementcombatrecordstat("defends",var_04);
		lib_A789::setcombatrecordstatifgreater("mostcaptures",var_02);
		lib_A789::setcombatrecordstatifgreater("mostdefends",var_04);
		return;
	}

	if(level.gametype == "sr")
	{
		lib_A789::updatecombatrecordcommondata();
		var_07 = maps\mp\_utility::getpersstat("plants");
		var_08 = maps\mp\_utility::getpersstat("defuses");
		var_09 = maps\mp\_utility::getpersstat("destructions");
		var_05 = maps\mp\_utility::getpersstat("confirmed");
		var_06 = maps\mp\_utility::getpersstat("denied");
		lib_A789::incrementcombatrecordstat("plants",var_07);
		lib_A789::incrementcombatrecordstat("defuses",var_08);
		lib_A789::incrementcombatrecordstat("detonates",var_09);
		lib_A789::incrementcombatrecordstat("confirms",var_05);
		lib_A789::incrementcombatrecordstat("denies",var_06);
		lib_A789::setcombatrecordstatifgreater("mostplants",var_07);
		lib_A789::setcombatrecordstatifgreater("mostdefuses",var_08);
		lib_A789::setcombatrecordstatifgreater("mostdetonates",var_09);
		lib_A789::setcombatrecordstatifgreater("mostconfirms",var_05);
		lib_A789::setcombatrecordstatifgreater("mostdenies",var_06);
		return;
	}

	if(level.gametype == "infect")
	{
		lib_A789::updatecombatrecordcommondata();
		var_0A = maps\mp\_utility::getplayerstat("contagious");
		var_0B = self.kills - var_0A;
		lib_A789::incrementcombatrecordstat("infectedKills",var_0B);
		lib_A789::incrementcombatrecordstat("survivorKills",var_0A);
		lib_A789::setcombatrecordstatifgreater("mostInfectedKills",var_0B);
		lib_A789::setcombatrecordstatifgreater("mostSurvivorKills",var_0A);
		return;
	}

	if(level.gametype == "gun")
	{
		lib_A789::updatecombatrecordcommondata();
		var_0C = maps\mp\_utility::getplayerstat("levelup");
		var_0D = maps\mp\_utility::getplayerstat("humiliation");
		lib_A789::incrementcombatrecordstat("gunPromotions",var_0C);
		lib_A789::incrementcombatrecordstat("stabs",var_0D);
		lib_A789::setcombatrecordstatifgreater("mostGunPromotions",var_0C);
		lib_A789::setcombatrecordstatifgreater("mostStabs",var_0D);
		return;
	}

	if(level.gametype == "ball")
	{
		lib_A789::updatecombatrecordcommondata();
		var_0E = maps\mp\_utility::getplayerstat("fieldgoal") + maps\mp\_utility::getplayerstat("touchdown") * 2;
		var_0F = maps\mp\_utility::getplayerstat("killedBallCarrier");
		lib_A789::incrementcombatrecordstat("pointsScored",var_0E);
		lib_A789::incrementcombatrecordstat("killedBallCarrier",var_0F);
		lib_A789::setcombatrecordstatifgreater("mostPointsScored",var_0E);
		lib_A789::setcombatrecordstatifgreater("mostKilledBallCarrier",var_0F);
		return;
	}

	if(level.gametype == "twar")
	{
		lib_A789::updatecombatrecordcommondata();
		var_02 = maps\mp\_utility::getpersstat("captures");
		var_10 = maps\mp\_utility::getplayerstat("kill_while_capture");
		lib_A789::incrementcombatrecordstat("captures",var_02);
		lib_A789::incrementcombatrecordstat("killWhileCaptures",var_10);
		lib_A789::setcombatrecordstatifgreater("mostCaptures",var_02);
		lib_A789::setcombatrecordstatifgreater("mostKillWhileCaptures",var_10);
		return;
	}
}

//Function Number: 96
lib_A789::updatecombatrecordforplayer()
{
	lib_A789::updatecombatrecordforplayertrends();
	lib_A789::updatecombatrecordforplayergamemodes();
}

//Function Number: 97
lib_A789::updatecombatrecord()
{
	foreach(var_01 in level.var_328)
	{
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01 maps\mp\_utility::rankingenabled())
		{
			var_01 lib_A789::updatecombatrecordforplayer();
		}

		level maps\mp\gametypes\_playerlogic::writesegmentdata(var_01);
		if(maps\mp\_utility::practiceroundgame())
		{
			level maps\mp\gametypes\_playerlogic::checkpracticeroundlockout(var_01);
		}
	}
}