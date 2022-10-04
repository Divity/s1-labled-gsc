/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42936.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 63
 * Decompile Time: 22 ms
 * Timestamp: 4/20/2022 8:18:31 PM
*******************************************************************/

//Function Number: 1
lib_A7B8::init()
{
	level._effect["airstrike_ground"] = loadfx("vfx/explosion/clusterbomb_explode");
	level._effect["airstrike_bombs"] = loadfx("vfx/explosion/vfx_clusterbomb");
	level._effect["airstrike_death"] = loadfx("vfx/explosion/vehicle_warbird_explosion_midair");
	level._effect["airstrike_engine"] = loadfx("vfx/fire/jet_afterburner");
	level._effect["airstrike_wingtip"] = loadfx("vfx/trail/jet_contrail");
	level.harriers = [];
	level.planes = [];
	level.artillerydangercenters = [];
	level.dangermaxradius["strafing_run_airstrike"] = 900;
	level.dangerminradius["strafing_run_airstrike"] = 750;
	level.dangerforwardpush["strafing_run_airstrike"] = 1;
	level.dangerovalscale["strafing_run_airstrike"] = 6;
	level.killstreakfuncs["strafing_run_airstrike"] = ::lib_A7B8::tryusestrafingrunairstrike;
	level.killstreakwieldweapons["stealth_bomb_mp"] = "strafing_run_airstrike";
	level.killstreakwieldweapons["airstrike_missile_mp"] = "strafing_run_airstrike";
	level.killstreakwieldweapons["orbital_carepackage_pod_plane_mp"] = "strafing_run_airstrike";
}

//Function Number: 2
lib_A7B8::tryusestrafingrunairstrike(param_00,param_01)
{
	return lib_A7B8::tryuseairstrike(param_00,"strafing_run_airstrike",param_01);
}

//Function Number: 3
lib_A7B8::tryuseairstrike(param_00,param_01,param_02)
{
	if(isdefined(level.strafing_run_airstrike))
	{
		self iprintlnbold(&"KILLSTREAKS_AIR_SPACE_TOO_CROWDED");
		return 0;
	}

	var_03 = lib_A7B8::selectairstrikelocation(param_00,param_01,param_02);
	if(!isdefined(var_03) || !var_03)
	{
		return 0;
	}

	return 1;
}

//Function Number: 4
lib_A7B8::doairstrike(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(level.airstrikeinprogress))
	{
		while(isdefined(level.airstrikeinprogress))
		{
			level waittill("begin_airstrike");
		}

		level.airstrikeinprogress = 1;
		wait(2);
	}

	if(!isdefined(param_03))
	{
		return;
	}

	level.airstrikeinprogress = 1;
	var_07 = lib_A7B8::dropsitetrace(param_01,param_03);
	var_08 = spawnstruct();
	var_08.var_2E6 = var_07;
	var_08.forward = anglestoforward((0,param_02,0));
	var_08.streakname = param_05;
	var_08.inliveplayerkillstreak = param_04;
	level.artillerydangercenters[level.artillerydangercenters.size] = var_08;
	var_09 = lib_A7B8::callstrike(param_00,param_03,var_07,param_02,param_05,param_06);
	wait(1);
	level.airstrikeinprogress = undefined;
	param_03 notify("begin_airstrike");
	level notify("begin_airstrike");
	wait(7.5);
	var_0A = 0;
	var_0B = [];
	for(var_0C = 0;var_0C < level.artillerydangercenters.size;var_0C++)
	{
		if(!var_0A && level.artillerydangercenters[var_0C].var_2E6 == var_07)
		{
			var_0A = 1;
			continue;
		}

		var_0B[var_0B.size] = level.artillerydangercenters[var_0C];
	}

	level.artillerydangercenters = var_0B;
}

//Function Number: 5
lib_A7B8::clearprogress(param_00)
{
	wait(2);
	level.airstrikeinprogress = undefined;
}

//Function Number: 6
lib_A7B8::getairstrikedanger(param_00)
{
	var_01 = 0;
	for(var_02 = 0;var_02 < level.artillerydangercenters.size;var_02++)
	{
		var_03 = level.artillerydangercenters[var_02].var_2E6;
		var_04 = level.artillerydangercenters[var_02].forward;
		var_05 = level.artillerydangercenters[var_02].streakname;
		var_01 = var_01 + lib_A7B8::getsingleairstrikedanger(param_00,var_03,var_04,var_05);
	}

	return var_01;
}

//Function Number: 7
lib_A7B8::getsingleairstrikedanger(param_00,param_01,param_02,param_03)
{
	var_04 = param_01 + level.dangerforwardpush[param_03] * level.dangermaxradius[param_03] * param_02;
	var_05 = param_00 - var_04;
	var_05 = (var_05[0],var_05[1],0);
	var_06 = vectordot(var_05,param_02) * param_02;
	var_07 = var_05 - var_06;
	var_08 = var_07 + var_06 / level.dangerovalscale[param_03];
	var_09 = lengthsquared(var_08);
	if(var_09 > level.dangermaxradius[param_03] * level.dangermaxradius[param_03])
	{
		return 0;
	}

	if(var_09 < level.dangerminradius[param_03] * level.dangerminradius[param_03])
	{
		return 1;
	}

	var_0A = sqrt(var_09);
	var_0B = var_0A - level.dangerminradius[param_03] / level.dangermaxradius[param_03] - level.dangerminradius[param_03];
	return 1 - var_0B;
}

