/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: exit_node.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 527 ms
 * Timestamp: 4/20/2022 8:20:28 PM
*******************************************************************/

//Function Number: 1
func_8D28()
{
	if(isdefined(self.var_2563))
	{
		func_2563();
		return;
	}

	self endon("killanimscript");
	if(!func_1D23())
	{
		return;
	}

	var_00 = self.var_2E6;
	var_01 = self.var_41[1];
	var_02 = "exposed";
	var_03 = 0;
	var_04 = func_3F89();
	if(isdefined(var_04))
	{
		var_05 = func_29A9(var_04);
		if(isdefined(var_05))
		{
			var_02 = var_05;
			var_03 = 1;
			if(isdefined(self.var_4792))
			{
				var_02 = func_29A7(var_04,var_02);
			}

			if(!isdefined(level.var_3592[var_02]) && var_02 != "stand_unstable" && var_02 != "stand_unstable_run" && var_02 != "stand_saw" && var_02 != "crouch_saw")
			{
				var_06 = animscripts\utility::func_6C4(self.var_41[1] - animscripts\utility::func_4049(var_04));
				if(var_06 < 5)
				{
					if(!isdefined(self.var_4792))
					{
						var_00 = var_04.var_2E6;
					}

					var_01 = animscripts\utility::func_4049(var_04);
				}
			}
		}
	}

	if(!func_1D22(var_02,var_04))
	{
		return;
	}

	var_07 = isdefined(level.var_3592[var_02]);
	if(!var_03)
	{
		var_02 = func_29AA();
	}

	var_08 = (-1 * self.var_25C[0],-1 * self.var_25C[1],0);
	var_09 = func_4018(var_04);
	var_0A = var_09.var_5A2C;
	var_0B = var_09.var_33E6;
	var_0C = spawnstruct();
	func_19E5(var_0C,var_02,0,var_01,var_08,var_0A,var_0B);
	func_8891(var_0C,var_0A);
	var_0D = -1;
	var_0E = 3;
	if(var_07)
	{
		var_0E = 1;
	}

	for(var_0F = 1;var_0F <= var_0E;var_0F++)
	{
		var_0D = var_0C.var_9705[var_0F];
		if(func_1D12(var_00,var_01,var_02,var_07,var_0D))
		{
			break;
		}
	}

	if(var_0F > var_0E)
	{
		return;
	}

	var_10 = distancesquared(self.var_2E6,self.var_22A6) * 1.25 * 1.25;
	if(distancesquared(self.var_2E6,self.var_2FD) < var_10)
	{
		return;
	}

	func_2D03(var_02,var_0D);
}

//Function Number: 2
func_29A9(param_00)
{
	if(animscripts\utility::func_5029() && param_00.type == "Cover Crouch")
	{
		return "free_run_out_of_cover_crouch";
	}

	if(animscripts\cover_arrival::func_1AFC(param_00))
	{
		if(param_00.type == "Cover Stand")
		{
			return "stand_saw";
		}

		if(param_00.type == "Cover Crouch")
		{
			return "crouch_saw";
		}
		else if(param_00.type == "Cover Prone")
		{
			return "prone_saw";
		}
	}

	if(!isdefined(level.var_CB6[param_00.type]))
	{
		return;
	}

	if(isdefined(level.var_7408[param_00.type]) && level.var_7408[param_00.type] != self.var_7.var_6E57)
	{
		return;
	}

	var_01 = self.var_7.var_6E57;
	if(var_01 == "prone")
	{
		var_01 = "crouch";
	}

	var_02 = level.var_CB6[param_00.type][var_01];
	if(animscripts\cover_arrival::func_9C09() && var_02 == "exposed")
	{
		var_02 = "exposed_ready";
	}

	if(animscripts\utility::func_51DB())
	{
		if(var_02 == "exposed")
		{
			var_02 = "exposed_unstable";
			if(self.movemode == "run")
			{
				var_02 = var_02 + "_run";
			}

			return var_02;
		}
		else if(var_02 == "stand")
		{
			var_02 = "stand_unstable";
			if(self.movemode == "run")
			{
				var_02 = var_02 + "_run";
			}

			return var_02;
		}
	}

	if(animscripts\utility::func_8485())
	{
		var_03 = var_02 + "_cqb";
		if(isdefined(level.var_CCA["soldier"]["cover_exit"][var_03]))
		{
			var_02 = var_03;
		}
	}

	return var_02;
}

