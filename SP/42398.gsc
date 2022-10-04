/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42398.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 100
 * Decompile Time: 23 ms
 * Timestamp: 4/20/2022 8:23:26 PM
*******************************************************************/

//Function Number: 1
lib_A59E::func_4D70()
{
	if(isdefined(level.var_2B2C) && level.var_2B2C)
	{
		return;
	}

	lib_A5A0::func_8168();
	level.var_4803 = common_scripts\utility::array_combine(level.var_4803,lib_A59A::func_40FC("helicopter_crash_location","targetname"));
	lib_A5A0::func_82DD();
	common_scripts\utility::array_thread(getentarray("truckjunk","targetname"),::lib_A5A0::func_987A);
	common_scripts\utility::array_thread(getentarray("truckjunk","script_noteworthy"),::lib_A5A0::func_987A);
	common_scripts\utility::array_thread(common_scripts\utility::getstructarray("truckjunk","targetname"),::lib_A5A0::func_987A);
	common_scripts\utility::array_thread(common_scripts\utility::getstructarray("truckjunk","script_noteworthy"),::lib_A5A0::func_987A);
	lib_A5A0::func_803C();
	lib_A5A0::func_82D6();
	var_00 = lib_A5A0::func_6ECC();
	lib_A5A0::func_82DE(var_00);
	if(isdefined(level.var_6542))
	{
		common_scripts\utility::array_levelthread(level.var_9D14,::lib_A59E::func_97CF);
	}
	else
	{
		common_scripts\utility::array_levelthread(level.var_9D14,::lib_A5A0::func_97CD);
	}

	level.var_9D14 = undefined;
	level.var_56DF = getentarray("script_vehicle","code_classname").size > 0;
	lib_A59A::func_764("invulerable_frags",&"SCRIPT_INVULERABLE_FRAGS",undefined);
	lib_A59A::func_764("invulerable_bullets",&"SCRIPT_INVULERABLE_BULLETS",undefined);
	common_scripts\utility::create_lock("aircraft_wash_math");
}

//Function Number: 2
lib_A59E::func_97CF(param_00)
{
	param_00.var_6541 = 1;
}

//Function Number: 3
lib_A59E::func_9D0F(param_00,param_01,param_02)
{
	return lib_A5A0::func_689(param_00,param_01,param_02);
}

//Function Number: 4
lib_A59E::func_23DE(param_00)
{
	var_01 = lib_A59E::func_7B36(param_00);
	foreach(var_03 in var_01)
	{
		level thread lib_A59E::func_4277(var_03);
	}

	return var_01;
}

//Function Number: 5
lib_A59E::func_4277(param_00)
{
	return lib_A5A0::func_5C6(param_00);
}

//Function Number: 6
lib_A59E::func_7B36(param_00)
{
	var_01 = lib_A5A0::func_5BF(param_00);
	var_02 = [];
	foreach(var_04 in var_01)
	{
		var_02[var_02.size] = lib_A59E::func_9D39(var_04);
	}

	return var_02;
}

//Function Number: 7
lib_A59E::func_9D39(param_00)
{
	return lib_A5A0::func_68B(param_00);
}

//Function Number: 8
lib_A59E::func_530B(param_00,param_01)
{
	return lib_A5A0::func_5DA(param_00,param_01);
}

//Function Number: 9
lib_A59E::func_1862(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level.var_9CA2))
	{
		level.var_9CA2 = [];
	}

	if(!isdefined(param_04))
	{
		param_04 = 0;
	}

	if(!isdefined(param_00))
	{
		param_00 = (0,0,0);
	}

	var_06 = spawnstruct();
	var_06.var_6376 = param_00;
	var_06.var_712E = param_01;
	var_06.maxdamage = param_02;
	var_06.mindamage = param_03;
	var_06.var_1488 = param_04;
	var_06.delay = param_05;
	level.var_9CA2[level.var_9F4B] = var_06;
}

//Function Number: 10
lib_A59E::func_1865(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level.var_9D24))
	{
		level.var_9D24 = [];
	}

	var_06 = lib_A59E::func_1861(param_01,param_02,param_03,param_04,param_05);
	precacherumble(param_00);
	var_06.var_7672 = param_00;
	level.var_9D24[level.var_9F4B] = var_06;
}

