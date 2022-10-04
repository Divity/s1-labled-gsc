/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42806.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:24:08 PM
*******************************************************************/

//Function Number: 1
lib_A736::getgroundslamminheight()
{
	return 120;
}

//Function Number: 2
lib_A736::getgroundslammaxheight()
{
	return 380;
}

//Function Number: 3
lib_A736::getgroundslammindamage()
{
	return 50;
}

//Function Number: 4
lib_A736::getgroundslammaxdamage()
{
	return 110;
}

//Function Number: 5
lib_A736::getgroundslamminradius()
{
	return 75;
}

//Function Number: 6
lib_A736::getgroundslammaxradius()
{
	return 125;
}

//Function Number: 7
lib_A736::init()
{
	level._effect["exo_slam_kneeslide_fx"] = loadfx("vfx/code/slam_jetpack_kneeslide");
	level thread lib_A736::onplayerconnect();
}

//Function Number: 8
lib_A736::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A736::monitorgroundslam();
		var_00 thread lib_A736::monitorgroundslamhitplayer();
	}
}

//Function Number: 9
lib_A736::monitorgroundslam()
{
	self endon("disconnect");
	var_00 = 10;
	var_01 = 4;
	var_02 = (1,0,0);
	var_03 = (0,1,0);
	var_04 = (0,0,1);
	var_05 = 16;
	for(;;)
	{
		self waittill("ground_slam",var_06);
		if(isdefined(level.groundslam) && self [[ level.groundslam ]](var_06))
		{
			continue;
		}

		var_07 = getdvarfloat("ground_slam_min_height",lib_A736::getgroundslamminheight());
		var_08 = getdvarfloat("ground_slam_max_height",lib_A736::getgroundslammaxheight());
		var_09 = getdvarfloat("ground_slam_min_damage",lib_A736::getgroundslammindamage());
		var_0A = getdvarfloat("ground_slam_max_damage",lib_A736::getgroundslammaxdamage());
		var_0B = getdvarfloat("ground_slam_min_radius",lib_A736::getgroundslamminradius());
		var_0C = getdvarfloat("ground_slam_max_radius",lib_A736::getgroundslammaxradius());
		if(var_06 < var_07)
		{
			continue;
		}

		var_0D = var_06 - var_07 / var_08 - var_07;
		var_0D = clamp(var_0D,0,1);
		var_0E = var_0C - var_0B * var_0D + var_0B;
		var_0F = var_0E + 60;
		var_10 = var_0F * var_0F;
		self entityradiusdamage(self.var_2E6,var_0E,var_0A,var_09,self,"MOD_TRIGGER_HURT","boost_slam_mp");
		if(maps\mp\_utility::_hasperk("specialty_exo_slamboots"))
		{
			playfxontag(level._effect["exo_slam_kneeslide_fx"],self,"j_knee_ri");
			physicsexplosionsphere(self.var_2E6,var_0E,20,1);
			foreach(var_12 in level.var_328)
			{
				if(maps\mp\_utility::isreallyalive(var_12) && var_12 != self && !level.teambased || var_12.inliveplayerkillstreak != self.inliveplayerkillstreak && !var_12 maps\mp\_utility::isusingremote())
				{
					if(distancesquared(self.var_2E6,var_12.var_2E6) < var_10)
					{
						var_12 shellshock("concussion_grenade_mp",1.5);
						maps\mp\gametypes\_missions::processchallenge("ch_perk_overcharge");
					}
				}
			}
		}
		else
		{
			physicsexplosionsphere(self.var_2E6,var_0E,20,0.9);
		}

		if(getdvarint("ground_slam_debug"))
		{
			thread lib_A736::draw_circle_for_time(self.var_2E6,var_0E + var_05,(0,1,0),0,16,var_00);
			var_14 = 100;
			var_15 = var_14 - var_09 * var_0E / var_0A - var_09;
			thread lib_A736::draw_circle_for_time(self.var_2E6,var_15 + var_05,(1,0,0),0,16,var_00);
			foreach(var_12 in level.var_328)
			{
			}
		}
	}
}

//Function Number: 10
lib_A736::draw_circle_for_time(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_05 / 0.05;
	for(var_07 = 0;var_07 < var_06;var_07++)
	{
		maps\mp\bots\_bots_util::bot_draw_circle(param_00,param_01,param_02,param_03,param_04);
		wait(0.05);
	}
}

//Function Number: 11
lib_A736::monitorgroundslamhitplayer()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("ground_slam_hit_player",var_00);
		if(isdefined(level.groundslamhitplayer) && self [[ level.groundslamhitplayer ]](var_00))
		{
			continue;
		}

		var_00 dodamage(var_00.health,self.var_2E6,self,self,"MOD_CRUSH","boost_slam_mp");
	}
}

//Function Number: 12
lib_A736::exo_power_cooldown(param_00)
{
	var_01 = int(param_00 * 1000);
	self setclientomnvar("ui_exo_cooldown_time",var_01);
	wait(param_00);
	self setclientomnvar("ui_exo_cooldown_time",0);
	self method_82F4("exo_power_recharged");
}