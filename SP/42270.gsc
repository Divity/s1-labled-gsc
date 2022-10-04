/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42270.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 33
 * Decompile Time: 22 ms
 * Timestamp: 4/20/2022 8:22:04 PM
*******************************************************************/

//Function Number: 1
lib_A51E::init()
{
	level._effect["c4_light_blink"] = loadfx("vfx/lights/light_c4_blink");
	level._effect["claymore_laser"] = loadfx("vfx/props/claymore_laser");
	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		level.var_328[var_00] thread lib_A51E::watchgrenadeusage();
	}
}

//Function Number: 2
lib_A51E::watchgrenadeusage()
{
	level.c4explodethisframe = 0;
	self endon("death");
	self.var_196D = [];
	self.throwinggrenade = 0;
	thread lib_A51E::func_A1FA();
	thread lib_A51E::func_A1FD();
	thread lib_A51E::func_A1FC();
	thread lib_A51E::watchclaymores();
	thread lib_A51E::func_138D();
	thread lib_A51E::func_137B();
	for(;;)
	{
		self waittill("grenade_pullback",var_00);
		self.throwinggrenade = 1;
		if(var_00 == "c4")
		{
			lib_A51E::beginc4tracking();
			continue;
		}

		if(var_00 == "smoke_grenade_american")
		{
			lib_A51E::func_13A0();
			continue;
		}

		if(var_00 == "flash_grenade")
		{
			lib_A51E::func_139B();
			continue;
		}

		lib_A51E::begingrenadetracking();
	}
}

//Function Number: 3
lib_A51E::func_13A0()
{
	self waittill("grenade_fire",var_00,var_01);
	if(!isdefined(level.var_867E))
	{
		level.var_867E = 0;
	}

	var_00 thread lib_A51E::func_867B();
}

//Function Number: 4
lib_A51E::func_139B()
{
	self.throwinggrenade = 0;
	var_00 = gettime();
	self waittill("grenade_fire",var_01,var_02);
	if(isdefined(var_01))
	{
		var_03 = gettime();
		var_04 = var_03 - var_00;
		if(var_04 >= 1250)
		{
			var_01 waittill("explode",var_05);
			if(soundexists("null"))
			{
				thread common_scripts\utility::play_sound_in_space("null",var_05);
			}

			radiusdamage(var_05,96,300,200,self,"MOD_UNKNOWN","flash_grenade");
		}
	}
}

//Function Number: 5
lib_A51E::func_138D()
{
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "semtex_grenade")
		{
			thread lib_A51E::func_94AB(var_00);
			var_00 thread lib_A51E::func_7C75(self);
		}
	}
}

//Function Number: 6
lib_A51E::func_94AB(param_00)
{
	self.throwinggrenade = 0;
	if(!isdefined(level.var_9338))
	{
		level.var_9338 = 1;
	}
	else
	{
		level.var_9338++;
	}

	param_00 waittill("death");
	waittillframeend;
	level.var_9338--;
}

//Function Number: 7
lib_A51E::func_7C75(param_00)
{
	self waittill("missile_stuck",var_01);
	if(!isdefined(var_01))
	{
		return;
	}

	if(var_01.code_classname != "script_vehicle")
	{
		return;
	}

	var_01.var_46FA = 1;
	self waittill("explode");
	if(!isdefined(var_01) || !isalive(var_01))
	{
		return;
	}

	if(var_01 lib_A59E::func_502E() || var_01 lib_A5A0::func_E29(param_00))
	{
		var_01.var_46FA = undefined;
		return;
	}

	var_01 method_8052(var_01.var_2E6,param_00);
}

//Function Number: 8
lib_A51E::func_137B()
{
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "concussion_grenade")
		{
			thread lib_A51E::func_949A(var_00);
		}
	}
}

