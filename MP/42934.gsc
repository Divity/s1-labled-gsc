/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42934.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:18:31 PM
*******************************************************************/

//Function Number: 1
lib_A7B6::init()
{
	level.killstreakfuncs["agent"] = ::lib_A7B6::tryusesquadmate;
	level.killstreakfuncs["recon_agent"] = ::lib_A7B6::tryusereconsquadmate;
}

//Function Number: 2
lib_A7B6::setup_callbacks()
{
	level.agent_funcs["squadmate"] = level.agent_funcs["player"];
	level.agent_funcs["squadmate"]["think"] = ::lib_A7B6::squadmate_agent_think;
	level.agent_funcs["squadmate"]["on_killed"] = ::lib_A7B6::on_agent_squadmate_killed;
	level.agent_funcs["squadmate"]["on_damaged"] = ::maps\mp\agents\_agents::on_agent_player_damaged;
	level.agent_funcs["squadmate"]["gametype_update"] = ::lib_A7B6::no_gametype_update;
}

//Function Number: 3
lib_A7B6::no_gametype_update()
{
	return 0;
}

//Function Number: 4
lib_A7B6::tryusesquadmate(param_00,param_01)
{
	return lib_A7B6::usesquadmate("agent");
}

//Function Number: 5
lib_A7B6::tryusereconsquadmate(param_00,param_01)
{
	return lib_A7B6::usesquadmate("reconAgent");
}

//Function Number: 6
lib_A7B6::usesquadmate(param_00)
{
	if(maps\mp\agents\_agent_utility::getnumactiveagents("squadmate") >= 5)
	{
		self iprintlnbold(&"KILLSTREAKS_AGENT_MAX");
		return 0;
	}

	if(maps\mp\agents\_agent_utility::getnumownedactiveagents(self) >= 2)
	{
		self iprintlnbold(&"KILLSTREAKS_AGENT_MAX");
		return 0;
	}

	var_01 = maps\mp\agents\_agent_utility::getvalidspawnpathnodenearplayer(0,1);
	if(!isdefined(var_01))
	{
		return 0;
	}

	if(!maps\mp\_utility::isreallyalive(self))
	{
		return 0;
	}

	var_02 = var_01.var_2E6;
	var_03 = vectortoangles(self.var_2E6 - var_01.var_2E6);
	var_04 = maps\mp\agents\_agents::add_humanoid_agent("squadmate",self.inliveplayerkillstreak,undefined,var_02,var_03,self,0,0,"veteran");
	if(!isdefined(var_04))
	{
		self iprintlnbold(&"KILLSTREAKS_AGENT_MAX");
		return 0;
	}

	var_04.killstreaktype = param_00;
	if(var_04.killstreaktype == "reconAgent")
	{
		var_04 thread lib_A7B6::sendagentweaponnotify("iw6_riotshield_mp");
		var_04 thread lib_A7B6::finishreconagentloadout();
		var_04 thread maps\mp\gametypes\_class::giveandapplyloadout(self.connectedpostgame["team"],"reconAgent",0);
		var_04 maps\mp\agents\_agent_common::set_agent_health(250);
		var_04 maps\mp\perks\_perkfunctions::setlightarmor();
	}
	else
	{
		var_04 maps\mp\perks\_perkfunctions::setlightarmor();
	}

	var_04 maps\mp\_utility::_setnameplatematerial("player_name_bg_green_agent","player_name_bg_red_agent");
	return 1;
}

//Function Number: 7
lib_A7B6::finishreconagentloadout()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self waittill("applyLoadout");
	maps\mp\perks\_perkfunctions::setlightarmor();
	maps\mp\_utility::giveperk("specialty_quickswap",0);
	maps\mp\_utility::giveperk("specialty_regenfaster",0);
}

//Function Number: 8
lib_A7B6::sendagentweaponnotify(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self waittill("applyLoadout");
	if(!isdefined(param_00))
	{
		param_00 = "iw6_riotshield_mp";
	}

	self notify("weapon_change",param_00);
}

//Function Number: 9
lib_A7B6::squadmate_agent_think()
{
	self endon("death");
	self endon("disconnect");
	self endon("owner_disconnect");
	level endon("game_ended");
	for(;;)
	{
		self botsetflag("prefer_shield_out",1);
		var_00 = self [[ maps\mp\agents\_agent_utility::agentfunc("gametype_update") ]]();
		if(!var_00)
		{
			if(!maps\mp\bots\_bots_util::bot_is_guarding_player(self.owner))
			{
				maps\mp\bots\_bots_strategy::bot_guard_player(self.owner,350);
			}
		}

		wait(0.05);
	}
}

//Function Number: 10
lib_A7B6::on_agent_squadmate_killed(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	maps\mp\agents\_agents::on_humanoid_agent_killed_common(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,0);
	if(isplayer(param_01) && isdefined(self.owner) && param_01 != self.owner)
	{
		self.owner maps\mp\_utility::leaderdialogonplayer("squad_killed");
		maps\mp\gametypes\_damage::onkillstreakkilled(param_01,param_04,param_03,param_02,"destroyed_squad_mate");
	}

	maps\mp\agents\_agent_utility::deactivateagent();
}