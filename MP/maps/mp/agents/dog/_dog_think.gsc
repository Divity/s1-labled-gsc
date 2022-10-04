/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _dog_think.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 39
 * Decompile Time: 2212 ms
 * Timestamp: 4/20/2022 8:12:58 PM
*******************************************************************/

//Function Number: 1
main()
{
	setupdogstate();
	thread think();
	thread watchownerdamage();
	thread watchownerdeath();
	thread watchownerteamchange();
	thread waitforbadpath();
	thread waitforpathset();
}

//Function Number: 2
setupdogstate()
{
	self.blockgoalpos = 0;
	self.ownerradiussq = 20736;
	self.meleeradiussq = 16384;
	self.attackoffset = 25 + self.radius;
	self.attackradiussq = 202500;
	self.warningradiussq = 302500;
	self.warningzheight = 96;
	self.attackzheight = 54;
	self.attackzheightdown = -64;
	self.ownerdamagedradiussq = 2250000;
	self.dogdamagedradiussq = 2250000;
	self.keeppursuingtargetradiussq = 1000000;
	self.preferredoffsetfromowner = 76;
	self.minoffsetfromowner = 50;
	self.forceattack = 0;
	self.ignoreclosefoliage = 1;
	self.movemode = "run";
	self.enableextendedkill = 1;
	self.attackstate = "idle";
	self.movestate = "idle";
	self.bhasbadpath = 0;
	self.timeoflastdamage = 0;
	self.allowcrouch = 1;
	self setgoalradius(24);
}

//Function Number: 3
init()
{
	self.animcbs = spawnstruct();
	self.animcbs.onenter = [];
	self.animcbs.onenter["idle"] = ::maps\mp\agents\dog\_dog_idle::main;
	self.animcbs.onenter["move"] = ::maps\mp\agents\dog\_dog_move::main;
	self.animcbs.onenter["traverse"] = ::maps\mp\agents\dog\_dog_traverse::main;
	self.animcbs.onenter["melee"] = ::maps\mp\agents\dog\_dog_melee::main;
	self.animcbs.onexit = [];
	self.animcbs.onexit["idle"] = ::maps\mp\agents\dog\_dog_idle::end_script;
	self.animcbs.onexit["move"] = ::maps\mp\agents\dog\_dog_move::end_script;
	self.animcbs.onexit["melee"] = ::maps\mp\agents\dog\_dog_melee::end_script;
	self.animcbs.onexit["traverse"] = ::maps\mp\agents\dog\_dog_traverse::end_script;
	self.watchattackstatefunc = ::watchattackstate;
	self.aistate = "idle";
	self.movemode = "fastwalk";
	self.radius = 15;
	self.height = 40;
}

//Function Number: 4
onenteranimstate(param_00,param_01)
{
	self notify("killanimscript");
	if(!isdefined(self.animcbs.onenter[param_01]))
	{
		return;
	}

	if(param_00 == param_01 && param_01 != "traverse")
	{
		return;
	}

	if(isdefined(self.animcbs.onexit[param_00]))
	{
		self [[ self.animcbs.onexit[param_00] ]]();
	}

	exitaistate(self.aistate);
	self.aistate = param_01;
	enteraistate(param_01);
	self [[ self.animcbs.onenter[param_01] ]]();
}

//Function Number: 5
think()
{
	self endon("death");
	level endon("game_ended");
	if(isdefined(self.owner))
	{
		self endon("owner_disconnect");
		thread destroyonownerdisconnect(self.owner);
	}

	self thread [[ self.watchattackstatefunc ]]();
	thread monitorflash();
	if(self.aistate != "melee" && !self.statelocked && readytomeleetarget() && !didpastmeleefail())
	{
		self beginmelee(self.curmeleetarget);
	}

	switch(self.aistate)
	{
		case "idle":
			break;

		case "move":
			break;

		case "melee":
			break;
	}
}

//Function Number: 6
didpastpursuitfail(param_00)
{
	if(isdefined(self.curmeleetarget) && param_00 != self.curmeleetarget)
	{
		return 0;
	}

	if(!isdefined(self.lastpursuitfailedpos) || !isdefined(self.lastpursuitfailedmypos))
	{
		return 0;
	}

	if(distance2dsquared(param_00.var_2E6,self.lastpursuitfailedpos) > 4)
	{
		return 0;
	}

	if(self.blastpursuitfailedposbad)
	{
		return 1;
	}

	if(distancesquared(self.var_2E6,self.lastpursuitfailedmypos) > 4096 && gettime() - self.lastpursuitfailedtime > 2000)
	{
		return 0;
	}

	return 1;
}

