/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cqb.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 287 ms
 * Timestamp: 4/20/2022 8:20:25 PM
*******************************************************************/

//Function Number: 1
func_5F49()
{
	animscripts\run::func_8B0A();
	if(self.var_7.var_6E57 != "stand")
	{
		self method_8142(%animscript_root,0.2);
		if(self.var_7.var_6E57 == "prone")
		{
			animscripts\utility::func_3449(1);
		}

		self.var_7.var_6E57 = "stand";
	}

	self.var_7.var_5F58 = self.movemode;
	func_22DF();
	if(animscripts\run::func_5F03())
	{
		return;
	}

	self method_8142(%stair_transitions,0.2);
	if(animscripts\run::func_8B0B())
	{
		return;
	}

	if(isdefined(self.var_9362))
	{
		var_00 = self.var_9362;
	}
	else
	{
		var_00 = 0;
	}

	self.var_9362 = gettime();
	var_01 = func_29A5();
	if(self.var_3F2 == "none")
	{
		var_02 = 0.3;
	}
	else
	{
		var_02 = 0.1;
	}

	var_03 = 0.2;
	var_04 = %walk_and_run_loops;
	if(self.var_9362 - var_00 > var_03 * 1000)
	{
		var_04 = %stand_and_crouch;
	}

	self method_810F("runanim",var_01,var_04,1,var_02,self.var_5F62,1);
	func_22D5(var_01);
	animscripts\run::func_7FB1(animscripts\utility::func_5860("cqb","move_b"),animscripts\utility::func_5860("cqb","move_l"),animscripts\utility::func_5860("cqb","move_r"));
	thread animscripts\run::func_7F38("cqb");
	animscripts\notetracks::func_2D0A(var_03,"runanim");
}

//Function Number: 2
func_29A5()
{
	if(isdefined(self.var_2562) && isdefined(self.var_2562["cqb"]))
	{
		return animscripts\run::func_40BB();
	}

	if(self.var_3F2 == "up")
	{
		return animscripts\utility::func_5860("cqb","stairs_up");
	}

	if(self.var_3F2 == "down")
	{
		return animscripts\utility::func_5860("cqb","stairs_down");
	}

	if(self.movemode == "walk")
	{
		return animscripts\utility::func_5860("cqb","move_f");
	}

	if(isdefined(self.var_7.var_135B) && self.var_7.var_135B)
	{
		return animscripts\utility::func_5860("cqb","straight");
	}

	var_00 = animscripts\utility::func_5860("cqb","straight_twitch");
	if(!isdefined(var_00) || var_00.size == 0)
	{
		return animscripts\utility::func_5860("cqb","straight");
	}

	var_01 = animscripts\utility::func_40A4(self.var_7.var_76D1,4);
	if(var_01 == 0)
	{
		var_02 = animscripts\utility::func_40A4(self.var_7.var_76D1,var_00.size);
		return var_00[var_02];
	}

	return animscripts\utility::func_5860("cqb","straight");
}

//Function Number: 3
func_22D7()
{
	self endon("movemode");
	self method_818F("face motion");
	var_00 = "reload_" + animscripts\combat_utility::func_4140();
	var_01 = animscripts\utility::func_5860("cqb","reload");
	if(isarray(var_01))
	{
		var_01 = var_01[randomint(var_01.size)];
	}

	self method_8110(var_00,var_01,%body,1,0.25);
	func_22D5(var_01);
	animscripts\run::func_7FB1(animscripts\utility::func_5860("cqb","move_b"),animscripts\utility::func_5860("cqb","move_l"),animscripts\utility::func_5860("cqb","move_r"));
	thread animscripts\run::func_7F38("cqb");
	animscripts\shared::func_2D05(var_00);
}

//Function Number: 4
func_22DF()
{
	var_00 = self.var_3F2 != "none";
	var_01 = !var_00 && animscripts\move::func_5A5E();
	animscripts\run::func_8007(var_01);
	if(var_00)
	{
		animscripts\run::func_315C();
		return;
	}

	thread animscripts\run::func_35B4();
}

//Function Number: 5
func_8302()
{
	level.var_22DE = [];
	var_00 = getentarray("cqb_point_of_interest","targetname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		level.var_22DE[var_01] = var_00[var_01].var_2E6;
		var_00[var_01] delete();
	}
}

//Function Number: 6
func_377C()
{
	if(isdefined(level.var_377F))
	{
		return;
	}

	anim.var_377F = 1;
	if(!level.var_22DE.size)
	{
		return;
	}

	for(;;)
	{
		var_00 = function_00D6();
		var_01 = 0;
		foreach(var_03 in var_00)
		{
			if(isalive(var_03) && var_03 animscripts\utility::func_50E6() && !isdefined(var_03.var_2A8A))
			{
				var_04 = var_03.var_7.var_5F58 != "stop";
				var_05 = (var_03.var_2E6[0],var_03.var_2E6[1],var_03 method_8097()[2]);
				var_06 = var_05;
				var_07 = anglestoforward(var_03.var_41);
				if(var_04)
				{
					var_08 = bullettrace(var_06,var_06 + var_07 * 128,0,undefined);
					var_06 = var_08["position"];
				}

				var_09 = -1;
				var_0A = 1048576;
				for(var_0B = 0;var_0B < level.var_22DE.size;var_0B++)
				{
					var_0C = level.var_22DE[var_0B];
					var_0D = distancesquared(var_0C,var_06);
					if(var_0D < var_0A)
					{
						if(var_04)
						{
							if(distancesquared(var_0C,var_05) < 4096)
							{
								continue;
							}

							var_0E = vectordot(vectornormalize(var_0C - var_05),var_07);
							if(var_0E < 0.643 || var_0E > 0.966)
							{
								continue;
							}
						}
						else if(var_0D < 2500)
						{
							continue;
						}

						if(!sighttracepassed(var_06,var_0C,0,undefined))
						{
							continue;
						}

						var_0A = var_0D;
						var_09 = var_0B;
					}
				}

				if(var_09 < 0)
				{
					var_03.var_22D6 = undefined;
				}
				else
				{
					var_03.var_22D6 = level.var_22DE[var_09];
				}

				wait(0.05);
				var_01 = 1;
			}
		}

		if(!var_01)
		{
			wait(0.25);
		}
	}
}

//Function Number: 7
func_22D5(param_00)
{
	self.var_35C5 = animscripts\face::func_6D98(param_00,"run",self.var_35C5);
}

//Function Number: 8
func_22D0()
{
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}