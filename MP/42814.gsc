/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42814.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:18:20 PM
*******************************************************************/

//Function Number: 1
lib_A73E::script_print_fx()
{
	if(!isdefined(self.script_fxid) || !isdefined(self.script_fxcommand) || !isdefined(self.script_delay))
	{
		self delete();
		return;
	}

	if(isdefined(self.target))
	{
		var_00 = getent(self.target).var_2E6;
	}
	else
	{
		var_00 = "undefined";
	}

	if(self.script_fxcommand == "OneShotfx")
	{
	}

	if(self.script_fxcommand == "loopfx")
	{
	}

	if(self.script_fxcommand == "loopsound")
	{
	}
}

//Function Number: 2
lib_A73E::grenadeexplosionfx(param_00)
{
	playfx(level._effect["mechanical explosion"],param_00);
	earthquake(0.15,0.5,param_00,250);
}

//Function Number: 3
lib_A73E::soundfx(param_00,param_01,param_02)
{
	var_03 = spawn("script_origin",(0,0,0));
	var_03.var_2E6 = param_01;
	var_03 playloopsound(param_00);
	if(isdefined(param_02))
	{
		var_03 thread lib_A73E::soundfxdelete(param_02);
	}
}

//Function Number: 4
lib_A73E::soundfxdelete(param_00)
{
	level waittill(param_00);
	self delete();
}

//Function Number: 5
lib_A73E::blenddelete(param_00)
{
	self waittill("death");
	param_00 delete();
}