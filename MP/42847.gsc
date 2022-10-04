/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42847.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 27
 * Decompile Time: 20 ms
 * Timestamp: 4/20/2022 8:18:24 PM
*******************************************************************/

//Function Number: 1
lib_A75F::init()
{
	level._effect["water_wake"] = loadfx("vfx/treadfx/body_wake_water");
	level._effect["water_wake_stationary"] = loadfx("vfx/treadfx/body_wake_water_stationary");
	level._effect["water_splash_emerge"] = loadfx("vfx/water/body_splash_exit");
	level._effect["water_splash_enter"] = loadfx("vfx/water/body_splash");
	precacheshellshock("underwater");
	if(!isdefined(level.var_A291))
	{
		level.var_A291 = [];
	}

	if(!isdefined(level.var_A292))
	{
		level.var_A292 = 0;
	}

	if(!isdefined(level.shallow_water_weapon))
	{
		lib_A75F::func_8000("iw5_combatknife_mp");
	}

	if(!isdefined(level.deep_water_weapon))
	{
		lib_A75F::func_7F3F("iw5_underwater_mp");
	}

	if(!isdefined(level.var_A9D))
	{
		level.var_A9D = 1;
	}

	if(level.deep_water_weapon == level.shallow_water_weapon)
	{
		level.var_A9D = 0;
	}

	if(!isdefined(level.var_906E))
	{
		level.var_906E = 48;
	}

	var_00 = getentarray("trigger_underwater","targetname");
	level.water_triggers = var_00;
	foreach(var_02 in var_00)
	{
		var_02 lib_A75F::func_23A5();
		var_02 thread lib_A75F::func_A245();
		level thread lib_A75F::func_1F0E(var_02);
	}

	level thread lib_A75F::func_64CA();
	setdvar("scr_ball_water_drop_delay",10);
}

//Function Number: 2
lib_A75F::func_6C02(param_00)
{
	if(param_00)
	{
		self.inwater = 1;
		if(!function_02D9(self) && maps\mp\_utility::isaigameparticipant(self) && !isdefined(level.bots_ignore_water))
		{
			self botsetflag("in_water",1);
			return;
		}

		return;
	}

	self.inwater = undefined;
	if(!function_02D9(self) && maps\mp\_utility::isaigameparticipant(self) && !isdefined(level.bots_ignore_water))
	{
		self botsetflag("in_water",0);
	}
}

//Function Number: 3
watchforhostmigration()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("player_migrated");
		foreach(var_01 in level.var_A291)
		{
			self method_84EA(var_01.var_39B,var_01);
		}
	}
}

//Function Number: 4
lib_A75F::func_64CA()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread watchforhostmigration();
		foreach(var_02 in level.var_A291)
		{
			var_00 method_84EA(var_02.var_39B,var_02);
		}
	}
}

//Function Number: 5
lib_A75F::func_23A5()
{
	var_00 = common_scripts\utility::getstruct(self.target,"targetname");
	var_00.var_2E6 = var_00.var_2E6 + (0,0,level.var_A292);
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	var_01 show();
	if(isdefined(self.var_39B))
	{
		var_01.var_39B = self.var_39B;
		level.var_A291 = common_scripts\utility::array_add(level.var_A291,var_01);
	}
}

//Function Number: 6
lib_A75F::func_1F0E(param_00)
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("player_spawned",var_01);
		if(!var_01 istouching(param_00))
		{
			var_01 lib_A75F::func_6C02(0);
			var_01.underwater = undefined;
			var_01.var_4EBF = undefined;
			var_01.var_51C1 = undefined;
			var_01.var_51FE = undefined;
			var_01.water_last_weapon = undefined;
			var_01.var_519C = undefined;
			var_01 notify("out_of_water");
		}
	}
}

//Function Number: 7
lib_A75F::func_A245()
{
	level endon("game_ended");
	for(;;)
	{
		self waittill("trigger",var_00);
		if(isdefined(level.var_511A) && level.var_511A && isagent(var_00) && isdefined(var_00.var_4949) && var_00.var_4949 == "Quad" && !isdefined(var_00.inwater))
		{
			var_00 thread lib_A75F::func_4979(self);
		}

		if(!isplayer(var_00) && !isai(var_00))
		{
			continue;
		}

		if(!isalive(var_00))
		{
			continue;
		}

		if(!isdefined(var_00.inwater))
		{
			var_00 lib_A75F::func_6C02(1);
			var_00 thread lib_A75F::func_6CCE(self);
		}
	}
}

//Function Number: 8
lib_A75F::func_4979(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	lib_A75F::func_6C02(1);
	for(;;)
	{
		if(!lib_A75F::func_4E82(param_00,40))
		{
			wait(2.5);
			if(!lib_A75F::func_4E82(param_00,20))
			{
				self dodamage(self.health,self.var_2E6);
			}
		}

		wait 0.05;
	}
}

