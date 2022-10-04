/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42810.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:18:19 PM
*******************************************************************/

//Function Number: 1
lib_A73A::watchexplosivegelusage()
{
	self endon("spawned_player");
	self endon("disconnect");
	self endon("death");
	self endon("faux_spawn");
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "explosive_gel_mp")
		{
			if(!isalive(self))
			{
				var_00 delete();
				return;
			}

			thread lib_A73A::tryuseexplosivegel(var_00);
		}
	}
}

//Function Number: 2
lib_A73A::init()
{
	precachemodel("weapon_c4");
	precachemodel("weapon_c4_bombsquad");
	level.explosivegelsettings = spawnstruct();
	level.explosivegelsettings.stuckmesh = "weapon_c4";
	level.explosivegelsettings.gelbombsquadmesh = "weapon_c4_bombsquad";
	level.explosivegelsettings.gelexplosionfx = loadfx("vfx/explosion/frag_grenade_default");
	level.explosivegelsettings.beacon["enemy"] = loadfx("vfx/lights/light_c4_blink");
	level.explosivegelsettings.beacon["friendly"] = loadfx("vfx/lights/light_mine_blink_friendly");
}

//Function Number: 3
lib_A73A::tryuseexplosivegel(param_00)
{
	thread lib_A73A::launchexplosivegel(param_00);
	return 1;
}

//Function Number: 4
lib_A73A::launchexplosivegel(param_00)
{
	thread lib_A73A::watchexplosivegelaltdetonate(param_00);
	var_01 = lib_A73A::stickexplosivegel(param_00);
}

//Function Number: 5
lib_A73A::watchexplosivegelaltdetonate(param_00)
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self endon("change_owner");
	param_00 endon("missile_stuck");
	param_00 endon("death");
	var_01 = 0;
	for(;;)
	{
		if(self usebuttonpressed())
		{
			var_01 = 0;
			while(self usebuttonpressed())
			{
				var_01 = var_01 + 0.05;
				wait(0.05);
			}

			if(var_01 >= 0.5)
			{
				continue;
			}

			var_01 = 0;
			while(!self usebuttonpressed() && var_01 < 0.5)
			{
				var_01 = var_01 + 0.05;
				wait(0.05);
			}

			if(var_01 >= 0.5)
			{
				continue;
			}

			thread lib_A73A::earlydetonate(param_00);
		}

		wait(0.05);
	}
}

//Function Number: 6
lib_A73A::stickexplosivegel(param_00)
{
	self endon("earlyNotify");
	param_00 waittill("missile_stuck");
	var_01 = bullettrace(param_00.var_2E6,param_00.var_2E6 - (0,0,4),0,param_00);
	var_02 = bullettrace(param_00.var_2E6,param_00.var_2E6 + (0,0,4),0,param_00);
	var_03 = anglestoforward(param_00.var_41);
	var_04 = bullettrace(param_00.var_2E6 + (0,0,4),param_00.var_2E6 + var_03 * 4,0,param_00);
	var_05 = undefined;
	var_06 = 0;
	var_07 = 0;
	if(var_04["surfacetype"] != "none")
	{
		var_05 = var_04;
		var_07 = 1;
	}
	else if(var_02["surfacetype"] != "none")
	{
		var_05 = var_02;
		var_06 = 1;
	}
	else if(var_01["surfacetype"] != "none")
	{
		var_05 = var_01;
	}
	else
	{
		var_05 = var_01;
	}

	var_08 = var_05["position"];
	if(var_08 == var_02["position"])
	{
		var_08 = var_08 + (0,0,-5);
	}

	var_09 = spawn("script_model",var_08);
	var_09.isup = var_06;
	var_09.isforward = var_07;
	var_0A = vectornormalize(var_05["normal"]);
	var_0B = vectortoangles(var_0A);
	var_0B = var_0B + (90,0,0);
	var_09.var_41 = var_0B;
	var_09 setmodel(level.explosivegelsettings.stuckmesh);
	var_09.owner = self;
	var_09 method_8383(self);
	var_09.killcamoffset = (0,0,55);
	var_09.killcament = spawn("script_model",var_09.var_2E6 + var_09.killcamoffset);
	var_09.stunned = 0;
	var_09.fx_origin = "explosive_gel_mp";
	param_00 delete();
	level.mines[level.mines.size] = var_09;
	var_09 thread lib_A73A::createbombsquadmodel(level.explosivegelsettings.gelbombsquadmesh,"tag_origin",self);
	var_09 thread lib_A73A::minebeacon();
	var_09 thread lib_A73A::setexplosivegelteamheadicon(self.inliveplayerkillstreak);
	var_09 thread lib_A73A::minedamagemonitor();
	var_09 thread lib_A73A::explosivegelcountdowndetonation(self);
	return var_09;
}

//Function Number: 7
lib_A73A::createbombsquadmodel(param_00,param_01,param_02)
{
	var_03 = spawn("script_model",(0,0,0));
	var_03 hide();
	wait(0.05);
	var_03 thread maps\mp\gametypes\_weapons::bombsquadvisibilityupdater(param_02);
	var_03 setmodel(param_00);
	var_03 linkto(self,param_01,(0,0,0),(0,0,0));
	var_03 setcontents(0);
	self waittill("death");
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}

	var_03 delete();
}

