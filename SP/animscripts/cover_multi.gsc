/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_multi.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 17
 * Decompile Time: 638 ms
 * Timestamp: 4/20/2022 8:20:21 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(!isdefined(self.var_DA))
	{
		self.var_DA = spawnstruct();
	}

	self.var_DA.state = "none";
	self.var_DA.var_55F7 = 0;
	self.var_DA.var_51C7 = 0;
	self.var_DA.var_487D = func_22AC();
	self.var_22BA = self.node;
	func_22B9();
	self waittill("killanimscript");
}

//Function Number: 2
end_script()
{
	func_22AF(self.var_DA.state);
	self.var_DA.var_3934 = undefined;
	self.var_DA.var_55F7 = undefined;
	self.var_DA.var_51C7 = undefined;
	animscripts\corner::func_3142();
	animscripts\cover_behavior::end_script("multi");
}

//Function Number: 3
func_22B9()
{
	if(!isdefined(self.var_22BA))
	{
		return;
	}

	var_00 = self.var_22BA method_8033();
	if(isdefined(self.var_DA.var_D25))
	{
		if(func_22B5(self.var_DA.var_D25,var_00))
		{
			var_01 = func_22B6(self.var_DA.var_D25);
			self.var_DA.var_D25 = undefined;
			return;
		}
	}

	if(!isdefined(self.enemy))
	{
		func_22B6(func_22B3(var_01));
		return;
	}

	var_02 = self.var_22BA.var_2E6;
	var_03 = self.enemy.var_2E6;
	var_04 = var_03 - var_02;
	var_05 = vectortoangles(var_04);
	var_06 = angleclamp180(var_05[1] - self.var_22BA.var_41[1]);
	var_07 = undefined;
	if(var_06 > 12)
	{
		var_08 = ["left","over","right"];
	}
	else if(var_07 < -12)
	{
		var_08 = ["right","over","left"];
	}
	else if(var_07 > 5)
	{
		var_08 = [["left","over"],"right"];
		var_07 = 15000;
	}
	else if(var_07 < -5)
	{
		var_08 = [["right","over"],"left"];
		var_07 = 15000;
	}
	else
	{
		var_08 = ["over",["right","left"]];
		var_07 = 15000;
	}

	var_09 = func_22B1(var_08,var_01);
	var_01 = func_22B6(var_09,var_07);
}

//Function Number: 4
func_22B5(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = self.node method_8033();
	}

	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		if(param_01[var_02] == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 5
func_22B1(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = self.node method_8033();
	}

	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = param_00[var_03];
		if(!isarray(var_04))
		{
			var_02[var_02.size] = var_04;
			continue;
		}

		var_04 = common_scripts\utility::array_randomize(var_04);
		for(var_05 = 0;var_05 < var_04.size;var_05++)
		{
			var_02[var_02.size] = var_04[var_05];
		}
	}

	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(func_22B5(var_02[var_03],param_01))
		{
			return var_02[var_03];
		}
	}
}

//Function Number: 6
func_22B3(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self.node method_8033();
	}

	var_01 = randomint(param_00.size);
	return param_00[var_01];
}

//Function Number: 7
func_22B2(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self method_8033();
	}

	if(param_00[0] == "over")
	{
		if(self doesnodeallowstance("stand"))
		{
			return "stand";
		}
		else
		{
			return "crouch";
		}
	}

	return param_00[0];
}

//Function Number: 8
func_22B6(param_00,param_01)
{
	if(param_00 == "over")
	{
		var_02 = self.node doesnodeallowstance("stand");
		var_03 = self.node doesnodeallowstance("crouch");
		if(var_02)
		{
			if(self.var_DA.state != "crouch" || !var_03)
			{
				func_22B7("stand",param_01);
			}

			return 1;
		}
		else if(var_03)
		{
			if(self.var_DA.state != "stand" || !var_02)
			{
				func_22B7("crouch",param_01);
			}

			return 1;
		}
		else
		{
		}
	}
	else
	{
		func_22B7(var_02,var_03);
		return 1;
	}

	return 0;
}

//Function Number: 9
func_22B7(param_00,param_01)
{
	if(self.var_DA.state == param_00)
	{
		return 0;
	}

	if(!isdefined(param_01) || param_01 < 0)
	{
		param_01 = 8000;
	}

	var_02 = gettime();
	if(self.var_DA.var_55F7 > 0 && var_02 - self.var_DA.var_55F7 < param_01)
	{
		return 0;
	}

	self.var_DA.var_55F7 = var_02;
	thread func_22B8(param_00);
	return 1;
}

