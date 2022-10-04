/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42357.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A575::func_4E20()
{
	if(!isdefined(level.var_8882))
	{
		precacherumble("damage_heavy");
		precacheshader("dpad_icon_sonic_blast");
		precacheshader("dpad_icon_sonic_blast_off");
		precachestring(&"SONICAOE_READY");
		precachestring(&"SONICAOE_NOTREADY");
		lib_A59A::func_764("Sonic_AOE_Ready",&"SONICAOE_READY",::lib_A575::func_0660);
		lib_A59A::func_764("Sonic_AOE_NotReady",&"SONICAOE_NOTREADY");
		level._effect["sonic_blast"] = loadfx("vfx/map/greece/greece_sonic_charge_burst");
		level.var_8882 = 0;
		level.var_8881 = 0;
	}
}

//Function Number: 2
lib_A575::func_3118(param_00)
{
	level notify("DisableSonicAoE");
	level endon("DisableSonicAoE");
	if(!isdefined(param_00))
	{
		param_00 = 2;
	}

	level.var_31D notifyonplayercommand("flash_aoe","+actionslot " + param_00);
	for(;;)
	{
		var_01 = 0;
		lib_A575::func_9AD5();
		level.var_8882 = 1;
		while(!var_01)
		{
			level.var_31D waittill("flash_aoe");
			var_01 = lib_A561::func_1323(1);
			if(!var_01)
			{
				wait(0.5);
			}
		}

		level.var_31D setviewkickscale(0.45);
		level.var_31D setweaponhudiconoverride("actionslot" + param_00,"dpad_icon_sonic_blast_off");
		lib_A5DE::snd_message("start_sonic_attack_mix");
		level notify("SonicAoEStarted");
		lib_A5DE::snd_message("sonic_blast");
		level.var_8881 = 1;
		earthquake(0.65,0.6,level.var_31D.var_2E6,128);
		physicsexplosionsphere(level.var_31D.var_2E6,512,512,1);
		level.var_31D playrumbleonentity("damage_heavy");
		level.var_31D thread lib_A575::func_066C();
		for(var_02 = 0;var_02 < 7;var_02++)
		{
			earthquake(0.25,0.3,level.var_31D.var_2E6,128);
			var_03 = level.var_31D.var_2E6 + (0,0,24) + anglestoforward(level.var_31D.var_41) * 64;
			playfx(level._effect["sonic_blast"],var_03,anglestoforward(level.var_31D.var_41),anglestoup(level.var_31D.var_41));
			lib_A5DE::snd_message("sonic_blast_aftershock");
			glassradiusdamage(level.var_31D.var_2E6,512,100,100);
			var_04 = getentarray("SonicAoECanDamage","script_noteworthy");
			var_05 = lib_A59A::func_3ECD(level.var_31D.var_2E6,var_04,512);
			foreach(var_07 in var_05)
			{
				var_07 notify("SonicAoEDamage");
			}

			var_09 = [];
			var_09 = function_00D6("axis","neutral");
			var_0A = common_scripts\utility::get_array_of_closest(level.var_31D.var_2E6,var_09,undefined,undefined,512,0);
			if(var_0A.size > 0)
			{
				foreach(var_0C in var_0A)
				{
					if(!isdefined(var_0C))
					{
						continue;
					}

					if(!isalive(var_0C))
					{
						continue;
					}

					if(isdefined(var_0C.var_4BB8))
					{
						continue;
					}

					if(!isdefined(var_0C.var_512A))
					{
						var_0C thread lib_A575::func_94A4();
					}

					var_0D = var_0C lib_A575::func_3E7C();
					if(isdefined(var_0D))
					{
						var_0C thread [[ var_0D ]]();
					}

					wait(randomfloatrange(0.05,0.09));
				}
			}

			wait(randomfloatrange(1,1.25));
		}

		lib_A5DE::snd_message("sonic_blast_done");
		level.var_31D setviewkickscale(1);
		level.var_8881 = 0;
		level.var_8882 = 0;
		wait(0.5);
	}
}

//Function Number: 3
lib_A575::func_94A4()
{
	if(!isdefined(self.var_512A))
	{
		self.var_512A = 1;
	}

	wait(4);
	self.var_512A = undefined;
}

//Function Number: 4
lib_A575::func_3E7C()
{
	if(isdefined(self.var_887A))
	{
		return self.var_887A;
	}
	else if(self.inliveplayerkillstreak == "axis")
	{
		return ::lib_A575::func_066E;
	}

	return ::lib_A575::func_066D;
}

