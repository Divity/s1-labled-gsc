/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42317.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 16
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A54D::func_4473(param_00)
{
	self endon("death");
	self notify("end_mg_behavior");
	self endon("end_mg_behavior");
	self.var_1A49 = 1;
	self.var_A148 = 0;
	if(!lib_A54E::func_9BE0(param_00))
	{
		self notify("continue_cover_script");
		return;
	}

	self.var_5521 = undefined;
	thread lib_A54D::func_7280();
	var_01 = anglestoforward(param_00.var_41);
	var_02 = spawn("script_origin",(0,0,0));
	thread lib_A54D::func_919A(var_02);
	var_02.var_2E6 = param_00.var_2E6 + var_01 * 500;
	if(isdefined(self.var_5521))
	{
		var_02.var_2E6 = self.var_5521;
	}

	param_00 settargetentity(var_02);
	var_03 = undefined;
	for(;;)
	{
		if(!isalive(self.var_24DF))
		{
			lib_A54D::func_8E7E();
			self waittill("new_enemy");
		}

		lib_A54D::func_8BA3();
		lib_A54D::func_83D6(var_02);
		if(!isalive(self.var_24DF))
		{
			continue;
		}

		if(self method_81BE(self.var_24DF))
		{
			continue;
		}

		self waittill("saw_enemy");
	}
}

//Function Number: 2
lib_A54D::func_919A(param_00)
{
	common_scripts\utility::waittill_either("death","end_mg_behavior");
	param_00 delete();
}

//Function Number: 3
lib_A54D::func_83D6(param_00)
{
	self endon("death");
	self endon("new_enemy");
	self.var_24DF endon("death");
	var_01 = self.var_24DF;
	while(self method_81BE(var_01))
	{
		var_02 = vectortoangles(var_01 geteye() - param_00.var_2E6);
		var_02 = anglestoforward(var_02);
		param_00 moveto(param_00.var_2E6 + var_02 * 12,0.1);
		wait(0.1);
	}

	if(isplayer(var_01))
	{
		self endon("saw_enemy");
		var_03 = var_01 geteye();
		var_02 = vectortoangles(var_03 - param_00.var_2E6);
		var_02 = anglestoforward(var_02);
		var_04 = 150;
		var_05 = distance(param_00.var_2E6,self.var_5521) / var_04;
		if(var_05 > 0)
		{
			param_00 moveto(self.var_5521,var_05);
			wait(var_05);
		}

		var_06 = param_00.var_2E6 + var_02 * 180;
		var_07 = lib_A54D::func_3E7E(self geteye(),param_00.var_2E6,var_06);
		if(!isdefined(var_07))
		{
			var_07 = param_00.var_2E6;
		}

		param_00 moveto(param_00.var_2E6 + var_02 * 80 + (0,0,randomfloatrange(15,50) * -1),3,1,1);
		wait(3.5);
		param_00 moveto(var_07 + var_02 * -20,3,1,1);
	}

	wait(randomfloatrange(2.5,4));
	lib_A54D::func_8E7E();
}

//Function Number: 4
lib_A54D::func_7E1B(param_00)
{
	if(param_00)
	{
		self.var_1A49 = 1;
		if(self.var_A148)
		{
			self.turret notify("startfiring");
			return;
		}

		return;
	}

	self.var_1A49 = 0;
	self.turret notify("stopfiring");
}

//Function Number: 5
lib_A54D::func_8E7E()
{
	self.var_A148 = 0;
	self.turret notify("stopfiring");
}

//Function Number: 6
lib_A54D::func_8BA3()
{
	self.var_A148 = 1;
	if(self.var_1A49)
	{
		self.turret notify("startfiring");
	}
}

//Function Number: 7
lib_A54D::func_23CC()
{
	if(isdefined(level.var_5BBE))
	{
		level.var_5BBE[level.var_5BBE.size] = self;
		return;
	}

	level.var_5BBE = [];
	level.var_5BBE[level.var_5BBE.size] = self;
	waittillframeend;
	var_00 = spawnstruct();
	common_scripts\utility::array_thread(level.var_5BBE,::lib_A54D::func_5BBD,var_00);
	var_01 = level.var_5BBE;
	level.var_5BBE = undefined;
	var_00 waittill("gunner_died");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(!isalive(var_01[var_02]))
		{
			continue;
		}

		var_01[var_02] notify("stop_using_built_in_burst_fire");
		var_01[var_02] thread lib_A54D::func_886B();
	}
}

