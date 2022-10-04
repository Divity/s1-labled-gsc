/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42285.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 111
 * Decompile Time: 70234 ms
 * Timestamp: 4/20/2022 8:23:16 PM
*******************************************************************/

//Function Number: 1
lib_A52D::func_800A(param_00)
{
	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}

	if(!isdefined(param_00) || param_00 == 0)
	{
		if(isdefined(level.gameskill))
		{
			return;
		}

		if(!isdefined(level.var_254D))
		{
			level.var_254D = ::lib_A52D::func_74CE;
		}

		level.var_4223 = ::lib_A52D::func_3093;
		level.var_4222 = ::lib_A52D::func_3093;
		level.var_422B = ::lib_A52D::func_3093;
		lib_A59A::set_console_status();
		foreach(var_02 in level.var_328)
		{
			var_02 lib_A59A::func_32DC("player_has_red_flashing_overlay");
			var_02 lib_A59A::func_32DC("player_is_invulnerable");
			var_02 lib_A59A::func_32DC("player_zero_attacker_accuracy");
			var_02 lib_A59A::func_32DC("player_no_auto_blur");
			var_02 lib_A59A::func_32DC("near_death_vision_enabled");
			var_02 lib_A59A::func_32DD("near_death_vision_enabled");
			var_02.var_443E = spawnstruct();
			var_02 lib_A52D::func_4D4E();
			var_02.var_7 = spawnstruct();
			var_02.var_257D = [];
			var_02 lib_A565::func_4D5F();
			var_02 lib_A59A::func_32DC("global_hint_in_use");
			var_02.connectedpostgame = [];
			if(!isdefined(var_02.var_130B))
			{
				var_02.var_130B = 0;
			}

			var_02.disabledweapon = 0;
			var_02.disabledweaponswitch = 0;
			var_02.disabledusability = 0;
		}

		level.var_2A62[0] = "easy";
		level.var_2A62[1] = "normal";
		level.var_2A62[2] = "hardened";
		level.var_2A62[3] = "veteran";
		level.var_2A61["easy"] = &"GAMESKILL_EASY";
		level.var_2A61["normal"] = &"GAMESKILL_NORMAL";
		level.var_2A61["hardened"] = &"GAMESKILL_HARDENED";
		level.var_2A61["veteran"] = &"GAMESKILL_VETERAN";
		thread lib_A52D::func_3BFE();
	}

	setdvarifuninitialized("autodifficulty_playerDeathTimer",0);
	anim.var_76A1 = 0.5;
	anim.var_A0FC = 0.8;
	setdvar("autodifficulty_frac",0);
	level.var_2A60 = [];
	foreach(var_02 in level.var_328)
	{
		var_02 lib_A52D::func_4D62();
		var_02 thread lib_A52D::func_4C38();
	}

	level.var_5BCB = 8;
	level.var_5BCA = 16;
	level.var_2A5F["playerGrenadeBaseTime"]["easy"] = 40000;
	level.var_2A5F["playerGrenadeBaseTime"]["normal"] = 35000;
	level.var_2A5F["playerGrenadeBaseTime"]["hardened"] = 25000;
	level.var_2A5F["playerGrenadeBaseTime"]["veteran"] = 25000;
	level.var_2A5F["playerGrenadeRangeTime"]["easy"] = 20000;
	level.var_2A5F["playerGrenadeRangeTime"]["normal"] = 15000;
	level.var_2A5F["playerGrenadeRangeTime"]["hardened"] = 10000;
	level.var_2A5F["playerGrenadeRangeTime"]["veteran"] = 10000;
	level.var_2A5F["playerDoubleGrenadeTime"]["easy"] = 3600000;
	level.var_2A5F["playerDoubleGrenadeTime"]["normal"] = 150000;
	level.var_2A5F["playerDoubleGrenadeTime"]["hardened"] = 90000;
	level.var_2A5F["playerDoubleGrenadeTime"]["veteran"] = 90000;
	level.var_2A5F["double_grenades_allowed"]["easy"] = 0;
	level.var_2A5F["double_grenades_allowed"]["normal"] = 1;
	level.var_2A5F["double_grenades_allowed"]["hardened"] = 1;
	level.var_2A5F["double_grenades_allowed"]["veteran"] = 1;
	level.var_2A5F["threatbias"]["easy"] = 100;
	level.var_2A5F["threatbias"]["normal"] = 150;
	level.var_2A5F["threatbias"]["hardened"] = 200;
	level.var_2A5F["threatbias"]["veteran"] = 400;
	level.var_2A5F["base_enemy_accuracy"]["easy"] = 0.9;
	level.var_2A5F["base_enemy_accuracy"]["normal"] = 1;
	level.var_2A5F["base_enemy_accuracy"]["hardened"] = 1.15;
	level.var_2A5F["base_enemy_accuracy"]["veteran"] = 1.15;
	level.var_2A5F["accuracyDistScale"]["easy"] = 1;
	level.var_2A5F["accuracyDistScale"]["normal"] = 1;
	level.var_2A5F["accuracyDistScale"]["hardened"] = 0.6;
	level.var_2A5F["accuracyDistScale"]["veteran"] = 0.8;
	level.var_2A5F["min_sniper_burst_delay_time"]["easy"] = 3;
	level.var_2A5F["min_sniper_burst_delay_time"]["normal"] = 2;
	level.var_2A5F["min_sniper_burst_delay_time"]["hardened"] = 1.5;
	level.var_2A5F["min_sniper_burst_delay_time"]["veteran"] = 1.1;
	level.var_2A5F["max_sniper_burst_delay_time"]["easy"] = 4;
	level.var_2A5F["max_sniper_burst_delay_time"]["normal"] = 3;
	level.var_2A5F["max_sniper_burst_delay_time"]["hardened"] = 2;
	level.var_2A5F["max_sniper_burst_delay_time"]["veteran"] = 1.5;
	level.var_2A5F["dog_health"]["easy"] = 0.25;
	level.var_2A5F["dog_health"]["normal"] = 0.75;
	level.var_2A5F["dog_health"]["hardened"] = 1;
	level.var_2A5F["dog_health"]["veteran"] = 1;
	level.var_2A5F["dog_presstime"]["easy"] = 415;
	level.var_2A5F["dog_presstime"]["normal"] = 375;
	level.var_2A5F["dog_presstime"]["hardened"] = 250;
	level.var_2A5F["dog_presstime"]["veteran"] = 225;
	level.var_2A5F["dog_hits_before_kill"]["easy"] = 2;
	level.var_2A5F["dog_hits_before_kill"]["normal"] = 1;
	level.var_2A5F["dog_hits_before_kill"]["hardened"] = 0;
	level.var_2A5F["dog_hits_before_kill"]["veteran"] = 0;
	level.var_2A5F["pain_test"]["easy"] = ::lib_A52D::func_0B07;
	level.var_2A5F["pain_test"]["normal"] = ::lib_A52D::func_0B07;
	level.var_2A5F["pain_test"]["hardened"] = ::lib_A52D::func_6646;
	level.var_2A5F["pain_test"]["veteran"] = ::lib_A52D::func_6646;
	level.var_2A5F["missTimeConstant"]["easy"] = 1;
	level.var_2A5F["missTimeConstant"]["normal"] = 0.05;
	level.var_2A5F["missTimeConstant"]["hardened"] = 0;
	level.var_2A5F["missTimeConstant"]["veteran"] = 0;
	level.var_2A5F["missTimeDistanceFactor"]["easy"] = 0.0008;
	level.var_2A5F["missTimeDistanceFactor"]["normal"] = 0.0001;
	level.var_2A5F["missTimeDistanceFactor"]["hardened"] = 5E-05;
	level.var_2A5F["missTimeDistanceFactor"]["veteran"] = 0;
	level.var_2A5F["flashbangedInvulFactor"]["easy"] = 0.25;
	level.var_2A5F["flashbangedInvulFactor"]["normal"] = 0;
	level.var_2A5F["flashbangedInvulFactor"]["hardened"] = 0;
	level.var_2A5F["flashbangedInvulFactor"]["veteran"] = 0;
	level.var_2A5F["player_criticalBulletDamageDist"]["easy"] = 0;
	level.var_2A5F["player_criticalBulletDamageDist"]["normal"] = 0;
	level.var_2A5F["player_criticalBulletDamageDist"]["hardened"] = 0;
	level.var_2A5F["player_criticalBulletDamageDist"]["veteran"] = 0;
	level.var_2A5F["player_deathInvulnerableTime"]["easy"] = 4000;
	level.var_2A5F["player_deathInvulnerableTime"]["normal"] = 2500;
	level.var_2A5F["player_deathInvulnerableTime"]["hardened"] = 600;
	level.var_2A5F["player_deathInvulnerableTime"]["veteran"] = 100;
	level.var_2A5F["invulTime_preShield"]["easy"] = 0.6;
	level.var_2A5F["invulTime_preShield"]["normal"] = 0.5;
	level.var_2A5F["invulTime_preShield"]["hardened"] = 0.3;
	level.var_2A5F["invulTime_preShield"]["veteran"] = 0;
	level.var_2A5F["invulTime_onShield"]["easy"] = 1.6;
	level.var_2A5F["invulTime_onShield"]["normal"] = 1;
	level.var_2A5F["invulTime_onShield"]["hardened"] = 0.5;
	level.var_2A5F["invulTime_onShield"]["veteran"] = 0.25;
	level.var_2A5F["invulTime_postShield"]["easy"] = 0.5;
	level.var_2A5F["invulTime_postShield"]["normal"] = 0.4;
	level.var_2A5F["invulTime_postShield"]["hardened"] = 0.3;
	level.var_2A5F["invulTime_postShield"]["veteran"] = 0;
	level.var_2A5F["playerHealth_RegularRegenDelay"]["easy"] = 4000;
	level.var_2A5F["playerHealth_RegularRegenDelay"]["normal"] = 4000;
	level.var_2A5F["playerHealth_RegularRegenDelay"]["hardened"] = 3000;
	level.var_2A5F["playerHealth_RegularRegenDelay"]["veteran"] = 1200;
	level.var_2A5F["worthyDamageRatio"]["easy"] = 0;
	level.var_2A5F["worthyDamageRatio"]["normal"] = 0.1;
	level.var_2A5F["worthyDamageRatio"]["hardened"] = 0.3;
	level.var_2A5F["worthyDamageRatio"]["veteran"] = 0.3;
	level.var_2A5F["playerDifficultyHealth"]["easy"] = 475;
	level.var_2A5F["playerDifficultyHealth"]["normal"] = 275;
	level.var_2A5F["playerDifficultyHealth"]["hardened"] = 165;
	level.var_2A5F["playerDifficultyHealth"]["veteran"] = 115;
	level.var_2A5F["longRegenTime"]["easy"] = 5000;
	level.var_2A5F["longRegenTime"]["normal"] = 5000;
	level.var_2A5F["longRegenTime"]["hardened"] = 3200;
	level.var_2A5F["longRegenTime"]["veteran"] = 3200;
	level.var_2A5F["healthOverlayCutoff"]["easy"] = 0.02;
	level.var_2A5F["healthOverlayCutoff"]["normal"] = 0.02;
	level.var_2A5F["healthOverlayCutoff"]["hardened"] = 0.02;
	level.var_2A5F["healthOverlayCutoff"]["veteran"] = 0.02;
	level.var_2A5F["health_regenRate"]["easy"] = 0.02;
	level.var_2A5F["health_regenRate"]["normal"] = 0.02;
	level.var_2A5F["health_regenRate"]["hardened"] = 0.02;
	level.var_2A5F["health_regenRate"]["veteran"] = 0.02;
	level.var_2A5F["explosivePlantTime"]["easy"] = 10;
	level.var_2A5F["explosivePlantTime"]["normal"] = 10;
	level.var_2A5F["explosivePlantTime"]["hardened"] = 5;
	level.var_2A5F["explosivePlantTime"]["veteran"] = 5;
	level.var_2A5F["player_downed_buffer_time"]["normal"] = 2;
	level.var_2A5F["player_downed_buffer_time"]["hardened"] = 1.5;
	level.var_2A5F["player_downed_buffer_time"]["veteran"] = 0;
	level.var_55C9 = 0;
	function_00D3("player_meleeDamageMultiplier",0.2666667);
	if(isdefined(level.var_2545))
	{
		[[ level.var_2545 ]]();
	}

	if(lib_A52D::func_21C6())
	{
		lib_A52D::func_592F();
	}

	lib_A52D::func_9B19();
	lib_A52D::func_9AEA();
	setdvar("autodifficulty_original_setting",level.gameskill);
}

