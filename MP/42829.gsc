/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42829.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 36
 * Decompile Time: 9 ms
 * Timestamp: 4/20/2022 8:18:22 PM
*******************************************************************/

//Function Number: 1
lib_A74D::init()
{
	level.riot_shield_names = [];
	level.riot_shield_names[level.riot_shield_names.size] = "riotshield_mp";
	level.riot_shield_names[level.riot_shield_names.size] = "iw5_riotshieldt6_mp";
	level.riot_shield_names[level.riot_shield_names.size] = "iw5_riotshieldt6loot0_mp";
	level.riot_shield_names[level.riot_shield_names.size] = "iw5_riotshieldt6loot1_mp";
	level.riot_shield_names[level.riot_shield_names.size] = "iw5_riotshieldt6loot2_mp";
	level.riot_shield_names[level.riot_shield_names.size] = "iw5_riotshieldt6loot3_mp";
	level.riot_shield_names[level.riot_shield_names.size] = "iw5_riotshieldjugg_mp";
	lib_A74D::precacheanims();
	level.riot_shield_collision = getent("riot_shield_collision","targetname");
	level._effect["riot_shield_shock_fx"] = loadfx("vfx/explosion/riotshield_stun");
	level._effect["riot_shield_deploy_smoke"] = loadfx("vfx/smoke/riotshield_deploy_smoke");
	level._effect["riot_shield_deploy_lights"] = loadfx("vfx/lights/riotshield_deploy_lights");
}

//Function Number: 2
lib_A74D::precacheanims()
{
	precachempanim("npc_deployable_riotshield_stand_deploy");
	precachempanim("npc_deployable_riotshield_stand_destroyed");
	precachempanim("npc_deployable_riotshield_stand_shot");
	precachempanim("npc_deployable_riotshield_stand_shot_back");
	precachempanim("npc_deployable_riotshield_stand_melee_front");
	precachempanim("npc_deployable_riotshield_stand_melee_back");
}

//Function Number: 3
lib_A74D::hasriotshield()
{
	return isdefined(self.frontshieldmodel) || isdefined(self.backshieldmodel);
}

//Function Number: 4
lib_A74D::hasriotshieldequipped()
{
	return isdefined(self.frontshieldmodel);
}

//Function Number: 5
lib_A74D::weaponisriotshield(param_00)
{
	if(!isdefined(level.riot_shield_names))
	{
		return 0;
	}

	var_01 = getweaponbasename(param_00);
	if(!isdefined(var_01))
	{
		var_01 = param_00;
	}

	foreach(var_03 in level.riot_shield_names)
	{
		if(var_03 == var_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 6
lib_A74D::weaponisshockplantriotshield(param_00)
{
	if(!lib_A74D::weaponisriotshield(param_00))
	{
		return 0;
	}

	return issubstr(param_00,"shockplant");
}

//Function Number: 7
lib_A74D::getotherriotshieldname(param_00)
{
	var_01 = 0;
	var_02 = self getweaponslistprimaries();
	foreach(var_04 in var_02)
	{
		if(lib_A74D::weaponisriotshield(var_04))
		{
			if(var_04 == param_00 && !var_01)
			{
				var_01 = 1;
				continue;
			}

			return var_04;
		}
	}

	return undefined;
}

//Function Number: 8
lib_A74D::updatefrontandbackshields(param_00)
{
	self.frontshieldmodel = undefined;
	self.backshieldmodel = undefined;
	if(!isdefined(param_00))
	{
		param_00 = self getcurrentprimaryweapon();
	}

	if(lib_A74D::weaponisriotshield(param_00))
	{
		self.frontshieldmodel = getweaponmodel(param_00);
	}

	var_01 = lib_A74D::getotherriotshieldname(param_00);
	if(isdefined(var_01))
	{
		self.backshieldmodel = getweaponmodel(var_01);
	}

	self method_84C6(param_00);
}

//Function Number: 9
lib_A74D::riotshield_clear()
{
	self.frontshieldmodel = undefined;
	self.backshieldmodel = undefined;
}

//Function Number: 10
lib_A74D::entisstucktoshield()
{
	if(!self islinked())
	{
		return 0;
	}

	var_00 = self method_8531();
	if(!isdefined(var_00))
	{
		return 0;
	}

	switch(var_00)
	{
		case "tag_shield_back":
		case "tag_weapon_left":
		case "tag_inhand":
			break;
	}
}

//Function Number: 11
lib_A74D::watchriotshielduse()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	thread lib_A74D::trackriotshield();
	for(;;)
	{
		self waittill("raise_riotshield");
		thread lib_A74D::startriotshielddeploy();
	}
}

//Function Number: 12
lib_A74D::riotshield_watch_for_change_weapon()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("riotshield_change_weapon");
	var_00 = undefined;
	self waittill("weapon_change",var_00);
	self notify("riotshield_change_weapon",var_00);
}

//Function Number: 13
lib_A74D::riotshield_watch_for_start_change_weapon()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("riotshield_change_weapon");
	var_00 = undefined;
	for(;;)
	{
		self waittill("weapon_switch_started",var_00);
		if(self method_801A())
		{
			thread lib_A74D::riotshield_watch_for_ladder_early_exit();
			break;
		}

		if(isdefined(self.frontshieldmodel) && isdefined(self.backshieldmodel))
		{
			wait(0.5);
			break;
		}
	}

	self notify("riotshield_change_weapon",var_00);
}

