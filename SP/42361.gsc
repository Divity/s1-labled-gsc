/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42361.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 6
 * Decompile Time: 16 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A579::func_8D7C()
{
	lib_A579::func_3A64();
	var_00 = self.var_669.var_13A2.var_8E6["accuracy"]["hidden"];
	thread lib_A585::func_903(var_00,"accuracy_friendly");
	var_00 = self.var_669.var_13A2.var_8E6["accuracy"]["spotted"];
	thread lib_A585::func_904(var_00,"accuracy_friendly");
}

//Function Number: 2
lib_A579::func_3A3B()
{
	self.var_1300 = self.var_669.var_13A2.var_4274;
	self.var_A = self.var_669.var_13A2.var_4274;
}

//Function Number: 3
lib_A579::func_3A3C()
{
	self.var_1300 = self.var_669.var_13A2.var_6395;
	self.var_A = self.var_669.var_13A2.var_638F;
}

//Function Number: 4
lib_A579::func_3A64()
{
	self.var_669.var_13A2.var_4274 = 50;
	self.var_669.var_13A2.var_6395 = self.var_1300;
	self.var_669.var_13A2.var_638F = self.var_A;
	lib_A579::func_3A50();
	self.var_669.var_6DF3.var_6D2 = 1;
}

//Function Number: 5
lib_A579::func_3A4D(param_00)
{
	foreach(var_03, var_02 in param_00)
	{
		lib_A585::func_8D2("accuracy",var_03,var_02);
	}

	var_04 = self.var_669.var_13A2.var_8E6["accuracy"]["hidden"];
	thread lib_A585::func_903(var_04,"accuracy_friendly");
	var_04 = self.var_669.var_13A2.var_8E6["accuracy"]["spotted"];
	thread lib_A585::func_904(var_04,"accuracy_friendly");
}

//Function Number: 6
lib_A579::func_3A50()
{
	var_00 = [];
	var_00["hidden"] = ::lib_A579::func_3A3B;
	var_00["spotted"] = ::lib_A579::func_3A3C;
	lib_A579::func_3A4D(var_00);
}