//Function Number: 2
lib_A52D::func_4D4E()
{
	self.var_443E.var_7922 = [];
	var_00 = ["bottom","left","right"];
	var_01 = ["bloodsplat","dirt"];
	foreach(var_03 in var_01)
	{
		foreach(var_05 in var_00)
		{
			self.var_443E.var_7922[var_03][var_05] = 0;
			self.var_443E.var_7922[var_03 + "_count"][var_05] = 0;
		}
	}
}

//Function Number: 3
lib_A52D::func_21C3()
{
	function_00D3("player_meleeDamageMultiplier",0.26);
}

//Function Number: 4
lib_A52D::func_886E()
{
	if(!lib_A59A::func_5084())
	{
		function_00D3("player_deathInvulnerableToMelee","1");
		function_00D3("ai_accuracy_attackercountDecrease","0.6");
	}

	level.var_2A5F["playerHealth_RegularRegenDelay"]["normal"] = 2000;
	level.var_2A5F["playerHealth_RegularRegenDelay"]["hardened"] = 2000;
	level.var_2A5F["playerHealth_RegularRegenDelay"]["veteran"] = 900;
	if(!lib_A59A::func_5084())
	{
		level.var_2A5F["invulTime_onShield"]["normal"] = 2.5;
	}
	else
	{
		level.var_2A5F["invulTime_onShield"]["normal"] = 1.5;
	}

	level.var_2A5F["player_deathInvulnerableTime"]["normal"] = 3000;
	level.var_2A5F["player_deathInvulnerableTime"]["hardened"] = 1300;
	level.var_2A5F["player_deathInvulnerableTime"]["veteran"] = 800;
	level.var_2A5F["longRegenTime"]["normal"] = 4500;
	level.var_2A5F["longRegenTime"]["hardened"] = 4500;
	level.var_2A5F["longRegenTime"]["veteran"] = 4500;
	level.var_2A5F["playerDifficultyHealth"]["normal"] = 350;
	level.var_2A5F["playerDifficultyHealth"]["hardened"] = 205;
	level.var_2A5F["playerDifficultyHealth"]["veteran"] = 205;
	if(!lib_A59A::func_5084())
	{
		function_00D3("player_meleeDamageMultiplier",0.5);
		return;
	}

	function_00D3("player_meleeDamageMultiplier",0.26);
}

//Function Number: 5
lib_A52D::func_886D()
{
	level.var_2A5F["player_deathInvulnerableTime"]["normal"] = 2500;
	level.var_2A5F["player_deathInvulnerableTime"]["hardened"] = 1200;
	level.var_2A5F["player_deathInvulnerableTime"]["veteran"] = 200;
	var_00 = 1.35;
	level.var_2A5F["playerDifficultyHealth"]["normal"] = int(275 * var_00);
	level.var_2A5F["playerDifficultyHealth"]["hardened"] = int(165 * var_00);
	level.var_2A5F["playerDifficultyHealth"]["veteran"] = int(138);
}

//Function Number: 6
lib_A52D::func_592F()
{
	level.var_2A5F["player_deathInvulnerableTime"]["normal"] = 2500;
	level.var_2A5F["player_deathInvulnerableTime"]["hardened"] = 1000;
	var_00 = 1.25;
	level.var_2A5F["playerDifficultyHealth"]["normal"] = int(275 * var_00);
	level.var_2A5F["playerDifficultyHealth"]["hardened"] = int(165 * var_00);
}

//Function Number: 7
lib_A52D::func_9AEA()
{
	lib_A52D::func_7F77();
	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		level.var_328[var_00] lib_A52D::func_7F4B();
	}
}

//Function Number: 8
lib_A52D::func_7F4B()
{
	lib_A52D::func_7E0C();
}

//Function Number: 9
lib_A52D::func_7F77()
{
	var_00 = ::lib_A52D::func_3DCD;
	var_01 = lib_A52D::func_3E61(level.gameskill);
	anim.var_2CA3 = [[ var_00 ]]("dog_health",level.gameskill);
	anim.var_664C = level.var_2A5F["pain_test"][var_01];
	level.var_357E = level.var_2A5F["explosivePlantTime"][var_01];
	anim.var_5C33 = [[ var_00 ]]("min_sniper_burst_delay_time",level.gameskill);
	anim.var_5A14 = [[ var_00 ]]("max_sniper_burst_delay_time",level.gameskill);
	function_00D3("ai_accuracyDistScale",[[ var_00 ]]("accuracyDistScale",level.gameskill));
	if(lib_A59A::func_55DE())
	{
		level.var_6ADD = level.var_2A5F["player_downed_buffer_time"][var_01];
	}

	lib_A54E::func_7F4B();
}

