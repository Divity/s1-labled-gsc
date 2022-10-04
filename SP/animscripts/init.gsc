/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: init.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 25
 * Decompile Time: 881 ms
 * Timestamp: 4/20/2022 8:20:31 PM
*******************************************************************/

//Function Number: 1
func_4E2F(param_00)
{
	self.energyturret[param_00] = spawnstruct();
	self.energyturret[param_00].var_32E = "none";
	self.energyturret[param_00].var_4720 = 1;
	if(function_00DB(param_00) != "")
	{
		self.energyturret[param_00].var_9BEA = 1;
		return;
	}

	self.energyturret[param_00].var_9BEA = 0;
}

//Function Number: 2
func_5205(param_00)
{
	return isdefined(self.energyturret[param_00]);
}

//Function Number: 3
func_7F76()
{
	anim.var_22A1 = 55;
	anim.var_985 = 10;
	anim.var_983 = 4096;
	anim.var_984 = 45;
	anim.var_97B = 20;
	anim.var_6660 = 25;
	anim.var_665E = level.var_983;
	anim.var_665F = level.var_984;
	anim.var_6658 = 30;
	anim.var_5A23 = 65;
	anim.var_5A22 = 65;
}

//Function Number: 4
func_33DD()
{
	if(animscripts\utility::func_51A0(self.secondaryweapon))
	{
		return 1;
	}

	if(weaponclass(self.alias) == "rocketlauncher")
	{
		return 1;
	}

	return 0;
}

//Function Number: 5
main()
{
	self.var_7 = spawnstruct();
	self.var_7.var_54F8 = 0;
	self.alias = self.weapon;
	func_381C();
	if(!isdefined(self.alias) || self.alias == "")
	{
		self.alias = "none";
	}

	if(self.secondaryweapon == "")
	{
		self.secondaryweapon = "none";
	}

	if(self.var_8557 == "")
	{
		self.var_8557 = "none";
	}

	func_4E2F(self.alias);
	func_4E2F(self.secondaryweapon);
	func_4E2F(self.var_8557);
	self method_8173();
	self.var_7.var_A2D9["left"] = "none";
	self.var_7.var_A2D9["right"] = "none";
	self.var_7.var_A2D9["chest"] = "none";
	self.var_7.var_A2D9["back"] = "none";
	self.var_7.var_A2DA["left"] = "none";
	self.var_7.var_A2DA["right"] = "none";
	self.var_7.var_A2DA["chest"] = "none";
	self.var_7.var_A2DA["back"] = "none";
	self.var_560C = self.weapon;
	self.var_75DC = %animscript_root;
	thread begingrenadetracking();
	var_00 = animscripts\utility::func_9C2E();
	self.var_7.var_6093 = var_00;
	if(var_00)
	{
		thread animscripts\shared::func_7668();
	}

	self.var_7.rockets = 3;
	self.var_7.var_7594 = 1;
	self.var_7.var_6E57 = "stand";
	self.var_7.var_4409 = "stand";
	self.var_7.var_5F58 = "stop";
	self.var_7.state = "stop";
	self.var_7.var_8A14 = "none";
	self.var_7.var_446E = "none";
	self.var_7.var_6F70 = -1;
	self.var_136 = 1;
	self.var_5C62 = 750;
	animscripts\shared::func_6866(self.alias,"right");
	if(animscripts\utility::func_51A0(self.secondaryweapon))
	{
		animscripts\shared::func_6866(self.secondaryweapon,"back");
	}

	self.var_7.var_6081 = 0;
	self.var_7.var_20AA = gettime();
	self.var_7.var_559B = gettime();
	self.var_7.var_8FE2 = 0;
	self.var_7.var_2B17 = !self method_813D();
	self.var_7.var_5853 = 0;
	self.var_7.var_665C = 0;
	self.var_7.var_55D4 = 0;
	self.var_7.var_60C9 = 0;
	self.var_7.var_71CD = 0.8;
	if(self.inliveplayerkillstreak != "allies")
	{
		self.var_46F3 = 1;
	}

	self.var_7.var_6E8A = undefined;
	self.var_7.stance = "stand";
	self.var_1D46 = ::animscripts\utility::func_1D45;
	self.var_550 = 0;
	self.var_5DB = 0;
	thread func_32B5();
	self.var_1300 = 1;
	self.var_7.var_5CE0 = 0;
	self.var_7.var_612B = 0;
	self.var_7.var_5CE0 = 0;
	self.var_7.var_5CE2 = 0;
	self.var_7.var_2B1F = 0;
	self.var_6DC = 1;
	self.var_1CA5 = 0;
	self.var_8563 = 0;
	self.var_8562 = 1;
	self.var_607A = 1;
	self.var_279F = 55;
	self.var_7.var_60DA = 0;
	if(!isdefined(self.var_79E5))
	{
		self.var_79E5 = 0;
	}

	func_833A();
	animscripts\weaponlist::func_72AE();
	self.var_559A = 0;
	self.var_20B5 = 0;
	self.var_8FDE = 0;
	self.var_8FE1 = 0;
	if(self.inliveplayerkillstreak == "allies")
	{
		self.var_8FE6 = 0.5;
	}
	else
	{
		self.var_8FE6 = 0;
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		self.var_711D = 0;
	}
	else
	{
		self.var_711D = 256;
	}

	self.var_B77 = 8000;
	self.var_B78 = 0;
	animscripts\animset::func_827D();
	self.exception = [];
	self.exception["corner"] = 1;
	self.exception["cover_crouch"] = 1;
	self.exception["stop"] = 1;
	self.exception["stop_immediate"] = 1;
	self.exception["move"] = 1;
	self.exception["exposed"] = 1;
	self.exception["corner_normal"] = 1;
	var_01 = getarraykeys(self.exception);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		common_scripts\utility::clear_exception(var_01[var_02]);
	}

	self.var_7174 = 0;
	thread func_7FB4();
	self.var_8483 = 0;
	if(!isdefined(level.var_2B1B))
	{
		thread animscripts\combat_utility::monitorflash();
	}

	thread ondeath();
}

