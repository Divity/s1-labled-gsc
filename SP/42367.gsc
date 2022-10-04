/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42367.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 6
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A57F::func_8D96()
{
	lib_A57F::func_3A64();
	var_00 = self.var_669.var_13A2.var_8E6["color"]["hidden"];
	thread lib_A585::func_903(var_00,"color_friendly");
	var_00 = self.var_669.var_13A2.var_8E6["color"]["spotted"];
	thread lib_A585::func_904(var_00,"color_friendly");
}

//Function Number: 2
lib_A57F::func_3A48()
{
	lib_A59A::func_2A73();
	self.var_180 = 0;
}

//Function Number: 3
lib_A57F::func_3A49()
{
	lib_A59A::func_3099();
}

//Function Number: 4
lib_A57F::func_3A64()
{
	lib_A57F::func_3A51();
	self.var_669.var_6DF3.var_2041 = 1;
}

//Function Number: 5
lib_A57F::func_3A4E(param_00)
{
	foreach(var_03, var_02 in param_00)
	{
		lib_A585::func_8D2("color",var_03,var_02);
	}

	var_04 = self.var_669.var_13A2.var_8E6["color"]["hidden"];
	thread lib_A585::func_903(var_04,"color_friendly");
	var_04 = self.var_669.var_13A2.var_8E6["color"]["spotted"];
	thread lib_A585::func_904(var_04,"color_friendly");
}

//Function Number: 6
lib_A57F::func_3A51()
{
	var_00 = [];
	var_00["hidden"] = ::lib_A57F::func_3A48;
	var_00["spotted"] = ::lib_A57F::func_3A49;
	lib_A57F::func_3A4E(var_00);
}