//Function Number: 8
lib_A7B8::pointisinairstrikearea(param_00,param_01,param_02,param_03)
{
	return distance2d(param_00,param_01) <= level.dangermaxradius[param_03] * 1.25;
}

//Function Number: 9
lib_A7B8::radiusartilleryshellshock(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = level.var_328;
	foreach(var_07 in level.var_328)
	{
		if(!isalive(var_07))
		{
			continue;
		}

		if(var_07.inliveplayerkillstreak == param_04 || var_07.inliveplayerkillstreak == "spectator")
		{
			continue;
		}

		var_08 = var_07.var_2E6 + (0,0,32);
		var_09 = distance(param_00,var_08);
		if(var_09 > param_01)
		{
			continue;
		}

		var_0A = int(param_02 + param_03 - param_02 * var_09 / param_01);
		var_07 thread lib_A7B8::artilleryshellshock("default",var_0A);
	}
}

//Function Number: 10
lib_A7B8::artilleryshellshock(param_00,param_01)
{
	self endon("disconnect");
	if(isdefined(self.beingartilleryshellshocked) && self.beingartilleryshellshocked)
	{
		return;
	}

	self.beingartilleryshellshocked = 1;
	self shellshock(param_00,param_01);
	wait(param_01 + 1);
	self.beingartilleryshellshocked = 0;
}

//Function Number: 11
lib_A7B8::bomberdropcarepackges(param_00,param_01)
{
	param_00 endon("death");
	param_00 endon("crashing");
	var_02 = spawnstruct();
	var_02.usednodes = [];
	var_02.cratetypes = [];
	lib_A7B8::waitillairstrikeoverbombingarea(param_00);
	wait(0.1);
	var_03 = gettime();
	var_02.cratetypes[0] = lib_A7B8::shootdowncarepackage(param_00,param_01,var_02);
	var_04 = gettime();
	var_05 = 0.1 - var_04 - var_03 / 1000;
	if(var_05 > 0)
	{
		wait(var_05);
	}

	var_03 = gettime();
	var_02.cratetypes[1] = lib_A7B8::shootdowncarepackage(param_00,param_01,var_02);
	var_04 = gettime();
	var_05 = 0.1 - var_04 - var_03 / 1000;
	if(var_05 > 0)
	{
		wait(var_05);
	}

	var_02.cratetypes[2] = lib_A7B8::shootdowncarepackage(param_00,param_01,var_02);
}

//Function Number: 12
lib_A7B8::shootdowncarepackage(param_00,param_01,param_02)
{
	var_03 = lib_A7B8::dropsitetrace(param_00.var_2E6,param_00);
	var_04 = lib_A7B8::findclosenode(var_03,param_00,param_02,param_00.dropsite,param_01);
	if(!isdefined(var_04))
	{
		var_04 = spawnstruct();
		var_04.var_2E6 = var_03;
	}

	var_05 = param_00.var_2E6 + (0,0,-5);
	return maps\mp\killstreaks\_orbital_carepackage::firepod("orbital_carepackage_pod_plane_mp",param_01,var_04,"airdrop_assault",[],undefined,var_05,param_02.cratetypes,0);
}

//Function Number: 13
lib_A7B8::dropsitetrace(param_00,param_01)
{
	var_02 = param_00;
	var_03 = var_02 + (0,0,-1000000);
	var_04 = bullettrace(var_02,var_03,0,param_01);
	for(var_05 = var_04["entity"];isdefined(var_05) && isdefined(var_05.vehicletype);var_05 = var_04["entity"])
	{
		wait 0.05;
		var_02 = var_04["position"];
		var_04 = bullettrace(var_02,var_03,0,var_05);
	}

	return var_04["position"];
}

//Function Number: 14
withinothercarepackagenodes(param_00,param_01)
{
	var_02 = 26;
	var_03 = var_02 * 2;
	var_04 = var_03 * var_03;
	foreach(var_06 in param_01.usednodes)
	{
		var_07 = distance2dsquared(var_06.var_2E6,param_00);
		if(var_07 < var_04)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 15
lib_A7B8::findclosenode(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 4;
	var_06 = 5;
	var_07 = param_01.var_2E6;
	var_08 = getnodesinradiussorted(param_03,300,0,1000);
	var_09 = undefined;
	foreach(var_0B in var_08)
	{
		if(var_05 <= 0)
		{
			break;
		}

		if(!nodeexposedtosky(var_0B,1))
		{
			continue;
		}

		if(common_scripts\utility::array_contains(param_02.usednodes,var_0B))
		{
			continue;
		}

		if(withinothercarepackagenodes(var_0B.var_2E6,param_02))
		{
			continue;
		}

		var_0C = var_0B.var_2E6 + (0,0,5);
		var_0D = param_04;
		if(!isdefined(var_0D))
		{
			var_0D = param_01;
		}

		param_02.usednodes[param_02.usednodes.size] = var_0B;
		if(bullettracepassed(var_07,var_0C,0,param_01) && maps\mp\killstreaks\_orbital_util::carepackagetrace(var_0B.var_2E6,var_0D,"carepackage"))
		{
			var_09 = var_0B;
			break;
		}

		var_06--;
		if(var_06 <= 0)
		{
			var_05--;
			var_06 = 5;
			wait 0.05;
		}
	}

	return var_09;
}

//Function Number: 16
lib_A7B8::dobomberstrike(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_01))
	{
		return;
	}

	if(!common_scripts\utility::array_contains(param_06,"strafing_run_airstrike_two"))
	{
		thread lib_A7B8::spawnairstrikeplane(param_00,param_01,param_02,param_03,param_04,param_05,param_06,1);
		return;
	}

	var_07 = spawnstruct();
	lib_A7B8::getadditionalbomberplanestarts(param_03,param_04,var_07);
	thread lib_A7B8::spawnairstrikeplane(param_00,param_01,param_02,var_07.startpoint1,param_04,param_05,param_06,1);
	wait(1);
	thread lib_A7B8::spawnairstrikeplane(param_00,param_01,param_02,var_07.startpoint2,param_04,param_05,param_06,0);
}

