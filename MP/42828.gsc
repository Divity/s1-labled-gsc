/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42828.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 14
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:18:22 PM
*******************************************************************/

//Function Number: 1
lib_A74C::init()
{
	if(level.rankedmatch && !getdvarint("scr_game_division",0) > 0)
	{
		level thread lib_A74C::onplayerconnect();
	}
}

//Function Number: 2
lib_A74C::onplayerconnect()
{
	level endon("game_ended");
	level waittill("prematch_over");
	wait 0.05;
	foreach(var_01 in level.var_328)
	{
		if(isbot(var_01))
		{
			continue;
		}

		var_01 lib_A74C::resetreinforcements();
		var_01 thread lib_A74C::checkforreinforcements();
	}

	for(;;)
	{
		level waittill("connected",var_01);
		if(isbot(var_01))
		{
			continue;
		}

		var_01 lib_A74C::resetreinforcements();
		var_01 thread lib_A74C::checkforreinforcements();
	}
}

//Function Number: 3
lib_A74C::resetreinforcements()
{
	self setclientomnvar("ui_reinforcement_timer_type",0);
	self setclientomnvar("ui_reinforcement_timer",0);
}

//Function Number: 4
lib_A74C::storependingreinforcement(param_00)
{
	self.connectedpostgame["reinforcements"] = spawnstruct();
	self.connectedpostgame["reinforcements"].type = param_00;
	self.connectedpostgame["reinforcements"].starttimepassed = maps\mp\_utility::getgametimepassedms();
}

//Function Number: 5
lib_A74C::cancelpendingreinforcement()
{
	self.connectedpostgame["reinforcements"].type = 0;
}

//Function Number: 6
lib_A74C::pendingreinforcementavailable()
{
	return isdefined(self.connectedpostgame["reinforcements"]);
}

//Function Number: 7
lib_A74C::checkforreinforcements()
{
	self endon("disconnect");
	level endon("game_ended");
	if(!maps\mp\_utility::allowclasschoice())
	{
		return;
	}

	if(self.health <= 0)
	{
		self waittill("spawned_player");
	}

	if(lib_A74C::pendingreinforcementavailable())
	{
		thread lib_A74C::continuereinforcements();
		return;
	}

	var_00 = 0;
	if(maps\mp\_utility::practiceroundgame())
	{
		var_00 = 4;
	}
	else
	{
		var_00 = self method_850F();
	}

	lib_A74C::storependingreinforcement(var_00);
	if(var_00 == 0)
	{
		return;
	}

	var_02 = lib_A74C::gettimetoreinforcementfortypems(var_00);
	var_03 = lib_A74C::gettimeremainingincludingrounds();
	if(var_03 < var_02)
	{
		lib_A74C::cancelpendingreinforcement();
		return;
	}

	thread lib_A74C::waitforreinforcementoftype(var_00,var_02);
}

//Function Number: 8
lib_A74C::continuereinforcements()
{
	var_00 = self.connectedpostgame["reinforcements"].type;
	if(var_00 == 0)
	{
		return;
	}

	var_01 = lib_A74C::gettimetoreinforcementfortypems(var_00);
	var_02 = maps\mp\_utility::getgametimepassedms();
	var_03 = self.connectedpostgame["reinforcements"].starttimepassed;
	var_01 = var_01 - var_02;
	var_01 = var_01 + var_03;
	thread lib_A74C::waitforreinforcementoftype(var_00,var_01);
}

//Function Number: 9
lib_A74C::gettimeremainingincludingrounds()
{
	if(maps\mp\_utility::isroundbased())
	{
		var_00 = maps\mp\_utility::getscorelimit();
		var_01 = min(var_00 - maps\mp\_utility::getroundswon("allies"),var_00 - maps\mp\_utility::getroundswon("axis"));
		var_02 = maps\mp\_utility::gettimelimit() * var_01;
		return var_02 * 60 * 1000 - maps\mp\_utility::gettimepassed();
	}

	return maps\mp\gametypes\_gamelogic::gettimeremaining();
}

//Function Number: 10
lib_A74C::gettimetoreinforcementfortypems(param_00)
{
	switch(param_00)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		default:
			break;
	}
}

//Function Number: 11
lib_A74C::geticontypeforreinforcementoftype(param_00)
{
	switch(param_00)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		default:
			break;
	}
}

//Function Number: 12
lib_A74C::getcarepackagestreakforreinforcementoftype(param_00)
{
	switch(param_00)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		default:
			break;
	}
}

//Function Number: 13
lib_A74C::waitforreinforcementoftype(param_00,param_01)
{
	self endon("disconnect");
	level endon("game_ended");
	var_02 = lib_A74C::geticontypeforreinforcementoftype(param_00);
	self setclientomnvar("ui_reinforcement_timer_type",var_02);
	self setclientomnvar("ui_reinforcement_timer",gettime() + param_01);
	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(param_01 / 1000);
	self setclientomnvar("ui_reinforcement_timer_type",0);
	self setclientomnvar("ui_reinforcement_timer",0);
	lib_A74C::givereinforcementoftype(param_00);
}

//Function Number: 14
lib_A74C::givereinforcementoftype(param_00)
{
	if(!isplayer(self))
	{
		return;
	}

	var_01 = lib_A74C::getcarepackagestreakforreinforcementoftype(param_00);
	var_02 = 500;
	var_03 = maps\mp\killstreaks\_killstreaks::getnextkillstreakslotindex(var_01);
	thread maps\mp\gametypes\_hud_message::killstreaksplashnotify(var_01,var_02,undefined,undefined,var_03);
	maps\mp\killstreaks\_killstreaks::givekillstreak(var_01);
	lib_A74C::cancelpendingreinforcement();
}