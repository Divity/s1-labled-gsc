/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42958.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 20
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:24:16 PM
*******************************************************************/

//Function Number: 1
lib_A7CE::init()
{
	level.killstreakfuncs["ripped_turret"] = ::lib_A7CE::tryuserippedturret;
	level.killstreakwieldweapons["turretheadmg_mp"] = "ripped_turret";
	level.killstreakwieldweapons["turretheadenergy_mp"] = "ripped_turret";
	level.killstreakwieldweapons["turretheadrocket_mp"] = "ripped_turret";
	level thread lib_A7CE::onplayerconnect();
}

//Function Number: 2
lib_A7CE::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		level thread lib_A7CE::onplayerspawned(var_00);
	}
}

//Function Number: 3
lib_A7CE::onplayerspawned(param_00)
{
	for(;;)
	{
		param_00 waittill("killstreakUseWaiter");
		level thread lib_A7CE::updateammo(param_00);
	}
}

//Function Number: 4
lib_A7CE::updateammo(param_00)
{
	param_00 setclientomnvar("ui_energy_ammo",1);
	if(!isdefined(param_00.connectedpostgame["rippableSentry"]))
	{
		return;
	}

	var_01 = undefined;
	if(param_00 hasweapon("turretheadmg_mp"))
	{
		var_01 = "turretheadmg_mp";
	}
	else if(param_00 hasweapon("turretheadenergy_mp"))
	{
		var_01 = "turretheadenergy_mp";
	}
	else if(param_00 hasweapon("turretheadrocket_mp"))
	{
		var_01 = "turretheadrocket_mp";
	}

	if(!isdefined(var_01))
	{
		return;
	}

	var_02 = param_00 lib_A7CE::playergetrippableammo();
	if(lib_A7CE::isturretenergyweapon(var_01))
	{
		var_03 = lib_A7CE::getammoforturretweapontype(var_01);
		var_04 = var_02 / var_03;
		param_00 setclientomnvar("ui_energy_ammo",var_04);
		return;
	}

	param_00 setweaponammoclip(var_01,var_02);
}

//Function Number: 5
lib_A7CE::tryuserippedturret(param_00,param_01)
{
	var_02 = lib_A7CE::tryuserippedturretinternal(param_01);
	if(var_02)
	{
		maps\mp\_matchdata::logkillstreakevent("ripped_turret",self.var_2E6);
	}

	return var_02;
}

//Function Number: 6
lib_A7CE::tryuserippedturretinternal(param_00)
{
	if(maps\mp\_utility::isusingremote())
	{
		return 0;
	}

	var_01 = lib_A7CE::playersetuprecordedturrethead(param_00);
	return var_01;
}

//Function Number: 7
lib_A7CE::playergiveturrethead(param_00)
{
	maps\mp\killstreaks\_killstreaks::givekillstreak("ripped_turret",0,0,self,[param_00]);
	if(!isdefined(self.connectedpostgame["rippableSentry"]))
	{
		self.connectedpostgame["rippableSentry"] = spawnstruct();
	}

	var_01 = lib_A7CE::getammoforturretweapontype(param_00);
	lib_A7CE::playerrecordrippableammo(var_01);
	if(!common_scripts\utility::is_player_gamepad_enabled())
	{
		self notify("streakUsed1");
		waittillframeend;
	}

	self switchtoweapon(param_00);
}