//Function Number: 7
didpastmeleefail()
{
	if(isdefined(self.lastmeleefailedpos) && isdefined(self.lastmeleefailedmypos) && distance2dsquared(self.curmeleetarget.var_2E6,self.lastmeleefailedpos) < 4 && distancesquared(self.var_2E6,self.lastmeleefailedmypos) < 2500)
	{
		return 1;
	}

	if(wanttoattacktargetbutcant(0))
	{
		return 1;
	}

	return 0;
}

//Function Number: 8
enteraistate(param_00)
{
	exitaistate(self.aistate);
	self.aistate = param_00;
	switch(param_00)
	{
		case "idle":
			break;

		case "move":
			break;

		case "melee":
			break;

		default:
			break;
	}
}

//Function Number: 9
exitaistate(param_00)
{
	switch(param_00)
	{
		case "move":
			break;

		default:
			break;
	}
}

//Function Number: 10
updateidle()
{
	updatemovestate();
}

//Function Number: 11
updatemove()
{
	updatemovestate();
}

//Function Number: 12
updatemelee()
{
	self setgoalpos(self.var_2E6);
}

//Function Number: 13
updatemovestate()
{
	if(self.blockgoalpos)
	{
		return;
	}

	self.prevmovestate = self.movestate;
	var_00 = undefined;
	var_01 = 0;
	var_02 = 0;
	var_03 = 500;
	if(self.bhasbadpath && gettime() - self.lastbadpathtime < var_03)
	{
		self.movestate = "follow";
		var_01 = 1;
	}
	else
	{
		self.movestate = getmovestate();
	}

	if(self.movestate == "pursuit")
	{
		var_00 = getattackpoint(self.enemy);
		var_04 = 0;
		if(isdefined(self.lastbadpathtime) && gettime() - self.lastbadpathtime < 3000)
		{
			if(distance2dsquared(var_00,self.lastbadpathgoal) < 16)
			{
				var_04 = 1;
			}
			else if(isdefined(self.lastbadpathmovestate) && self.lastbadpathmovestate == "pursuit" && distance2dsquared(self.lastbadpathultimategoal,self.enemy.var_2E6) < 16)
			{
				var_04 = 1;
			}
		}

		if(var_04)
		{
			self.movestate = "follow";
			var_02 = 1;
		}
		else if(wanttoattacktargetbutcant(1))
		{
			self.movestate = "follow";
			var_02 = 1;
		}
		else if(didpastpursuitfail(self.enemy))
		{
			self.movestate = "follow";
			var_02 = 1;
		}
	}

	setpastpursuitfailed(var_02);
	if(self.movestate == "follow")
	{
		self.curmeleetarget = undefined;
		self.movemode = getfollowmovemode(self.movemode);
		self.barrivalsenabled = 1;
		var_05 = self getpathgoalpos();
		if(!isdefined(var_05))
		{
			var_05 = self.var_2E6;
		}

		if(self.owner.sessionstate == "spectator")
		{
			return;
		}

		if(gettime() - self.timeoflastdamage < 5000)
		{
			var_01 = 1;
		}

		var_06 = self.owner getstance();
		if(!isdefined(self.owner.prevstance) && isdefined(self.owner))
		{
			self.owner.prevstance = var_06;
		}

		var_07 = !isdefined(self.ownerprevpos) || distance2dsquared(self.ownerprevpos,self.owner.var_2E6) > 100;
		if(var_07)
		{
			self.ownerprevpos = self.owner.var_2E6;
		}

		var_08 = distance2dsquared(var_05,self.owner.var_2E6);
		if(var_01 || var_08 > self.ownerradiussq && var_07 || self.owner.prevstance != var_06 || self.prevmovestate != "idle" && self.prevmovestate != self.movestate)
		{
			self setgoalpos(findpointnearowner());
			self.owner.prevstance = var_06;
			return;
		}

		return;
	}

	if(self.movestate == "pursuit")
	{
		self.curmeleetarget = self.enemy;
		self.movemode = "sprint";
		self.barrivalsenabled = 0;
		self setgoalpos(var_00);
	}
}

//Function Number: 14
getmovestate(param_00)
{
	if(isdefined(self.enemy))
	{
		if(isdefined(self.favoriteenemy) && self.enemy == self.favoriteenemy)
		{
			return "pursuit";
		}

		if(abs(self.var_2E6[2] - self.enemy.var_2E6[2]) < self.warningzheight && distance2dsquared(self.enemy.var_2E6,self.var_2E6) < self.attackradiussq)
		{
			return "pursuit";
		}

		if(isdefined(self.curmeleetarget) && self.curmeleetarget == self.enemy)
		{
			if(distance2dsquared(self.curmeleetarget.var_2E6,self.var_2E6) < self.keeppursuingtargetradiussq)
			{
				return "pursuit";
			}
		}
	}

	return "follow";
}

