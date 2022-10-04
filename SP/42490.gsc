/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42490.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 55
 * Decompile Time: 19 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5FA::func_0E15()
{
	level.var_6C2C = common_scripts\utility::getstructarray("player_test_point","targetname");
	if(!isdefined(level.var_6C2C) || level.var_6C2C.size < 1)
	{
		level.var_6C2C = getentarray("player_test_point","targetname");
	}

	level.var_2E1D = getentarray("drone_air_space","script_noteworthy");
	if(!isdefined(level.flying_attack_drones))
	{
		level.flying_attack_drones = [];
	}
}

//Function Number: 2
lib_A5FA::func_0E14()
{
	precacheshader("sentinel_drone_overlay");
	precacheshader("warbird_hud_overlay_cannon");
	level.var_39EB = getentarray("drone_formation_volume","targetname");
}

//Function Number: 3
lib_A5FA::func_88CE(param_00,param_01)
{
	if(isdefined(param_01))
	{
		var_02 = param_01 lib_A59E::func_8971();
	}
	else
	{
		var_02 = lib_A59E::func_8973(param_01);
	}

	return var_02;
}

//Function Number: 4
lib_A5FA::func_708D(param_00)
{
	if(isdefined(param_00))
	{
		thread lib_A59E::func_9D0F(param_00);
	}

	lib_A59E::func_4277();
}

//Function Number: 5
lib_A5FA::func_826D()
{
	var_00 = self;
	var_00.ignoreall = 1;
	var_00.ignoreme = 1;
	var_00.var_275 = 30000;
	var_00.health = 30000;
	var_00 veh_setspeed(5,60,60);
}

