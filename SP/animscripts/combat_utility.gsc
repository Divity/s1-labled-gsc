/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: combat_utility.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 87
 * Decompile Time: 3394 ms
 * Timestamp: 4/20/2022 8:20:14 PM
*******************************************************************/

//Function Number: 1
func_4103(param_00)
{
	var_01 = self method_8097() + (0,0,-3);
	var_02 = (var_01[0] - param_00[0],var_01[1] - param_00[1],var_01[2] - param_00[2]);
	var_02 = vectornormalize(var_02);
	var_03 = var_02[2] * -1;
	return var_03;
}

//Function Number: 2
func_40CC()
{
	if(isplayer(self.enemy))
	{
		return randomfloatrange(self.enemy.var_443E.var_5C33,self.enemy.var_443E.var_5A14);
	}

	return randomfloatrange(level.var_5C33,level.var_5A14);
}

//Function Number: 3
func_40B4()
{
	var_00 = gettime() - self.var_7.var_55D4 / 1000;
	var_01 = func_3F1C();
	if(var_01 > var_00)
	{
		return var_01 - var_00;
	}

	return 0;
}

//Function Number: 4
func_3F90()
{
	if(!isdefined(self.var_3671))
	{
		self.var_3671 = 1;
		self.var_3673 = 3;
	}

	var_00 = 0.2;
	var_01 = 0.45;
	if(self.var_3671 % self.var_3673 == 0)
	{
		if(randomint(5) < 3)
		{
			var_00 = 0.45;
			var_01 = 1;
		}

		self.var_3673 = randomintrange(2,5);
	}

	self.var_3671++;
	return randomfloatrange(var_00,var_01);
}

//Function Number: 5
func_3F1C()
{
	if(animscripts\utility::func_9C32())
	{
		return randomfloatrange(0.15,0.55);
	}

	if(animscripts\utility::func_A2C6())
	{
		return randomfloatrange(1,1.7);
	}

	if(issniper())
	{
		return func_40CC();
	}

	if(self.var_3670)
	{
		return func_3F90();
	}

	return randomfloatrange(0.4,0.9);
}

//Function Number: 6
func_1930()
{
	if(self.var_18B0)
	{
		if(self.var_840F == "full" && !self.var_3670)
		{
			if(self.var_7.var_55D4 == gettime())
			{
				wait(0.05);
			}

			return;
		}

		var_00 = func_40B4();
		if(var_00)
		{
			wait(var_00);
		}
	}
}

//Function Number: 7
func_1CAE()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(self.inliveplayerkillstreak != "allies")
	{
		if(!isplayer(self.enemy))
		{
			return 0;
		}

		if(self.enemy lib_A59A::func_32D7("player_is_invulnerable"))
		{
			return 0;
		}
	}

	if(animscripts\utility::func_9C32() || animscripts\utility::func_9C2E())
	{
		return 0;
	}

	if(gettime() - self.var_B78 < self.var_B77)
	{
		return 0;
	}

	if(!self method_81BE(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) > 65536)
	{
		return 0;
	}

	self.var_18B0 = int(weaponclipsize(self.weapon) / 2);
	if(self.var_18B0 > weaponclipsize(self.weapon))
	{
		self.var_18B0 = weaponclipsize(self.weapon);
	}

	self.var_B78 = gettime();
	return 1;
}

//Function Number: 8
func_0975()
{
	for(var_00 = int(60);var_00 > 0;var_00--)
	{
		if(isdefined(self.var_2D33) || isdefined(self.enemy) && isdefined(self.enemy.var_2D2A))
		{
			wait(0.05);
			continue;
		}

		return 0;
	}

	return 1;
}

//Function Number: 9
func_8411()
{
	if(isdefined(self.var_251B) && self.var_251B)
	{
		func_1930();
		self.var_251B = 0;
		self notify("shoot_behavior_change");
	}

	self endon("shoot_behavior_change");
	self endon("stopShooting");
	if(func_5147())
	{
		if(isdefined(self.enemy) && isai(self.enemy) && distancesquared(level.var_31D.var_2E6,self.enemy.var_2E6) < 147456)
		{
			self.enemy animscripts\battlechatter_ai::addthreatevent("infantry",self,1);
		}

		if(animscripts\utility::func_9C2E() && issentient(self.enemy))
		{
			wait(randomfloat(2));
		}
	}

	if(isdefined(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) > 160000)
	{
		var_00 = randomintrange(1,5);
	}
	else
	{
		var_00 = 10;
	}

	var_01 = 1;
	self.var_251B = 1;
	for(;;)
	{
		if(!var_01)
		{
			func_1930();
		}

		var_01 = 0;
		if(func_0975())
		{
			break;
		}

		if(self.var_840F == "full")
		{
			if(isdefined(self.var_5A77) && self.var_5A77)
			{
				func_37EC(animscripts\utility::func_C4E("fire"),0,100);
			}
			else
			{
				func_37EC(animscripts\utility::func_C4E("fire"),1,animscripts\shared::func_2741());
			}
		}
		else if(self.var_840F == "burst" || self.var_840F == "semi")
		{
			var_02 = animscripts\shared::func_2740();
			if(var_02 == 1)
			{
				func_37EC(animscripts\utility::func_C51("single"),1,var_02);
			}
			else
			{
				func_37EC(animscripts\utility::func_C4E(self.var_840F + var_02),1,var_02);
			}
		}
		else if(self.var_840F == "single")
		{
			func_37EC(animscripts\utility::func_C51("single"),1,1);
		}
		else
		{
			self waittill("hell freezes over");
		}

		if(!self.var_18B0)
		{
			break;
		}

		var_00--;
		if(var_00 < 0)
		{
			self.var_84A1 = 1;
			break;
		}
	}

	self.var_251B = 0;
}

