/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: civilian.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 129 ms
 * Timestamp: 4/20/2022 8:20:08 PM
*******************************************************************/

//Function Number: 1
func_00DA()
{
	self endon("killanimscript");
	self method_8142(%animscript_root,0.2);
	animscripts\utility::func_9B23();
	if(animscripts\utility::func_5121())
	{
		var_00 = "idle_combat";
	}
	else
	{
		var_00 = "idle_noncombat";
	}

	var_01 = undefined;
	if(isdefined(self.animname) && isdefined(level.var_78A9[self.animname]))
	{
		var_01 = level.var_78A9[self.animname][var_00];
	}

	if(!isdefined(var_01))
	{
		if(!isdefined(level.var_78A9["default_civilian"]))
		{
			return;
		}

		var_01 = level.var_78A9["default_civilian"][var_00];
	}

	thread func_5F02();
	for(;;)
	{
		self method_810F("idle",common_scripts\utility::random(var_01),%animscript_root,1,0.2,1);
		self waittillmatch("end","idle");
	}
}

//Function Number: 2
func_5F02()
{
	self endon("killanimscript");
	while(!isdefined(self.var_1C65))
	{
		wait(1);
	}
}

//Function Number: 3
func_0410()
{
	func_00DA();
}

//Function Number: 4
func_3D6E()
{
	return level.var_1E0F[randomint(level.var_1E0F.size)];
}