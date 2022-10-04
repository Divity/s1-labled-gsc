/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42926.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 26
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:18:29 PM
*******************************************************************/

//Function Number: 1
lib_A7AE::score_factor(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03))
	{
		var_04 = [[ param_01 ]](param_02,param_03);
	}
	else
	{
		var_04 = [[ param_02 ]](param_03);
	}

	var_04 = clamp(var_04,0,100);
	var_04 = var_04 * param_00;
	param_02.debugscoredata[param_02.debugscoredata.size] = var_04;
	param_02.totalpossiblescore = param_02.totalpossiblescore + 100 * param_00;
	return var_04;
}

//Function Number: 2
lib_A7AE::critical_factor(param_00,param_01,param_02)
{
	if(isdefined(param_02))
	{
		var_03 = [[ param_00 ]](param_01,param_02);
	}
	else
	{
		var_03 = [[ param_01 ]](param_02);
	}

	var_03 = clamp(var_03,0,100);
	param_01.debugcriticaldata[param_01.debugcriticaldata.size] = var_03;
	return var_03;
}

//Function Number: 3
lib_A7AE::avoidcarepackages(param_00)
{
	foreach(var_02 in level.carepackages)
	{
		if(!isdefined(var_02))
		{
			continue;
		}

		if(distancesquared(param_00.var_2E6,var_02.var_2E6) < 22500)
		{
			return 0;
		}
	}

	return 100;
}

//Function Number: 4
lib_A7AE::avoidgasclouds(param_00)
{
	foreach(var_02 in level.missile_strike_gas_clouds)
	{
		if(!isdefined(var_02))
		{
			continue;
		}

		if(distancesquared(param_00.var_2E6,var_02.var_2E6) < 90000)
		{
			return 0;
		}
	}

	return 100;
}

//Function Number: 5
lib_A7AE::avoidgrenades(param_00)
{
	foreach(var_02 in level.grenades)
	{
		if(!isdefined(var_02) || !var_02 lib_A7AE::isexplosivedangeroustoplayer(self))
		{
			continue;
		}

		if(distancesquared(param_00.var_2E6,var_02.var_2E6) < 122500)
		{
			return 0;
		}
	}

	return 100;
}

//Function Number: 6
lib_A7AE::avoidmines(param_00)
{
	var_01 = level.mines;
	foreach(var_03 in var_01)
	{
		if(!isdefined(var_03) || !var_03 lib_A7AE::isexplosivedangeroustoplayer(self))
		{
			continue;
		}

		if(distancesquared(param_00.var_2E6,var_03.var_2E6) < 122500)
		{
			return 0;
		}
	}

	return 100;
}

//Function Number: 7
lib_A7AE::isexplosivedangeroustoplayer(param_00)
{
	if(!level.teambased || level.friendlyfire || !isdefined(param_00.inliveplayerkillstreak))
	{
		return 1;
	}

	if(!isdefined(self.owner) || !isdefined(self.owner.inliveplayerkillstreak))
	{
		return 1;
	}

	if(param_00 == self.owner)
	{
		return 1;
	}

	var_01 = self.owner.inliveplayerkillstreak;
	return var_01 != param_00.inliveplayerkillstreak;
}

//Function Number: 8
lib_A7AE::avoidairstrikelocations(param_00)
{
	if(!isdefined(level.artillerydangercenters))
	{
		return 100;
	}

	if(!param_00.outside)
	{
		return 100;
	}

	var_01 = maps\mp\killstreaks\_airstrike::getairstrikedanger(param_00.var_2E6);
	if(var_01 > 0)
	{
		return 0;
	}

	return 100;
}

//Function Number: 9
lib_A7AE::avoidcornervisibleenemies(param_00)
{
	var_01 = "all";
	if(level.teambased)
	{
		var_01 = maps\mp\gametypes\_gameobjects::getenemyteam(self.inliveplayerkillstreak);
	}

	if(param_00.cornersights[var_01] > 0)
	{
		return 0;
	}

	return 100;
}

//Function Number: 10
lib_A7AE::avoidfullvisibleenemies(param_00)
{
	var_01 = "all";
	if(level.teambased)
	{
		var_01 = maps\mp\gametypes\_gameobjects::getenemyteam(self.inliveplayerkillstreak);
	}

	if(param_00.fullsights[var_01] > 0)
	{
		return 0;
	}

	return 100;
}

//Function Number: 11
lib_A7AE::avoidtelefrag(param_00)
{
	if(isdefined(self.allowtelefrag))
	{
		return 100;
	}

	if(positionwouldtelefrag(param_00.var_2E6))
	{
		foreach(var_02 in param_00.alternates)
		{
			if(!positionwouldtelefrag(var_02))
			{
				break;
			}
		}

		return 0;
	}

	return 100;
}

//Function Number: 12
lib_A7AE::avoidsamespawn(param_00)
{
	if(isdefined(self.lastspawnpoint) && self.lastspawnpoint == param_00)
	{
		return 0;
	}

	return 100;
}

//Function Number: 13
lib_A7AE::avoidrecentlyused(param_00)
{
	if(isdefined(param_00.lastspawntime))
	{
		var_01 = gettime() - param_00.lastspawntime;
		if(var_01 > 4000)
		{
			return 100;
		}

		return var_01 / 4000 * 100;
	}

	return 100;
}

