/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: battlechatter_ai.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 58
 * Decompile Time: 2273 ms
 * Timestamp: 4/20/2022 8:20:07 PM
*******************************************************************/

//Function Number: 1
func_0850(param_00)
{
	self endon("death");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(self.var_1CA5)
	{
		return;
	}

	if(!isdefined(self.var_8AAA.var_1CA5) || !self.var_8AAA.var_1CA5)
	{
		self.var_8AAA animscripts\battlechatter::func_4D5B();
	}

	self.var_32A7 = "infantry";
	self.var_1A07 = [];
	if(isplayer(self))
	{
		self.var_132D = 0;
		self.var_38C9 = 0;
		self.type = "human";
		return;
	}

	if(self.type == "dog")
	{
		self.var_32A7 = undefined;
		self.var_132D = 0;
		self.var_38C9 = 0;
		return;
	}

	if(self.inliveplayerkillstreak == "neutral")
	{
		self.var_32A7 = undefined;
		self.var_132D = 0;
		self.var_38C9 = 0;
		return;
	}

	if(func_39BB())
	{
		if(self.inliveplayerkillstreak == "allies")
		{
			self.var_7956 = 0;
		}
		else
		{
			self.voice = "american";
		}
	}

	self.var_2243 = level.var_2244[self.voice];
	func_0D6A();
	thread func_0987();
	func_4C6F();
	thread func_09A6();
}

//Function Number: 2
func_0D6A()
{
	if(isdefined(self.var_79E9))
	{
		var_00 = tolower(self.var_79E9);
		if(issubstr(var_00,"burke"))
		{
			self.var_624F = "brk";
			return;
		}

		if(issubstr(var_00,"carter"))
		{
			self.var_624F = "ctr";
			return;
		}

		if(issubstr(var_00,"joker"))
		{
			self.var_624F = "jkr";
			return;
		}

		if(issubstr(var_00,"alpha_leader"))
		{
			self.var_624F = "aldr";
			return;
		}

		if(issubstr(var_00,"cormack"))
		{
			self.var_624F = "aldr";
			return;
		}

		if(issubstr(var_00,"knox"))
		{
			self.var_624F = "jkr";
			return;
		}

		if(issubstr(var_00,"maddox"))
		{
			self.var_25FB = "jkr";
			return;
		}

		if(issubstr(var_00,"security_officer_1"))
		{
			self.var_624F = "ctr";
			return;
		}

		func_7FBB();
		return;
	}

	func_7FBB();
}

//Function Number: 3
func_39BB()
{
	if(!getdvarint("bcs_forceEnglish",0))
	{
		return 0;
	}

	switch(level.script)
	{
		case "pmc_strike":
			break;
	}
}

//Function Number: 4
func_09A6()
{
	self endon("death");
	self endon("removed from battleChatter");
	var_00 = 0.5;
	wait(var_00);
	thread func_0955();
	thread func_0954();
	if(self.inliveplayerkillstreak == "allies")
	{
		wait(var_00);
		thread func_094F();
		if(self.var_2243 == "CZ")
		{
			thread func_095C();
		}
	}
	else if((self.inliveplayerkillstreak == "axis" || self.inliveplayerkillstreak == "team3") && !func_50B0(self.var_2243))
	{
		thread func_095C();
	}

	if(self.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak)
	{
		thread func_6B21();
	}

	wait(var_00);
	thread func_0948();
}

//Function Number: 5
func_50B0(param_00)
{
	if(param_00 == "UK" || param_00 == "US" || param_00 == "NS" || param_00 == "TF" || param_00 == "SS" || param_00 == "XS")
	{
		return 1;
	}

	return 0;
}

//Function Number: 6
func_7FBB()
{
	var_00 = level.var_9BF1[self.voice];
	var_01 = var_00.size;
	var_02 = randomintrange(0,var_01);
	var_03 = var_02;
	for(var_04 = 0;var_04 <= var_01;var_04++)
	{
		if(var_00[var_02 + var_04 % var_01].count < var_00[var_03].count)
		{
			var_03 = var_02 + var_04 % var_01;
		}
	}

	thread func_6250(var_03);
	self.var_624F = var_00[var_03].var_624F;
}

