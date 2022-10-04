/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42495.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 74
 * Decompile Time: 19 ms
 * Timestamp: 4/20/2022 8:23:46 PM
*******************************************************************/

//Function Number: 1
lib_A5FF::func_6EF8()
{
	precacheitem("turret_attackheli");
	precacheitem("missile_attackheli");
	lib_A5FF::func_0E20();
	thread lib_A5FF::init();
}

//Function Number: 2
lib_A5FF::func_0E20()
{
	if(getdvarint("sm_enable") && getdvar("r_zfeather") != "0")
	{
		level._effect["_attack_heli_spotlight"] = loadfx("fx/misc/hunted_spotlight_model");
		return;
	}

	level._effect["_attack_heli_spotlight"] = loadfx("fx/misc/spotlight_large");
}

//Function Number: 3
lib_A5FF::init()
{
	if(isdefined(level.var_E37))
	{
		return;
	}

	while(!isdefined(level.gameskill))
	{
		wait(0.05);
	}

	if(!isdefined(level.var_2235))
	{
		level.var_2235 = [];
	}

	if(!isdefined(level.var_2235["25"]))
	{
		level.var_2235["25"] = cos(25);
	}

	if(!isdefined(level.var_2235["35"]))
	{
		level.var_2235["35"] = cos(35);
	}

	if(!isdefined(level.var_E3F))
	{
		level.var_E3F = 3500;
	}

	if(!isdefined(level.var_E3B))
	{
		level.var_E3B = 0;
	}

	if(!isdefined(level.var_E39))
	{
		level.var_E39 = cos(30);
	}

	level.var_E37 = 1;
	level.var_E3C = 3;
	level.var_E40 = 6;
	level.var_E3D = 3;
	switch(level.gameskill)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;
	}
}

//Function Number: 4
lib_A5FF::func_8B31(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "kill_heli";
	}

	var_01 = lib_A59E::func_8973(param_00);
	var_01 = lib_A5FF::func_136E(var_01);
	return var_01;
}

//Function Number: 5
lib_A5FF::func_136E(param_00,param_01)
{
	param_00 endon("death");
	param_00 endon("heli_players_dead");
	if(level.gameskill == 0 || level.gameskill == 1)
	{
		var_02 = spawn("script_origin",param_00.var_2E6 + (0,0,-20));
		var_02 linkto(param_00);
		param_00 thread common_scripts\utility::delete_on_death(var_02);
		var_03 = undefined;
		if(level.gameskill == 0)
		{
			var_03 = 2800;
		}
		else
		{
			var_03 = 2200;
		}

		if(!isdefined(param_00.var_60ED))
		{
			param_00.attractor = missilecreateattractorent(var_02,var_03,10000,level.var_31D);
			if(lib_A59A::func_5009())
			{
				param_00.var_E55 = missilecreateattractorent(var_02,var_03,10000,level.var_6C58);
			}
		}
	}

	param_00 enableaimassist();
	param_00.var_8D20 = spawn("script_origin",param_00.var_2E6);
	param_00 thread common_scripts\utility::delete_on_death(param_00.var_8D20);
	if(!isdefined(param_00.var_1D75))
	{
		param_00.var_1D75 = 0;
	}

	param_00.var_AAF = 1;
	param_00.var_3803 = 0;
	param_00.moving = 1;
	param_00.var_51C5 = 0;
	param_00.var_47C9 = undefined;
	param_00 thread lib_A5FF::func_61FD();
	param_00 thread lib_A5FF::func_6201();
	thread lib_A5FF::func_5316(param_00,param_01);
	param_00.turrettype = undefined;
	param_00 lib_A5FF::func_47B4();
	param_00 thread lib_A5FF::func_298C();
	switch(param_00.vehicletype)
	{
		case "ny_harbor_hind":
		case "hind_blackice":
		case "hind":
			break;

		case "mi28":
		case "nh90":
		case "mi17":
			break;

		case "apache":
			break;

		case "littlebird_spotlight":
		case "littlebird":
			break;

		default:
			break;
	}
}

//Function Number: 6
lib_A5FF::func_298C()
{
	foreach(var_01 in level.var_328)
	{
		var_01 lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	}

	lib_A59A::func_2BDC();
	self notify("heli_players_dead");
}

//Function Number: 7
lib_A5FF::func_47B4()
{
	var_00 = undefined;
	var_01 = undefined;
	switch(self.vehicletype)
	{
		case "ny_harbor_hind":
		case "hind_blackice":
		case "hind":
			break;

		case "mi28":
		case "nh90":
		case "mi17":
			break;

		case "apache":
			break;

		case "littlebird_spotlight":
		case "littlebird":
			break;

		default:
			break;
	}
}

//Function Number: 8
lib_A5FF::func_3EA8()
{
	if(isdefined(self.turrets))
	{
		return self.turrets;
	}

	lib_A5FF::func_822F();
	return self.turrets;
}