//Function Number: 17
lib_A7B8::getadditionalbomberplanestarts(param_00,param_01,param_02)
{
	var_03 = anglestoright(param_01);
	param_02.startpoint1 = param_00 + var_03 * 500;
	param_02.startpoint2 = param_00 + var_03 * -1 * 500;
}

//Function Number: 18
lib_A7B8::spawnairstrikeplane(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = "compass_objpoint_airstrike_busy";
	if(common_scripts\utility::array_contains(param_06,"strafing_run_airstrike_stealth"))
	{
		var_08 = "compass_objpoint_b2_airstrike_enemy";
	}

	var_09 = spawn("script_model",param_03);
	var_09.var_41 = param_04;
	var_09 setmodel("vehicle_airplane_shrike");
	var_09.minimapicon = spawnplane(param_01,"script_model",param_03,"compass_objpoint_airstrike_friendly",var_08);
	var_09.minimapicon setmodel("tag_origin");
	var_09.minimapicon method_8446(var_09,"tag_origin",(0,0,0),(0,0,0));
	var_09.var_5D57 = param_06;
	var_09.vehicletype = "strafing_run";
	lib_A7B8::addplanetolist(var_09);
	var_09 setcandamage(1);
	var_09 setcanradiusdamage(1);
	var_09 thread maps\mp\gametypes\_damage::setentitydamagecallback(1000,undefined,::lib_A7B8::onairstrikedeath,::maps\mp\killstreaks\_aerial_utility::heli_modifydamage,1);
	if(common_scripts\utility::array_contains(var_09.var_5D57,"strafing_run_airstrike_flares"))
	{
		var_09 thread lib_A7B8::airstrike_flares_monitor();
	}

	var_09 thread lib_A7B8::handledeath();
	var_09 playloopsound("bombrun_jet_dist_loop");
	var_09.lifeid = param_00;
	var_09.owner = param_01;
	var_09.inliveplayerkillstreak = param_01.inliveplayerkillstreak;
	var_09.dropsite = param_02;
	var_09.enteringbombingarea = 1;
	var_09 thread lib_A7B8::planeanimatepath(param_02);
	var_09 thread lib_A7B8::planeplayeffects();
	thread lib_A7B8::stealthbomber_killcam(var_09,param_05);
	if(common_scripts\utility::array_contains(var_09.var_5D57,"strafing_run_airstrike_package"))
	{
		thread lib_A7B8::bomberdropcarepackges(var_09,param_01);
	}
	else
	{
		thread lib_A7B8::bomberdropbombs(var_09,param_01);
	}

	if(level.teambased && param_07)
	{
		level thread lib_A7B8::handlecoopjoining(var_09,param_01);
	}

	var_09 endon("death");
	var_09 endon("crashing");
	lib_A7B8::waitillairstrikeoverbombingarea(var_09);
	var_09.enteringbombingarea = 0;
	var_09 waittill("pathComplete");
	level.strafing_run_airstrike = undefined;
	var_09 notify("airstrike_complete");
	lib_A7B8::removeplanefromlist(var_09);
	var_09 waittillmatch("end","airstrike");
	var_09 notify("delete");
	if(isdefined(var_09.minimapicon))
	{
		var_09.minimapicon delete();
	}

	var_09 delete();
}

//Function Number: 19
planehandlehostmigration()
{
	self endon("airstrike_complete");
	self endon("pathComplete");
	for(;;)
	{
		level waittill("host_migration_begin");
		self method_84BD(1);
		level waittill("host_migration_end");
		self method_84BD(0);
	}
}

//Function Number: 20
lib_A7B8::planeanimatepath(param_00)
{
	self endon("airstrike_complete");
	self scriptmodelplayanimdeltamotion("strafing_run_ks_flyby","airstrike");
	thread planehandlehostmigration();
	self.status = "flying_in";
	self.flyingspeed = 3333.333;
	wait(3);
	self.status = "strike";
	self.flyingspeed = 1000;
	wait(10);
	self.status = "flying_out";
	self.flyingspeed = 3333.333;
	wait(2.9);
	self notify("pathComplete");
}

//Function Number: 21
lib_A7B8::airstrike_flares_monitor()
{
	self.numflares = 4;
	thread maps\mp\killstreaks\_aerial_utility::handleincomingstinger();
}