//Function Number: 15
setpastpursuitfailed(param_00)
{
	if(param_00)
	{
		if(!isdefined(self.lastpursuitfailedpos))
		{
			self.lastpursuitfailedpos = self.enemy.var_2E6;
			self.lastpursuitfailedmypos = self.var_2E6;
			var_01 = maps\mp\agents\_scriptedagents::droppostoground(self.enemy.var_2E6);
			self.blastpursuitfailedposbad = !isdefined(var_01);
			self.lastpursuitfailedtime = gettime();
			return;
		}

		return;
	}

	self.lastpursuitfailedpos = undefined;
	self.lastpursuitfailedmypos = undefined;
	self.blastpursuitfailedposbad = undefined;
	self.lastpursuitfailedtime = undefined;
}

//Function Number: 16
waitforbadpath()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		self waittill("bad_path",var_00);
		self.bhasbadpath = 1;
		self.lastbadpathtime = gettime();
		self.lastbadpathgoal = var_00;
		self.lastbadpathmovestate = self.movestate;
		if(self.movestate == "follow" && isdefined(self.owner))
		{
			self.lastbadpathultimategoal = self.owner.var_2E6;
			continue;
		}

		if(self.movestate == "pursuit" && isdefined(self.enemy))
		{
			self.lastbadpathultimategoal = self.enemy.var_2E6;
		}
	}
}

//Function Number: 17
waitforpathset()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		self waittill("path_set");
		self.bhasbadpath = 0;
	}
}

//Function Number: 18
getfollowmovemode(param_00)
{
	var_01 = 40000;
	var_02 = 65536;
	var_03 = self getpathgoalpos();
	if(isdefined(var_03))
	{
		var_04 = distancesquared(var_03,self.var_2E6);
		if(param_00 == "run" || param_00 == "sprint")
		{
			if(var_04 < var_01)
			{
				return "fastwalk";
			}
			else if(param_00 == "sprint")
			{
				return "run";
			}
		}
		else if(param_00 == "fastwalk")
		{
			if(var_04 > var_02)
			{
				return "run";
			}
		}
	}

	return param_00;
}

//Function Number: 19
iswithinattackheight(param_00)
{
	var_01 = param_00[2] - self.var_2E6[2];
	return var_01 <= self.attackzheight && var_01 >= self.attackzheightdown;
}

//Function Number: 20
wanttoattacktargetbutcant(param_00)
{
	if(!isdefined(self.curmeleetarget))
	{
		return 0;
	}

	return !iswithinattackheight(self.curmeleetarget.var_2E6) && distance2dsquared(self.var_2E6,self.curmeleetarget.var_2E6) < self.meleeradiussq * 0.75 * 0.75 && !param_00 || self agentcanseesentient(self.curmeleetarget);
}

//Function Number: 21
readytomeleetarget()
{
	if(!isdefined(self.curmeleetarget))
	{
		return 0;
	}

	if(!maps\mp\_utility::isreallyalive(self.curmeleetarget))
	{
		return 0;
	}

	if(self.aistate == "traverse")
	{
		return 0;
	}

	if(distance2dsquared(self.var_2E6,self.curmeleetarget.var_2E6) > self.meleeradiussq)
	{
		return 0;
	}

	if(!iswithinattackheight(self.curmeleetarget.var_2E6))
	{
		return 0;
	}

	return 1;
}

