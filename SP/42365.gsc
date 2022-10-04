/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42365.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A57D::func_8D91()
{
	lib_A57D::func_3A64();
	var_00 = self.var_669.var_13A2.var_8E6["state"]["hidden"];
	thread lib_A585::func_903(var_00,"friendly_behavior");
	var_00 = self.var_669.var_13A2.var_8E6["state"]["spotted"];
	thread lib_A585::func_904(var_00,"friendly_behavior");
}

//Function Number: 2
lib_A57D::func_3A88()
{
	thread lib_A59A::func_7DD9(0);
	self.var_669.var_13A2.var_63CB = self.var_1D3;
	self.var_1D3 = 0;
	self.var_39C5 = undefined;
	self.ignoreme = 1;
}

//Function Number: 3
lib_A57D::func_3A89()
{
	thread lib_A59A::func_7DD9(1);
	if(isdefined(self.var_669.var_13A2.var_63CB))
	{
		self.var_1D3 = self.var_669.var_13A2.var_63CB;
	}
	else
	{
		self.var_1D3 = 3;
	}

	self.ignoreme = 0;
	self method_81A3(0);
	lib_A59A::func_2A8C();
	thread lib_A57D::func_3A7E();
	self method_81CA("prone","crouch","stand");
	if(self.type != "dog" || !isdefined(self.var_4C02) || !self.var_4C02)
	{
		lib_A59A::func_C3D();
	}
}

//Function Number: 4
lib_A57D::func_3A7E(param_00)
{
	self endon("death");
	if(self.var_669.var_5833.stance != "prone")
	{
		return;
	}

	lib_A59A::func_32DD("_stealth_custom_anim");
	var_01 = "_stealth_prone_2_run_roll";
	if(isdefined(param_00))
	{
		self method_818F("face angle",param_00[1] + 20);
	}

	thread lib_A585::func_8D8D(self,"gravity",var_01);
	var_02 = function_0063(lib_A59A::func_3EF5(var_01));
	wait(var_02 - 0.2);
	self notify("stop_animmode");
	lib_A59A::func_32D9("_stealth_custom_anim");
}

//Function Number: 5
lib_A57D::func_3A64()
{
	lib_A59A::func_32DC("_stealth_custom_anim");
	lib_A59A::func_32DC("_stealth_override_goalpos");
	self.var_669.var_13A2 = spawnstruct();
	self.var_669.var_13A2.var_8E6 = [];
	lib_A57D::func_3A54();
	self.var_669.var_6DF3 = spawnstruct();
	thread lib_A585::func_923();
}

//Function Number: 6
lib_A57D::func_3A4F(param_00)
{
	foreach(var_03, var_02 in param_00)
	{
		lib_A585::func_8D2("state",var_03,var_02);
	}

	var_04 = self.var_669.var_13A2.var_8E6["state"]["hidden"];
	thread lib_A585::func_903(var_04,"friendly_behavior");
	var_04 = self.var_669.var_13A2.var_8E6["state"]["spotted"];
	thread lib_A585::func_904(var_04,"friendly_behavior");
}

//Function Number: 7
lib_A57D::func_3A54()
{
	var_00 = [];
	var_00["hidden"] = ::lib_A57D::func_3A88;
	var_00["spotted"] = ::lib_A57D::func_3A89;
	lib_A57D::func_3A4F(var_00);
}