//Function Number: 11
lib_A59E::func_1866(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(level.var_9D25))
	{
		level.var_9D25 = [];
	}

	var_07 = lib_A59E::func_1861(param_02,param_03,param_04,param_05,param_06);
	precacherumble(param_01);
	var_07.var_7672 = param_01;
	level.var_9D25[param_00] = var_07;
}

//Function Number: 12
lib_A59E::func_1867(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A59E::func_1861(param_01,param_02,param_03,param_04,param_05);
	var_06.var_7672 = param_00;
	self.var_9D26 = var_06;
	lib_A59E::func_9CE9();
	thread lib_A5A0::func_9D24();
}

//Function Number: 13
lib_A59E::func_1846(param_00,param_01,param_02)
{
	var_03 = level.var_9F4B;
	if(!isdefined(level.var_9C9E))
	{
		level.var_9C9E = [];
	}

	level.var_9C9E[var_03] = lib_A59E::func_1861(param_00,param_01,param_02);
}

//Function Number: 14
lib_A59E::func_1861(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = spawnstruct();
	var_05.var_782A = param_00;
	var_05.duration = param_01;
	var_05.radius = param_02;
	if(isdefined(param_03))
	{
		var_05.var_1318 = param_03;
	}

	if(isdefined(param_04))
	{
		var_05.var_711A = param_04;
	}

	return var_05;
}

//Function Number: 15
lib_A59E::func_184D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(!isdefined(param_05))
	{
		param_05 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	var_0B = spawnstruct();
	var_0B.effect = loadfx(param_00);
	var_0B.tag = param_01;
	var_0B.sound = param_02;
	var_0B.var_182E = param_05;
	var_0B.delay = param_04;
	var_0B.var_A004 = param_06;
	var_0B.var_8D7B = param_07;
	var_0B.notifystring = param_08;
	var_0B.var_136B = param_03;
	var_0B.var_7C71 = param_09;
	var_0B.var_733D = param_0A;
	return var_0B;
}

//Function Number: 16
lib_A59E::func_1844(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C)
{
	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}

	level.var_9F72 = param_01;
	level.var_9F4D = param_02;
	level.var_9F71 = 1;
	level.var_9F4B = param_00;
	if(!isdefined(level.var_9C9F))
	{
		level.var_9C9F = [];
	}

	if(!lib_A59E::func_5059(param_00))
	{
		level.var_9C9F[param_00] = [];
	}

	level.var_9CA0[param_00] = 1;
	if(!isdefined(level.var_9C9F[param_00]))
	{
		level.var_9C9F[param_00] = [];
	}

	level.var_9C9F[param_00][level.var_9C9F[param_00].size] = lib_A59E::func_184D(param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C);
	level.var_9F71 = undefined;
}

//Function Number: 17
lib_A59E::func_1842(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	var_0B = level.var_9F4B;
	if(lib_A59E::func_5059(var_0B))
	{
		return;
	}

	if(!isdefined(level.var_9C9F[var_0B]))
	{
		level.var_9C9F[var_0B] = [];
	}

	level.var_9C9F[var_0B][level.var_9C9F[var_0B].size] = lib_A59E::func_184D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
}