//Function Number: 6
func_A2DE(param_00)
{
	var_01[0] = "m4_grenadier";
	var_01[1] = "m4_grunt";
	var_01[2] = "m4_silencer";
	var_01[3] = "m4m203";
	if(!isdefined(param_00))
	{
		return 0;
	}

	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(issubstr(param_00,var_01[var_02]))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 7
func_7FB4()
{
	self endon("death");
	if(!isdefined(level.var_57D7))
	{
		level waittill("loadout complete");
	}

	lib_A553::func_3DE0();
	thread animscripts\squadmanager::func_84F();
}

//Function Number: 8
func_6E2B()
{
	for(;;)
	{
		if(self method_81CB("stand"))
		{
			var_00[0] = "stand allowed";
			var_01[0] = (0,1,0);
		}
		else
		{
			var_00[0] = "stand not allowed";
			var_01[0] = (1,0,0);
		}

		if(self method_81CB("crouch"))
		{
			var_00[1] = "crouch allowed";
			var_01[1] = (0,1,0);
		}
		else
		{
			var_00[1] = "crouch not allowed";
			var_01[1] = (1,0,0);
		}

		if(self method_81CB("prone"))
		{
			var_00[2] = "prone allowed";
			var_01[2] = (0,1,0);
		}
		else
		{
			var_00[2] = "prone not allowed";
			var_01[2] = (1,0,0);
		}

		var_02 = self method_8097() + (0,0,30);
		var_03 = (0,0,-10);
		for(var_04 = 0;var_04 < var_00.size;var_04++)
		{
			var_05 = (var_02[0] + var_03[0] * var_04,var_02[1] + var_03[1] * var_04,var_02[2] + var_03[2] * var_04);
		}

		wait(0.05);
	}
}

//Function Number: 9
func_833A()
{
	if(!isdefined(self.var_C78) || !isdefined(self.var_5F62))
	{
		func_7DB8();
	}
}

//Function Number: 10
func_7DB8()
{
	self.var_C78 = 0.9 + randomfloat(0.2);
	self.var_5F94 = 0.9 + randomfloat(0.2);
	self.var_5F62 = 1;
	self.var_8559 = 1.35;
}

//Function Number: 11
func_4C58(param_00,param_01,param_02,param_03)
{
	anim waittill("new exceptions");
}

//Function Number: 12
func_0139(param_00,param_01,param_02,param_03)
{
}

//Function Number: 13
func_32B5()
{
	self endon("death");
	if(1)
	{
		return;
	}

	for(;;)
	{
		self waittill("enemy");
		if(!isalive(self.enemy))
		{
			continue;
		}

		while(isplayer(self.enemy))
		{
			if(animscripts\utility::func_4729())
			{
				level.var_55C9 = gettime();
			}

			wait(2);
		}
	}
}

//Function Number: 14
func_4E30()
{
	level.var_A32F[0] = -36.8552;
	level.var_A32F[1] = -27.0095;
	level.var_A32F[2] = -15.5981;
	level.var_A32F[3] = -4.37769;
	level.var_A32F[4] = 17.7776;
	level.var_A32F[5] = 59.8499;
	level.var_A32F[6] = 104.808;
	level.var_A32F[7] = 152.325;
	level.var_A32F[8] = 201.052;
	level.var_A32F[9] = 250.244;
	level.var_A32F[10] = 298.971;
	level.var_A32F[11] = 330.681;
}

//Function Number: 15
func_381C()
{
	if(isdefined(level.var_61F5))
	{
		return;
	}

	anim.var_61F5 = 1;
	animscripts\animset::func_4C73();
	anim.var_9BF7 = 0;
	lib_A546::func_4D03();
	level.var_31D.var_4FA4 = 0;
	level.var_60C8 = randomint(3);
	level.var_55C9 = 100;
	anim.defaultexception = ::func_0139;
	func_4DA6();
	setdvar("scr_expDeathMayMoveCheck","on");
	lib_A553::func_823B();
	anim.var_C6E = 0;
	animscripts\init_move_transitions::func_4DF0();
	anim.var_20AE = 10000;
	anim.var_20AF = 6000;
	func_4DBF();
	func_4D7A();
	if(!isdefined(level.var_6545))
	{
		anim.var_6547 = ::animscripts\notetracks::func_6D9E;
		anim.var_6545 = ::animscripts\notetracks::func_6D9D;
	}

	if(!isdefined(level.var_6546))
	{
		anim.var_6546 = [];
	}

	if(!isdefined(level.var_6548))
	{
		anim.var_6548 = [];
	}

	if(!isdefined(level.var_83ED))
	{
		anim.var_83ED = ::animscripts\utility::func_83EF;
	}

	if(!isdefined(level.var_840D))
	{
		anim.var_840D = ::animscripts\utility::func_840C;
	}

	level.var_37BD["scripted"] = ::animscripts\notetracks::func_37C5;
	level.var_37BD["cover_right"] = ::animscripts\notetracks::func_8407;
	level.var_37BD["cover_left"] = ::animscripts\notetracks::func_8407;
	level.var_37BD["cover_crouch"] = ::animscripts\notetracks::func_8407;
	level.var_37BD["cover_stand"] = ::animscripts\notetracks::func_8407;
	level.var_37BD["move"] = ::animscripts\notetracks::func_8407;
	animscripts\notetracks::func_72F0();
	if(!isdefined(level.flag))
	{
		common_scripts\utility::init_flags();
	}

	lib_A52D::func_800A();
	level.var_664D = undefined;
	animscripts\setposemovement::func_4DFF();
	animscripts\face::func_4DEC();
	anim.var_1931 = animscripts\utility::func_CD8(1,2,2,2,3,3,3,3,4,4,5);
	anim.var_3672 = animscripts\utility::func_CD8(2,3,3,3,4,4,4,5,5);
	anim.var_7C74 = animscripts\utility::func_CD8(1,2,2,3,3,4,4,4,4,5,5,5);
	anim.var_126A = [];
	anim.var_1267 = 0;
	anim.var_31D = getentarray("player","classname")[0];
	func_4D89();
	func_4E30();
	animscripts\cqb::func_8302();
	func_4DA4();
	func_7F76();
	anim.lastcarexplosiontime = -100000;
	func_832F();
	level.var_31D thread animscripts\combat_utility::func_A247();
	thread func_09A7();
}

//Function Number: 16
func_4DA6()
{
}

//Function Number: 17
func_4D89()
{
	animscripts\squadmanager::func_4D5C();
	level.var_31D thread animscripts\squadmanager::func_81E();
	if(animscripts\battlechatter::func_9BDA())
	{
		animscripts\battlechatter::func_4CB5();
		level.var_31D thread animscripts\battlechatter_ai::func_850();
		anim thread animscripts\battlechatter::func_1356();
	}
}

//Function Number: 18
func_4DA4()
{
	anim.var_6297 = randomintrange(0,15);
	anim.var_6296 = randomintrange(0,10);
	anim.var_60C4 = gettime() + randomintrange(0,20000);
	anim.var_60C5 = gettime() + randomintrange(0,10000);
	anim.var_60C3 = gettime() + randomintrange(0,15000);
}

//Function Number: 19
func_4DBF()
{
	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		var_01 = level.var_328[var_00];
		var_01.var_440A["fraggrenade"] = randomintrange(1000,20000);
		var_01.var_440A["flash_grenade"] = randomintrange(1000,20000);
		var_01.var_440A["double_grenade"] = randomintrange(1000,60000);
		var_01.var_440A["microwave_grenade"] = randomintrange(1000,20000);
		var_01.var_62A0 = 0;
		var_01.var_55A1 = -1000000;
		var_01.var_559F = -1000000;
		var_01 thread func_7FB8();
	}

	level.var_440A["AI_fraggrenade"] = randomintrange(0,20000);
	level.var_440A["AI_flash_grenade"] = randomintrange(0,20000);
	level.var_440A["AI_smoke_grenade_american"] = randomintrange(0,20000);
	level.var_440A["AI_microwave_grenade"] = randomintrange(0,20000);
	animscripts\combat_utility::func_4DC0();
}