//Function Number: 6
lib_A5FA::func_85AD()
{
	for(;;)
	{
		if(isdefined(self))
		{
			self notify("in_air_explosion");
		}
		else
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 7
lib_A5FA::func_592B()
{
	while(!issentient(self))
	{
		wait(0.05);
	}

	self sentient_freeentitysentient();
}

//Function Number: 8
lib_A5FA::func_2E80(param_00,param_01,param_02)
{
	if(!isdefined(self))
	{
		return;
	}

	self endon("death");
	self notify("kill_lerp_process");
	self endon("kill_lerp_process");
	var_03 = distance(param_00,self.var_2E6);
	var_04 = 0;
	var_05 = self.var_2E6;
	while(var_04 < var_03)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_06 = lib_A5FA::func_2E56(self.var_2E6,param_00,param_01,param_02);
		self.var_2E6 = vectorlerp(self.var_2E6,param_00,var_06);
		var_04 = distance(self.var_2E6,var_05);
		wait(0.05);
	}

	self notify("drone_lerped");
}

//Function Number: 9
lib_A5FA::func_2E56(param_00,param_01,param_02,param_03)
{
	var_04 = distance(param_00,param_01);
	var_05 = param_02 / var_04 * 0.05;
	if(var_05 > 0)
	{
		return var_05;
	}

	return 0;
}

//Function Number: 10
lib_A5FA::func_592C(param_00)
{
	level endon("delete_drone_cloud");
	level endon("end_drone_cloud");
	self endon("death");
	while(lib_A5FA::func_50F4(self))
	{
		self.var_275 = 500000;
		self.health = self.var_275;
		wait(0.05);
	}

	if(!isdefined(param_00) && self == level.var_1FE3)
	{
		level.var_1FE3 = common_scripts\utility::random(level.var_2ED3);
	}
}

//Function Number: 11
lib_A5FA::func_1FE4()
{
	lib_A59E::func_4277();
	for(;;)
	{
		common_scripts\utility::flag_wait("cloud_in_formation");
		lib_A59A::func_9CAB();
		self notify("drone_path_detach");
		level waittill("drone_cloud_formation_end");
	}
}

//Function Number: 12
lib_A5FA::func_5071()
{
	if(isdefined(self) && self.health > 0 && lib_A59E::func_51FA())
	{
		return 1;
	}

	return 0;
}

//Function Number: 13
lib_A5FA::func_07AB(param_00)
{
	self.var_1525 = common_scripts\utility::array_removeundefined(self.var_1525);
	self.var_1525[self.var_1525.size] = param_00;
}

//Function Number: 14
lib_A5FA::func_1521()
{
	level endon("delete_drone_cloud");
	level endon("end_drone_cloud");
	while(isalive(self.var_7082))
	{
		var_00 = [];
		foreach(var_02 in self.var_1525)
		{
			if(isdefined(var_02) && !isdefined(var_02.var_7350))
			{
				var_00[var_00.size] = var_02;
			}
		}

		self.var_1525 = var_00;
		if(randomfloat(1) < 0.05)
		{
			self.var_1522.var_7085 = self.var_1522.var_7085 * -1;
		}

		var_04 = self.var_1522.var_5C34;
		var_05 = self.var_1522.var_5A15;
		var_06 = [];
		if(self.var_1522.var_3071)
		{
			var_06[var_06.size] = [self.var_7082.var_2E6 - (0,0,1000000),(0,0,0),0,1,0];
		}
		else
		{
			var_07 = self.var_7082 veh_getvelocity();
			var_08 = length(var_07);
			var_09 = max(87.5,var_08);
			var_0A = clamp(var_09 / 262.5,0,0.8);
			var_0B = vectornormalize(var_07) * var_0A;
			var_0C = self.var_1522.var_708A * 1 - var_0A;
			var_06[var_06.size] = [self.var_7082.var_2E6,var_0B,self.var_1522.var_708A,1,self.var_1522.var_7085];
			if(self.var_1522.var_2C27 && level.var_31D attackbuttonpressed())
			{
				var_0D = level.var_31D geteye();
				var_0E = 0.15 * distance(self.var_7082.var_2E6,var_0D);
				var_06[var_06.size] = [var_0D,anglestoforward(level.var_31D getplayerangles()),var_0E,0,0];
			}

			if(isdefined(level.var_31D.var_58DF))
			{
				var_0E = level.var_31D.var_58DF;
			}
			else
			{
				var_0E = 192;
			}

			var_06[var_06.size] = [level.var_31D.var_2E6,(0,0,0),var_0E,0,0];
			if(isdefined(level.var_60F6))
			{
				var_06[var_06.size] = [level.var_60F6,(0,0,0),level.var_E1C,0,0];
			}

			if(isdefined(level.var_2180) && isdefined(level.var_2180.var_1A23))
			{
				var_06[var_06.size] = [level.var_2180.var_1A23,(0,0,0),150,0,0];
			}

			if(self.var_1522.var_7090)
			{
				var_04 = max(var_09 * 0.25,87.5);
				var_05 = var_09 * 3;
			}
		}

		function_02A1(self.var_1525,var_06,self.var_1522.var_608C,self.var_1522.var_7D96,self.var_1522.var_9DB,self.var_1522.var_2002,self.var_1522.var_58DE,self.var_1522.var_7111,self.var_1522.var_59F4,var_04,var_05,self.var_1522.var_2D94,self.var_1522.var_710F);
		wait 0.05;
	}
}

//Function Number: 15
lib_A5FA::func_2E4A()
{
	var_00 = bullettrace(self.var_2E6 - (0,0,5),self.var_2E6 - (0,0,1000),0,self,0,0,0);
	return var_00["position"];
}

//Function Number: 16
lib_A5FA::func_6378(param_00,param_01,param_02)
{
	var_03 = self gettagangles(param_01);
	var_04 = self gettagorigin(param_01);
	if(param_00 == "up")
	{
		return var_04 + anglestoup(var_03) * param_02;
	}

	if(param_00 == "down")
	{
		return var_04 + anglestoup(var_03) * param_02 * -1;
	}

	if(param_00 == "right")
	{
		return var_04 + anglestoright(var_03) * param_02;
	}

	if(param_00 == "left")
	{
		return var_04 + anglestoright(var_03) * param_02 * -1;
	}

	if(param_00 == "forward")
	{
		return var_04 + anglestoforward(var_03) * param_02;
	}

	if(param_00 == "backward")
	{
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "backwardright")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02;
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "backwardleft")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * -1;
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "forwardright")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * 1;
		return var_04 + anglestoforward(var_03) * param_02;
	}

	if(param_00 == "forwardleft")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * -1;
		return var_04 + anglestoforward(var_03) * param_02;
	}
}

//Function Number: 17
lib_A5FA::func_5D86(param_00)
{
	self notify("kill_drone_cloud_health_process");
	self endon("kill_drone_cloud_health_process");
	if(isdefined(self))
	{
		self.var_1A46 = 0;
	}

	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	if(!param_00 && randomint(100) > 20)
	{
		return;
	}

	if(!param_00)
	{
		wait(randomfloat(1));
	}

	if(function_0294(self))
	{
		return;
	}

	self setcandamage(1);
	self.var_1A46 = 1;
	var_01 = 0;
	for(;;)
	{
		self waittill("damage",var_02,var_03,var_04,var_05,var_06);
		thread lib_A5FA::func_3635();
		break;
	}
}

