/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: melee.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 61
 * Decompile Time: 2429 ms
 * Timestamp: 4/20/2022 8:20:34 PM
*******************************************************************/

//Function Number: 1
func_4C9B()
{
	var_00 = [];
	var_00["standard"] = %melee_1;
	var_00["standard_stand_to_melee"] = %stand_2_melee_1;
	var_00["standard_run_to_melee"] = %run_2_melee_charge;
	var_00["aivai_exposed_attackerwins_attack"] = %melee_f_awin_attack;
	var_00["aivai_exposed_attackerwins_defend"] = %melee_f_awin_defend;
	var_00["aivai_exposed_attackerwins_defend_survive"] = %melee_f_awin_defend_survive;
	var_00["aivai_exposed_defenderwins_attack"] = %melee_f_dwin_attack;
	var_00["aivai_exposed_defenderwins_defend"] = %melee_f_dwin_defend;
	var_00["aivai_wrestle_attackerwins_attack"] = %bog_melee_r_attack;
	var_00["aivai_wrestle_attackerwins_defend"] = %bog_melee_r_defend;
	var_00["aivai_wrestle_attackerwins_defend_survive"] = %bog_melee_r_backdeath2;
	var_00["aivai_behind_attackerwins_attack"] = %melee_sync_attack;
	var_00["aivai_behind_attackerwins_defend"] = %melee_sync_defend;
	var_00["aivai_coverleft_attackerwins_attack"] = %cornersdl_melee_wina_attacker;
	var_00["aivai_coverleft_attackerwins_defend"] = %cornersdl_melee_wina_defender;
	var_00["aivai_coverleft_attackerwins_defend_survive"] = %cornersdl_melee_wina_defender_survive;
	var_00["aivai_coverleft_defenderwins_attack"] = %cornersdl_melee_wind_attacker;
	var_00["aivai_coverleft_defenderwins_attack_survive"] = %cornersdl_melee_wind_attacker_survive;
	var_00["aivai_coverleft_defenderwins_defend"] = %cornersdl_melee_wind_defender;
	var_00["aivai_coverright_attackerwins_attack"] = %cornersdr_melee_wina_attacker;
	var_00["aivai_coverright_attackerwins_defend"] = %cornersdr_melee_wina_defender;
	var_00["aivai_coverright_defenderwins_attack"] = %cornersdr_melee_wind_attacker;
	var_00["aivai_coverright_defenderwins_defend"] = %cornersdr_melee_wind_defender;
	level.var_CCA["soldier"]["melee"] = var_00;
}

//Function Number: 2
func_5B5E()
{
	precachemodel("weapon_parabolic_knife");
	level._effect["melee_knife_ai"] = loadfx("vfx/weaponimpact/flesh_impact_knife");
}