//Function Number: 10
lib_A52D::func_9B19()
{
	foreach(var_01 in level.var_328)
	{
		if(lib_A59A::func_5084())
		{
			var_01.gameskill = 1;
			continue;
		}

		var_01.gameskill = var_01 lib_A59A::func_3E24();
	}

	level.gameskill = level.var_31D.gameskill;
	if(lib_A59A::func_5009() && level.var_6C58.gameskill > level.gameskill)
	{
		level.gameskill = level.var_6C58.gameskill;
	}

	level.var_8A42 = level.var_31D.gameskill;
	if(lib_A59A::func_5009() && level.var_6C58.gameskill < level.var_8A42)
	{
		level.var_8A42 = level.var_6C58.gameskill;
	}

	if(isdefined(level.var_39B7))
	{
		level.gameskill = level.var_39B7;
	}

	return level.gameskill;
}

//Function Number: 11
lib_A52D::func_3BFE()
{
	var_00 = level.gameskill;
	for(;;)
	{
		if(!isdefined(var_00))
		{
			wait(1);
			var_00 = level.gameskill;
			continue;
		}

		if(var_00 != lib_A52D::func_9B19())
		{
			var_00 = level.gameskill;
			lib_A52D::func_9AEA();
		}

		wait(1);
	}
}

//Function Number: 12
lib_A52D::func_3E61(param_00)
{
	return level.var_2A62[param_00];
}

//Function Number: 13
lib_A52D::func_06AF()
{
	return level.gameskill == getdvarint("autodifficulty_original_setting");
}

//Function Number: 14
lib_A52D::func_0C9F(param_00,param_01)
{
	self.var_443E.var_4FA9 = [[ param_00 ]]("invulTime_preShield",param_01);
	self.var_443E.var_4FA7 = [[ param_00 ]]("invulTime_onShield",param_01);
	self.var_443E.var_4FA8 = [[ param_00 ]]("invulTime_postShield",param_01);
	self.var_443E.playerhealth_regularregendelay = [[ param_00 ]]("playerHealth_RegularRegenDelay",param_01);
	self.var_443E.var_A34A = [[ param_00 ]]("worthyDamageRatio",param_01);
	self.var_4B2 = int([[ param_00 ]]("threatbias",param_01));
	self.var_443E.var_584C = [[ param_00 ]]("longRegenTime",param_01);
	self.var_443E.healthoverlaycutoff = [[ param_00 ]]("healthOverlayCutoff",param_01);
	self.var_443E.var_72D0 = [[ param_00 ]]("health_regenRate",param_01);
	self.var_443E.var_6A61 = [[ param_00 ]]("base_enemy_accuracy",param_01);
	lib_A52D::func_9ACB();
	self.var_443E.var_6CB0 = int([[ param_00 ]]("playerGrenadeBaseTime",param_01));
	self.var_443E.var_6CB1 = int([[ param_00 ]]("playerGrenadeRangeTime",param_01));
	self.var_443E.var_6C92 = int([[ param_00 ]]("playerDoubleGrenadeTime",param_01));
	self.var_443E.var_5C33 = [[ param_00 ]]("min_sniper_burst_delay_time",param_01);
	self.var_443E.var_5A14 = [[ param_00 ]]("max_sniper_burst_delay_time",param_01);
	self.var_443E.var_2CB5 = [[ param_00 ]]("dog_presstime",param_01);
	self.var_10B = int([[ param_00 ]]("player_deathInvulnerableTime",param_01));
	self.var_DF = int([[ param_00 ]]("player_criticalBulletDamageDist",param_01));
	self.var_100 = 100 / [[ param_00 ]]("playerDifficultyHealth",param_01);
}

//Function Number: 15
lib_A52D::func_9ACB()
{
	if(lib_A59A::func_32D7("player_zero_attacker_accuracy"))
	{
		return;
	}

	self.var_201 = self.var_130B;
	self.var_56 = self.var_443E.var_6A61;
}

//Function Number: 16
lib_A52D::func_0CA0(param_00,param_01)
{
	self.var_443E.var_5CE1 = [[ param_00 ]]("missTimeConstant",param_01);
	self.var_443E.var_5CE3 = [[ param_00 ]]("missTimeDistanceFactor",param_01);
	self.var_443E.var_2CA6 = [[ param_00 ]]("dog_hits_before_kill",param_01);
	self.var_443E.var_2D8B = [[ param_00 ]]("double_grenades_allowed",param_01);
}

//Function Number: 17
lib_A52D::func_7E0C()
{
	lib_A52D::func_0C9F(::lib_A52D::func_3DCE,1);
	lib_A52D::func_0CA0(::lib_A52D::func_3DCC,1);
}

//Function Number: 18
lib_A52D::func_3DCC(param_00,param_01)
{
	return level.var_2A5F[param_00][lib_A52D::func_3E61(self.gameskill)];
}

//Function Number: 19
lib_A52D::func_3DCB(param_00,param_01)
{
	return level.var_2A5F[param_00][lib_A52D::func_3E61(level.gameskill)];
}

//Function Number: 20
lib_A52D::func_3CDD(param_00,param_01)
{
	var_02 = level.var_2A60[param_00];
	var_03 = 1;
	while(var_03 < var_02.size)
	{
		var_04 = var_02[var_03]["frac"];
		var_05 = var_02[var_03]["val"];
		if(param_01 <= var_04)
		{
			var_06 = var_02[var_03 - 1]["frac"];
			var_07 = var_02[var_03 - 1]["val"];
			var_08 = var_04 - var_06;
			var_09 = var_05 - var_07;
			var_0A = param_01 - var_06;
			var_0B = var_0A / var_08;
			return var_07 + var_0B * var_09;
		}

		var_09++;
	}

	return var_08[var_08.size - 1]["val"];
}

//Function Number: 21
lib_A52D::func_3F42(param_00)
{
	return level.var_2A5F[param_00][lib_A52D::func_3E61(self.gameskill)];
}

//Function Number: 22
lib_A52D::func_40B0(param_00,param_01,param_02)
{
	return level.var_2A5F[param_00][level.var_2A62[param_01]] * 100 - getdvarint("autodifficulty_frac") + level.var_2A5F[param_00][level.var_2A62[param_02]] * getdvarint("autodifficulty_frac") * 0.01;
}

//Function Number: 23
lib_A52D::func_3DCE(param_00,param_01)
{
	return level.var_2A5F[param_00][lib_A52D::func_3E61(self.gameskill)];
}

//Function Number: 24
lib_A52D::func_3DCD(param_00,param_01)
{
	return level.var_2A5F[param_00][lib_A52D::func_3E61(level.gameskill)];
}

//Function Number: 25
lib_A52D::func_0B07()
{
	return 0;
}

//Function Number: 26
lib_A52D::func_6646()
{
	if(!lib_A52D::func_6647())
	{
		return 0;
	}

	return randomint(100) > 25;
}

//Function Number: 27
lib_A52D::func_6647()
{
	if(!isalive(self.enemy))
	{
		return 0;
	}

	if(!isplayer(self.enemy))
	{
		return 0;
	}

	if(!isalive(level.var_664D) || level.var_664D.script != "pain")
	{
		level.var_664D = self;
	}

	if(self == level.var_664D)
	{
		return 0;
	}

	if(self.var_103 != "none" && weaponisboltaction(self.var_103))
	{
		return 0;
	}

	return 1;
}

//Function Number: 28
lib_A52D::func_7DA9()
{
	if(animscripts\combat_utility::issniper() && isalive(self.enemy))
	{
		lib_A52D::func_800B();
		return;
	}

	if(isplayer(self.enemy))
	{
		lib_A52D::func_744C();
		if(self.var_7.var_5CE0 > gettime())
		{
			self.var_A = 0;
			return;
		}
	}

	if(self.script == "move")
	{
		if(animscripts\utility::func_50E7())
		{
			self.var_A = level.var_A0FC * self.var_1300;
		}
		else
		{
			self.var_A = level.var_76A1 * self.var_1300;
		}

		return;
	}

	self.var_A = self.var_1300;
	if(isdefined(self.var_5184) && isdefined(self.var_7102))
	{
		self.var_A = self.var_A * self.var_7102;
	}
}

//Function Number: 29
lib_A52D::func_800B()
{
	if(!isdefined(self.var_882C))
	{
		self.var_882C = 0;
		self.var_87FD = 0;
	}

	self.var_882C++;
	var_00 = level.gameskill;
	if(isplayer(self.enemy))
	{
		var_00 = self.enemy.gameskill;
	}

	if(lib_A52D::func_8495())
	{
		self.var_A = 0;
		if(var_00 > 0 || self.var_882C > 1)
		{
			self.var_55BC = self.enemy;
		}

		return;
	}

	self.var_A = 1 + 1 * self.var_87FD * self.var_1300;
	self.var_87FD++;
	if(var_00 < 1 && self.var_87FD == 1)
	{
		self.var_55BC = undefined;
	}
}