//Function Number: 18
lib_A5FA::func_3635(param_00,param_01,param_02,param_03)
{
	if(!isdefined(self))
	{
		return;
	}

	self.var_2FD1 = 1;
	self.var_7350 = 1;
	var_04 = randomfloat(0.15);
	var_05 = 0.15;
	var_06 = 0.0085;
	var_07 = (0,0,-800);
	var_08 = 1930 * anglestoforward(self.var_41);
	var_09 = self.var_2E6;
	var_0A = undefined;
	var_0B = randomint(16);
	var_0C = randomint(16);
	var_0D = randomint(16);
	var_0E = 0;
	if(common_scripts\utility::cointoss())
	{
		var_0E = 1;
	}

	var_0F = 0;
	while(var_0F < var_05)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_09 = var_09 + var_07 * 0.05;
		if(var_0F < var_04)
		{
			var_09 = var_09 + var_08 * 0.05;
		}

		var_10 = min(var_06 * lengthsquared(var_09) * 0.05,length(var_09));
		var_09 = var_09 - vectornormalize(var_09) * var_10;
		var_11 = self.var_2E6 + var_09 * 0.05;
		var_0A = bullettrace(self.var_2E6 + (0,0,3),var_11,1,self,0);
		if(var_0A["fraction"] >= 1)
		{
			self.var_2E6 = var_11;
			var_05 = var_05 + 0.05;
		}
		else
		{
			break;
		}

		self addyaw(var_0B);
		self addroll(var_0D);
		self addpitch(var_0C);
		if(var_0E && randomint(100) > 95)
		{
			lib_A5FA::func_2E47();
			return;
		}

		wait(0.05);
		var_0F = var_0F + 0.05;
	}

	self.var_2E6 = var_0A["position"];
	self.var_41 = var_0A["normal"];
	lib_A5FA::func_2E47();
}

//Function Number: 19
lib_A5FA::func_93F6(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04) && param_04)
	{
		playfx(common_scripts\utility::getfx("drone_sparks"),self.var_2E6);
	}
	else if(isdefined(param_03) && param_03)
	{
		thread lib_A5F8::func_88E1();
	}
	else if(isdefined(param_02) && param_02)
	{
		playfx(common_scripts\utility::getfx("drone_death_nexus"),self.var_2E6);
	}
	else if(param_00)
	{
		playfx(common_scripts\utility::getfx("drone_death_nexus"),self.var_2E6);
	}
	else if(level.var_2EE7)
	{
		if(randomint(100) < 5)
		{
			playfx(common_scripts\utility::getfx("drone_death_explode1"),self.var_2E6);
		}
		else if(randomint(100) < 15)
		{
			thread lib_A5F8::func_88E1();
		}
		else if(randomint(100) < 25)
		{
			playfx(common_scripts\utility::getfx("drone_death_nexus"),self.var_2E6);
		}
	}
	else
	{
		playfx(common_scripts\utility::getfx("drone_death_nexus"),self.var_2E6);
		if(randomint(100) < 10)
		{
			thread lib_A5F8::func_88E1();
		}
	}

	if(isdefined(param_01) && param_01 && isdefined(self))
	{
		self delete();
	}

	level notify("drone_swarm_hit");
}

