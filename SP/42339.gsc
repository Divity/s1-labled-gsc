/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42339.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A563::main()
{
	level._effect["boost_dust"] = loadfx("vfx/smoke/jetpack_exhaust");
	level._effect["boost_dust_impact_ground"] = loadfx("vfx/smoke/jetpack_ground_impact_runner");
	precacherumble("damage_light");
	precacherumble("damage_heavy");
}

//Function Number: 2
lib_A563::func_30C9()
{
	if(!isdefined(self.var_4885) || self.var_4885 == 0)
	{
		self method_83B2(1);
		thread lib_A563::func_0CA4();
		self.var_4885 = 1;
		lib_A5DE::snd_message("boost_jump_enable");
		self.var_1420 = getdvarint("bg_fallDamageMinHeight",200);
		self.var_141E = getdvarint("bg_fallDamageMaxHeight",350);
		function_00D3("bg_fallDamageMinHeight",getdvarint("bg_highJumpFallDamageMinHeight",490));
		function_00D3("bg_fallDamageMaxHeight",getdvarint("bg_highJumpFallDamageMaxHeight",640));
	}
}

//Function Number: 3
lib_A563::func_2AAB()
{
	if(isdefined(self.var_4885) && self.var_4885)
	{
		self method_83B2(0);
		self notify("disable_high_jump");
		self.var_4885 = 0;
		lib_A5DE::snd_message("boost_jump_disable");
		function_00D3("bg_fallDamageMinHeight",self.var_1420);
		function_00D3("bg_fallDamageMaxHeight",self.var_141E);
	}
}

//Function Number: 4
lib_A563::func_30A7()
{
	lib_A563::func_30C9();
	self method_849E(1);
	self.var_1576 = 1;
}

//Function Number: 5
lib_A563::func_2A82()
{
	lib_A563::func_2AAB();
	self method_849E(0);
	self.var_1576 = 0;
}

//Function Number: 6
lib_A563::func_0CA4()
{
	self endon("death");
	self endon("disable_high_jump");
	var_00 = 0;
	var_01 = 0;
	var_02 = 0;
	var_03 = self method_83B4();
	var_04 = 0.2;
	var_05 = 0;
	var_06 = 1;
	var_07 = 0;
	for(;;)
	{
		var_08 = self method_83B4();
		if(isdefined(self.var_42FD) && self.var_42FD["connected"])
		{
			var_08 = 0;
		}

		if(var_08)
		{
			if(var_08 != var_03)
			{
				if(level.nextgen)
				{
					thread lib_A563::func_5A62();
				}

				var_02 = 1;
				var_05 = 0;
				var_06 = 1;
				if(!isdefined(self.var_4885) || !self.var_4885)
				{
				}
			}

			if(isdefined(self.var_4885) && self.var_4885)
			{
				var_06 = var_06 && self jumpbuttonpressed();
				if(var_06 && !var_07)
				{
					playfx(common_scripts\utility::getfx("boost_dust"),self.var_2E6,anglestoforward(self.var_41 + (-90,0,0)),anglestoup(self.var_41));
					lib_A5DE::snd_message("boost_jump_player");
					lib_A576::func_72D5();
					earthquake(0.15,0.3,self.var_2E6,300);
					level.var_31D playrumbleonentity("damage_light");
					thread lib_A563::func_60AD();
					var_07 = 1;
					var_05 = var_05 + 0.05;
				}
			}
		}

		if(!self isonground())
		{
			if(var_00 == 0)
			{
				var_01 = self.var_2E6[2];
			}

			var_00++;
		}
		else
		{
			if(var_00 > 5 && isdefined(self.var_4885) || self.var_4885)
			{
				var_09 = var_01 - self.var_2E6[2];
				if(var_07 == 1)
				{
					lib_A5DE::snd_message("boost_land_player",var_00);
					var_0A = var_09 / 500;
					var_0A = clamp(var_0A,0.2,0.4);
					earthquake(var_0A,0.6,self.var_2E6,300);
					if(var_0A > 0.2)
					{
						level.var_31D playrumbleonentity("damage_heavy");
					}
					else
					{
						level.var_31D playrumbleonentity("damage_light");
					}

					self notify("player_boost_land");
					var_07 = 0;
				}
				else if(var_09 > 200)
				{
					lib_A5DE::snd_message("boost_land_player",var_00);
					var_0A = var_09 / 500;
					var_0A = clamp(var_0A,0.2,0.4);
					earthquake(var_0A,0.6,self.var_2E6,300);
					level.var_31D playrumbleonentity("damage_heavy");
				}
			}

			var_00 = 0;
		}

		var_03 = var_08;
		var_02 = 0;
		wait 0.05;
	}
}

//Function Number: 7
lib_A563::func_5A62()
{
	if(level.nextgen)
	{
		var_00 = getdvar("r_mbenable");
		var_01 = getdvar("r_mbVelocityScalar");
		function_00D3("r_mbEnable","2");
		function_00D3("r_mbVelocityScalar","1");
		wait(0.5);
		function_00D3("r_mbenable",var_00);
		function_00D3("r_mbVelocityScalar",var_01);
	}
}

//Function Number: 8
lib_A563::func_5A61()
{
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","0");
	}
}

//Function Number: 9
lib_A563::func_60AD()
{
	var_00 = self.var_2E6 + (0,0,64);
	var_01 = self.var_2E6 - (0,0,150);
	var_02 = bullettrace(var_00,var_01,0,undefined);
	var_03 = common_scripts\utility::getfx("boost_dust_impact_ground");
	var_00 = var_02["position"];
	var_04 = vectortoangles(var_02["normal"]);
	var_04 = var_04 + (90,0,0);
	var_05 = anglestoforward(var_04);
	var_06 = anglestoup(var_04);
	playfx(var_03,var_00,var_06,var_05);
}