//Function Number: 9
lib_A5FF::func_822F()
{
	self.turrettype = "miniguns";
	self.var_5C6E = 0;
	self.var_3802 = 0;
	if(!isdefined(self.mgturret))
	{
		return;
	}

	self.turrets = self.mgturret;
	common_scripts\utility::array_thread(self.turrets,::lib_A5FF::func_57B3,self);
}

//Function Number: 10
lib_A5FF::func_47B3(param_00)
{
	param_00 common_scripts\utility::waittill_either("death","crash_done");
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 11
lib_A5FF::func_8B58(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "kill_heli";
	}

	var_02 = lib_A59E::func_8973(param_00);
	var_02.var_8D20 = spawn("script_origin",var_02.var_2E6);
	var_02 thread common_scripts\utility::delete_on_death(var_02.var_8D20);
	var_02.var_1D75 = 1;
	var_02.var_AAF = 1;
	var_02.var_3803 = 0;
	var_02 thread lib_A5FF::func_61FD();
	var_02 thread lib_A5FF::func_6201();
	thread lib_A5FF::func_5316(var_02,param_01);
	return var_02;
}

//Function Number: 12
lib_A5FF::func_5316(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = lib_A59E::func_8973("kill_heli");
		param_00.var_AAF = 1;
		param_00.var_3803 = 0;
		param_00 thread lib_A5FF::func_61FD();
		param_00 thread lib_A5FF::func_6201();
	}

	var_02 = undefined;
	if(!isdefined(param_00.script_airspeed))
	{
		var_02 = 40;
	}
	else
	{
		var_02 = param_00.script_airspeed;
	}

	if(!isdefined(level.var_324D))
	{
		level.var_324D = 0;
	}

	if(!isdefined(level.var_20BC))
	{
		level.var_20BC = 0;
	}

	if(!isdefined(level.var_324C))
	{
		level.var_324C = 0;
	}

	level.var_E21 = undefined;
	var_03 = getentarray("attack_heli_safe_volume","script_noteworthy");
	if(var_03.size > 0)
	{
		level.var_E21 = var_03;
	}

	if(!level.var_324D)
	{
		thread lib_A5FF::func_29ED(param_00);
	}

	if(!isdefined(param_00.var_480E))
	{
		switch(param_00.vehicletype)
		{
			case "mi28":
			case "nh90":
			case "mi17":
				break;

			case "ny_harbor_hind":
			case "hind_blackice":
			case "hind":
				break;

			case "apache":
				break;

			case "littlebird_spotlight":
			case "littlebird":
				break;

			default:
				break;
		}
	}
}

//Function Number: 13
lib_A5FF::func_47A6(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "attack_heli_circle_node";
	}

	var_02 = getentarray(param_00,"targetname");
	if(!isdefined(var_02) || var_02.size < 1)
	{
		var_02 = common_scripts\utility::getstructarray(param_00,"targetname");
	}

	var_03 = self;
	var_03 endon("stop_circling");
	var_03 endon("death");
	var_03 endon("returning_home");
	var_03 endon("heli_players_dead");
	for(;;)
	{
		var_03 veh_setspeed(param_01,param_01 / 4,param_01 / 4);
		var_03 veh_neargoalnotifydist(100);
		var_04 = lib_A59A::func_3CFD(var_03.var_2E6);
		var_05 = var_04.var_2E6;
		var_03 veh_setlookatent(var_04);
		var_06 = common_scripts\utility::getclosest(var_05,var_02);
		var_07 = getentarray(var_06.target,"targetname");
		if(!isdefined(var_07) || var_07.size < 1)
		{
			var_07 = common_scripts\utility::getstructarray(var_06.target,"targetname");
		}

		var_08 = var_07[randomint(var_07.size)];
		var_03 veh_setgoalpos(var_08.var_2E6,1);
		var_03 waittill("near_goal");
		if(!isdefined(var_04.var_5008))
		{
			wait(1);
			wait(randomfloatrange(0.8,1.3));
		}
	}
}