//Function Number: 7
func_6250(param_00)
{
	level.var_9BF1[self.voice][param_00].count++;
	common_scripts\utility::waittill_either("death","removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	level.var_9BF1[self.voice][param_00].count--;
}

//Function Number: 8
func_095C()
{
	self endon("death");
	self endon("removed from battleChatter");
	wait(2);
	for(;;)
	{
		if(distancesquared(self.var_2E6,level.var_31D.var_2E6) < 1048576)
		{
			if(isdefined(self.var_8AAA.var_5B9D) && self.var_8AAA.var_5B9D > 1)
			{
				func_0824("taunt","hostileburst");
			}
		}

		wait(randomfloatrange(2,5));
	}
}

//Function Number: 9
func_0948()
{
	self endon("death");
	self endon("removed from battleChatter");
	for(;;)
	{
		animscripts\battlechatter::func_6A2B();
		wait(0.3 + randomfloat(0.2));
	}
}

//Function Number: 10
func_0987()
{
	self endon("death");
	self endon("removed from battleChatter");
	for(;;)
	{
		self.var_1342 = animscripts\battlechatter::func_402E();
		self.var_1346 = animscripts\battlechatter::getrank();
		self waittill("set name and rank");
	}
}

//Function Number: 11
func_73AB(param_00)
{
	if(!isalive(self) && animscripts\battlechatter::func_1357())
	{
		if(isdefined(self))
		{
			func_094C();
			func_094A();
		}
	}

	if(isdefined(self))
	{
		self.var_132D = 0;
		self.var_1CA5 = 0;
	}

	self notify("removed from battleChatter");
	if(isdefined(self))
	{
		self.var_1CA6 = undefined;
		self.var_60D7 = undefined;
		self.var_60D8 = undefined;
		self.var_51B0 = undefined;
		self.var_32A7 = undefined;
		self.var_1A07 = undefined;
		self.var_2243 = undefined;
		self.var_624F = undefined;
	}
}

//Function Number: 12
func_4C6F()
{
	self.var_1CA6 = [];
	self.var_1CA6["threat"] = spawnstruct();
	self.var_1CA6["threat"].var_351A = 0;
	self.var_1CA6["threat"].priority = 0;
	self.var_1CA6["response"] = spawnstruct();
	self.var_1CA6["response"].var_351A = 0;
	self.var_1CA6["response"].priority = 0;
	self.var_1CA6["reaction"] = spawnstruct();
	self.var_1CA6["reaction"].var_351A = 0;
	self.var_1CA6["reaction"].priority = 0;
	self.var_1CA6["inform"] = spawnstruct();
	self.var_1CA6["inform"].var_351A = 0;
	self.var_1CA6["inform"].priority = 0;
	self.var_1CA6["order"] = spawnstruct();
	self.var_1CA6["order"].var_351A = 0;
	self.var_1CA6["order"].priority = 0;
	self.var_1CA6["custom"] = spawnstruct();
	self.var_1CA6["custom"].var_351A = 0;
	self.var_1CA6["custom"].priority = 0;
	self.var_60D7 = gettime() + 50;
	self.var_60D8["threat"] = 0;
	self.var_60D8["reaction"] = 0;
	self.var_60D8["response"] = 0;
	self.var_60D8["inform"] = 0;
	self.var_60D8["order"] = 0;
	self.var_60D8["custom"] = 0;
	self.var_51B0 = 0;
	self.var_134D = 0;
	self.var_AA4 = [];
	if(self.voice != "xslice")
	{
		animscripts\battlechatter::func_7C8("rpg");
	}

	animscripts\battlechatter::func_7C8("exposed");
	animscripts\battlechatter::func_7C8("ai_contact_clock");
	if(self.voice != "xslice")
	{
		animscripts\battlechatter::func_7C8("ai_target_clock");
		animscripts\battlechatter::func_7C8("ai_cardinal");
	}

	if(self.voice != "shadowcompany")
	{
		if(self.voice != "british" && self.voice != "pmc" && self.voice != "xslice")
		{
			animscripts\battlechatter::func_7C8("ai_obvious");
		}
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		if(common_scripts\utility::array_contains(level.var_6D1C,self.voice))
		{
			animscripts\battlechatter::func_7C8("player_contact_clock");
			if(self.voice != "xslice")
			{
				animscripts\battlechatter::func_7C8("player_target_clock");
				animscripts\battlechatter::func_7C8("player_cardinal");
				animscripts\battlechatter::func_7C8("player_obvious");
				animscripts\battlechatter::func_7C8("player_object_clock");
			}

			animscripts\battlechatter::func_7C8("player_location");
		}

		animscripts\battlechatter::func_7C8("ai_location");
		if(self.voice != "xslice")
		{
			animscripts\battlechatter::func_7C8("generic_location");
		}

		if(self.voice == "delta" || self.voice == "taskforce" || self.voice == "seal")
		{
			animscripts\battlechatter::func_7C8("ai_obvious");
			animscripts\battlechatter::func_7C8("ai_casual_clock");
			animscripts\battlechatter::func_7C8("concat_location");
			animscripts\battlechatter::func_7C8("player_distance");
			animscripts\battlechatter::func_7C8("player_target_clock_high");
			animscripts\battlechatter::func_7C8("ai_distance");
			animscripts\battlechatter::func_7C8("ai_target_clock_high");
		}
	}

	if(isdefined(self.var_7956) && !self.var_7956)
	{
		self.var_132D = 0;
	}
	else
	{
		self.var_132D = level.var_132D[self.inliveplayerkillstreak];
	}

	if(animscripts\battlechatter::func_9F2C())
	{
		self.var_38C9 = 1;
	}
	else
	{
		self.var_38C9 = 0;
	}

	if(level.var_3A9F)
	{
		lib_A59A::func_7E3B(1);
	}
	else
	{
		lib_A59A::func_7E3B(0);
	}

	self.var_1CA5 = 1;
}

//Function Number: 13
addthreatevent(param_00,param_01,param_02)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!animscripts\battlechatter::cansay("threat",param_00,param_02))
	{
		return;
	}

	if(animscripts\battlechatter::func_932D(param_01) && !isplayer(param_01))
	{
		return;
	}

	var_03 = animscripts\battlechatter::func_23EA("threat",param_00,param_02);
	switch(param_00)
	{
		case "infantry":
			break;
	}
}