//Function Number: 8
lib_A7CE::playermoduleshaverippedturret(param_00)
{
	foreach(var_02 in param_00)
	{
		if(var_02 == "turretheadenergy_mp" || var_02 == "turretheadrocket_mp" || var_02 == "turretheadmg_mp")
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 9
lib_A7CE::playersetuprecordedturrethead(param_00)
{
	self endon("disconnect");
	level endon("game_ended");
	var_01 = lib_A7CE::playergetrippableammo();
	var_02 = param_00[0];
	if(!lib_A7CE::isturretenergyweapon(var_02))
	{
		self setweaponammoclip(var_02,var_01);
	}

	self setweaponammostock(var_02,0);
	thread lib_A7CE::playermonitorweaponswitch(var_02);
	if(lib_A7CE::isturretenergyweapon(var_02))
	{
		thread lib_A7CE::playersetupturretenergybar(var_02,var_01);
	}
	else
	{
		thread lib_A7CE::playertrackturretammo(var_02);
	}

	common_scripts\utility::waittill_any_return("death","rippable_complete","rippable_switch");
	if(!isdefined(self))
	{
		return 0;
	}

	if(lib_A7CE::isturretenergyweapon(var_02))
	{
		self method_849C("fire_turret_weapon","+attack");
		self method_849C("fire_turret_weapon","+attack_akimbo_accessible");
	}

	var_03 = !lib_A7CE::playerhasrippableturretinfo();
	return var_03;
}

//Function Number: 10
lib_A7CE::playermonitorweaponswitch(param_00)
{
	self endon("death");
	self endon("disconnect");
	self endon("rippable_complete");
	var_01 = self getcurrentweapon();
	while(var_01 == param_00 || maps\mp\_utility::isbombsiteweapon(var_01))
	{
		self waittill("weapon_change",var_01);
	}

	if(maps\mp\_utility::iskillstreakweapon(var_01))
	{
		self.justswitchedtokillstreakweapon = var_01;
	}

	self notify("rippable_switch");
}

//Function Number: 11
lib_A7CE::playertrackturretammo(param_00)
{
	self endon("death");
	self endon("disconnect");
	self endon("rippable_switch");
	for(;;)
	{
		var_01 = self getweaponammoclip(param_00);
		lib_A7CE::playerrecordrippableammo(var_01);
		if(var_01 == 0)
		{
			lib_A7CE::playerclearrippableturretinfo();
			self notify("rippable_complete");
			return;
		}

		wait 0.05;
	}
}

//Function Number: 12
lib_A7CE::playerhasturretheadweapon()
{
	if(lib_A7CE::playerhasrippableturretinfo())
	{
		return 1;
	}

	var_00 = self getweaponslistprimaries();
	foreach(var_02 in var_00)
	{
		if(var_02 == "turretheadenergy_mp" || var_02 == "turretheadrocket_mp" || var_02 == "turretheadmg_mp")
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 13
lib_A7CE::getammoforturretweapontype(param_00)
{
	if(param_00 == "turretheadmg_mp")
	{
		return 100;
	}

	if(param_00 == "turretheadrocket_mp")
	{
		return 6;
	}

	return getfullenergy();
}

//Function Number: 14
lib_A7CE::isturretenergyweapon(param_00)
{
	return param_00 == "turretheadenergy_mp";
}

//Function Number: 15
lib_A7CE::playersetupturretenergybar(param_00,param_01)
{
	self endon("death");
	self endon("disconnect");
	self endon("rippable_switch");
	var_02 = getfullenergy();
	self notifyonplayercommand("fire_turret_weapon","+attack");
	self notifyonplayercommand("fire_turret_weapon","+attack_akimbo_accessible");
	param_01 = lib_A7CE::playergetrippableammo();
	var_03 = param_01 / var_02;
	self setclientomnvar("ui_energy_ammo",var_03);
	for(;;)
	{
		if(!self attackbuttonpressed())
		{
			self waittill("fire_turret_weapon");
		}

		if(self isswitchingweapon() || self getcurrentweapon() != "turretheadenergy_mp" || !self method_812D() || self method_84E0())
		{
			wait 0.05;
			continue;
		}

		param_01 = lib_A7CE::playergetrippableammo();
		param_01 = clamp(param_01 - 1,0,getfullenergy());
		var_03 = param_01 / var_02;
		self setclientomnvar("ui_energy_ammo",var_03);
		if(param_01 <= 0)
		{
			var_04 = self getweaponslistprimaries();
			if(var_04.size > 0)
			{
				self switchtoweapon(var_04[0]);
			}
			else
			{
				self takeweapon(param_00);
			}

			lib_A7CE::playerclearrippableturretinfo();
			self notify("rippable_complete");
			return;
		}

		wait 0.05;
		lib_A7CE::playerrecordrippableammo(var_02);
	}
}

//Function Number: 16
getfullenergy()
{
	return 200;
}

//Function Number: 17
lib_A7CE::playergetrippableammo()
{
	return self.connectedpostgame["rippableSentry"].ammo;
}

//Function Number: 18
lib_A7CE::playerrecordrippableammo(param_00)
{
	self.connectedpostgame["rippableSentry"].ammo = param_00;
}

//Function Number: 19
lib_A7CE::playerhasrippableturretinfo()
{
	return isdefined(self.connectedpostgame["rippableSentry"]) && lib_A7CE::playergetrippableammo() > 0;
}

//Function Number: 20
lib_A7CE::playerclearrippableturretinfo()
{
	self.connectedpostgame["rippableSentry"] = undefined;
}