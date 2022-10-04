/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_behavior.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 39
 * Decompile Time: 1548 ms
 * Timestamp: 4/20/2022 8:20:20 PM
*******************************************************************/

//Function Number: 1
main(param_00)
{
	self.var_223B = self.var_2E6;
	var_01 = gettime();
	var_02 = spawnstruct();
	var_02.var_60C1 = var_01 - 1;
	var_02.var_60C2 = var_01 - 1;
	func_744B();
	func_7455();
	self.var_7C4E = gettime();
	self.var_7.var_5596 = var_01;
	self.var_7.var_4B89 = 0;
	self.var_7.var_5F58 = "stop";
	self.var_5B81 = var_01 + 3000;
	thread func_A256();
	var_03 = gettime() > 2500;
	for(;;)
	{
		if(isdefined(self.var_DA) && isdefined(self.var_DA.var_3934))
		{
			var_04 = gettime();
			thread func_3167();
			[[ self.var_DA.var_3934 ]]();
			if(gettime() == var_04)
			{
				self notify("dont_end_idle");
			}
		}

		if(animscripts\combat_utility::func_8496())
		{
			if(animscripts\combat_utility::func_989C(1))
			{
				wait(0.05);
				continue;
			}
		}

		if(isdefined(param_00.var_5907))
		{
			var_04 = gettime();
			thread func_3167();
			[[ param_00.var_5907 ]]();
			if(gettime() == var_04)
			{
				self notify("dont_end_idle");
			}
		}

		if(isdefined(param_00.var_5F90))
		{
			if([[ param_00.var_5F90 ]]())
			{
				continue;
			}
		}

		if(animscripts\utility::func_51AD())
		{
			self method_81C7(self.var_22BA.var_2E6);
		}
		else
		{
			self method_81C7(self.var_22BA.var_2E6,func_3F3C());
		}

		if(!var_03)
		{
			func_4B60(param_00,0.05 + randomfloat(1.5));
			var_03 = 1;
			continue;
		}

		if(func_2D04(param_00))
		{
			continue;
		}

		if(isdefined(level.var_9334) && isalive(level.var_31D))
		{
			if(func_989D(param_00,level.var_31D))
			{
				continue;
			}
		}

		if(func_747C())
		{
			return;
		}

		var_05 = 0;
		var_06 = 0;
		if(isalive(self.enemy))
		{
			var_05 = func_50FA();
			var_06 = animscripts\utility::func_1AF0();
		}

		if(var_05)
		{
			if(self.var_7.var_3F19 < gettime())
			{
				if(animscripts\combat_utility::func_585C())
				{
					return;
				}
			}

			func_0E4D(param_00);
			continue;
		}

		if(isdefined(self.var_8A8) || func_32AF())
		{
			if(func_0882())
			{
				return;
			}
		}

		if(var_06)
		{
			func_0E4B(param_00,var_02);
			continue;
		}

		if(func_0E46(param_00,var_02))
		{
			return;
		}
	}
}

//Function Number: 2
end_script(param_00)
{
	self.var_9936 = undefined;
	self.var_7.var_6F4A = undefined;
	if(isdefined(self.var_5B81) && self.var_5B81 <= gettime())
	{
		self.var_5B80 = gettime() + 5000;
		self.var_5B81 = undefined;
	}

	self method_8142(%head,0.2);
	self.var_35C5 = undefined;
}

//Function Number: 3
func_3F3C()
{
	if(self.var_425)
	{
		return animscripts\swim::func_4048(self.var_22BA);
	}

	var_00 = (self.var_22BA.var_41[0],animscripts\utility::func_4049(self.var_22BA),self.var_22BA.var_41[2]);
	return var_00;
}

//Function Number: 4
func_747C()
{
	if(self method_8164() && self.var_7.var_747D < gettime())
	{
		if(animscripts\combat_utility::func_585C())
		{
			return 1;
		}

		self.var_7.var_747D = gettime() + 30000;
	}

	return 0;
}

//Function Number: 5
func_2D04(param_00)
{
	if(func_8FE0(param_00))
	{
		if(func_50FA())
		{
			func_7458();
		}

		self.var_7.var_5596 = gettime();
		return 1;
	}

	if(func_22BE(param_00,0))
	{
		return 1;
	}

	return 0;
}

//Function Number: 6
func_0E4D(param_00)
{
	if(distancesquared(self.var_2E6,self.enemy.var_2E6) > 562500)
	{
		if(func_989D(param_00,self.enemy))
		{
			return;
		}
	}

	if(func_5664(param_00,"normal"))
	{
		func_7458();
		self.var_7.var_5596 = gettime();
		return;
	}

	func_4B60(param_00);
}

