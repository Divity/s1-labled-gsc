/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: squadmanager.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 32
 * Decompile Time: 1126 ms
 * Timestamp: 4/20/2022 8:20:50 PM
*******************************************************************/

//Function Number: 1
func_4D5C()
{
	if(isdefined(level.var_8AC9) && level.var_8AC9)
	{
		return;
	}

	anim.var_8AC3 = [];
	anim.var_8AC4 = [];
	anim.var_8ACF = [];
	anim.var_8AC8 = [];
	anim.var_8ACE = 0;
	anim.var_8AC9 = 1;
	lib_A59A::set_console_status();
}

//Function Number: 2
func_2441(param_00,param_01)
{
	level.var_8ACF[param_00] = spawnstruct();
	var_02 = level.var_8ACF[param_00];
	var_02.var_3F0 = param_00;
	var_02.inliveplayerkillstreak = func_40E2(param_01);
	var_02.var_8564 = 0;
	var_02.var_2E6 = undefined;
	var_02.forward = undefined;
	var_02.enemy = undefined;
	var_02.var_5121 = 0;
	var_02.var_5B9D = 0;
	var_02.var_5BA3 = [];
	var_02.var_6373 = [];
	var_02.var_6371 = 0;
	var_02.var_8ACA = [];
	var_02.var_5B9A = [];
	var_02.var_5B9B = [];
	var_02.var_5BA1 = [];
	var_02.var_5BA2 = [];
	var_02.var_8AD3 = [];
	var_02.var_8AD4 = [];
	var_02.var_8AC7 = level.var_8AC8.size;
	var_02 func_4E26("combat",0.75);
	var_02 func_4E26("cover",0.75);
	var_02 func_4E26("move",0.75);
	var_02 func_4E26("stop",0.75);
	var_02 func_4E26("death",0.75);
	var_02 func_4E26("suppressed",0.75);
	var_02 func_4E26("attacking",0.5);
	level.var_8AC8[level.var_8AC8.size] = var_02;
	var_02 func_9B6C();
	level notify("squad created " + param_00);
	anim notify("squad created " + param_00);
	for(var_03 = 0;var_03 < level.var_8AC3.size;var_03++)
	{
		var_04 = level.var_8AC3[var_03];
		var_02 thread [[ var_04 ]]();
	}

	for(var_03 = 0;var_03 < level.var_8AC8.size;var_03++)
	{
		level.var_8AC8[var_03] func_9B6C();
	}

	var_02 thread func_9B9A();
	var_02 thread func_8AD2();
	var_02 thread func_6374();
	var_02 thread func_9B2E();
	return var_02;
}

//Function Number: 3
func_286B(param_00)
{
	if(param_00 == "axis" || param_00 == "team3" || param_00 == "allies")
	{
		return;
	}

	var_01 = level.var_8ACF[param_00].var_8AC7;
	var_02 = level.var_8ACF[param_00];
	var_02 notify("squad_deleting");
	while(var_02.var_5BA3.size)
	{
		var_02.var_5BA3[0] func_084F(var_02.var_5BA3[0].inliveplayerkillstreak);
	}

	level.var_8AC8[var_01] = level.var_8AC8[level.var_8AC8.size - 1];
	level.var_8AC8[var_01].var_8AC7 = var_01;
	level.var_8AC8[level.var_8AC8.size - 1] = undefined;
	level.var_8ACF[param_00] = undefined;
	level notify("squad deleted " + param_00);
	anim notify("squad deleted " + param_00);
	for(var_03 = 0;var_03 < level.var_8AC8.size;var_03++)
	{
		level.var_8AC8[var_03] func_9B6C();
	}
}

//Function Number: 4
func_3C84()
{
	var_00 = "auto" + level.var_8ACE;
	level.var_8ACE++;
	return var_00;
}

//Function Number: 5
func_081E(param_00)
{
	if(!isdefined(param_00))
	{
		if(isdefined(self.var_7AD1))
		{
			param_00 = self.var_7AD1;
		}
		else
		{
			param_00 = self.inliveplayerkillstreak;
		}
	}

	if(!isdefined(level.var_8ACF[param_00]))
	{
		anim func_2441(param_00,self);
	}

	var_01 = level.var_8ACF[param_00];
	self.var_8AAA = var_01;
}