//Function Number: 14
lib_A5FF::func_47C5(param_00)
{
	self endon("death");
	var_01 = getentarray("kill_heli_spot","targetname");
	var_02 = self;
	var_03 = common_scripts\utility::getclosest(var_02.var_2E6,var_01);
	var_04 = var_03;
	var_02 endon("death");
	var_02 endon("returning_home");
	var_02 endon("heli_players_dead");
	var_05 = undefined;
	for(;;)
	{
		wait(0.05);
		var_02 veh_setspeed(param_00,param_00 / 2,param_00 / 10);
		var_02 veh_neargoalnotifydist(100);
		var_06 = lib_A59A::func_3CFD(var_02.var_2E6);
		var_07 = var_06.var_2E6;
		if(var_03 == var_04 && var_02.var_51C5)
		{
			var_08 = lib_A5FF::func_3DBD(var_02,var_03,var_01,var_06,var_07);
			var_03 = common_scripts\utility::getclosest(var_07,var_08);
		}

		var_02 veh_setgoalpos(var_03.var_2E6,1);
		var_02.moving = 1;
		var_06 = lib_A59A::func_3CFD(var_02.var_2E6);
		if(isdefined(self.var_3388) && isdefined(self.var_3388.classname) && self.var_3388.classname == "script_origin")
		{
			var_05 = var_06;
		}
		else if(isdefined(self.var_3388))
		{
			var_05 = self.var_3388;
		}
		else
		{
			var_05 = self.var_91BD;
		}

		var_02 veh_setlookatent(var_05);
		var_02 waittill("near_goal");
		var_02.moving = 0;
		if(!lib_A59A::func_5009())
		{
			if(level.gameskill == 0 || level.gameskill == 1)
			{
				while(lib_A5FF::func_6B67(var_02))
				{
					wait(0.5);
				}

				wait(3);
			}
		}

		var_06 = lib_A59A::func_3CFD(var_02.var_2E6);
		var_07 = var_06.var_2E6;
		var_08 = lib_A5FF::func_3DBD(var_02,var_03,var_01,var_06,var_07);
		var_08[var_08.size] = var_03;
		var_04 = var_03;
		var_09 = common_scripts\utility::getclosest(var_07,var_01);
		var_0A = common_scripts\utility::getclosest(var_07,var_08);
		foreach(var_0C in var_08)
		{
			if(var_06 sightconetrace(var_0C.var_2E6,var_02) != 1)
			{
				var_08 = common_scripts\utility::array_remove(var_08,var_0C);
				continue;
			}
		}

		var_0E = common_scripts\utility::getclosest(var_07,var_08);
		if(var_08.size < 2)
		{
			var_03 = var_0A;
		}
		else if(var_0E != var_09)
		{
			var_03 = var_0E;
		}
		else
		{
			var_0F = [];
			var_0F[0] = var_0E;
			var_08 = common_scripts\utility::get_array_of_closest(var_07,var_08,var_0F,2);
			var_10 = randomint(var_08.size);
			if(randomint(100) > 50)
			{
				var_03 = var_08[var_10];
			}
			else
			{
				var_03 = var_09;
			}
		}

		var_11 = randomfloatrange(level.var_E3D - 0.5,level.var_E3D + 0.5);
		common_scripts\utility::waittill_notify_or_timeout("damage_by_player",var_11);
	}
}

//Function Number: 15
lib_A5FF::func_6B67(param_00)
{
	if(!level.var_31D lib_A5FF::func_9C23())
	{
		return 0;
	}

	if(!level.var_31D adsbuttonpressed())
	{
		return 0;
	}

	var_01 = level.var_31D geteye();
	if(sighttracepassed(var_01,param_00.var_2E6,0,level.var_31D))
	{
		return 1;
	}

	return 0;
}

//Function Number: 16
lib_A5FF::func_47DD()
{
	self endon("stop_shooting");
	self endon("death");
	self endon("heli_players_dead");
	thread lib_A5FF::func_47D2();
	var_00 = level.var_E3F * level.var_E3F;
	level.var_E3A = 0;
	while(isdefined(self))
	{
		wait(randomfloatrange(0.8,1.3));
		if(!lib_A5FF::func_47C7() || !lib_A5FF::func_47C6())
		{
			var_01 = lib_A5FF::func_47C3();
			if(isplayer(var_01))
			{
				self.var_3388 = var_01;
			}
		}

		if(lib_A5FF::func_47C6() && level.var_328.size > 1)
		{
			var_02 = lib_A59A::func_3CFD(self.var_2E6);
			if(self.var_3388 != var_02)
			{
				var_01 = lib_A5FF::func_47C3();
				if(isplayer(var_01))
				{
					self.var_3388 = var_01;
				}
			}
		}

		if(lib_A5FF::func_47C6())
		{
			if(!lib_A5FF::func_47A5() || level.var_E3A == 1)
			{
				var_01 = lib_A5FF::func_47C2();
				self.var_3388 = var_01;
			}
		}

		if(isdefined(self.var_47C9) && isplayer(self.var_47C9))
		{
			self.var_3388 = self.var_47C9;
		}
		else if(!lib_A5FF::func_47C7())
		{
			var_01 = lib_A5FF::func_47C2();
			self.var_3388 = var_01;
		}

		if(!lib_A5FF::func_47C7())
		{
			continue;
		}

		if(self.var_3388 lib_A5FF::func_5034(self))
		{
			continue;
		}

		if(lib_A5FF::func_47C7() && distancesquared(self.var_3388.var_2E6,self.var_2E6) > var_00)
		{
			continue;
		}

		if(self.turrettype == "default" && lib_A5FF::func_47C6())
		{
			lib_A5FF::func_5C87(self.var_3388);
			wait(randomfloatrange(0.8,1.3));
			lib_A5FF::func_5C87(self.var_3388);
			wait(randomfloatrange(0.8,1.3));
			while(lib_A5FF::func_1A50(self.var_3388) && !self.var_3388 lib_A5FF::func_5034(self))
			{
				lib_A5FF::func_37B2();
				wait(randomfloatrange(2,4));
			}

			continue;
		}

		if(isplayer(self.var_3388) || isai(self.var_3388))
		{
			lib_A5FF::func_37B2();
		}

		if(isplayer(self.var_3388))
		{
			thread lib_A5FF::func_6B2B(self);
		}

		common_scripts\utility::waittill_notify_or_timeout("damage_by_player",level.var_E40);
	}
}