//Function Number: 20
lib_A5FA::func_5005(param_00)
{
	if(param_00 == "MOD_CRUSH")
	{
		return 0;
	}

	var_01 = ["MOD_PISTOL_BULLET","MOD_RIFLE_BULLET","mod_pistol_bullet","mod_rifle_bullet","mod_explosive_bullet","mod_grenade","mod_projecile","mod_grenade_splash","mod_projectile_splash","mod_melee","mod_melee_alt","mod_explosive","MOD_EXPLOSIVE_BULLET"];
	foreach(var_03 in var_01)
	{
		if(param_00 == var_03)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 21
lib_A5FA::func_391A(param_00,param_01,param_02)
{
	self endon("death");
	self endon("im_dying");
	thread lib_A5FA::func_3521(param_00);
	if(!isdefined(self))
	{
		return;
	}

	self.var_41 = vectortoangles(param_00.var_2E6 - self.var_2E6);
	var_03 = param_00.var_2E6 + (0,0,40);
	thread lib_A5FA::func_5685(var_03,2700);
	thread lib_A5FA::func_52CF(var_03);
	self waittill("lerp_complete");
	self notify("explode");
}

//Function Number: 22
lib_A5FA::func_376F(param_00)
{
	self endon("im_dying");
	var_01 = self.var_2E6;
	var_02 = (randomintrange(-300,300),randomintrange(-300,300),100);
	var_03 = bullettrace(self.var_2E6,param_00.var_2E6 + var_02,1,self);
	if(isdefined(var_03["entity"]) && var_03["entity"] == param_00)
	{
		return var_03["position"];
	}

	wait(0.05);
}

//Function Number: 23
lib_A5FA::func_3521(param_00)
{
	self waittill("explode");
	if(!isdefined(param_00))
	{
		return;
	}

	var_01 = self.var_2E6;
	if(!isdefined(var_01))
	{
		var_01 = param_00.var_2E6;
	}

	playfx(common_scripts\utility::getfx("drone_explode"),var_01);
	radiusdamage(var_01,400,param_00.var_275 / 3,param_00.var_275 / 4);
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 24
lib_A5FA::func_5685(param_00,param_01,param_02,param_03)
{
	if(!isdefined(self))
	{
		return;
	}

	var_04 = distance(param_00,self.var_2E6);
	var_05 = 0;
	var_06 = self.var_2E6;
	while(var_05 < var_04 && isdefined(self))
	{
		var_07 = lib_A5FA::func_3F6B(self.var_2E6,param_00,param_01,param_02);
		self.var_2E6 = vectorlerp(self.var_2E6,param_00,var_07);
		if(isdefined(param_03))
		{
			self.var_41 = self.var_41 + param_03;
		}

		var_05 = distance(self.var_2E6,var_06);
		wait(0.05);
	}

	self notify("lerp_complete");
}

//Function Number: 25
lib_A5FA::func_3F6B(param_00,param_01,param_02,param_03)
{
	var_04 = distance(param_00,param_01);
	var_05 = param_02 / var_04 * 0.05;
	if(var_05 > 0)
	{
		return var_05;
	}

	return 0;
}

//Function Number: 26
lib_A5FA::func_52CF(param_00)
{
	self endon("death");
	self endon("im_dying");
	self endon("explode");
	while(isdefined(self))
	{
		magicbullet("iw5_attackdronemagicbullet",self.var_2E6,param_00);
		wait(0.05);
	}
}

//Function Number: 27
lib_A5FA::func_1524(param_00,param_01)
{
	self endon("im_dying");
	if(!isdefined(param_01))
	{
		param_01 = 300;
	}

	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		return;
	}

	self notify("im_attacking");
	self.var_7350 = 1;
	lib_A5FA::func_391A(param_00,300);
	wait(0.15);
}

//Function Number: 28
lib_A5FA::func_592A(param_00,param_01)
{
	level.var_60F6 = param_00;
	wait(param_01);
	level.var_60F6 = undefined;
}

//Function Number: 29
lib_A5FA::func_2E47()
{
	playfx(common_scripts\utility::getfx(common_scripts\utility::random(["drone_death_explode1","drone_sparks"])),self.var_2E6);
	if(level.var_8659)
	{
		thread lib_A5FA::func_592A(self.var_2E6,2);
	}

	self delete();
}

//Function Number: 30
lib_A5FA::func_2E53()
{
	level._effect["drone_death_explode1"] = loadfx("vfx/explosion/vehicle_pdrone_large_explosion");
	level._effect["drone_death_extra"] = loadfx("vfx/sparks/microwave_grenade_sparks_1");
	level._effect["drone_death_cheap"] = loadfx("vfx/sparks/drone_swarm_damage_spark");
	level._effect["drone_explode"] = loadfx("vfx/explosion/drone_swarm_projectile_explode");
	level._effect["drone_sparks"] = loadfx("vfx/sparks/sparks_pdrone_hit");
	level._effect["drone_smoke"] = loadfx("vfx/sparks/sparks_pdrone_smoldering");
	level._effect["drone_death_nexus"] = loadfx("vfx/explosion/drone_swarm_queen_explode");
}

//Function Number: 31
lib_A5FA::func_50F4(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(!param_00 lib_A59E::func_51FA())
	{
		return 0;
	}

	if(isdefined(param_00.classname) && issubstr(param_00.classname,"corpse"))
	{
		return 0;
	}

	if(param_00.health < 1)
	{
		return 0;
	}

	return 1;
}

//Function Number: 32
lib_A5FA::func_894A(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_02))
	{
		if(level.nextgen)
		{
			param_02 = 32;
		}
		else
		{
			param_02 = 10;
		}
	}

	if(!isdefined(param_03))
	{
		if(level.nextgen)
		{
			param_03 = 18;
		}
		else
		{
			param_03 = 6;
		}
	}

	var_06 = spawnstruct();
	var_06.var_86B4 = [];
	for(var_07 = 0;var_07 < param_02;var_07++)
	{
		var_08 = lib_A5FA::func_8949(param_00,param_03,param_04,param_05);
		if(isdefined(param_01))
		{
			var_08 lib_A5FA::func_86AC(param_01);
		}

		var_08 thread lib_A5FA::func_86A0();
		var_06.var_86B4[var_06.var_86B4.size] = var_08;
		wait(0.1);
	}

	return var_06;
}