//Function Number: 14
func_0826(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	thread func_0827(param_00,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 15
func_0827(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("death");
	self endon("removed from battleChatter");
	self endon("responseEvent_failsafe");
	thread func_7481(param_02);
	var_06 = param_02 common_scripts\utility::waittill_any_return("death","done speaking","cancel speaking");
	if(var_06 == "cancel speaking")
	{
		return;
	}

	if(!isalive(param_02))
	{
		return;
	}

	if(!animscripts\battlechatter::cansay("response",param_00,param_03,param_01))
	{
		return;
	}

	if(!isplayer(param_02))
	{
		if(animscripts\battlechatter::func_51E1(param_02))
		{
			return;
		}
	}

	var_07 = animscripts\battlechatter::func_23EA("response",param_00,param_03);
	if(isdefined(param_04))
	{
		var_07.var_7402 = param_04;
	}

	if(isdefined(param_05))
	{
		var_07.location = param_05;
	}

	var_07.var_747B = param_02;
	var_07.var_5D44 = param_01;
	self.var_1CA6["response"] = undefined;
	self.var_1CA6["response"] = var_07;
}

//Function Number: 16
func_7481(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	param_00 endon("death");
	param_00 endon("done speaking");
	param_00 endon("cancel speaking");
	wait(25);
	self notify("responseEvent_failsafe");
}

//Function Number: 17
func_07E7(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!animscripts\battlechatter::cansay("inform",param_00,param_03,param_01))
	{
		return;
	}

	var_04 = animscripts\battlechatter::func_23EA("inform",param_00,param_03);
	switch(param_00)
	{
		case "reloading":
			break;

		default:
			break;
	}
}

//Function Number: 18
func_0824(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!isdefined(self.var_1CA6))
	{
		return;
	}

	var_04 = animscripts\battlechatter::func_23EA("reaction",param_00,param_03);
	var_04.var_71CC = param_02;
	var_04.var_5D44 = param_01;
	self.var_1CA6["reaction"] = undefined;
	self.var_1CA6["reaction"] = var_04;
}