//Function Number: 10
func_4140()
{
	level.var_C6E++;
	return level.var_C6E;
}

//Function Number: 11
func_82F2(param_00)
{
	self method_814B(%exposed_aiming,1,param_00);
	self method_8144(animscripts\utility::func_C4E("straight_level"),1,param_00);
	self method_8144(animscripts\utility::func_C4E("add_aim_up"),1,param_00);
	self method_8144(animscripts\utility::func_C4E("add_aim_down"),1,param_00);
	self method_8144(animscripts\utility::func_C4E("add_aim_left"),1,param_00);
	self method_8144(animscripts\utility::func_C4E("add_aim_right"),1,param_00);
	self.var_35C5 = animscripts\face::func_6D98(undefined,"aim",self.var_35C5);
}

//Function Number: 12
func_8D11()
{
	lib_A51B::func_33B0();
	if(!isdefined(self.var_7.var_979))
	{
		var_00 = 0.2;
		if(isdefined(self.var_97C))
		{
			var_00 = self.var_97C;
		}

		func_82F2(var_00);
		thread func_0979();
		thread animscripts\track::func_950B();
	}
}

//Function Number: 13
func_315D()
{
	func_3155();
	self method_8142(%add_fire,0.1);
	self notify("stop tracking");
}

//Function Number: 14
func_8506()
{
	if(isdefined(self.var_7.var_979))
	{
		self method_814B(%add_idle,0,0.2);
	}

	self method_814B(%add_fire,1,0.1);
}

//Function Number: 15
func_4870()
{
	if(isdefined(self.var_7.var_979))
	{
		self method_814B(%add_idle,1,0.2);
	}

	self method_814B(%add_fire,0,0.1);
}

//Function Number: 16
func_0979(param_00)
{
	self endon("killanimscript");
	self endon("end_aim_idle_thread");
	if(isdefined(self.var_7.var_979))
	{
		return;
	}

	self.var_7.var_979 = 1;
	wait(0.1);
	self method_814C(%add_idle,1,0.2);
	var_01 = %add_idle;
	var_02 = 0;
	for(;;)
	{
		var_03 = "idle" + var_02;
		if(isdefined(self.var_7.var_565B))
		{
			var_04 = animscripts\utility::func_C51("lean_idle");
		}
		else if(animscripts\utility::func_C4F("exposed_idle"))
		{
			var_04 = animscripts\utility::func_C51("exposed_idle");
		}
		else
		{
			wait(0.5);
		}
		else
		{
			if(var_04 == var_01)
			{
				self method_8114(var_03,var_04,1,0.2);
			}
			else
			{
				self method_810E(var_03,var_04,1,0.2);
			}

			var_01 = var_04;
			self waittillmatch("end",var_03);
		}

		var_02++;
	}

	self method_8142(%add_idle,0.1);
}

//Function Number: 17
func_3155()
{
	self notify("end_aim_idle_thread");
	self.var_7.var_979 = undefined;
	self method_8142(%add_idle,0.1);
}

//Function Number: 18
func_843C()
{
	if(animscripts\utility::func_A2C6())
	{
		return 1;
	}

	if(animscripts\weaponlist::func_9C24())
	{
		return animscripts\weaponlist::func_116C() * 0.7;
	}

	return 0.4;
}

//Function Number: 19
func_37EC(param_00,param_01,param_02)
{
	var_03 = "fireAnim_" + func_4140();
	lib_A52D::func_744D();
	while(!func_0976())
	{
		wait(0.05);
	}

	func_8506();
	var_04 = 1;
	if(isdefined(self.var_840E))
	{
		var_04 = self.var_840E;
	}
	else if(self.var_840F == "full")
	{
		var_04 = animscripts\weaponlist::func_116C();
	}
	else if(self.var_840F == "burst")
	{
		var_04 = animscripts\weaponlist::func_1934();
	}
	else if(animscripts\utility::func_9C32())
	{
		var_04 = 3;
	}
	else if(animscripts\utility::func_9C31())
	{
		var_04 = func_843C();
	}

	self method_810D(var_03,param_00,1,0.2,var_04);
	self method_81EA();
	var_05 = weaponfiretime(self.weapon);
	func_37EE(var_03,param_00,param_01,param_02,var_05);
	func_4870();
}

//Function Number: 20
func_37ED()
{
	self endon("killanimscript");
	self endon("fireAnimEnd");
	self notify("FireUntilOutOfAmmo_WaitTillEnded");
	self endon("FireUntilOutOfAmmo_WaitTillEnded");
	var_00 = thisthread;
	for(;;)
	{
		waittillframeend;
		if(!isdefined(var_00))
		{
			self method_83DA();
			return;
		}

		wait(0.05);
	}
}

