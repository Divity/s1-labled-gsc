/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42951.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 21
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:24:15 PM
*******************************************************************/

//Function Number: 1
lib_A7C7::init()
{
	level._effect["nuke_flash"] = loadfx("vfx/explosion/dna_bomb_flash_mp");
	level._effect["nuke_aftermath"] = loadfx("vfx/dust/nuke_aftermath_mp");
	level._effect["dna_bomb_body_gas"] = loadfx("vfx/explosion/dna_bomb_body_gas");
	game["strings"]["nuclear_strike"] = &"KILLSTREAKS_TACTICAL_NUKE";
	level.killstreakfuncs["nuke"] = ::lib_A7C7::tryusenuke;
	level.killstreakwieldweapons["nuke_mp"] = "nuke";
	setdvarifuninitialized("scr_nukeTimer",10);
	setdvarifuninitialized("scr_nukeCancelMode",0);
	level.nuketimer = getdvarint("scr_nukeTimer");
	level.cancelmode = getdvarint("scr_nukeCancelMode");
	level.nukeemptimeout = 60;
	level.nukeemptimeremaining = int(level.nukeemptimeout);
	level.nukeinfo = spawnstruct();
	level.nukeinfo.xpscalar = 2;
	level.nukedetonated = undefined;
	level thread lib_A7C7::onplayerconnect();
}