//Function Number: 6
func_8AC2()
{
	self endon("death");
	wait(10);
	if(!isdefined(self.var_7AD1))
	{
		var_00 = self.inliveplayerkillstreak + self.var_79D8;
	}
	else
	{
		var_00 = self.var_7AD1 + self.var_79D8;
	}

	func_084F(var_00);
}

//Function Number: 7
func_40E2(param_00)
{
	var_01 = "allies";
	if(param_00.inliveplayerkillstreak == "axis" || param_00.inliveplayerkillstreak == "neutral" || param_00.inliveplayerkillstreak == "team3")
	{
		var_01 = param_00.inliveplayerkillstreak;
	}

	return var_01;
}

//Function Number: 8
func_084F(param_00)
{
	if(!isdefined(param_00))
	{
		if(isdefined(self.var_79D8))
		{
			thread func_8AC2();
		}

		if(isdefined(self.var_7AD1))
		{
			param_00 = self.var_7AD1;
		}
		else
		{
			param_00 = self.inliveplayerkillstreak;
		}
	}

	if(!isdefined(level.var_8ACF[param_00]))
	{
		anim func_2441(param_00,self);
	}

	var_01 = level.var_8ACF[param_00];
	if(isdefined(self.var_8AAA))
	{
		if(self.var_8AAA == var_01)
		{
			return;
		}
		else
		{
			func_73AA();
		}
	}

	self.var_559A = 0;
	self.var_20B5 = 0;
	self.var_8AAA = var_01;
	self.var_5BA0 = var_01.var_5BA3.size;
	var_01.var_5BA3[self.var_5BA0] = self;
	var_01.var_5B9D = var_01.var_5BA3.size;
	if(isdefined(level.var_57D7))
	{
		if(self.inliveplayerkillstreak == "allies" && animscripts\battlechatter::func_5161())
		{
			func_0817();
		}
	}

	for(var_02 = 0;var_02 < self.var_8AAA.var_5B9A.size;var_02++)
	{
		var_03 = self.var_8AAA.var_5B9A[var_02];
		self thread [[ var_03 ]](self.var_8AAA.var_3F0);
	}

	lib_A51B::func_25FA();
	thread func_5B9C();
	thread func_5B9E();
}

//Function Number: 9
func_73AA()
{
	var_00 = self.var_8AAA;
	var_01 = -1;
	if(isdefined(self))
	{
		var_01 = self.var_5BA0;
	}
	else
	{
		for(var_02 = 0;var_02 < var_00.var_5BA3.size;var_02++)
		{
			if(var_00.var_5BA3[var_02] == self)
			{
				var_01 = var_02;
			}
		}
	}

	if(var_01 != var_00.var_5BA3.size - 1)
	{
		var_03 = var_00.var_5BA3[var_00.var_5BA3.size - 1];
		var_00.var_5BA3[var_01] = var_03;
		if(isdefined(var_03))
		{
			var_03.var_5BA0 = var_01;
		}
	}

	var_00.var_5BA3[var_00.var_5BA3.size - 1] = undefined;
	var_00.var_5B9D = var_00.var_5BA3.size;
	if(isdefined(self.var_6372))
	{
		func_73BA();
	}

	if(isdefined(self) && isdefined(self.inliveplayerkillstreak))
	{
		lib_A51B::func_2613();
	}

	for(var_02 = 0;var_02 < self.var_8AAA.var_5BA1.size;var_02++)
	{
		var_04 = self.var_8AAA.var_5BA1[var_02];
		self thread [[ var_04 ]](var_00.var_3F0);
	}

	if(var_00.var_5B9D == 0)
	{
		func_286B(var_00.var_3F0);
	}

	if(isdefined(self))
	{
		self.var_8AAA = undefined;
		self.var_5BA0 = undefined;
	}

	self notify("removed from squad");
}