//Function Number: 19
func_081B(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!animscripts\battlechatter::cansay("order",param_00,param_03,param_01))
	{
		return;
	}

	if(isdefined(param_02) && param_02.type == "dog")
	{
		return;
	}

	var_04 = animscripts\battlechatter::func_23EA("order",param_00,param_03);
	var_04.var_5D44 = param_01;
	var_04.var_657D = param_02;
	self.var_1CA6["order"] = undefined;
	self.var_1CA6["order"] = var_04;
}

//Function Number: 20
func_8ACD()
{
	anim endon("battlechatter disabled");
	anim endon("squad deleted " + self.var_3F0);
	for(;;)
	{
		var_00 = undefined;
		if(self.var_6373.size)
		{
			var_01 = self.var_6373;
		}
		else
		{
			var_01 = self.var_5BA3;
		}

		var_02 = [];
		foreach(var_04 in var_01)
		{
			if(isalive(var_04))
			{
				var_02[var_02.size] = var_04;
			}
		}

		if(var_02.size)
		{
			var_00 = common_scripts\utility::getclosest(level.var_31D.var_2E6,var_02);
			var_00 func_0988();
			var_00 waittill("death");
		}

		wait(3);
	}
}

//Function Number: 21
func_4123(param_00,param_01)
{
	var_02 = param_00.size;
	if(var_02 == 0)
	{
		wait(param_01);
		return param_00;
	}

	var_03 = param_01 * 20;
	var_04 = var_02 / var_03;
	var_05 = [];
	for(var_06 = 0;var_06 < var_02;var_06++)
	{
		var_07 = param_00[var_06];
		if(!isdefined(var_07.var_32A7))
		{
			continue;
		}

		var_05[var_05.size] = param_00[var_06];
	}

	if(var_05.size == 0)
	{
		wait(param_01);
		return var_05;
	}

	var_05 = sortbydistance(var_05,level.var_31D.var_2E6);
	var_08 = [];
	var_09 = [];
	var_0A = 0;
	foreach(var_0C in var_05)
	{
		if(isdefined(var_0C) && func_9328(var_0C))
		{
			var_0D = var_0C animscripts\battlechatter::getlocation();
			if(isdefined(var_0D) && !animscripts\battlechatter::location_called_out_recently(var_0D))
			{
				var_08[var_08.size] = var_0C;
			}
			else
			{
				var_09[var_09.size] = var_0C;
			}
		}

		var_0A++;
		if(var_0A >= var_04)
		{
			wait(0.05);
			var_0A = 0;
		}
	}

	var_05 = [];
	foreach(var_10 in var_08)
	{
		var_05[var_05.size] = var_10;
	}

	foreach(var_10 in var_09)
	{
		var_05[var_05.size] = var_10;
	}

	return var_05;
}

//Function Number: 22
func_9328(param_00)
{
	if(distancesquared(level.var_31D.var_2E6,param_00.var_2E6) > level.var_134C)
	{
		return 0;
	}

	if(!level.var_31D animscripts\battlechatter::func_330A(param_00))
	{
		return 0;
	}

	return 1;
}