//Function Number: 22
lib_A7B8::onairstrikedeath(param_00,param_01,param_02,param_03)
{
	thread lib_A7B8::crashplane();
	maps\mp\gametypes\_damage::onkillstreakkilled(param_00,param_01,param_02,param_03,"strafing_run_destroyed",undefined,"callout_destroyed_airstrike",1);
}

//Function Number: 23
lib_A7B8::crashplane()
{
	self notify("crashing");
	self.crashed = 1;
}

//Function Number: 24
lib_A7B8::bomberdropbombs(param_00,param_01)
{
	param_00 endon("airstrike_complete");
	while(!lib_A7B8::targetisclose(param_00,param_00.dropsite,5000))
	{
		wait(0.05);
	}

	var_02 = 1;
	var_03 = 0;
	param_00 notify("start_bombing");
	param_00 thread lib_A7B8::playbombfx();
	var_04 = lib_A7B8::targetgetdist(param_00,param_00.dropsite);
	while(var_04 < 5000)
	{
		if(var_04 < 1500 && !var_03)
		{
			var_03 = 1;
		}

		var_02 = !var_02;
		if(var_04 < 4500)
		{
			param_00 thread lib_A7B8::callstrike_bomb(param_00.var_2E6,param_01,(0,0,0),var_02);
		}

		wait(0.1);
		var_04 = lib_A7B8::targetgetdist(param_00,param_00.dropsite);
	}

	param_00 notify("stop_bombing");
	level.strafing_run_airstrike = undefined;
}

//Function Number: 25
lib_A7B8::playbombfx()
{
	self endon("stop_bombing");
	self endon("airstrike_complete");
	self.bomb_tag_left = spawn("script_model",(0,0,0));
	self.bomb_tag_left setmodel("tag_origin");
	self.bomb_tag_left linkto(self,"bombaydoor_left_jnt",(0,0,0),(0,-90,0));
	self.bomb_tag_right = spawn("script_model",(0,0,0));
	self.bomb_tag_right setmodel("tag_origin");
	self.bomb_tag_right linkto(self,"bombaydoor_right_jnt",(0,0,0),(0,-90,0));
	for(;;)
	{
		playfxontag(common_scripts\utility::getfx("airstrike_bombs"),self.bomb_tag_left,"tag_origin");
		playfxontag(common_scripts\utility::getfx("airstrike_bombs"),self.bomb_tag_right,"tag_origin");
		wait(0.5);
	}
}

//Function Number: 26
lib_A7B8::stealthbomber_killcam(param_00,param_01)
{
	param_00 endon("airstrike_complete");
	param_00 waittill("start_bombing");
	var_02 = anglestoforward(param_00.var_41);
	var_03 = spawn("script_model",param_00.var_2E6 + (0,0,100) - var_02 * 200);
	param_00.killcament = var_03;
	param_00.killcament setscriptmoverkillcam("airstrike");
	param_00.airstriketype = param_01;
	var_03.starttime = gettime();
	var_03 thread lib_A7B8::deleteaftertime(16);
	var_03 linkto(param_00,"tag_origin",(-256,768,768),(0,0,0));
}

//Function Number: 27
lib_A7B8::callstrike_bomb(param_00,param_01,param_02,param_03)
{
	self endon("airstrike_complete");
	if(!isdefined(param_01) || param_01 maps\mp\_utility::isemped() || param_01 maps\mp\_utility::isairdenied())
	{
		self notify("stop_bombing");
		return;
	}

	var_04 = 512;
	var_05 = (0,randomint(360),0);
	var_06 = param_00 + anglestoforward(var_05) * randomfloat(var_04);
	var_07 = bullettrace(var_06,var_06 + (0,0,-10000),0,self);
	var_06 = var_07["position"];
	var_08 = distance(param_00,var_06);
	if(var_08 > 10000)
	{
		return;
	}

	wait(0.85 * var_08 / 2000);
	if(!isdefined(param_01) || param_01 maps\mp\_utility::isemped() || param_01 maps\mp\_utility::isairdenied())
	{
		self notify("stop_bombing");
		return;
	}

	if(param_03)
	{
		playfx(common_scripts\utility::getfx("airstrike_ground"),var_06);
		level thread maps\mp\gametypes\_shellshock::stealthairstrike_earthquake(var_06);
	}

	thread maps\mp\_utility::playsoundinspace("bombrun_snap",var_06);
	lib_A7B8::radiusartilleryshellshock(var_06,512,8,4,param_01.inliveplayerkillstreak);
	self entityradiusdamage(var_06 + (0,0,16),896,300,50,param_01,"MOD_EXPLOSIVE","stealth_bomb_mp");
	if(isdefined(level.var_511A) && level.var_511A && isdefined(level.flying_attack_drones))
	{
		foreach(var_0A in level.flying_attack_drones)
		{
			if(var_0A.var_2E6[2] > var_06[2] - 24 && var_0A.var_2E6[2] < var_06[2] + 1000 && distance2dsquared(var_0A.var_2E6,var_06) < 90000)
			{
				var_0A dodamage(randomintrange(50,300),var_06 + (0,0,16),param_01,param_01,"MOD_EXPLOSIVE","stealth_bomb_mp");
			}
		}
	}
}