//Function Number: 17
lib_A5FF::func_6B2B(param_00)
{
	level notify("player_is_heli_target");
	level endon("player_is_heli_target");
	level.var_E3A = 1;
	param_00 common_scripts\utility::waittill_notify_or_timeout("damage_by_player",level.var_E3E);
	level.var_E3A = 0;
}

//Function Number: 18
lib_A5FF::func_47A5()
{
	if(!isdefined(self.var_3388))
	{
		return 0;
	}

	var_00 = self.var_3388.var_2E6 + (0,0,32);
	if(isplayer(self.var_3388))
	{
		var_00 = self.var_3388 geteye();
	}

	var_01 = self gettagorigin("tag_flash");
	var_02 = sighttracepassed(var_01,var_00,0,self);
	return var_02;
}

//Function Number: 19
lib_A5FF::func_47C6()
{
	if(!isdefined(self.var_3388))
	{
		return 0;
	}

	if(isplayer(self.var_3388))
	{
		return 1;
	}

	return 0;
}

//Function Number: 20
lib_A5FF::func_47C7()
{
	if(!isdefined(self.var_3388))
	{
		return 0;
	}

	if(!isalive(self.var_3388))
	{
		return 0;
	}

	if(self.var_3388 == self.var_91BD)
	{
		return 0;
	}

	return 1;
}

//Function Number: 21
lib_A5FF::func_47C1()
{
	var_00 = lib_A535::func_3F7D(level.var_E3F,level.var_E39,1,1,0,1,level.var_E38);
	if(isdefined(var_00) && isplayer(var_00))
	{
		var_00 = self.var_91BD;
	}

	if(!isdefined(var_00))
	{
		var_00 = self.var_91BD;
	}

	return var_00;
}

//Function Number: 22
lib_A5FF::func_47C3()
{
	var_00 = function_00D6("allies");
	var_01 = lib_A535::func_3F7D(level.var_E3F,level.var_E39,1,0,0,0,var_00);
	if(!isdefined(var_01))
	{
		var_01 = self.var_91BD;
	}

	return var_01;
}

//Function Number: 23
lib_A5FF::func_47C2()
{
	var_00 = lib_A535::func_3F7D(level.var_E3F,level.var_E39,1,1,0,1,level.var_328);
	if(!isdefined(var_00))
	{
		var_00 = self.var_91BD;
	}

	return var_00;
}

//Function Number: 24
lib_A5FF::func_47D2()
{
	if(!isdefined(self.var_7A35))
	{
		return;
	}

	self endon("death");
	self endon("heli_players_dead");
	self endon("stop_shooting");
	var_00 = undefined;
	var_01 = "turret_attackheli";
	var_02 = "missile_attackheli";
	var_03 = undefined;
	var_04 = undefined;
	var_05 = [];
	switch(self.vehicletype)
	{
		case "mi28":
			break;

		case "littlebird":
		case "apache":
			break;

		default:
			break;
	}
}

//Function Number: 25
lib_A5FF::func_6B6A(param_00)
{
	if(self.moving)
	{
		return 0;
	}

	return 1;
}

//Function Number: 26
lib_A5FF::func_5C92()
{
	if(distancesquared(self.var_2E6,level.var_31D.var_2E6) > 9000000)
	{
		return;
	}

	var_00 = self.var_2E6;
	while(isdefined(self))
	{
		var_00 = self.var_2E6;
		wait(0.1);
	}

	earthquake(0.7,1.5,var_00,1600);
}

//Function Number: 27
lib_A5FF::func_5CBB(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	wait(param_00);
	if(isdefined(self))
	{
		self missilecleartarget();
	}
}

//Function Number: 28
lib_A5FF::func_3D38(param_00)
{
	for(var_01 = 0;var_01 < level.var_328.size;var_01++)
	{
		if(param_00 != level.var_328[var_01])
		{
			return level.var_328[var_01];
		}
	}

	return level.var_328[0];
}

//Function Number: 29
lib_A5FF::func_61FD()
{
	self notify("notify_disable_thread");
	self endon("notify_disable_thread");
	self endon("death");
	self endon("heli_players_dead");
	for(;;)
	{
		self waittill("disable_turret");
		self.var_AAF = 0;
	}
}

//Function Number: 30
lib_A5FF::func_6201()
{
	self notify("notify_enable_thread");
	self endon("notify_enable_thread");
	self endon("death");
	self endon("heli_players_dead");
	for(;;)
	{
		self waittill("enable_turret");
		self.var_AAF = 1;
	}
}

//Function Number: 31
lib_A5FF::func_37B2()
{
	switch(self.turrettype)
	{
		case "default":
			break;

		case "miniguns":
			break;

		default:
			break;
	}
}

//Function Number: 32
lib_A5FF::func_3F1E(param_00)
{
	var_01 = undefined;
	if(!isplayer(param_00))
	{
		var_01 = level.var_E37;
		return var_01;
	}

	switch(level.gameskill)
	{
		case 3:
		case 2:
		case 1:
		case 0:
			break;
	}
}

