/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: reactions.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 437 ms
 * Timestamp: 4/20/2022 8:20:41 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4("reactions");
	func_60A9();
}

//Function Number: 2
func_4C9F()
{
	var_00 = [];
	var_00["cover_stand"] = [%stand_cover_reaction_a,%stand_cover_reaction_b];
	var_00["cover_crouch"] = [%stand_cover_reaction_a,%stand_cover_reaction_b];
	var_00["cover_left"] = [%stand_cover_reaction_a,%stand_cover_reaction_b];
	var_00["cover_right"] = [%stand_cover_reaction_a,%stand_cover_reaction_b];
	level.var_CCA["soldier"]["cover_reactions"] = var_00;
	var_00 = [];
	var_00[0] = %run_wizby_a;
	var_00[1] = %run_wizby_b;
	level.var_CCA["soldier"]["running_react_to_bullets"] = var_00;
	anim.var_55D2 = 0;
}

//Function Number: 3
func_7187()
{
	thread func_18B3();
}

//Function Number: 4
func_1AD9()
{
	return !isdefined(self.var_55CF) || gettime() - self.var_55CF > 2000;
}

//Function Number: 5
func_18B4()
{
	self endon("killanimscript");
	self.var_55CF = gettime();
	self.var_7.var_5F58 = "stop";
	var_00 = isdefined(self.var_A30D) && distancesquared(self.var_2E6,self.var_A30D.var_2E6) < 160000;
	self method_818E("gravity");
	self method_818F("face current");
	if(var_00 || common_scripts\utility::cointoss())
	{
		self method_8142(%animscript_root,0.1);
		var_01 = [];
		if(animscripts\utility::func_9C33())
		{
			var_01[0] = %smg_exposed_idle_reacta;
			var_01[1] = %smg_exposed_idle_reactb;
			var_01[2] = %smg_exposed_idle_twitch;
			var_01[3] = %smg_exposed_idle_twitch_v4;
		}
		else
		{
			var_01[0] = %exposed_idle_reacta;
			var_01[1] = %exposed_idle_reactb;
			var_01[2] = %exposed_idle_twitch;
			var_01[3] = %exposed_idle_twitch_v4;
		}

		var_02 = var_01[randomint(var_01.size)];
		if(var_00)
		{
			var_03 = 1 + randomfloat(0.5);
		}
		else
		{
			var_03 = 0.2 + randomfloat(0.5);
		}

		self method_810D("reactanim",var_02,1,0.1,1);
		animscripts\notetracks::func_2D0A(var_03,"reactanim");
		self method_8142(%animscript_root,0.1);
		if(!var_00 && self.var_3F2 == "none" && !isdefined(self.var_2A92))
		{
			var_04 = 1 + randomfloat(0.2);
			var_05 = animscripts\utility::func_711B(%exposed_dive_grenade_b,%exposed_dive_grenade_f);
			self method_810D("dive",var_05,1,0.1,var_04);
			animscripts\shared::func_2D05("dive");
		}
	}
	else
	{
		wait(randomfloat(0.2));
		var_04 = 1.2 + randomfloat(0.3);
		if(self.var_7.var_6E57 == "stand")
		{
			self method_8142(%animscript_root,0.1);
			self method_810D("crouch",%exposed_stand_2_crouch,1,0.1,var_04);
			animscripts\shared::func_2D05("crouch");
		}

		var_06 = anglestoforward(self.var_41);
		if(isdefined(self.var_A30D))
		{
			var_07 = vectornormalize(self.var_A30D.var_2E6 - self.var_2E6);
		}
		else
		{
			var_07 = var_07;
		}

		if(vectordot(var_07,var_06) > 0)
		{
			var_08 = animscripts\utility::func_711B(%exposed_crouch_idle_twitch_v2,%exposed_crouch_idle_twitch_v3);
			self method_8142(%animscript_root,0.1);
			self method_810D("twitch",var_08,1,0.1,1);
			animscripts\shared::func_2D05("twitch");
		}
		else
		{
			var_09 = animscripts\utility::func_711B(%exposed_crouch_turn_180_left,%exposed_crouch_turn_180_right);
			self method_8142(%animscript_root,0.1);
			self method_810D("turn",var_09,1,0.1,1);
			animscripts\shared::func_2D05("turn");
		}
	}

	self method_8142(%animscript_root,0.1);
	self.var_A30D = undefined;
	self method_818E("normal");
	self method_818F("face default");
}

//Function Number: 6
func_18B3()
{
	self endon("killanimscript");
	if(isdefined(self.var_2AF6))
	{
		return;
	}

	for(;;)
	{
		self waittill("bulletwhizby",var_00);
		if(!isdefined(var_00.inliveplayerkillstreak) || self.inliveplayerkillstreak == var_00.inliveplayerkillstreak)
		{
			continue;
		}

		if(isdefined(self.var_22BA) || isdefined(self.var_B6A))
		{
			continue;
		}

		if(self.var_7.var_6E57 != "stand")
		{
			continue;
		}

		if(!func_1AD9())
		{
			continue;
		}

		self.var_A30D = var_00;
		self method_819A(::func_18B4);
	}
}