//Function Number: 28
lib_A7B8::handledeath(param_00)
{
	level endon("game_ended");
	self endon("delete");
	common_scripts\utility::waittill_either("death","crashing");
	var_01 = anglestoforward(self.var_41);
	playfx(common_scripts\utility::getfx("airstrike_death"),self.var_2E6,var_01);
	maps\mp\_utility::playsoundinspace("bombrun_air_death",self.var_2E6);
	self notify("airstrike_complete");
	lib_A7B8::removeplanefromlist(self);
	level.strafing_run_airstrike = undefined;
	if(isdefined(self.minimapicon))
	{
		self.minimapicon delete();
	}

	self delete();
}

//Function Number: 29
lib_A7B8::addplanetolist(param_00)
{
	level.planes[level.planes.size] = param_00;
}

//Function Number: 30
lib_A7B8::removeplanefromlist(param_00)
{
	level.planes = common_scripts\utility::array_remove(level.planes,param_00);
}

//Function Number: 31
lib_A7B8::deleteaftertime(param_00)
{
	self endon("death");
	wait(param_00);
	self delete();
}

//Function Number: 32
lib_A7B8::planeplayeffects()
{
	self endon("airstrike_complete");
	wait 0.05;
	playfxontag(common_scripts\utility::getfx("airstrike_engine"),self,"tag_engine_right");
	playfxontag(common_scripts\utility::getfx("airstrike_engine"),self,"tag_engine_left");
	playfxontag(common_scripts\utility::getfx("airstrike_wingtip"),self,"tag_right_wingtip");
	playfxontag(common_scripts\utility::getfx("airstrike_wingtip"),self,"tag_left_wingtip");
}

//Function Number: 33
lib_A7B8::callstrike(param_00,param_01,param_02,param_03,param_04,param_05)
{
	thread maps\mp\_utility::teamplayercardsplash("used_strafing_run_airstrike",param_01,param_01.inliveplayerkillstreak);
	var_06 = lib_A7B8::getplaneflyheight();
	param_01 endon("disconnect");
	var_07 = (0,param_03,0);
	var_08 = lib_A7B8::getflightpath(param_02,var_07,var_06);
	level thread lib_A7B8::dobomberstrike(param_00,param_01,param_02,var_08,var_07,param_04,param_05);
}

//Function Number: 34
lib_A7B8::getplaneflyheight()
{
	var_00 = 0;
	if(isdefined(level.airstrikeoverrides) && isdefined(level.airstrikeoverrides.spawnheight))
	{
		var_00 = level.airstrikeoverrides.spawnheight;
	}

	var_01 = maps\mp\killstreaks\_aerial_utility::gethelianchor();
	return var_01.var_2E6[2] + 750 + var_00;
}

//Function Number: 35
lib_A7B8::getflightpath(param_00,param_01,param_02)
{
	var_03 = lib_A7B8::getflightdistance() / 2;
	var_04 = param_00 + anglestoforward(param_01) * -1 * var_03;
	var_04 = var_04 * (1,1,0);
	var_04 = var_04 + (0,0,param_02);
	return var_04;
}

//Function Number: 36
lib_A7B8::getflightdistance()
{
	return 30000;
}

//Function Number: 37
lib_A7B8::targetgetdist(param_00,param_01)
{
	var_02 = lib_A7B8::targetisinfront(param_00,param_01);
	if(var_02)
	{
		var_03 = 1;
	}
	else
	{
		var_03 = -1;
	}

	var_04 = common_scripts\utility::flat_origin(param_00.var_2E6);
	var_05 = var_04 + anglestoforward(common_scripts\utility::flat_angle(param_00.var_41)) * var_03 * 100000;
	var_06 = pointonsegmentnearesttopoint(var_04,var_05,param_01);
	var_07 = distance(var_04,var_06);
	return var_07;
}

//Function Number: 38
lib_A7B8::targetisclose(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 3000;
	}

	var_03 = lib_A7B8::targetisinfront(param_00,param_01);
	if(var_03)
	{
		var_04 = 1;
	}
	else
	{
		var_04 = -1;
	}

	var_05 = common_scripts\utility::flat_origin(param_00.var_2E6);
	var_06 = var_05 + anglestoforward(common_scripts\utility::flat_angle(param_00.var_41)) * var_04 * 100000;
	var_07 = pointonsegmentnearesttopoint(var_05,var_06,param_01);
	var_08 = distance(var_05,var_07);
	if(var_08 < param_02)
	{
		return 1;
	}

	return 0;
}

//Function Number: 39
lib_A7B8::targetisinfront(param_00,param_01)
{
	var_02 = anglestoforward(common_scripts\utility::flat_angle(param_00.var_41));
	var_03 = vectornormalize(common_scripts\utility::flat_origin(param_01) - param_00.var_2E6);
	var_04 = vectordot(var_02,var_03);
	if(var_04 > 0)
	{
		return 1;
	}

	return 0;
}

//Function Number: 40
lib_A7B8::waitforairstrikecancel()
{
	self endon("location_selection_complete");
	self endon("disconnect");
	self waittill("stop_location_selection");
	self setblurforplayer(0,0.3);
	self setclientomnvar("ui_map_location_blocked",0);
	if(maps\mp\gametypes\_hostmigration::waittillhostmigrationdone() > 0)
	{
		self switchtoweapon(common_scripts\utility::getlastweapon());
	}

	level.strafing_run_airstrike = undefined;
}