//Function Number: 33
lib_A5FA::func_894B(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_02))
	{
		param_02 = 32;
	}

	var_05 = spawnstruct();
	var_05.var_86B4 = [];
	var_06 = int(param_03.size / param_02);
	for(var_07 = 0;var_07 < param_02;var_07++)
	{
		var_08 = [];
		for(var_09 = 0;var_09 < var_06;var_09++)
		{
			if(isdefined(param_03[var_09]))
			{
				var_08[var_08.size] = param_03[var_09];
			}
		}

		param_03 = common_scripts\utility::array_remove_array(param_03,var_08);
		var_0A = lib_A5FA::func_894C(param_00,var_08,param_04);
		if(isdefined(param_01))
		{
			var_0A lib_A5FA::func_86AC(param_01);
		}

		var_0A thread lib_A5FA::func_86A0();
		var_05.var_86B4[var_05.var_86B4.size] = var_0A;
		wait(0.1);
	}

	return var_05;
}

//Function Number: 34
lib_A5FA::func_1E80()
{
	level notify("end_drone_snake_processes");
	foreach(var_01 in self.var_86B4)
	{
		var_01 lib_A5FA::func_1E7F();
	}
}

//Function Number: 35
lib_A5FA::func_8698(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	self.var_86B4 = common_scripts\utility::array_removeundefined(self.var_86B4);
	foreach(var_07 in self.var_86B4)
	{
		if(isdefined(var_07))
		{
			if(isdefined(param_05))
			{
				var_07.var_38E4.var_1522 = param_05;
			}

			var_07 lib_A5FA::func_86AC(param_00,param_01,param_03,param_04);
			wait(param_02 / self.var_86B4.size);
		}
	}
}

//Function Number: 36
lib_A5FA::func_869C()
{
	foreach(var_01 in self.var_86B4)
	{
		var_01 notify("stop_snake_control");
	}
}

//Function Number: 37
lib_A5FA::func_869A()
{
	foreach(var_01 in self.var_86B4)
	{
		var_01 thread lib_A5FA::func_86A0();
	}
}

//Function Number: 38
lib_A5FA::func_869B(param_00)
{
	self.var_86B4 = common_scripts\utility::array_removeundefined(self.var_86B4);
	foreach(var_02 in self.var_86B4)
	{
		var_02 lib_A5FA::func_86AB(param_00);
	}
}

//Function Number: 39
lib_A5FA::func_86AB(param_00)
{
	self.var_38E4.var_1522 = param_00;
}

//Function Number: 40
lib_A5FA::func_869D(param_00)
{
	foreach(var_02 in self.var_86B4)
	{
		var_02 notify("stop_snake_control");
		var_02 veh_teleport(param_00.var_2E6,(0,0,0));
		var_02.var_86A9 = [param_00];
		var_02.var_86AA = lib_A5FA::getaverageorigin(var_02.var_86A9);
		var_02 thread lib_A5FA::func_86A0();
		foreach(var_04 in var_02.var_38E4.var_1525)
		{
			var_04.var_2E6 = var_02.var_2E6;
		}
	}
}

//Function Number: 41
lib_A5FA::func_86B1(param_00,param_01)
{
}

