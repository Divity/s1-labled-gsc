/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: animmode.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 91 ms
 * Timestamp: 4/20/2022 8:19:55 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("death");
	self endon("stop_animmode");
	self notify("killanimscript");
	self.var_670 endon(self.var_551);
	if(isdefined(self.var_579))
	{
		self thread [[ self.var_579 ]]();
		self.var_579 = undefined;
	}

	var_00 = isdefined(self.var_578) && self.var_578;
	if(var_00)
	{
		self endon("stop_loop");
		self.var_578 = undefined;
	}
	else
	{
		thread func_6213(self.var_551);
	}

	var_01 = self.var_551;
	self.var_551 = undefined;
	var_02 = 0;
	if(var_00 || isarray(level.var_78A9[self.var_553][var_01]))
	{
		var_02 = level.var_78A9[self.var_553][var_01].size;
		var_03 = level.var_78A9[self.var_553][var_01][randomint(var_02)];
	}
	else
	{
		var_03 = level.var_78A9[self.var_553][var_02];
	}

	var_04 = getstartorigin(self.var_670.var_2E6,self.var_670.var_41,var_03);
	var_05 = getstartangles(self.var_670.var_2E6,self.var_670.var_41,var_03);
	var_06 = self method_813C(var_04);
	if(isdefined(var_06))
	{
		var_04 = var_06;
	}
	else
	{
	}

	if(!isdefined(self.var_6172))
	{
		self method_81C5(var_04,var_05);
	}

	self.var_34F = 0;
	var_07 = 0.3;
	var_08 = 0.2;
	if(isdefined(self.var_BAD))
	{
		var_07 = self.var_BAD;
		var_08 = self.var_BAD;
	}

	self method_818E(self.var_552);
	self method_8142(self.var_75DC,var_07);
	self method_818F("face angle",var_05[1]);
	var_09 = "custom_animmode";
	self method_8113(var_09,var_03,1,var_08,1);
	self.var_670 thread lib_A506::func_8C11(self,var_09,var_01,self.var_553,var_03);
	self.var_670 thread lib_A506::func_C7E(self,var_09,var_01);
	var_0A = self.var_670;
	self.var_670 = undefined;
	self.var_552 = undefined;
	self endon("killanimscript");
	var_0B = "end";
	if(!var_00)
	{
		if(animhasnotetrack(var_03,"finish"))
		{
			var_0B = "finish";
		}
		else if(animhasnotetrack(var_03,"stop anim"))
		{
			var_0B = "stop anim";
		}
	}

	for(;;)
	{
		self waittillmatch(var_0B,var_09);
		if(var_00)
		{
			var_03 = level.var_78A9[self.var_553][var_01][randomint(var_02)];
			self method_810E(var_09,var_03,1,0.2,1);
			if(isdefined(var_0A))
			{
				var_0A thread lib_A506::func_8C11(self,var_09,var_01,self.var_553,var_03);
				var_0A thread lib_A506::func_C7E(self,var_09,var_01);
			}

			continue;
		}

		break;
	}

	if(var_0B != "end")
	{
		self method_818F("face motion");
	}

	self notify("finished_custom_animmode" + var_01);
}

//Function Number: 2
func_6213(param_00)
{
	self endon("death");
	self endon("finished_custom_animmode" + param_00);
	self waittill("killanimscript");
	self notify("finished_custom_animmode" + param_00);
}