//Function Number: 22
wantstogrowlattarget()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(abs(self.var_2E6[2] - self.enemy.var_2E6[2]) <= self.warningzheight || self agentcanseesentient(self.enemy))
	{
		var_00 = distance2dsquared(self.var_2E6,self.enemy.var_2E6);
		if(var_00 < self.warningradiussq)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 23
getattackpoint(param_00)
{
	var_01 = param_00.var_2E6 - self.var_2E6;
	var_01 = vectornormalize(var_01);
	var_02 = self getpathgoalpos();
	var_03 = self.attackoffset + 4;
	if(isdefined(var_02) && distance2dsquared(var_02,param_00.var_2E6) < var_03 * var_03 && maps\mp\agents\_scriptedagents::canmovepointtopoint(param_00.var_2E6,var_02))
	{
		return var_02;
	}

	var_04 = param_00.var_2E6 - var_01 * self.attackoffset;
	var_04 = maps\mp\agents\_scriptedagents::droppostoground(var_04);
	if(!isdefined(var_04))
	{
		return param_00.var_2E6;
	}

	if(!maps\mp\agents\_scriptedagents::canmovepointtopoint(param_00.var_2E6,var_04))
	{
		var_05 = anglestoforward(param_00.var_41);
		var_04 = param_00.var_2E6 + var_05 * self.attackoffset;
		if(!maps\mp\agents\_scriptedagents::canmovepointtopoint(param_00.var_2E6,var_04))
		{
			return param_00.var_2E6;
		}
	}

	return var_04;
}

//Function Number: 24
cross2d(param_00,param_01)
{
	return param_00[0] * param_01[1] - param_01[0] * param_00[1];
}

//Function Number: 25
findpointnearowner()
{
	var_00 = vectornormalize(self.var_2E6 - self.owner.var_2E6);
	var_01 = anglestoforward(self.owner.var_41);
	var_01 = (var_01[0],var_01[1],0);
	var_01 = vectornormalize(var_01);
	var_02 = cross2d(var_00,var_01);
	var_03 = function_00C5(self.owner.var_2E6);
	if(!isdefined(var_03))
	{
		return self.var_2E6;
	}

	var_04 = function_0210(var_03);
	var_05 = 5;
	var_06 = 10;
	var_07 = 15;
	var_08 = -15;
	var_09 = gettime() - self.timeoflastdamage < 5000;
	var_0A = 0;
	var_0B = 0;
	var_04[var_04.size] = var_03;
	var_0C = var_04;
	var_16 = getfirstarraykey(var_0C);
	if(isdefined(var_16))
	{
		var_0D = var_0C[var_16];
		var_0E = 0;
		var_0F = var_0D.var_2E6 - self.owner.var_2E6;
		var_10 = length(var_0F);
		if(var_10 >= self.preferredoffsetfromowner)
		{
			var_0E = var_0E + var_05;
		}
		else if(var_10 < self.minoffsetfromowner)
		{
			var_11 = 1 - self.minoffsetfromowner - var_10 / self.minoffsetfromowner;
			var_0E = var_0E + var_05 * var_11 * var_11;
		}
		else
		{
			var_0E = var_0E + var_05 * var_10 / self.preferredoffsetfromowner;
		}

		if(var_10 == 0)
		{
			var_10 = 1;
		}

		var_0F = var_0F / var_10;
		var_12 = vectordot(var_01,var_0F);
		var_13 = self.owner getstance();
		switch(var_13)
		{
			case "stand":
				break;

			case "crouch":
				break;

			case "prone":
				break;
		}
	}
}

//Function Number: 26
destroyonownerdisconnect(param_00)
{
	self endon("death");
	param_00 common_scripts\utility::waittill_any("disconnect","joined_team");
	self notify("owner_disconnect");
	if(maps\mp\gametypes\_hostmigration::waittillhostmigrationdone())
	{
		wait(0.05);
	}

	self notify("killanimscript");
	if(isdefined(self.animcbs.onexit[self.aistate]))
	{
		self [[ self.animcbs.onexit[self.aistate] ]]();
	}

	self suicide();
}

//Function Number: 27
watchattackstate()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		if(self.aistate == "melee")
		{
			if(self.attackstate != "melee")
			{
				self.attackstate = "melee";
				setsoundstate(undefined);
			}
		}
		else if(self.movestate == "pursuit")
		{
			if(self.attackstate != "attacking")
			{
				self.attackstate = "attacking";
				setsoundstate("bark","attacking");
			}
		}
		else if(self.attackstate != "warning")
		{
			if(wantstogrowlattarget())
			{
				self.attackstate = "warning";
				setsoundstate("growl","warning");
			}
			else
			{
				self.attackstate = self.aistate;
				setsoundstate("pant");
			}
		}
		else if(!wantstogrowlattarget())
		{
			self.attackstate = self.aistate;
			setsoundstate("pant");
		}

		wait(0.05);
	}
}

//Function Number: 28
setsoundstate(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		self notify("end_dog_sound");
		self.soundstate = undefined;
		return;
	}

	if(!isdefined(self.soundstate) || self.soundstate != param_00)
	{
		self notify("end_dog_sound");
		self.soundstate = param_00;
		if(param_00 == "bark")
		{
			thread playbark(param_01);
			return;
		}

		if(param_00 == "growl")
		{
			thread playgrowl(param_01);
			return;
		}

		if(param_00 == "pant")
		{
			thread playpanting();
			return;
		}

		return;
	}
}