//Function Number: 18
lib_A59E::func_1843(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	var_0B = level.var_9F4B;
	level.var_9F4B = "script_model";
	lib_A59E::func_1842(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
	level.var_9F4B = var_0B;
}

//Function Number: 19
lib_A59E::func_1841(param_00)
{
	var_01 = level.var_9F4B;
	if(!isdefined(level.var_9C9C[var_01]))
	{
		level.var_9C9C[var_01] = [];
	}

	level.var_9C9C[var_01] = param_00;
}

//Function Number: 20
lib_A59E::func_5059(param_00)
{
	if(!isdefined(level.var_9CA0))
	{
		return 0;
	}

	if(!isdefined(level.var_9CA0[param_00]))
	{
		return 0;
	}

	if(isdefined(level.var_9F71))
	{
		return 1;
	}

	return level.var_9CA0[param_00];
}

//Function Number: 21
lib_A59E::func_1864(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	var_0B = level.var_9F4B;
	level.var_9F4B = "rocket_death" + var_0B;
	lib_A59E::func_1842(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
	level.var_9F4B = var_0B;
}

//Function Number: 22
lib_A59E::func_3998()
{
	return lib_A5A0::func_5AF();
}

//Function Number: 23
lib_A59E::func_4256()
{
	self.godmode = 1;
}

//Function Number: 24
lib_A59E::func_4255()
{
	self.godmode = 0;
}

//Function Number: 25
lib_A59E::func_5BCF()
{
	return lib_A5A0::func_5EF();
}

//Function Number: 26
lib_A59E::func_5BD0()
{
	return lib_A5A0::func_5F0();
}

//Function Number: 27
lib_A59E::func_51FA()
{
	return isdefined(self.vehicletype);
}

//Function Number: 28
lib_A59E::func_185C(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B)
{
	if(!isdefined(level.var_9D05))
	{
		level.var_9D05 = [];
	}

	var_0C = level.var_9F4B;
	if(!isdefined(level.var_9D05[var_0C]))
	{
		level.var_9D05[var_0C] = [];
	}

	precachemodel(param_02);
	precacheitem(param_03);
	var_0D = spawnstruct();
	var_0D.tag = param_01;
	var_0D.var_5C9D = param_02;
	var_0D.var_5C9E = param_03;
	var_0D.var_6EA0 = param_04;
	var_0D.var_6E70 = param_05;
	var_0D.var_4E9D = param_06;
	var_0D.var_4941 = param_07;
	var_0D.var_4940 = param_08;
	var_0D.var_77CF = param_09;
	var_0D.var_77CE = param_0A;
	var_0D.var_5C88 = param_0B;
	level.var_9D05[var_0C][level.var_9D05[var_0C].size] = var_0D;
}

//Function Number: 29
lib_A59E::func_1872(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	if(!isdefined(level.var_9D04))
	{
		level.var_9D04 = [];
	}

	var_09 = level.var_9F4B;
	if(!isdefined(level.var_9D04[var_09]))
	{
		level.var_9D04[var_09] = [];
	}

	precachemodel(param_02);
	precacheturret(param_00);
	var_0A = spawnstruct();
	var_0A.var_4C59 = param_00;
	var_0A.tag = param_01;
	var_0A.model = param_02;
	var_0A.var_276 = param_03;
	var_0A.var_279A = param_04;
	var_0A.var_284A = param_05;
	var_0A.var_2793 = param_06;
	var_0A.var_2794 = param_07;
	if(isdefined(param_08))
	{
		var_0A.var_637A = param_08;
	}

	level.var_9D04[var_09][level.var_9D04[var_09].size] = var_0A;
}

//Function Number: 30
lib_A59E::func_9CE3()
{
	return lib_A5A0::func_687();
}

//Function Number: 31
lib_A59E::func_502E()
{
	return lib_A5A0::func_5D6();
}

//Function Number: 32
lib_A59E::func_9CE9()
{
	self notify("kill_rumble_forever");
}

//Function Number: 33
lib_A59E::func_5F37(param_00)
{
	if(!isdefined(self.var_987A))
	{
		return;
	}

	foreach(var_02 in self.var_987A)
	{
		if(var_02 == param_00)
		{
			continue;
		}

		var_02 unlink();
		if(isdefined(var_02.var_79F8))
		{
			var_02 linkto(param_00,var_02.var_79F8,var_02.var_12FD,var_02.var_12F2);
			continue;
		}

		var_02 linkto(param_00);
	}
}

//Function Number: 34
lib_A59E::func_2FC2()
{
	if(lib_A59E::func_5115())
	{
		self.modeldummy.var_2E6 = self gettagorigin("tag_ground");
	}
	else
	{
		self.modeldummy.var_2E6 = self.var_2E6;
		self.modeldummy.var_41 = self.var_41;
	}

	self show();
	lib_A59E::func_5F20(self);
	lib_A5A0::func_5F38(self);
	thread lib_A5A0::func_5F15(self);
	lib_A5A0::func_5F09(self);
	self.modeldummyon = 0;
	self.modeldummy delete();
	self.modeldummy = undefined;
	if(lib_A5A0::func_472C())
	{
		self notify("stop_kicking_up_dust");
		thread lib_A5A0::func_995();
	}

	return self.modeldummy;
}

//Function Number: 35
lib_A59E::func_5F20(param_00)
{
	if(!isdefined(self.var_7507))
	{
		return;
	}

	var_01 = self.var_7507;
	foreach(var_03 in var_01)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_04 = lib_A59F::func_BE9(self,var_03.var_9D13);
		if(isdefined(var_04.var_66B1))
		{
			continue;
		}

		var_03 unlink();
		var_03 linkto(param_00,var_04.var_85A8,(0,0,0),(0,0,0));
		if(isai(var_03))
		{
			var_03 method_81C6(param_00 gettagorigin(var_04.var_85A8));
			continue;
		}

		var_03.var_2E6 = param_00 gettagorigin(var_04.var_85A8);
	}
}

//Function Number: 36
lib_A59E::func_8976(param_00)
{
	var_01 = [];
	var_01 = lib_A5A0::func_8978(param_00);
	return var_01;
}

//Function Number: 37
lib_A59E::func_8972(param_00)
{
	var_01 = lib_A59E::func_8976(param_00);
	return var_01[0];
}

//Function Number: 38
lib_A59E::func_8973(param_00)
{
	var_01 = lib_A59E::func_8976(param_00);
	thread lib_A59E::func_4277(var_01[0]);
	return var_01[0];
}

//Function Number: 39
lib_A59E::func_8977(param_00)
{
	var_01 = lib_A59E::func_8976(param_00);
	foreach(var_03 in var_01)
	{
		thread lib_A59E::func_4277(var_03);
	}

	return var_01;
}

//Function Number: 40
lib_A59E::func_0994(param_00)
{
	thread lib_A5A0::func_995(param_00);
}

//Function Number: 41
lib_A59E::func_9D66()
{
	lib_A5A0::func_A2F6(1);
}

//Function Number: 42
lib_A59E::func_9D65()
{
	lib_A5A0::func_A2F6(0);
}

//Function Number: 43
lib_A59E::func_1857(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level.var_9CF6))
	{
		level.var_9CF6 = [];
	}

	if(!isdefined(level.var_9CF8))
	{
		level.var_9CF8 = [];
	}

	if(isdefined(level.var_9CF8[param_04]) && !level.var_9F71)
	{
		return;
	}

	var_06 = spawnstruct();
	var_06.name = param_01;
	var_06.tag = param_02;
	var_06.delay = param_05;
	var_06.effect = loadfx(param_03);
	level.var_9CF6[param_00][param_01] = var_06;
	lib_A5A0::func_4427(param_00,param_01,"all");
	if(isdefined(param_04))
	{
		lib_A5A0::func_4427(param_00,param_01,param_04);
	}
}