//Function Number: 21
func_37EE(param_00,param_01,param_02,param_03,param_04)
{
	self endon("enemy");
	if(isplayer(self.enemy) && self.var_840F == "full" || self.var_840F == "semi")
	{
		level endon("player_becoming_invulnerable");
	}

	if(param_02)
	{
		thread func_622C(param_00,"fireAnimEnd");
		self endon("fireAnimEnd");
	}

	if(!isdefined(param_03))
	{
		param_03 = -1;
	}

	var_05 = 0;
	var_06 = animhasnotetrack(param_01,"fire");
	var_07 = weaponclass(self.weapon) == "rocketlauncher";
	thread func_37ED();
	while(var_05 < param_03 && param_03 > 0)
	{
		if(var_06)
		{
			wait(param_04);
		}

		if(!self.var_18B0)
		{
			if(!func_1CAE())
			{
				break;
			}
		}

		if(!func_0976())
		{
			break;
		}

		func_83E5();
		if(isplayer(self.enemy) && self.enemy lib_A59A::func_32D7("player_is_invulnerable"))
		{
			if(randomint(3) == 0)
			{
				self.var_18B0--;
			}
		}
		else
		{
			self.var_18B0--;
		}

		if(var_07)
		{
			if(isdefined(self.var_83F0) && isdefined(self.var_83F0.inliveplayerkillstreak))
			{
				self.var_83F0 lib_A51B::func_2612("react_rpg",self.var_83F0.inliveplayerkillstreak == "allies");
			}

			self.var_7.rockets--;
			if(issubstr(tolower(self.weapon),"rpg") || issubstr(tolower(self.weapon),"panzerfaust"))
			{
				self hidepart("tag_rocket");
				self.var_7.var_7594 = 0;
			}
		}

		var_05++;
		thread func_843D(param_00);
		if(self.var_3670 && var_05 == param_03)
		{
			break;
		}

		if(!var_06 || param_03 == 1 && self.var_840F == "single")
		{
			self waittillmatch("end",param_00);
		}
	}

	self method_83DA();
	if(param_02)
	{
		self notify("fireAnimEnd");
	}
}

//Function Number: 22
func_0976()
{
	if(!isdefined(self.var_8409))
	{
		return 1;
	}

	var_00 = self method_81B9();
	var_01 = animscripts\shared::func_40C6();
	var_02 = vectortoangles(self.var_8409 - var_01);
	var_03 = level.var_985;
	if(isdefined(self.var_978))
	{
		var_03 = self.var_978;
	}

	var_04 = animscripts\utility::func_6C4(var_00[1] - var_02[1]);
	if(var_04 > var_03)
	{
		if(distancesquared(self geteye(),self.var_8409) > level.var_983 || var_04 > level.var_984)
		{
			return 0;
		}
	}

	return animscripts\utility::func_6C4(var_00[0] - var_02[0]) <= level.var_97B;
}

//Function Number: 23
func_622C(param_00,param_01)
{
	self endon("killanimscript");
	self endon(param_01);
	self waittillmatch("end",param_00);
	self notify(param_01);
}

//Function Number: 24
func_51A6()
{
	if(weaponburstcount(self.weapon) > 0)
	{
		return 0;
	}
	else if(weaponisauto(self.weapon))
	{
		return 0;
	}

	return 1;
}

//Function Number: 25
func_83E5()
{
	var_00 = func_51A6();
	if(isdefined(self.var_83F0))
	{
		if(isdefined(self.enemy) && self.var_83F0 == self.enemy)
		{
			animscripts\utility::func_83EC(var_00);
			return;
		}

		return;
	}

	self [[ level.var_840D ]](self.var_8409,var_00);
}

//Function Number: 26
func_275E()
{
	if(self.var_18B0)
	{
		self.var_18B0--;
	}
}

//Function Number: 27
func_843D(param_00)
{
	if(!animscripts\utility::func_A2C6())
	{
		return;
	}

	self endon("killanimscript");
	self notify("shotgun_pump_sound_end");
	self endon("shotgun_pump_sound_end");
	thread func_8EFD(2);
	self waittillmatch("rechamber",param_00);
	self playsoundasmaster("ai_shotgun_pump");
	self notify("shotgun_pump_sound_end");
}

//Function Number: 28
func_8EFD(param_00)
{
	self endon("killanimscript");
	self endon("shotgun_pump_sound_end");
	wait(param_00);
	self notify("shotgun_pump_sound_end");
}

//Function Number: 29
func_7260(param_00)
{
}

//Function Number: 30
func_6086(param_00)
{
	if(self.weapon == "none")
	{
		return 0;
	}

	if(isdefined(self.var_6158))
	{
		if(self.var_18B0 < weaponclipsize(self.weapon) * 0.5)
		{
			self.var_18B0 = int(weaponclipsize(self.weapon) * 0.5);
		}

		if(self.var_18B0 <= 0)
		{
			self.var_18B0 = 0;
		}

		return 0;
	}

	if(self.var_18B0 <= weaponclipsize(self.weapon) * param_00)
	{
		if(param_00 == 0)
		{
			if(func_1CAE())
			{
				return 0;
			}
		}

		return 1;
	}

	return 0;
}

//Function Number: 31
func_7063()
{
	self endon("weapon_switch_done");
	self endon("death");
	self waittill("killanimscript");
	animscripts\shared::func_6866(self.alias,"right");
}

//Function Number: 32
func_0365(param_00,param_01)
{
	self endon("killanimscript");
	if(!func_6086(param_00))
	{
		return 0;
	}

	animscripts\battlechatter_ai::func_33B4();
	animscripts\battlechatter::func_6A2B();
	lib_A51B::func_2616(undefined,self.inliveplayerkillstreak == "allies");
	if(isdefined(param_01))
	{
		self method_810F("reloadanim",param_01,%body,1,0.1,1);
		animscripts\shared::func_2D05("reloadanim");
		animscripts\weaponlist::func_72AE();
		self.var_7.var_6081 = 0;
	}
	else
	{
		if(self.var_7.var_6E57 == "prone")
		{
			self method_810F("reloadanim",%prone_reload,%body,1,0.1,1);
			self method_81FB(%prone_legs_up,%prone_legs_down,1,0.1,1);
		}
		else
		{
			wait(2);
			return;
		}

		animscripts\shared::func_2D05("reloadanim");
		animscripts\weaponlist::func_72AE();
		self.var_7.var_6081 = 0;
	}

	return 1;
}

