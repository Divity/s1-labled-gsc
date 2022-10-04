/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42885.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 7 ms
 * Timestamp: 4/20/2022 8:18:25 PM
*******************************************************************/

//Function Number: 1
lib_A785::init()
{
	if(!level.teambased)
	{
		return;
	}

	precacheshader("headicon_dead");
	level thread lib_A785::onplayerconnect();
}

//Function Number: 2
lib_A785::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.selfdeathicons = [];
	}
}

//Function Number: 3
lib_A785::updatedeathiconsenabled()
{
}

//Function Number: 4
lib_A785::adddeathicon(param_00,param_01,param_02,param_03,param_04)
{
	if(!level.teambased)
	{
		return;
	}

	if(isdefined(param_04) && isplayer(param_04) && param_04 maps\mp\_utility::_hasperk("specialty_silentkill"))
	{
		return;
	}

	var_05 = param_00.var_2E6;
	param_01 endon("spawned_player");
	param_01 endon("disconnect");
	wait(0.05);
	maps\mp\_utility::waittillslowprocessallowed();
	if(getdvar("ui_hud_showdeathicons") == "0")
	{
		return;
	}

	if(level.hardcoremode)
	{
		return;
	}

	if(isdefined(self.lastdeathicon))
	{
		self.lastdeathicon destroy();
	}

	var_06 = newteamhudelem(param_02);
	var_06.x = var_05[0];
	var_06.y = var_05[1];
	var_06.z = var_05[2] + 54;
	var_06.alpha = 0.61;
	var_06.archived = 1;
	if(level.splitscreen)
	{
		var_06 setshader("headicon_dead",14,14);
	}
	else
	{
		var_06 setshader("headicon_dead",7,7);
	}

	var_06 setwaypoint(0);
	self.lastdeathicon = var_06;
	var_06 thread lib_A785::destroyslowly(param_03);
}

//Function Number: 5
lib_A785::destroyslowly(param_00)
{
	self endon("death");
	wait(param_00);
	self fadeovertime(1);
	self.alpha = 0;
	wait(1);
	self destroy();
}