//Function Number: 5
lib_A575::func_066E()
{
	var_00 = common_scripts\utility::isflashed();
	if(!var_00)
	{
		if(isdefined(self.var_8880))
		{
			self method_8141();
		}

		lib_A59A::func_38A9(4);
	}
}

//Function Number: 6
lib_A575::func_066D()
{
	self endon("death");
	self.var_50DF = 1;
	self method_8141();
	wait(randomfloatrange(0.1,0.2));
	thread lib_A575::func_05AA();
}

//Function Number: 7
lib_A575::func_05AA()
{
	self endon("death");
	var_00 = getnodesinradiussorted(self.var_2E6,256,128,32);
	foreach(var_02 in var_00)
	{
		if(lib_A59A::func_6D3A(256,var_02.var_2E6))
		{
			var_00 = common_scripts\utility::array_remove(var_00,var_02);
		}
	}

	var_04 = var_00[var_00.size - 1];
	if(isdefined(var_04))
	{
		lib_A59A::func_7E45(var_04);
		self waittill("goal");
	}
}

//Function Number: 8
lib_A575::func_066C()
{
	level notify("_StunAssaultDrones");
	level endon("_StunAssaultDrones");
	self endon("death");
	while(level.var_8881)
	{
		wait(0.05);
		if(!isdefined(level.flying_attack_drones) || level.flying_attack_drones.size == 0)
		{
			continue;
		}

		foreach(var_01 in level.flying_attack_drones)
		{
			if(!isdefined(var_01) || distance2dsquared(var_01.var_2E6,level.var_31D.var_2E6) > squared(1024))
			{
				continue;
			}

			var_01 notify("stun_drone");
		}
	}
}

//Function Number: 9
lib_A575::func_065F()
{
	level.var_31D disableweapons();
	level.var_31D waittill("weapon_change");
	var_00 = lib_A59A::func_88CB("player_rig",level.var_31D.var_2E6);
	var_00 method_80A6(level.var_31D,"tag_origin",(0,0,0),(0,0,0),1);
	level.var_31D lib_A506::func_C24(var_00,"SonicAoE_On");
	level.var_31D enableweapons();
	var_00 unlink();
	var_00 delete();
}

//Function Number: 10
lib_A575::func_2B69()
{
	thread lib_A575::func_0589();
	thread lib_A575::func_058A();
}

//Function Number: 11
lib_A575::func_0589()
{
	level endon("DisableSonicAoE");
	level endon("DisableSonicAoEHints");
	for(;;)
	{
		wait(0.05);
		wait(30);
		if(level.var_8882 == 0 || level.var_8881 == 1)
		{
			continue;
		}

		var_00 = function_00D6("axis");
		var_00 = lib_A59A::func_CFF(var_00);
		if(isdefined(level.flying_attack_drones) && level.flying_attack_drones.size > 0)
		{
			var_00 = lib_A59A::func_CF2(var_00,level.flying_attack_drones);
		}

		var_01 = common_scripts\utility::getclosest(level.var_31D.var_2E6,var_00,512);
		if(isdefined(var_01))
		{
			lib_A59A::func_2B4E("Sonic_AOE_Ready",10,undefined,undefined,undefined,200);
		}
	}
}

//Function Number: 12
lib_A575::func_0660()
{
	return level.var_8881;
}

//Function Number: 13
lib_A575::func_058A()
{
	level endon("DisableSonicAoE");
	level endon("DisableSonicAoEHints");
	for(;;)
	{
		level.var_31D waittill("flash_aoe");
		if(level.var_8882 == 0)
		{
			lib_A59A::func_2B49("Sonic_AOE_NotReady",undefined,undefined,undefined,200);
		}

		wait(0.05);
	}
}

//Function Number: 14
lib_A575::func_2B26(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = 2;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	level notify("DisableSonicAoE");
	if(param_01 == 1)
	{
		level.var_31D setweaponhudiconoverride("actionslot" + param_00,"dpad_icon_sonic_blast_off");
		return;
	}

	level.var_31D setweaponhudiconoverride("actionslot" + param_00,"dpad_icon_sonic_blast_off");
}

//Function Number: 15
lib_A575::func_9AD5(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 2;
	}

	if(!lib_A561::func_6B02())
	{
		level.var_31D setweaponhudiconoverride("actionslot" + param_00,"none");
		return;
	}

	if(lib_A561::func_3D59() > 0)
	{
		level.var_31D setweaponhudiconoverride("actionslot" + param_00,"dpad_icon_sonic_blast");
		return;
	}

	level.var_31D setweaponhudiconoverride("actionslot" + param_00,"dpad_icon_sonic_blast_off");
}