//Function Number: 8
lib_A54D::func_5BBD(param_00)
{
	self waittill("death");
	param_00 notify("gunner_died");
}

//Function Number: 9
lib_A54D::func_5BD1(param_00)
{
	wait(1);
	level notify("new_mg_firing_team" + param_00[0].var_39B);
	level endon("new_mg_firing_team" + param_00[0].var_39B);
	for(;;)
	{
		lib_A54D::func_2FAF(param_00);
		lib_A54D::func_886C(param_00);
	}
}

//Function Number: 10
lib_A54D::func_886C(param_00)
{
	var_01 = undefined;
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(!isalive(param_00[var_02]))
		{
			continue;
		}

		var_01 = param_00[var_02];
		break;
	}

	if(!isdefined(var_01))
	{
	}
}

//Function Number: 11
lib_A54D::func_886B()
{
	self endon("death");
	for(;;)
	{
		self.turret startfiring();
		wait(randomfloatrange(0.3,0.7));
		self.turret stopfiring();
		wait(randomfloatrange(0.1,1.1));
	}
}

//Function Number: 12
lib_A54D::func_2FAF(param_00)
{
	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		param_00[var_01] endon("death");
	}

	var_02 = 0;
	var_03 = 1;
	for(;;)
	{
		if(isalive(param_00[var_02]))
		{
			param_00[var_02] lib_A54D::func_7E1B(1);
		}

		if(isalive(param_00[var_03]))
		{
			param_00[var_03] lib_A54D::func_7E1B(0);
		}

		var_04 = var_02;
		var_02 = var_03;
		var_03 = var_04;
		wait(randomfloatrange(2.3,3.5));
	}
}

//Function Number: 13
lib_A54D::func_8A8B(param_00,param_01)
{
	lib_A54D::func_8BA3();
	self endon("death");
	self endon("new_enemy");
	param_01 endon("death");
	while(self method_81BE(param_01))
	{
		var_02 = vectortoangles(param_01 geteye() - param_00.var_2E6);
		var_02 = anglestoforward(var_02);
		param_00 moveto(param_00.var_2E6 + var_02 * 10,0.2);
		wait(0.2);
	}

	var_02 = vectortoangles(param_01 geteye() - param_00.var_2E6);
	var_02 = anglestoforward(var_02);
	var_03 = 150;
	var_04 = distance(param_00.var_2E6,self.var_5521) / var_03;
	param_00 moveto(self.var_5521,var_04);
	wait(var_04);
	var_05 = param_00.var_2E6;
	param_00 moveto(param_00.var_2E6 + var_02 * 80 + (0,0,-25),3,1,1);
	wait(3.5);
	param_00 moveto(var_05 + var_02 * -20,3,1,1);
	wait(1);
	lib_A54D::func_8E7E();
}

//Function Number: 14
lib_A54D::func_3E7E(param_00,param_01,param_02)
{
	var_03 = distance(param_01,param_02) * 0.05;
	if(var_03 < 5)
	{
		var_03 = 5;
	}

	if(var_03 > 20)
	{
		var_03 = 20;
	}

	var_04 = param_02 - param_01;
	var_04 = (var_04[0] / var_03,var_04[1] / var_03,var_04[2] / var_03);
	var_05 = (0,0,0);
	var_06 = undefined;
	for(var_07 = 0;var_07 < var_03 + 2;var_07++)
	{
		var_08 = bullettrace(param_00,param_01 + var_05,0,undefined);
		if(var_08["fraction"] < 1)
		{
			var_06 = var_08["position"];
			break;
		}

		var_05 = var_05 + var_04;
	}

	return var_06;
}

//Function Number: 15
lib_A54D::func_7280()
{
	self endon("death");
	self endon("end_mg_behavior");
	self.var_24DF = undefined;
	for(;;)
	{
		lib_A54D::func_7284();
		wait(0.05);
	}
}

//Function Number: 16
lib_A54D::func_7284()
{
	if(!isalive(self.enemy))
	{
		return;
	}

	if(!self method_81BE(self.enemy))
	{
		return;
	}

	self.var_5521 = self.enemy geteye();
	self notify("saw_enemy");
	if(!isalive(self.var_24DF) || self.var_24DF != self.enemy)
	{
		self.var_24DF = self.enemy;
		self notify("new_enemy");
	}
}