//Function Number: 44
lib_A59E::func_1858(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}

	level.var_9F4B = param_00;
	lib_A59E::func_1857(param_00,param_01,param_02,param_03,param_04,param_05);
	level.var_9F71 = 0;
	level.var_9CF8[param_04] = 1;
}

//Function Number: 45
lib_A59E::func_1850(param_00,param_01)
{
	if(!isdefined(level.var_9CDB))
	{
		level.var_9CDB = [];
	}

	level.var_9CDB[param_00] = param_01;
}

//Function Number: 46
lib_A59E::func_1845(param_00,param_01,param_02,param_03)
{
	if(param_00 != level.var_9F4D && level.var_9F4D != "script_model")
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = param_00;
	}

	precachemodel(param_00);
	precachemodel(param_01);
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		level.var_9CA6[param_00] = param_01;
		level.var_9CA7[param_00] = param_02;
		return;
	}

	level.var_9CA6[param_03] = param_01;
	level.var_9CA7[param_03] = param_02;
}

//Function Number: 47
lib_A59E::func_1868(param_00)
{
	precacheshellshock(param_00);
	level.var_9D31[level.var_9F4B] = param_00;
}

//Function Number: 48
lib_A59E::func_1853(param_00)
{
	if(!isdefined(level.var_9CDE))
	{
		level.var_9CDE = [];
	}

	if(!isdefined(level.var_9CDE[level.var_9F4D]))
	{
		level.var_9CDE[level.var_9F4D] = [];
	}

	level.var_9CDE[level.var_9F4D][level.var_9CDE[level.var_9F4D].size] = param_00;
}