//Function Number: 10
func_0817()
{
	var_00 = self.var_8AAA;
	if(isdefined(self.var_6372))
	{
		return;
	}

	self.var_6372 = var_00.var_6373.size;
	var_00.var_6373[self.var_6372] = self;
	var_00.var_6371 = var_00.var_6373.size;
}

//Function Number: 11
func_73BA()
{
	var_00 = self.var_8AAA;
	var_01 = -1;
	if(isdefined(self))
	{
		var_01 = self.var_6372;
	}
	else
	{
		for(var_02 = 0;var_02 < var_00.var_6373.size;var_02++)
		{
			if(var_00.var_6373[var_02] == self)
			{
				var_01 = var_02;
			}
		}
	}

	if(var_01 != var_00.var_6373.size - 1)
	{
		var_03 = var_00.var_6373[var_00.var_6373.size - 1];
		var_00.var_6373[var_01] = var_03;
		if(isdefined(var_03))
		{
			var_03.var_6372 = var_01;
		}
	}

	var_00.var_6373[var_00.var_6373.size - 1] = undefined;
	var_00.var_6371 = var_00.var_6373.size;
	if(isdefined(self))
	{
		self.var_6372 = undefined;
	}
}

//Function Number: 12
func_6374()
{
	if(!isdefined(level.var_57D7))
	{
		anim waittill("loadout complete");
	}

	for(var_00 = 0;var_00 < self.var_5BA3.size;var_00++)
	{
		if(self.var_5BA3[var_00] animscripts\battlechatter::func_5161())
		{
			self.var_5BA3[var_00] func_0817();
		}
	}
}

//Function Number: 13
func_9B9A()
{
	anim waittill("squadupdate",var_00);
	switch(var_00)
	{
		case "squadlist":
			break;

		case "combat":
			break;

		case "origin":
			break;

		case "forward":
			break;
	}
}

//Function Number: 14
func_8AD2()
{
	anim endon("squad deleted " + self.var_3F0);
	var_00 = 0.1;
	if(level.currentgen)
	{
		var_00 = 0.5;
	}

	for(;;)
	{
		func_9AE9();
		wait(var_00);
	}
}

//Function Number: 15
func_5B9E()
{
	self endon("removed from squad");
	self waittill("death",var_00);
	if(isdefined(self))
	{
		self.attacker = var_00;
	}

	func_73AA();
}

//Function Number: 16
func_5B9C()
{
	self endon("removed from squad");
	for(;;)
	{
		self waittill("enemy");
		if(!isdefined(self.enemy))
		{
			self.var_8AAA notify("squadupdate","combat");
		}
		else
		{
			self.var_8AAA.var_5121 = 1;
		}

		wait(0.05);
	}
}

//Function Number: 17
func_9B1D()
{
	if(isdefined(self.enemy))
	{
		self.forward = vectornormalize(self.enemy.var_2E6 - self.var_2E6);
		return;
	}

	var_00 = (0,0,0);
	var_01 = 0;
	for(var_02 = 0;var_02 < self.var_5BA3.size;var_02++)
	{
		if(!isalive(self.var_5BA3[var_02]))
		{
			continue;
		}

		var_00 = var_00 + anglestoforward(self.var_5BA3[var_02].var_41);
		var_01++;
	}

	if(var_01)
	{
		self.forward = (var_00[0] / var_01,var_00[1] / var_01,var_00[2] / var_01);
		return;
	}

	self.forward = var_00;
}

//Function Number: 18
updateorigin()
{
	var_00 = (0,0,0);
	var_01 = 0;
	for(var_02 = 0;var_02 < self.var_5BA3.size;var_02++)
	{
		if(!isalive(self.var_5BA3[var_02]))
		{
			continue;
		}

		var_00 = var_00 + self.var_5BA3[var_02].var_2E6;
		var_01++;
	}

	if(var_01)
	{
		self.var_2E6 = (var_00[0] / var_01,var_00[1] / var_01,var_00[2] / var_01);
		return;
	}

	self.var_2E6 = var_00;
}

