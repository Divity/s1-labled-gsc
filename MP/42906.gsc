/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42906.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:18:27 PM
*******************************************************************/

//Function Number: 1
lib_A79A::callback_hostmigration()
{
	level.hostmigrationreturnedplayercount = 0;
	if(level.gameended)
	{
		return;
	}

	var_00 = getmatchdata("hostMigrationCount");
	var_00++;
	setmatchdata("hostMigrationCount",var_00);
	foreach(var_02 in level.characters)
	{
		var_02.hostmigrationcontrolsfrozen = 0;
	}

	level.hostmigrationtimer = 1;
	setdvar("ui_inhostmigration",1);
	level notify("host_migration_begin");
	maps\mp\gametypes\_gamelogic::updatetimerpausedness();
	foreach(var_02 in level.characters)
	{
		var_02 thread lib_A79A::hostmigrationtimerthink();
		if(isplayer(var_02))
		{
			var_02 setclientomnvar("ui_session_state",var_02.sessionstate);
		}
	}

	setdvar("ui_game_state",game["state"]);
	level endon("host_migration_begin");
	lib_A79A::hostmigrationwait();
	level.hostmigrationtimer = undefined;
	setdvar("ui_inhostmigration",0);
	level notify("host_migration_end");
	maps\mp\gametypes\_gamelogic::updatetimerpausedness();
	level thread maps\mp\gametypes\_gamelogic::updategameevents();
}

//Function Number: 2
lib_A79A::hostmigrationwait()
{
	level endon("game_ended");
	level.ingraceperiod = 25;
	thread maps\mp\gametypes\_gamelogic::matchstarttimer(20);
	lib_A79A::hostmigrationwaitforplayers();
	level.ingraceperiod = 10;
	thread maps\mp\gametypes\_gamelogic::matchstarttimer(5);
	wait(5);
	level.ingraceperiod = 0;
}

//Function Number: 3
lib_A79A::hostmigrationwaitforplayers()
{
	level endon("hostmigration_enoughplayers");
	wait(15);
}

//Function Number: 4
lib_A79A::hostmigrationname(param_00)
{
	if(!isdefined(param_00))
	{
		return "<removed_ent>";
	}

	var_01 = -1;
	var_02 = "?";
	if(isdefined(param_00.entity_number))
	{
		var_01 = param_00.entity_number;
	}

	if(isplayer(param_00) && isdefined(param_00.name))
	{
		var_02 = param_00.name;
	}

	if(isplayer(param_00))
	{
		return "player <" + var_02 + "> (entNum " + var_01 + " )";
	}

	if(isagent(param_00) && maps\mp\_utility::isgameparticipant(param_00))
	{
		return "participant agent <" + var_01 + ">";
	}

	if(isagent(param_00))
	{
		return "non-participant agent <" + var_01 + ">";
	}

	return "unknown entity <" + var_01 + ">";
}

//Function Number: 5
lib_A79A::hostmigrationtimerthink_internal()
{
	level endon("host_migration_begin");
	level endon("host_migration_end");
	self endon("disconnect");
	self.hostmigrationcontrolsfrozen = 1;
	while(!maps\mp\_utility::isreallyalive(self))
	{
		self waittill("spawned");
	}

	maps\mp\_utility::freezecontrolswrapper(1);
	self method_800D();
	level waittill("host_migration_end");
}

//Function Number: 6
lib_A79A::hostmigrationtimerthink()
{
	level endon("host_migration_begin");
	self endon("disconnect");
	if(isagent(self))
	{
		self endon("death");
	}

	lib_A79A::hostmigrationtimerthink_internal();
	if(self.hostmigrationcontrolsfrozen)
	{
		if(maps\mp\_utility::gameflag("prematch_done"))
		{
			maps\mp\_utility::freezecontrolswrapper(0);
			self method_800C();
		}

		self.hostmigrationcontrolsfrozen = undefined;
	}
}

//Function Number: 7
lib_A79A::waittillhostmigrationdone()
{
	if(!isdefined(level.hostmigrationtimer))
	{
		return 0;
	}

	var_00 = gettime();
	level waittill("host_migration_end");
	return gettime() - var_00;
}

//Function Number: 8
lib_A79A::waittillhostmigrationstarts(param_00)
{
	if(isdefined(level.hostmigrationtimer))
	{
		return;
	}

	level endon("host_migration_begin");
	wait(param_00);
}

//Function Number: 9
lib_A79A::waitlongdurationwithhostmigrationpause(param_00)
{
	if(param_00 == 0)
	{
		return;
	}

	var_01 = gettime();
	var_02 = gettime() + param_00 * 1000;
	while(gettime() < var_02)
	{
		lib_A79A::waittillhostmigrationstarts(var_02 - gettime() / 1000);
		if(isdefined(level.hostmigrationtimer))
		{
			var_03 = lib_A79A::waittillhostmigrationdone();
			var_02 = var_02 + var_03;
		}
	}

	lib_A79A::waittillhostmigrationdone();
	return gettime() - var_01;
}

//Function Number: 10
lib_A79A::waittill_notify_or_timeout_hostmigration_pause(param_00,param_01)
{
	self endon(param_00);
	if(param_01 == 0)
	{
		return;
	}

	var_02 = gettime();
	var_03 = gettime() + param_01 * 1000;
	while(gettime() < var_03)
	{
		lib_A79A::waittillhostmigrationstarts(var_03 - gettime() / 1000);
		if(isdefined(level.hostmigrationtimer))
		{
			var_04 = lib_A79A::waittillhostmigrationdone();
			var_03 = var_03 + var_04;
		}
	}

	lib_A79A::waittillhostmigrationdone();
	return gettime() - var_02;
}

//Function Number: 11
lib_A79A::waitlongdurationwithgameendtimeupdate(param_00)
{
	if(param_00 == 0)
	{
		return;
	}

	var_01 = gettime();
	var_02 = gettime() + param_00 * 1000;
	while(gettime() < var_02)
	{
		lib_A79A::waittillhostmigrationstarts(var_02 - gettime() / 1000);
		while(isdefined(level.hostmigrationtimer))
		{
			var_02 = var_02 + 1000;
			setgameendtime(int(var_02));
			wait(1);
		}
	}

	while(isdefined(level.hostmigrationtimer))
	{
		var_02 = var_02 + 1000;
		setgameendtime(int(var_02));
		wait(1);
	}

	return gettime() - var_01;
}