//Function Number: 9
lib_A51E::func_949A(param_00)
{
	self.throwinggrenade = 0;
	param_00 waittill("death");
	lib_A59A::func_863D(0.1);
	lib_A59A::func_863E(0.25);
	lib_A59A::func_863F(1);
	lib_A59A::func_8640(0.25);
	lib_A59A::func_863A();
	setdvar("noflash","1");
	wait(0.05);
	setdvar("noflash","0");
	wait(2);
	lib_A59A::func_863B();
}

//Function Number: 10
lib_A51E::func_867B()
{
	level.var_867E++;
	wait(50);
	level.var_867E--;
}

//Function Number: 11
lib_A51E::begingrenadetracking()
{
	self endon("death");
	self waittill("grenade_fire",var_00,var_01);
	if(var_01 == "fraggrenade")
	{
		var_00 thread lib_A59A::grenade_earthquake();
	}
	else if(var_01 == "ninebang_grenade")
	{
		self.var_932F = 1;
	}

	self.throwinggrenade = 0;
}

//Function Number: 12
lib_A51E::beginc4tracking()
{
	self endon("death");
	common_scripts\utility::waittill_any("grenade_fire","weapon_change");
	self.throwinggrenade = 0;
}

//Function Number: 13
lib_A51E::func_A1FA()
{
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "c4")
		{
			if(!self.var_196D.size)
			{
				thread lib_A51E::func_A1FB();
			}

			self.var_196D[self.var_196D.size] = var_00;
			var_00.owner = self;
			var_00 thread lib_A51E::c4damage();
			thread lib_A51E::c4death(var_00);
			var_00 thread lib_A51E::func_6A32();
		}
	}
}

//Function Number: 14
lib_A51E::c4death(param_00)
{
	param_00 waittill("death");
	self.var_196D = lib_A59A::func_CFB(self.var_196D,param_00);
}

//Function Number: 15
lib_A51E::watchclaymores()
{
	self endon("spawned_player");
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "claymore" || var_01 == "claymore_mp")
		{
			var_00.owner = self;
			var_00 thread lib_A51E::c4damage();
			var_00 thread lib_A51E::claymoredetonation();
			var_00 thread lib_A51E::func_6A33();
			var_00 thread lib_A51E::func_1E49(self.inliveplayerkillstreak);
		}
	}
}

//Function Number: 16
lib_A51E::func_1E49(param_00)
{
	self endon("death");
	wait(1);
	if(isdefined(level.var_1E4B))
	{
		self thread [[ level.var_1E4B ]](param_00);
		return;
	}

	self sentient_makeentitysentient(param_00,1);
	self.var_56 = 2;
	self.var_279 = 750;
	self.var_4B2 = -1000;
}

//Function Number: 17
lib_A51E::claymoredetonation()
{
	self endon("death");
	self waittill("missile_stuck");
	var_00 = 192;
	if(isdefined(self.var_29B2))
	{
		var_00 = self.var_29B2;
	}

	var_01 = spawn("trigger_radius",self.var_2E6 + (0,0,0 - var_00),9,var_00,var_00 * 2);
	thread lib_A51E::deleteondeath(var_01);
	if(!isdefined(level.var_1E4A))
	{
		level.var_1E4A = [];
	}

	level.var_1E4A = common_scripts\utility::array_add(level.var_1E4A,self);
	if(!lib_A59A::func_5080() && level.var_1E4A.size > 15)
	{
		level.var_1E4A[0] delete();
	}

	for(;;)
	{
		var_01 waittill("trigger",var_02);
		if(isdefined(self.owner) && var_02 == self.owner)
		{
			continue;
		}

		if(isplayer(var_02))
		{
			continue;
		}

		if(var_02 damageconetrace(self.var_2E6,self) > 0)
		{
			self playsoundasmaster("claymore_activated_SP");
			wait(0.4);
			if(isdefined(self.owner))
			{
				self detonate(self.owner);
			}
			else
			{
				self detonate(undefined);
			}

			return;
		}
	}
}