//Function Number: 20
func_4D7A()
{
	level.var_5571 = [];
	level.var_5571["axis"] = 0;
	level.var_5571["allies"] = 0;
	level.var_5571["team3"] = 0;
	level.var_5571["neutral"] = 0;
	level.var_556F = [];
	level.var_556F["axis"] = (0,0,0);
	level.var_556F["allies"] = (0,0,0);
	level.var_556F["team3"] = (0,0,0);
	level.var_556F["neutral"] = (0,0,0);
	level.var_5570 = [];
	level.var_5570["axis"] = (0,0,0);
	level.var_5570["allies"] = (0,0,0);
	level.var_5570["team3"] = (0,0,0);
	level.var_5570["neutral"] = (0,0,0);
	level.var_556E = [];
	level.var_883 = [];
	level.var_883["axis"] = 0;
	level.var_883["allies"] = 0;
	level.var_883["team3"] = 0;
	level.var_883["neutral"] = 0;
	level.var_885 = 30000;
	level.var_884 = 3;
}

//Function Number: 21
func_09A7()
{
	var_00 = 0;
	var_01 = 3;
	for(;;)
	{
		var_02 = function_00D6();
		if(var_02.size == 0)
		{
			wait(0.05);
			var_00 = 0;
			continue;
		}

		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			if(!isdefined(var_02[var_03]))
			{
				continue;
			}

			var_02[var_03] notify("do_slow_things");
			var_00++;
			if(var_00 == var_01)
			{
				wait(0.05);
				var_00 = 0;
			}
		}
	}
}