//Function Number: 2
lib_A7C7::tryusenuke(param_00,param_01,param_02)
{
	if(isdefined(level.nukeincoming))
	{
		self iprintlnbold(&"KILLSTREAKS_NUKE_ALREADY_INBOUND");
		return 0;
	}

	if(maps\mp\_utility::isusingremote())
	{
		return 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	thread lib_A7C7::donuke(param_02);
	maps\mp\_matchdata::logkillstreakevent("nuke",self.var_2E6);
	return 1;
}

//Function Number: 3
lib_A7C7::delaythread_nuke(param_00,param_01)
{
	level endon("nuke_cancelled");
	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(param_00);
	thread [[ param_01 ]]();
}

//Function Number: 4
lib_A7C7::donuke(param_00)
{
	level endon("nuke_cancelled");
	level.nukeinfo.var_31D = self;
	level.nukeinfo.inliveplayerkillstreak = self.connectedpostgame["team"];
	level.nukeincoming = 1;
	setomnvar("ui_bomb_timer",4);
	if(level.teambased)
	{
		thread maps\mp\_utility::teamplayercardsplash("used_nuke",self,self.inliveplayerkillstreak);
	}
	else if(!level.hardcoremode)
	{
		self iprintlnbold(&"MP_FRIENDLY_TACTICAL_NUKE");
	}

	level thread lib_A7C7::delaythread_nuke(level.nuketimer - 3.3,::lib_A7C7::nukesoundincoming);
	level thread lib_A7C7::delaythread_nuke(level.nuketimer,::lib_A7C7::nukesoundexplosion);
	level thread lib_A7C7::delaythread_nuke(level.nuketimer,::lib_A7C7::nukeslowmo);
	level thread lib_A7C7::delaythread_nuke(level.nuketimer - 0.32,::lib_A7C7::nukeeffects);
	level thread lib_A7C7::delaythread_nuke(level.nuketimer - 0.1,::lib_A7C7::nukevision);
	level thread lib_A7C7::delaythread_nuke(level.nuketimer + 0.5,::lib_A7C7::nukedeath);
	level thread lib_A7C7::delaythread_nuke(level.nuketimer + 1.5,::lib_A7C7::nukeearthquake);
	level thread lib_A7C7::nukeaftermatheffect();
	level thread lib_A7C7::update_ui_timers();
	if(level.cancelmode && param_00)
	{
		level thread lib_A7C7::cancelnukeondeath(self);
	}

	if(!isdefined(level.nuke_clockobject))
	{
		level.nuke_clockobject = spawn("script_origin",(0,0,0));
		level.nuke_clockobject hide();
	}

	if(!isdefined(level.nuke_soundobject))
	{
		level.nuke_soundobject = spawn("script_origin",(0,0,1));
		level.nuke_soundobject hide();
	}

	for(var_01 = level.nuketimer;var_01 > 0;var_01--)
	{
		level.nuke_clockobject playsoundasmaster("ks_dna_warn_timer");
		wait(1);
	}
}

//Function Number: 5
lib_A7C7::cancelnukeondeath(param_00)
{
	param_00 common_scripts\utility::waittill_any("death","disconnect");
	setomnvar("ui_bomb_timer",0);
	level.nukeincoming = undefined;
	level notify("nuke_cancelled");
}

//Function Number: 6
lib_A7C7::nukesoundincoming()
{
	level endon("nuke_cancelled");
	if(isdefined(level.nuke_soundobject))
	{
		level.nuke_soundobject playsoundasmaster("ks_dna_incoming");
	}
}

//Function Number: 7
lib_A7C7::nukesoundexplosion()
{
	level endon("nuke_cancelled");
	if(isdefined(level.nuke_soundobject))
	{
		level.nuke_soundobject playsoundasmaster("ks_dna_explosion");
		level.nuke_soundobject playsoundasmaster("ks_dna_wave");
	}
}

//Function Number: 8
lib_A7C7::nukeeffects()
{
	level endon("nuke_cancelled");
	foreach(var_01 in level.var_328)
	{
		var_02 = anglestoforward(var_01.var_41);
		var_02 = (var_02[0],var_02[1],0);
		var_02 = vectornormalize(var_02);
		var_03 = 300;
		var_04 = spawn("script_model",var_01.var_2E6 + var_02 * var_03);
		var_04 setmodel("tag_origin");
		var_04.var_41 = (0,var_01.var_41[1] + 180,90);
		var_04 thread lib_A7C7::nukeeffect(var_01);
	}
}

//Function Number: 9
lib_A7C7::nukeeffect(param_00)
{
	level endon("nuke_cancelled");
	param_00 endon("disconnect");
	wait 0.05;
	playfxontagforclients(level._effect["nuke_flash"],self,"tag_origin",param_00);
}

//Function Number: 10
lib_A7C7::nukeaftermatheffect()
{
	level endon("nuke_cancelled");
	level waittill("spawning_intermission");
	var_00 = getentarray("mp_global_intermission","classname");
	var_00 = var_00[0];
	var_01 = anglestoup(var_00.var_41);
	var_02 = anglestoright(var_00.var_41);
	playfx(level._effect["nuke_aftermath"],var_00.var_2E6,var_01,var_02);
}

//Function Number: 11
lib_A7C7::nukeslowmo()
{
	level endon("nuke_cancelled");
	setomnvar("ui_bomb_timer",0);
	setslowmotion(1,0.25,0.5);
	level waittill("nuke_death");
	setslowmotion(0.25,1,2);
}

//Function Number: 12
lib_A7C7::nukevision()
{
	level endon("nuke_cancelled");
	var_00 = "dna_bomb";
	if(isdefined(level.dnavisionset))
	{
		var_00 = level.dnavisionset;
	}

	level.var_6277 = 1;
	foreach(var_02 in level.var_328)
	{
		var_02 method_847A(var_00,0.5);
		var_02 thread maps\mp\_flashgrenades::applyflash(1.6,0.35);
	}

	level waittill("nuke_death");
	wait(3);
	foreach(var_02 in level.var_328)
	{
		var_02 method_847A("",10);
	}

	level.var_6277 = undefined;
}

//Function Number: 13
lib_A7C7::nukedeath()
{
	level endon("nuke_cancelled");
	level notify("nuke_death");
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	function_0142(1);
	var_00 = 0;
	foreach(var_02 in level.var_328)
	{
		if(level.teambased)
		{
			if(isdefined(level.nukeinfo.inliveplayerkillstreak) && var_02.inliveplayerkillstreak == level.nukeinfo.inliveplayerkillstreak)
			{
				continue;
			}
		}
		else if(isdefined(level.nukeinfo.var_31D) && var_02 == level.nukeinfo.var_31D)
		{
			continue;
		}

		var_02.var_6268 = 1;
		if(isalive(var_02))
		{
			var_02 thread maps\mp\gametypes\_damage::finishplayerdamagewrapper(level.nukeinfo.var_31D,level.nukeinfo.var_31D,999999,0,"MOD_EXPLOSIVE","nuke_mp",var_02.var_2E6,var_02.var_2E6,"none",0,0);
			if(isdefined(var_02.isjuggernaut) && var_02.isjuggernaut == 1)
			{
				var_02 dodamage(1,var_02.var_2E6,level.nukeinfo.var_31D,level.nukeinfo.var_31D,"MOD_EXPLOSIVE","nuke_mp");
			}

			maps\mp\_utility::delaythread(var_00 + 1,::lib_A7C7::bodygasfx,var_02.body);
			var_00 = var_00 + 0.05;
		}
	}

	level thread lib_A7C7::nuke_empjam();
	level.nukeincoming = undefined;
}

//Function Number: 14
lib_A7C7::bodygasfx(param_00)
{
	if(isdefined(param_00))
	{
		playfxontag(common_scripts\utility::getfx("dna_bomb_body_gas"),param_00,"J_SPINELOWER");
	}
}

//Function Number: 15
lib_A7C7::nukeearthquake()
{
	level endon("nuke_cancelled");
	level waittill("nuke_death");
}

//Function Number: 16
lib_A7C7::nuke_empjam()
{
	level endon("game_ended");
	level notify("nuke_EMPJam");
	level endon("nuke_EMPJam");
	if(level.multiteambased)
	{
		for(var_00 = 0;var_00 < level.teamnamelist.size;var_00++)
		{
			if(level.nukeinfo.inliveplayerkillstreak != level.teamnamelist[var_00])
			{
				level maps\mp\killstreaks\_emp::destroyactivevehicles(level.nukeinfo.var_31D,level.teamnamelist[var_00]);
			}
		}
	}
	else if(level.teambased)
	{
		level maps\mp\killstreaks\_emp::destroyactivevehicles(level.nukeinfo.var_31D,maps\mp\_utility::getotherteam(level.nukeinfo.inliveplayerkillstreak));
	}
	else
	{
		level maps\mp\killstreaks\_emp::destroyactivevehicles(level.nukeinfo.var_31D,maps\mp\_utility::getotherteam(level.nukeinfo.inliveplayerkillstreak));
	}

	level notify("nuke_emp_update");
	level notify("nuke_emp_update");
	level notify("nuke_emp_ended");
}

//Function Number: 17
lib_A7C7::keepnukeemptimeremaining()
{
	level notify("keepNukeEMPTimeRemaining");
	level endon("keepNukeEMPTimeRemaining");
	level endon("nuke_emp_ended");
	level.nukeemptimeremaining = int(level.nukeemptimeout);
	while(level.nukeemptimeremaining)
	{
		wait(1);
		level.nukeemptimeremaining--;
	}
}

//Function Number: 18
lib_A7C7::nuke_empteamtracker()
{
	level endon("game_ended");
	for(;;)
	{
		level common_scripts\utility::waittill_either("joined_team","nuke_emp_update");
		foreach(var_01 in level.var_328)
		{
			if(var_01.inliveplayerkillstreak == "spectator")
			{
				continue;
			}

			if(level.teambased)
			{
				if(isdefined(level.nukeinfo.inliveplayerkillstreak) && var_01.inliveplayerkillstreak == level.nukeinfo.inliveplayerkillstreak)
				{
					continue;
				}
			}
			else if(isdefined(level.nukeinfo.var_31D) && var_01 == level.nukeinfo.var_31D)
			{
				continue;
			}

			if(!level.teamnukeemped[var_01.inliveplayerkillstreak] && !var_01 maps\mp\_utility::isemped())
			{
				var_01 setempjammed(0);
				continue;
			}

			var_01 setempjammed(1);
		}
	}
}

//Function Number: 19
lib_A7C7::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A7C7::onplayerspawned();
	}
}

//Function Number: 20
lib_A7C7::onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		if(isdefined(level.var_6277))
		{
			self method_847A("dna_bomb");
			wait 0.05;
			self method_847A("",10);
		}
	}
}

//Function Number: 21
lib_A7C7::update_ui_timers()
{
	level endon("game_ended");
	level endon("disconnect");
	level endon("nuke_cancelled");
	level endon("nuke_death");
	var_00 = level.nuketimer * 1000 + gettime();
	setomnvar("ui_nuke_end_milliseconds",var_00);
	level waittill("host_migration_begin");
	var_01 = maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	if(var_01 > 0)
	{
		setomnvar("ui_nuke_end_milliseconds",var_00 + var_01);
	}
}