//Function Number: 30
lib_A52D::func_8495()
{
	if(isdefined(self.var_6092) && self.var_6092)
	{
		return 0;
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		return 0;
	}

	if(isdefined(self.var_55BC) && self.enemy == self.var_55BC)
	{
		return 0;
	}

	if(distancesquared(self.var_2E6,self.enemy.var_2E6) > 250000)
	{
		return 0;
	}

	return 1;
}

//Function Number: 31
lib_A52D::func_8443()
{
	return 1 + randomfloat(4);
}

//Function Number: 32
lib_A52D::func_2A4C()
{
	self.var_7.var_5CE2 = 0;
}

//Function Number: 33
lib_A52D::func_743F()
{
	lib_A52D::func_744D();
}

//Function Number: 34
lib_A52D::func_A0F1()
{
	var_00 = 0;
	waittillframeend;
	if(!isalive(self.enemy))
	{
		return var_00;
	}

	if(!isplayer(self.enemy))
	{
		return var_00;
	}

	if(self.enemy lib_A59A::func_32D7("player_is_invulnerable"))
	{
		var_00 = 0.3 + randomfloat(0.4);
	}

	return var_00;
}

//Function Number: 35
lib_A52D::func_6F9F(param_00,param_01,param_02,param_03)
{
	param_03 = param_03 * 20;
	for(var_04 = 0;var_04 < param_03;var_04++)
	{
		wait(0.05);
	}
}

//Function Number: 36
lib_A52D::func_744D()
{
	if(!self method_813D())
	{
		return;
	}

	if(self.weapon == "none")
	{
		return;
	}

	if(!animscripts\weaponlist::func_9C24() && !animscripts\weaponlist::func_9C30())
	{
		self.var_5CE0 = 0;
		return;
	}

	if(!isalive(self.enemy))
	{
		return;
	}

	if(!isplayer(self.enemy))
	{
		self.var_A = self.var_1300;
		return;
	}

	var_00 = distance(self.enemy.var_2E6,self.var_2E6);
	lib_A52D::func_7FA7(self.enemy.var_443E.var_5CE1 + var_00 * self.enemy.var_443E.var_5CE3);
}

//Function Number: 37
lib_A52D::func_744C()
{
	self.var_7.var_5CE2 = gettime() + 3000;
}

//Function Number: 38
lib_A52D::func_7FA7(param_00)
{
	if(self.var_7.var_5CE2 > gettime())
	{
		return;
	}

	if(param_00 > 0)
	{
		self.var_A = 0;
	}

	param_00 = param_00 * 1000;
	self.var_7.var_5CE0 = gettime() + param_00;
	self.var_7.var_6DB = 1;
}

//Function Number: 39
lib_A52D::func_6A4C()
{
	self endon("death");
	self notify("playeraim");
	self endon("playeraim");
	for(;;)
	{
		var_00 = (0,1,0);
		if(self.var_7.var_5CE0 > gettime())
		{
			var_00 = (1,0,0);
		}

		wait(0.05);
	}
}

//Function Number: 40
lib_A52D::func_7918(param_00,param_01,param_02)
{
	var_03 = randomfloatrange(-15,15);
	var_04 = randomfloatrange(-15,15);
	self scaleovertime(0.1,int(2048 * param_01),int(1152 * param_01));
	self.y = 100 + var_04;
	self moveovertime(0.08);
	self.y = 0 + var_04;
	self.x = self.x + var_03;
	if(isdefined(param_02))
	{
		return;
	}

	lib_A52D::func_7917();
}

//Function Number: 41
lib_A52D::func_7919(param_00,param_01,param_02)
{
	var_03 = 1;
	if(param_02)
	{
		var_03 = -1;
	}

	var_04 = randomfloatrange(-15,15);
	var_05 = randomfloatrange(-15,15);
	self scaleovertime(0.1,int(2048 * param_01),int(1152 * param_01));
	self.x = 1000 * var_03 + var_04;
	self moveovertime(0.1);
	self.x = 0 + var_04;
	self.y = self.y + var_05;
	lib_A52D::func_7917();
}

//Function Number: 42
lib_A52D::func_7917()
{
	self endon("death");
	var_00 = gettime();
	var_01 = 1;
	var_02 = 0.05;
	self.alpha = 0;
	self fadeovertime(var_02);
	self.alpha = 1;
	wait(var_02);
	lib_A59A::func_9F83(var_00,2);
	self fadeovertime(var_01);
	self.alpha = 0;
	wait(var_01);
	self destroy();
}

//Function Number: 43
lib_A52D::func_7915()
{
	var_00 = 0.2;
	self.alpha = 0.7;
	self fadeovertime(var_00);
	self.alpha = 0;
	wait(var_00);
	self destroy();
}

//Function Number: 44
lib_A52D::func_43E4(param_00)
{
}

//Function Number: 45
lib_A52D::func_14B6(param_00)
{
}

//Function Number: 46
lib_A52D::func_2B54(param_00,param_01,param_02,param_03,param_04)
{
	if(!isalive(self))
	{
		return;
	}

	if(isdefined(self.var_5008))
	{
		return;
	}

	var_05 = gettime();
	if(self.var_443E.var_7922[param_00][param_01] == var_05)
	{
		return;
	}

	if(self.var_443E.var_7922[param_00 + "_count"][param_01] == 1)
	{
		return;
	}

	self.var_443E.var_7922[param_00 + "_count"][param_01]++;
	self.var_443E.var_7922[param_00][param_01] = var_05;
	self endon("death");
	switch(param_01)
	{
		case "bottom":
			break;

		case "left":
			break;

		case "right":
			break;

		default:
			break;
	}
}

//Function Number: 47
lib_A52D::func_6CC6()
{
	var_00 = ::lib_A59A::func_2A6D;
	var_01 = ::lib_A59A::func_14BA;
	var_02 = [];
	var_02["MOD_GRENADE"] = var_00;
	var_02["MOD_GRENADE_SPLASH"] = var_00;
	var_02["MOD_PROJECTILE"] = var_00;
	var_02["MOD_PROJECTILE_SPLASH"] = var_00;
	var_02["MOD_EXPLOSIVE"] = var_00;
	var_02["MOD_PISTOL_BULLET"] = var_01;
	var_02["MOD_RIFLE_BULLET"] = var_01;
	var_02["MOD_EXPLOSIVE_BULLET"] = var_01;
	self.var_4B08 = 0;
	for(;;)
	{
		self waittill("damage",var_03,var_04,var_05,var_06,var_07);
		self.var_4B08 = 1;
		self.var_25A9 = var_06;
		self.var_258C = var_04;
		var_08 = undefined;
		if(isdefined(self.var_5D50))
		{
			var_08 = self.var_5D50[var_07];
		}

		if(!isdefined(var_08) && isdefined(var_02[var_07]))
		{
			var_08 = var_02[var_07];
		}

		if(isdefined(var_08))
		{
			waittillframeend;
			[[ var_08 ]](var_06);
		}
	}
}

//Function Number: 48
lib_A52D::func_6B4B()
{
	self.var_6B4B = 3;
}

//Function Number: 49
lib_A52D::func_6CC2()
{
	wait(0.05);
	level.var_8F52["take_cover"] = spawnstruct();
	level.var_8F52["take_cover"].text = &"GAME_GET_TO_COVER";
	level.var_8F52["get_back_up"] = spawnstruct();
	level.var_8F52["get_back_up"].text = &"GAME_LAST_STAND_GET_BACK_UP";
}