//Function Number: 49
lib_A59E::func_1849(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 10;
	}

	level.var_9CB0[level.var_9F4D] = param_00;
	if(isdefined(param_01))
	{
		level.var_9CB3[level.var_9F4D] = param_01;
	}

	level.var_9CB2[level.var_9F4D] = param_02;
	if(isdefined(param_03))
	{
		level.var_9CB1[level.var_9F4D] = param_03;
	}
}

//Function Number: 50
lib_A59E::func_186C(param_00,param_01,param_02,param_03)
{
	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}

	if(isdefined(param_02))
	{
		param_00 = param_02;
	}

	if(param_00 != "script_model")
	{
		veh_precache(param_00);
	}

	if(!isdefined(level.var_9C9F))
	{
		level.var_9C9F = [];
	}

	if(!isdefined(level.var_9C9C))
	{
		level.var_9C9C = [];
	}

	if(!isdefined(level.var_9C9F[param_03]))
	{
		level.var_9C9F[param_03] = [];
	}

	level.var_9D4D[param_03] = "axis";
	level.var_9CF1[param_03] = 999;
	level.var_9CD8[param_01] = 0;
	level.var_9D02[param_01] = [];
	level.var_9F4D = param_01;
	level.var_9F72 = param_00;
	level.var_9F4B = param_03;
}

//Function Number: 51
lib_A59E::func_184B(param_00)
{
	level.var_9CB9[level.var_9F4D] = loadfx(param_00);
}

//Function Number: 52
lib_A59E::func_186E(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00))
	{
		lib_A59E::func_7EF7(param_00,param_01,param_02);
		if(isdefined(param_03) && param_03)
		{
			lib_A59E::func_7EF7(param_00,param_01,param_02,"_bank");
			lib_A59E::func_7EF7(param_00,param_01,param_02,"_bank_lg");
			return;
		}

		return;
	}

	param_00 = level.var_9F4B;
	lib_A593::main(param_00);
}

//Function Number: 53
lib_A59E::func_1871(param_00,param_01,param_02,param_03)
{
	lib_A59E::func_186E(param_00,param_01 + "_script_model",param_02,param_03);
}

//Function Number: 54
lib_A59E::func_1870(param_00,param_01)
{
	if(!isdefined(level.var_686))
	{
		level.var_686 = [];
	}

	if(!isdefined(level.var_686[param_00]))
	{
		level.var_686[param_00] = spawnstruct();
	}

	level.var_686[param_00].var_90FF = param_01;
}

//Function Number: 55
lib_A59E::func_186F(param_00,param_01)
{
	if(!isdefined(level.var_686))
	{
		level.var_686 = [];
	}

	if(!isdefined(level.var_686[param_00]))
	{
		level.var_686[param_00] = spawnstruct();
	}

	level.var_686[param_00].var_3E7F = param_01;
}

//Function Number: 56
lib_A59E::func_183A(param_00,param_01)
{
	var_02 = lib_A59E::func_3E80();
	foreach(var_04 in var_02)
	{
		lib_A59E::func_7EF7(param_00,var_04);
	}
}

//Function Number: 57
lib_A59E::func_7EF7(param_00,param_01,param_02,param_03)
{
	if(!isdefined(level.var_685))
	{
		level.var_685 = [];
	}

	if(isdefined(param_03))
	{
		param_01 = param_01 + param_03;
		param_02 = param_02 + param_03;
	}

	if(isdefined(param_02))
	{
		level.var_685[param_00][param_01] = loadfx(param_02);
		return;
	}

	if(isdefined(level.var_685[param_00]) && isdefined(level.var_685[param_00][param_01]))
	{
		level.var_685[param_00][param_01] = undefined;
	}
}

