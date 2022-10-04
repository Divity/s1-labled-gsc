/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42954.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 37
 * Decompile Time: 8 ms
 * Timestamp: 4/20/2022 8:18:34 PM
*******************************************************************/

//Function Number: 1
lib_A7CA::initstart()
{
	level.orbital_util_remote_traces_frame = 0;
	level.orbital_util_remote_traces = 5;
	level.orbital_util_capsule_traces_frame = 0;
	level.orbital_util_capsule_traces = 5;
	level.orbital_util_last_trace = 0;
	level thread lib_A7CA::deletemapremotemissileclip();
	level.orbital_util_covered_volumes = getentarray("orbital_node_covered","targetname");
}

//Function Number: 2
lib_A7CA::deletemapremotemissileclip()
{
	var_00 = getentarray("carepackage_clip","targetname");
	foreach(var_02 in var_00)
	{
		var_02 delete();
	}
}

//Function Number: 3
lib_A7CA::playergetoutsidenode(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "goliath";
	}

	var_01 = lib_A7CA::playergetnodelookingat(param_00);
	if(!isdefined(var_01))
	{
		return;
	}

	self.lastnodelookingattrace = undefined;
	return var_01;
}

//Function Number: 4
lib_A7CA::playergetorbitalstartpos(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "goliath";
	}

	var_02 = maps\mp\killstreaks\_aerial_utility::getentorstructarray("remoteMissileSpawn","targetname");
	var_03 = lib_A7CA::nodegetremotemissileorigin(param_00,var_02,param_01);
	if(isdefined(var_03))
	{
		return var_03;
	}

	return lib_A7CA::nodegetremotemissileorgfromabove(param_00);
}

//Function Number: 5
lib_A7CA::getstartpositionabove(param_00)
{
	return param_00.var_2E6 + (0,0,24000);
}

//Function Number: 6
lib_A7CA::adddropmarker(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "goliath";
	}

	param_00.orbitaltype = param_01;
	level.orbitaldropmarkers[level.orbitaldropmarkers.size] = param_00;
	thread lib_A7CA::_adddropmarkerinternal(param_00);
}

//Function Number: 7
lib_A7CA::playerplayinvalidpositioneffect(param_00)
{
	var_01 = self.lastnodelookingattrace;
	var_02 = self.lastnearestnode;
	if(!isdefined(var_01))
	{
		var_03 = anglestoforward(self getplayerangles());
		var_04 = self geteye();
		var_05 = var_04 + var_03 * 500;
		var_01 = bullettrace(var_04,var_05,0,self,1,0,0,0,0);
	}

	self.lastnodelookingattrace = undefined;
	self.lastnearestnode = undefined;
	var_06 = var_01["position"];
	if(isdefined(var_02))
	{
		var_07 = var_01["normal"];
		var_08 = var_07[2] > 0.8;
		if(!var_08)
		{
			var_06 = var_02.var_2E6;
		}
	}

	var_09 = spawn("script_model",var_06 + (0,0,5));
	var_09.var_41 = (-90,0,0);
	var_09 setmodel("tag_origin");
	var_09 hide();
	var_09 showtoplayer(self);
	playfxontag(param_00,var_09,"tag_origin");
	wait(5);
	var_09 delete();
}

//Function Number: 8
lib_A7CA::playergetnodelookingat(param_00)
{
	var_01 = anglestoforward(self getplayerangles());
	var_02 = self geteye();
	var_03 = var_02 + var_01 * 500;
	var_04 = bullettrace(var_02,var_03,0,self,1,0,0,0,0);
	self.lastnodelookingattrace = var_04;
	var_05 = var_04["fraction"] == 1;
	if(var_05)
	{
		return lib_A7CA::playergetnearestnode(undefined,param_00);
	}

	var_06 = var_04["position"];
	var_07 = getnodesinradius(var_06,128,0,60);
	var_08 = var_07.size == 0;
	if(var_08)
	{
		return lib_A7CA::playergetnearestnode(undefined,param_00);
	}

	var_09 = var_04["normal"];
	var_0A = var_09[2] > 0.8;
	if(!var_0A)
	{
		return lib_A7CA::playergetnearestnode(var_06,param_00);
	}

	if(orbitalbadlandingcheck(var_06))
	{
		return lib_A7CA::playergetnearestnode(var_06,param_00);
	}

	if(param_00 == "goliath")
	{
		if(lib_A7CA::goliathbadlandingcheck(var_06))
		{
			return lib_A7CA::playergetnearestnode(var_06,param_00);
		}
	}

	var_0B = lib_A7CA::carepackagetrace(var_06,self,param_00);
	if(!var_0B)
	{
		return lib_A7CA::playergetnearestnode(var_06,param_00);
	}

	if(groundpositionoffedge(var_06,param_00))
	{
		return lib_A7CA::playergetnearestnode(var_06,param_00);
	}

	var_0D = spawnstruct();
	var_0D.var_2E6 = var_06;
	var_0E = maps\mp\killstreaks\_aerial_utility::getentorstructarray("remoteMissileSpawn","targetname");
	var_0F = lib_A7CA::nodegetremotemissileorigin(var_0D,var_0E,param_00);
	if(!isdefined(var_0F))
	{
		return lib_A7CA::playergetnearestnode(var_06,param_00);
	}

	return var_0D;
}