//Function Number: 14
lib_A74D::riotshield_watch_for_ladder_early_exit()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("weapon_change");
	while(self method_801A())
	{
		wait 0.05;
	}

	self notify("riotshield_change_weapon",self getcurrentprimaryweapon());
}

//Function Number: 15
lib_A74D::riotshield_watch_for_exo_shield_pullback()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("riotshield_change_weapon");
	var_00 = undefined;
	var_01 = maps\mp\_exo_shield::get_exo_shield_weapon();
	self waittillmatch(var_01,"grenade_pullback");
	while(!isdefined(self.exo_shield_on) || !self.exo_shield_on)
	{
		wait 0.05;
	}

	self notify("riotshield_change_weapon",var_01);
}

//Function Number: 16
lib_A74D::riotshield_watch_for_exo_shield_release()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("riotshield_change_weapon");
	if(!isdefined(self.exo_shield_on) || !self.exo_shield_on)
	{
		return;
	}

	var_00 = undefined;
	var_01 = maps\mp\_exo_shield::get_exo_shield_weapon();
	self waittillmatch(var_01,"battery_discharge_end");
	while(isdefined(self.exo_shield_on) && self.exo_shield_on)
	{
		wait 0.05;
	}

	self notify("riotshield_change_weapon",self getcurrentweapon());
}

//Function Number: 17
watchriotshieldloadout()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("track_riot_shield");
	self waittill("applyLoadout");
	lib_A74D::updatefrontandbackshields(self getcurrentweapon());
}

//Function Number: 18
lib_A74D::trackriotshield()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self notify("track_riot_shield");
	self endon("track_riot_shield");
	lib_A74D::updatefrontandbackshields(self.var_252E);
	thread watchriotshieldloadout();
	self.lastnonshieldweapon = "none";
	for(;;)
	{
		thread lib_A74D::watchriotshieldpickup();
		var_00 = self getcurrentweapon();
		if(isdefined(self.exo_shield_on) && self.exo_shield_on)
		{
			var_00 = maps\mp\_exo_shield::get_exo_shield_weapon();
		}

		thread lib_A74D::riotshield_watch_for_change_weapon();
		thread lib_A74D::riotshield_watch_for_start_change_weapon();
		thread lib_A74D::riotshield_watch_for_exo_shield_pullback();
		thread lib_A74D::riotshield_watch_for_exo_shield_release();
		self waittill("riotshield_change_weapon",var_01);
		if(lib_A74D::weaponisriotshield(var_01))
		{
			if(lib_A74D::hasriotshield())
			{
				if(isdefined(self.riotshieldtakeweapon))
				{
					self takeweapon(self.riotshieldtakeweapon);
					self.riotshieldtakeweapon = undefined;
				}
			}

			if(lib_A74D::isvalidnonshieldweapon(var_00))
			{
				self.lastnonshieldweapon = var_00;
			}
		}

		lib_A74D::updateriotshieldattachfornewweapon(var_01);
	}
}

//Function Number: 19
lib_A74D::updateriotshieldattachfornewweapon(param_00)
{
	if(self ismantling() && param_00 == "none")
	{
		return;
	}

	lib_A74D::updatefrontandbackshields(param_00);
}