//Function Number: 14
lib_A7AE::avoidenemyspawn(param_00)
{
	if(isdefined(param_00.lastspawnteam) && !level.teambased || param_00.lastspawnteam != self.inliveplayerkillstreak)
	{
		var_01 = param_00.lastspawntime + 500;
		if(gettime() < var_01)
		{
			return 0;
		}
	}

	return 100;
}

//Function Number: 15
avoidspawninzone(param_00,param_01)
{
	var_02 = distancesquared(param_01.var_2E6,param_00.var_2E6);
	if(var_02 < 692224)
	{
		return 0;
	}

	return 100;
}

//Function Number: 16
lib_A7AE::avoidlastdeathlocation(param_00)
{
	if(!isdefined(self.sameshotdamage))
	{
		return 100;
	}

	var_01 = distancesquared(param_00.var_2E6,self.sameshotdamage);
	if(var_01 > 4000000)
	{
		return 100;
	}

	var_02 = var_01 / 4000000;
	return var_02 * 100;
}

//Function Number: 17
lib_A7AE::avoidlastattackerlocation(param_00)
{
	if(!isdefined(self.lastattacker) || !isdefined(self.lastattacker.var_2E6))
	{
		return 100;
	}

	if(!maps\mp\_utility::isreallyalive(self.lastattacker))
	{
		return 100;
	}

	var_01 = distancesquared(param_00.var_2E6,self.lastattacker.var_2E6);
	if(var_01 > 4000000)
	{
		return 100;
	}

	var_02 = var_01 / 4000000;
	return var_02 * 100;
}

//Function Number: 18
lib_A7AE::preferalliesbydistance(param_00)
{
	if(param_00.totalplayers[self.inliveplayerkillstreak] == 0)
	{
		return 0;
	}

	var_01 = param_00.var_2B82[self.inliveplayerkillstreak] / param_00.totalplayers[self.inliveplayerkillstreak];
	var_01 = min(var_01,3240000);
	var_02 = 1 - var_01 / 3240000;
	return var_02 * 100;
}

//Function Number: 19
lib_A7AE::prefertwarzone(param_00)
{
	var_01 = "all";
	if(level.teambased)
	{
		var_01 = maps\mp\gametypes\_gameobjects::getenemyteam(self.inliveplayerkillstreak);
	}

	if(param_00.totalplayers[var_01] == 0)
	{
		return 100;
	}

	setdvarifuninitialized("scr_spawnfactor_maxenemydistance",1800);
	var_02 = getdvarint("scr_spawnfactor_maxenemydistance");
	var_02 = var_02 * var_02;
	var_03 = min(param_00.mindistsquared[var_01],var_02);
	var_04 = var_03 / var_02;
	return var_04 * 100;
}

//Function Number: 20
avoidbadspawns(param_00)
{
	if(isdefined(self.var_89DE) && isdefined(self.var_89DE.var_126D) && self.var_89DE.var_126D)
	{
		if(self.var_89DE.var_89F7 == param_00)
		{
			return 100;
		}

		if(isdefined(self.var_89DE.pastbadspawncount))
		{
			for(var_01 = 0;var_01 < self.var_89DE.pastbadspawncount;var_01++)
			{
				if(self.var_89DE.pastbadspawns[var_01] == param_00)
				{
					return 100;
				}
			}
		}
	}

	return 0;
}

//Function Number: 21
avoidflagbydistance(param_00)
{
	if(param_00.enemyflagdist > 0)
	{
		var_01 = param_00.friendlyflagdist / param_00.enemyflagdist / param_00.friendlyflag.highestspawndistratio * 1.33;
	}
	else
	{
		var_01 = 0;
	}

	return var_01 * 100;
}

//Function Number: 22
lib_A7AE::preferdompoints(param_00,param_01)
{
	if(param_01[0] && param_00.preferreddompoint == 0)
	{
		return 100;
	}

	if(param_01[1] && param_00.preferreddompoint == 1)
	{
		return 100;
	}

	if(param_01[2] && param_00.preferreddompoint == 2)
	{
		return 100;
	}

	return 0;
}

//Function Number: 23
lib_A7AE::preferbyteambase(param_00,param_01)
{
	if(isdefined(param_00.teambase) && param_00.teambase == param_01)
	{
		return 100;
	}

	return 0;
}

//Function Number: 24
lib_A7AE::randomspawnscore(param_00)
{
	return randomintrange(0,99);
}

//Function Number: 25
avoidzone(param_00,param_01)
{
	var_02 = distancesquared(param_01.var_2E6,param_00.var_2E6);
	var_03 = var_02 - 692224;
	var_04 = 6067776;
	var_05 = 1867776;
	if(var_03 >= var_05)
	{
		return 100 * 1 - 0.25 * var_03 - var_05 / var_04 - var_05;
	}

	if(var_03 > 0)
	{
		return 100 * var_03 / var_05;
	}

	return 0;
}

//Function Number: 26
lib_A7AE::preferplayeranchors(param_00)
{
	var_01 = self.inliveplayerkillstreak;
	var_02 = maps\mp\_utility::getotherteam(var_01);
	if(param_00.nearbyplayers[var_01] == 0)
	{
		return 0;
	}

	if(param_00.nearbyplayers[var_02] == 0)
	{
		return 100;
	}

	var_03 = param_00.nearbyplayers[var_01] - param_00.nearbyplayers[var_02];
	if(var_03 <= 0)
	{
		return 0;
	}

	if(var_03 == 1)
	{
		return 50;
	}

	if(var_03 >= 2)
	{
		return 75;
	}

	return 0;
}