//Function Number: 33
lib_A5FF::func_37B9(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	wait(param_00);
	if(!isplayer(self.var_3388))
	{
		return;
	}

	self notify("fire_missiles",self.var_3388);
}

//Function Number: 34
lib_A5FF::func_994C(param_00,param_01,param_02)
{
	thread lib_A5FF::func_37B9(randomfloatrange(0.2,2));
	for(var_03 = 0;var_03 < param_01;var_03++)
	{
		self veh_setturrettargetent(param_00,common_scripts\utility::randomvector(50) + (0,0,32));
		if(self.var_AAF && !self.var_3803)
		{
			self veh_fireweapon();
		}

		wait(param_02);
	}
}

//Function Number: 35
lib_A5FF::func_9968(param_00,param_01,param_02)
{
	self endon("death");
	self endon("heli_players_dead");
	self notify("firing_miniguns");
	self endon("firing_miniguns");
	var_03 = lib_A5FF::func_3EA8();
	common_scripts\utility::array_thread(var_03,::lib_A5FF::func_9969,param_00,self);
	if(!self.var_5C6E)
	{
		self.var_3802 = 1;
		thread lib_A59A::play_sound_on_tag("littlebird_gatling_spinup","tag_flash");
		wait(2.1);
		thread lib_A59A::func_6973("littlebird_minigun_spinloop","tag_flash");
	}

	self.var_5C6E = 1;
	if(!isdefined(param_02))
	{
		param_02 = 3;
	}

	var_04 = 0.5;
	if(var_04 > param_02)
	{
		var_04 = param_02;
	}

	if(var_04 > 0)
	{
		wait(randomfloatrange(var_04,param_02));
	}

	lib_A5FF::func_5C69(param_00,param_01);
	var_03 = lib_A5FF::func_3EA8();
	common_scripts\utility::array_call(var_03,::stopfiring);
	thread lib_A5FF::func_5C6B(param_00);
	self notify("stopping_firing");
}

//Function Number: 36
lib_A5FF::func_5C69(param_00,param_01)
{
	self endon("death");
	self endon("heli_players_dead");
	if(isplayer(param_00))
	{
		self endon("cant_see_player");
	}

	var_02 = lib_A5FF::func_3EA8();
	common_scripts\utility::array_call(var_02,::startfiring);
	wait(randomfloatrange(1,2));
	if(isplayer(param_00))
	{
		thread lib_A5FF::func_91B7(param_00);
	}

	if(isplayer(param_00))
	{
		var_03 = randomfloatrange(0.5,3);
		thread lib_A5FF::func_37B9(var_03);
	}

	wait(param_01);
}

//Function Number: 37
lib_A5FF::func_91B7(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	self endon("stopping_firing");
	self notify("tracking_player");
	self endon("tracking_player");
	for(;;)
	{
		if(!lib_A5FF::func_1A50(param_00))
		{
			break;
		}

		wait(0.5);
	}

	wait(level.var_E41);
	self notify("cant_see_player");
}

//Function Number: 38
lib_A5FF::func_9969(param_00,param_01)
{
	param_01 endon("death");
	param_01 endon("heli_players_dead");
	self notify("miniguns_have_new_target");
	self endon("miniguns_have_new_target");
	if(!isplayer(param_00) && isai(param_00) && level.var_E3B == 0)
	{
		var_02 = spawn("script_origin",param_00.var_2E6 + (0,0,100));
		var_02 linkto(param_00);
		thread lib_A5FF::func_5C67(var_02);
		param_00 = var_02;
	}

	for(;;)
	{
		wait(0.5);
		self settargetentity(param_00);
	}
}

//Function Number: 39
lib_A5FF::func_5C67(param_00)
{
	common_scripts\utility::waittill_either("death","miniguns_have_new_target");
	param_00 delete();
}

//Function Number: 40
lib_A5FF::func_5C6B(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	self endon("firing_miniguns");
	if(isplayer(param_00))
	{
		wait(randomfloatrange(3,4));
	}
	else
	{
		wait(randomfloatrange(1,2));
	}

	thread lib_A5FF::func_5C6C();
	self.var_3802 = 0;
}

//Function Number: 41
lib_A5FF::func_5C6C()
{
	self notify("stop soundlittlebird_minigun_spinloop");
	self.var_5C6E = 0;
	lib_A59A::play_sound_on_tag("littlebird_gatling_cooldown","tag_flash");
}

//Function Number: 42
lib_A5FF::func_5C87(param_00)
{
	var_01 = anglestoforward(level.var_31D.var_41);
	var_02 = var_01 * 400;
	var_03 = var_02 + common_scripts\utility::randomvector(50);
	var_04 = randomintrange(10,20);
	var_05 = weaponfiretime("turret_attackheli");
	for(var_06 = 0;var_06 < var_04;var_06++)
	{
		var_03 = var_02 + common_scripts\utility::randomvector(50);
		self veh_setturrettargetent(param_00,var_03);
		if(self.var_AAF)
		{
			self veh_fireweapon();
		}

		wait(var_05);
	}
}