//Function Number: 7
func_1EF4()
{
	self endon("killanimscript");
	wait(0.3);
	self method_81FF();
}

//Function Number: 8
func_4037()
{
	var_00 = undefined;
	if(self method_8163())
	{
		var_01 = animscripts\utility::func_5861("cover_reactions");
		if(isdefined(var_01[self.var_33A]))
		{
			var_02 = anglestoforward(self.node.var_41);
			var_03 = vectornormalize(self.var_35C - self.var_2E6);
			if(vectordot(var_02,var_03) < -0.5)
			{
				self method_818F("face current");
				var_04 = randomint(var_01[self.var_33A].size);
				var_00 = var_01[self.var_33A][var_04];
			}
		}
	}

	if(!isdefined(var_00))
	{
		var_05 = [];
		if(animscripts\utility::func_9C33())
		{
			var_05[0] = %smg_exposed_backpedal;
			var_05[1] = %smg_exposed_idle_reactb;
		}
		else if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
		{
			var_05[0] = %s1_exposed_backpedal;
			var_05[1] = %s1_exposed_idle_alert_v5;
		}
		else
		{
			var_05[0] = %exposed_backpedal;
			var_05[1] = %exposed_idle_reactb;
		}

		if(isdefined(self.enemy) && distancesquared(self.enemy.var_2E6,self.var_35C) < 65536)
		{
			self method_818F("face enemy");
		}
		else
		{
			self method_818F("face point",self.var_35C);
		}

		if(self.var_7.var_6E57 == "crouch")
		{
			var_03 = vectornormalize(self.var_35C - self.var_2E6);
			var_06 = anglestoforward(self.var_41);
			if(vectordot(var_06,var_03) < -0.5)
			{
				self method_818F("face current");
				var_05[0] = %crouch_cover_reaction_a;
				var_05[1] = %crouch_cover_reaction_b;
			}
		}

		var_00 = var_05[randomint(var_05.size)];
	}

	return var_00;
}

//Function Number: 9
func_8E14()
{
	self method_8142(%animscript_root,0.2);
	if(randomint(4) < 3)
	{
		self method_818F("face enemy");
		var_00 = %exposed_idle_reactb;
		if(animscripts\utility::func_9C33())
		{
			var_00 = %smg_exposed_idle_reactb;
		}

		self method_810D("reactanim",var_00,1,0.2,1);
		var_01 = function_0063(var_00);
		animscripts\notetracks::func_2D0A(var_01 * 0.8,"reactanim");
		self method_818F("face current");
		return;
	}

	self method_818F("face enemy");
	var_02 = %exposed_backpedal;
	var_03 = %exposed_backpedal_v2;
	if(animscripts\utility::func_9C33())
	{
		var_02 = %smg_exposed_backpedal;
		var_03 = %smg_exposed_backpedal_v2;
	}

	self method_810D("reactanim",var_02,1,0.2,1);
	var_01 = function_0063(var_02);
	animscripts\notetracks::func_2D0A(var_01 * 0.8,"reactanim");
	self method_818F("face current");
	self method_8142(%animscript_root,0.2);
	self method_810D("reactanim",var_03,1,0.2,1);
	animscripts\shared::func_2D05("reactanim");
}

//Function Number: 10
func_60A8()
{
	self endon("death");
	self endon("endNewEnemyReactionAnim");
	self.var_55CF = gettime();
	self.var_7.var_5F58 = "stop";
	self.var_6DAF = 1;
	if(isdefined(self.var_669) && self.var_26 != "combat")
	{
		func_8E14();
	}
	else
	{
		var_00 = func_4037();
		self method_8142(%animscript_root,0.2);
		self method_810D("reactanim",var_00,1,0.2,1);
		animscripts\shared::func_2D05("reactanim");
	}

	self notify("newEnemyReactionDone");
	self.var_6DAF = undefined;
}

//Function Number: 11
func_60A9()
{
	self endon("death");
	if(isdefined(self.var_2B23))
	{
		return;
	}

	if(!func_1AD9())
	{
		return;
	}

	if(self.var_7.var_6E57 == "prone" || isdefined(self.var_7.var_644E))
	{
		return;
	}

	self method_818E("gravity");
	if(isdefined(self.enemy))
	{
		func_60A8();
	}
}

//Function Number: 12
end_script()
{
	if(isdefined(self.var_6DAF))
	{
		self notify("newEnemyReactionDone");
		self.var_6DAF = undefined;
	}
}