//Function Number: 50
lib_A52D::playerhealthregen()
{
	if(level.currentgen)
	{
		thread lib_A52D::func_4789();
	}
	else
	{
		thread lib_A52D::func_4786();
	}

	var_00 = 1;
	var_01 = 0;
	thread lib_A52D::func_6B4B();
	var_02 = 0;
	var_03 = 0;
	thread lib_A52D::func_6C67(self.var_275 * 0.35);
	var_04 = 0;
	var_05 = 0;
	var_06 = 0;
	var_07 = 1;
	thread lib_A52D::func_6CC6();
	self.var_1528 = 0;
	for(;;)
	{
		wait(0.05);
		waittillframeend;
		if(lib_A59A::func_55DE())
		{
			if(isdefined(level.var_55E0))
			{
				self thread [[ level.var_55E0 ]]();
			}
		}

		if(self.health == self.var_275)
		{
			if(lib_A59A::func_32D7("player_has_red_flashing_overlay"))
			{
				lib_A52D::func_6BD7();
			}

			var_07 = 1;
			var_03 = 0;
			var_02 = 0;
			continue;
		}

		if(self.health <= 0)
		{
			return;
		}

		var_08 = var_02;
		var_09 = self.health / self.var_275;
		if(var_09 <= self.var_443E.healthoverlaycutoff && self.var_6B4B > 1)
		{
			var_02 = 1;
			if(!var_08)
			{
				var_05 = gettime();
				if(lib_A59A::func_32D7("near_death_vision_enabled"))
				{
					if(function_0235())
					{
						thread lib_A52D::func_14C8(2,2);
					}
					else
					{
						thread lib_A52D::func_14C8(3.6,2);
					}

					thread lib_A5D2::func_7E01();
					self method_823B();
				}

				lib_A59A::func_32DD("player_has_red_flashing_overlay");
				var_03 = 1;
			}
		}

		if(self.var_4B08)
		{
			var_05 = gettime();
			self.var_4B08 = 0;
		}

		if(self.health / self.var_275 >= var_00)
		{
			if(gettime() - var_05 < self.var_443E.playerhealth_regularregendelay)
			{
				continue;
			}

			if(var_02)
			{
				var_06 = var_09;
				if(gettime() > var_05 + self.var_443E.var_584C)
				{
					var_06 = var_06 + self.var_443E.var_72D0;
				}

				if(var_06 >= 1)
				{
					lib_A52D::func_72A5();
				}
			}
			else
			{
				var_06 = 1;
			}

			if(var_06 > 1)
			{
				var_06 = 1;
			}

			if(var_06 <= 0)
			{
				return;
			}

			self setnormalhealth(var_06);
			var_00 = self.health / self.var_275;
			continue;
		}

		var_00 = var_07;
		var_0A = self.var_443E.var_A34A;
		if(self.var_57 == 1)
		{
			var_0A = var_0A * 3;
		}

		var_0B = var_00 - var_09 >= var_0A;
		if(self.health <= 1)
		{
			self setnormalhealth(2 / self.var_275);
			var_0B = 1;
		}

		var_00 = self.health / self.var_275;
		self notify("hit_again");
		var_01 = 0;
		var_05 = gettime();
		if(function_0235())
		{
			thread lib_A52D::func_14C8(2,0.8);
		}
		else
		{
			thread lib_A52D::func_14C8(3,0.8);
		}

		if(!var_0B)
		{
			continue;
		}

		if(lib_A59A::func_32D7("player_is_invulnerable"))
		{
			continue;
		}

		lib_A59A::func_32DD("player_is_invulnerable");
		level notify("player_becoming_invulnerable");
		if(var_03)
		{
			var_04 = self.var_443E.var_4FA7;
			var_03 = 0;
		}
		else if(var_02)
		{
			var_04 = self.var_443E.var_4FA8;
		}
		else
		{
			var_04 = self.var_443E.var_4FA9;
		}

		var_07 = self.health / self.var_275;
		thread lib_A52D::func_6CCD(var_04);
	}
}

//Function Number: 51
lib_A52D::func_72A5()
{
	if(!lib_A52D::func_9109())
	{
		return;
	}

	if(isalive(self))
	{
		var_00 = self getplayerprofiledata("takeCoverWarnings");
		if(var_00 > 0)
		{
			var_00--;
			self setplayerprofiledata("takeCoverWarnings",var_00);
		}
	}
}

//Function Number: 52
lib_A52D::func_6CCD(param_00)
{
	if(isdefined(self.flashendtime) && self.flashendtime > gettime())
	{
		param_00 = param_00 * lib_A52D::func_3F42("flashbangedInvulFactor");
	}

	if(param_00 > 0)
	{
		if(!isdefined(self.var_6155))
		{
			self.var_56 = 0;
		}

		self.var_201 = 1;
		wait(param_00);
	}

	lib_A52D::func_9ACB();
	lib_A59A::func_32D9("player_is_invulnerable");
}

//Function Number: 53
lib_A52D::func_2779()
{
	if(self.inliveplayerkillstreak == "allies")
	{
		self.var_2D64 = 0.6;
	}

	if(self method_813D())
	{
		if(level.gameskill >= 2)
		{
			self.var_2D64 = 0.8;
			return;
		}

		self.var_2D64 = 0.6;
	}
}

//Function Number: 54
lib_A52D::func_01D4()
{
	if(self.inliveplayerkillstreak == "allies")
	{
		self.var_1D4 = 0.9;
		return;
	}

	if(self method_813D())
	{
		if(level.gameskill >= 2)
		{
			if(randomint(100) < 33)
			{
				self.var_1D4 = 0.2;
				return;
			}

			self.var_1D4 = 0.5;
			return;
		}

		if(randomint(100) < 33)
		{
			self.var_1D4 = 0;
			return;
		}

		self.var_1D4 = 0.2;
		return;
	}
}

//Function Number: 55
lib_A52D::func_14C8(param_00,param_01)
{
	if(lib_A59A::func_32D7("player_no_auto_blur"))
	{
		return;
	}

	self notify("blurview_stop");
	self endon("blurview_stop");
	self setblurforplayer(param_00,0);
	wait(0.05);
	self setblurforplayer(0,param_01);
}

//Function Number: 56
lib_A52D::func_6C67(param_00)
{
	wait(2);
	for(;;)
	{
		wait(0.2);
		if(self.health <= 0)
		{
			return;
		}

		var_01 = self.health / self.var_275;
		if(var_01 > self.var_443E.healthoverlaycutoff)
		{
			continue;
		}

		if(isdefined(self.var_2A83) && self.var_2A83)
		{
			continue;
		}

		if(isdefined(level.var_3BFD))
		{
			[[ level.var_3BFD ]]("breathing_hurt");
		}
		else
		{
			var_02 = "breathing_hurt";
			if(soundexists(var_02))
			{
				self method_82F4(var_02);
			}
		}

		var_03 = 0.1;
		if(isdefined(level.var_31D.var_443E.var_2555))
		{
			var_03 = level.var_31D.var_443E.var_2555;
		}

		wait(var_03 + randomfloat(0.8));
	}
}

//Function Number: 57
lib_A52D::func_4786()
{
	self endon("noHealthOverlay");
	var_00 = newclienthudelem(self);
	var_00.x = 0;
	var_00.y = 0;
	if(issplitscreen())
	{
		var_00 setshader("fullscreen_lit_bloodsplat_01",640,960);
		if(self == level.var_328[0])
		{
			var_00.y = var_00.y - 120;
		}
	}
	else
	{
		var_00 setshader("fullscreen_lit_bloodsplat_01",640,480);
	}

	var_00.var_3E4 = 1;
	var_00.alignx = "left";
	var_00.aligny = "top";
	var_00.fontscale = 1;
	var_00.foreground = 0;
	var_00.horzalign = "fullscreen";
	var_00.vertalign = "fullscreen";
	var_00.var_13C = 1;
	var_00.color = (0,0,0);
	var_00.alpha = 0;
	thread lib_A52D::func_4788(var_00);
	thread lib_A52D::func_9108();
	var_01 = 0;
	var_02 = 0.05;
	var_03 = 0.3;
	var_04 = 0;
	while(isalive(self))
	{
		wait(var_02);
		if(self.var_275 > self.health)
		{
			var_04 = 1 - self.health / self.var_275 * 0.5;
		}
		else
		{
			var_04 = 0;
		}

		var_05 = var_04;
		var_05 = clamp(var_05,0,1);
		if(var_01 > var_05)
		{
			if(isdefined(self.var_34EC) && self.var_34EC)
			{
				var_01 = 0;
			}
			else
			{
				var_01 = var_01 - var_03 * var_02;
			}
		}

		if(var_01 < var_05)
		{
			var_01 = var_05;
		}

		var_00.color = (var_01,0,0);
		if(var_01 == 0)
		{
			var_00.alpha = 0;
			continue;
		}

		var_00.alpha = 1;
	}

	thread lib_A52D::func_4787(var_00);
}

//Function Number: 58
lib_A52D::func_4789()
{
	self endon("noHealthOverlay");
	var_00 = newclienthudelem(self);
	var_00.x = 0;
	var_00.y = 0;
	if(issplitscreen())
	{
		var_00 setshader("vfx_blood_screen_overlay",640,960);
		if(self == level.var_328[0])
		{
			var_00.y = var_00.y - 120;
		}
	}
	else
	{
		var_00 setshader("vfx_blood_screen_overlay",640,480);
	}

	var_00.var_3E4 = 1;
	var_00.alignx = "left";
	var_00.aligny = "top";
	var_00.fontscale = 1;
	var_00.foreground = 0;
	var_00.horzalign = "fullscreen";
	var_00.vertalign = "fullscreen";
	var_00.alpha = 0;
	var_00.var_13C = 1;
	thread lib_A52D::func_4788(var_00);
	thread lib_A52D::func_9108();
	var_01 = 0;
	var_02 = 0.05;
	var_03 = 0.3;
	while(isalive(self))
	{
		wait(var_02);
		var_04 = 1 - self.health / self.var_275;
		var_05 = var_04 * var_04 * 1.2;
		var_05 = clamp(var_05,0,1);
		if(var_01 > var_05)
		{
			var_01 = var_01 - var_03 * var_02;
		}

		if(var_01 < var_05)
		{
			var_01 = var_05;
		}

		var_00.alpha = var_01;
	}
}