//Function Number: 18
lib_A51E::deleteondeath(param_00)
{
	self waittill("death");
	level.var_1E4A = lib_A59A::func_CFB(level.var_1E4A,self);
	wait(0.05);
	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 19
lib_A51E::func_A1FD()
{
	self endon("death");
	for(;;)
	{
		self waittill("detonate");
		var_00 = self getcurrentweapon();
		if(var_00 == "c4")
		{
			for(var_01 = 0;var_01 < self.var_196D.size;var_01++)
			{
				if(isdefined(self.var_196D[var_01]))
				{
					self.var_196D[var_01] thread lib_A51E::waitanddetonate(0.1);
				}
			}

			self.var_196D = [];
		}
	}
}

//Function Number: 20
lib_A51E::func_A1FC()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		self waittill("alt_detonate");
		var_00 = self getcurrentweapon();
		if(var_00 != "c4")
		{
			var_01 = [];
			for(var_02 = 0;var_02 < self.var_196D.size;var_02++)
			{
				var_03 = self.var_196D[var_02];
				if(isdefined(self.var_196D[var_02]))
				{
					var_03 thread lib_A51E::waitanddetonate(0.1);
				}
			}

			self.var_196D = var_01;
			self notify("detonated");
		}
	}
}

//Function Number: 21
lib_A51E::waitanddetonate(param_00)
{
	self endon("death");
	wait(param_00);
	self detonate();
}

//Function Number: 22
lib_A51E::c4damage()
{
	self.health = 100;
	self setcandamage(1);
	self.var_275 = 100000;
	self.health = self.var_275;
	var_00 = undefined;
	for(;;)
	{
		self waittill("damage",var_01,var_00);
		break;
	}

	self playsoundasmaster("claymore_activated_SP");
	if(level.c4explodethisframe)
	{
		wait(0.1 + randomfloat(0.4));
	}
	else
	{
		wait(0.05);
	}

	if(!isdefined(self))
	{
		return;
	}

	level.c4explodethisframe = 1;
	thread lib_A51E::resetc4explodethisframe();
	if(isplayer(var_00))
	{
		self detonate(var_00);
		return;
	}

	self detonate();
}

//Function Number: 23
lib_A51E::resetc4explodethisframe()
{
	wait(0.05);
	level.c4explodethisframe = 0;
}

//Function Number: 24
lib_A51E::saydamaged(param_00,param_01)
{
	for(var_02 = 0;var_02 < 60;var_02++)
	{
		wait(0.05);
	}
}

//Function Number: 25
lib_A51E::func_6A32()
{
	self endon("death");
	self waittill("missile_stuck");
	playfxontag(common_scripts\utility::getfx("c4_light_blink"),self,"tag_fx");
}

//Function Number: 26
lib_A51E::func_6A33()
{
	self endon("death");
	self waittill("missile_stuck");
	playfxontag(common_scripts\utility::getfx("claymore_laser"),self,"tag_fx");
}

//Function Number: 27
lib_A51E::func_1EEE(param_00)
{
	self waittill("death");
	param_00 delete();
}