//Function Number: 7
func_0E4B(param_00,param_01)
{
	if(self.var_12F)
	{
		if(func_5664(param_00,"ambush"))
		{
			return;
		}
	}
	else if(self.var_34B || gettime() >= param_01.var_60C2)
	{
		var_02 = "suppress";
		if(!self.var_34B && gettime() - self.var_55FB > 5000 && randomint(3) < 2)
		{
			var_02 = "ambush";
		}
		else if(!animscripts\shoot_behavior::func_84B0())
		{
			var_02 = "ambush";
		}

		if(func_5664(param_00,var_02))
		{
			param_01.var_60C2 = gettime() + randomintrange(3000,20000);
			if(func_50FA())
			{
				self.var_7.var_5596 = gettime();
			}

			return;
		}
	}

	if(func_989D(param_00,self.enemy))
	{
		return;
	}

	func_4B60(param_00);
}

//Function Number: 8
func_0E46(param_00,param_01)
{
	if(func_22BE(param_00,0.1))
	{
		return 0;
	}

	if(isdefined(self.enemy))
	{
		if(func_989D(param_00,self.enemy))
		{
			return 0;
		}
	}

	if(!self.var_12F && gettime() >= param_01.var_60C1)
	{
		if(func_585D(param_00))
		{
			param_01.var_60C1 = gettime() + randomintrange(4000,15000);
			return 0;
		}
	}

	if(gettime() > self.var_7.var_3F19)
	{
		if(func_1AF2())
		{
			return 1;
		}
	}

	if(self.var_12F || gettime() >= param_01.var_60C2 && isdefined(self.enemy))
	{
		if(func_5664(param_00,"ambush"))
		{
			if(func_50FA())
			{
				func_7458();
			}

			self.var_7.var_5596 = gettime();
			param_01.var_60C2 = gettime() + randomintrange(6000,20000);
			return 0;
		}
	}

	func_4B60(param_00);
	return 0;
}

//Function Number: 9
func_50FA()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(distancesquared(self.enemy.var_2E6,self.var_223B) < 256)
	{
		return 0;
	}

	return animscripts\utility::func_1AE2();
}

//Function Number: 10
func_8FE0(param_00)
{
	if(!animscripts\utility::func_51C0())
	{
		return 0;
	}

	var_01 = gettime();
	var_02 = 1;
	while(animscripts\utility::func_51C0())
	{
		var_02 = 0;
		self method_81C7(self.var_22BA.var_2E6);
		var_03 = 1;
		if(isdefined(self.var_3694))
		{
			var_03 = common_scripts\utility::cointoss();
		}

		if(var_03)
		{
			if(func_989F(param_00))
			{
				self notify("killanimscript");
				return 1;
			}
		}

		if(self.var_7.var_D83 && animscripts\utility::func_1AE1())
		{
			return 0;
		}

		if(func_50FA() || animscripts\utility::func_1AF0())
		{
			if(isdefined(level.var_9334) && isalive(level.var_31D))
			{
				if(func_989D(param_00,level.var_31D))
				{
					continue;
				}
			}

			if(func_22BE(param_00,0))
			{
				continue;
			}

			if(self.inliveplayerkillstreak != "allies" && gettime() >= var_01)
			{
				if(func_14AB(param_00))
				{
					var_01 = gettime();
					if(!isdefined(self.var_3694))
					{
						var_01 = var_01 + randomintrange(3000,12000);
					}

					continue;
				}
			}

			if(func_989D(param_00,self.enemy))
			{
				var_02 = 1;
				continue;
			}
		}

		if(func_22BE(param_00,0.1))
		{
			continue;
		}

		func_4B60(param_00);
	}

	if(!var_02 && randomint(2) == 0)
	{
		func_585B(param_00);
	}

	return 1;
}

//Function Number: 11
func_407E(param_00)
{
	var_01 = [];
	if(param_00 == 1)
	{
		var_01[0] = 0;
	}
	else if(param_00 == 2)
	{
		var_01[0] = randomint(2);
		var_01[1] = 1 - var_01[0];
	}
	else
	{
		for(var_02 = 0;var_02 < param_00;var_02++)
		{
			var_01[var_02] = var_02;
		}

		for(var_02 = 0;var_02 < param_00;var_02++)
		{
			var_03 = var_02 + randomint(param_00 - var_02);
			var_04 = var_01[var_03];
			var_01[var_03] = var_01[var_02];
			var_01[var_02] = var_04;
		}
	}

	return var_01;
}