//Function Number: 41
lib_A7B8::selectairstrikelocation(param_00,param_01,param_02)
{
	if(!isdefined(level.mapsize))
	{
		level.mapsize = 1024;
	}

	var_03 = level.mapsize / 6.46875;
	if(level.splitscreen)
	{
		var_03 = var_03 * 1.5;
	}

	level.strafing_run_airstrike = 1;
	var_04 = 1;
	var_05 = 1;
	if(common_scripts\utility::array_contains(param_02,"strafing_run_airstrike_two"))
	{
		var_05 = 2;
	}

	self setclientomnvar("ui_map_location_use_carepackages",common_scripts\utility::array_contains(param_02,"strafing_run_airstrike_package"));
	self setclientomnvar("ui_map_location_num_planes",var_05);
	self setclientomnvar("ui_map_location_height",lib_A7B8::getplaneflyheight());
	maps\mp\_utility::_beginlocationselection(param_01,"map_artillery_selector",var_04,var_03);
	thread lib_A7B8::waitforairstrikecancel();
	self endon("stop_location_selection");
	self endon("disconnect");
	var_06 = undefined;
	var_07 = undefined;
	var_08 = 0;
	while(!var_08)
	{
		self waittill("confirm_location",var_09,var_0A);
		if(!var_04)
		{
			var_0A = 0;
		}

		if(lib_A7B8::validateflightlocationanddirection(var_09,var_0A,param_02,self))
		{
			var_06 = var_09;
			var_07 = var_0A;
			self setclientomnvar("ui_map_location_use_carepackages",0);
			self setclientomnvar("ui_map_location_num_planes",0);
			self setclientomnvar("ui_map_location_height",0);
			break;
		}
		else
		{
			thread lib_A7B8::showblockedhud();
		}
	}

	self setblurforplayer(0,0.3);
	self notify("location_selection_complete");
	self setclientomnvar("ui_map_location_blocked",0);
	maps\mp\_matchdata::logkillstreakevent(param_01,var_06);
	thread lib_A7B8::finishairstrikeusage(param_00,[var_06],[var_07],param_01,param_02);
	return 1;
}

//Function Number: 42
lib_A7B8::showblockedhud()
{
	self endon("location_selection_complete");
	self endon("disconnect");
	self endon("stop_location_selection");
	self notify("airstrikeShowBlockedHUD");
	self endon("airstrikeShowBlockedHUD");
	if(self getclientomnvar("ui_map_location_blocked") == 0)
	{
		self method_82F4("recon_drn_cloak_notready");
	}

	self setclientomnvar("ui_map_location_blocked",1);
	wait(1.5);
	self setclientomnvar("ui_map_location_blocked",0);
}

//Function Number: 43
lib_A7B8::validateflightlocationanddirection(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A7B8::getplaneflyheight();
	var_05 = 1;
	if(common_scripts\utility::array_contains(param_02,"strafing_run_airstrike_two"))
	{
		var_05 = 2;
	}

	return function_02CB(param_00,var_04,param_01,var_05);
}

//Function Number: 44
lib_A7B8::finishairstrikeusage(param_00,param_01,param_02,param_03,param_04)
{
	self notify("used");
	for(var_05 = 0;var_05 < param_01.size;var_05++)
	{
		var_06 = param_01[var_05];
		var_07 = param_02[var_05];
		var_08 = bullettrace(level.var_5983 + (0,0,1000000),level.var_5983,0,undefined);
		var_06 = (var_06[0],var_06[1],var_08["position"][2] - 514);
		thread lib_A7B8::doairstrike(param_00,var_06,var_07,self,self.connectedpostgame["team"],param_03,param_04);
	}
}

//Function Number: 45
lib_A7B8::waitillairstrikeoverbombingarea(param_00)
{
	param_00 endon("airstrike_complete");
	while(!lib_A7B8::targetisclose(param_00,param_00.dropsite,200))
	{
		wait 0.05;
	}
}

//Function Number: 46
lib_A7B8::playerdelaycontrol()
{
	self endon("disconnect");
	maps\mp\_utility::freezecontrolswrapper(1);
	wait(0.5);
	maps\mp\_utility::freezecontrolswrapper(0);
}

//Function Number: 47
lib_A7B8::playerdoridekillstreak(param_00)
{
	var_01 = maps\mp\killstreaks\_killstreaks::initridekillstreak("coop",0,0.5);
	if(var_01 != "success" || !isdefined(param_00))
	{
		if(var_01 != "disconnect")
		{
			if(!isdefined(param_00))
			{
				thread maps\mp\_utility::playerremotekillstreakshowhud();
			}

			lib_A7B8::playerreset(0);
			maps\mp\killstreaks\_coop_util::playerresetaftercoopstreak();
		}

		self notify("initRideKillstreak_complete",0);
		return;
	}

	self notify("initRideKillstreak_complete",1);
}