//Function Number: 28
lib_A51E::getdamageableents(param_00,param_01,param_02,param_03)
{
	var_04 = [];
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	for(var_05 = 0;var_05 < level.var_328.size;var_05++)
	{
		if(!isalive(level.var_328[var_05]) || level.var_328[var_05].sessionstate != "playing")
		{
			continue;
		}

		var_06 = level.var_328[var_05].var_2E6 + (0,0,32);
		var_07 = distance(param_00,var_06);
		if(var_07 < param_01 && !param_02 || lib_A51E::weapondamagetracepassed(param_00,var_06,param_03,undefined))
		{
			var_08 = spawnstruct();
			var_08.isplayer = 1;
			var_08.isadestructable = 0;
			var_08.entity = level.var_328[var_05];
			var_08.damagecenter = var_06;
			var_04[var_04.size] = var_08;
		}
	}

	var_09 = getentarray("grenade","classname");
	for(var_05 = 0;var_05 < var_09.size;var_05++)
	{
		var_0A = var_09[var_05].var_2E6;
		var_07 = distance(param_00,var_0A);
		if(var_07 < param_01 && !param_02 || lib_A51E::weapondamagetracepassed(param_00,var_0A,param_03,var_09[var_05]))
		{
			var_08 = spawnstruct();
			var_08.isplayer = 0;
			var_08.isadestructable = 0;
			var_08.entity = var_09[var_05];
			var_08.damagecenter = var_0A;
			var_04[var_04.size] = var_08;
		}
	}

	var_0B = getentarray("destructable","targetname");
	for(var_05 = 0;var_05 < var_0B.size;var_05++)
	{
		var_0A = var_0B[var_05].var_2E6;
		var_07 = distance(param_00,var_0A);
		if(var_07 < param_01 && !param_02 || lib_A51E::weapondamagetracepassed(param_00,var_0A,param_03,var_0B[var_05]))
		{
			var_08 = spawnstruct();
			var_08.isplayer = 0;
			var_08.isadestructable = 1;
			var_08.entity = var_0B[var_05];
			var_08.damagecenter = var_0A;
			var_04[var_04.size] = var_08;
		}
	}

	return var_04;
}

//Function Number: 29
lib_A51E::weapondamagetracepassed(param_00,param_01,param_02,param_03)
{
	var_04 = undefined;
	var_05 = param_01 - param_00;
	if(lengthsquared(var_05) < param_02 * param_02)
	{
		var_04 = param_01;
	}

	var_06 = vectornormalize(var_05);
	var_04 = param_00 + (var_06[0] * param_02,var_06[1] * param_02,var_06[2] * param_02);
	var_07 = bullettrace(var_04,param_01,0,param_03);
	if(getdvarint("scr_damage_debug") != 0)
	{
		if(var_07["fraction"] == 1)
		{
			thread lib_A51E::debugline(var_04,param_01,(1,1,1));
		}
		else
		{
			thread lib_A51E::debugline(var_04,var_07["position"],(1,0.9,0.8));
			thread lib_A51E::debugline(var_07["position"],param_01,(1,0.4,0.3));
		}
	}

	return var_07["fraction"] == 1;
}

//Function Number: 30
lib_A51E::damageent(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(self.isplayer)
	{
		self.damageorigin = param_05;
		self.entity thread [[ level.callbackplayerdamage ]](param_00,param_01,param_02,0,param_03,param_04,param_05,param_06,"none",0);
		return;
	}

	if(self.isadestructable && param_04 == "artillery_mp" || param_04 == "claymore_mp")
	{
		return;
	}

	self.entity notify("damage",param_02,param_01);
}

//Function Number: 31
lib_A51E::debugline(param_00,param_01,param_02)
{
	for(var_03 = 0;var_03 < 600;var_03++)
	{
		wait(0.05);
	}
}

//Function Number: 32
lib_A51E::onweapondamage(param_00,param_01,param_02,param_03)
{
	self endon("death");
	switch(param_01)
	{
		case "concussion_grenade_mp":
			break;

		default:
			break;
	}
}

//Function Number: 33
lib_A51E::func_A1FB()
{
	self endon("death");
	self endon("disconnect");
	self endon("detonated");
	level endon("game_ended");
	var_00 = 0;
	for(;;)
	{
		if(self usebuttonpressed())
		{
			var_00 = 0;
			while(self usebuttonpressed())
			{
				var_00 = var_00 + 0.05;
				wait(0.05);
			}

			if(var_00 >= 0.5)
			{
				continue;
			}

			var_00 = 0;
			while(!self usebuttonpressed() && var_00 < 0.5)
			{
				var_00 = var_00 + 0.05;
				wait(0.05);
			}

			if(var_00 >= 0.5)
			{
				continue;
			}

			if(!self.var_196D.size)
			{
				return;
			}

			self notify("alt_detonate");
		}

		wait(0.05);
	}
}