//Function Number: 23
func_8AD1()
{
	anim endon("battlechatter disabled");
	anim endon("squad deleted " + self.var_3F0);
	for(;;)
	{
		if(self.inliveplayerkillstreak == "allies")
		{
			var_00 = func_4123(function_00D6("axis","team3"),0.5);
		}
		else if(self.inliveplayerkillstreak == "team3")
		{
			var_00 = func_4123(function_00D6("allies","axis"),0.5);
		}
		else
		{
			wait(0.5);
			var_00 = function_00D6("allies","team3");
			var_00[var_00.size] = level.var_31D;
		}

		if(!var_00.size)
		{
			wait(0.05);
			continue;
		}

		var_01 = [];
		foreach(var_03 in self.var_5BA3)
		{
			if(!isalive(var_03))
			{
				continue;
			}

			if(!var_00.size)
			{
				var_00 = var_01;
				var_01 = [];
			}

			foreach(var_0A, var_05 in var_00)
			{
				if(!isdefined(var_05))
				{
					if(var_0A == 0)
					{
						var_00 = [];
					}

					continue;
				}

				if(!isalive(var_05))
				{
					continue;
				}

				if(!isdefined(var_05.var_32A7))
				{
					continue;
				}

				if(!var_03 method_81BE(var_05))
				{
					if(isplayer(var_05))
					{
						continue;
					}

					if(var_05.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak)
					{
						continue;
					}

					if(!lib_A59A::func_6A95(var_05,250))
					{
						continue;
					}
				}

				var_03 addthreatevent(var_05.var_32A7,var_05);
				var_01[var_01.size] = var_05;
				var_06 = [];
				foreach(var_08 in var_00)
				{
					if(var_08 != var_05)
					{
						var_06[var_06.size] = var_08;
					}
				}

				var_00 = var_06;
				break;
			}

			wait(0.05);
		}
	}
}

//Function Number: 24
func_094C()
{
	var_00 = self.attacker;
	common_scripts\utility::array_thread(self.var_8AAA.var_5BA3,::func_094B);
	if(isalive(var_00) && issentient(var_00) && isdefined(var_00.var_8AAA) && var_00.var_132D)
	{
		if(isdefined(var_00.var_1A07[var_00.var_8AAA.var_3F0]))
		{
			var_00.var_1A07[var_00.var_8AAA.var_3F0] = undefined;
		}

		if(!isdefined(var_00.var_32A7))
		{
			return;
		}

		if(!var_00 animscripts\battlechatter::is_in_callable_location())
		{
			return;
		}

		foreach(var_02 in self.var_8AAA.var_5BA3)
		{
			if(gettime() > var_02.var_559A + 2000)
			{
				continue;
			}

			var_02 addthreatevent(var_00.var_32A7,var_00);
		}
	}
}

//Function Number: 25
func_094B()
{
	if(!isalive(self))
	{
		return;
	}

	self endon("death");
	self endon("removed from battleChatter");
	self notify("aiDeathEventThread");
	self endon("aiDeathEventThread");
	wait(1.5);
	func_0824("casualty","generic",self,0.9);
}

//Function Number: 26
func_094A()
{
	var_00 = self.attacker;
	if(!isalive(var_00) || !issentient(var_00) || !isdefined(var_00.var_8AAA))
	{
		return;
	}

	if(!isdefined(var_00.var_2243) || var_00.var_2243 != "XS")
	{
		return;
	}

	if(!isplayer(var_00))
	{
		if(var_00.var_2243 == "GS" || var_00.var_2243 == "GM" || var_00.var_2243 == "GL")
		{
			var_00 thread func_0960();
		}
	}
}

//Function Number: 27
func_0960()
{
	self endon("death");
	self endon("removed from battleChatter");
	wait(1.5);
	func_07E7("killfirm","generic");
}

//Function Number: 28
func_0988()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!isdefined(self.var_8AAA.var_1CA5))
	{
		self.var_8AAA waittill("squad chat initialized");
	}

	for(;;)
	{
		if(getdvarint("bcs_enable") == 0)
		{
			wait(1);
			continue;
		}

		func_082C();
		wait(randomfloatrange(3,6));
	}
}

//Function Number: 29
func_0955()
{
	self endon("death");
	self endon("removed from battleChatter");
	for(;;)
	{
		self waittill("grenade danger",var_00);
		if(getdvarint("bcs_enable") == 0)
		{
			continue;
		}

		if(!isdefined(var_00) || var_00.model != "projectile_m67fraggrenade")
		{
			continue;
		}

		if(distancesquared(var_00.var_2E6,level.var_31D.var_2E6) < 262144)
		{
			func_07E7("incoming","grenade");
		}
	}
}

//Function Number: 30
func_094F()
{
	self endon("death");
	self endon("removed from battleChatter");
	for(;;)
	{
		self waittill("trigger");
		if(getdvarint("bcs_enable") == 0)
		{
			continue;
		}

		if(gettime() < self.var_7.var_665C + 4000)
		{
			continue;
		}

		func_0826("ack","yes",level.var_31D,1);
	}
}

