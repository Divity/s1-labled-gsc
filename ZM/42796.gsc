/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42796.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:24:07 PM
*******************************************************************/

//Function Number: 1
lib_A72C::init()
{
	function_0080();
	thread lib_A72C::onplayerconnect();
	precachestring(&"MP_EMP_REBOOTING");
}

//Function Number: 2
lib_A72C::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A72C::onplayerspawned();
	}
}

//Function Number: 3
lib_A72C::onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		thread lib_A72C::monitorempgrenade();
	}
}

//Function Number: 4
lib_A72C::monitorempgrenade()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self.empendtime = 0;
	for(;;)
	{
		self waittill("emp_grenaded",var_00);
		if(!isalive(self))
		{
			continue;
		}

		if(isdefined(self.usingremote))
		{
			continue;
		}

		if(maps\mp\_utility::_hasperk("specialty_empimmune"))
		{
			continue;
		}

		var_01 = 1;
		var_02 = 0;
		if(level.teambased && isdefined(var_00) && isdefined(var_00.connectedpostgame["team"]) && var_00.connectedpostgame["team"] == self.connectedpostgame["team"] && var_00 != self)
		{
			if(level.friendlyfire == 0)
			{
				continue;
			}
			else if(level.friendlyfire == 1)
			{
				var_02 = 0;
				var_01 = 1;
			}
			else if(level.friendlyfire == 2)
			{
				var_01 = 0;
				var_02 = 1;
			}
			else if(level.friendlyfire == 3)
			{
				var_02 = 1;
				var_01 = 1;
			}
		}
		else if(isdefined(var_00))
		{
			var_00 notify("emp_hit");
			if(var_00 != self)
			{
				var_00 maps\mp\gametypes\_missions::processchallenge("ch_onthepulse");
			}
		}

		if(var_01 && isdefined(self))
		{
			thread lib_A72C::applyemp();
		}

		if(var_02 && isdefined(var_00))
		{
			var_00 thread lib_A72C::applyemp();
		}
	}
}

//Function Number: 5
lib_A72C::emp_hide_hud(param_00)
{
	maps\mp\gametypes\_scrambler::playersethudempscrambledoff(param_00);
}

//Function Number: 6
lib_A72C::applyemp()
{
	self notify("applyEmp");
	self endon("applyEmp");
	self endon("death");
	self endon("disconnect");
	wait(0.05);
	self.empduration = 3;
	var_00 = 2;
	if(maps\mp\_utility::isaugmentedgamemode())
	{
		var_00 = 1;
		maps\mp\_utility::playerallowhighjump(0,"empgrenade");
		maps\mp\_utility::playerallowhighjumpdrop(0,"empgrenade");
		maps\mp\_utility::playerallowboostjump(0,"empgrenade");
		maps\mp\_utility::playerallowpowerslide(0,"empgrenade");
		maps\mp\_utility::playerallowdodge(0,"empgrenade");
	}

	self.empgrenaded = 1;
	self.empendtime = gettime() + self.empduration * 1000;
	var_01 = maps\mp\gametypes\_scrambler::playersethudempscrambled(self.empendtime,var_00,"emp");
	thread lib_A72C::digitaldistort(self.empduration,var_01);
	thread lib_A72C::emprumbleloop(0.75);
	self setempjammed(1);
	thread lib_A72C::empgrenadedeathwaiter(var_01);
	wait(self.empduration);
	self notify("empGrenadeTimedOut");
	lib_A72C::checktoturnoffemp(var_01);
}

//Function Number: 7
lib_A72C::digitaldistort(param_00,param_01)
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("joined_team");
	self setsystemhack("digital_distort_mp");
	self method_8064(1,1);
	thread lib_A72C::watchdistortdisconnectdeath(param_01);
	wait(0.1);
	var_02 = param_00;
	var_03 = 0.95;
	var_04 = 0.2;
	var_05 = var_03 - var_04;
	var_06 = 0.1;
	var_07 = var_03;
	while(var_02 > 0)
	{
		var_07 = var_05 * var_02 / param_00 + var_04;
		self method_8064(var_07,1);
		var_02 = var_02 - var_06;
		wait(var_06);
	}

	self method_8064(0,0);
}

//Function Number: 8
lib_A72C::watchdistortdisconnectdeath(param_00)
{
	common_scripts\utility::waittill_any("death","disconnect","faux_spawn","joined_team");
	if(isdefined(self))
	{
		self method_8064(0,0);
		lib_A72C::emp_hide_hud(param_00);
	}
}

//Function Number: 9
lib_A72C::empgrenadedeathwaiter(param_00)
{
	self notify("empGrenadeDeathWaiter");
	self endon("empGrenadeDeathWaiter");
	self endon("empGrenadeTimedOut");
	self waittill("death");
	lib_A72C::checktoturnoffemp(param_00);
}

//Function Number: 10
lib_A72C::checktoturnoffemp(param_00)
{
	self.empgrenaded = 0;
	self setempjammed(0);
	if(maps\mp\_utility::isaugmentedgamemode())
	{
		maps\mp\_utility::playerallowhighjump(1,"empgrenade");
		maps\mp\_utility::playerallowhighjumpdrop(1,"empgrenade");
		maps\mp\_utility::playerallowboostjump(1,"empgrenade");
		maps\mp\_utility::playerallowpowerslide(1,"empgrenade");
		maps\mp\_utility::playerallowdodge(1,"empgrenade");
	}

	self method_8064(0,0);
	lib_A72C::emp_hide_hud(param_00);
}

//Function Number: 11
lib_A72C::emprumbleloop(param_00)
{
	self endon("emp_rumble_loop");
	self notify("emp_rumble_loop");
	var_01 = gettime() + param_00 * 1000;
	while(gettime() < var_01)
	{
		self playrumbleonentity("damage_heavy");
		wait(0.05);
	}
}

//Function Number: 12
lib_A72C::isempgrenaded()
{
	return isdefined(self.empendtime) && gettime() < self.empendtime;
}