//Function Number: 58
lib_A59E::func_3E80()
{
	var_00 = [];
	var_00[var_00.size] = "brick";
	var_00[var_00.size] = "bark";
	var_00[var_00.size] = "carpet";
	var_00[var_00.size] = "cloth";
	var_00[var_00.size] = "concrete";
	var_00[var_00.size] = "dirt";
	var_00[var_00.size] = "flesh";
	var_00[var_00.size] = "foliage";
	var_00[var_00.size] = "glass";
	var_00[var_00.size] = "grass";
	var_00[var_00.size] = "gravel";
	var_00[var_00.size] = "ice";
	var_00[var_00.size] = "metal";
	var_00[var_00.size] = "mud";
	var_00[var_00.size] = "paper";
	var_00[var_00.size] = "plaster";
	var_00[var_00.size] = "rock";
	var_00[var_00.size] = "sand";
	var_00[var_00.size] = "snow";
	var_00[var_00.size] = "water";
	var_00[var_00.size] = "wood";
	var_00[var_00.size] = "asphalt";
	var_00[var_00.size] = "ceramic";
	var_00[var_00.size] = "plastic";
	var_00[var_00.size] = "rubber";
	var_00[var_00.size] = "cushion";
	var_00[var_00.size] = "fruit";
	var_00[var_00.size] = "paintedmetal";
	var_00[var_00.size] = "riotshield";
	var_00[var_00.size] = "slush";
	var_00[var_00.size] = "default";
	return var_00;
}

//Function Number: 59
lib_A59E::func_186A(param_00)
{
	level.var_9D4D[level.var_9F4B] = param_00;
}

//Function Number: 60
lib_A59E::func_185A(param_00,param_01,param_02,param_03)
{
	level.var_9CD8[level.var_9F4D] = 1;
	if(isdefined(param_00))
	{
		level.var_9D02[level.var_9F4D][param_00] = 1;
	}

	if(isdefined(param_01))
	{
		level.var_9D02[level.var_9F4D][param_01] = 1;
	}

	if(isdefined(param_02))
	{
		level.var_9D02[level.var_9F4D][param_02] = 1;
	}

	if(isdefined(param_03))
	{
		level.var_9D02[level.var_9F4D][param_03] = 1;
	}
}

//Function Number: 61
lib_A59E::func_183C(param_00)
{
	level.var_9C8A[level.var_9F4B] = param_00;
}

//Function Number: 62
lib_A59E::func_184F(param_00)
{
	level.var_9CD3[level.var_9F4B] = param_00;
}

//Function Number: 63
lib_A59E::func_1839(param_00,param_01)
{
	var_02 = level.var_9F4B;
	level.var_9C7A[var_02] = [[ param_00 ]]();
	if(isdefined(param_01))
	{
		level.var_9C7A[var_02] = [[ param_01 ]](level.var_9C7A[var_02]);
	}
}

//Function Number: 64
lib_A59E::func_184C(param_00)
{
	level.var_9CBF[level.var_9F4B] = param_00;
}

//Function Number: 65
lib_A59E::func_183B(param_00)
{
	level.var_9C85[level.var_9F4B] = [[ param_00 ]]();
}

//Function Number: 66
lib_A59E::func_1873(param_00)
{
	level.var_9D61[level.var_9F4B] = [[ param_00 ]]();
}

//Function Number: 67
lib_A59E::func_1856(param_00,param_01,param_02)
{
	var_03 = level.var_9F4B;
	level.var_9CF1[var_03] = param_00;
	level.var_9CF3[var_03] = param_01;
	level.var_9CF2[var_03] = param_02;
}

//Function Number: 68
lib_A59E::func_1847(param_00)
{
	level.var_9CA9[level.var_9F4D] = loadfx(param_00);
}

//Function Number: 69
lib_A59E::func_1848(param_00,param_01)
{
	if(isdefined(level.var_9C98))
	{
		return;
	}

	if(param_00 != level.var_9F4D)
	{
		return;
	}

	var_02 = spawnstruct();
	var_02.model = param_00;
	var_02 lib_A59A::func_6EB7(param_01);
	level.var_2921[level.var_9F4D] = param_01;
}

//Function Number: 70
lib_A59E::func_1859(param_00)
{
	level.var_9D6E[level.var_9F72][level.var_9F4B] = param_00;
}

//Function Number: 71
lib_A59E::func_501A()
{
	return self.modeldummyon;
}

//Function Number: 72
lib_A59E::func_9CFD(param_00,param_01,param_02)
{
	lib_A59F::func_57BC(param_00,undefined,param_02);
}

//Function Number: 73
lib_A59E::func_9CFE(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A59F::func_57BC(var_03,param_01,param_02);
}