//Function Number: 31
func_33B3(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!isdefined(self.node))
	{
		return;
	}

	if(distancesquared(self.var_2E6,self.node.var_2E6) < 262144)
	{
		return;
	}

	if(!animscripts\battlechatter::func_515A())
	{
		return;
	}

	if(!func_6062())
	{
		return;
	}

	var_01 = animscripts\battlechatter::func_40B6(24,1024,"response");
	if(self.inliveplayerkillstreak != "axis" && self.inliveplayerkillstreak != "team3")
	{
		if(!isdefined(var_01))
		{
			var_01 = level.var_31D;
		}
		else if(randomint(100) < level.var_33D8["moveEvent"]["ordertoplayer"])
		{
			var_01 = level.var_31D;
		}
	}

	if(self.var_20B5 > 0)
	{
		if(randomint(100) < level.var_33D8["moveEvent"]["coverme"])
		{
			func_081B("action","coverme",var_01);
			return;
		}

		func_081B("move","combat",var_01);
		return;
	}

	if(func_6063())
	{
		func_081B("move","noncombat",var_01);
	}
}

//Function Number: 32
func_6062()
{
	if(self.var_2243 == "SS")
	{
		return 0;
	}

	return 1;
}

//Function Number: 33
func_6063()
{
	if(self.var_2243 == "US" || self.var_2243 == "XS" || self.var_2243 == level.var_31D.var_2243)
	{
		return 1;
	}

	return 0;
}

//Function Number: 34
func_0954()
{
	self endon("death");
	self endon("removed from battleChatter");
	for(;;)
	{
		level waittill("follow order",var_00);
		if(!animscripts\battlechatter::func_1357())
		{
			return;
		}

		if(!isdefined(var_00))
		{
			continue;
		}

		if(!isalive(var_00) || var_00.inliveplayerkillstreak != self.inliveplayerkillstreak)
		{
			continue;
		}

		if(distancesquared(self.var_2E6,var_00.var_2E6) < 360000)
		{
			func_0826("ack","yes",var_00,0.9);
		}
	}
}

//Function Number: 35
func_6B21()
{
	self endon("death");
	self endon("removed from battleChatter");
	thread func_6B22();
	for(;;)
	{
		self waittill("bulletwhizby",var_00,var_01);
		if(!animscripts\battlechatter::func_1357())
		{
			continue;
		}

		if(!isplayer(var_00))
		{
			if(level.var_2244[self.voice] == "GM" && animscripts\battlechatter::cansay("reaction","takingfire",1,undefined))
			{
				func_0824("takingfire",undefined,var_00,1);
			}

			continue;
		}

		if(func_3AA3(var_00,var_01))
		{
			func_6B20();
			wait(3);
		}
	}
}

//Function Number: 36
func_6B20()
{
	func_0824("friendlyfire",undefined,level.var_31D,1);
}

//Function Number: 37
func_6B22()
{
	self endon("death");
	self endon("removed from battleChatter");
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(isdefined(var_01) && isplayer(var_01))
		{
			if(func_2584(var_04,var_01))
			{
				func_6B20();
			}
		}
	}
}

//Function Number: 38
func_2584(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	switch(param_00)
	{
		case "MOD_IMPACT":
		case "MOD_CRUSH":
		case "MOD_MELEE":
		case "MOD_MELEE_ALT":
		case "MOD_GRENADE_SPLASH":
		case "MOD_GRENADE":
			break;
	}
}

//Function Number: 39
func_3AA3(param_00,param_01)
{
	var_02 = 65536;
	var_03 = 42;
	if(distancesquared(param_00.var_2E6,self.var_2E6) < var_02)
	{
		return 0;
	}

	if(param_01 > var_03)
	{
		return 0;
	}

	return 1;
}

//Function Number: 40
func_33B4()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	func_07E7("reloading","generic");
}

//Function Number: 41
func_33B2()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return 0;
	}

	if(!isdefined(self.enemy))
	{
		return 0;
	}

	return 0;
}

//Function Number: 42
func_33B1()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!isdefined(self.enemy))
	{
	}
}