//Function Number: 12
func_1A09(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	thread func_3167();
	var_04 = gettime();
	var_05 = undefined;
	if(isdefined(param_03))
	{
		var_05 = [[ param_00 ]](param_01,param_02,param_03);
	}
	else if(isdefined(param_02))
	{
		var_05 = [[ param_00 ]](param_01,param_02);
	}
	else if(isdefined(param_01))
	{
		var_05 = [[ param_00 ]](param_01);
	}
	else
	{
		var_05 = [[ param_00 ]]();
	}

	if(!var_05)
	{
		self notify("dont_end_idle");
	}

	return var_05;
}

//Function Number: 13
func_A256()
{
	self endon("killanimscript");
	self.var_55FB = gettime() - 100000;
	self.var_8FE5 = self.var_55FB;
	for(;;)
	{
		self waittill("suppression");
		var_00 = gettime();
		if(self.var_55FB < var_00 - 700)
		{
			self.var_8FE5 = var_00;
		}

		self.var_55FB = var_00;
	}
}

//Function Number: 14
func_22BE(param_00,param_01)
{
	if(self.var_18B0 > weaponclipsize(self.weapon) * param_01)
	{
		return 0;
	}

	self.var_5189 = 1;
	var_02 = func_1A09(param_00.var_365);
	self.var_5189 = 0;
	return var_02;
}

//Function Number: 15
func_5664(param_00,param_01)
{
	thread animscripts\shoot_behavior::func_2742(param_01);
	if(!self.var_180 && !self.var_12F)
	{
		thread func_17E1();
	}

	var_02 = func_1A09(param_00.var_5664);
	self notify("stop_deciding_how_to_shoot");
	return var_02;
}

//Function Number: 16
func_585D(param_00)
{
	if(self.var_7.var_D83 && animscripts\utility::func_1AE1())
	{
		return 0;
	}

	if(self.var_7.var_5596 + 6000 > gettime())
	{
		return func_585B(param_00);
	}

	var_01 = func_1A09(param_00.var_25A,2 + randomfloat(2));
	if(var_01)
	{
		return 1;
	}

	return func_1A09(param_00.var_367C);
}

//Function Number: 17
func_585B(param_00)
{
	var_01 = func_1A09(param_00.var_367C);
	if(var_01)
	{
		return 1;
	}

	return func_1A09(param_00.var_25A,0);
}

//Function Number: 18
func_4B60(param_00,param_01)
{
	self.var_38DE = 0;
	if(isdefined(param_00.var_38DD))
	{
		if(!self.var_7.var_4B89 && gettime() - self.var_8FE5 < 600)
		{
			if([[ param_00.var_38DD ]]())
			{
				return 1;
			}
		}
		else
		{
			thread func_38DF(param_00);
		}
	}

	if(!self.var_7.var_4B89)
	{
		thread func_4B84(param_00.var_4B60);
		self.var_7.var_4B89 = 1;
	}

	if(isdefined(param_01))
	{
		func_4B87(param_01);
	}
	else
	{
		func_4B88();
	}

	if(self.var_38DE)
	{
		self waittill("flinch_done");
	}

	self notify("stop_waiting_to_flinch");
}

//Function Number: 19
func_4B87(param_00)
{
	self endon("end_idle");
	wait(param_00);
}

//Function Number: 20
func_4B88()
{
	self endon("end_idle");
	wait(0.3 + randomfloat(0.1));
	self waittill("do_slow_things");
}

//Function Number: 21
func_4B84(param_00)
{
	self endon("killanimscript");
	self [[ param_00 ]]();
}

//Function Number: 22
func_38DF(param_00)
{
	self endon("killanimscript");
	self endon("stop_waiting_to_flinch");
	var_01 = self.var_55FB;
	for(;;)
	{
		self waittill("suppression");
		var_02 = gettime();
		if(var_01 < var_02 - 2000)
		{
			break;
		}

		var_01 = var_02;
	}

	self.var_38DE = 1;
	thread func_3167();
	var_03 = [[ param_00.var_38DD ]]();
	if(!var_03)
	{
		self notify("dont_end_idle");
	}

	self.var_38DE = 0;
	self notify("flinch_done");
}