//Function Number: 19
func_9AFA()
{
	self.var_5121 = 0;
	for(var_00 = 0;var_00 < level.var_8AC8.size;var_00++)
	{
		self.var_8ACA[level.var_8AC8[var_00].var_3F0].var_5122 = 0;
	}

	for(var_00 = 0;var_00 < self.var_5BA3.size;var_00++)
	{
		if(isdefined(self.var_5BA3[var_00].enemy) && isdefined(self.var_5BA3[var_00].enemy.var_8AAA) && self.var_5BA3[var_00].var_20B5 > 0)
		{
			self.var_8ACA[self.var_5BA3[var_00].enemy.var_8AAA.var_3F0].var_5122 = 1;
		}
	}
}

//Function Number: 20
func_9B0D()
{
	var_00 = undefined;
	for(var_01 = 0;var_01 < self.var_5BA3.size;var_01++)
	{
		if(isdefined(self.var_5BA3[var_01].enemy) && isdefined(self.var_5BA3[var_01].enemy.var_8AAA))
		{
			if(!isdefined(var_00))
			{
				var_00 = self.var_5BA3[var_01].enemy.var_8AAA;
				continue;
			}

			if(self.var_5BA3[var_01].enemy.var_8AAA.var_5B9D > var_00.var_5B9D)
			{
				var_00 = self.var_5BA3[var_01].enemy.var_8AAA;
			}
		}
	}

	self.enemy = var_00;
}

//Function Number: 21
func_9AE9()
{
	var_00 = (0,0,0);
	var_01 = 0;
	var_02 = undefined;
	var_03 = 0;
	func_9AFA();
	for(var_04 = 0;var_04 < self.var_5BA3.size;var_04++)
	{
		if(!isalive(self.var_5BA3[var_04]))
		{
			continue;
		}

		var_00 = var_00 + self.var_5BA3[var_04].var_2E6;
		var_01++;
		if(isdefined(self.var_5BA3[var_04].enemy) && isdefined(self.var_5BA3[var_04].enemy.var_8AAA))
		{
			if(!isdefined(var_02))
			{
				var_02 = self.var_5BA3[var_04].enemy.var_8AAA;
				continue;
			}

			if(self.var_5BA3[var_04].enemy.var_8AAA.var_5B9D > var_02.var_5B9D)
			{
				var_02 = self.var_5BA3[var_04].enemy.var_8AAA;
			}
		}
	}

	if(var_01)
	{
		self.var_2E6 = (var_00[0] / var_01,var_00[1] / var_01,var_00[2] / var_01);
	}
	else
	{
		self.var_2E6 = var_00;
	}

	self.var_5121 = var_03;
	self.enemy = var_02;
	func_9B1D();
}

//Function Number: 22
func_9B6C()
{
	for(var_00 = 0;var_00 < level.var_8AC8.size;var_00++)
	{
		if(!isdefined(self.var_8ACA[level.var_8AC8[var_00].var_3F0]))
		{
			self.var_8ACA[level.var_8AC8[var_00].var_3F0] = spawnstruct();
			self.var_8ACA[level.var_8AC8[var_00].var_3F0].var_5122 = 0;
		}

		for(var_01 = 0;var_01 < self.var_8AD3.size;var_01++)
		{
			var_02 = self.var_8AD3[var_01];
			self thread [[ var_02 ]](level.var_8AC8[var_00].var_3F0);
		}
	}
}

//Function Number: 23
func_6FA6(param_00,param_01,param_02,param_03)
{
	self endon("death");
	if(!isdefined(param_02))
	{
		param_02 = (0,0,0);
	}

	if(!isdefined(param_03))
	{
		param_03 = (1,0,0);
	}

	for(var_04 = 0;var_04 < param_01 * 2;var_04++)
	{
		if(!isalive(self))
		{
			return;
		}

		var_05 = self method_8097() + (0,0,10) + param_02;
		wait(0.05);
	}
}