//Function Number: 43
func_33B5()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	if(!self.var_8FDE)
	{
		return;
	}

	func_07E7("suppressed","generic");
}

//Function Number: 44
func_33AF(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	func_07E7("attack","grenade");
}

//Function Number: 45
func_082C()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(self.var_8AAA.var_8AD0["combat"].isactive)
	{
		func_082B();
	}
}

//Function Number: 46
func_082B()
{
	self endon("death");
	self endon("removed from battleChatter");
	var_00 = self.var_8AAA;
	var_00 animscripts\squadmanager::func_9B6F();
	if(var_00.var_8AD0["suppressed"].isactive)
	{
		if(var_00.var_8AD0["cover"].isactive)
		{
			var_01 = animscripts\battlechatter::func_40B6(96,512,"response");
			func_081B("action","grenade",var_01);
		}
		else
		{
			func_081B("displace","generic");
		}
	}
	else if(var_00.var_8AD0["combat"].isactive)
	{
		if(self.var_2243 != "SS")
		{
			var_01 = animscripts\battlechatter::func_40B6(24,1024,"response");
			func_081B("action","suppress",var_01);
		}
	}
}

//Function Number: 47
func_2535()
{
	var_00 = [];
	var_00[var_00.size] = "order_move_combat";
	var_00[var_00.size] = "order_move_noncombat";
	var_00[var_00.size] = "order_action_coverme";
	var_00[var_00.size] = "inform_reloading";
	level.var_2554 = var_00;
}

//Function Number: 48
func_2537(param_00)
{
	var_01 = 0;
	foreach(var_03 in level.var_2554)
	{
		if(var_03 == param_00)
		{
			var_01 = 1;
			break;
		}
	}

	return var_01;
}

//Function Number: 49
func_3E1C(param_00)
{
	return level.var_1344 + "custom battlechatter phrase \'" + param_00 + "\' isn\'t valid.  look at _utility::custom_battlechatter_init_valid_phrases(), or the util script documentation for custom_battlechatter(), for a list of valid phrases.";
}

//Function Number: 50
func_3CD0(param_00)
{
	return level.var_1344 + "AI at origin " + self.var_2E6 + "wasn\'t able to play custom battlechatter because his nationality is \'" + self.var_2243 + "\'.";
}

//Function Number: 51
func_2536(param_00)
{
	if(!isdefined(level.var_2554))
	{
		func_2535();
	}

	param_00 = tolower(param_00);
	if(!func_2537(param_00))
	{
		var_01 = func_3E1C(param_00);
		return 0;
	}

	var_02 = animscripts\battlechatter::func_40B6(24,512,"response");
	func_139A();
	switch(var_01)
	{
		case "order_move_combat":
			break;

		case "order_move_noncombat":
			break;

		case "order_action_coverme":
			break;

		case "inform_reloading":
			break;

		default:
			break;
	}
}

//Function Number: 52
func_139A()
{
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	self.var_2557 = animscripts\battlechatter::func_23EB();
}

//Function Number: 53
func_07C3()
{
	self.var_2557 animscripts\battlechatter::func_81A("action","coverme");
}

//Function Number: 54
func_0800()
{
	self.var_2557 animscripts\battlechatter::func_81A("move","combat");
}

//Function Number: 55
func_0801()
{
	self.var_2557 animscripts\battlechatter::func_81A("move","noncombat");
}

//Function Number: 56
func_07E8()
{
	self.var_2557 animscripts\battlechatter::func_7E6("reloading","generic");
}

//Function Number: 57
func_0803(param_00)
{
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	self.var_2557 animscripts\battlechatter::func_802(param_00);
}

//Function Number: 58
func_3157(param_00,param_01)
{
	if(!animscripts\battlechatter::func_1357())
	{
		return;
	}

	var_02 = animscripts\battlechatter::func_23EA("custom","generic",1);
	if(isdefined(param_00))
	{
		var_02.var_351A = gettime() + param_00;
	}

	if(isdefined(param_01))
	{
		var_02.type = param_01;
	}
	else
	{
		var_02.type = "custom";
	}

	self.var_1CA6["custom"] = undefined;
	self.var_1CA6["custom"] = var_02;
}