//Function Number: 74
lib_A59E::func_183F(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level.var_9C9D))
	{
		level.var_9C9D = [];
	}

	var_06 = spawnstruct();
	var_06.delay = param_00;
	var_06.duration = param_01;
	var_06.height = param_02;
	var_06.radius = param_03;
	var_06.var_91E0 = param_04;
	var_06.var_91E1 = param_05;
	level.var_9C9D[level.var_9F4B] = var_06;
}

//Function Number: 75
lib_A59E::func_5EF9(param_00,param_01)
{
	return lib_A5A0::func_5FC(param_00,param_01);
}

//Function Number: 76
lib_A59E::func_8971()
{
	var_00 = lib_A59A::func_896F();
	if(isdefined(self.var_7ACD))
	{
		if(!lib_A59E::func_5115())
		{
			var_00 vehphys_setspeed(self.var_7ACD);
		}
	}

	var_00 thread lib_A59E::func_4277(var_00);
	return var_00;
}

//Function Number: 77
lib_A59E::func_9CC5(param_00)
{
	var_01 = [];
	var_02 = self.classname;
	if(!isdefined(level.var_9D61[var_02]))
	{
		return var_01;
	}

	var_03 = level.var_9D61[var_02];
	if(!isdefined(param_00))
	{
		return var_01;
	}

	foreach(var_05 in self.var_7507)
	{
		foreach(var_07 in var_03[param_00])
		{
			if(var_05.var_9D13 == var_07)
			{
				var_01[var_01.size] = var_05;
			}
		}
	}

	return var_01;
}

//Function Number: 78
lib_A59E::func_9C77(param_00)
{
	return lib_A59F::func_C57(param_00);
}

//Function Number: 79
lib_A59E::func_9D5F(param_00)
{
	return lib_A5A0::func_68D(param_00);
}

//Function Number: 80
lib_A59E::func_9D5A()
{
	self endon("death");
	self endon("stop_scanning_turret");
	var_00 = randomint(2);
	while(isdefined(self))
	{
		if(common_scripts\utility::cointoss())
		{
			lib_A5A0::func_9C7C(0);
			wait(randomfloatrange(2,10));
		}

		if(var_00 == 0)
		{
			var_01 = randomintrange(10,30);
			var_00 = 1;
		}
		else
		{
			var_01 = randomintrange(-30,-10);
			var_00 = 0;
		}

		lib_A5A0::func_9C7C(var_01);
		wait(randomfloatrange(2,10));
	}
}

//Function Number: 81
lib_A59E::func_9D59()
{
	self notify("stop_scanning_turret");
}

//Function Number: 82
lib_A59E::func_9CC3()
{
	self endon("death");
	var_00 = [];
	var_01 = self.var_DF6;
	if(!isdefined(self.var_DF6))
	{
		return var_00;
	}

	var_02 = var_01;
	var_02.var_2240 = 0;
	while(isdefined(var_02))
	{
		if(isdefined(var_02.var_2240) && var_02.var_2240 == 1)
		{
			break;
		}

		var_00 = common_scripts\utility::array_add(var_00,var_02);
		var_02.var_2240 = 1;
		if(!isdefined(var_02.target))
		{
			break;
		}

		if(!lib_A59E::func_5115())
		{
			var_02 = vehpath_getnode(var_02.target,"targetname");
			continue;
		}

		var_02 = lib_A59A::func_3F80(var_02.target,"targetname");
	}

	return var_00;
}

//Function Number: 83
lib_A59E::func_9CFA(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "all";
	}

	lib_A5A0::func_5745(param_00,param_01);
}

//Function Number: 84
lib_A59E::func_9CF9(param_00,param_01)
{
	lib_A5A0::func_5743(param_00,param_01);
}

//Function Number: 85
lib_A59E::func_9D37(param_00)
{
	if(!isdefined(self) || !isdefined(self.classname) || !isdefined(param_00))
	{
		return;
	}

	if(!isdefined(level.var_9CF6[self.classname]))
	{
		return;
	}

	var_01 = level.var_9CF6[self.classname][param_00];
	if(!isdefined(var_01))
	{
		return;
	}

	if(isdefined(var_01.delay))
	{
		var_02 = var_01.delay;
	}
	else
	{
		var_02 = 0;
	}

	self endon("death");
	childthread common_scripts\utility::noself_delaycall_proc(::playfxontag,var_02,var_01.effect,self,var_01.tag);
	self.var_5741[param_00] = 1;
}