//Function Number: 33
func_07E3(param_00,param_01)
{
	if(!isdefined(level.var_4407))
	{
		anim.var_4407 = [];
		anim.var_4408 = [];
	}

	var_02 = level.var_4407.size;
	level.var_4407[var_02] = param_00;
	level.var_4408[var_02] = param_01;
}

//Function Number: 34
func_4DC0()
{
	func_07E3(%exposed_grenadethrowb,(41.5391,7.28883,72.2128));
	func_07E3(%exposed_grenadethrowc,(34.8849,-4.77048,74.0488));
	func_07E3(%corner_standl_grenade_a,(41.605,6.80107,81.4785));
	func_07E3(%corner_standl_grenade_b,(24.1585,-14.7221,29.2992));
	func_07E3(%cornercrl_grenadea,(25.8988,-10.2811,30.4813));
	func_07E3(%cornercrl_grenadeb,(24.688,45.0702,64.377));
	func_07E3(%corner_standr_grenade_a,(37.1254,-32.7053,76.5745));
	func_07E3(%corner_standr_grenade_b,(19.356,15.5341,16.5036));
	func_07E3(%cornercrr_grenadea,(39.8857,5.92472,24.5878));
	func_07E3(%covercrouch_grenadea,(-1.6363,-0.693674,60.1009));
	func_07E3(%covercrouch_grenadeb,(-1.6363,-0.693674,60.1009));
	func_07E3(%coverstand_grenadea,(10.8573,7.12614,77.2356));
	func_07E3(%coverstand_grenadeb,(19.1804,5.68214,73.2278));
	func_07E3(%prone_grenade_a,(12.2859,-1.3019,33.4307));
	func_07E3(%cqb_stand_grenade_throw,(35.7494,26.6052,37.7086));
	func_07E3(%s1_covercrouch_grenadea,(-15.5413,-16.7719,19.4304));
	func_07E3(%s1_coverstand_grenadea,(3.99694,-2.76588,32.8777));
	func_07E3(%s1_coverstand_grenadeb,(5.51904,2.92983,32.8406));
	func_07E3(%s1_exposed_crouch_fast_grenade_1,(16.4611,-8.55309,30.1018));
	func_07E3(%s1_exposed_crouch_fast_grenade_2,(30.5886,-7.6374,47.3139));
	func_07E3(%s1_exposed_grenadethrowc,(13.433,-0.473915,43.3545));
	func_07E3(%s1_exposed_grenadethrowb,(-31.425,-7.62042,42.4334));
	func_07E3(%s1_cornercrr_grenade_2,(37.4516,-2.01701,22.6517));
	func_07E3(%s1_corner_standl_grenade_a,(41.605,6.80107,81.4785));
	func_07E3(%s1_cornercrr_grenadea,(39.8857,5.92472,24.5878));
}

//Function Number: 35
func_3FAF(param_00)
{
	var_01 = (0,0,64);
	if(isdefined(param_00))
	{
		foreach(var_04, var_03 in level.var_4407)
		{
			if(param_00 == var_03)
			{
				var_01 = level.var_4408[var_04];
				break;
			}
		}
	}

	if(var_01[2] == 64)
	{
		if(!isdefined(param_00))
		{
		}
		else
		{
		}
	}

	return var_01;
}

//Function Number: 36
func_9335()
{
	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		if(level.var_328[var_00].var_62A0 == 0)
		{
			level.var_328[var_00].var_440A["fraggrenade"] = 0;
			level.var_328[var_00].var_440A["flash_grenade"] = 0;
		}
	}

	anim.var_9334 = 1;
}

//Function Number: 37
func_7F0F(param_00)
{
	self.var_71F = spawnstruct();
	if(isplayer(param_00))
	{
		self.var_71F.var_5179 = 1;
		self.var_71F.var_31D = param_00;
		self.var_71F.var_9371 = self.var_1D6;
		return;
	}

	self.var_71F.var_5179 = 0;
	self.var_71F.var_9371 = "AI_" + self.var_1D6;
}

//Function Number: 38
func_9C2A()
{
	return self.var_71F.var_5179;
}

//Function Number: 39
func_7F7A(param_00,param_01)
{
	if(param_00.var_5179)
	{
		var_02 = param_00.var_31D;
		var_03 = var_02.var_440A[param_00.var_9371];
		var_02.var_440A[param_00.var_9371] = max(param_01,var_03);
		return;
	}

	var_03 = level.var_440A[param_01.var_9371];
	level.var_440A[param_00.var_9371] = max(param_01,var_03);
}

//Function Number: 40
func_3F53()
{
	var_00 = undefined;
	if(func_9C2A())
	{
		var_01 = self.var_71F.var_31D;
		var_00 = gettime() + var_01.var_443E.var_6CB0 + randomint(var_01.var_443E.var_6CB1);
	}
	else
	{
		var_00 = gettime() + 30000 + randomint(30000);
	}

	return var_00;
}

//Function Number: 41
func_3FB0(param_00)
{
	if(param_00.var_5179)
	{
		return param_00.var_31D.var_440A[param_00.var_9371];
	}

	return level.var_440A[param_00.var_9371];
}

