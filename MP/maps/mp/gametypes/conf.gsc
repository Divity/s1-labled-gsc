/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: conf.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 681 ms
 * Timestamp: 4/20/2022 8:15:19 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(getdvar("mapname") == "mp_background")
	{
		return;
	}

	maps\mp\gametypes\_globallogic::init();
	maps\mp\gametypes\_callbacksetup::setupcallbacks();
	maps\mp\gametypes\_globallogic::setupcallbacks();
	if(isusingmatchrulesdata())
	{
		level.initializematchrules = ::initializematchrules;
		[[ level.initializematchrules ]]();
		level thread maps\mp\_utility::reinitializematchrulesonmigration();
	}
	else
	{
		maps\mp\_utility::registerroundswitchdvar(level.gametype,0,0,9);
		maps\mp\_utility::registertimelimitdvar(level.gametype,10);
		maps\mp\_utility::registerscorelimitdvar(level.gametype,65);
		maps\mp\_utility::registerroundlimitdvar(level.gametype,1);
		maps\mp\_utility::registerwinlimitdvar(level.gametype,1);
		maps\mp\_utility::registernumlivesdvar(level.gametype,0);
		maps\mp\_utility::registerhalftimedvar(level.gametype,0);
		level.matchrules_damagemultiplier = 0;
		level.matchrules_vampirism = 0;
	}

	level.teambased = 1;
	level.onstartgametype = ::onstartgametype;
	level.getspawnpoint = ::getspawnpoint;
	level.onnormaldeath = ::onnormaldeath;
	if(level.matchrules_damagemultiplier || level.matchrules_vampirism)
	{
		level.idflags_stun = ::maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;
	}

	game["dialog"]["gametype"] = "kc_intro";
	if(getdvarint("g_hardcore"))
	{
		game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
	}

	game["dialog"]["kill_confirmed"] = "kc_killconfirmed";
	game["dialog"]["kill_denied"] = "kc_killdenied";
	game["dialog"]["kill_lost"] = "kc_killlost";
	game["dialog"]["defense_obj"] = "kc_start";
	game["dialog"]["offense_obj"] = "kc_start";
	if(maps\mp\_utility::isgrapplinghookgamemode())
	{
		game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];
	}

	level.conf_fx["vanish"] = loadfx("vfx/unique/dogtag_vanish");
}

//Function Number: 2
initializematchrules()
{
	maps\mp\_utility::setcommonrulesfrommatchrulesdata();
	setdynamicdvar("scr_conf_roundswitch",0);
	maps\mp\_utility::registerroundswitchdvar("conf",0,0,9);
	setdynamicdvar("scr_conf_roundlimit",1);
	maps\mp\_utility::registerroundlimitdvar("conf",1);
	setdynamicdvar("scr_conf_winlimit",1);
	maps\mp\_utility::registerwinlimitdvar("conf",1);
	setdynamicdvar("scr_conf_halftime",0);
	maps\mp\_utility::registerhalftimedvar("conf",0);
}

//Function Number: 3
onstartgametype()
{
	setclientnamemode("auto_change");
	if(!isdefined(game["switchedsides"]))
	{
		game["switchedsides"] = 0;
	}

	if(game["switchedsides"])
	{
		var_00 = game["attackers"];
		var_01 = game["defenders"];
		game["attackers"] = var_01;
		game["defenders"] = var_00;
	}

	maps\mp\_utility::setobjectivetext("allies",&"OBJECTIVES_CONF");
	maps\mp\_utility::setobjectivetext("axis",&"OBJECTIVES_CONF");
	if(level.splitscreen)
	{
		maps\mp\_utility::setobjectivescoretext("allies",&"OBJECTIVES_CONF");
		maps\mp\_utility::setobjectivescoretext("axis",&"OBJECTIVES_CONF");
	}
	else
	{
		maps\mp\_utility::setobjectivescoretext("allies",&"OBJECTIVES_CONF_SCORE");
		maps\mp\_utility::setobjectivescoretext("axis",&"OBJECTIVES_CONF_SCORE");
	}

	maps\mp\_utility::setobjectivehinttext("allies",&"OBJECTIVES_CONF_HINT");
	maps\mp\_utility::setobjectivehinttext("axis",&"OBJECTIVES_CONF_HINT");
	initspawns();
	level.dogtags = [];
	var_02[0] = level.gametype;
	maps\mp\gametypes\_gameobjects::main(var_02);
}

//Function Number: 4
initspawns()
{
	level.spawnmins = (0,0,0);
	level.spawnmaxs = (0,0,0);
	maps\mp\gametypes\_spawnlogic::addstartspawnpoints("mp_tdm_spawn_allies_start");
	maps\mp\gametypes\_spawnlogic::addstartspawnpoints("mp_tdm_spawn_axis_start");
	level.var_8923 = "mp_tdm_spawn";
	maps\mp\gametypes\_spawnlogic::addspawnpoints("allies",level.var_8923);
	maps\mp\gametypes\_spawnlogic::addspawnpoints("axis",level.var_8923);
	level.var_5983 = maps\mp\gametypes\_spawnlogic::findboxcenter(level.spawnmins,level.spawnmaxs);
	setmapcenter(level.var_5983);
}