//Function Number: 8
lib_A73A::minebeacon()
{
	var_00["friendly"] = spawnfx(level.explosivegelsettings.beacon["friendly"],self gettagorigin("tag_fx"));
	var_00["enemy"] = spawnfx(level.explosivegelsettings.beacon["enemy"],self gettagorigin("tag_fx"));
	thread lib_A73A::minebeaconteamupdater(var_00);
	self waittill("death");
	var_00["friendly"] delete();
	var_00["enemy"] delete();
}

//Function Number: 9
lib_A73A::minebeaconteamupdater(param_00,param_01)
{
	self endon("death");
	var_02 = self.owner.inliveplayerkillstreak;
	wait(0.05);
	triggerfx(param_00["friendly"]);
	triggerfx(param_00["enemy"]);
	for(;;)
	{
		param_00["friendly"] hide();
		param_00["enemy"] hide();
		foreach(var_04 in level.var_328)
		{
			if(level.teambased)
			{
				if(var_04.inliveplayerkillstreak == var_02)
				{
					param_00["friendly"] showtoplayer(var_04);
				}
				else
				{
					param_00["enemy"] showtoplayer(var_04);
				}

				continue;
			}

			if(var_04 == self.owner)
			{
				param_00["friendly"] showtoplayer(var_04);
				continue;
			}

			param_00["enemy"] showtoplayer(var_04);
		}

		level common_scripts\utility::waittill_either("joined_team","player_spawned");
	}
}

//Function Number: 10
lib_A73A::setexplosivegelteamheadicon(param_00)
{
	self endon("death");
	wait(0.05);
	if(level.teambased)
	{
		if(self.isup == 1 || self.isforward == 1)
		{
			maps\mp\_entityheadicons::setteamheadicon(param_00,(0,0,28),undefined,1);
			return;
		}

		maps\mp\_entityheadicons::setteamheadicon(param_00,(0,0,28));
		return;
	}

	if(isdefined(self.owner))
	{
		if(self.isup == 1)
		{
			maps\mp\_entityheadicons::setplayerheadicon(self.owner,(28,0,28));
			return;
		}

		maps\mp\_entityheadicons::setplayerheadicon(self.owner,(0,0,28));
		return;
	}
}

//Function Number: 11
lib_A73A::minedamagemonitor()
{
	self endon("mine_triggered");
	self endon("mine_selfdestruct");
	self endon("death");
	self setcandamage(1);
	self.var_275 = 100000;
	self.health = self.var_275;
	var_00 = undefined;
	self waittill("damage",var_01,var_00,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09);
	if(!isplayer(var_00))
	{
		continue;
	}

	if(!maps\mp\gametypes\_weapons::friendlyfirecheck(self.owner,var_00))
	{
		continue;
	}

	if(isdefined(var_09))
	{
		var_0A = maps\mp\_utility::strip_suffix(var_09,"_lefthand");
		switch(var_0A)
		{
			case "smoke_grenade_var_mp":
			case "smoke_grenade_mp":
				break;
		}
	}
}

//Function Number: 12
lib_A73A::mineexplode(param_00)
{
	if(!isdefined(self) || !isdefined(self.owner))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = self.owner;
	}

	self playsoundasmaster("null");
	var_01 = self gettagorigin("tag_fx");
	playfx(level.explosivegelsettings.gelexplosionfx,var_01);
	wait(0.05);
	if(!isdefined(self) || !isdefined(self.owner))
	{
		return;
	}

	self hide();
	self entityradiusdamage(self.var_2E6,192,100,100,param_00,"MOD_EXPLOSIVE");
	if(isdefined(self.owner) && isdefined(level.leaderdialogonplayer_func))
	{
		self.owner thread [[ level.leaderdialogonplayer_func ]]("mine_destroyed",undefined,undefined,self.var_2E6);
	}

	wait(0.2);
	if(!isdefined(self) || !isdefined(self.owner))
	{
		return;
	}

	thread lib_A73A::apm_mine_deletekillcament();
	self notify("death");
	if(isdefined(self.pickuptrigger))
	{
		self.pickuptrigger delete();
	}

	self hide();
}

//Function Number: 13
lib_A73A::earlydetonate(param_00)
{
	self notify("earlyNotify");
	var_01 = param_00 gettagorigin("tag_fx");
	playfx(level.explosivegelsettings.gelexplosionfx,var_01);
	param_00 detonate();
}

//Function Number: 14
lib_A73A::apm_mine_deletekillcament()
{
	wait(3);
	self.killcament delete();
	self delete();
	level.mines = common_scripts\utility::array_removeundefined(level.mines);
}

//Function Number: 15
lib_A73A::explosivegelcountdowndetonation(param_00)
{
	self endon("mine_destroyed");
	self endon("mine_selfdestruct");
	self endon("death");
	wait(3);
	self notify("mine_triggered");
	thread lib_A73A::mineexplode();
}