//Function Number: 42
lib_A5FA::func_8949(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		if(level.nextgen)
		{
			param_01 = 18;
		}
		else
		{
			param_01 = 6;
		}
	}

	var_04 = getent(param_00,"targetname");
	var_04.count++;
	var_05 = var_04 lib_A59A::func_896F();
	var_05 setcontents(0);
	if(isdefined(param_02))
	{
		var_05 veh_teleport(param_02,(0,0,0));
	}

	var_05.godmode = 1;
	var_05.ignoreme = 1;
	var_06 = var_05 lib_A5F8::func_590D(level.var_1523["default_snake"],param_01,param_03);
	level.var_38E5 = common_scripts\utility::array_combine(common_scripts\utility::array_removeundefined(level.var_38E5),var_06.var_1525);
	if(!isdefined(level.var_86B4))
	{
		level.var_86B4 = [];
	}

	level.var_86B4 = common_scripts\utility::array_removeundefined(level.var_86B4);
	level.var_86B4[level.var_86B4.size] = var_05;
	return var_05;
}

//Function Number: 43
lib_A5FA::func_894C(param_00,param_01,param_02)
{
	var_03 = getent(param_00,"targetname");
	var_03.count++;
	var_04 = var_03 lib_A59A::func_896F();
	var_04 setcontents(0);
	if(isdefined(param_02))
	{
		var_04 veh_teleport(param_02,(0,0,0));
	}

	var_04.godmode = 1;
	var_04.ignoreme = 1;
	var_05 = var_04 lib_A5F8::func_590E(level.var_1523["default_snake"],param_01);
	level.var_38E5 = common_scripts\utility::array_combine(common_scripts\utility::array_removeundefined(level.var_38E5),var_05.var_1525);
	if(!isdefined(level.var_86B4))
	{
		level.var_86B4 = [];
	}

	level.var_86B4 = common_scripts\utility::array_removeundefined(level.var_86B4);
	level.var_86B4[level.var_86B4.size] = var_04;
	return var_04;
}

//Function Number: 44
lib_A5FA::func_1E7F()
{
	if(!isdefined(self))
	{
		return;
	}

	foreach(var_01 in self.var_38E4.var_1525)
	{
		if(isdefined(var_01))
		{
			var_01 delete();
		}
	}

	self delete();
}

//Function Number: 45
lib_A5FA::func_86AC(param_00,param_01,param_02,param_03)
{
	if(!isdefined(self))
	{
		return;
	}

	self.var_86A9 = common_scripts\utility::getstructarray(param_00,"script_noteworthy");
	if(self.var_86A9.size == 0)
	{
		return;
	}

	self.var_86A5 = param_01;
	if(isdefined(param_02))
	{
		param_02 = param_02 * 17.6;
	}

	self.var_86AF = param_02;
	if(isdefined(param_03) && param_03)
	{
		self.var_3811 = common_scripts\utility::getstruct(param_00,"targetname");
	}

	self.var_86AA = lib_A5FA::getaverageorigin(self.var_86A9);
}

//Function Number: 46
lib_A5FA::getaverageorigin(param_00)
{
	var_01 = (0,0,0);
	foreach(var_03 in param_00)
	{
		var_01 = var_01 + var_03.var_2E6;
	}

	if(param_00.size > 0)
	{
		var_01 = var_01 * 1 / param_00.size;
	}

	return var_01;
}

//Function Number: 47
lib_A5FA::func_26D1(param_00)
{
	level notify("debug_snake_points");
	level endon("debug_snake_points");
	for(;;)
	{
		foreach(var_02 in common_scripts\utility::getstructarray(param_00,"script_noteworthy"))
		{
			if(isdefined(var_02.var_5551))
			{
				continue;
			}
		}

		wait(0.05);
	}
}