//Function Number: 20
lib_A74D::watchriotshieldpickup()
{
	self endon("death");
	self endon("disconnect");
	self endon("track_riot_shield");
	self notify("watch_riotshield_pickup");
	self endon("watch_riotshield_pickup");
	self waittill("pickup_riotshield");
	self endon("weapon_change");
	wait(0.5);
	lib_A74D::updateriotshieldattachfornewweapon(self getcurrentweapon());
}

//Function Number: 21
lib_A74D::isvalidnonshieldweapon(param_00)
{
	if(maps\mp\_utility::iskillstreakweapon(param_00))
	{
		return 0;
	}

	if(param_00 == "none")
	{
		return 0;
	}

	if(maps\mp\gametypes\_class::isvalidequipment(param_00,1) || maps\mp\gametypes\_class::isvalidequipment(param_00,0))
	{
		return 0;
	}

	if(lib_A74D::weaponisriotshield(param_00))
	{
		return 0;
	}

	if(weaponclass(param_00) == "ball")
	{
		return 0;
	}

	return 1;
}

//Function Number: 22
lib_A74D::startriotshielddeploy()
{
	thread lib_A74D::watchriotshielddeploy();
}

//Function Number: 23
lib_A74D::handleriotshieldshockplant()
{
	var_00 = self.riotshieldentity;
	var_01 = 10;
	var_02 = 50;
	var_03 = 150;
	var_04 = var_03 * var_03;
	var_05 = self.riotshieldentity.var_2E6 + (0,0,-25);
	self entityradiusdamage(var_05,var_03,var_02,var_01,self,"MOD_EXPLOSIVE");
	playfx(level._effect["riot_shield_shock_fx"],var_05,anglestoforward(self.riotshieldentity.var_41 + (-90,0,0)));
	foreach(var_07 in level.var_328)
	{
		if(maps\mp\_utility::isreallyalive(var_07) && !function_0285(var_07,self))
		{
			if(distancesquared(var_05,var_07.var_2E6) < var_04)
			{
				var_07 shellshock("concussion_grenade_mp",1);
			}
		}
	}
}

//Function Number: 24
lib_A74D::watchriotshielddeploy()
{
	self endon("death");
	self endon("disconnect");
	self notify("start_riotshield_deploy");
	self endon("start_riotshield_deploy");
	self waittill("startdeploy_riotshield");
	self playsoundasmaster("wpn_riot_shield_plant_mech");
	self waittill("deploy_riotshield",var_00);
	if(isdefined(self.riotshieldentity))
	{
		self.riotshieldentity thread lib_A74D::damagethendestroyriotshield();
		wait 0.05;
	}

	var_01 = self getcurrentweapon();
	self method_845D(var_01,0);
	var_02 = lib_A74D::weaponisshockplantriotshield(var_01);
	self playsoundasmaster("wpn_riot_shield_plant_punch");
	if(var_02)
	{
		self playsoundasmaster("wpn_riot_shield_blast_punch");
	}

	var_03 = 0;
	if(var_00)
	{
		var_04 = self method_84C1();
		if(var_04["result"] && lib_A74D::riotshielddistancetest(var_04["origin"]))
		{
			var_05 = 28;
			var_06 = lib_A74D::spawnriotshieldcover(var_04["origin"] + (0,0,var_05),var_04["angles"]);
			var_07 = lib_A74D::spawnriotshieldcollision(var_04["origin"] + (0,0,var_05),var_04["angles"],var_06);
			var_08 = function_029D(self,var_06);
			var_09 = self getweaponslistprimaries();
			self.riotshieldretrievetrigger = var_08;
			self.riotshieldentity = var_06;
			self.riotshieldcollisionentity = var_07;
			if(var_02)
			{
				thread lib_A74D::handleriotshieldshockplant();
			}
			else
			{
				playfxontag(common_scripts\utility::getfx("riot_shield_deploy_smoke"),var_06,"tag_weapon");
			}

			var_06 scriptmodelplayanimdeltamotion("npc_deployable_riotshield_stand_deploy");
			thread lib_A74D::spawnshieldlights(var_06);
			var_0A = 0;
			if(self.lastnonshieldweapon != "none" && self hasweapon(self.lastnonshieldweapon))
			{
				self switchtoweaponimmediate(self.lastnonshieldweapon);
			}
			else if(var_09.size > 0)
			{
				self switchtoweaponimmediate(var_09[0]);
			}
			else
			{
				var_0A = 1;
			}

			if(!self hasweapon("iw5_combatknife_mp"))
			{
				self giveweapon("iw5_combatknife_mp");
				self.riotshieldtakeweapon = "iw5_combatknife_mp";
			}

			if(var_0A)
			{
				self switchtoweaponimmediate("iw5_combatknife_mp");
			}

			var_0B = spawnstruct();
			var_0B.deathoverridecallback = ::lib_A74D::damagethendestroyriotshield;
			var_06 thread maps\mp\_movers::handle_moving_platforms(var_0B);
			thread lib_A74D::watchdeployedriotshieldents();
			thread lib_A74D::deleteshieldontriggerdeath(self.riotshieldretrievetrigger);
			thread lib_A74D::deleteshieldontriggerpickup(self.riotshieldretrievetrigger,self.riotshieldentity);
			thread lib_A74D::deleteshieldonplayerdeathordisconnect(var_06);
			if(isdefined(var_04["entity"]))
			{
				thread deleteshieldongrounddelete(var_04["entity"]);
			}

			self.riotshieldentity thread lib_A74D::watchdeployedriotshielddamage();
			level notify("riotshield_planted",self);
		}
		else
		{
			var_03 = 1;
			var_0C = weaponclipsize(var_01);
			self setweaponammoclip(var_01,var_0C);
		}
	}
	else
	{
		var_03 = 1;
	}

	if(var_03)
	{
		self method_84C2();
	}
}

