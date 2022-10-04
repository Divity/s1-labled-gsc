/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: civilian_init.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 389 ms
 * Timestamp: 4/20/2022 8:19:19 PM
*******************************************************************/

//Function Number: 1
main()
{
	animscripts\init::main();
	func_1DCF();
}

//Function Number: 2
func_1DCF()
{
	self.var_31 = 1;
	self.var_2AF2 = 1;
	self.var_2B0D = 1;
	self.var_6091 = 1;
	self.var_B0D = 1;
	self method_818F("face default");
	self.var_C8 = "no_cover";
	self method_81A3(0);
	self.var_7.var_71CD = 1;
	if(!isdefined(level.var_4DDB))
	{
		level.var_4DDB = 1;
		level.var_78A9["default_civilian"]["run_combat"][0] = %civilian_run_upright;
		level.var_78A9["default_civilian"]["run_hunched_combat"][0] = %civilian_run_hunched_a;
		level.var_78A9["default_civilian"]["run_hunched_combat"][1] = %civilian_run_hunched_c;
		level.var_78A9["default_civilian"]["run_hunched_combat"][2] = %civilian_run_hunched_flinch;
		level.var_78A9["default_civilian"]["run_noncombat"][0] = %civilian_walk_cool;
		var_00 = [];
		var_00[0] = 3;
		var_00[1] = 3;
		var_00[2] = 1;
		level.var_78A9["default_civilian"]["run_hunched_weights"] = common_scripts\utility::get_cumulative_weights(var_00);
		var_00 = [];
		var_00[0] = 1;
		level.var_78A9["default_civilian"]["run_weights"] = common_scripts\utility::get_cumulative_weights(var_00);
		level.var_78A9["default_civilian"]["idle_noncombat"][0] = %unarmed_cowerstand_idle;
		level.var_78A9["default_civilian"]["idle_combat"][0] = %casual_crouch_v2_idle;
		level.var_78A9["default_civilian"]["idle_combat"][1] = %unarmed_cowercrouch_idle_duck;
		level.var_1E0F[0] = %unarmed_cowerstand_react;
		level.var_1E0F[1] = %unarmed_cowercrouch_react_a;
		level.var_1E0F[2] = %unarmed_cowercrouch_react_b;
	}

	var_01 = undefined;
	if(isdefined(self.var_1DFD))
	{
		self.animname = self.var_1DFD;
		func_0E09(self.var_1DFD);
		self.var_26 = "noncombat";
		func_8D2B();
	}
	else
	{
		self.animname = "default_civilian";
		self.var_26 = "alert";
		func_8CFE();
	}

	thread func_1CF8();
	self.var_136 = 0;
	animscripts\shared::func_2F6A();
	self.var_780D = 0;
}

//Function Number: 3
func_0E09(param_00)
{
	if(isdefined(self.var_4718))
	{
		return;
	}

	func_4D94();
	var_01 = level.var_1E13[param_00];
	if(isdefined(var_01))
	{
		self.var_DF7 = var_01;
		self.var_DF8 = "tag_inhand";
		self attach(self.var_DF7,self.var_DF8,1);
		self.var_4718 = 1;
	}
}

//Function Number: 4
func_2982()
{
	if(isdefined(self.var_4718))
	{
		self detach(self.var_DF7,self.var_DF8);
		var_00 = spawn("script_model",self gettagorigin(self.var_DF8));
		var_00.var_41 = self gettagangles(self.var_DF8);
		var_00 setmodel(self.var_DF7);
		var_00 physicslaunchclient();
		var_00 thread func_A010();
		self.var_4718 = undefined;
		self.var_DF7 = undefined;
		self.var_DF8 = undefined;
	}
}

//Function Number: 5
func_A010()
{
	wait(10);
	self delete();
}

