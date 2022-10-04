/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_jump_landassist.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 209 ms
 * Timestamp: 4/20/2022 8:19:47 PM
*******************************************************************/

//Function Number: 1
main()
{
	var_00 = [];
	var_01 = undefined;
	var_02 = undefined;
	var_03 = randomfloat(100);
	var_04 = undefined;
	if(var_03 < 33)
	{
		var_04 = "a";
	}
	else if(var_03 < 66)
	{
		var_04 = "b";
	}
	else if(var_03 < 100)
	{
		var_04 = "c";
	}

	if(var_04 == "a")
	{
		var_00["traverseAnim"] = %seo_jumpdown_assist_start_jump_a;
		var_01 = %seo_jumpdown_assist_falling_idle_a;
	}
	else if(var_04 == "b")
	{
		var_00["traverseAnim"] = %seo_jumpdown_assist_start_jump_b;
		var_01 = %seo_jumpdown_assist_falling_idle_b;
	}
	else if(var_04 == "c")
	{
		var_00["traverseAnim"] = %seo_jumpdown_assist_start_jump_c;
		var_01 = %seo_jumpdown_assist_falling_idle_c;
	}

	var_00["traverseNotetrackFunc"] = ::animscripts\traverse\boost::func_4685;
	var_05 = func_3E37(self.node);
	var_06 = undefined;
	if(var_05 == 1)
	{
		var_06 = %seo_jumpdown_assist_landing_1;
	}
	else if(var_05 == 2)
	{
		var_06 = %seo_jumpdown_assist_landing_2;
	}
	else if(var_05 == 3)
	{
		var_06 = %seo_jumpdown_assist_landing_3;
	}
	else if(var_05 == 4)
	{
		var_06 = %seo_jumpdown_assist_landing_4;
	}
	else if(var_05 == 6)
	{
		var_06 = %seo_jumpdown_assist_landing_6;
	}
	else if(var_05 == 7)
	{
		var_06 = %seo_jumpdown_assist_landing_7;
	}
	else if(var_05 == 8)
	{
		var_06 = %seo_jumpdown_assist_landing_8;
	}
	else if(var_05 == 9)
	{
		var_06 = %seo_jumpdown_assist_landing_9;
	}

	var_07 = 0;
	if(isdefined(var_06))
	{
		var_07 = getmovedelta(var_06,0,1)[2];
	}

	animscripts\traverse\shared::func_2D85(var_00);
	var_08 = self.var_2E6 + (0,0,32);
	if(isdefined(self getnegotiationendnode()))
	{
		var_02 = (var_08[0],var_08[1],self getnegotiationendnode().var_2E6[2]);
	}
	else
	{
		var_02 = physicstrace(var_08,self.var_2E6 + (0,0,-5120));
	}

	var_09 = distance(var_08,var_02);
	var_0A = var_09 - 32 - 0.5 + var_07;
	func_6974(var_01,var_0A,var_07);
	self method_8110("traverse_align",var_06,%body,1,0.2,1);
	animscripts\shared::func_2D05("traverse_align",::animscripts\traverse\boost::func_4685);
}

//Function Number: 2
func_6974(param_00,param_01,param_02)
{
	var_03 = self.var_2E6[2];
	var_04 = animscripts\utility::func_3E9C(0,param_01,self.var_4FF[2],getdvarfloat("g_gravity"));
	self method_8110("idle",param_00,%body,1,0.1,1);
	self method_818E("gravity_noclip");
	var_05 = -1;
	var_06 = 0;
	while(var_05 <= param_01)
	{
		var_05 = var_03 - self.var_2E6[2];
		var_06 = var_06 + 0.05;
		var_07 = animscripts\utility::func_3E9E(0,self.var_4FF[2],-1 * getdvarfloat("g_gravity"),0.05);
		if(var_07 < var_05 - param_01)
		{
			self method_818E("gravity");
		}

		if(var_06 > var_04 + 1)
		{
			self method_81C6(self getnegotiationendnode().var_2E6 + (0,0,param_02));
			break;
		}

		wait(0.05);
	}

	self method_8142(param_00,0.2);
}

//Function Number: 3
func_3E37(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	if(!isdefined(param_01))
	{
		var_02 = self getnegotiationendnode().var_2E6;
		var_03 = self getnegotiationnextnode();
	}
	else
	{
		var_02 = param_01;
		var_04 = getnodesonpath(var_02,param_00.var_2E6,1,undefined,param_00);
		var_03 = undefined;
		foreach(var_03 in var_04)
		{
			if(var_03.type != "End" && (isdefined(var_03.radius) && distance2d(param_01,var_03.var_2E6) > var_03.radius) || !isdefined(var_03.radius) && distance2d(param_01,var_03.var_2E6) > self.var_1C7)
			{
				break;
			}
		}
	}

	if(!isdefined(var_03) || !isdefined(var_03))
	{
		return 5;
	}

	var_07 = self.var_41[1];
	var_08 = "exposed";
	var_09 = var_02 - var_03.var_2E6;
	var_09 = (var_09[0],var_09[1],0);
	var_0A = 9;
	var_0B = -1;
	var_0C = spawnstruct();
	animscripts\exit_node::func_19E5(var_0C,var_08,1,var_07,var_09,var_0A,var_0B);
	animscripts\exit_node::func_8891(var_0C,var_0A);
	return var_0C.var_9705[1];
}

//Function Number: 4
func_3765(param_00)
{
	var_01 = getnodesonpath(self.var_2E6,param_00.var_2E6);
	var_02 = undefined;
	var_03 = undefined;
	foreach(var_05 in var_01)
	{
		if(!isdefined(var_02))
		{
			if(isdefined(var_05.animscript) && var_05.animscript == "seoul_jump_landassist")
			{
				var_02 = var_05;
			}

			continue;
		}

		var_03 = var_05;
		break;
	}

	return [var_02,var_03];
}