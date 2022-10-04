/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42942.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:24:14 PM
*******************************************************************/

//Function Number: 1
lib_A7BE::init()
{
	level.carepackagedrone = spawnstruct();
	level.carepackagedrone.health = 999999;
	level.carepackagedrone.var_275 = 200;
	level.carepackagedrone.fxid_explode = loadfx("vfx/explosion/tracking_drone_explosion");
	level.carepackagedrone.sound_explode = "veh_tracking_drone_explode";
	level.carepackagedrone.releasestring = &"KILLSTREAKS_DRONE_CAREPACKAGE_RELEASE";
	level.carepackagedrones = [];
}

//Function Number: 2
lib_A7BE::setupcarepackagedrone(param_00,param_01)
{
	param_00 common_scripts\utility::make_entity_sentient_mp(self.inliveplayerkillstreak);
	param_00 makevehiclenotcollidewithplayers(1);
	param_00 lib_A7BE::addtocarepackagedronelist();
	param_00 thread lib_A7BE::removefromcarepackagedronelistondeath();
	param_00.health = level.carepackagedrone.health;
	param_00.var_275 = level.carepackagedrone.var_275;
	param_00.damagetaken = 0;
	param_00.speed = 15;
	param_00.followspeed = 15;
	param_00.owner = self;
	param_00.inliveplayerkillstreak = self.inliveplayerkillstreak;
	param_00 veh_setspeed(param_00.speed,10,10);
	param_00 veh_setyawspeed(120,90);
	param_00 veh_neargoalnotifydist(64);
	param_00 veh_sethoverparams(4,5,5);
	param_00.fx_tag0 = "tag_body";
	if(param_01)
	{
		param_00.usableent = spawn("script_model",param_00.var_2E6 + (0,0,1));
		param_00.usableent setmodel("tag_origin");
		param_00.usableent.owner = self;
		param_00.usableent maps\mp\_utility::makegloballyusablebytype("killstreakRemote",level.carepackagedrone.releasestring,self);
	}

	var_02 = 45;
	var_03 = 45;
	param_00 veh_setmaxpitchroll(var_02,var_03);
	var_04 = 10000;
	var_05 = 150;
	param_00.attractor = missilecreateattractorent(param_00,var_04,var_05);
	param_00.stunned = 0;
	param_00 thread lib_A7BE::carepackagedrone_watchdeath();
	param_00 thread lib_A7BE::carepackagedrone_watchownerloss();
	param_00 thread lib_A7BE::carepackagedrone_watchroundend();
}

//Function Number: 3
lib_A7BE::carepackagedrone_deleteonactivate()
{
	self endon("death");
	var_00 = self.owner;
	self.usableent waittill("trigger");
	lib_A7BE::carepackagedrone_delete();
}

//Function Number: 4
lib_A7BE::carepackagedrone_watchdeath()
{
	level endon("game_ended");
	self endon("gone");
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	lib_A7BE::carepackagedrone_leave();
}

//Function Number: 5
lib_A7BE::carepackagedrone_watchownerloss()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner common_scripts\utility::waittill_any("disconnect","joined_team","joined_spectators");
	self notify("owner_gone");
	thread lib_A7BE::carepackagedrone_leave();
}

//Function Number: 6
lib_A7BE::carepackagedrone_watchroundend()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner endon("disconnect");
	self endon("owner_gone");
	level common_scripts\utility::waittill_any("round_end_finished","game_ended");
	thread lib_A7BE::carepackagedrone_leave();
}

//Function Number: 7
lib_A7BE::carepackagedrone_leave()
{
	self endon("death");
	self notify("leaving");
	lib_A7BE::carepackagedrone_explode();
}

//Function Number: 8
lib_A7BE::carepackagedrone_explode()
{
	if(isdefined(level.carepackagedrone.fxid_explode))
	{
		playfx(level.carepackagedrone.fxid_explode,self.var_2E6);
	}

	if(isdefined(level.carepackagedrone.sound_explode))
	{
		self playsoundasmaster(level.carepackagedrone.sound_explode);
	}

	if(isdefined(self.usableent))
	{
		self.usableent maps\mp\_utility::makegloballyunusablebytype();
		self.usableent delete();
	}

	self notify("explode");
	lib_A7BE::carepackagedrone_remove();
}

//Function Number: 9
lib_A7BE::carepackagedrone_delete()
{
	if(isdefined(self.usableent))
	{
		self.usableent maps\mp\_utility::makegloballyunusablebytype();
		self.usableent delete();
	}

	self notify("explode");
	lib_A7BE::carepackagedrone_remove();
}

//Function Number: 10
lib_A7BE::carepackagedrone_remove()
{
	maps\mp\_utility::decrementfauxvehiclecount();
	self delete();
}

//Function Number: 11
lib_A7BE::addtocarepackagedronelist()
{
	level.carepackagedrones[level.carepackagedrones.size] = self;
}

//Function Number: 12
lib_A7BE::removefromcarepackagedronelistondeath()
{
	var_00 = self getentitynumber();
	self waittill("death");
	level.carepackagedrones = common_scripts\utility::array_remove(level.carepackagedrones,self);
}