//Function Number: 3
func_5B75()
{
	if(!isdefined(self.var_669))
	{
		return 0;
	}

	if(isdefined(self.var_32D7) && isdefined(self.var_32D7["_stealth_enabled"]) && self.var_32D7["_stealth_enabled"])
	{
		if(isdefined(self.var_32D7["_stealth_attack"]) && !self.var_32D7["_stealth_attack"])
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 4
func_5B78()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(isdefined(self.var_2D37))
	{
		return 0;
	}

	if(func_5B75())
	{
		return 0;
	}

	if(!func_5B35(self.enemy))
	{
		return 0;
	}

	func_5B68();
	if(!func_5B47())
	{
		func_5B67(self.enemy);
		return 0;
	}

	self method_819A(::func_5B60,::func_5B51);
}

//Function Number: 5
func_5B68()
{
	self.var_5B33.target = self.enemy;
	self.var_5B33.var_4DE4 = 0;
	self.var_5B33.var_4E40 = 0;
}

//Function Number: 6
func_5B47()
{
	if(!func_5B5F())
	{
		return 0;
	}

	self.var_5B33.var_4DE4 = 1;
	if(func_5B37())
	{
		self.var_5B33.func = ::func_5B42;
		return 1;
	}

	if(func_5B6D())
	{
		if(isdefined(self.var_8A2B))
		{
			self.var_5B33.func = self.var_8A2B;
		}
		else
		{
			self.var_5B33.func = ::func_5B70;
		}

		return 1;
	}

	self.var_5B33.func = undefined;
	self.var_60CF = gettime() + 150;
	self.var_60CE = self.var_5B33.target;
	return 0;
}

//Function Number: 7
func_5B7B()
{
	var_00 = 1;
	var_01 = distance2d(self.var_5B33.startpos,self.var_5B33.target.var_2E6);
	if(var_01 < 32)
	{
		var_02 = vectornormalize((self.var_5B33.startpos[0] - self.var_5B33.target.var_2E6[0],self.var_5B33.startpos[1] - self.var_5B33.target.var_2E6[1],0));
		self.var_5B33.startpos = self.var_5B33.startpos + var_02 * 32 - var_01;
		if(distance(self.var_5B33.startpos,self.var_5B33.target.var_2E6) < 31.9)
		{
			return 0;
		}

		var_00 = 0;
	}

	var_03 = self method_813C(self.var_5B33.startpos);
	if(!isdefined(var_03))
	{
		return 0;
	}

	if(abs(self.var_5B33.startpos[2] - var_03[2]) > 51.2)
	{
		return 0;
	}

	if(abs(self.var_2E6[2] - var_03[2]) > 51.2)
	{
		return 0;
	}

	self.var_5B33.startpos = var_03;
	if(!self method_81C3(self.var_5B33.startpos,1,var_00))
	{
		return 0;
	}

	if(isdefined(self.var_5B33.var_8D3D))
	{
		var_04 = self.var_5B33.startpos - self.var_5B33.target.var_2E6;
		var_05 = anglestoforward(self.var_5B33.var_8D3D);
		var_06 = vectordot(var_05,var_04);
		var_07 = self.var_5B33.startpos - var_05 * var_06;
		var_08 = self.var_5B33.target.var_2E6 - var_07;
		var_09 = distance2d(self.var_5B33.target.var_2E6,var_07);
		if(var_09 < 32)
		{
			var_07 = var_07 - var_08 * 32 - var_09 / 32;
		}
	}
	else
	{
		var_02 = vectornormalize((self.var_5B33.startpos[0] - self.var_5B33.target.var_2E6[0],self.var_5B33.startpos[1] - self.var_5B33.target.var_2E6[1],0));
		var_07 = self.var_5B33.target.var_2E6 + var_02 * 32;
	}

	if(!self method_81C4(self.var_5B33.startpos,var_07,1,0))
	{
		return 0;
	}

	if(!self method_81C4(var_07,self.var_5B33.target.var_2E6,1,1))
	{
		return 0;
	}

	return 1;
}

//Function Number: 8
func_5B5F()
{
	if(!isdefined(self.var_5B33.target))
	{
		return 0;
	}

	var_00 = self.var_5B33.target;
	if(isdefined(var_00.var_2D37))
	{
		return 0;
	}

	var_01 = distancesquared(self.var_2E6,var_00.var_2E6);
	if(isdefined(self.var_5B7F))
	{
		var_02 = self.var_5B7F;
	}
	else if(isplayer(var_01))
	{
		var_02 = 40000;
	}
	else
	{
		var_02 = 25600;
	}

	if(!self.var_5B33.var_4DE4 && var_01 > var_02)
	{
		return 0;
	}

	if(!isalive(self))
	{
		return 0;
	}

	if(isdefined(self.var_7.var_6140) && self.var_7.var_7B40 >= gettime() + 50)
	{
		return 0;
	}

	if(isdefined(self.var_60CF) && isdefined(self.var_60CE) && gettime() < self.var_60CF && self.var_60CE == var_00)
	{
		return 0;
	}

	if(isdefined(self.var_7.var_644E) || self.var_7.var_6E57 == "prone")
	{
		return 0;
	}

	if(animscripts\utility::func_9C32())
	{
		return 0;
	}

	if(isdefined(self.grenade) && self.var_1AC == 1)
	{
		return 0;
	}

	if(!isalive(var_00))
	{
		return 0;
	}

	if(isdefined(var_00.var_2D2A) || isdefined(var_00.ignoreme) && var_00.ignoreme)
	{
		return 0;
	}

	if(!isai(var_00) && !isplayer(var_00))
	{
		return 0;
	}

	if(isai(var_00))
	{
		if(var_00 method_819B())
		{
			return 0;
		}

		if(var_00 lib_A59A::func_2CE6() || var_00.var_113)
		{
			return 0;
		}
	}

	if(isplayer(var_00))
	{
		var_03 = var_00 getstance();
	}
	else
	{
		var_03 = var_01.var_7.var_6E57;
	}

	if(var_03 != "stand" && var_03 != "crouch")
	{
		return 0;
	}

	if(isdefined(self.var_58D4) && isdefined(var_00.var_58D4))
	{
		return 0;
	}

	if(isdefined(var_00.grenade))
	{
		return 0;
	}

	if(self.var_5B33.var_4E40)
	{
		var_04 = 110;
	}
	else
	{
		var_04 = 60;
	}

	var_05 = angleclamp180(self.var_41[1] - animscripts\utility::func_416E(var_00.var_2E6));
	if(abs(var_05) > var_04)
	{
		return 0;
	}

	if(var_01 <= 4096)
	{
		return 1;
	}

	if(self.var_5B33.var_4E40)
	{
		return 0;
	}

	if(isdefined(self.var_60CD) && isdefined(self.var_60CC) && gettime() < self.var_60CD && self.var_60CC == var_00)
	{
		return 0;
	}

	return 1;
}

//Function Number: 9
func_5B74()
{
	self.var_5B33.var_6DB5 = 1;
	self.var_7.var_5F58 = "run";
}

//Function Number: 10
func_5B76()
{
	self method_8142(%body,0.2);
	self.var_5B33.var_6DB5 = undefined;
	self.var_7.var_5F58 = "stop";
	self method_818F("face default");
}

//Function Number: 11
func_5B60()
{
	self endon("killanimscript");
	self endon("end_melee");
	for(;;)
	{
		var_00 = self.var_5B33.func;
		[[ self.var_5B33.func ]]();
		if(!isdefined(self.var_5B33.func) || var_00 == self.var_5B33.func)
		{
			break;
		}
	}
}

//Function Number: 12
func_5B6E(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	self.var_60D1 = gettime() + 2500;
	self.var_60D0 = param_00;
}

//Function Number: 13
func_5B6C()
{
	var_00 = distancesquared(self.var_5B33.target.var_2E6,self.var_2E6);
	if(var_00 > 4096 && isdefined(self.var_60D1) && isdefined(self.var_60D0) && gettime() < self.var_60D1 && self.var_60D0 == self.var_5B33.target)
	{
		return 0;
	}

	return 1;
}

//Function Number: 14
func_5B6D()
{
	if(isdefined(self.var_5B33.target.var_58D4))
	{
		return 0;
	}

	if(!func_5B6C())
	{
		return 0;
	}

	if(isdefined(self.var_5B33.target.var_8A2C))
	{
		return 0;
	}

	return func_5B73();
}

//Function Number: 15
func_5B72()
{
	if(isdefined(self.var_5B7F))
	{
		var_00 = self.var_5B7F;
	}
	else if(isplayer(self.var_5B33.target))
	{
		var_00 = 40000;
	}
	else
	{
		var_00 = 25600;
	}

	if(distancesquared(self.var_2E6,self.var_5B33.target.var_2E6) > var_00)
	{
		self.var_5B33.var_420C = gettime() + 3000;
		return;
	}

	self.var_5B33.var_420C = gettime() + 1000;
}

//Function Number: 16
func_5B70()
{
	self method_818E("zonly_physics");
	if(isdefined(self.var_5B33.target))
	{
		func_5B72();
	}

	while(isdefined(self.var_5B33.target))
	{
		if(!func_5B6F())
		{
			self.var_60CD = gettime() + 1500;
			self.var_60CC = self.var_5B33.target;
			break;
		}

		if(!isdefined(self.var_5B33.target))
		{
			break;
		}

		animscripts\battlechatter_ai::func_33B2();
		if(isdefined(self.inliveplayerkillstreak))
		{
			lib_A51B::func_2612("act_melee",self.inliveplayerkillstreak == "allies");
		}

		self method_818F("face point",self.var_5B33.target.var_2E6);
		var_00 = animscripts\utility::func_5860("melee","standard");
		self method_8110("meleeanim",var_00,%body,1,0.2,1);
		func_5B65(var_00);
		self.var_5B33.var_4E40 = 1;
		if(!func_5B71())
		{
			func_5B6E(self.var_5B33.target);
			break;
		}
	}

	self method_818E("none");
}

//Function Number: 17
func_5B71()
{
	for(;;)
	{
		self waittill("meleeanim",var_00);
		if(var_00 == "end")
		{
			return 1;
		}

		if(var_00 == "stop")
		{
			if(!func_5B47())
			{
				return 0;
			}

			if(self.var_5B33.func != ::func_5B70)
			{
				return 1;
			}
		}

		if(var_00 == "fire")
		{
			if(isdefined(self.var_5B33.target))
			{
				var_01 = self.var_5B33.target.health;
				self method_81E9();
				if(isdefined(self.var_5B33.target) && self.var_5B33.target.health < var_01)
				{
					func_5B72();
				}
			}
		}
	}
}

//Function Number: 18
func_5B73()
{
	if(!isdefined(self.var_5B33.target))
	{
		return 0;
	}

	if(!func_5B5F())
	{
		return 0;
	}

	var_00 = vectornormalize(self.var_5B33.target.var_2E6 - self.var_2E6);
	self.var_5B33.startpos = self.var_5B33.target.var_2E6 - 40 * var_00;
	return func_5B7B();
}

//Function Number: 19
func_5B6F()
{
	if(!func_5B73())
	{
		return 0;
	}

	var_00 = common_scripts\utility::distance_2d_squared(self.var_2E6,self.var_5B33.target.var_2E6);
	if(var_00 <= 4096)
	{
		var_01 = animscripts\utility::func_5860("melee","standard_stand_to_melee");
		self method_810F("readyanim",var_01,%body,1,0.3,1);
		func_5B65(var_01);
		animscripts\shared::func_2D05("readyanim");
		return 1;
	}

	func_5B64();
	var_02 = self.var_5B33.target.var_2E6;
	var_03 = 0.1;
	var_04 = animscripts\utility::func_5860("melee","standard_run_to_melee");
	var_05 = length(getmovedelta(var_04,0,1));
	var_06 = 32;
	var_07 = 48 + var_06 + var_05;
	var_08 = var_07 * var_07;
	var_09 = 64 + var_06;
	var_0A = var_09 * var_09;
	var_0B = function_0063(var_04) * 1000;
	var_0C = var_0B - 100;
	var_0D = var_0B - 200;
	var_0E = 0;
	var_0F = undefined;
	var_10 = animscripts\utility::func_5860("run","straight");
	if(isplayer(self.var_5B33.target) && self.var_5B33.target == self.enemy)
	{
		self method_818F("face enemy");
	}
	else
	{
		self method_818F("face point",self.var_5B33.target.var_2E6);
	}

	self method_810F("chargeanim",var_10,%body,1,0.3,1);
	func_5B65(var_10);
	var_11 = 0;
	for(;;)
	{
		var_12 = gettime();
		var_13 = isdefined(var_0F) && var_0F <= var_08;
		if(!var_11)
		{
			if(var_13)
			{
				func_5B74();
				self method_8110("chargeanim",var_04,%body,1,0.2,1);
				func_5B65(var_04);
				var_0E = var_12;
				var_11 = 1;
			}
		}
		else
		{
			var_14 = var_01 <= var_08;
			if(var_12 - var_0E >= var_0C || !var_13 && !var_14)
			{
				func_5B74();
				self method_810F("chargeanim",var_10,%body,1,0.3,1);
				func_5B65(var_10);
				var_11 = 0;
			}
		}

		animscripts\notetracks::func_2D0A(var_03,"chargeanim");
		if(!func_5B73())
		{
			func_5B76();
			return 0;
		}

		var_01 = common_scripts\utility::distance_2d_squared(self.var_2E6,self.var_5B33.target.var_2E6);
		var_15 = self.var_5B33.target.var_2E6 - var_02 * 1 / gettime() - var_12;
		var_02 = self.var_5B33.target.var_2E6;
		var_16 = self.var_5B33.target.var_2E6 + var_15 * var_0D;
		var_0F = common_scripts\utility::distance_2d_squared(self.var_2E6,var_16);
		if(var_11 && var_01 <= var_0A && gettime() - var_0E >= var_0C || !isplayer(self.var_5B33.target))
		{
			break;
		}

		if(!var_11 && gettime() >= self.var_5B33.var_420C)
		{
			func_5B76();
			return 0;
		}
	}

	func_5B76();
	return 1;
}

//Function Number: 20
func_5B64()
{
	if(!isdefined(self.var_7.var_60CB))
	{
		self.var_7.var_60CB = 0;
	}

	if((isdefined(self.enemy) && isplayer(self.enemy)) || randomint(3) == 0)
	{
		if(gettime() > self.var_7.var_60CB)
		{
			animscripts\face::func_7821("meleecharge");
			self.var_7.var_60CB = gettime() + 8000;
		}
	}
}

//Function Number: 21
func_5B3C(param_00)
{
	var_01 = 90;
	if(self.var_5B33.var_4E40)
	{
		var_01 = var_01 + 50;
	}

	if(abs(param_00) < var_01)
	{
		return 0;
	}

	var_02 = self.var_5B33.target;
	func_5B4C();
	if(self.var_5B33.winner)
	{
		self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_exposed_attackerwins_attack");
		var_02.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_exposed_attackerwins_defend");
		var_02.var_5B33.var_8FF5 = animscripts\utility::func_5860("melee","aivai_exposed_attackerwins_defend_survive");
	}
	else
	{
		self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_exposed_defenderwins_attack");
		var_02.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_exposed_defenderwins_defend");
	}

	return 1;
}

//Function Number: 22
func_5B3D(param_00)
{
	var_01 = 100;
	if(self.var_5B33.var_4E40)
	{
		var_01 = var_01 + 50;
	}

	if(abs(param_00) < var_01)
	{
		return 0;
	}

	var_02 = self.var_5B33.target;
	if(isdefined(var_02.var_58D4))
	{
		return 0;
	}

	if(isdefined(var_02.var_5B7C))
	{
		return 0;
	}

	self.var_5B33.winner = 1;
	self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_wrestle_attackerwins_attack");
	var_02.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_wrestle_attackerwins_defend");
	var_02.var_5B33.var_8FF5 = animscripts\utility::func_5860("melee","aivai_wrestle_attackerwins_defend_survive");
	return 1;
}

//Function Number: 23
func_5B3A(param_00)
{
	if(-90 > param_00 || param_00 > 0)
	{
		return 0;
	}

	var_01 = self.var_5B33.target;
	if(isdefined(var_01.var_58D4))
	{
		return 0;
	}

	if(isdefined(var_01.var_5B7C))
	{
		return 0;
	}

	self.var_5B33.winner = 1;
	self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_behind_attackerwins_attack");
	var_01.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_behind_attackerwins_defend");
	return 1;
}

//Function Number: 24
func_5B3B()
{
	if(isdefined(self.var_5B85))
	{
		var_00[0] = ::func_5B3C;
	}
	else if(isdefined(self.var_5B86))
	{
		var_00[0] = ::func_5B3D;
	}
	else
	{
		var_01 = randomint(2);
		var_02 = 1 - var_01;
		var_03 = 2;
		var_00[var_01] = ::func_5B3C;
		var_00[var_02] = ::func_5B3D;
		var_00[var_03] = ::func_5B3A;
	}

	return var_00;
}

//Function Number: 25
func_5B39()
{
	var_00 = self.var_5B33.target;
	var_01 = vectortoangles(var_00.var_2E6 - self.var_2E6);
	var_02 = angleclamp180(var_00.var_41[1] - var_01[1]);
	var_03 = func_5B3B();
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		if([[ var_03[var_04] ]](var_02))
		{
			self.var_5B33.var_8CF9 = (0,var_01[1],0);
			self.var_5B33.startpos = getstartorigin(var_00.var_2E6,var_00.var_41,self.var_5B33.animname);
			if(func_5B7B())
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 26
func_5B4C()
{
	var_00 = self.var_5B33.target;
	if(isdefined(self.var_5B7C))
	{
		self.var_5B33.winner = 1;
		return;
	}
	else if(isdefined(var_00.var_5B7C))
	{
		self.var_5B33.winner = 0;
		return;
	}

	if(isdefined(self.var_58D4))
	{
		self.var_5B33.winner = 1;
		return;
	}

	if(isdefined(var_00.var_58D4))
	{
		self.var_5B33.winner = 0;
		return;
	}

	self.var_5B33.winner = common_scripts\utility::cointoss();
}

//Function Number: 27
func_5B45()
{
	var_00 = self.var_5B33.target;
	func_5B4C();
	var_01 = var_00.var_22BA.type;
	if(var_01 == "Cover Multi")
	{
		var_01 = animscripts\utility::func_3F3D(var_00.var_22BA);
	}

	if(var_01 == "Cover Left")
	{
		if(self.var_5B33.winner)
		{
			self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverleft_attackerwins_attack");
			var_00.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverleft_attackerwins_defend");
			var_00.var_5B33.var_8FF5 = animscripts\utility::func_5860("melee","aivai_coverleft_attackerwins_defend_survive");
		}
		else
		{
			self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverleft_defenderwins_attack");
			self.var_5B33.var_8FF5 = animscripts\utility::func_5860("melee","aivai_coverleft_defenderwins_attack_survive");
			var_00.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverleft_defenderwins_defend");
		}
	}
	else if(self.var_5B33.winner)
	{
		self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverright_attackerwins_attack");
		var_00.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverright_attackerwins_defend");
	}
	else
	{
		self.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverright_defenderwins_attack");
		var_00.var_5B33.animname = animscripts\utility::func_5860("melee","aivai_coverright_defenderwins_defend");
	}

	self.var_5B33.startpos = getstartorigin(var_00.var_22BA.var_2E6,var_00.var_22BA.var_41,self.var_5B33.animname);
	self.var_5B33.var_8CF9 = (var_00.var_22BA.var_41[0],angleclamp180(var_00.var_22BA.var_41[1] + 180),var_00.var_22BA.var_41[2]);
	var_00.var_5B33.var_35BE = animscripts\utility::func_4049(var_00.var_22BA);
	self.var_5B33.var_8D3D = var_00.var_22BA.var_41;
	if(!func_5B7B())
	{
		self.var_5B33.var_8D3D = undefined;
		return 0;
	}

	return 1;
}

//Function Number: 28
func_5B44()
{
	var_00 = self.var_5B33.target.var_22BA;
	if(!isdefined(var_00))
	{
		return 0;
	}

	if(distancesquared(var_00.var_2E6,self.var_5B33.target.var_2E6) > 16 && isdefined(self.var_5B33.target.var_7.var_22AB) && self.var_5B33.target.var_7.var_22AB != "hide" && self.var_5B33.target.var_7.var_22AB != "lean")
	{
		return 0;
	}

	var_01 = vectortoangles(self.var_2E6 - var_00.var_2E6);
	var_02 = angleclamp180(var_00.var_41[1] - var_01[1]);
	var_03 = var_00.type;
	if(var_03 == "Cover Multi")
	{
		var_03 = animscripts\utility::func_3F3D(var_00);
	}

	if(var_03 == "Cover Left")
	{
		if(var_02 >= -50 && var_02 <= 0)
		{
			return 1;
		}
	}
	else if(var_03 == "Cover Right")
	{
		if(var_02 >= 0 && var_02 <= 50)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 29
func_5B37()
{
	var_00 = self.var_5B33.target;
	if(!isai(var_00) || var_00.type != "human")
	{
		return 0;
	}

	if(self.var_3F2 != "none" || var_00.var_3F2 != "none")
	{
		return 0;
	}

	if(isdefined(self.var_5B7C) && isdefined(var_00.var_5B7C))
	{
		return 0;
	}

	if(isdefined(self.var_58D4) && isdefined(var_00.var_58D4))
	{
		return 0;
	}

	if((isdefined(self.var_5B7C) && isdefined(var_00.var_58D4)) || isdefined(var_00.var_5B7C) && isdefined(self.var_58D4))
	{
		return 0;
	}

	if(isdefined(self.var_8A2C))
	{
		if(![[ self.var_8A2C ]]())
		{
			return 0;
		}

		self.var_5B33.var_6EE6 = 1;
	}
	else if(isdefined(var_00.var_8A2C))
	{
		return 0;
	}
	else if(func_5B44() && func_5B45())
	{
		self.var_5B33.var_6EE6 = 1;
	}
	else
	{
		if(!func_5B39())
		{
			return 0;
		}

		self.var_5B33.var_6EE6 = 0;
	}

	if(!isdefined(var_00.var_5B33.var_35BE))
	{
		var_00.var_5B33.var_35BE = var_00.var_41[1];
	}

	self.var_5B33.var_8D33 = self.var_5B33.startpos - var_00.var_2E6;
	return 1;
}

//Function Number: 30
func_5B43(param_00)
{
	self.var_5B33.var_9082 = param_00;
	param_00.var_5B33.var_9082 = undefined;
}

//Function Number: 31
func_5B46(param_00)
{
	if(!isdefined(param_00.var_5B33))
	{
		return;
	}

	func_5B64();
	if(!isalive(param_00))
	{
		return;
	}

	self.var_427 = param_00;
	param_00.var_427 = self;
	self.var_5B33.var_5783 = 1;
	param_00.var_5B33.var_5783 = 1;
	self linktoblendtotag(param_00,"tag_sync",1,1);
}

//Function Number: 32
func_5B42()
{
	if(!func_5B3E())
	{
		self.var_60CD = gettime() + 1500;
		self.var_60CC = self.var_5B33.target;
		return;
	}

	var_00 = self.var_5B33.target;
	func_5B43(var_00);
	if(self.var_5B33.winner)
	{
		self.var_5B33.var_109 = undefined;
		var_00.var_5B33.var_109 = 1;
	}
	else
	{
		var_00.var_5B33.var_109 = undefined;
		self.var_5B33.var_109 = 1;
	}

	self.var_5B33.partner = var_00;
	var_00.var_5B33.partner = self;
	if(animscripts\utility::func_9C32())
	{
		lib_A59A::func_39CE(self.alias,"primary");
		self.var_560C = self.alias;
	}

	if(var_00 animscripts\utility::func_9C32())
	{
		var_00 lib_A59A::func_39CE(var_00.alias,"primary");
		var_00.var_560C = var_00.alias;
	}

	self.var_5B33.weapon = self.weapon;
	self.var_5B33.var_A2E0 = animscripts\utility::func_3F45();
	var_00.var_5B33.weapon = var_00.weapon;
	var_00.var_5B33.var_A2E0 = var_00 animscripts\utility::func_3F45();
	self.var_5B33.var_4E40 = 1;
	var_00 method_819A(::func_5B38,::func_5B51);
	var_00 thread func_5B36(self);
	self.var_5B33.target = undefined;
	func_5B38();
}

//Function Number: 33
func_5B36(param_00)
{
	self endon("end_melee");
	self endon("melee_aivsai_execute");
	wait(0.1);
	if(isdefined(param_00))
	{
		param_00 notify("end_melee");
	}

	self notify("end_melee");
}

//Function Number: 34
func_5B41(param_00,param_01)
{
	if(isdefined(param_01) && param_01 <= gettime())
	{
		return 0;
	}

	if(!func_5B5F())
	{
		return 0;
	}

	var_02 = self.var_5B33.target;
	var_03 = distancesquared(var_02.var_2E6,param_00);
	if(self.var_5B33.var_6EE6)
	{
		var_04 = 256;
	}
	else
	{
		var_04 = 1296;
	}

	if(var_03 > var_04)
	{
		return 0;
	}

	self.var_5B33.startpos = var_02.var_2E6 + self.var_5B33.var_8D33;
	if(!func_5B7B())
	{
		return 0;
	}

	return 1;
}

//Function Number: 35
func_5B40(param_00)
{
	var_01 = distancesquared((self.var_2E6[0],self.var_2E6[1],0),(self.var_5B33.startpos[0],self.var_5B33.startpos[1],0));
	if(var_01 < 64 && abs(self.var_5B33.startpos[2] - self.var_2E6[2]) < 64)
	{
		return 1;
	}

	var_02 = distancesquared((param_00[0],param_00[1],0),(self.var_5B33.startpos[0],self.var_5B33.startpos[1],0));
	var_03 = distancesquared((self.var_2E6[0],self.var_2E6[1],0),(self.var_5B33.target.var_2E6[0],self.var_5B33.target.var_2E6[1],0));
	if(var_02 > var_03 && abs(self.var_5B33.target.var_2E6[2] - self.var_2E6[2]) < 64)
	{
		return 1;
	}

	return 0;
}

//Function Number: 36
func_5B3F(param_00)
{
	func_5B76();
	if(self.var_5B33.var_6EE6)
	{
		self method_81C6(self.var_5B33.startpos,self.var_5B33.var_8CF9);
		wait(0.05);
	}
	else
	{
		self method_818F("face angle",self.var_5B33.var_8CF9[1]);
		wait(0.05);
	}

	return func_5B41(param_00);
}

//Function Number: 37
func_5B3E()
{
	if(!func_5B5F())
	{
		return 0;
	}

	func_5B74();
	self method_8142(%body,0.2);
	self method_8147(animscripts\run::func_40BB(),%body,1,0.2);
	self method_818E("zonly_physics");
	self.var_233 = 1;
	var_00 = gettime() + 1500;
	var_01 = self.var_5B33.target.var_2E6;
	while(func_5B41(var_01,var_00))
	{
		if(func_5B40(var_01))
		{
			return func_5B3F(var_01);
		}

		self method_818F("face point",self.var_5B33.startpos);
		wait(0.05);
	}

	func_5B76();
	return 0;
}

//Function Number: 38
func_5B38()
{
	self endon("killanimscript");
	self endon("end_melee");
	self notify("melee_aivsai_execute");
	self method_818E("zonly_physics");
	self.var_7.var_8A14 = "none";
	self.var_8A26 = undefined;
	thread func_5B4F();
	thread func_5B62();
	if(isdefined(self.var_5B33.var_35BE))
	{
		self method_818F("face angle",self.var_5B33.var_35BE);
	}
	else
	{
		self method_818F("face current");
	}

	self.var_7.var_6E57 = "stand";
	self method_8142(%body,0.2);
	if(isdefined(self.var_5B33.var_109))
	{
		func_5B4D();
	}

	self method_8110("meleeAnim",self.var_5B33.animname,%body,1,0.2);
	func_5B65(self.var_5B33.animname);
	var_00 = animscripts\shared::func_2D05("meleeAnim",::func_5B59);
	if(var_00 == "melee_death" && isdefined(self.var_5B33.var_8FF3))
	{
		func_5B50();
		self method_8110("meleeAnim",self.var_5B33.var_8FF5,%body,1,0.2);
		func_5B65(self.var_5B33.var_8FF5);
		var_00 = animscripts\shared::func_2D05("meleeAnim",::func_5B59);
	}

	if(isdefined(self.var_5B33) && isdefined(self.var_5B33.var_109))
	{
		self method_8052();
	}

	self.var_233 = 0;
}

//Function Number: 39
func_5B4D()
{
	self.var_5B33.var_A1B6 = self.var_34;
	self.var_5B33.var_A1C0 = self.var_38A6;
	lib_A59A::func_2AC1();
	lib_A59A::func_7F6B(1);
}

//Function Number: 40
func_5B61()
{
	return isdefined(self.var_5B33.weapon) && self.var_5B33.weapon != "none" && self.weapon != self.var_5B33.weapon;
}

//Function Number: 41
func_5B50()
{
	if(self.weapon != "none" && self.var_560C != "none")
	{
		return;
	}

	if(!isdefined(self.var_5B33.weapon) || self.var_5B33.weapon == "none")
	{
		return;
	}

	lib_A59A::func_39CE(self.var_5B33.weapon,self.var_5B33.var_A2E0);
	if(isdefined(self.var_5B33.var_2F74))
	{
		self.var_5B33.var_2F74 delete();
		self.var_5B33.var_2F74 = undefined;
	}
}

//Function Number: 42
func_5B4F()
{
	self endon("killanimscript");
	self endon("end_melee");
	self waittill("weapon_dropped",var_00);
	if(isdefined(var_00))
	{
		self.var_5B33.var_2F74 = var_00;
	}
}

//Function Number: 43
func_5B63()
{
	if(!isdefined(self.var_5B33.var_8FF5))
	{
		return 0;
	}

	if(!isdefined(self.var_5B33.var_8FF4))
	{
		return 0;
	}

	return 1;
}

//Function Number: 44
func_5B62()
{
	self endon("killanimscript");
	self endon("end_melee");
	self waittill("partner_end_melee");
	if(isdefined(self.var_5B33.var_109))
	{
		if(isdefined(self.var_5B33.var_C62) || isdefined(self.var_5B33.var_4EBE))
		{
			self method_8052();
			return;
		}

		self.var_5B33.var_109 = undefined;
		if(func_5B63())
		{
			self.var_5B33.var_8FF3 = 1;
			return;
		}

		self notify("end_melee");
		return;
	}

	if(!isdefined(self.var_5B33.var_9A90))
	{
		self notify("end_melee");
	}
}

//Function Number: 45
func_5B79()
{
	if(!isdefined(self.var_5B33.var_5783))
	{
		return;
	}

	if(isdefined(self.var_427))
	{
		self.var_427 func_5B7A();
	}

	func_5B7A();
}

//Function Number: 46
func_5B7A()
{
	self unlink();
	self.var_427 = undefined;
	if(!isalive(self))
	{
		return;
	}

	self.var_5B33.var_5783 = undefined;
	self method_818E("zonly_physics");
	self method_818F("face angle",self.var_41[1]);
}

//Function Number: 47
func_5B5C()
{
	func_5B79();
	self.var_5B33.var_9A90 = 1;
	if(isdefined(self.var_5B33.partner) && isdefined(self.var_5B33.partner.var_5B33))
	{
		self.var_5B33.partner.var_5B33.var_9A90 = 1;
	}
}

//Function Number: 48
func_5B5B()
{
	if(animhasnotetrack(self.var_5B33.animname,"melee_death"))
	{
		return 0;
	}

	return isdefined(self.var_5B33.var_109);
}

//Function Number: 49
func_5B5A(param_00)
{
	if(isdefined(param_00) && param_00)
	{
		self.var_5B33.var_4EBE = 1;
		return;
	}

	self.var_5B33.var_C62 = 1;
}

//Function Number: 50
func_5B59(param_00)
{
	if(issubstr(param_00,"ps_"))
	{
		var_01 = getsubstr(param_00,3);
		self playsoundasmaster(var_01);
		return;
	}

	if(var_01 == "sync")
	{
		if(isdefined(self.var_5B33.var_9082))
		{
			func_5B46(self.var_5B33.var_9082);
			self.var_5B33.var_9082 = undefined;
			return;
		}

		return;
	}

	if(var_01 == "unsync")
	{
		func_5B5C();
		if(func_5B5B())
		{
			func_5B5A();
			return;
		}

		return;
	}

	if(var_01 == "melee_interact")
	{
		self.var_5B33.var_8FF4 = 1;
		return;
	}

	if(var_01 == "melee_death")
	{
		if(isdefined(self.var_5B33.var_8FF3))
		{
			return var_01;
		}

		func_5B5A();
		if(isdefined(self.var_5B33.var_C62))
		{
			return var_01;
		}

		return;
	}

	if(var_01 == "attach_knife")
	{
		self attach("weapon_parabolic_knife","TAG_INHAND",1);
		self.var_5B33.var_472F = 1;
		return;
	}

	if(var_01 == "detach_knife")
	{
		self detach("weapon_parabolic_knife","TAG_INHAND",1);
		self.var_5B33.var_472F = undefined;
		return;
	}

	if(var_01 == "stab")
	{
		self playsoundasmaster("melee_knife_hit_body");
		playfxontag(level._effect["melee_knife_ai"],self,"TAG_KNIFE_FX");
		if(isdefined(self.var_5B33.partner) && isdefined(self.var_5B33.partner.var_5B33))
		{
			self.var_5B33.partner func_5B5A(1);
			return;
		}

		return;
	}
}

//Function Number: 51
func_5B4B()
{
	self endon("end_melee");
	animscripts\shared::func_2F6B();
	return 0;
}

//Function Number: 52
func_5B4A()
{
	self endon("end_melee");
	animscripts\notetracks::func_2D13("meleeAnim",10);
	animscripts\shared::func_2F6B();
	self startragdoll();
	return 1;
}

//Function Number: 53
func_5B52()
{
	if(!isalive(self) && isdefined(self.var_5B33.var_109))
	{
		if(isdefined(self.var_5B33.var_C62))
		{
			self.var_265F = ::func_5B4A;
			return;
		}

		self.var_265F = ::func_5B4B;
	}
}

//Function Number: 54
func_5B53()
{
	if(!isalive(self))
	{
		return;
	}

	if(isdefined(self.var_5B33.var_6DB5))
	{
		func_5B76();
	}

	var_00 = self method_813C();
	if(isdefined(var_00))
	{
		self method_81C6(var_00,self.var_41);
	}
}

//Function Number: 55
func_5B55()
{
	if(isdefined(self.var_5B33.var_472F))
	{
		self detach("weapon_parabolic_knife","TAG_INHAND",1);
	}

	if(isalive(self))
	{
		func_5B50();
	}
}

//Function Number: 56
func_5B54()
{
	if(isdefined(self.var_5B33.var_A1B6))
	{
		if(self.var_5B33.var_A1B6)
		{
			lib_A59A::func_30D8();
		}
		else
		{
			lib_A59A::func_2AC1();
		}
	}

	if(isdefined(self.var_5B33.var_A1C0))
	{
		lib_A59A::func_7F6B(self.var_5B33.var_A1C0);
	}
}

//Function Number: 57
func_5B51()
{
	func_5B79();
	func_5B52();
	func_5B53();
	func_5B55();
	func_5B54();
	if(isdefined(self.var_5B33.partner))
	{
		self.var_5B33.partner notify("partner_end_melee");
	}

	func_5B67(self.var_5B33.target);
	func_5B48();
}

//Function Number: 58
func_5B35(param_00)
{
	if(isdefined(self.var_5B33))
	{
		return 0;
	}

	if(isdefined(param_00.var_5B33))
	{
		return 0;
	}

	self.var_5B33 = spawnstruct();
	param_00.var_5B33 = spawnstruct();
	return 1;
}

//Function Number: 59
func_5B67(param_00)
{
	self.var_5B33 = undefined;
	if(isdefined(param_00))
	{
		param_00.var_5B33 = undefined;
	}
}

//Function Number: 60
func_5B65(param_00)
{
	self.var_35C5 = animscripts\face::func_6D98(param_00,"pain",self.var_35C5);
}

//Function Number: 61
func_5B48()
{
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}