//Function Number: 48
lib_A7B8::handlecoopjoining(param_00,param_01)
{
	var_02 = param_01.inliveplayerkillstreak;
	if(param_01.inliveplayerkillstreak == "allies")
	{
		var_03 = "SE_1mc_orbitalsupport_buddyrequest";
		var_04 = "SE_1mc_orbitalsupport_buddy";
	}
	else
	{
		var_03 = "AT_1mc_orbitalsupport_buddyrequest";
		var_04 = "AT_1mc_orbitalsupport_buddy";
	}

	lib_A7B8::waittilloverplayspace(param_00);
	if(!isdefined(param_00))
	{
		return;
	}

	var_05 = maps\mp\killstreaks\_coop_util::promptforstreaksupport(var_02,&"MP_JOIN_STRAFING_RUN","strafing_run_airstrike_coop_offensive",var_03,var_04,param_01);
	level thread lib_A7B8::watchforjoin(var_05,param_00,param_01);
	var_06 = lib_A7B8::waittillpromptcomplete(param_00,"buddyJoinedStreak");
	maps\mp\killstreaks\_coop_util::stoppromptforstreaksupport(var_05);
	if(!isdefined(var_06))
	{
		return;
	}

	var_06 = lib_A7B8::waittillpromptcomplete(param_00,"airstrike_buddy_removed");
	if(!isdefined(var_06))
	{
	}
}

//Function Number: 49
lib_A7B8::notifycoopover(param_00)
{
	param_00 endon("airstrike_complete");
	if(param_00.enteringbombingarea)
	{
		lib_A7B8::waitillairstrikeoverbombingarea(param_00);
	}

	lib_A7B8::waittillleftplayspace(param_00,1.65);
	param_00 notify("coopJoinOver");
}

//Function Number: 50
lib_A7B8::waittilloverplayspace(param_00)
{
	var_01 = 1.65;
	var_02 = anglestoforward(param_00.var_41);
	for(;;)
	{
		wait 0.05;
		if(!isdefined(param_00))
		{
			return;
		}

		var_03 = param_00.flyingspeed * var_01;
		var_04 = param_00.var_2E6 + var_02 * var_03;
		var_05 = var_04 + (0,0,-10000);
		var_06 = bullettrace(var_04,var_05,0,param_00);
		if(var_06["fraction"] == 1)
		{
			continue;
		}

		var_07 = var_06["position"];
		var_08 = getnodesinradius(var_07,300,0);
		if(var_08.size > 0)
		{
			break;
		}
	}
}

//Function Number: 51
lib_A7B8::waittillleftplayspace(param_00,param_01)
{
	param_00 endon("airstrike_complete");
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	for(;;)
	{
		wait 0.05;
		var_02 = param_00.flyingspeed * param_01;
		var_03 = anglestoforward(param_00.var_41);
		var_04 = param_00.var_2E6 + var_03 * var_02;
		var_05 = var_04 + (0,0,-10000);
		var_06 = bullettrace(var_04,var_05,0,param_00);
		if(var_06["fraction"] == 1)
		{
			break;
		}

		var_07 = var_06["position"];
		var_08 = getnodesinradius(var_07,300,0);
		if(var_08.size == 0)
		{
			break;
		}
	}
}

//Function Number: 52
lib_A7B8::waittillfiremissile(param_00,param_01)
{
	param_01 endon("airstrike_fire");
	param_00 endon("airstrike_complete");
	if(param_00.enteringbombingarea)
	{
		lib_A7B8::waitillairstrikeoverbombingarea(param_00);
	}

	lib_A7B8::waittillleftplayspace(param_00);
}

//Function Number: 53
lib_A7B8::waittillpromptcomplete(param_00,param_01)
{
	param_00 endon("airstrike_complete");
	param_00 endon("coopJoinOver");
	param_00 waittill(param_01);
	return 1;
}

//Function Number: 54
lib_A7B8::watchforjoin(param_00,param_01,param_02)
{
	var_03 = lib_A7B8::waittillbuddyjoinedairstrike(param_00,param_01);
	if(!isdefined(var_03))
	{
		return;
	}

	param_01 notify("buddyJoinedStreak");
	level notify("buddyGO");
	var_03 thread lib_A7B8::playerdoridekillstreak(param_01);
	var_03 waittill("initRideKillstreak_complete",var_04);
	if(!var_04)
	{
		return;
	}

	var_03 maps\mp\_utility::playersaveangles();
	var_03 maps\mp\_utility::setusingremote("strafing_run");
	var_03 notifyonplayercommand("airstrike_fire","+attack");
	var_03 notifyonplayercommand("airstrike_fire","+attack_akimbo_accessible");
	var_05 = spawnturret("misc_turret",param_01 gettagorigin("tag_origin"),"sentry_minigun_mp");
	var_05 turretfiredisable();
	var_05 setmodel("tag_turret");
	var_05 method_8446(param_01,"tag_origin",(0,0,0),(70,180,0));
	var_03 playerlinkweaponviewtodelta(var_05,"tag_player",0,180,180,5,15,0);
	var_03 playerlinkedsetviewznear(0);
	var_03 playerlinkedsetusebaseangleforviewclamp(1);
	var_03 remotecontrolturret(var_05,60,45);
	var_06 = var_03 maps\mp\killstreaks\_missile_strike::buildweaponsettings([]);
	lib_A7B8::missileeyesinit(var_03,var_06,param_02);
	lib_A7B8::waittillfiremissile(param_01,var_03);
	if(isdefined(var_03))
	{
		earthquake(0.4,1,var_03 getvieworigin(),300);
		lib_A7B8::firemissile(var_03,var_05,var_06);
		if(isdefined(var_03))
		{
			var_03 maps\mp\killstreaks\_coop_util::playerresetaftercoopstreak();
			var_03 method_849C("airstrike_fire","+attack");
			var_03 method_849C("airstrike_fire","+attack_akimbo_accessible");
		}
	}

	var_05 delete();
}

