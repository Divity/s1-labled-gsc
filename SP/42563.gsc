/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42563.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:51 PM
*******************************************************************/

//Function Number: 1
lib_A643::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("walker_tank",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A643::func_4D0D);
	lib_A59E::func_1868("tankblast_walker");
	lib_A59E::func_186E();
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("axis");
	precacheturret("enemy_walker_top_left_turret");
	precachemodel("vehicle_walker_tank_dstrypv");
	lib_A59E::func_183C(1);
	lib_A59E::func_184F(1);
	lib_A59E::func_1872("enemy_walker_belly_turret","TAG_TURRET_BELLY","vehicle_walker_tank_turret_belly",undefined,undefined,undefined,0,0,undefined);
	lib_A59E::func_1872("enemy_walker_top_left_turret","TAG_TURRET_TOP_LEFT","vehicle_walker_tank_turret_top_left",undefined,undefined,undefined,0,0,undefined);
	lib_A59E::func_1872("enemy_walker_top_right_turret","TAG_TURRET_TOP_RIGHT","vehicle_walker_tank_turret_top_right",undefined,undefined,undefined,0,0,undefined);
	lib_A59E::func_185C("enemy_walker_left_launcher","launcher_left","projectile_rpg7","rpg_guided",::lib_A643::func_562C,::lib_A643::func_562B);
	lib_A59E::func_185C("enemy_walker_right_launcher","launcher_right","projectile_rpg7","rpg_guided",::lib_A643::func_562C,::lib_A643::func_562B);
	if(param_02 == "script_vehicle_walker_tank_generic")
	{
		lib_A59E::func_1845(param_00,"vehicle_walker_tank_dstrypv",undefined,param_02);
		lib_A59E::func_1842("vfx/explosion/vehicle_walker_tank_explosion","TAG_DEATH_FX","exp_armor_vehicle");
	}

	setdvar("walker_tank_debug",0);
}