//Function Number: 23
func_3167()
{
	self endon("killanimscript");
	self endon("dont_end_idle");
	waittillframeend;
	if(!isdefined(self))
	{
		return;
	}

	self notify("end_idle");
	self.var_7.var_4B89 = 0;
}

//Function Number: 24
func_989D(param_00,param_01)
{
	var_02 = anglestoforward(self.var_41);
	var_03 = vectornormalize(param_01.var_2E6 - self.var_2E6);
	if(vectordot(var_02,var_03) < 0)
	{
		return 0;
	}

	if(self.var_12F && !animscripts\utility::func_725F())
	{
		return 0;
	}

	if(animscripts\utility::func_516B())
	{
		return func_1A09(param_00.var_43FE,param_01);
	}

	return func_1A09(param_00.grenade,param_01);
}

//Function Number: 25
func_14AB(param_00)
{
	if(!animscripts\utility::func_1AAF())
	{
		return 0;
	}

	return func_1A09(param_00.var_14AB);
}

//Function Number: 26
func_17E1()
{
	self endon("killanimscript");
	self endon("stop_deciding_how_to_shoot");
	for(;;)
	{
		if(self.var_180 || self.var_12F)
		{
			return;
		}

		wait(0.5 + randomfloat(0.75));
		if(!isdefined(self.enemy))
		{
			continue;
		}

		if(func_32AF())
		{
			if(func_0882())
			{
				return;
			}
		}

		if(!animscripts\utility::func_725F() && !animscripts\utility::func_1AEF())
		{
			if(gettime() > self.var_7.var_3F19)
			{
				if(func_1AF2())
				{
					return;
				}
			}
		}
	}
}

//Function Number: 27
func_32AF()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(self.enemy common_scripts\utility::isflashed())
	{
		return 1;
	}

	if(isplayer(self.enemy))
	{
		if(isdefined(self.enemy.health) && self.enemy.health < self.enemy.var_275)
		{
			return 1;
		}
	}
	else if(isai(self.enemy) && self.enemy animscripts\utility::func_51C0())
	{
		return 1;
	}

	if(isdefined(self.enemy.var_5189) && self.enemy.var_5189)
	{
		return 1;
	}

	return 0;
}

//Function Number: 28
func_7455()
{
	self.var_7.var_747D = 0;
}

//Function Number: 29
func_744B()
{
	var_00 = gettime();
	if(isdefined(self.var_2A4B) && var_00 > self.var_7.var_3F19)
	{
		self.var_7.var_3F19 = var_00 + randomintrange(2000,5000);
		return;
	}

	if(isdefined(self.enemy))
	{
		var_01 = distance2d(self.var_2E6,self.enemy.var_2E6);
		if(var_01 < self.var_14F)
		{
			self.var_7.var_3F19 = var_00 + randomintrange(5000,10000);
			return;
		}

		if(var_01 > self.var_14D && var_01 < self.var_1C7)
		{
			self.var_7.var_3F19 = var_00 + randomintrange(2000,5000);
			return;
		}

		self.var_7.var_3F19 = var_00 + randomintrange(10000,15000);
		return;
	}

	self.var_7.var_3F19 = var_00 + randomintrange(5000,15000);
}

//Function Number: 30
func_7458()
{
	if(isdefined(self.var_8A8))
	{
		self.var_7C4E = gettime() + randomintrange(500,1000);
		return;
	}

	self.var_7C4E = gettime() + randomintrange(3000,5000);
}

//Function Number: 31
func_1AF2()
{
	return func_0882();
}

//Function Number: 32
func_0882()
{
	if(self.var_180 || self.var_12F)
	{
		return 0;
	}

	if(isdefined(self.var_8A8) && gettime() >= self.var_7C4E)
	{
		return animscripts\combat_utility::func_989C(0);
	}

	var_00 = 0;
	if(!isdefined(self.enemy) || !self.enemy common_scripts\utility::isflashed())
	{
		var_00 = animscripts\combat_utility::func_585C();
	}

	if(!var_00 && isdefined(self.enemy) && !animscripts\utility::func_1AE2())
	{
		if(gettime() >= self.var_7C4E)
		{
			return animscripts\combat_utility::func_989C(0);
		}
	}

	return var_00;
}

//Function Number: 33
func_989F(param_00)
{
	if(isdefined(param_00.var_5F90))
	{
		if([[ param_00.var_5F90 ]]())
		{
			return 1;
		}
	}

	return animscripts\combat_utility::func_585C();
}

//Function Number: 34
func_7EBC()
{
	var_00 = animscripts\utility::func_5861("exposed_turn");
	foreach(var_03, var_02 in var_00)
	{
		self.var_7.var_CD8[var_03] = var_02;
	}
}