//Function Number: 9
lib_A75F::func_6CCE(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	thread lib_A75F::func_4FAB(param_00);
	thread lib_A75F::func_6D8F();
	self.var_35B1 = 0;
	self.var_35B0 = 0;
	for(;;)
	{
		if(maps\mp\_utility::isusingremote())
		{
			if(isdefined(self.underwater) && isdefined(self.var_519C))
			{
				self stopshellshock();
				self.var_519C = undefined;
			}
		}
		else if(isdefined(self.underwater) && !isdefined(self.var_519C))
		{
			self shellshock("underwater",19,0,0);
			self.var_519C = 1;
		}

		if(!self istouching(param_00))
		{
			lib_A75F::func_6C02(0);
			self.underwater = undefined;
			self.var_4EBF = undefined;
			self.var_51C1 = undefined;
			self.movespeedscaler = level.baseplayermovescale;
			maps\mp\gametypes\_weapons::updatemovespeedscale();
			self notify("out_of_water");
			break;
		}

		if(isdefined(self.var_4EBF) && lib_A75F::func_4E82(param_00,32))
		{
			self.var_4EBF = undefined;
			self.movespeedscaler = level.baseplayermovescale;
			maps\mp\gametypes\_weapons::updatemovespeedscale();
		}

		if(lib_A75F::func_4E82(param_00,32))
		{
			self.var_4EBF = undefined;
			if(isdefined(level.watermovescale))
			{
				self.movespeedscaler = level.baseplayermovescale * level.watermovescale;
			}
			else
			{
				self.movespeedscaler = level.baseplayermovescale;
			}

			maps\mp\gametypes\_weapons::updatemovespeedscale();
		}

		if(!isdefined(self.var_4EBF) && !lib_A75F::func_4E82(param_00,32))
		{
			self.var_4EBF = 1;
			self.movespeedscaler = 0.7 * level.baseplayermovescale;
			maps\mp\gametypes\_weapons::updatemovespeedscale();
		}

		if(!isdefined(self.underwater) && !lib_A75F::func_50A2(param_00,0))
		{
			if(isdefined(self.balldropdelay) && self.balldropdelay > 0)
			{
				self.balldropdelay--;
				wait 0.05;
				continue;
			}

			self.underwater = 1;
			if(isdefined(level.waterplayerhandledamagefunc))
			{
				self thread [[ level.waterplayerhandledamagefunc ]]();
			}
			else
			{
				thread lib_A75F::func_6CB6();
			}

			if(maps\mp\_utility::isaugmentedgamemode())
			{
				lib_A75F::func_2B0E();
			}

			if(!maps\mp\_utility::isusingremote())
			{
				self shellshock("underwater",19,0,0);
				self.var_519C = 1;
			}

			var_01 = self getcurrentweapon();
			if(var_01 != "none")
			{
				var_02 = weaponinventorytype(var_01);
				if(var_02 == "primary" || var_02 == "altmode")
				{
					self.water_last_weapon = var_01;
				}
				else if(isdefined(self.lastnonuseweapon) && self hasweapon(self.lastnonuseweapon))
				{
					self.water_last_weapon = self.lastnonuseweapon;
				}
			}

			if(isdefined(level.var_3BF5))
			{
				self [[ level.var_3BF5 ]](param_00);
			}

			if(isdefined(level.hordeonunderwater))
			{
				self [[ level.hordeonunderwater ]](param_00);
			}

			if(!level.iszombiegame)
			{
				maps\mp\killstreaks\_coop_util::playerstoppromptforstreaksupport();
			}
		}

		if(isdefined(self.underwater) && isdefined(self.var_51C1) || !isdefined(self.var_51FE) && lib_A75F::func_4E82(param_00,level.var_906E) || self getstance() == "prone" || !level.var_A9D)
		{
			self.var_51FE = 1;
			self.var_51C1 = undefined;
			lib_A75F::func_6C8A();
			if(isdefined(self.isjuggernaut) && self.isjuggernaut == 1)
			{
				lib_A75F::func_6C97("none");
				self method_8131(0);
				self method_84BF();
			}
			else if(!isdefined(level.iszombiegame) || !function_02D9(self))
			{
				lib_A75F::func_6C97("shallow");
			}
		}

		if(isdefined(self.underwater) && isdefined(self.var_51FE) || !isdefined(self.var_51C1) && !lib_A75F::func_4E82(param_00,level.var_906E) && self getstance() != "prone" && level.var_A9D)
		{
			self.var_51C1 = 1;
			self.var_51FE = undefined;
			lib_A75F::func_6C8A();
			if(isdefined(self.isjuggernaut) && self.isjuggernaut == 1)
			{
				lib_A75F::func_6C97("none");
				self method_8131(0);
				self method_84BF();
			}
			else if(!isdefined(level.iszombiegame) || !function_02D9(self))
			{
				lib_A75F::func_6C97("deep");
			}
		}

		if(isdefined(self.balldropdelay))
		{
			self.balldropdelay = getdvarint("scr_ball_water_drop_delay",10);
		}

		if(isdefined(self.underwater) && lib_A75F::func_50A2(param_00,0))
		{
			self.underwater = undefined;
			self.var_51C1 = undefined;
			self.var_51FE = undefined;
			self notify("above_water");
			var_03 = distance(self getvelocity(),(0,0,0));
			var_04 = (self.var_2E6[0],self.var_2E6[1],lib_A75F::func_415C(param_00));
			playfx(level._effect["water_splash_emerge"],var_04,anglestoforward((0,self.var_41[1],0) + (270,180,0)));
			if(!maps\mp\_utility::isusingremote())
			{
				self stopshellshock();
				self.var_519C = undefined;
			}

			lib_A75F::func_6C8A();
			if(maps\mp\_utility::isaugmentedgamemode())
			{
				lib_A75F::func_310D();
			}

			if(!level.iszombiegame)
			{
				maps\mp\killstreaks\_coop_util::playerstartpromptforstreaksupport();
			}
		}

		wait(0.05);
	}
}