//Function Number: 2
lib_A643::func_4D0D()
{
	self method_8115(#animtree);
	lib_A643::func_4630();
	self.var_83C9 = 1500;
	self.var_1489 = 1500;
	if(self.var_7AE9 == "allies")
	{
		self.var_83C9 = 500;
	}

	self.var_5CAA = 1;
	thread lib_A643::func_263C();
}

//Function Number: 3
lib_A643::func_4630()
{
	thread lib_A641::func_9D5C(1.5);
	thread lib_A641::func_9D5B(3,5,3,5);
	thread lib_A641::func_9D56();
	thread lib_A643::func_822C();
	thread lib_A643::func_8230();
}

//Function Number: 4
lib_A643::func_8230()
{
	self.var_5CC7 = [];
	self.var_5CCA = [];
	self.var_5CC7[0] = "tag_missile_1_L";
	self.var_5CC7[1] = "tag_missile_2_L";
	self.var_5CC7[2] = "tag_missile_3_L";
	self.var_5CC7[3] = "tag_missile_4_L";
	self.var_5CC7[4] = "tag_missile_5_L";
	self.var_5CC7[5] = "tag_missile_6_L";
	self.var_5CC7[6] = "tag_missile_7_L";
	self.var_5CC7[7] = "tag_missile_8_L";
	self.var_5CC7[8] = "tag_missile_9_L";
	self.var_5CC7[9] = "tag_missile_10_L";
	self.var_5CC7[10] = "tag_missile_1_R";
	self.var_5CC7[11] = "tag_missile_2_R";
	self.var_5CC7[12] = "tag_missile_3_R";
	self.var_5CC7[13] = "tag_missile_4_R";
	self.var_5CC7[14] = "tag_missile_5_R";
	self.var_5CC7[15] = "tag_missile_6_R";
	self.var_5CC7[16] = "tag_missile_7_R";
	self.var_5CC7[17] = "tag_missile_8_R";
	self.var_5CC7[18] = "tag_missile_9_R";
	self.var_5CC7[19] = "tag_missile_10_R";
	thread lib_A63F::func_7312();
}

//Function Number: 5
lib_A643::func_822C()
{
	waittillframeend;
	waittillframeend;
	var_00 = 0;
	foreach(var_02 in self.mgturret)
	{
		var_02 thread lib_A643::func_A126(var_00);
		var_02 thread lib_A643::func_8E7F(self);
		var_00++;
	}
}

//Function Number: 6
lib_A643::func_7E37(param_00,param_01)
{
	lib_A640::func_7E37(param_00,param_01);
}

//Function Number: 7
lib_A643::func_2AA3(param_00)
{
	lib_A640::func_2AA3(param_00);
}

//Function Number: 8
lib_A643::func_30C1(param_00)
{
	lib_A640::func_30C1(param_00);
}

//Function Number: 9
lib_A643::func_2AE2(param_00)
{
	lib_A640::func_2AE2(param_00);
}

//Function Number: 10
lib_A643::func_30FD(param_00)
{
	lib_A640::func_30FD(param_00);
}

//Function Number: 11
lib_A643::func_562A()
{
	lib_A640::func_7ED0(1,-2);
	lib_A640::func_7ED0(1,-3);
}

//Function Number: 12
lib_A643::func_5629()
{
	lib_A640::func_7ED0(0,-2);
	lib_A640::func_7ED0(0,-3);
}

//Function Number: 13
lib_A643::func_30FB(param_00)
{
	lib_A640::func_7ED0(1,param_00);
}

//Function Number: 14
lib_A643::func_2AE0(param_00)
{
	lib_A640::func_7ED0(0,param_00);
}

//Function Number: 15
lib_A643::func_37BB(param_00,param_01)
{
	lib_A63F::func_37BB(param_00,param_01);
}

//Function Number: 16
lib_A643::func_A126(param_00)
{
	self endon("death");
	self endon("stop_vehicle_turret_ai");
	for(;;)
	{
		waittillframeend;
		if(isdefined(self.var_2ADD) && self.var_2ADD)
		{
			self.var_929 = undefined;
			wait 0.05;
			continue;
		}

		if(isdefined(self.var_92A))
		{
			if(!lib_A641::func_509A(self.var_92A))
			{
				self.var_92A = undefined;
			}
			else
			{
				self.var_929 = self.var_92A;
			}
		}

		if(!isdefined(self.var_929))
		{
			var_01 = common_scripts\utility::get_enemy_team(self.var_7AE9);
			var_02 = function_00D6(var_01);
			if(isenemyteam(level.var_31D.inliveplayerkillstreak,self.var_7AE9))
			{
				var_02 = common_scripts\utility::array_add(var_02,level.var_31D);
			}

			var_02 = sortbydistance(var_02,self.var_2E6);
			var_03 = 0;
			for(var_04 = 0;var_04 < var_02.size;var_04++)
			{
				if(!isdefined(var_02[var_04].var_1E20))
				{
					self.var_929 = var_02[var_04];
					break;
				}
			}

			if(!isdefined(self.var_929))
			{
				for(var_04 = 0;var_04 < var_02.size;var_04++)
				{
					self.var_929 = var_02[var_04];
					break;
				}
			}
		}

		if(isdefined(self.var_929) && !isdefined(self.var_2AA3) || !self.var_2AA3)
		{
			lib_A643::func_4C32(self.var_929);
			lib_A643::func_37A1(self.var_929);
			continue;
		}

		wait(1);
	}
}

//Function Number: 17
lib_A643::func_4C32(param_00)
{
	if(!isdefined(param_00.var_1E20))
	{
		param_00.var_1E20 = 1;
		return;
	}

	param_00.var_1E20++;
}

//Function Number: 18
lib_A643::func_2758(param_00)
{
	if(!isdefined(param_00.var_1E20) || param_00.var_1E20 == 0)
	{
		return;
	}

	if(param_00.var_1E20 == 1)
	{
		param_00.var_1E20 = undefined;
		return;
	}

	param_00.var_1E20--;
}

//Function Number: 19
lib_A643::func_37A1(param_00)
{
	self endon("death");
	self endon("stop_vehicle_turret_ai");
	self endon("mgturret_acquire_new_target");
	var_01 = 2;
	var_02 = 4;
	var_03 = randomfloatrange(var_01,var_02);
	var_04 = 2;
	var_05 = 5;
	var_06 = randomfloatrange(var_04,var_05);
	var_07 = 0;
	self setturretteam(self.var_7AE9);
	self setmode("manual");
	self settargetentity(param_00);
	self turretfireenable();
	self startfiring();
	while(var_07 < var_03 && lib_A641::func_509A(param_00))
	{
		var_07 = var_07 + 0.05;
		wait(0.05);
	}

	self stopfiring();
	self turretfiredisable();
	self cleartargetentity();
	if(lib_A641::func_509A(param_00))
	{
		lib_A643::func_2758(param_00);
	}

	wait(var_06);
	self notify("mgturret_acquire_new_target");
}

//Function Number: 20
lib_A643::func_562C()
{
	var_00 = 1;
	self method_8144(%walker_launcher_up_left_add,1,0,1);
	self method_8117(%walker_launcher_up_left_add,1);
	self method_8144(%walker_launcher_up_right_add,1,0,1);
	self method_8117(%walker_launcher_up_right_add,1);
	self method_814C(%walker_launcher_left_root,1,var_00,1);
	self method_814C(%walker_launcher_right_root,1,var_00,1);
	wait(var_00);
}

//Function Number: 21
lib_A643::func_562B()
{
	var_00 = 1;
	self method_8144(%walker_launcher_up_left_add,1,0,1);
	self method_8117(%walker_launcher_up_left_add,1);
	self method_8144(%walker_launcher_up_right_add,1,0,1);
	self method_8117(%walker_launcher_up_right_add,1);
	self method_814C(%walker_launcher_left_root,0.01,var_00,1);
	self method_814C(%walker_launcher_right_root,0.01,var_00,1);
	wait(var_00);
}

//Function Number: 22
lib_A643::func_263C()
{
	self waittill("death");
	if(isdefined(self))
	{
		self detachall();
	}
}

//Function Number: 23
lib_A643::func_8E7F(param_00)
{
	param_00 waittill("stop_vehicle_turret_ai");
	self stopfiring();
	self turretfiredisable();
	self cleartargetentity();
}