//Function Number: 42
func_2151(param_00)
{
	if(!isplayer(param_00) && self method_813D())
	{
		if(gettime() < func_3FB0(self.var_71F))
		{
			if(level.var_31D.ignoreme)
			{
				return param_00;
			}

			var_01 = self sentient_getthreatbiasgroup();
			var_02 = level.var_31D sentient_getthreatbiasgroup();
			if(var_01 != "" && var_02 != "" && getthreatbias(var_02,var_01) < -10000)
			{
				return param_00;
			}

			if(self method_81BE(level.var_31D) || isai(param_00) && param_00 method_81BE(level.var_31D))
			{
				if(isdefined(self.var_22BA))
				{
					var_03 = vectortoangles(level.var_31D.var_2E6 - self.var_2E6);
					var_04 = angleclamp180(self.var_22BA.var_41[1] - var_03[1]);
				}
				else
				{
					var_04 = animscripts\utility::func_4174(level.var_31D.var_2E6);
				}

				if(abs(var_04) < 60)
				{
					param_00 = level.var_31D;
					func_7F0F(param_00);
				}
			}
		}
	}

	return param_00;
}

//Function Number: 43
func_5A60(param_00)
{
	if(lib_A59A::func_6AC8())
	{
		return 0;
	}

	if(!param_00.var_443E.var_2D8B)
	{
		return 0;
	}

	var_01 = gettime();
	if(var_01 < param_00.var_440A["double_grenade"])
	{
		return 0;
	}

	if(var_01 > param_00.var_559F + 3000)
	{
		return 0;
	}

	if(var_01 < param_00.var_559F + 500)
	{
		return 0;
	}

	return param_00.var_62A0 < 2;
}

//Function Number: 44
func_6033()
{
	return gettime() >= self.var_7.var_60C9;
}

//Function Number: 45
func_43F8(param_00)
{
	if(lib_A59A::func_6AC8())
	{
		return 0;
	}

	if(self.var_79E5 == 1)
	{
		return 1;
	}

	if(!func_6033())
	{
		return 0;
	}

	if(gettime() >= func_3FB0(self.var_71F))
	{
		return 1;
	}

	if(self.var_71F.var_5179 && self.var_71F.var_9371 == "fraggrenade")
	{
		return func_5A60(param_00);
	}

	return 0;
}

//Function Number: 46
func_9896(param_00,param_01,param_02,param_03)
{
	if(!self method_81CF(param_00,param_01))
	{
		return 0;
	}
	else if(distancesquared(self.var_2E6,param_01) < 40000)
	{
		return 0;
	}

	var_04 = physicstrace(param_01 + (0,0,1),param_01 + (0,0,-500));
	if(var_04 == param_01 + (0,0,-500))
	{
		return 0;
	}

	var_04 = var_04 + (0,0,0.1);
	return func_9897(param_00,var_04,param_02,param_03);
}

//Function Number: 47
func_9895(param_00,param_01)
{
	if(self.weapon == "mg42" || self.var_1D3 <= 0)
	{
		return 0;
	}

	func_7F0F(param_00);
	param_00 = func_2151(param_00);
	if(!func_43F8(param_00))
	{
		return 0;
	}

	var_02 = func_3FAF(param_01);
	if(isdefined(self.enemy) && param_00 == self.enemy)
	{
		if(!func_1D09())
		{
			return 0;
		}

		if(isplayer(self.enemy) && lib_A59A::func_505F(self.enemy))
		{
			return 0;
		}

		if(animscripts\utility::func_1AE2())
		{
			if(!self method_81CF(param_00,param_00.var_2E6))
			{
				return 0;
			}

			return func_9897(param_00,undefined,param_01,var_02);
		}
		else if(animscripts\utility::func_1AF0())
		{
			return func_9896(param_00,animscripts\utility::func_3F7C(),param_01,var_02);
		}
		else
		{
			if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
			{
				var_03 = self sentient_lastknownpos(param_00);
			}
			else
			{
				var_03 = param_01.var_2E6;
			}

			if(!self method_81CF(param_00,var_03))
			{
				return 0;
			}

			return func_9897(param_00,undefined,param_01,var_02);
		}

		return 0;
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_03 = self sentient_lastknownpos(param_01);
	}
	else
	{
		var_03 = param_01.var_2E6;
	}

	return func_9896(param_00,var_03,param_01,var_02);
}

//Function Number: 48
func_9897(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(gettime() < 10000 && !isdefined(level.var_4BB1))
	{
		return 0;
	}

	if(!isdefined(param_05))
	{
		param_05 = 1;
	}

	if(isdefined(param_02))
	{
		var_07 = param_02;
		var_08 = self.var_7.var_446E;
	}
	else
	{
		switch(self.var_7.var_8A14)
		{
			case "cover_crouch":
			case "none":
				break;

			default:
				break;
		}
	}
}

//Function Number: 49
func_72A4(param_00)
{
	self endon("dont_reduce_giptp_on_killanimscript");
	self waittill("killanimscript");
	param_00.var_62A0--;
}