//Function Number: 48
lib_A5FA::func_86A0()
{
	self endon("death");
	self endon("stop_snake_control");
	var_00 = 334.4;
	while(!isdefined(self.var_86A9))
	{
		wait(0.05);
	}

	var_01 = self.var_2E6;
	var_02 = common_scripts\utility::getclosest(self.var_2E6,self.var_86A9);
	for(;;)
	{
		if(isdefined(self.var_3811))
		{
			var_02 = self.var_3811;
			self.var_3811 = undefined;
		}
		else
		{
			for(;;)
			{
				var_02 = lib_A5FA::func_8695(self.var_86A9,var_02);
				if(isdefined(var_02))
				{
					break;
				}

				wait 0.05;
			}
		}

		if(isdefined(var_02) && isdefined(var_02.var_79D3))
		{
			if(!common_scripts\utility::flag(var_02.var_79D3))
			{
				level notify(var_02.var_79D3,self);
				wait 0.05;
				common_scripts\utility::flag_set(var_02.var_79D3);
				self.var_563C = 1;
				foreach(var_04 in level.var_8696.var_86B4)
				{
					if(var_04 == self)
					{
						continue;
					}
					else
					{
						var_04.var_563C = undefined;
					}
				}
			}
		}

		if(isdefined(self.var_86AF))
		{
			var_06 = self.var_86AF;
		}
		else if(isdefined(var_02) && isdefined(var_02.speed))
		{
			var_06 = var_02.speed * 17.6;
		}
		else
		{
			var_06 = var_00;
		}

		for(;;)
		{
			var_07 = var_06;
			if(isdefined(level.var_86B2))
			{
				var_07 = var_07 * level.var_86B2;
			}

			var_08 = var_02.var_2E6 - var_01;
			var_09 = var_07 * 0.05;
			if(length(var_08) < var_09)
			{
				break;
			}

			var_01 = var_01 + vectornormalize(var_08) * var_09;
			self veh_helisetgoal(var_01,var_07,var_07,var_07,0,(0,0,0),0,0,0,1,0,0,0);
			wait(0.05);
		}

		wait(0.05);
		while(self.var_86A9.size == 1)
		{
			wait(0.05);
		}
	}
}

//Function Number: 49
lib_A5FA::func_86A6()
{
	self endon("death");
	self endon("stop_snake_control");
	var_00 = 175;
	self veh_helisetgoal(self.var_2E6 + (0,0,156),var_00,var_00,var_00,0,(0,0,0),0,0,0,1,0,0,0);
	wait(3);
	self veh_helisetgoal(level.var_31D.var_2E6,var_00,var_00,var_00,0,(0,0,0),0,0,0,1,0,0,0);
	var_01 = self.health;
	while(distance(self.var_2E6,level.var_31D.var_2E6 > 195))
	{
		if(self.health != self.var_4CF5)
		{
			foreach(var_03 in self.var_38E4)
			{
				var_03 delete();
			}

			self delete();
		}
	}

	level.var_31D dodamage(25,self.var_2E6);
	thread lib_A5FA::func_86A0();
}

//Function Number: 50
lib_A5FA::func_2DBC(param_00)
{
	self notify("draw_line_from_self_to_origin");
	self endon("draw_line_from_self_to_origin");
	self endon("death");
	wait(0.05);
}

//Function Number: 51
lib_A5FA::func_8695(param_00,param_01)
{
	if(isdefined(param_01) && isdefined(param_01.target))
	{
		var_02 = common_scripts\utility::getstructarray(param_01.target,"targetname");
		var_03 = common_scripts\utility::random(var_02);
		if(common_scripts\utility::array_contains(param_00,param_01))
		{
			self.var_24F4 = 1;
			return var_03;
		}
	}

	if(!common_scripts\utility::array_contains(param_00,param_01))
	{
		self.var_24F4 = 0;
		return common_scripts\utility::getclosest(self.var_2E6,param_00);
	}

	var_04 = 0.25;
	var_05 = 2;
	var_06 = 0.001;
	var_07 = 2;
	var_08 = 0;
	var_09 = 1;
	var_0A = 0.003;
	var_0B = 10;
	var_0C = 1500;
	var_0D = anglestoforward(level.var_31D method_8036());
	var_0E = undefined;
	var_0F = undefined;
	foreach(var_11 in param_00)
	{
		if(isdefined(var_11.target))
		{
			continue;
		}

		if(var_11.var_2E6 == param_01.var_2E6)
		{
			continue;
		}

		var_12 = randomfloat(var_04);
		var_13 = vectornormalize(lib_A571::func_3D3C());
		var_14 = var_11.var_2E6 - self.var_2E6;
		var_15 = vectornormalize(var_14);
		var_12 = var_12 + vectordot(var_13,var_15) + 1 / 2 * var_05;
		var_16 = var_11.var_2E6 - level.var_31D.var_2E6;
		var_17 = vectornormalize(var_16);
		var_12 = var_12 + vectordot(var_17,var_0D) + 1 / 2 * var_07;
		var_12 = var_12 - distance(param_01.var_2E6,var_11.var_2E6) * var_06;
		var_12 = var_12 - distance(level.var_31D.var_2E6,var_11.var_2E6) * var_08;
		var_12 = var_12 + vectorcross(vectornormalize(self.var_86AA - self.var_2E6),var_15)[2] * var_09;
		if(isdefined(self.var_86A5))
		{
			var_12 = var_12 - distance(self.var_86A5,var_11.var_2E6) * var_0A;
		}

		if(isdefined(param_01) && isdefined(param_01.var_A2F0) && param_01.var_A2F0 == var_11 && gettime() - param_01.var_A2F1 < var_0C)
		{
			var_12 = var_12 + randomfloat(var_0B);
		}

		if((!isdefined(var_0F) || var_12 > var_0F) && sighttracepassed(self.var_2E6,var_11.var_2E6,0,self))
		{
			var_0F = var_12;
			var_0E = var_11;
		}

		var_11.var_5551 = var_12;
	}

	if(!isdefined(var_0E))
	{
		var_0E = common_scripts\utility::random(param_00);
	}

	if(isdefined(param_01))
	{
		param_01.var_A2F0 = var_0E;
		param_01.var_A2F1 = gettime();
	}

	self.var_24F4 = 0;
	return var_0E;
}