//Function Number: 35
func_7EBB()
{
	var_00 = animscripts\utility::func_5861("coverstand_turn");
	foreach(var_03, var_02 in var_00)
	{
		self.var_7.var_CD8[var_03] = var_02;
	}
}

//Function Number: 36
func_7DF5()
{
	var_00 = animscripts\utility::func_5861("exposed_turn_crouch");
	foreach(var_03, var_02 in var_00)
	{
		self.var_7.var_CD8[var_03] = var_02;
	}
}

//Function Number: 37
func_7EC7()
{
	self.var_7.var_CD8["turn_left_45"] = animscripts\swim::func_40FE("turn_left_45");
	self.var_7.var_CD8["turn_left_90"] = animscripts\swim::func_40FE("turn_left_90");
	self.var_7.var_CD8["turn_left_135"] = animscripts\swim::func_40FE("turn_left_135");
	self.var_7.var_CD8["turn_left_180"] = animscripts\swim::func_40FE("turn_left_180");
	self.var_7.var_CD8["turn_right_45"] = animscripts\swim::func_40FE("turn_right_45");
	self.var_7.var_CD8["turn_right_90"] = animscripts\swim::func_40FE("turn_right_90");
	self.var_7.var_CD8["turn_right_135"] = animscripts\swim::func_40FE("turn_right_135");
	self.var_7.var_CD8["turn_right_180"] = animscripts\swim::func_40FE("turn_right_180");
}

//Function Number: 38
func_9937(param_00)
{
	if(isdefined(self.node))
	{
		var_01 = self.node;
		var_02 = abs(angleclamp180(self.var_41[1] - var_01.var_41[1] + param_00));
		if(self.var_7.var_6E57 == "stand" && var_01 gethighestnodestance() != "stand")
		{
			if(var_02 > 45 && var_02 < 90)
			{
				self method_818F("face angle",self.var_41[1]);
			}
			else
			{
				self method_818F("face current");
			}

			var_03 = 1.5;
			var_04 = %exposed_stand_2_crouch;
			if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
			{
				var_04 = %s1_exposed_stand_2_crouch;
			}

			var_05 = getnotetracktimes(var_04,"anim_pose = \"crouch\")[0];
			var_05 = min(1,var_05 * 1.1);
			var_06 = var_05 * function_0063(var_04) / var_03;
			self method_8110("crouchanim",var_04,%body,1,0.2,var_03);
			animscripts\notetracks::func_2D0A(var_06,"crouchanim");
			self method_8142(%body,0.2);
		}

		if(animscripts\utility::func_51AD())
		{
			self notify("force_space_rotation_update",0,0);
			return;
		}
		else
		{
			self method_818F("face angle",self.var_41[1]);
		}

		var_07 = angleclamp180(self.var_41[1] - var_01.var_41[1] + param_00);
		if(abs(var_07) > 45)
		{
			if(self.var_425)
			{
				func_7EC7();
			}
			else if(self.var_7.var_6E57 == "stand")
			{
				if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
				{
					if(isdefined(self.var_22CB))
					{
						if(self.var_22CB == "stand")
						{
							func_7EBB();
						}
						else
						{
							func_7EBC();
						}
					}
					else
					{
						func_7EBC();
					}
				}
				else
				{
					func_7EBC();
				}
			}
			else
			{
				func_7DF5();
			}

			self.var_9932 = 45;
			self.var_9936 = 1;
			animscripts\combat::func_9935(var_07);
			self.var_9936 = undefined;
		}
	}
}

//Function Number: 39
func_5F90()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(isdefined(self.var_2A4B))
	{
		self.var_2A4B = undefined;
		return 0;
	}

	if(!isdefined(self.node))
	{
		return 0;
	}

	if(animscripts\utility::func_5157(self.node))
	{
		return 0;
	}

	if(randomint(3) == 0)
	{
		return 0;
	}

	if(self.var_180 || self.var_12F || self.var_233 || self.var_234)
	{
		return 0;
	}

	if(distancesquared(self.var_2E6,self.node.var_2E6) > 256)
	{
		return 0;
	}

	var_00 = self method_81EB();
	if(isdefined(var_00) && var_00 != self.node && self method_81F0(var_00))
	{
		self.var_8541 = 1;
		self.var_8543 = var_00;
		self.var_2A4B = 1;
		wait(0.5);
		return 1;
	}

	return 0;
}