//Function Number: 5
getspawnpoint()
{
	var_00 = self.connectedpostgame["team"];
	if(game["switchedsides"])
	{
		var_00 = maps\mp\_utility::getotherteam(var_00);
	}

	if(level.usestartspawns && level.ingraceperiod)
	{
		var_01 = maps\mp\gametypes\_spawnlogic::getspawnpointarray("mp_tdm_spawn_" + var_00 + "_start");
		var_02 = maps\mp\gametypes\_spawnlogic::getspawnpoint_startspawn(var_01);
	}
	else
	{
		var_01 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints(var_02);
		var_02 = maps\mp\gametypes\_spawnscoring::getspawnpoint_awayfromenemies(var_02);
	}

	maps\mp\gametypes\_spawnlogic::recon_set_spawnpoint(var_02);
	return var_02;
}

//Function Number: 6
onnormaldeath(param_00,param_01,param_02)
{
	level thread spawndogtags(param_00,param_01);
	if(game["state"] == "postgame" && game["teamScores"][param_01.inliveplayerkillstreak] > game["teamScores"][level.matchbonus[param_01.inliveplayerkillstreak]])
	{
		param_01.finalkill = 1;
	}
}

//Function Number: 7
spawndogtags(param_00,param_01)
{
	var_02 = param_00.connectedpostgame["team"];
	if(isdefined(level.dogtags[param_00.assistedsuicide]))
	{
		playfx(level.conf_fx["vanish"],level.dogtags[param_00.assistedsuicide].curorigin);
		level.dogtags[param_00.assistedsuicide] notify("reset");
	}
	else
	{
		var_03[0] = spawn("script_model",(0,0,0));
		var_03[0] setmodel("prop_dogtags_future_enemy_animated");
		var_03[0] method_856C(1);
		var_03[1] = spawn("script_model",(0,0,0));
		var_03[1] setmodel("prop_dogtags_future_friend_animated");
		var_03[1] method_856C(1);
		var_04 = spawn("trigger_radius",(0,0,0),0,32,32);
		level.dogtags[param_00.assistedsuicide] = maps\mp\gametypes\_gameobjects::createuseobject("any",var_04,var_03,(0,0,16));
		maps\mp\_utility::_objective_delete(level.dogtags[param_00.assistedsuicide].objidallies);
		maps\mp\_utility::_objective_delete(level.dogtags[param_00.assistedsuicide].objidaxis);
		maps\mp\_utility::_objective_delete(level.dogtags[param_00.assistedsuicide].objidmlgspectator);
		maps\mp\gametypes\_objpoints::deleteobjpoint(level.dogtags[param_00.assistedsuicide].objpoints["allies"]);
		maps\mp\gametypes\_objpoints::deleteobjpoint(level.dogtags[param_00.assistedsuicide].objpoints["axis"]);
		maps\mp\gametypes\_objpoints::deleteobjpoint(level.dogtags[param_00.assistedsuicide].objpoints["mlg"]);
		level.dogtags[param_00.assistedsuicide] maps\mp\gametypes\_gameobjects::setusetime(0);
		level.dogtags[param_00.assistedsuicide].onuse = ::onuse;
		level.dogtags[param_00.assistedsuicide].victim = param_00;
		level.dogtags[param_00.assistedsuicide].victimteam = var_02;
		level.dogtags[param_00.assistedsuicide].objid = maps\mp\gametypes\_gameobjects::getnextobjid();
		objective_add(level.dogtags[param_00.assistedsuicide].objid,"invisible",(0,0,0));
		objective_icon(level.dogtags[param_00.assistedsuicide].objid,"waypoint_dogtags");
		level thread clearonvictimdisconnect(param_00);
		param_00 thread tagteamupdater(level.dogtags[param_00.assistedsuicide]);
	}

	var_05 = param_00.var_2E6 + (0,0,14);
	level.dogtags[param_00.assistedsuicide].curorigin = var_05;
	level.dogtags[param_00.assistedsuicide].trigger.var_2E6 = var_05;
	level.dogtags[param_00.assistedsuicide].visuals[0].var_2E6 = var_05;
	level.dogtags[param_00.assistedsuicide].visuals[1].var_2E6 = var_05;
	level.dogtags[param_00.assistedsuicide] maps\mp\gametypes\_gameobjects::initializetagpathvariables();
	level.dogtags[param_00.assistedsuicide] maps\mp\gametypes\_gameobjects::allowuse("any");
	level.dogtags[param_00.assistedsuicide].visuals[0] thread showtoteam(level.dogtags[param_00.assistedsuicide],maps\mp\_utility::getotherteam(var_02));
	level.dogtags[param_00.assistedsuicide].visuals[1] thread showtoteam(level.dogtags[param_00.assistedsuicide],var_02);
	level.dogtags[param_00.assistedsuicide].attacker = param_01;
	objective_position(level.dogtags[param_00.assistedsuicide].objid,var_05);
	objective_state(level.dogtags[param_00.assistedsuicide].objid,"active");
	objective_playerenemyteam(level.dogtags[param_00.assistedsuicide].objid,param_00 getentitynumber());
	playsoundatpos(var_05,"mp_killconfirm_tags_drop");
	level.dogtags[param_00.assistedsuicide].visuals[0] scriptmodelplayanim("mp_dogtag_spin");
	level.dogtags[param_00.assistedsuicide].visuals[1] scriptmodelplayanim("mp_dogtag_spin");
}