//Function Number: 52
lib_A5FA::func_8699(param_00)
{
	self.var_86B4 = common_scripts\utility::array_removeundefined(self.var_86B4);
	foreach(var_02 in self.var_86B4)
	{
		var_02 thread lib_A5FA::func_86A7(param_00);
	}

	while(isdefined(param_00))
	{
		param_00 waittill("death");
	}

	if(isdefined(self))
	{
		lib_A5FA::func_1E80();
	}
}

//Function Number: 53
lib_A5FA::func_86A7(param_00)
{
	self notify("stop_snake_control");
	self endon("death");
	self endon("stop_snake_control");
	var_01 = 50;
	var_02 = 47;
	var_03 = 195;
	var_04 = 85;
	var_05 = 117;
	var_06 = 270;
	var_07 = 300;
	var_08 = squared(var_03 + var_05);
	var_09 = 3.141593;
	var_0A = sqrt(squared(var_02 * var_03 + var_05 * var_09 / 180) + squared(var_04 * var_05 * var_09 / 180));
	var_0A = var_0A * 3;
	var_0B = var_0A / 17.6;
	var_0C = param_00.var_2E6;
	while(distancesquared(self.var_2E6,var_0C) > var_08)
	{
		if(isdefined(param_00))
		{
			var_0C = param_00.var_2E6;
		}

		self veh_helisetgoal(var_0C,var_01,var_01,var_01,0,(0,0,0),0,0,0,1,0,0,0);
		wait(0.05);
	}

	var_0D = randomfloat(60);
	if(common_scripts\utility::cointoss())
	{
		var_0E = 180;
	}
	else
	{
		var_0E = 0;
	}

	for(;;)
	{
		if(isdefined(param_00))
		{
			var_0C = param_00.var_2E6;
		}

		var_0F = gettime() * 0.001 - var_0D;
		var_10 = var_02 * var_0F;
		var_11 = angleclamp360(var_04 * var_0F + var_0E);
		if(var_11 > var_06 && var_11 < var_07)
		{
			if(isdefined(param_00))
			{
				param_00.godmode = 0;
				param_00 dodamage(100,self.var_2E6);
			}

			lib_A5FA::func_8694();
			if(self.var_38E4.var_1525.size == 0)
			{
				self delete();
				return;
			}
		}

		var_12 = (cos(var_10),sin(var_10),0);
		var_13 = var_0C + var_12 * var_03 + cos(var_11) * var_05 + (0,0,sin(var_11) * var_05);
		self veh_helisetgoal(var_13,var_0B,var_0B,var_0B,0,(0,0,0),0,0,0,1,0,0,0);
		wait(0.05);
	}
}

//Function Number: 54
lib_A5FA::func_8694()
{
	self.var_38E4.var_1525 = common_scripts\utility::array_removeundefined(self.var_38E4.var_1525);
	if(self.var_38E4.var_1525.size != 0)
	{
		self.var_38E4.var_1525[self.var_38E4.var_1525.size - 1] lib_A5FA::func_151F();
	}
}

//Function Number: 55
lib_A5FA::func_151F()
{
	if(randomfloat(1) < 0.1)
	{
		playfx(common_scripts\utility::getfx("drone_death_explode1"),self.var_2E6);
	}

	self delete();
}