//Function Number: 59
lib_A52D::func_4787(param_00)
{
	self endon("noHealthOverlay");
	var_01 = 0;
	var_02 = 0;
	for(var_01 = 0;var_01 < 80;var_01++)
	{
		var_03 = var_02 / 80;
		param_00.color = (255,var_03,0);
		var_02 = var_02 + 1;
		wait 0.05;
	}
}

//Function Number: 60
lib_A52D::func_9108()
{
	while(isalive(self))
	{
		lib_A59A::func_32DF("player_has_red_flashing_overlay");
		lib_A52D::func_9107();
	}
}

//Function Number: 61
lib_A52D::func_0767(param_00)
{
	if(level.console)
	{
		self.var_18C = 2;
	}
	else
	{
		self.var_18C = 1.6;
	}

	self.x = 0;
	self.y = -36;
	self.alignx = "center";
	self.aligny = "bottom";
	self.horzalign = "center";
	self.vertalign = "middle";
	if(!isdefined(self.var_68))
	{
		return;
	}

	self.var_68.x = 0;
	self.var_68.y = -40;
	self.var_68.alignx = "center";
	self.var_68.aligny = "middle";
	self.var_68.horzalign = "center";
	self.var_68.vertalign = "middle";
	if(level.console)
	{
		self.var_68 setshader("popmenu_bg",650,52);
	}
	else
	{
		self.var_68 setshader("popmenu_bg",650,42);
	}

	self.var_68.alpha = 0.5;
}

//Function Number: 62
lib_A52D::func_23E1()
{
	var_00 = newclienthudelem(self);
	var_00 lib_A52D::func_0767();
	thread lib_A52D::func_28D3(var_00);
	var_00 thread lib_A52D::func_28D4();
	if(lib_A59A::func_505F(self))
	{
		var_00 settext(level.var_8F52["get_back_up"].text);
	}
	else
	{
		var_00 settext(level.var_8F52["take_cover"].text);
	}

	var_00.var_18C = 2;
	var_00.alpha = 1;
	var_00.color = (1,0.9,0.9);
	var_00.fontscale = 1;
	var_00.foreground = 1;
	return var_00;
}

//Function Number: 63
lib_A52D::func_A0DC()
{
	self endon("hit_again");
	self endon("player_downed");
	self waittill("damage");
}

//Function Number: 64
lib_A52D::func_28D3(param_00)
{
	param_00 endon("being_destroyed");
	lib_A52D::func_A0DC();
	var_01 = !isalive(self);
	param_00 thread lib_A52D::func_28D2(var_01);
}

//Function Number: 65
lib_A52D::func_28D4()
{
	self endon("being_destroyed");
	common_scripts\utility::flag_wait("missionfailed");
	thread lib_A52D::func_28D2(1);
}

//Function Number: 66
lib_A52D::func_28D2(param_00)
{
	self notify("being_destroyed");
	self.var_13AA = 1;
	if(param_00)
	{
		self fadeovertime(0.5);
		self.alpha = 0;
		wait(0.5);
	}

	self notify("death");
	self destroy();
}

//Function Number: 67
lib_A52D::func_5A57(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(isdefined(param_00.var_13AA))
	{
		return 0;
	}

	return 1;
}

//Function Number: 68
lib_A52D::func_397E(param_00,param_01)
{
	self endon("death");
	param_00 = param_00 * 2;
	var_02 = param_00 - self.var_18C;
	self changefontscaleovertime(param_01);
	self.var_18C = self.var_18C + var_02;
}

//Function Number: 69
lib_A52D::func_35EC(param_00,param_01,param_02,param_03)
{
	var_04 = 0.8;
	var_05 = 0.5;
	var_06 = var_04 * 0.1;
	var_07 = var_04 * 0.1 + param_01 * 0.2;
	var_08 = var_04 * 0.1 + param_01 * 0.1;
	var_09 = var_04 * 0.3;
	var_0A = var_04 - var_06 - var_07 - var_08 - var_09;
	if(var_0A < 0)
	{
		var_0A = 0;
	}

	var_0B = 0.8 + param_01 * 0.1;
	var_0C = 0.5 + param_01 * 0.3;
	if(lib_A52D::func_5A57(param_00))
	{
		if(!param_03)
		{
			param_00 fadeovertime(var_06);
			param_00.alpha = param_02 * 1;
		}
	}

	if(isdefined(param_00))
	{
		param_00 thread lib_A52D::func_397E(1,var_06);
	}

	wait(var_06 + var_07);
	if(lib_A52D::func_5A57(param_00))
	{
		if(!param_03)
		{
			param_00 fadeovertime(var_08);
			param_00.alpha = param_02 * var_0B;
		}
	}

	wait(var_08);
	if(lib_A52D::func_5A57(param_00))
	{
		if(!param_03)
		{
			param_00 fadeovertime(var_09);
			param_00.alpha = param_02 * var_0C;
		}
	}

	if(isdefined(param_00))
	{
		param_00 thread lib_A52D::func_397E(0.9,var_09);
	}

	wait(var_09);
	wait(var_0A);
}

//Function Number: 70
lib_A52D::func_9109()
{
	if(isdefined(level.var_229B))
	{
		return 0;
	}

	if(isdefined(self.underwater) && self.underwater == 1)
	{
		return 0;
	}

	if(isdefined(self.vehicle))
	{
		return 0;
	}

	return 1;
}

//Function Number: 71
lib_A52D::func_8471()
{
	if(!isalive(self))
	{
		return 0;
	}

	if(self islinked())
	{
		return 0;
	}

	if(self.ignoreme)
	{
		return 0;
	}

	if(level.var_5CDB)
	{
		return 0;
	}

	if(!lib_A52D::func_9109())
	{
		return 0;
	}

	if(self.gameskill > 0 && !lib_A546::func_597F())
	{
		return 0;
	}

	var_00 = self getplayerprofiledata("takeCoverWarnings");
	if(var_00 <= 3)
	{
		return 0;
	}

	return 1;
}

//Function Number: 72
lib_A52D::func_9107()
{
	self endon("hit_again");
	self endon("damage");
	var_00 = undefined;
	if(lib_A52D::func_8471())
	{
		var_00 = lib_A52D::func_23E1();
	}

	var_01 = gettime() + self.var_443E.var_584C;
	lib_A52D::func_35EC(var_00,1,1,0);
	while(gettime() < var_01 && isalive(self) && lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		lib_A52D::func_35EC(var_00,0.9,1,0);
	}

	if(isalive(self))
	{
		lib_A52D::func_35EC(var_00,0.65,0.8,0);
	}

	if(lib_A52D::func_5A57(var_00))
	{
		var_00 fadeovertime(1);
		var_00.alpha = 0;
	}

	lib_A52D::func_35EC(var_00,0,0.6,1);
	wait(0.5);
	self notify("take_cover_done");
	self notify("hit_again");
}

//Function Number: 73
lib_A52D::func_6BD7()
{
	lib_A59A::func_32D9("player_has_red_flashing_overlay");
	if(lib_A59A::func_32D7("near_death_vision_enabled"))
	{
		self method_823C();
		thread lib_A5D2::func_7495();
	}

	if(!isdefined(self.var_2A83) || !self.var_2A83)
	{
		if(isdefined(level.var_3BFD))
		{
			[[ level.var_3BFD ]]("breathing_better");
		}
		else
		{
			var_00 = "breathing_better";
			if(soundexists(var_00))
			{
				self method_82F4(var_00);
			}
		}
	}

	self notify("take_cover_done");
}

//Function Number: 74
lib_A52D::func_4788(param_00)
{
	self waittill("noHealthOverlay");
	param_00 destroy();
}

//Function Number: 75
lib_A52D::func_7459()
{
	waittillframeend;
	lib_A52D::func_800A(1);
}

//Function Number: 76
lib_A52D::func_4D62()
{
	var_00 = isdefined(level.var_517F) && level.var_517F;
	if(self getplayerprofiledata("takeCoverWarnings") == -1 || var_00)
	{
		self setplayerprofiledata("takeCoverWarnings",9);
	}
}

//Function Number: 77
lib_A52D::func_4C38()
{
	self notify("new_cover_on_death_thread");
	self endon("new_cover_on_death_thread");
	self waittill("death");
	if(!lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return;
	}

	if(!lib_A52D::func_9109())
	{
		return;
	}

	var_00 = self getplayerprofiledata("takeCoverWarnings");
	if(var_00 < 10)
	{
		self setplayerprofiledata("takeCoverWarnings",var_00 + 1);
	}
}

