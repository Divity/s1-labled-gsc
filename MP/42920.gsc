/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42920.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:18:29 PM
*******************************************************************/

//Function Number: 1
lib_A7A8::deleteportableradar(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	foreach(var_02 in level.var_328)
	{
		if(isdefined(var_02))
		{
			var_02.inplayerportableradar = undefined;
		}
	}

	param_00 notify("death");
	param_00 delete();
}

//Function Number: 2
lib_A7A8::monitorportableradaruse()
{
	self endon("disconnect");
	level endon("game_ended");
	self.portableradararray = [];
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "portabl_radar" || var_01 == "portable_radar_mp")
		{
			if(!isalive(self))
			{
				var_00 delete();
				continue;
			}

			self.portableradararray = common_scripts\utility::array_removeundefined(self.portableradararray);
			if(self.portableradararray.size >= level.maxperplayerexplosives)
			{
				lib_A7A8::deleteportableradar(self.portableradararray[0]);
			}

			var_00 waittill("missile_stuck");
			var_02 = var_00.var_2E6;
			if(isdefined(var_00))
			{
				var_00 delete();
			}

			var_03 = spawn("script_model",var_02);
			var_03.health = 100;
			var_03.inliveplayerkillstreak = self.inliveplayerkillstreak;
			var_03.owner = self;
			var_03 setcandamage(1);
			var_03 makeportableradar(self);
			var_03 lib_A7A8::portableradarsetup(self);
			var_03 thread maps\mp\gametypes\_weapons::createbombsquadmodel("weapon_radar_bombsquad","tag_origin",self);
			var_03 thread lib_A7A8::portableradarproximitytracker();
			thread lib_A7A8::portableradarwatchowner(var_03);
			self.portableradararray[self.portableradararray.size] = var_03;
		}
	}
}

//Function Number: 3
lib_A7A8::portableradarsetup(param_00)
{
	self setmodel("weapon_radar");
	if(level.teambased)
	{
		maps\mp\_entityheadicons::setteamheadicon(self.inliveplayerkillstreak,(0,0,20));
	}
	else
	{
		maps\mp\_entityheadicons::setplayerheadicon(param_00,(0,0,20));
	}

	thread lib_A7A8::portableradardamagelistener(param_00);
	thread lib_A7A8::portableradaruselistener(param_00);
	thread lib_A7A8::portableradarbeepsounds();
	thread maps\mp\_utility::notusableforjoiningplayers(param_00);
}

//Function Number: 4
lib_A7A8::portableradarwatchowner(param_00)
{
	param_00 endon("death");
	level endon("game_ended");
	common_scripts\utility::waittill_any("disconnect","joined_team","joined_spectators","spawned_player");
	level thread lib_A7A8::deleteportableradar(param_00);
}

//Function Number: 5
lib_A7A8::portableradarbeepsounds()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		wait(2);
		self playsoundasmaster("sentry_gun_beep");
	}
}

//Function Number: 6
lib_A7A8::portableradardamagelistener(param_00)
{
	self endon("death");
	self.health = 999999;
	self.var_275 = 100;
	self.damagetaken = 0;
	self waittill("damage",var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A);
	if(!maps\mp\gametypes\_weapons::friendlyfirecheck(self.owner,var_02))
	{
		continue;
	}

	if(isdefined(var_0A))
	{
		var_0B = maps\mp\_utility::strip_suffix(var_0A,"_lefthand");
	}
	else
	{
		var_0B = undefined;
	}

	if(isdefined(var_0B))
	{
		switch(var_0B)
		{
			case "smoke_grenade_var_mp":
			case "stun_grenade_var_mp":
			case "smoke_grenade_mp":
			case "stun_grenade_mp":
			case "concussion_grenade_mp":
			case "flash_grenade_mp":
				break;
		}
	}
}

//Function Number: 7
lib_A7A8::portableradaruselistener(param_00)
{
	self endon("death");
	level endon("game_ended");
	param_00 endon("disconnect");
	self setcursorhint("HINT_NOICON");
	self sethintstring(&"MP_PATCH_PICKUP_PORTABLE_RADAR");
	maps\mp\_utility::setselfusable(param_00);
	for(;;)
	{
		self waittill("trigger",param_00);
		var_01 = param_00 getweaponammostock("portable_radar_mp");
		if(var_01 < weaponmaxammo("portable_radar_mp"))
		{
			param_00 method_82F4("scavenger_pack_pickup");
			param_00 setweaponammostock("portable_radar_mp",var_01 + 1);
			param_00 thread lib_A7A8::deleteportableradar(self);
		}
	}
}

//Function Number: 8
lib_A7A8::portableradarproximitytracker()
{
	self endon("death");
	level endon("game_ended");
	var_00 = 512;
	for(;;)
	{
		foreach(var_02 in level.var_328)
		{
			if(!isdefined(var_02))
			{
				continue;
			}

			if(level.teambased && var_02.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				continue;
			}

			if(var_02 maps\mp\_utility::_hasperk("specialty_class_lowprofile"))
			{
				continue;
			}

			var_03 = distancesquared(self.var_2E6,var_02.var_2E6);
			if(distancesquared(var_02.var_2E6,self.var_2E6) < var_00 * var_00)
			{
				var_02.inplayerportableradar = self.owner;
				continue;
			}

			var_02.inplayerportableradar = undefined;
		}

		wait(0.05);
	}
}