//Function Number: 50
func_2CD6(param_00,param_01,param_02,param_03)
{
	self endon("killanimscript");
	if(self.script == "combat" || self.script == "move")
	{
		self method_818F("face direction",param_01);
	}

	animscripts\battlechatter_ai::func_33AF(self.var_1D6);
	lib_A51B::func_2614(self.var_1D6,self.inliveplayerkillstreak == "allies",0);
	self notify("stop_aiming_at_enemy");
	self method_8110("throwanim",param_00,%body,func_3678(),0.1,1);
	thread animscripts\notetracks::func_2D06("throwanim","killanimscript");
	var_04 = animscripts\utility::func_3FAE();
	var_05 = "none";
	for(;;)
	{
		self waittill("throwanim",var_06);
		if(var_06 == "grenade_left" || var_06 == "grenade_right")
		{
			var_05 = func_0DFB(var_04,"TAG_INHAND");
			self.var_5118 = 1;
		}

		if(var_06 == "grenade_throw" || var_06 == "grenade throw")
		{
			break;
		}

		if(var_06 == "end")
		{
			self.var_71F.var_31D.var_62A0--;
			self notify("dont_reduce_giptp_on_killanimscript");
			return 0;
		}
	}

	self notify("dont_reduce_giptp_on_killanimscript");
	if(func_9C2A())
	{
		thread func_A226(self.var_71F.var_31D,param_02);
	}

	self method_81D3();
	if(!func_9C2A())
	{
		func_7F7A(self.var_71F,param_02);
	}

	if(param_03)
	{
		var_0D = self.var_71F.var_31D;
		if(var_0D.var_62A0 > 1 || gettime() - var_0D.var_55A1 < 2000)
		{
			var_0D.var_440A["double_grenade"] = gettime() + min(5000,var_0D.var_443E.var_6C92);
		}
	}

	self notify("stop grenade check");
	if(var_05 != "none")
	{
		self detach(var_04,var_05);
	}
	else
	{
	}

	self.var_5118 = undefined;
	self.var_1D4 = self.var_63CF;
	self.var_63CF = undefined;
	self waittillmatch("end","throwanim");
	self notify("done_grenade_throw");
	self notify("weapon_switch_done");
	self method_814B(%exposed_modern,1,0.2);
	self method_814B(%exposed_aiming,1);
	self method_8142(param_00,0.2);
}

//Function Number: 51
func_A226(param_00,param_01)
{
	param_00 endon("death");
	func_A227(param_01);
	param_00.var_62A0--;
}

//Function Number: 52
func_A227(param_00)
{
	var_01 = self.var_71F;
	var_02 = spawnstruct();
	var_02 thread func_A228(5);
	var_02 endon("watchGrenadeTowardsPlayerTimeout");
	var_03 = self.var_1D6;
	var_04 = func_3FAD();
	if(!isdefined(var_04))
	{
		return;
	}

	func_7F7A(var_01,min(gettime() + 5000,param_00));
	var_05 = 62500;
	var_06 = 160000;
	if(var_03 == "flash_grenade")
	{
		var_05 = 810000;
		var_06 = 1690000;
	}

	var_07 = level.var_328;
	var_08 = var_04.var_2E6;
	for(;;)
	{
		wait(0.1);
		if(!isdefined(var_04))
		{
			break;
		}

		if(distancesquared(var_04.var_2E6,var_08) < 400)
		{
			var_09 = [];
			for(var_0A = 0;var_0A < var_07.size;var_0A++)
			{
				var_0B = var_07[var_0A];
				var_0C = distancesquared(var_04.var_2E6,var_0B.var_2E6);
				if(var_0C < var_05)
				{
					var_0B func_43FF(var_01,param_00);
					continue;
				}

				if(var_0C < var_06)
				{
					var_09[var_09.size] = var_0B;
				}
			}

			var_07 = var_09;
			if(var_07.size == 0)
			{
				break;
			}
		}

		var_08 = var_04.var_2E6;
	}
}

//Function Number: 53
func_43FF(param_00,param_01)
{
	var_02 = self;
	anim.var_9334 = undefined;
	if(gettime() - var_02.var_55A1 < 3000)
	{
		var_02.var_440A["double_grenade"] = gettime() + var_02.var_443E.var_6C92;
	}

	var_02.var_55A1 = gettime();
	var_03 = var_02.var_440A[param_00.var_9371];
	var_02.var_440A[param_00.var_9371] = max(param_01,var_03);
}

//Function Number: 54
func_3FAD()
{
	self endon("killanimscript");
	self waittill("grenade_fire",var_00);
	return var_00;
}

//Function Number: 55
func_A228(param_00)
{
	wait(param_00);
	self notify("watchGrenadeTowardsPlayerTimeout");
}

//Function Number: 56
func_0DFB(param_00,param_01)
{
	self attach(param_00,param_01);
	thread func_2980(param_00,param_01);
	return param_01;
}

//Function Number: 57
func_2980(param_00,param_01)
{
	self endon("stop grenade check");
	self waittill("killanimscript");
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(self.var_63CF))
	{
		self.var_1D4 = self.var_63CF;
		self.var_63CF = undefined;
	}

	self detach(param_00,param_01);
}

//Function Number: 58
func_6381(param_00)
{
	var_01 = anglestoforward(self.var_41);
	var_02 = anglestoright(self.var_41);
	var_03 = anglestoup(self.var_41);
	var_01 = var_01 * param_00[0];
	var_02 = var_02 * param_00[1];
	var_03 = var_03 * param_00[2];
	return var_01 + var_02 + var_03;
}

//Function Number: 59
func_4400(param_00,param_01)
{
	level notify("armoffset");
	level endon("armoffset");
	param_00 = self.var_2E6 + func_6381(param_00);
	wait(0.05);
}

//Function Number: 60
func_3FAB()
{
	var_00 = randomfloat(360);
	var_01 = randomfloatrange(30,75);
	var_02 = sin(var_01);
	var_03 = cos(var_01);
	var_04 = cos(var_00) * var_03;
	var_05 = sin(var_00) * var_03;
	var_06 = randomfloatrange(100,200);
	var_07 = (var_04,var_05,var_02) * var_06;
	return var_07;
}

//Function Number: 61
func_2F6E()
{
	var_00 = self gettagorigin("tag_inhand");
	var_01 = func_3FAB();
	self method_8038(var_00,var_01,3);
}