//Function Number: 78
lib_A52D::func_111B()
{
	var_00 = self.var_2E6;
	wait(5);
	if(lib_A52D::func_116D(var_00))
	{
		level.var_1129[level.var_1129.size] = var_00;
	}
}

//Function Number: 79
lib_A52D::func_116D(param_00)
{
	return distancesquared(self.var_2E6,param_00) < 19600;
}

//Function Number: 80
lib_A52D::func_111A()
{
	level.var_1129 = [];
	level.var_31D.var_5F4B = 1;
	wait(1);
	for(;;)
	{
		level.var_31D thread lib_A52D::func_111B();
		level.var_31D.var_5F4B = 1;
		var_00 = [];
		var_01 = level.var_1129.size - 5;
		if(var_01 < 0)
		{
			var_01 = 0;
		}

		for(var_02 = var_01;var_02 < level.var_1129.size;var_02++)
		{
			if(!level.var_31D lib_A52D::func_116D(level.var_1129[var_02]))
			{
				continue;
			}

			var_00[var_00.size] = level.var_1129[var_02];
			level.var_31D.var_5F4B = 0;
		}

		level.var_1129 = var_00;
		wait(1);
	}
}

//Function Number: 81
lib_A52D::func_111C()
{
	level.var_31D waittill("death");
	var_00 = getdvarint("autodifficulty_playerDeathTimer");
	var_00 = var_00 - 60;
	setdvar("autodifficulty_playerDeathTimer",var_00);
}

//Function Number: 82
lib_A52D::func_111D()
{
	var_00 = gettime();
	for(;;)
	{
		if(level.var_31D attackbuttonpressed())
		{
			var_00 = gettime();
		}

		level.var_9356 = gettime() - var_00;
		wait(0.05);
	}
}

//Function Number: 83
lib_A52D::func_4AB8(param_00,param_01)
{
	lib_A52D::func_4AB7(param_00,param_01 * 100,1);
}

//Function Number: 84
lib_A52D::func_4AB6(param_00,param_01)
{
	lib_A52D::func_4AB7(param_00,param_01,0);
}

//Function Number: 85
lib_A52D::func_4ABD()
{
	level.var_4AEC = 0;
	if(isdefined(level.var_4ADC))
	{
		for(var_00 = 0;var_00 < level.var_4ADC.size;var_00++)
		{
			level.var_4ADC[var_00] destroy();
		}
	}

	level.var_4ADC = [];
}

//Function Number: 86
lib_A52D::func_4AB9(param_00)
{
	if(!isdefined(level.var_4AEB))
	{
		level.var_4AEB = [];
	}

	if(!isdefined(level.var_4AEB[param_00]))
	{
		var_01 = newhudelem();
		var_01.x = level.var_2727;
		var_01.y = level.var_2724 + level.var_4AEC * 15;
		var_01.foreground = 1;
		var_01.fontscale = 100;
		var_01.alpha = 1;
		var_01.alignx = "left";
		var_01.horzalign = "left";
		var_01.var_18C = 1;
		var_01 settext(param_00);
		level.var_4AEB[param_00] = 1;
	}
}

//Function Number: 87
lib_A52D::func_4AB7(param_00,param_01,param_02)
{
	lib_A52D::func_4AB9(param_00);
	param_01 = int(param_01);
	var_03 = 0;
	if(param_01 < 0)
	{
		var_03 = 1;
		param_01 = param_01 * -1;
	}

	var_04 = 0;
	var_05 = 0;
	var_06 = 0;
	var_07 = 0;
	while(param_01 >= 10000)
	{
		param_01 = param_01 - 10000;
	}

	while(param_01 >= 1000)
	{
		param_01 = param_01 - 1000;
		var_04++;
	}

	while(param_01 >= 100)
	{
		param_01 = param_01 - 100;
		var_05++;
	}

	while(param_01 >= 10)
	{
		param_01 = param_01 - 10;
		var_06++;
	}

	while(param_01 >= 1)
	{
		param_01 = param_01 - 1;
		var_07++;
	}

	var_08 = 0;
	var_09 = 10;
	if(var_04 > 0)
	{
		lib_A52D::func_4ABA(var_04,var_08);
		var_08 = var_08 + var_09;
		lib_A52D::func_4ABA(var_05,var_08);
		var_08 = var_08 + var_09;
		lib_A52D::func_4ABA(var_06,var_08);
		var_08 = var_08 + var_09;
		lib_A52D::func_4ABA(var_07,var_08);
		var_08 = var_08 + var_09;
	}
	else if(var_05 > 0 || param_02)
	{
		lib_A52D::func_4ABA(var_05,var_08);
		var_08 = var_08 + var_09;
		lib_A52D::func_4ABA(var_06,var_08);
		var_08 = var_08 + var_09;
		lib_A52D::func_4ABA(var_07,var_08);
		var_08 = var_08 + var_09;
	}
	else if(var_06 > 0)
	{
		lib_A52D::func_4ABA(var_06,var_08);
		var_08 = var_08 + var_09;
		lib_A52D::func_4ABA(var_07,var_08);
		var_08 = var_08 + var_09;
	}
	else
	{
		lib_A52D::func_4ABA(var_07,var_08);
		var_08 = var_08 + var_09;
	}

	if(param_02)
	{
		var_0A = newhudelem();
		var_0A.x = 204.5;
		var_0A.y = level.var_2724 + level.var_4AEC * 15;
		var_0A.foreground = 1;
		var_0A.fontscale = 100;
		var_0A.alpha = 1;
		var_0A.alignx = "left";
		var_0A.horzalign = "left";
		var_0A.var_18C = 1;
		var_0A settext(".");
		level.var_4ADC[level.var_4ADC.size] = var_0A;
	}

	if(var_03)
	{
		var_0B = newhudelem();
		var_0B.x = 195.5;
		var_0B.y = level.var_2724 + level.var_4AEC * 15;
		var_0B.foreground = 1;
		var_0B.fontscale = 100;
		var_0B.alpha = 1;
		var_0B.alignx = "left";
		var_0B.horzalign = "left";
		var_0B.var_18C = 1;
		var_0B settext(" - ");
		level.var_4ADC[level.var_4AEC] = var_0B;
	}

	level.var_4AEC++;
}

//Function Number: 88
lib_A52D::func_4ABC(param_00,param_01)
{
	lib_A52D::func_4AB9(param_00);
	lib_A52D::func_4ABB(param_01,0);
	level.var_4AEC++;
}

//Function Number: 89
lib_A52D::func_4ABA(param_00,param_01)
{
	var_02 = newhudelem();
	var_02.x = 200 + param_01 * 0.65;
	var_02.y = level.var_2724 + level.var_4AEC * 15;
	var_02.foreground = 1;
	var_02.fontscale = 100;
	var_02.alpha = 1;
	var_02.alignx = "left";
	var_02.horzalign = "left";
	var_02.var_18C = 1;
	var_02 settext(param_00 + "");
	level.var_4ADC[level.var_4ADC.size] = var_02;
}

//Function Number: 90
lib_A52D::func_4ABB(param_00,param_01)
{
	var_02 = newhudelem();
	var_02.x = 200 + param_01 * 0.65;
	var_02.y = level.var_2724 + level.var_4AEC * 15;
	var_02.foreground = 1;
	var_02.fontscale = 100;
	var_02.alpha = 1;
	var_02.alignx = "left";
	var_02.horzalign = "left";
	var_02.var_18C = 1;
	var_02 settext(param_00);
	level.var_4ADC[level.var_4ADC.size] = var_02;
}

//Function Number: 91
lib_A52D::func_06AA()
{
	level.sp_stat_tracking_func = ::lib_A52D::func_1121;
	setdvar("aa_player_kills","0");
	setdvar("aa_enemy_deaths","0");
	setdvar("aa_enemy_damage_taken","0");
	setdvar("aa_player_damage_taken","0");
	setdvar("aa_player_damage_dealt","0");
	setdvar("aa_ads_damage_dealt","0");
	setdvar("aa_time_tracking","0");
	setdvar("aa_deaths","0");
	setdvar("player_cheated",0);
	level.var_1122 = [];
	thread lib_A52D::func_06B1();
	thread lib_A52D::func_06AD();
	thread lib_A52D::func_06AB();
	common_scripts\utility::flag_set("auto_adjust_initialized");
	common_scripts\utility::flag_init("aa_main_" + level.script);
	common_scripts\utility::flag_set("aa_main_" + level.script);
}