//Function Number: 86
lib_A59E::func_9D36(param_00)
{
	if(!isdefined(self.var_5741))
	{
		return;
	}

	if(!isdefined(self.var_5741[param_00]))
	{
		return;
	}

	var_01 = level.var_9CF6[self.classname][param_00];
	if(!isdefined(var_01))
	{
		return;
	}

	stopfxontag(var_01.effect,self,var_01.tag);
	self.var_5741[param_00] = undefined;
}

//Function Number: 87
lib_A59E::func_9D45(param_00,param_01)
{
	self veh_setswitchnode(param_00,param_01);
	self.var_DF6 = param_01;
	thread lib_A59E::func_9D0F();
}

//Function Number: 88
lib_A59E::func_9D44(param_00,param_01,param_02)
{
	return lib_A5A0::func_68C(param_00,param_01,param_02);
}

//Function Number: 89
lib_A59E::func_9D16(param_00)
{
	return lib_A5A0::func_68A(param_00);
}

//Function Number: 90
lib_A59E::func_1855(param_00)
{
	if(!isdefined(level.var_480D))
	{
		level.var_480D = [];
	}

	if(!isdefined(param_00))
	{
		param_00 = level.var_9F72;
	}

	level.var_480D[param_00] = 1;
}

//Function Number: 91
lib_A59E::func_1854(param_00)
{
	if(!isdefined(level.var_997))
	{
		level.var_997 = [];
	}

	if(!isdefined(param_00))
	{
		param_00 = level.var_9F72;
	}

	level.var_997[param_00] = 1;
}

//Function Number: 92
lib_A59E::func_1869(param_00)
{
	if(!isdefined(level.var_9D38))
	{
		level.var_9D38 = [];
	}

	if(!isdefined(param_00))
	{
		param_00 = level.var_9F72;
	}

	level.var_9D38[param_00] = 1;
}

//Function Number: 93
lib_A59E::func_9D2C(param_00)
{
	if(isdefined(self.var_4783))
	{
		self.health = param_00 + self.var_4783;
	}
	else
	{
		self.health = param_00;
	}

	self.var_2516 = self.health;
}

//Function Number: 94
lib_A59E::func_1863(param_00)
{
	if(!isdefined(level.var_9D1C))
	{
		level.var_9D1C = [];
	}

	level.var_9D1C[level.var_9F4B] = param_00;
}

//Function Number: 95
lib_A59E::func_5115()
{
	return lib_A5A0::func_5D8();
}

//Function Number: 96
lib_A59E::func_50AD()
{
	return lib_A5A0::func_5D7();
}

//Function Number: 97
lib_A59E::get_dummy()
{
	return lib_A5A0::func_5B3();
}

//Function Number: 98
lib_A59E::func_9D50()
{
	self.modeldummy = spawn("script_model",self.var_2E6);
	self.modeldummy setmodel(self.model);
	self.modeldummy.var_2E6 = self.var_2E6;
	self.modeldummy.var_41 = self.var_41;
	self.modeldummy method_8115(#animtree);
	self hide();
	thread lib_A5A0::func_5D35();
	lib_A59E::func_5F20(self.modeldummy);
	lib_A5A0::func_5F38(self.modeldummy);
	lib_A59E::func_5F37(self.modeldummy);
	thread lib_A5A0::func_5F15(self.modeldummy);
	lib_A5A0::func_5F09(self.modeldummy);
	lib_A5A0::func_21D3(self.modeldummy);
	self.modeldummyon = 1;
	if(lib_A5A0::func_472C())
	{
		self notify("stop_kicking_up_dust");
		thread lib_A5A0::func_995(self.modeldummy);
	}

	return self.modeldummy;
}

//Function Number: 99
lib_A59E::func_1840(param_00)
{
	if(!isdefined(level.var_9CA1))
	{
		level.var_9CA1 = [];
	}

	var_01 = spawnstruct();
	var_01.delay = param_00;
	level.var_9CA1[level.var_9F4B] = var_01;
}

//Function Number: 100
lib_A59E::func_30C5()
{
	level.var_9D3A = 1;
}