//Function Number: 43
lib_A5FF::func_1A50(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	var_01 = self gettagorigin("tag_flash");
	var_02 = (0,0,0);
	if(isplayer(param_00))
	{
		var_02 = param_00 geteye();
	}
	else
	{
		var_02 = param_00.var_2E6;
	}

	if(sighttracepassed(var_01,var_02,0,undefined))
	{
		return 1;
	}

	return 0;
}

//Function Number: 44
lib_A5FF::func_3DBD(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	var_06 = strtok(param_01.script_linkto," ");
	for(var_07 = 0;var_07 < param_02.size;var_07++)
	{
		for(var_08 = 0;var_08 < var_06.size;var_08++)
		{
			if(param_02[var_07].script_linkname == var_06[var_08])
			{
				var_05[var_05.size] = param_02[var_07];
			}
		}
	}

	foreach(var_0A in var_05)
	{
		if(var_0A.var_2E6[2] < param_04[2])
		{
			var_05 = common_scripts\utility::array_remove(var_05,var_0A);
			continue;
		}
	}

	return var_05;
}

//Function Number: 45
lib_A5FF::func_47AE()
{
	self endon("death");
	self endon("heli_players_dead");
	self endon("crashing");
	self endon("leaving");
	self.damagetaken = 0;
	self.var_7C50 = undefined;
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(!isdefined(var_01) || !isplayer(var_01))
		{
			continue;
		}

		self notify("damage_by_player");
		thread lib_A5FF::func_47AF();
		thread lib_A5FF::func_1A4D(var_01);
		if(lib_A59A::func_500E())
		{
			var_01 thread lib_A5FF::func_9B05();
		}

		if(lib_A59A::func_500F())
		{
			var_01 thread lib_A5FF::func_9B06();
		}
	}
}

//Function Number: 46
lib_A5FF::func_47AF()
{
	self notify("taking damage");
	self endon("taking damage");
	self endon("death");
	self endon("heli_players_dead");
	self.var_51C5 = 1;
	wait(1);
	self.var_51C5 = 0;
}

//Function Number: 47
lib_A5FF::func_1A4D(param_00)
{
	self notify("attacker_seen");
	self endon("attacker_seen");
	self.var_7C50 = param_00;
	self.var_47C9 = param_00;
	wait(level.var_E3C);
	self.var_47C9 = undefined;
	self.var_7C50 = undefined;
}