//Function Number: 24
func_09A9(param_00)
{
	switch(param_00)
	{
		case "combat":
		case "death":
		case "move":
		case "stop":
			break;

		case "grenadecower":
		case "pain":
			break;

		case "stalingrad_cover_crouch":
		case "cover_wide_right":
		case "cover_wide_left":
		case "concealment_stand":
		case "concealment_prone":
		case "concealment_crouch":
		case "cover_prone":
		case "cover_swim_right":
		case "cover_swim_left":
		case "cover_swim_up":
		case "cover_left":
		case "cover_multi":
		case "cover_right":
		case "cover_stand":
		case "cover_crouch":
			break;

		case "l33t truckride combat":
		case "aim":
			break;
	}
}

//Function Number: 25
func_9B6F()
{
	func_745B("combat");
	func_745B("cover");
	func_745B("move");
	func_745B("stop");
	func_745B("death");
	func_745B("suppressed");
	func_745B("attacking");
	for(var_00 = 0;var_00 < self.var_5BA3.size;var_00++)
	{
		if(!isalive(self.var_5BA3[var_00]))
		{
			continue;
		}

		func_7091(self.var_5BA3[var_00]);
		func_7092(self.var_5BA3[var_00],"suppressed");
		func_7092(self.var_5BA3[var_00],"combat");
		func_7092(self.var_5BA3[var_00],"attacking");
		func_7092(self.var_5BA3[var_00],"cover");
	}
}

//Function Number: 26
func_9B2E()
{
	anim endon("squad deleted " + self.var_3F0);
	var_00 = 0.05;
	if(level.currentgen)
	{
		var_00 = 0.25;
	}

	for(;;)
	{
		for(var_01 = 0;var_01 < self.var_5BA3.size;var_01++)
		{
			if(!isalive(self.var_5BA3[var_01]))
			{
				continue;
			}

			self.var_5BA3[var_01] func_09AA(var_00);
			self.var_5BA3[var_01] func_09AB(var_00);
		}

		wait(var_00);
	}
}

//Function Number: 27
func_09AA(param_00)
{
	if(isdefined(self.var_24B))
	{
		if(self.var_20B5 < 0)
		{
			self.var_20B5 = param_00;
		}
		else
		{
			self.var_20B5 = self.var_20B5 + param_00;
		}

		self.var_559A = gettime();
		return;
	}
	else if(self method_81CD())
	{
		self.var_20B5 = self.var_20B5 + param_00;
		return;
	}

	if(self.var_20B5 > 0)
	{
		self.var_20B5 = 0 - param_00;
		return;
	}

	self.var_20B5 = self.var_20B5 - param_00;
}

//Function Number: 28
func_09AB(param_00)
{
	if(self.var_8FDE)
	{
		if(self.var_8FE1 < 0)
		{
			self.var_8FE1 = param_00;
		}
		else
		{
			self.var_8FE1 = self.var_8FE1 + param_00;
		}

		return;
	}

	if(self.var_8FE1 > 0)
	{
		self.var_8FE1 = 0 - param_00;
		return;
	}

	self.var_8FE1 = self.var_8FE1 - param_00;
}

//Function Number: 29
func_4E26(param_00,param_01)
{
	self.var_8AD0[param_00] = spawnstruct();
	self.var_8AD0[param_00].var_70E = param_01;
	self.var_8AD0[param_00].isactive = 0;
	self.var_8AD0[param_00].var_628A = 0;
}

//Function Number: 30
func_745B(param_00)
{
	self.var_8AD0[param_00].isactive = 0;
	self.var_8AD0[param_00].var_628A = 0;
}

//Function Number: 31
func_7091(param_00)
{
	self.var_8AD0[param_00.var_7.state].var_628A++;
	if(self.var_8AD0[param_00.var_7.state].var_628A > self.var_8AD0[param_00.var_7.state].var_70E * self.var_5BA3.size)
	{
		self.var_8AD0[param_00.var_7.state].isactive = 1;
	}
}

//Function Number: 32
func_7092(param_00,param_01)
{
	switch(param_01)
	{
		case "suppressed":
			break;

		case "combat":
			break;

		case "attacking":
			break;

		case "cover":
			break;
	}
}