//Function Number: 92
lib_A52D::func_20BA(param_00)
{
	var_01 = function_00DD(param_00);
	if(var_01["count"] <= 0)
	{
		return 0;
	}

	for(var_02 = 1;var_02 < var_01["count"] + 1;var_02++)
	{
		if(self buttonpresseddevonly(var_01["key" + var_02]))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 93
lib_A52D::func_06B1()
{
	waittillframeend;
	wait(0.2);
}

//Function Number: 94
lib_A52D::func_06AB()
{
	level.var_31D endon("death");
	level.var_6A4B = 0;
	for(;;)
	{
		if(level.var_31D lib_A59A::func_50A6())
		{
			level.var_6A4B = gettime();
			while(level.var_31D lib_A59A::func_50A6())
			{
				wait(0.05);
			}

			continue;
		}

		wait(0.05);
	}
}

//Function Number: 95
lib_A52D::func_06AD()
{
	for(;;)
	{
		level.var_31D waittill("damage",var_00,var_01,var_02,var_03,var_04,var_05,var_06);
		lib_A52D::func_06A5("aa_player_damage_taken",var_00);
		if(!isalive(level.var_31D))
		{
			lib_A52D::func_06A5("aa_deaths",1);
			return;
		}
	}
}

//Function Number: 96
lib_A52D::func_1121(param_00)
{
	if(!isdefined(level.var_1120))
	{
		level.var_1120 = [];
	}

	common_scripts\utility::flag_wait("auto_adjust_initialized");
	level.var_1122[param_00] = [];
	level.var_1120[param_00] = 0;
	common_scripts\utility::flag_wait(param_00);
	if(getdvar("aa_zone" + param_00) == "")
	{
		setdvar("aa_zone" + param_00,"on");
		level.var_1120[param_00] = 1;
		lib_A52D::func_06B2();
		setdvar("start_time" + param_00,getdvar("aa_time_tracking"));
		setdvar("starting_player_kills" + param_00,getdvar("aa_player_kills"));
		setdvar("starting_deaths" + param_00,getdvar("aa_deaths"));
		setdvar("starting_ads_damage_dealt" + param_00,getdvar("aa_ads_damage_dealt"));
		setdvar("starting_player_damage_dealt" + param_00,getdvar("aa_player_damage_dealt"));
		setdvar("starting_player_damage_taken" + param_00,getdvar("aa_player_damage_taken"));
		setdvar("starting_enemy_damage_taken" + param_00,getdvar("aa_enemy_damage_taken"));
		setdvar("starting_enemy_deaths" + param_00,getdvar("aa_enemy_deaths"));
	}
	else if(getdvar("aa_zone" + param_00) == "done")
	{
		return;
	}

	common_scripts\utility::flag_waitopen(param_00);
	lib_A52D::func_1123(param_00);
}

//Function Number: 97
lib_A52D::func_1123(param_00)
{
	setdvar("aa_zone" + param_00,"done");
	var_01 = getdvarfloat("start_time" + param_00);
	var_02 = getdvarint("starting_player_kills" + param_00);
	var_03 = getdvarint("aa_enemy_deaths" + param_00);
	var_04 = getdvarint("aa_enemy_damage_taken" + param_00);
	var_05 = getdvarint("aa_player_damage_taken" + param_00);
	var_06 = getdvarint("aa_player_damage_dealt" + param_00);
	var_07 = getdvarint("aa_ads_damage_dealt" + param_00);
	var_08 = getdvarint("aa_deaths" + param_00);
	level.var_1120[param_00] = 0;
	lib_A52D::func_06B2();
	var_09 = getdvarfloat("aa_time_tracking") - var_01;
	var_0A = getdvarint("aa_player_kills") - var_02;
	var_0B = getdvarint("aa_enemy_deaths") - var_03;
	var_0C = 0;
	if(var_0B > 0)
	{
		var_0C = var_0A / var_0B;
		var_0C = var_0C * 100;
		var_0C = int(var_0C);
	}

	var_0D = getdvarint("aa_enemy_damage_taken") - var_04;
	var_0E = getdvarint("aa_player_damage_dealt") - var_06;
	var_0F = 0;
	var_10 = 0;
	if(var_0D > 0 && var_09 > 0)
	{
		var_0F = var_0E / var_0D;
		var_0F = var_0F * 100;
		var_0F = int(var_0F);
		var_10 = var_0E / var_09;
		var_10 = var_10 * 60;
		var_10 = int(var_10);
	}

	var_11 = getdvarint("aa_ads_damage_dealt") - var_07;
	var_12 = 0;
	if(var_0E > 0)
	{
		var_12 = var_11 / var_0E;
		var_12 = var_12 * 100;
		var_12 = int(var_12);
	}

	var_13 = getdvarint("aa_player_damage_taken") - var_05;
	var_14 = 0;
	if(var_09 > 0)
	{
		var_14 = var_13 / var_09;
	}

	var_15 = var_14 * 60;
	var_15 = int(var_15);
	var_16 = getdvarint("aa_deaths") - var_08;
	var_17 = [];
	var_17["player_damage_taken_per_minute"] = var_15;
	var_17["player_damage_dealt_per_minute"] = var_10;
	var_17["minutes"] = var_09 / 60;
	var_17["deaths"] = var_16;
	var_17["gameskill"] = level.gameskill;
	level.var_1122[param_00] = var_17;
	var_18 = "Completed AA sequence: ";
	var_18 = var_18 + level.script + "/" + param_00;
	var_19 = getarraykeys(var_17);
	for(var_1A = 0;var_1A < var_19.size;var_1A++)
	{
		var_18 = var_18 + ", " + var_19[var_1A] + ": " + var_17[var_19[var_1A]];
	}

	function_0196(var_18);
}

//Function Number: 98
lib_A52D::func_06AE(param_00,param_01)
{
	function_0196(param_00 + ": " + param_01[param_00]);
}

//Function Number: 99
lib_A52D::func_06B2()
{
}

//Function Number: 100
lib_A52D::func_06A5(param_00,param_01)
{
	var_02 = getdvarint(param_00);
	setdvar(param_00,var_02 + param_01);
}

//Function Number: 101
lib_A52D::func_06A6(param_00,param_01)
{
	var_02 = getdvarfloat(param_00);
	setdvar(param_00,var_02 + param_01);
}

//Function Number: 102
lib_A52D::func_74CE(param_00)
{
	return 0;
}

//Function Number: 103
lib_A52D::func_6A60(param_00)
{
	if([[ level.var_254D ]](param_00))
	{
		return 1;
	}

	if(isplayer(param_00))
	{
		return 1;
	}

	if(!isdefined(param_00.car_damage_owner_recorder))
	{
		return 0;
	}

	return param_00 lib_A52D::func_6AC7();
}

//Function Number: 104
lib_A52D::func_6AC7()
{
	return self.player_damage * 1.75 > self.non_player_damage;
}

//Function Number: 105
lib_A52D::func_3093(param_00,param_01,param_02)
{
}

//Function Number: 106
lib_A52D::func_111F(param_00,param_01,param_02,param_03)
{
	lib_A52D::func_06A5("aa_enemy_deaths",1);
	if(!isdefined(param_01))
	{
		return;
	}

	if(!lib_A52D::func_6A60(param_01))
	{
		return;
	}

	[[ level.var_422B ]](param_02,self.var_FE,param_03);
	lib_A52D::func_06A5("aa_player_kills",1);
}

//Function Number: 107
//Function Number: 108
lib_A52D::func_06AC(param_00,param_01,param_02)
{
	lib_A52D::func_06A5("aa_player_damage_dealt",param_00);
	if(!level.var_31D lib_A59A::func_50A6())
	{
		[[ level.var_4222 ]](param_01,self.var_FE,param_02);
		return 0;
	}

	if(!lib_A52D::func_1893(param_01))
	{
		[[ level.var_4222 ]](param_01,self.var_FE,param_02);
		return 0;
	}

	[[ level.var_4223 ]](param_01,self.var_FE,param_02);
	lib_A52D::func_06A5("aa_ads_damage_dealt",param_00);
	return 1;
}

//Function Number: 109
lib_A52D::func_1893(param_00)
{
	if(param_00 == "MOD_PISTOL_BULLET")
	{
		return 1;
	}

	return param_00 == "MOD_RIFLE_BULLET";
}

//Function Number: 110
lib_A52D::func_075E(param_00,param_01,param_02)
{
	if(!isdefined(level.var_2A60[param_00]))
	{
		level.var_2A60[param_00] = [];
	}

	var_03 = [];
	var_03["frac"] = param_01;
	var_03["val"] = param_02;
	level.var_2A60[param_00][level.var_2A60[param_00].size] = var_03;
}

//Function Number: 111
lib_A52D::func_21C6()
{
	return lib_A59A::func_5009() && lib_A59A::func_3E31().size == 1;
}