//Function Number: 3
func_1D23()
{
	if(!isdefined(self.var_2FD))
	{
		return 0;
	}

	if(!self method_8191())
	{
		return 0;
	}

	if(self.var_7.var_6E57 == "prone")
	{
		return 0;
	}

	if(isdefined(self.var_2B0D) && self.var_2B0D)
	{
		return 0;
	}

	if(self.var_3F2 != "none")
	{
		return 0;
	}

	if(!self method_81CB("stand") && !isdefined(self.var_4792))
	{
		return 0;
	}

	if(distancesquared(self.var_2E6,self.var_2FD) < 10000)
	{
		return 0;
	}

	return 1;
}

//Function Number: 4
func_1D22(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(param_00 == "exposed" || isdefined(self.var_4792))
	{
		if(self.var_7.var_6E57 != "stand" && self.var_7.var_6E57 != "crouch")
		{
			return 0;
		}

		if(self.var_7.var_5F58 != "stop")
		{
			return 0;
		}
	}

	if(!isdefined(self.var_4792) && isdefined(self.enemy) && vectordot(self.var_25C,self.enemy.var_2E6 - self.var_2E6) < 0)
	{
		if(animscripts\utility::func_1AE2() && distancesquared(self.var_2E6,self.enemy.var_2E6) < 90000)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 5
func_29AA(param_00)
{
	if(self.var_7.var_6E57 == "stand")
	{
		param_00 = "exposed";
	}
	else
	{
		param_00 = "exposed_crouch";
	}

	if(animscripts\cover_arrival::func_9C09())
	{
		param_00 = "exposed_ready";
	}

	if(param_00 == "exposed" && animscripts\utility::func_51DB())
	{
		param_00 = "exposed_unstable";
		if(self.movemode == "run")
		{
			param_00 = param_00 + "_run";
		}

		return param_00;
	}

	if(animscripts\utility::func_8485())
	{
		param_00 = param_00 + "_cqb";
	}
	else if(isdefined(self.var_4792))
	{
		param_00 = "heat";
	}

	return param_00;
}

//Function Number: 6
func_4018(param_00)
{
	var_01 = spawnstruct();
	if(isdefined(param_00) && isdefined(level.var_5A2C[param_00.type]))
	{
		var_01.var_5A2C = level.var_5A2C[param_00.type];
		var_01.var_33E6 = level.var_33E6[param_00.type];
	}
	else
	{
		var_01.var_5A2C = 9;
		var_01.var_33E6 = -1;
	}

	return var_01;
}

//Function Number: 7
func_19E5(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	param_00.var_9712 = [];
	param_00.var_9705 = [];
	var_07 = undefined;
	var_08 = 1;
	var_09 = 0;
	if(param_02)
	{
		var_07 = animscripts\utility::func_5860("cover_trans_angles",param_01);
		var_08 = -1;
		var_09 = 0;
	}
	else
	{
		var_07 = animscripts\utility::func_5860("cover_exit_angles",param_01);
		var_08 = 1;
		var_09 = 180;
	}

	for(var_0A = 1;var_0A <= param_05;var_0A++)
	{
		param_00.var_9705[var_0A] = var_0A;
		if(var_0A == 5 || var_0A == param_06 || !isdefined(var_07[var_0A]))
		{
			param_00.var_9712[var_0A] = -1.0003;
			continue;
		}

		var_0B = (0,param_03 + var_08 * var_07[var_0A] + var_09,0);
		var_0C = vectornormalize(anglestoforward(var_0B));
		param_00.var_9712[var_0A] = vectordot(param_04,var_0C);
	}
}

//Function Number: 8
func_8891(param_00,param_01)
{
	for(var_02 = 2;var_02 <= param_01;var_02++)
	{
		var_03 = param_00.var_9712[param_00.var_9705[var_02]];
		var_04 = param_00.var_9705[var_02];
		for(var_05 = var_02 - 1;var_05 >= 1;var_05--)
		{
			if(var_03 < param_00.var_9712[param_00.var_9705[var_05]])
			{
				break;
			}

			param_00.var_9705[var_05 + 1] = param_00.var_9705[var_05];
		}

		param_00.var_9705[var_05 + 1] = var_04;
	}
}

//Function Number: 9
func_1D12(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = (0,param_01,0);
	var_06 = anglestoforward(var_05);
	var_07 = anglestoright(var_05);
	var_08 = animscripts\utility::func_5865("cover_exit_dist",param_02,param_04);
	var_09 = var_06 * var_08[0];
	var_0A = var_07 * var_08[1];
	var_0B = param_00 + var_09 - var_0A;
	self.var_22A6 = var_0B;
	if(!param_03 && !self method_81E6(var_0B))
	{
		return 0;
	}

	if(!self method_81C4(self.var_2E6,var_0B))
	{
		return 0;
	}

	if(param_04 <= 6 || param_03)
	{
		return 1;
	}

	var_0C = animscripts\utility::func_5865("cover_exit_postdist",param_02,param_04);
	var_09 = var_06 * var_0C[0];
	var_0A = var_07 * var_0C[1];
	var_0D = var_0B + var_09 - var_0A;
	self.var_22A6 = var_0D;
	return self method_81C4(var_0B,var_0D);
}

//Function Number: 10
func_2D03(param_00,param_01)
{
	var_02 = animscripts\utility::func_5865("cover_exit",param_00,param_01);
	var_03 = vectortoangles(self.var_25C);
	if(self.var_7.var_6E57 == "prone")
	{
		return;
	}

	var_04 = 0.2;
	if(self.var_425)
	{
		self method_818E("nogravity",0);
	}
	else
	{
		self method_818E("zonly_physics",0);
	}

	self method_818F("face angle",self.var_41[1]);
	self method_8110("coverexit",var_02,%body,1,var_04,self.var_5F94);
	animscripts\shared::func_2D05("coverexit");
	self.var_7.var_6E57 = "stand";
	self.var_7.var_5F58 = "run";
	self.var_4BB4 = undefined;
	self method_818F("face motion");
	self method_818E("none",0);
	func_3792("coverexit");
	self method_8142(%animscript_root,0.2);
	self method_818F("face default");
	self method_818E("normal",0);
}

//Function Number: 11
func_3792(param_00)
{
	self endon("move_loop_restart");
	animscripts\shared::func_2D05(param_00);
}

//Function Number: 12
func_29A7(param_00,param_01)
{
	if(param_00.type == "Cover Right")
	{
		param_01 = "heat_right";
	}
	else if(param_00.type == "Cover Left")
	{
		param_01 = "heat_left";
	}

	return param_01;
}

//Function Number: 13
func_3F89()
{
	var_00 = undefined;
	if(!isdefined(self.var_4792))
	{
		var_01 = 400;
	}
	else
	{
		var_01 = 4096;
	}

	if(animscripts\utility::func_51AD())
	{
		var_01 = 1024;
	}

	if(isdefined(self.node) && distancesquared(self.var_2E6,self.node.var_2E6) < var_01)
	{
		var_00 = self.node;
	}
	else if(isdefined(self.var_339) && distancesquared(self.var_2E6,self.var_339.var_2E6) < var_01)
	{
		var_00 = self.var_339;
	}

	if(isdefined(var_00) && isdefined(self.var_4792) && animscripts\utility::func_6C4(self.var_41[1] - var_00.var_41[1]) > 30)
	{
		return undefined;
	}

	return var_00;
}

//Function Number: 14
func_2563()
{
	var_00 = self.var_2563;
	if(!isdefined(self.var_67D5))
	{
		self.var_2563 = undefined;
	}

	var_01 = [[ var_00 ]]();
	if(!isdefined(self.var_67D5))
	{
		self.var_8D29 = undefined;
	}

	if(!isdefined(var_01))
	{
		var_01 = 0.2;
	}

	self method_8142(%animscript_root,var_01);
	self method_818F("face default");
	self method_818E("none",0);
}

//Function Number: 15
func_2679(param_00)
{
	if(!animscripts\cover_arrival::func_267A())
	{
	}
}