//Function Number: 10
lib_A75F::func_50A4(param_00)
{
	if(isdefined(param_00.killstreakindexweapon))
	{
		var_01 = self.connectedpostgame["killstreaks"][self.killstreakindexweapon].streakname;
		if(isdefined(var_01))
		{
			if(common_scripts\utility::string_find(var_01,"turret") > 0 || common_scripts\utility::string_find(var_01,"sentry") > 0)
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 11
lib_A75F::func_6D8F()
{
	var_00 = common_scripts\utility::waittill_any_return("death","out_of_water");
	self.underwatermotiontype = undefined;
	self.var_2D20 = undefined;
	lib_A75F::func_6C02(0);
	self.underwater = undefined;
	self.var_4EBF = undefined;
	self.water_last_weapon = undefined;
	self.movespeedscaler = level.baseplayermovescale;
	maps\mp\gametypes\_weapons::updatemovespeedscale();
}

//Function Number: 12
lib_A75F::func_4FAB(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("out_of_water");
	var_01 = distance(self getvelocity(),(0,0,0));
	if(var_01 > 90)
	{
		var_02 = (self.var_2E6[0],self.var_2E6[1],lib_A75F::func_415C(param_00));
		playfx(level._effect["water_splash_enter"],var_02,anglestoforward((0,self.var_41[1],0) + (270,180,0)));
	}

	for(;;)
	{
		var_03 = self getvelocity();
		var_01 = distance(var_03,(0,0,0));
		if(var_01 > 0)
		{
			wait(max(1 - var_01 / 120,0.1));
		}
		else
		{
			wait(0.3);
		}

		if(var_01 > 5)
		{
			var_04 = vectornormalize((var_03[0],var_03[1],0));
			var_05 = anglestoforward(vectortoangles(var_04) + (270,180,0));
			var_02 = (self.var_2E6[0],self.var_2E6[1],lib_A75F::func_415C(param_00)) + var_01 / 4 * var_04;
			playfx(level._effect["water_wake"],var_02,var_05);
			continue;
		}

		var_02 = (self.var_2E6[0],self.var_2E6[1],lib_A75F::func_415C(param_00));
		playfx(level._effect["water_wake_stationary"],var_02,anglestoforward((0,self.var_41[1],0) + (270,180,0)));
	}
}

//Function Number: 13
lib_A75F::func_6CB6()
{
	level endon("game_ended");
	self endon("death");
	self endon("stopped_using_remote");
	self endon("disconnect");
	self endon("above_water");
	if(isdefined(level.var_511A) && level.var_511A)
	{
		self endon("becameSpectator");
	}

	thread lib_A75F::onplayerdeath();
	wait(13);
	for(;;)
	{
		if(!isdefined(self.isjuggernaut) || self.isjuggernaut == 0)
		{
			radiusdamage(self.var_2E6 + anglestoforward(self.var_41) * 5,1,20,20,undefined,"MOD_TRIGGER_HURT");
		}

		wait(1);
	}
}

//Function Number: 14
lib_A75F::onplayerdeath()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("above_water");
	if(isdefined(level.var_511A) && level.var_511A)
	{
		common_scripts\utility::waittill_any("death","becameSpectator");
	}
	else
	{
		self waittill("death");
	}

	lib_A75F::func_6C02(0);
	self.underwater = undefined;
	self.var_4EBF = undefined;
	self.var_51C1 = undefined;
	self.var_51FE = undefined;
	self.water_last_weapon = undefined;
	self.underwatermotiontype = undefined;
	self.var_35B0 = 0;
	self.var_35B1 = 0;
	if(!level.iszombiegame)
	{
		maps\mp\killstreaks\_coop_util::playerstartpromptforstreaksupport();
	}
}

//Function Number: 15
lib_A75F::func_4E82(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 32;
	}

	if(level lib_A75F::func_415C(param_00) - self.var_2E6[2] <= param_01)
	{
		return 1;
	}

	return 0;
}

//Function Number: 16
lib_A75F::func_50A2(param_00,param_01)
{
	if(lib_A75F::func_4088() + param_01 >= level lib_A75F::func_415C(param_00))
	{
		return 1;
	}

	return 0;
}

//Function Number: 17
lib_A75F::func_4088()
{
	var_00 = self geteye();
	self.var_35B0 = var_00[2] - self.var_35B1;
	self.var_35B1 = var_00[2];
	return var_00[2];
}

//Function Number: 18
lib_A75F::func_415C(param_00)
{
	var_01 = common_scripts\utility::getstruct(param_00.target,"targetname");
	var_02 = var_01.var_2E6[2];
	return var_02;
}

//Function Number: 19
lib_A75F::func_6C97(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("end_swimming");
	if(!isdefined(param_00))
	{
		param_00 = "shallow";
	}

	if((param_00 == "shallow" && self hasweapon(level.shallow_water_weapon)) || param_00 == "deep" && self hasweapon(level.deep_water_weapon) || isdefined(level.disable_water_weapon_swap))
	{
		self.var_2D20 = 1;
	}

	switch(param_00)
	{
		case "deep":
			break;

		case "shallow":
			break;

		case "none":
			break;

		default:
			break;
	}
}

//Function Number: 20
lib_A75F::func_6C8A()
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	if(isdefined(self.underwatermotiontype))
	{
		var_00 = self.underwatermotiontype;
		self notify("end_swimming");
		self enableweaponpickup();
		common_scripts\utility::_enableweaponswitch();
		common_scripts\utility::_enableoffhandweapons();
		if(isdefined(self.isjuggernaut) && self.isjuggernaut == 1 && isdefined(self.heavyexodata))
		{
			self method_8131(1);
			if(!isdefined(self.heavyexodata.haslongpunch) || self.heavyexodata.haslongpunch == 0)
			{
				self disableoffhandweapons();
			}

			if(!isdefined(self.heavyexodata.hasrockets) || self.heavyexodata.hasrockets == 0)
			{
				self method_84BF();
			}
			else
			{
				self method_84C0();
			}
		}

		if(isdefined(level.var_511A) && isplayer(self))
		{
			maps\mp\gametypes\_weapons::restoreweapon("underwater");
		}
		else if(isdefined(self.water_last_weapon))
		{
			maps\mp\_utility::switch_to_last_weapon(self.water_last_weapon);
		}

		switch(var_00)
		{
			case "deep":
				break;

			case "shallow":
				break;

			case "none":
				break;

			default:
				break;
		}
	}
}