//Function Number: 6
func_4D94()
{
	if(isdefined(level.var_1E13))
	{
		return;
	}

	anim.var_1E13 = [];
	level.var_1E13["civilian_briefcase_walk"] = "com_metal_briefcase";
	level.var_1E13["civilian_crazy_walk"] = "electronics_pda";
	level.var_1E13["civilian_cellphone_walk"] = "com_cellphone_on";
	level.var_1E13["sit_lunch_A"] = "com_cellphone_on";
	level.var_1E13["civilian_soda_walk"] = "ma_cup_single_closed";
	level.var_1E13["civilian_paper_walk"] = "paper_memo";
	level.var_1E13["civilian_coffee_walk"] = "cs_coffeemug02";
	level.var_1E13["civilian_pda_walk"] = "electronics_pda";
	level.var_1E13["reading1"] = "open_book";
	level.var_1E13["reading2"] = "open_book";
	level.var_1E13["texting_stand"] = "electronics_pda";
	level.var_1E13["texting_sit"] = "electronics_pda";
	level.var_1E13["smoking1"] = "prop_cigarette";
	level.var_1E13["smoking2"] = "prop_cigarette";
}

//Function Number: 7
func_8D2B()
{
	self.var_4CB = 0.2;
	if(isdefined(self.var_1DFD))
	{
		var_00 = %civilian_briefcase_walk_dodge_l;
		var_01 = %civilian_briefcase_walk_dodge_r;
		if(isdefined(level.var_78A9[self.animname]["dodge_left"]))
		{
			var_00 = level.var_78A9[self.animname]["dodge_left"];
		}

		if(isdefined(level.var_78A9[self.animname]["dodge_right"]))
		{
			var_01 = level.var_78A9[self.animname]["dodge_right"];
		}

		animscripts\move::func_7F4D(var_00,var_01);
	}

	if(isdefined(level.var_78A9[self.animname]["turn_left_90"]))
	{
		self.var_66F2 = ::animscripts\civilian\civilian_move::func_1DDA;
		self.var_66F1 = 0.1;
		lib_A59A::func_3101();
	}
	else
	{
		lib_A59A::func_2AE9();
	}

	self.var_76AC = level.var_78A9[self.animname]["run_noncombat"];
	self.var_A0FF = self.var_76AC;
	self.var_76AE = undefined;
	if(self.animname == "default_civilian")
	{
		self.var_76AB = level.var_78A9[self.animname]["run_weights_noncombat"];
		self.var_A0FE = self.var_76AB;
	}
}

//Function Number: 8
func_8CFE()
{
	self notify("combat");
	animscripts\move::func_1EE8();
	self.var_66F1 = undefined;
	lib_A59A::func_3101();
	self.var_4CB = 0.3;
	var_00 = randomint(3) < 1;
	if(isdefined(self.var_398D))
	{
		var_00 = 1;
	}
	else if(isdefined(self.var_398C))
	{
		var_00 = 0;
	}

	if(var_00)
	{
		self.var_66F2 = ::animscripts\civilian\civilian_move::func_1DA5;
		self.var_76AC = level.var_78A9["default_civilian"]["run_combat"];
		self.var_76AB = level.var_78A9["default_civilian"]["run_weights"];
	}
	else
	{
		self.var_66F2 = ::animscripts\civilian\civilian_move::func_1DA4;
		self.var_76AC = level.var_78A9["default_civilian"]["run_hunched_combat"];
		self.var_76AB = level.var_78A9["default_civilian"]["run_hunched_weights"];
	}

	self.var_76AE = [];
	self.var_76AE[0] = %run_react_stumble;
	self.var_A0FF = self.var_76AC;
	self.var_A0FE = self.var_76AB;
}

//Function Number: 9
func_1CF8()
{
	self endon("death");
	self endon("disable_combat_state_check");
	var_00 = self.var_27 > 1;
	for(;;)
	{
		var_01 = self.var_27 > 1;
		if(var_00 && !var_01)
		{
			func_8D2B();
		}
		else if(!var_00 && var_01)
		{
			func_8CFE();
		}

		var_00 = var_01;
		wait(0.05);
	}
}