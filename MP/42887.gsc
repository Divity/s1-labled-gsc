/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42887.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 16
 * Decompile Time: 11 ms
 * Timestamp: 4/20/2022 8:18:26 PM
*******************************************************************/

//Function Number: 1
lib_A787::watchtrophyusage()
{
	self endon("spawned_player");
	self endon("disconnect");
	self.trophyarray = [];
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "trophy" || var_01 == "trophy_mp")
		{
			if(!isalive(self))
			{
				var_00 delete();
				return;
			}

			var_00 hide();
			var_00 waittill("missile_stuck");
			var_02 = 40;
			if(var_02 * var_02 < distancesquared(var_00.var_2E6,self.var_2E6))
			{
				var_03 = bullettrace(self.var_2E6,self.var_2E6 - (0,0,var_02),0,self);
				if(var_03["fraction"] == 1)
				{
					var_00 delete();
					self setweaponammostock("trophy_mp",self getweaponammostock("trophy_mp") + 1);
					continue;
				}

				var_00.var_2E6 = var_03["position"];
			}

			var_00 show();
			self.trophyarray = common_scripts\utility::array_removeundefined(self.trophyarray);
			if(self.trophyarray.size >= level.maxperplayerexplosives)
			{
				self.trophyarray[0] thread lib_A787::trophybreak();
			}

			var_04 = spawn("script_model",var_00.var_2E6);
			var_04 setmodel("mp_trophy_system");
			var_04 thread maps\mp\gametypes\_weapons::createbombsquadmodel("mp_trophy_system_bombsquad","tag_origin",self);
			var_04.var_41 = var_00.var_41;
			self.trophyarray[self.trophyarray.size] = var_04;
			var_04.owner = self;
			var_04.inliveplayerkillstreak = self.inliveplayerkillstreak;
			var_04.fx_origin = var_01;
			var_04.stunned = 0;
			level.trophies[level.trophies.size] = var_04;
			if(isdefined(self.var_983D) && self.var_983D > 0)
			{
				var_04.ammo = self.var_983D;
			}
			else
			{
				var_04.ammo = 2;
			}

			var_04.trigger = spawn("script_origin",var_04.var_2E6);
			var_04 thread lib_A787::trophydamage(self);
			var_04 thread lib_A787::trophyactive(self);
			var_04 thread lib_A787::trophydisconnectwaiter(self);
			var_04 thread lib_A787::trophyplayerspawnwaiter(self);
			var_04 thread lib_A787::trophyuselistener(self);
			var_04 thread maps\mp\gametypes\_weapons::c4empkillstreakwait();
			if(level.teambased)
			{
				var_04 maps\mp\_entityheadicons::setteamheadicon(var_04.inliveplayerkillstreak,(0,0,65));
			}
			else
			{
				var_04 maps\mp\_entityheadicons::setplayerheadicon(var_04.owner,(0,0,65));
			}

			wait(0.05);
			if(isdefined(var_00))
			{
				var_00 delete();
			}
		}
	}
}

//Function Number: 2
lib_A787::trophystunbegin()
{
	if(self.stunned)
	{
		return;
	}

	self.stunned = 1;
	playfxontag(common_scripts\utility::getfx("mine_stunned"),self,"tag_origin");
}

//Function Number: 3
lib_A787::trophystunend()
{
	self.stunned = 0;
	stopfxontag(common_scripts\utility::getfx("mine_stunned"),self,"tag_origin");
}

//Function Number: 4
lib_A787::trophychangeowner(param_00)
{
	if(isdefined(self.entityheadicon))
	{
		self.entityheadicon destroy();
	}

	self notify("change_owner");
	self.owner = param_00;
	self.inliveplayerkillstreak = param_00.inliveplayerkillstreak;
	param_00.trophyarray[param_00.trophyarray.size] = self;
	if(level.teambased)
	{
		maps\mp\_entityheadicons::setteamheadicon(self.inliveplayerkillstreak,(0,0,65));
	}
	else
	{
		maps\mp\_entityheadicons::setplayerheadicon(self.owner,(0,0,65));
	}

	thread lib_A787::trophydamage(param_00);
	thread lib_A787::trophyactive(param_00);
	thread lib_A787::trophydisconnectwaiter(param_00);
	thread lib_A787::trophyplayerspawnwaiter(param_00);
}

//Function Number: 5
lib_A787::trophyuselistener(param_00)
{
	self endon("death");
	level endon("game_ended");
	param_00 endon("disconnect");
	param_00 endon("death");
	self.trigger setcursorhint("HINT_NOICON");
	self.trigger sethintstring(&"MP_PICKUP_TROPHY");
	self.trigger maps\mp\_utility::setselfusable(param_00);
	self.trigger thread maps\mp\_utility::notusableforjoiningplayers(param_00);
	for(;;)
	{
		self.trigger waittill("trigger",param_00);
		param_00 method_82F4("scavenger_pack_pickup");
		var_01 = param_00 getweaponammoclip("trophy_mp");
		param_00 setweaponammoclip("trophy_mp",var_01 + 1);
		param_00.var_983D = self.ammo;
		self.trigger delete();
		self delete();
		self notify("death");
	}
}

//Function Number: 6
lib_A787::trophyplayerspawnwaiter(param_00)
{
	self endon("disconnect");
	self endon("death");
	self endon("change_owner");
	param_00 waittill("spawned");
	thread lib_A787::trophybreak();
}