//Function Number: 9
groundpositionoffedge(param_00,param_01)
{
	if(param_01 == "goliath")
	{
		var_02 = 41;
	}
	else
	{
		var_02 = 26;
	}

	var_03 = (var_02,0,0);
	var_04 = -1 * var_03;
	var_05 = (0,var_02,0);
	var_06 = -1 * var_05;
	var_07 = (0,0,-10);
	var_08 = [var_03,var_04,var_05,var_06];
	foreach(var_0A in var_08)
	{
		var_0B = param_00 + var_0A;
		var_0C = param_00 + var_0A + var_07;
		var_0D = bullettracepassed(var_0B,var_0C,0,undefined);
		if(var_0D)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 10
_nodefindnewremotemissileorg(param_00,param_01,param_02)
{
	var_03 = lib_A7CA::nodefindremotemissleent(param_00,param_01,param_02);
	if(isdefined(var_03))
	{
		return lib_A7CA::nodegetremotemissleentorg(param_00,param_01);
	}

	var_04 = lib_A7CA::nodetestfirefromabove(param_00,param_02);
	if(isdefined(var_04))
	{
		return lib_A7CA::nodegetremotemissileorgfromabove(param_00);
	}
}

//Function Number: 11
lib_A7CA::nodegetremotemissileorigin(param_00,param_01,param_02)
{
	if(lib_A7CA::nodehasremotemissiledataset(param_00))
	{
		if(!lib_A7CA::nodeisremotemissilefromabove(param_00))
		{
			return lib_A7CA::nodegetremotemissleentorg(param_00,param_01);
		}

		return lib_A7CA::nodegetremotemissileorgfromabove(param_00);
	}

	return _nodefindnewremotemissileorg(param_00,param_01,param_02);
}

//Function Number: 12
lib_A7CA::nodeispathnode(param_00)
{
	return isdefined(param_00.type);
}

//Function Number: 13
lib_A7CA::nodeisremotemissilefromabove(param_00)
{
	return (lib_A7CA::nodeispathnode(param_00) && function_02C8(param_00) && function_02C9(param_00) == "up") || isdefined(param_00.bestmissilespawnabove);
}

//Function Number: 14
lib_A7CA::nodehasremotemissiledataset(param_00)
{
	return (lib_A7CA::nodeispathnode(param_00) && function_02C8(param_00)) || isdefined(param_00.bestmissilespawnabove) || isdefined(param_00.bestmissilespawn);
}

//Function Number: 15
lib_A7CA::nodegetremotemissileorgfromabove(param_00)
{
	return lib_A7CA::getstartpositionabove(param_00);
}

//Function Number: 16
lib_A7CA::nodetestfirefromabove(param_00,param_01)
{
	var_02 = lib_A7CA::getstartpositionabove(param_00);
	var_03 = lib_A7CA::remotemissileenttracetooriginpassedwrapper(var_02,param_00.var_2E6,param_01);
	if(var_03)
	{
		param_00.bestmissilespawnabove = var_02;
		return var_02;
	}
}

//Function Number: 17
lib_A7CA::nodegetremotemissleentorg(param_00,param_01)
{
	var_02 = undefined;
	if(lib_A7CA::nodeispathnode(param_00) && function_02C8(param_00))
	{
		var_03 = function_02C9(param_00);
		foreach(var_05 in param_01)
		{
			if(isdefined(var_05.var_39B) && var_05.var_39B == var_03)
			{
				var_02 = var_05;
			}
		}
	}
	else if(isdefined(param_00.bestmissilespawn))
	{
		var_02 = param_00.bestmissilespawn;
	}

	var_07 = vectornormalize(var_02.var_2E6 - param_00.var_2E6);
	return param_00.var_2E6 + var_07 * 24000;
}

//Function Number: 18
lib_A7CA::nodefindremotemissleent(param_00,param_01,param_02)
{
	param_01 = sortbydistance(param_01,param_00.var_2E6);
	foreach(var_04 in param_01)
	{
		var_05 = lib_A7CA::remotemissileenttracetooriginpassedwrapper(var_04.var_2E6,param_00.var_2E6,param_02);
		if(var_05)
		{
			param_00.bestmissilespawn = var_04;
			return var_04;
		}

		wait 0.05;
	}
}

//Function Number: 19
lib_A7CA::remotemissileenttracetooriginpassedwrapper(param_00,param_01,param_02)
{
	if(level.orbital_util_remote_traces_frame != gettime())
	{
		level.orbital_util_remote_traces_frame = gettime();
		level.orbital_util_remote_traces = 5;
	}

	if(level.orbital_util_remote_traces <= 0)
	{
		if(level.orbital_util_last_trace != gettime())
		{
			wait 0.05;
			level.orbital_util_last_trace = gettime();
		}

		level.orbital_util_remote_traces = 5;
	}

	level.orbital_util_remote_traces--;
	var_03 = 26;
	if(param_02 == "goliath")
	{
		var_03 = 41;
	}

	return function_02CA(param_00,param_01,var_03,1);
}

//Function Number: 20
lib_A7CA::nodecanhitground(param_00,param_01)
{
	if(orbitalbadlandingcheck(param_00.var_2E6))
	{
		return 0;
	}

	if(isdefined(param_01) && param_01 == "goliath")
	{
		if(lib_A7CA::goliathbadlandingcheck(param_00.var_2E6))
		{
			return 0;
		}
	}

	if(function_02C8(param_00))
	{
		return function_02C9(param_00) != "none";
	}

	return nodeexposedtosky(param_00,1);
}

//Function Number: 21
lib_A7CA::carepackagetrace(param_00,param_01,param_02)
{
	var_03 = 100;
	if(param_02 == "goliath")
	{
		var_04 = 41;
	}
	else
	{
		var_04 = 26;
	}

	foreach(var_06 in level.orbitaldropmarkers)
	{
		var_07 = var_04;
		if(var_06.orbitaltype == "goliath")
		{
			var_07 = var_07 + 41;
		}
		else
		{
			var_07 = var_07 + 26;
		}

		var_08 = var_07 * var_07;
		var_09 = distance2dsquared(var_06.var_2E6,param_00);
		if(var_09 < var_08)
		{
			return 0;
		}
	}

	if(level.orbital_util_capsule_traces_frame != gettime())
	{
		level.orbital_util_capsule_traces_frame = gettime();
		level.orbital_util_capsule_traces = 5;
	}

	if(level.orbital_util_capsule_traces <= 0)
	{
		if(level.orbital_util_last_trace != gettime())
		{
			wait 0.05;
			level.orbital_util_last_trace = gettime();
		}

		level.orbital_util_capsule_traces = 5;
	}

	level.orbital_util_capsule_traces--;
	return capsuletracepassed(param_00 + (0,0,6),var_04,var_04 * 2,param_01,0);
}

//Function Number: 22
lib_A7CA::playergetnearestnode(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		var_02 = 300;
		var_03 = self geteye();
		var_04 = anglestoforward(self.var_41);
		var_05 = var_03 + var_04 * var_02;
		var_06 = bullettrace(var_03,var_05,0,self);
		param_00 = var_05;
		if(var_06["fraction"] < 1)
		{
			param_00 = var_03 + var_04 * var_02 * var_06["fraction"];
		}
	}

	var_07 = function_00C5(param_00,1);
	var_08 = isdefined(var_07);
	if(var_08)
	{
		var_08 = lib_A7CA::nodecanhitground(var_07,param_01) && lib_A7CA::carepackagetrace(var_07.var_2E6,self,param_01);
	}

	if(var_08)
	{
		return var_07;
	}

	var_09 = spawnstruct();
	var_09.maxtracesperframe = 5;
	var_09.maxnodes = 20;
	var_09.numtraces = 5;
	lib_A7CA::playerfindnodeinfront(param_00,param_01,var_09);
	var_0A = var_09.nearestnode;
	if(isdefined(var_0A))
	{
		return var_0A;
	}

	if(!isdefined(var_07))
	{
		var_07 = lib_A7CA::playergetclosestnode(500,100,self.var_2E6,0,1,param_01);
		if(!isdefined(var_07))
		{
			var_07 = lib_A7CA::playergetclosestnode(500,0,self.var_2E6,0,0,param_01);
		}

		if(!isdefined(var_07))
		{
			var_07 = self method_8387();
		}
	}

	self.lastnearestnode = var_07;
	if(isdefined(var_07))
	{
		return lib_A7CA::playerfindaltnode(var_07,param_01);
	}
}

//Function Number: 23
orbitalbadlandingcheck(param_00)
{
	if(isdefined(level.orbital_util_covered_volumes) && level.orbital_util_covered_volumes.size > 0)
	{
		var_01 = 0;
		foreach(var_03 in level.orbital_util_covered_volumes)
		{
			var_01 = ispointinvolume(param_00,var_03);
			if(var_01)
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 24
lib_A7CA::goliathbadlandingcheck(param_00)
{
	if(isdefined(level.goliath_bad_landing_volumes))
	{
		foreach(var_02 in level.goliath_bad_landing_volumes)
		{
			if(ispointinvolume(param_00,var_02))
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 25
lib_A7CA::playerfindnodeinfront(param_00,param_01,param_02)
{
	var_03 = 500;
	var_04 = 100;
	var_05 = lib_A7CA::playerfindnodeinfrontinternal(param_00,var_04,var_03,param_01,param_02);
	if(!isdefined(var_05) && param_02.maxnodes > 0)
	{
		var_04 = 0;
		var_05 = lib_A7CA::playerfindnodeinfrontinternal(param_00,var_04,var_03,param_01,param_02);
	}

	param_02.nearestnode = var_05;
}

//Function Number: 26
lib_A7CA::playerfindnodeinfrontinternal(param_00,param_01,param_02,param_03,param_04)
{
	while(param_01 < param_02 && param_04.maxnodes > 0)
	{
		var_05 = lib_A7CA::playergetclosestnode(param_02,param_01,param_00,1,1,param_03);
		if(param_04.numtraces <= 0 && !lib_A7CA::tracedonerecently())
		{
			wait 0.05;
			param_04.numtraces = param_04.maxtracesperframe;
		}

		if(isdefined(var_05))
		{
			param_04.numtraces--;
			param_04.maxnodes--;
			var_06 = self geteye();
			var_07 = var_05.var_2E6 + (0,0,6);
			var_08 = bullettrace(var_06,var_07,0,self);
			var_09 = var_08["fraction"] == 1 && lib_A7CA::carepackagetrace(var_05.var_2E6,self,param_03);
			if(var_09)
			{
				return var_05;
			}

			param_01 = distance(param_00,var_05.var_2E6) + 1;
			continue;
		}

		param_01 = param_02 + 1;
	}
}

//Function Number: 27
lib_A7CA::playerfindaltnode(param_00,param_01)
{
	var_02 = lib_A7CA::checknodestart(param_00,self,param_01);
	if(isdefined(var_02))
	{
		if(orbitalbadlandingcheck(var_02.var_2E6))
		{
			return undefined;
		}

		if(param_01 == "goliath")
		{
			if(lib_A7CA::goliathbadlandingcheck(var_02.var_2E6))
			{
				return undefined;
			}
		}

		return var_02;
	}
}

//Function Number: 28
lib_A7CA::tracedonerecently()
{
	return level.orbital_util_last_trace == gettime();
}

//Function Number: 29
lib_A7CA::checknodestart(param_00,param_01,param_02)
{
	var_03 = 250000;
	var_04 = 20;
	param_00.linkdistance = 0;
	param_00.nodechecked = 1;
	var_05 = spawnstruct();
	var_05.nodestocheck = [];
	var_05.nodeschecked = [];
	var_05.nodeschecked["" + param_00 getnodenumber()] = param_00;
	var_05.nextnodes = function_0210(param_00,1);
	lib_A7CA::addnodestobechecked(var_05,1,param_00,var_03,param_01,param_02);
	var_06 = 0;
	for(;;)
	{
		var_07 = lib_A7CA::getnextnode(var_05);
		if(isdefined(var_07))
		{
			var_06++;
			if(!lib_A7CA::carepackagetrace(var_07.var_2E6,param_01,param_02))
			{
				var_07.nodechecked = 1;
				var_05.nodestocheck["" + var_07 getnodenumber()] = undefined;
				var_05.nodeschecked["" + var_07 getnodenumber()] = var_07;
				var_08 = var_07.linkdistance + 1;
				if(var_08 <= 6)
				{
					var_05.nextnodes = function_0210(var_07,1);
					lib_A7CA::addnodestobechecked(var_05,var_08,var_07,var_03,param_01,param_02);
				}
			}
			else
			{
				lib_A7CA::cleanupnodefields(var_05);
				return var_07;
			}
		}
		else
		{
			lib_A7CA::cleanupnodefields(var_05);
			return;
		}

		if(var_06 >= var_04)
		{
			if(!lib_A7CA::tracedonerecently())
			{
				wait 0.05;
			}

			var_06 = 0;
		}
	}
}

//Function Number: 30
lib_A7CA::cleanupnodefields(param_00)
{
	foreach(var_02 in param_00.nodestocheck)
	{
		var_02.linkdistance = undefined;
		var_02.nodechecked = undefined;
	}

	foreach(var_02 in param_00.nodeschecked)
	{
		var_02.linkdistance = undefined;
		var_02.nodechecked = undefined;
	}
}

//Function Number: 31
lib_A7CA::getnextnode(param_00)
{
	if(param_00.nodestocheck.size == 0)
	{
		return;
	}

	var_01 = undefined;
	var_02 = undefined;
	var_03 = getarraykeys(param_00.nodestocheck);
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_05 = param_00.nodestocheck[var_03[var_04]];
		if(!isdefined(var_01) || var_05.linkdistance < var_02)
		{
			var_01 = var_05;
			var_02 = var_05.linkdistance;
		}
	}

	return var_01;
}

//Function Number: 32
lib_A7CA::addnodestobechecked(param_00,param_01,param_02,param_03,param_04,param_05)
{
	for(var_06 = 0;var_06 < param_00.nextnodes.size;var_06++)
	{
		var_07 = param_00.nextnodes[var_06];
		if(!isdefined(var_07.nodechecked))
		{
			var_08 = lib_A7CA::nodecanhitground(var_07,param_05);
			if(var_08)
			{
				var_09 = distancesquared(var_07.var_2E6,param_04.var_2E6);
				var_08 = var_09 < param_03;
			}

			if(!var_08)
			{
				var_07.nodechecked = 1;
				param_00.nodeschecked["" + var_07 getnodenumber()] = var_07;
			}
			else if(!isdefined(var_07.linkdistance))
			{
				var_07.linkdistance = param_01;
				param_00.nodestocheck["" + var_07 getnodenumber()] = var_07;
			}
			else if(var_07.linkdistance > param_01)
			{
				var_07.linkdistance = param_01;
			}
		}
	}
}

//Function Number: 33
lib_A7CA::playergetclosestnode(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_00))
	{
		param_00 = 1500;
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = self.var_2E6;
	}

	var_06 = 100;
	var_07 = param_01;
	var_08 = param_01 + var_06;
	if(var_08 > param_00)
	{
		var_08 = param_00;
	}

	while(var_08 <= param_00 && var_07 < param_00)
	{
		var_09 = lib_A7CA::playergetclosestnodeinternal(var_08,var_07,param_02,param_03,param_04,param_05);
		if(isdefined(var_09))
		{
			return var_09;
		}

		var_07 = var_07 + var_06;
		var_08 = var_08 + var_06;
		if(var_08 > param_00)
		{
			var_08 = param_00;
		}
	}
}

//Function Number: 34
lib_A7CA::playergetclosestnodeinternal(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = 1;
	var_07 = getnodesinradiussorted(param_02,param_00,param_01,120,"path");
	for(var_08 = 0;var_08 < var_07.size;var_08++)
	{
		if(param_03)
		{
			var_06 = var_06 & lib_A7CA::nodecanhitground(var_07[var_08],param_05);
		}

		if(param_04)
		{
			var_06 = var_06 & lib_A7CA::playerwithinfov2d(var_07[var_08].var_2E6);
		}

		if(var_06)
		{
			return var_07[var_08];
		}
	}
}

//Function Number: 35
lib_A7CA::playerwithinfov2d(param_00)
{
	var_01 = cos(60);
	var_02 = vectornormalize((param_00[0],param_00[1],0) - (self.var_2E6[0],self.var_2E6[1],0));
	var_03 = anglestoforward((0,self.var_41[1],0));
	return vectordot(var_03,var_02) >= var_01;
}

//Function Number: 36
lib_A7CA::_adddropmarkerinternal(param_00)
{
	param_00 waittill("death");
	level.orbitaldropmarkers = common_scripts\utility::array_remove(level.orbitaldropmarkers,param_00);
}

//Function Number: 37
nodesetremotemissilenamewrapper(param_00,param_01)
{
	var_02 = getnodesinradiussorted(param_00,24,0);
	if(var_02.size > 0)
	{
		var_03 = var_02[0];
		function_02D6(var_03,param_01);
	}
}