//Function Number: 48
lib_A5FF::func_5034(param_00)
{
	if(isdefined(param_00.var_7C50))
	{
		if(param_00.var_7C50 == self)
		{
			return 0;
		}
	}

	if(isdefined(level.var_E21))
	{
		foreach(var_02 in level.var_E21)
		{
			if(self istouching(var_02))
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 49
lib_A5FF::func_9B05()
{
	if(!isplayer(self))
	{
		return;
	}

	self.var_4AB4 setshader("damage_feedback",24,48);
	self.var_4AB4.alpha = 1;
	self.var_4AB4 fadeovertime(1);
	self.var_4AB4.alpha = 0;
}

//Function Number: 50
lib_A5FF::func_9B06()
{
	if(!isplayer(self))
	{
		return;
	}

	self method_82F4("player_feedback_hit_alert");
}

//Function Number: 51
lib_A5FF::func_257C()
{
	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		var_01 = level.var_328[var_00];
		var_01.var_4AB4 = newclienthudelem(var_01);
		var_01.var_4AB4.horzalign = "center";
		var_01.var_4AB4.vertalign = "middle";
		var_01.var_4AB4.x = -12;
		var_01.var_4AB4.y = -12;
		var_01.var_4AB4.alpha = 0;
		var_01.var_4AB4.archived = 1;
		var_01.var_4AB4 setshader("damage_feedback",24,48);
	}
}

//Function Number: 52
lib_A5FF::func_47B0()
{
	self waittill("death");
	level notify("attack_heli_destroyed");
	level.var_324D = 1;
	wait(15);
	level.var_324C = 0;
}

//Function Number: 53
lib_A5FF::func_29ED(param_00)
{
	param_00 endon("death");
	param_00 endon("heli_players_dead");
	wait(30);
	if(!level.var_324C)
	{
		return;
	}

	lib_A5FF::func_20BB("co_cf_cmd_heli_small_fire");
	if(!level.var_324C)
	{
		return;
	}

	lib_A5FF::func_20BB("co_cf_cmd_rpg_stinger");
	wait(30);
	if(!level.var_324C)
	{
		return;
	}

	lib_A5FF::func_20BB("co_cf_cmd_heli_wonders");
}

//Function Number: 54
lib_A5FF::func_20BB(param_00)
{
	while(level.var_20BC)
	{
		wait(1);
	}

	level.var_20BC = 1;
	level.var_31D playsoundasmaster(param_00,"sounddone");
	level.var_31D waittill("sounddone");
	wait(0.5);
	level.var_20BC = 0;
}

//Function Number: 55
lib_A5FF::func_9C23()
{
	var_00 = self getcurrentweapon();
	if(!isdefined(var_00))
	{
		return 0;
	}

	if(issubstr(tolower(var_00),"rpg"))
	{
		return 1;
	}

	if(issubstr(tolower(var_00),"stinger"))
	{
		return 1;
	}

	if(issubstr(tolower(var_00),"at4"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 56
lib_A5FF::func_47E2(param_00)
{
	common_scripts\utility::waittill_any("death","crash_done","turn_off_spotlight");
	self.var_8A7F = undefined;
	if(isdefined(self))
	{
		stopfxontag(common_scripts\utility::getfx("_attack_heli_spotlight"),self,param_00);
	}
}

//Function Number: 57
lib_A5FF::func_47E3(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	var_01 = self.var_91BD;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	var_01.targetname = "original_ent";
	self.var_5673 = spawn("script_origin",var_01.var_2E6);
	self.var_5673.var_2E6 = var_01.var_2E6;
	self.var_5673.var_41 = var_01.var_41;
	self.var_5673.targetname = "left_ent";
	self.var_751B = spawn("script_origin",var_01.var_2E6);
	self.var_751B.var_2E6 = var_01.var_2E6;
	self.var_751B.var_41 = var_01.var_41;
	self.var_751B.targetname = "right_ent";
	var_02 = spawnstruct();
	var_02.entity = self.var_5673;
	var_02.var_37E = 250;
	var_02 lib_A59A::func_971C();
	self.var_5673 linkto(self);
	var_03 = spawnstruct();
	var_03.entity = self.var_751B;
	var_03.var_37E = -250;
	var_03 lib_A59A::func_971C();
	self.var_751B linkto(self);
	var_04 = [];
	var_04[0] = var_01;
	var_04[1] = self.var_5673;
	var_04[2] = self.var_751B;
	level.var_8A80 = var_04;
	self.var_8A8A = var_01;
}

//Function Number: 58
lib_A5FF::func_47E4()
{
	if(isdefined(level.var_8A80))
	{
		foreach(var_01 in level.var_8A80)
		{
			if(isdefined(var_01))
			{
				var_01 delete();
			}
		}
	}
}

//Function Number: 59
lib_A5FF::func_47E0(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	if(self.vehicletype != "littlebird")
	{
		return;
	}

	thread lib_A5FF::func_47EA(param_00);
	var_01 = undefined;
	wait(0.05);
	switch(self.vehicletype)
	{
		case "littlebird_spotlight":
		case "littlebird":
			break;

		default:
			break;
	}
}

//Function Number: 60
lib_A5FF::func_47EA(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	lib_A5FF::func_47E3();
	common_scripts\utility::array_thread(level.var_8A80,::lib_A5FF::func_47E1,self);
	if(isdefined(param_00))
	{
		self thread [[ param_00 ]]();
		return;
	}

	for(;;)
	{
		wait(randomfloatrange(1,3));
		if(lib_A5FF::func_47C6() && !lib_A5FF::func_A341())
		{
			self.var_8A8A = self.var_3388;
			continue;
		}

		var_01 = randomint(level.var_8A80.size);
		self.var_91BD = level.var_8A80[var_01];
		self.var_8A8A = self.var_91BD;
	}
}

//Function Number: 61
lib_A5FF::func_A341()
{
	self endon("death");
	self endon("heli_players_dead");
	if(!isdefined(self.var_3388))
	{
		return 0;
	}

	if(!isplayer(self.var_3388))
	{
		return 0;
	}

	var_00 = self.var_3388;
	var_01 = common_scripts\utility::within_fov(var_00 geteye(),var_00 getplayerangles(),self.var_2E6,level.var_2235["35"]);
	return var_01;
}

//Function Number: 62
lib_A5FF::func_47E1(param_00)
{
	param_00 common_scripts\utility::waittill_either("death","crash_done");
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 63
lib_A5FF::func_57B3(param_00)
{
	var_01 = self;
	var_01 lib_A5A0::func_997D("manual");
	if(isdefined(param_00.var_91BD))
	{
		var_01 settargetentity(param_00.var_91BD);
	}

	var_01 setmode("manual");
	param_00 waittill("death");
	if(isdefined(param_00.var_3802) && param_00.var_3802 == 1)
	{
		thread lib_A5FF::func_5C6C();
	}
}

//Function Number: 64
lib_A5FF::func_0E1F()
{
	common_scripts\utility::waittill_either("death","crash_done");
	if(isdefined(self.attractor))
	{
		missiledeleteattractor(self.attractor);
	}

	if(isdefined(self.var_E55))
	{
		missiledeleteattractor(self.var_E55);
	}
}

//Function Number: 65
lib_A5FF::func_47B2(param_00)
{
	self endon("death");
	self endon("heli_players_dead");
	self endon("stop_default_heli_missiles");
	self.var_6EF2 = undefined;
	while(isdefined(self))
	{
		wait(0.05);
		var_01 = undefined;
		var_02 = undefined;
		var_03 = undefined;
		self.var_6EF2 = undefined;
		var_04 = undefined;
		if(isdefined(self.var_251D) && isdefined(self.var_251D.target))
		{
			var_04 = lib_A59A::func_3F80(self.var_251D.target,"targetname");
		}

		if(isdefined(var_04) && isdefined(var_04.script_linkto))
		{
			self.var_6EF2 = lib_A59A::func_3F80(var_04.script_linkto,"script_linkname");
		}

		if(isdefined(self.var_6EF2))
		{
			var_01 = self.var_6EF2;
			var_02 = var_01.var_7ABC;
			var_03 = var_01.script_delay;
			var_04 waittill("trigger");
			continue;
		}

		common_scripts\utility::waittill_any("near_goal","goal");
		if(isdefined(var_01))
		{
			thread lib_A5FF::func_47BA(var_01,var_02,var_03,param_00);
		}
	}
}

//Function Number: 66
lib_A5FF::func_47B1()
{
	self notify("stop_default_heli_missiles");
}

//Function Number: 67
lib_A5FF::func_47E7(param_00,param_01,param_02)
{
	if(!isdefined(param_00))
	{
		param_00 = "tag_barrel";
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	playfxontag(common_scripts\utility::getfx("_attack_heli_spotlight"),self,param_00);
	self.var_8A7F = 1;
	thread lib_A5FF::func_47E2(param_00);
	if(param_02)
	{
		self veh_setturrettargetent(level.var_31D);
		return;
	}

	if(param_01)
	{
		self endon("death");
		self endon("heli_players_dead");
		var_03 = self gettagorigin("tag_origin");
		if(!isdefined(self.var_91BD))
		{
			lib_A5FF::func_47B4();
		}

		self veh_setturrettargetent(self.var_91BD);
		thread lib_A5FF::func_47E0();
	}
}

//Function Number: 68
lib_A5FF::func_47E6()
{
	self notify("turn_off_spotlight");
}

//Function Number: 69
lib_A5FF::func_47E9()
{
	self endon("death");
	self endon("heli_players_dead");
	self endon("stop_spotlight_random_targets");
	if(!isdefined(self.var_91BD))
	{
		thread lib_A5FF::func_47B4();
	}

	if(!isdefined(self.var_5673))
	{
		thread lib_A5FF::func_47EA();
	}

	while(isdefined(self))
	{
		wait(0.05);
		self veh_setturrettargetent(self.var_91BD,(0,0,0));
	}
}

//Function Number: 70
lib_A5FF::func_47E8()
{
	self notify("stop_spotlight_random_targets");
}

//Function Number: 71
lib_A5FF::func_47BA(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self endon("heli_players_dead");
	if(isdefined(self.var_27A1))
	{
		var_04 = self.var_27A1;
	}
	else
	{
		var_04 = "turret_attackheli";
	}

	var_05 = "missile_attackheli";
	if(isdefined(param_03))
	{
		var_05 = param_03;
	}

	var_06 = undefined;
	var_07 = [];
	self veh_setweapon(var_04);
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_00.classname))
	{
		if(!isdefined(self.var_2FC4))
		{
			self.var_2FC4 = spawn("script_origin",param_00.var_2E6);
			thread common_scripts\utility::delete_on_death(self.var_2FC4);
		}

		self.var_2FC4.var_2E6 = param_00.var_2E6;
		param_00 = self.var_2FC4;
	}

	switch(self.vehicletype)
	{
		case "mi28":
			break;

		case "littlebird":
		case "apache":
			break;

		case "hind_battle":
			break;

		default:
			break;
	}
}

//Function Number: 72
lib_A5FF::func_1563()
{
	self waittill("trigger",var_00);
	var_01 = common_scripts\utility::getstructarray(self.target,"targetname");
	var_01 = lib_A59A::func_CEC(var_01);
	lib_A5FF::func_1562(var_00,var_01);
}

//Function Number: 73
lib_A5FF::func_1564()
{
	self waittill("trigger",var_00);
	var_01 = lib_A59A::func_3DBE();
	var_01 = lib_A59A::func_CEC(var_01);
	lib_A5FF::func_1562(var_00,var_01);
}

//Function Number: 74
lib_A5FF::func_1562(param_00,param_01)
{
	var_02 = [];
	var_02[0] = "tag_missile_right";
	var_02[1] = "tag_missile_left";
	if(param_00.vehicletype == "cobra")
	{
		var_02[0] = "tag_store_L_1_a";
		var_02[1] = "tag_store_R_1_a";
	}

	var_03 = [];
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		var_03[var_04] = spawn("script_origin",param_01[var_04].var_2E6);
		param_00 veh_setweapon("littlebird_FFAR");
		param_00 veh_setturrettargetent(var_03[var_04]);
		var_05 = param_00 veh_fireweapon(var_02[var_04 % var_02.size],var_03[var_04],(0,0,0));
		var_05 common_scripts\utility::delaycall(1,::missilecleartarget);
		wait(randomfloatrange(0.2,0.3));
	}

	wait(2);
	foreach(var_07 in var_03)
	{
		var_07 delete();
	}
}