//Function Number: 7
lib_A787::trophydisconnectwaiter(param_00)
{
	self endon("death");
	self endon("change_owner");
	param_00 waittill("disconnect");
	thread lib_A787::trophybreak();
}

//Function Number: 8
lib_A787::trophyactive(param_00,param_01,param_02,param_03)
{
	param_00 endon("disconnect");
	self endon("death");
	self endon("change_owner");
	self endon("trophyDisabled");
	if(!isdefined(param_01))
	{
		param_01 = 384;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = "exorepulsor_equipment_mp";
	}

	var_04 = param_01 * param_01;
	if(!isdefined(level.grenades) || level.grenades.size < 1 && level.missiles.size < 1 && level.trackingdrones.size < 1 || isdefined(self.disabled) || self.stunned == 1)
	{
		wait(0.05);
		continue;
	}

	var_05 = common_scripts\utility::array_combine(level.grenades,level.missiles);
	var_05 = common_scripts\utility::array_combine(var_05,level.trackingdrones);
	if(var_05.size < 1)
	{
		wait(0.05);
		continue;
	}

	var_06 = var_05;
	var_0A = getfirstarraykey(var_06);
	if(isdefined(var_0A))
	{
		var_07 = var_06[var_0A];
		wait(0.05);
		if(!isdefined(var_07))
		{
			continue;
		}

		if(var_07 == self)
		{
			continue;
		}

		if(isdefined(var_07.fx_origin))
		{
			switch(var_07.fx_origin)
			{
				case "orbital_carepackage_droppod_mp":
				case "orbital_carepackage_pod_mp":
				case "claymore_mp":
					break;
			}
		}
	}
}

//Function Number: 9
lib_A787::trophysetmindot(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = (0,0,0);
	}

	self.mindot = param_00;
	self.trophyangleoffset = param_01;
}

//Function Number: 10
lib_A787::trophywithinmindot(param_00)
{
	if(!isdefined(self.mindot))
	{
		return 1;
	}

	var_01 = anglestoforward(self.var_41 + self.trophyangleoffset);
	var_02 = vectornormalize(param_00.var_2E6 - self.var_2E6);
	var_03 = vectordot(var_01,var_02);
	return var_03 > self.mindot;
}

//Function Number: 11
lib_A787::trophyhandlelaser(param_00,param_01)
{
	if(!isdefined(self.laserent))
	{
		return;
	}

	param_00 endon("disconnect");
	self endon("death");
	self endon("change_owner");
	self endon("trophyDisabled");
	self.laserent endon("death");
	self notify("trophyDelayClearLaser");
	self endon("trophyDelayClearLaser");
	self.laserent.var_41 = vectortoangles(param_01.var_2E6 - self.laserent.var_2E6);
	self.laserent method_80B2("tracking_drone_laser");
	wait(0.7);
	self.laserent method_80B3();
}

//Function Number: 12
lib_A787::trophyaddlaser(param_00,param_01)
{
	self.laserent = spawn("script_model",self.var_2E6);
	self.laserent setmodel("tag_laser");
	self.laserent.var_41 = self.var_41;
	self.laserent.laseroriginoffset = param_00;
	self.laserent.laserforwardangles = param_01;
	thread lib_A787::trophyupdatelaser();
}

//Function Number: 13
lib_A787::trophyupdatelaser()
{
	self endon("death");
	self endon("change_owner");
	self endon("trophyDisabled");
	self.laserent endon("death");
	for(;;)
	{
		var_00 = anglestoforward(self.var_41 + self.laserent.laserforwardangles);
		self.laserent.var_2E6 = self.var_2E6 + var_00 * self.laserent.laseroriginoffset;
		wait 0.05;
	}
}

//Function Number: 14
lib_A787::projectileexplode(param_00,param_01)
{
	self endon("death");
	var_02 = param_00.var_2E6;
	var_03 = param_00.model;
	var_04 = param_00.var_41;
	if(var_03 == "weapon_light_marker")
	{
		playfx(level.empgrenadeexplode,var_02,anglestoforward(var_04),anglestoup(var_04));
		param_01 thread lib_A787::trophybreak();
		param_00 delete();
		return;
	}

	param_00 delete();
	param_01 playsoundasmaster("trophy_fire");
	playfx(level.mine_explode,var_02,anglestoforward(var_04),anglestoup(var_04));
	radiusdamage(var_02,128,105,10,self,"MOD_EXPLOSIVE","trophy_mp");
}

//Function Number: 15
lib_A787::trophydamage(param_00)
{
	self endon("death");
	param_00 endon("death");
	self endon("change_owner");
	self setcandamage(1);
	self.health = 999999;
	self.var_275 = 100;
	self.damagetaken = 0;
	self waittill("damage",var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A);
	if(!isplayer(var_02))
	{
		continue;
	}

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

//Function Number: 16
lib_A787::trophybreak()
{
	playfxontag(common_scripts\utility::getfx("sentry_explode_mp"),self,"tag_origin");
	playfxontag(common_scripts\utility::getfx("sentry_smoke_mp"),self,"tag_origin");
	self playsoundasmaster("sentry_explode");
	self notify("death");
	var_00 = self.var_2E6;
	self.trigger makeunusable();
	if(isdefined(self.laserent))
	{
		self.laserent delete();
	}

	wait(3);
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}

	if(isdefined(self))
	{
		self delete();
	}
}