//Function Number: 22
func_7FB8()
{
	waittillframeend;
	if(isdefined(self.var_443E.var_6CB1))
	{
		var_00 = int(self.var_443E.var_6CB1 * 0.7);
		if(var_00 < 1)
		{
			var_00 = 1;
		}

		self.var_440A["fraggrenade"] = randomintrange(0,var_00);
		self.var_440A["flash_grenade"] = randomintrange(0,var_00);
		self.var_440A["microwave_grenade"] = randomintrange(0,var_00);
	}

	if(isdefined(self.var_443E.var_6C92))
	{
		var_00 = int(self.var_443E.var_6C92);
		var_01 = int(var_00 / 2);
		if(var_00 <= var_01)
		{
			var_00 = var_01 + 1;
		}

		self.var_440A["double_grenade"] = randomintrange(var_01,var_00);
	}
}

//Function Number: 23
begingrenadetracking()
{
	if(isdefined(level.var_2B14))
	{
		return;
	}

	self endon("death");
	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		var_00 thread lib_A59A::grenade_earthquake();
	}
}

//Function Number: 24
func_832F()
{
	anim.var_7122 = 60;
	anim.var_7121 = [];
	for(var_00 = 0;var_00 < level.var_7122;var_00++)
	{
		level.var_7121[var_00] = var_00;
	}

	for(var_00 = 0;var_00 < level.var_7122;var_00++)
	{
		var_01 = randomint(level.var_7122);
		var_02 = level.var_7121[var_00];
		level.var_7121[var_00] = level.var_7121[var_01];
		level.var_7121[var_01] = var_02;
	}
}

//Function Number: 25
ondeath()
{
	if(isdefined(level.var_2B2A))
	{
		return;
	}

	self waittill("death");
	if(!isdefined(self))
	{
		if(isdefined(self.var_7.var_9C34))
		{
			self.var_7.var_9C34 delete();
		}
	}
}