//Function Number: 10
func_22B8(param_00)
{
	var_01 = func_22AC();
	func_22AD(self.var_DA.state,self.var_7.var_6E57,self.var_DA.var_487D,param_00,self.var_7.var_6E57,var_01);
	func_22AF(self.var_DA.state);
	self.var_DA.state = param_00;
	self.var_DA.var_487D = var_01;
	func_22AE(self.var_DA.state);
}

//Function Number: 11
func_22AE(param_00)
{
	if(param_00 == "left")
	{
		animscripts\cover_left::main();
		return;
	}

	if(param_00 == "right")
	{
		animscripts\cover_right::main();
		return;
	}

	if(param_00 == "stand")
	{
		animscripts\cover_stand::main();
		return;
	}

	if(param_00 == "crouch")
	{
		animscripts\cover_crouch::main();
		return;
	}
}

//Function Number: 12
func_22AF(param_00)
{
	switch(param_00)
	{
		case "left":
			break;

		case "right":
			break;

		case "stand":
			break;

		case "crouch":
			break;
	}
}

//Function Number: 13
func_22AD(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("killanimscript");
	if(param_00 == "none" || param_03 == "none")
	{
		return;
	}

	var_06 = func_22B0(param_00,param_01,param_02,param_03,param_04,param_05);
	if(!isdefined(var_06))
	{
		return;
	}

	self method_810F("cover_multi_trans",var_06,%body,1,0.2,1);
	animscripts\shared::func_2D05("cover_multi_trans");
}

//Function Number: 14
func_22AC()
{
	if(!isdefined(self.var_7.var_CD8) || !isdefined(self.var_7.var_CD8["alert_idle_back"]))
	{
		return "forward";
	}

	if(common_scripts\utility::cointoss())
	{
		return "forward";
	}

	return "back";
}

//Function Number: 15
func_22B4(param_00,param_01)
{
	if(param_01 == "left" || param_01 == "right")
	{
		return param_01;
	}

	if(param_00 doesnodeallowstance("stand"))
	{
		return "stand";
	}

	return "crouch";
}

//Function Number: 16
func_22B0(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(param_02 == "back")
	{
		var_06 = param_01 + "_back";
	}
	else if(param_01 == "stand" || param_01 == "crouch")
	{
		var_06 = param_01 + "_forward";
	}
	else
	{
		var_06 = param_01 + "_" + param_02;
	}

	var_06 = var_06 + "_to_";
	if(param_05 == "back")
	{
		var_06 = var_06 + param_04 + "_back";
	}
	else if(param_03 == "stand" || param_03 == "crouch")
	{
		var_06 = var_06 + param_03 + "_forward";
	}
	else
	{
		var_06 = var_06 + param_03 + "_" + param_04;
	}

	var_07 = self.var_C4D;
	if(!isdefined(var_07) || !isdefined(level.var_CCA[var_07]["cover_multi"]))
	{
		var_07 = "soldier";
	}

	return level.var_CCA[var_07]["cover_multi"][var_06];
}

//Function Number: 17
func_4C7B()
{
	var_00 = [];
	var_00["stand"] = [];
	var_00["stand"]["trans"] = [];
	var_00["stand"]["trans"]["left_stand"] = [];
	var_00["stand"]["trans"]["left_crouch"] = [];
	var_00["stand"]["trans"]["right_stand"] = [];
	var_00["stand"]["trans"]["right_crouch"] = [];
	var_00["stand"]["trans"]["front_stand"] = [];
	var_00["stand"]["trans"]["front_crouch"] = [];
	var_00["stand"]["trans"]["back_stand"] = [];
	var_00["stand"]["trans"]["back_crouch"] = [];
	var_00["left_stand_to_right_stand"] = undefined;
	var_00["left_stand_to_right_crouch"] = undefined;
	var_00["left_stand_to_stand_back"] = undefined;
	var_00["left_stand_to_stand_forward"] = undefined;
	var_00["left_stand_to_crouch_back"] = undefined;
	var_00["left_stand_to_crouch_forward"] = undefined;
	var_00["left_crouch_to_right_stand"] = undefined;
	var_00["left_crouch_to_right_crouch"] = undefined;
	var_00["left_crouch_to_stand_back"] = undefined;
	var_00["left_crouch_to_stand_forward"] = undefined;
	var_00["left_crouch_to_crouch_back"] = undefined;
	var_00["left_crouch_to_crouch_forward"] = undefined;
	var_00["crouch"] = [];
	level.var_CCA["soldier"]["cover_multi"] = var_00;
}