//Function Number: 62
func_585C()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(self.var_180 || self.var_12F)
	{
		return 0;
	}

	var_00 = func_3F13();
	if(isdefined(var_00))
	{
		return func_9BEB(var_00);
	}

	return 0;
}

//Function Number: 63
func_3F13()
{
	var_00 = self method_81EE();
	if(!isdefined(var_00))
	{
		return undefined;
	}

	var_01 = animscripts\utility::func_3F2D();
	if(isdefined(var_01) && var_00 == var_01)
	{
		return undefined;
	}

	if(isdefined(self.var_22BA) && var_00 == self.var_22BA)
	{
		return undefined;
	}

	return var_00;
}

//Function Number: 64
func_9BEB(param_00)
{
	var_01 = self.var_234;
	var_02 = self.var_233;
	self.var_234 = 0;
	self.var_233 = 0;
	if(self method_81F0(param_00))
	{
		return 1;
	}
	else
	{
	}

	self.var_234 = var_01;
	self.var_233 = var_02;
	return 0;
}

//Function Number: 65
func_8496()
{
	if(level.var_883[self.inliveplayerkillstreak] > 0 && level.var_883[self.inliveplayerkillstreak] < level.var_884)
	{
		if(gettime() - level.var_5571[self.inliveplayerkillstreak] > 4000)
		{
			return 0;
		}

		var_00 = level.var_556E[self.inliveplayerkillstreak];
		if(var_00 == self)
		{
			return 0;
		}

		var_01 = isdefined(var_00) && distancesquared(self.var_2E6,var_00.var_2E6) < 65536;
		if((var_01 || distancesquared(self.var_2E6,level.var_5570[self.inliveplayerkillstreak]) < 65536) && !isdefined(self.enemy) || distancesquared(self.enemy.var_2E6,level.var_556F[self.inliveplayerkillstreak]) < 262144)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 66
func_1CF0()
{
	if(!isdefined(level.var_5571[self.inliveplayerkillstreak]))
	{
		return 0;
	}

	if(func_8496())
	{
		return 1;
	}

	if(gettime() - level.var_5571[self.inliveplayerkillstreak] < level.var_885)
	{
		return 0;
	}

	if(!issentient(self.enemy))
	{
		return 0;
	}

	if(level.var_883[self.inliveplayerkillstreak])
	{
		level.var_883[self.inliveplayerkillstreak] = 0;
	}

	var_00 = isdefined(self.var_87E) && self.var_87E;
	if(!var_00 && function_00D5(self.inliveplayerkillstreak) < function_00D5(self.enemy.inliveplayerkillstreak))
	{
		return 0;
	}

	return 1;
}

//Function Number: 67
func_989C(param_00)
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(self.var_180)
	{
		return 0;
	}

	if(self.var_C8 == "ambush" || self.var_C8 == "ambush_nodes_only")
	{
		return 0;
	}

	if(!self method_815F(self.enemy.var_2E6))
	{
		return 0;
	}

	if(func_5147())
	{
		return 0;
	}

	if(!func_1CF0())
	{
		return 0;
	}

	self method_81F3(param_00);
	if(self method_81F5())
	{
		self.var_234 = 0;
		self.var_233 = 0;
		self.var_7.var_58DB = 1;
		if(level.var_883[self.inliveplayerkillstreak] == 0)
		{
			level.var_5571[self.inliveplayerkillstreak] = gettime();
			level.var_556E[self.inliveplayerkillstreak] = self;
		}

		level.var_5570[self.inliveplayerkillstreak] = self.var_2E6;
		level.var_556F[self.inliveplayerkillstreak] = self.enemy.var_2E6;
		level.var_883[self.inliveplayerkillstreak]++;
		return 1;
	}

	return 0;
}

//Function Number: 68
func_27DD(param_00)
{
	self endon("death");
	wait(0.5);
	var_01 = "" + level.var_1267;
	badplace_cylinder(var_01,5,param_00,16,64,self.inliveplayerkillstreak);
	level.var_126A[level.var_126A.size] = var_01;
	if(level.var_126A.size >= 10)
	{
		var_02 = [];
		for(var_03 = 1;var_03 < level.var_126A.size;var_03++)
		{
			var_02[var_02.size] = level.var_126A[var_03];
		}

		badplace_delete(level.var_126A[0]);
		anim.var_126A = var_02;
	}

	level.var_1267++;
	if(level.var_1267 > 10)
	{
		anim.var_1267 = level.var_1267 - 20;
	}
}

//Function Number: 69
func_9C4E(param_00,param_01,param_02)
{
	if(param_00 > param_01 && param_00 < param_02)
	{
		return 1;
	}

	return 0;
}

//Function Number: 70
func_3FBD()
{
	if(!isdefined(self.var_8409))
	{
		return 0;
	}

	var_00 = self method_81B9()[1] - animscripts\utility::func_416E(self.var_8409);
	var_00 = angleclamp180(var_00);
	return var_00;
}

//Function Number: 71
func_3FBC()
{
	if(!isdefined(self.var_8409))
	{
		return 0;
	}

	var_00 = self method_81B9()[0] - vectortoangles(self.var_8409 - self method_81B8())[0];
	var_00 = angleclamp180(var_00);
	return var_00;
}

//Function Number: 72
func_4080()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_00 = func_3DB0(self.enemy);
	}
	else
	{
		var_00 = self.enemy method_8097();
	}

	var_01 = var_00 - self method_8097();
	var_01 = vectornormalize(var_01);
	var_02 = 360 - vectortoangles(var_01)[0];
	return angleclamp180(var_02);
}