//Function Number: 29
playbark(param_00)
{
	self endon("death");
	level endon("game_ended");
	self endon("end_dog_sound");
	if(!isdefined(self.barking_sound))
	{
		self.barking_sound = 1;
		thread watchbarking();
	}
}

//Function Number: 30
watchbarking()
{
	self endon("death");
	level endon("game_ended");
	self endon("end_dog_sound");
	wait(randomintrange(5,10));
	self.barking_sound = undefined;
}

//Function Number: 31
playgrowl(param_00)
{
	self endon("death");
	level endon("game_ended");
	self endon("end_dog_sound");
	if(isdefined(self.lastgrowlplayedtime) && gettime() - self.lastgrowlplayedtime < 3000)
	{
		wait(3);
	}

	for(;;)
	{
		self.lastgrowlplayedtime = gettime();
		wait(randomintrange(3,6));
	}
}

//Function Number: 32
playpanting(param_00)
{
	self endon("death");
	level endon("game_ended");
	self endon("end_dog_sound");
	if(isdefined(self.lastpantplayedtime) && gettime() - self.lastpantplayedtime < 3000)
	{
		wait(3);
	}

	self.lastpantplayedtime = gettime();
	for(;;)
	{
		if(self.aistate == "idle")
		{
			wait(3);
			continue;
		}

		self.lastpantplayedtime = gettime();
		wait(randomintrange(6,8));
	}
}

//Function Number: 33
watchownerdamage()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		if(!isdefined(self.owner))
		{
			return;
		}

		self.owner waittill("damage",var_00,var_01);
		if(isplayer(var_01) && var_01 != self.owner)
		{
			if(self.attackstate == "attacking")
			{
				continue;
			}

			if(distancesquared(self.owner.var_2E6,self.var_2E6) > self.ownerdamagedradiussq)
			{
				continue;
			}

			if(distancesquared(self.owner.var_2E6,var_01.var_2E6) > self.ownerdamagedradiussq)
			{
				continue;
			}

			self.favoriteenemy = var_01;
			self.forceattack = 1;
			thread watchfavoriteenemydeath();
		}
	}
}

//Function Number: 34
watchownerdeath()
{
	self endon("death");
	level endon("game_ended");
	if(!isdefined(self.owner))
	{
		return;
	}

	self.owner waittill("death");
	switch(level.gametype)
	{
		case "sd":
			break;

		case "sr":
			break;
	}
}

//Function Number: 35
watchownerteamchange()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		if(!isdefined(self.owner))
		{
			return;
		}

		var_00 = self.owner common_scripts\utility::waittill_any_return_no_endon_death("joined_team","joined_spectators");
		if(isdefined(var_00) && var_00 == "joined_team" || var_00 == "joined_spectators")
		{
			maps\mp\agents\_agent_utility::killdog();
		}
	}
}

//Function Number: 36
watchfavoriteenemydeath()
{
	self notify("watchFavoriteEnemyDeath");
	self endon("watchFavoriteEnemyDeath");
	self endon("death");
	self.favoriteenemy common_scripts\utility::waittill_any_timeout(5,"death","disconnect");
	self.favoriteenemy = undefined;
	self.forceattack = 0;
}

//Function Number: 37
ondamage(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	self.timeoflastdamage = gettime();
	if(isdefined(self.owner))
	{
		self.damagedownertome = vectornormalize(self.var_2E6 - self.owner.var_2E6);
	}

	if(shouldplayhitreaction(param_02,param_05,param_04))
	{
		switch(self.aistate)
		{
			case "idle":
				break;

			case "move":
				break;
		}
	}
}

//Function Number: 38
shouldplayhitreaction(param_00,param_01,param_02)
{
	if(isdefined(param_01) && weaponclass(param_01) == "sniper")
	{
		return 1;
	}

	if(isdefined(param_02) && isexplosivedamagemod(param_02) && param_00 >= 10)
	{
		return 1;
	}

	if(isdefined(param_02) && param_02 == "MOD_MELEE")
	{
		return 1;
	}

	if(isdefined(param_01) && param_01 == "concussion_grenade_mp")
	{
		return 1;
	}

	return 0;
}

//Function Number: 39
monitorflash()
{
	self endon("death");
	self waittill("flashbang",var_00,var_01,var_02,var_03,var_04,var_05);
	if(isdefined(var_03) && var_03 == self.owner)
	{
		continue;
	}

	switch(self.aistate)
	{
		case "idle":
			break;

		case "move":
			break;
	}
}