//Function Number: 25
lib_A74D::spawnshieldlights(param_00)
{
	level endon("game_ended");
	param_00 endon("death");
	wait(0.6);
	playfxontag(common_scripts\utility::getfx("riot_shield_deploy_lights"),param_00,"tag_weapon");
}

//Function Number: 26
lib_A74D::riotshielddistancetest(param_00)
{
	var_01 = getdvarfloat("riotshield_deploy_limit_radius");
	var_01 = var_01 * var_01;
	foreach(var_03 in level.var_328)
	{
		if(isdefined(var_03.riotshieldentity))
		{
			var_04 = distancesquared(var_03.riotshieldentity.var_2E6,param_00);
			if(var_01 > var_04)
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 27
lib_A74D::spawnriotshieldcover(param_00,param_01)
{
	var_02 = spawn("script_model",param_00);
	var_02.targetname = "riotshield_mp";
	var_02.var_41 = param_01;
	var_03 = undefined;
	var_04 = self getcurrentprimaryweapon();
	if(lib_A74D::weaponisriotshield(var_04))
	{
		var_03 = getweaponmodel(var_04);
	}

	if(!isdefined(var_03))
	{
		var_03 = "npc_deployable_riot_shield_base";
	}

	var_02 setmodel(var_03);
	var_02.owner = self;
	var_02.inliveplayerkillstreak = self.inliveplayerkillstreak;
	return var_02;
}

//Function Number: 28
lib_A74D::spawnriotshieldcollision(param_00,param_01,param_02)
{
	var_03 = spawn("script_model",param_00,1);
	var_03.targetname = "riotshield_coll_mp";
	var_03.var_41 = param_01;
	var_03 setmodel("tag_origin");
	var_03.owner = self;
	var_03.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_03 clonebrushmodeltoscriptmodel(level.riot_shield_collision);
	var_03 disconnectpaths();
	var_03 method_8553(0);
	return var_03;
}

//Function Number: 29
lib_A74D::watchdeployedriotshieldents()
{
	self waittill("destroy_riotshield");
	if(isdefined(self.riotshieldretrievetrigger))
	{
		self.riotshieldretrievetrigger delete();
	}

	if(isdefined(self.riotshieldcollisionentity))
	{
		self.riotshieldcollisionentity connectpaths();
		self.riotshieldcollisionentity delete();
	}

	if(isdefined(self.riotshieldentity))
	{
		self.riotshieldentity delete();
	}
}

//Function Number: 30
lib_A74D::deleteshieldontriggerpickup(param_00,param_01)
{
	level endon("game_ended");
	param_00 endon("death");
	param_00 waittill("trigger",var_02);
	function_02CD(var_02,param_01);
	self notify("destroy_riotshield");
}

//Function Number: 31
lib_A74D::deleteshieldontriggerdeath(param_00)
{
	level endon("game_ended");
	param_00 waittill("death");
	self notify("destroy_riotshield");
}

//Function Number: 32
lib_A74D::deleteshieldonplayerdeathordisconnect(param_00)
{
	param_00 endon("death");
	param_00 endon("damageThenDestroyRiotshield");
	common_scripts\utility::waittill_any("death","disconnect","remove_planted_weapons");
	param_00 thread lib_A74D::damagethendestroyriotshield();
}

//Function Number: 33
deleteshieldongrounddelete(param_00)
{
	level endon("game_ended");
	param_00 common_scripts\utility::waittill_any("death","hidingLightingState");
	self notify("destroy_riotshield");
}

//Function Number: 34
lib_A74D::watchdeployedriotshielddamage()
{
	self endon("death");
	var_00 = getdvarint("riotshield_deployed_health");
	self.damagetaken = 0;
	var_01 = 0;
	for(;;)
	{
		self.var_275 = 100000;
		self.health = self.var_275;
		self waittill("damage",var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A,var_0B);
		if(!isdefined(var_03))
		{
			continue;
		}

		if(isplayer(var_03))
		{
			if(level.teambased && var_03.inliveplayerkillstreak == self.owner.inliveplayerkillstreak && var_03 != self.owner)
			{
				continue;
			}
		}

		var_0C = 0;
		var_0D = 0;
		if(maps\mp\_utility::ismeleemod(var_06))
		{
			var_0C = 1;
			var_02 = var_02 * getdvarfloat("riotshield_melee_damage_scale");
		}
		else if(var_06 == "MOD_PISTOL_BULLET" || var_06 == "MOD_RIFLE_BULLET")
		{
			var_0D = 1;
			var_02 = var_02 * getdvarfloat("riotshield_bullet_damage_scale");
		}
		else if(var_06 == "MOD_GRENADE" || var_06 == "MOD_GRENADE_SPLASH" || var_06 == "MOD_EXPLOSIVE" || var_06 == "MOD_EXPLOSIVE_SPLASH" || var_06 == "MOD_PROJECTILE" || var_06 == "MOD_PROJECTILE_SPLASH")
		{
			var_02 = var_02 * getdvarfloat("riotshield_explosive_damage_scale");
		}
		else if(var_06 == "MOD_IMPACT")
		{
			var_02 = var_02 * getdvarfloat("riotshield_projectile_damage_scale");
		}
		else if(var_06 == "MOD_CRUSH")
		{
			var_02 = var_00;
		}

		self.damagetaken = self.damagetaken + var_02;
		if(self.damagetaken >= var_00)
		{
			thread lib_A74D::damagethendestroyriotshield(var_03,var_0B);
			break;
		}
		else if((var_0C || var_0D) && gettime() >= var_01)
		{
			var_01 = gettime() + 500;
			var_0E = 0;
			var_0F = anglestoforward(self.var_41);
			if(vectordot(var_04,var_0F) > 0)
			{
				var_0E = 1;
			}

			if(var_0C)
			{
				if(var_0E)
				{
					self scriptmodelplayanimdeltamotion("npc_deployable_riotshield_stand_melee_back");
				}
				else
				{
					self scriptmodelplayanimdeltamotion("npc_deployable_riotshield_stand_melee_front");
				}
			}
			else if(var_0E)
			{
				self scriptmodelplayanimdeltamotion("npc_deployable_riotshield_stand_shot_back");
			}
			else
			{
				self scriptmodelplayanimdeltamotion("npc_deployable_riotshield_stand_shot");
			}
		}
	}
}

//Function Number: 35
lib_A74D::damagethendestroyriotshield(param_00,param_01)
{
	self notify("damageThenDestroyRiotshield");
	self endon("death");
	if(isdefined(self.owner.riotshieldretrievetrigger))
	{
		self.owner.riotshieldretrievetrigger delete();
	}

	if(isdefined(self.owner.riotshieldcollisionentity))
	{
		self.owner.riotshieldcollisionentity connectpaths();
		self.owner.riotshieldcollisionentity delete();
	}

	self.owner.riotshieldentity = undefined;
	self notsolid();
	self scriptmodelplayanimdeltamotion("npc_deployable_riotshield_stand_destroyed");
	wait(getdvarfloat("riotshield_destroyed_cleanup_time"));
	self delete();
}

//Function Number: 36
lib_A74D::watchriotshieldstuckentitydeath(param_00,param_01)
{
	param_00 endon("death");
	common_scripts\utility::waittill_any("damageThenDestroyRiotshield","death","disconnect","weapon_change","deploy_riotshield");
	param_00 detonate(param_01);
}