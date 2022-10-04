/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: flashed.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 196 ms
 * Timestamp: 4/20/2022 8:20:29 PM
*******************************************************************/

//Function Number: 1
func_4C88()
{
	var_00 = [];
	var_00["flashed"] = [%exposed_flashbang_v2,%exposed_flashbang_v4];
	var_00["flashed"] = common_scripts\utility::array_randomize(var_00["flashed"]);
	level.var_CCA["soldier"]["flashed"] = var_00;
	level.var_38A2["soldier"] = 0;
}

//Function Number: 2
func_4038()
{
	var_00 = "soldier";
	if(isdefined(self.var_C4D) && isdefined(level.var_38A2[self.var_C4D]))
	{
		var_00 = self.var_C4D;
	}

	level.var_38A2[var_00]++;
	if(level.var_38A2[var_00] >= level.var_CCA[var_00]["flashed"]["flashed"].size)
	{
		level.var_38A2[var_00] = 0;
		level.var_CCA[var_00]["flashed"]["flashed"] = common_scripts\utility::array_randomize(level.var_CCA[var_00]["flashed"]["flashed"]);
	}

	return level.var_CCA[var_00]["flashed"]["flashed"][level.var_38A2[var_00]];
}

//Function Number: 3
func_38A3(param_00)
{
	self endon("killanimscript");
	self method_810F("flashed_anim",param_00,%body,0.2,randomfloatrange(0.9,1.1));
	animscripts\shared::func_2D05("flashed_anim");
}

//Function Number: 4
main()
{
	self endon("death");
	self endon("killanimscript");
	animscripts\utility::func_4DD4("flashed");
	var_00 = lib_A59A::func_38A5();
	if(var_00 <= 0)
	{
		return;
	}

	animscripts\face::func_7821("flashbang");
	if(isdefined(self.var_8A27))
	{
		self [[ self.var_8A27 ]]();
		return;
	}

	var_01 = func_4038();
	func_38A4(var_01,var_00);
}

//Function Number: 5
func_38A4(param_00,param_01)
{
	self endon("death");
	self endon("killanimscript");
	if(self.var_7.var_6E57 == "prone")
	{
		animscripts\utility::func_3449(1);
	}

	self.var_7.var_6E57 = "stand";
	self.var_31 = 1;
	thread func_38A3(param_00);
	wait(param_01);
	self notify("stop_flashbang_effect");
	self.var_38AD = 0;
}