//Function Number: 8
showtoteam(param_00,param_01)
{
	param_00 endon("death");
	param_00 endon("reset");
	self hide();
	foreach(var_03 in level.var_328)
	{
		if(var_03.inliveplayerkillstreak == param_01)
		{
			self showtoplayer(var_03);
		}

		if(var_03.inliveplayerkillstreak == "spectator" && param_01 == "allies")
		{
			self showtoplayer(var_03);
		}
	}

	for(;;)
	{
		level waittill("joined_team");
		self hide();
		foreach(var_03 in level.var_328)
		{
			if(var_03.inliveplayerkillstreak == param_01)
			{
				self showtoplayer(var_03);
			}

			if(var_03.inliveplayerkillstreak == "spectator" && param_01 == "allies")
			{
				self showtoplayer(var_03);
			}

			if(param_00.victimteam == var_03.inliveplayerkillstreak && var_03 == param_00.attacker)
			{
				objective_state(param_00.objid,"invisible");
			}
		}
	}
}

//Function Number: 9
onuse(param_00)
{
	if(isdefined(param_00.owner))
	{
		param_00 = param_00.owner;
	}

	var_01 = param_00.connectedpostgame["team"];
	if(var_01 == self.victimteam)
	{
		self.trigger playsoundasmaster("mp_kc_tag_denied");
		if(isplayer(param_00))
		{
			param_00 maps\mp\_utility::leaderdialogonplayer("kill_denied");
		}

		if(isdefined(self.attacker) && isplayer(self.attacker))
		{
			self.attacker maps\mp\_utility::leaderdialogonplayer("kc_killlost");
		}

		var_02 = self.victim == param_00;
		param_00 maps\mp\_events::killdeniedevent(var_02);
	}
	else
	{
		self.trigger playsoundasmaster("mp_kc_tag_collected");
		if(isplayer(self.attacker) && self.attacker != param_00)
		{
			level thread maps\mp\gametypes\_rank::awardgameevent("team_confirmed",self.attacker);
		}

		param_00 maps\mp\_events::killconfirmedevent();
		if(isplayer(param_00))
		{
			param_00 maps\mp\_utility::leaderdialogonplayer("kill_confirmed");
		}

		param_00 maps\mp\gametypes\_gamescore::giveteamscoreforobjective(var_01,1);
	}

	level thread maps\mp\_events::monitortagcollector(param_00);
	resettags();
}

//Function Number: 10
resettags()
{
	self.attacker = undefined;
	self notify("reset");
	self.visuals[0] hide();
	self.visuals[1] hide();
	self.curorigin = (0,0,1000);
	self.trigger.var_2E6 = (0,0,1000);
	self.visuals[0].var_2E6 = (0,0,1000);
	self.visuals[1].var_2E6 = (0,0,1000);
	maps\mp\gametypes\_gameobjects::allowuse("none");
	objective_state(self.objid,"invisible");
}

//Function Number: 11
tagteamupdater(param_00)
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("joined_team");
		param_00.victimteam = self.connectedpostgame["team"];
		param_00 resettags();
	}
}

//Function Number: 12
clearonvictimdisconnect(param_00)
{
	level endon("game_ended");
	var_01 = param_00.assistedsuicide;
	param_00 waittill("disconnect");
	if(isdefined(level.dogtags[var_01]))
	{
		level.dogtags[var_01] maps\mp\gametypes\_gameobjects::allowuse("none");
		playfx(level.conf_fx["vanish"],level.dogtags[var_01].curorigin);
		level.dogtags[var_01] notify("reset");
		wait(0.05);
		if(isdefined(level.dogtags[var_01]))
		{
			objective_delete(level.dogtags[var_01].objid);
			level.dogtags[var_01].trigger delete();
			for(var_02 = 0;var_02 < level.dogtags[var_01].visuals.size;var_02++)
			{
				level.dogtags[var_01].visuals[var_02] delete();
			}

			level.dogtags[var_01] notify("deleted");
			level.dogtags[var_01] = undefined;
		}
	}
}