//Function Number: 73
func_4083(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_01 = param_00 - self method_8097();
	var_01 = vectornormalize(var_01);
	var_02 = 360 - vectortoangles(var_01)[0];
	return angleclamp180(var_02);
}

//Function Number: 74
func_4081(param_00,param_01)
{
	if(!isdefined(param_00) || !isdefined(param_01))
	{
		return 0;
	}

	if(isdefined(self) && animscripts\utility::func_51AD())
	{
		var_02 = anglestoforward(self.var_41);
		var_03 = rotatepointaroundvector(var_02,param_00 - self.var_2E6,self.var_41[2] * -1);
		param_00 = var_03 + self.var_2E6;
	}

	var_04 = param_00 - param_01;
	var_04 = vectornormalize(var_04);
	var_05 = 360 - vectortoangles(var_04)[0];
	return angleclamp180(var_05);
}

//Function Number: 75
func_A247()
{
	self.var_5189 = 0;
	self.var_55D1 = -1;
	for(;;)
	{
		self waittill("reload_start");
		lib_A51B::func_2616(self getcurrentweapon(),self.inliveplayerkillstreak == "allies");
		self.var_5189 = 1;
		self.var_55D1 = gettime();
		func_A0E5();
		self.var_5189 = 0;
	}
}

//Function Number: 76
func_A0E5()
{
	thread func_935B(4,"reloadtimeout");
	self endon("reloadtimeout");
	self endon("weapon_taken");
	for(;;)
	{
		self waittill("reload");
		var_00 = self getcurrentweapon();
		if(var_00 == "none")
		{
			break;
		}

		if(self getcurrentweaponclipammo() >= weaponclipsize(var_00))
		{
			break;
		}
	}

	self notify("reloadtimeout");
}

//Function Number: 77
func_935B(param_00,param_01)
{
	self endon(param_01);
	wait(param_00);
	self notify(param_01);
}

//Function Number: 78
func_1D09()
{
	var_00 = self.enemy.var_2E6 - self.var_2E6;
	var_01 = lengthsquared((var_00[0],var_00[1],0));
	if(self.var_1D6 == "flash_grenade")
	{
		return var_01 < 589824;
	}

	return var_01 >= 40000 && var_01 <= 1562500;
}

//Function Number: 79
monitorflash()
{
	self endon("death");
	if(!isdefined(level.var_6095))
	{
		self endon("stop_monitoring_flash");
	}

	for(;;)
	{
		var_00 = undefined;
		var_01 = undefined;
		var_02 = undefined;
		var_03 = undefined;
		var_04 = undefined;
		self waittill("flashbang",var_01,var_00,var_02,var_03,var_04);
		if(isdefined(self.var_38A6) && self.var_38A6)
		{
			continue;
		}

		if(isdefined(self.var_7A11) && self.var_7A11 != 0)
		{
			continue;
		}

		if(isdefined(self.inliveplayerkillstreak) && isdefined(var_04) && self.inliveplayerkillstreak == var_04)
		{
			var_00 = 3 * var_00 - 0.75;
			if(var_00 < 0)
			{
				continue;
			}

			if(isdefined(self.var_91EA))
			{
				continue;
			}
		}

		var_05 = 0.2;
		if(var_00 > 1 - var_05)
		{
			var_00 = 1;
		}
		else
		{
			var_00 = var_00 / 1 - var_05;
		}

		var_06 = 4.5 * var_00;
		if(var_06 < 0.25)
		{
			continue;
		}

		self.var_38B4 = var_04;
		lib_A59A::func_38A9(var_06);
		self notify("doFlashBanged",var_01,var_03);
	}
}

//Function Number: 80
func_51A1()
{
	return animscripts\utility::func_51A0(self.alias);
}

//Function Number: 81
issniper()
{
	return animscripts\utility::func_51A9(self.alias);
}

//Function Number: 82
func_5147()
{
	return issniper() || animscripts\utility::func_9C2E();
}

//Function Number: 83
func_3678()
{
	return 1.5;
}

//Function Number: 84
func_711C()
{
	return randomfloatrange(1,1.2);
}

//Function Number: 85
func_40A2(param_00)
{
	if(param_00.size == 0)
	{
		return undefined;
	}

	if(param_00.size == 1)
	{
		return param_00[0];
	}

	if(isdefined(self.var_7.var_6F4A) && randomint(100) > 20)
	{
		foreach(var_03, var_02 in param_00)
		{
			if(var_02 == self.var_7.var_6F4A)
			{
				if(var_03 < param_00.size - 1)
				{
					param_00[var_03] = param_00[param_00.size - 1];
				}

				param_00[param_00.size - 1] = undefined;
				break;
			}
		}
	}

	return param_00[randomint(param_00.size)];
}

//Function Number: 86
func_6BFC()
{
	var_00 = self geteye();
	foreach(var_02 in level.var_328)
	{
		if(!self method_81BE(var_02))
		{
			continue;
		}

		var_03 = var_02 geteye();
		var_04 = vectortoangles(var_00 - var_03);
		var_05 = anglestoforward(var_04);
		var_06 = var_02 getplayerangles();
		var_07 = anglestoforward(var_06);
		var_08 = vectordot(var_05,var_07);
		if(var_08 < 0.805)
		{
			continue;
		}

		if(common_scripts\utility::cointoss() && var_08 >= 0.996)
		{
			continue;
		}

		return 1;
	}

	return 0;
}

//Function Number: 87
func_3DB0(param_00)
{
	var_01 = self sentient_lastknownpos(param_00);
	var_02 = param_00 method_8097() - param_00.var_2E6;
	return var_01 + var_02;
}