//Function Number: 21
lib_A75F::func_41D7(param_00)
{
	if(!isdefined(self.var_2D20) || !self.var_2D20)
	{
		self giveweapon(param_00);
	}
}

//Function Number: 22
lib_A75F::func_9116(param_00)
{
	if(!isdefined(self.var_2D20) || !self.var_2D20)
	{
		self takeweapon(param_00);
	}
}

//Function Number: 23
lib_A75F::func_310D()
{
	maps\mp\_utility::playerallowhighjump(1);
	maps\mp\_utility::playerallowhighjumpdrop(1);
	maps\mp\_utility::playerallowboostjump(1);
	maps\mp\_utility::playerallowpowerslide(1);
	maps\mp\_utility::playerallowdodge(1);
}

//Function Number: 24
lib_A75F::func_2B0E()
{
	maps\mp\_utility::playerallowhighjump(0);
	maps\mp\_utility::playerallowhighjumpdrop(0);
	maps\mp\_utility::playerallowboostjump(0);
	maps\mp\_utility::playerallowpowerslide(0);
	maps\mp\_utility::playerallowdodge(0);
}

//Function Number: 25
lib_A75F::func_8000(param_00)
{
	level.shallow_water_weapon = param_00;
}

//Function Number: 26
lib_A75F::func_7F3F(param_00)
{
	level.deep_water_weapon = param_00;
}

//Function Number: 27
lib_A75F::func_51F8(param_00)
{
	switch(param_00)
	{
		case "iw5_underwater_mp":
		case "iw5_combatknife_mp":
		case "none":
			break;

		default:
			break;
	}
}