//Function Number: 55
lib_A7B8::waittillbuddyjoinedairstrike(param_00,param_01)
{
	param_01 endon("airstrike_complete");
	param_01 endon("coopJoinOver");
	thread lib_A7B8::notifycoopover(param_01);
	var_02 = maps\mp\killstreaks\_coop_util::waittillbuddyjoinedstreak(param_00);
	return var_02;
}

//Function Number: 56
lib_A7B8::firemissile(param_00,param_01,param_02)
{
	var_03 = param_01 gettagorigin("tag_player");
	var_04 = anglestoforward(param_01 gettagangles("tag_player"));
	var_05 = var_03 + var_04 * 10000;
	var_06 = magicbullet("airstrike_missile_mp",var_03,var_05,param_00);
	var_06.owner = param_00;
	wait 0.05;
	if(!isdefined(param_00))
	{
		return;
	}

	param_00 unlink();
	param_00 remotecontrolturretoff(param_01);
	param_00 setclientomnvar("fov_scale",4.333333);
	lib_A7B8::missileeyesgo(param_00,var_06,param_02);
	if(!isdefined(param_00))
	{
		return;
	}

	param_00 setclientomnvar("fov_scale",1);
}

//Function Number: 57
lib_A7B8::missileeyesinit(param_00,param_01,param_02)
{
	param_00 thread lib_A7B8::hudinit(param_01,param_02);
	param_00 method_80B8();
	if(getdvarint("camera_thirdPerson"))
	{
		param_00 maps\mp\_utility::setthirdpersondof(0);
	}
}

//Function Number: 58
lib_A7B8::missileeyesgo(param_00,param_01,param_02)
{
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	param_00 endon("player_control_strike_over");
	param_00 endon("disconnect");
	param_02 endon("ms_early_exit");
	param_01 thread maps\mp\killstreaks\_missile_strike::rocket_cleanupondeath();
	param_00 thread maps\mp\killstreaks\_missile_strike::player_cleanupongameended(param_01,param_02);
	param_00 thread maps\mp\killstreaks\_missile_strike::player_cleanuponteamchange(param_01,param_02);
	param_00 thread lib_A7B8::hudgo(param_01,param_02);
	param_00 thread lib_A7B8::playerwaitreset(param_02);
	param_00 cameralinkto(param_01,"tag_origin");
	param_00 controlslinkto(param_01);
	param_00 thread maps\mp\killstreaks\_missile_strike::playerwatchforearlyexit(param_02);
	param_01 common_scripts\utility::waittill_notify_or_timeout("death",10);
	param_02 notify("missile_strike_complete");
}

//Function Number: 59
lib_A7B8::playerwaitreset(param_00)
{
	param_00 common_scripts\utility::waittill_either("missile_strike_complete","ms_early_exit");
	lib_A7B8::playerreset();
}

//Function Number: 60
lib_A7B8::playerreset(param_00)
{
	self endon("disconnect");
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	self controlsunlink();
	maps\mp\_utility::freezecontrolswrapper(1);
	self setclientomnvar("fov_scale",1);
	lib_A7B8::stopmissileboostsounds();
	maps\mp\killstreaks\_missile_strike::stopmissileboostsounds();
	if(!level.gameended || isdefined(self.finalkill))
	{
		maps\mp\killstreaks\_aerial_utility::playershowfullstatic();
	}

	if(param_00)
	{
		wait(0.5);
		maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	}

	maps\mp\killstreaks\_missile_strike::remove_hud();
	self method_80B9();
	self cameraunlink();
	maps\mp\_utility::freezecontrolswrapper(0);
	if(maps\mp\_utility::isusingremote())
	{
		maps\mp\_utility::clearusingremote();
	}

	maps\mp\_utility::playerrestoreangles();
}

//Function Number: 61
lib_A7B8::stopmissileboostsounds()
{
	self method_82F5("bombrun_support_mstrike_boost_shot");
	self method_82F5("bombrun_support_mstrike_boost_boom");
	self method_82F5("bombrun_support_mstrike_boost_jet");
}

//Function Number: 62
lib_A7B8::hudinit(param_00,param_01)
{
	self endon("disconnect");
	self setclientomnvar("ui_predator_missile",2);
	self setclientomnvar("ui_coop_primary_num",param_01 getentitynumber());
	wait 0.05;
	maps\mp\killstreaks\_missile_strike::hud_update_fire_text(undefined,param_00);
	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
}

//Function Number: 63
lib_A7B8::hudgo(param_00,param_01)
{
	thread maps\mp\killstreaks\_missile_strike::targeting_hud_init();
	thread maps\mp\killstreaks\_missile_strike::targeting_hud_think(param_00,param_01);
}