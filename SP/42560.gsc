/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42560.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A640::func_9993(param_00)
{
	return -2 - param_00;
}

//Function Number: 2
lib_A640::func_7E37(param_00,param_01)
{
	if(!lib_A641::func_509A(param_00))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		thread lib_A641::func_9D2B(param_00);
		if(isdefined(self.mgturret))
		{
			foreach(var_03 in self.mgturret)
			{
				self notify("mgturret_acquire_new_target");
				var_03.var_92A = param_00;
			}

			return;
		}

		return;
	}

	if(var_04 == -1)
	{
		thread lib_A641::func_9D2B(var_03);
		return;
	}

	if(var_04 <= -2)
	{
		thread lib_A641::func_9D2B(var_03);
		return;
	}

	if(isdefined(self.mgturret))
	{
		self notify("mgturret_acquire_new_target");
		self.mgturret[var_04].var_92A = var_03;
		return;
	}
}

//Function Number: 3
lib_A640::func_2AA3(param_00)
{
	lib_A640::func_7E1C(1,param_00);
}

//Function Number: 4
lib_A640::func_30C1(param_00)
{
	lib_A640::func_7E1C(0,param_00);
}

//Function Number: 5
lib_A640::func_7E1C(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		thread lib_A641::func_9D2A(param_00);
		if(isdefined(self.mgturret))
		{
			foreach(var_03 in self.mgturret)
			{
				var_03.var_2AA3 = param_00;
			}

			return;
		}

		return;
	}

	if(var_04 == -1)
	{
		thread lib_A641::func_9D2A(var_03);
		return;
	}

	if(var_04 <= -2)
	{
		thread lib_A641::func_9D2A(var_03);
		return;
	}

	if(isdefined(self.mgturret))
	{
		self.mgturret[var_04].var_2AA3 = var_03;
		return;
	}
}

//Function Number: 6
lib_A640::func_2AE2(param_00)
{
	lib_A640::func_7ECB(1,param_00);
}

//Function Number: 7
lib_A640::func_30FD(param_00)
{
	lib_A640::func_7ECB(0,param_00);
}

//Function Number: 8
lib_A640::func_7ECB(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		thread lib_A641::func_9D2D(param_00);
		if(isdefined(self.mgturret))
		{
			foreach(var_03 in self.mgturret)
			{
				var_03.var_2ADD = param_00;
				if(0 && param_00)
				{
					var_03.var_92A = undefined;
				}
			}

			return;
		}

		return;
	}

	if(var_04 == -1)
	{
		thread lib_A641::func_9D2D(var_03);
		return;
	}

	if(var_04 <= -2)
	{
		thread lib_A641::func_9D2D(var_03);
		return;
	}

	if(isdefined(self.mgturret))
	{
		self.mgturret[var_04].var_2ADD = var_03;
		if(0 && var_03)
		{
			self.mgturret[var_04].var_92A = undefined;
			return;
		}

		return;
	}
}

//Function Number: 9
lib_A640::func_7ED0(param_00,param_01)
{
	if(!isdefined(self.var_9316))
	{
		self.var_9316 = [];
	}

	var_02 = lib_A640::func_3EA6(param_01);
	var_03 = var_02[0];
	var_04 = var_02[1];
	for(var_05 = var_03;var_05 <= var_04;var_05++)
	{
		if(var_05 <= -2)
		{
			self.var_9316[var_05] = param_00;
			if(param_00)
			{
				self notify("stop_missle_handle_thread_grenade");
				thread lib_A63F::func_5C96();
			}
			else
			{
				self notify("stop_missle_handle_thread_grenade");
			}

			continue;
		}

		thread lib_A641::func_9D2E(param_00);
		self.var_9316[var_05] = param_00;
	}
}

//Function Number: 10
lib_A640::func_3EA6(param_00)
{
	var_01 = param_00;
	var_02 = param_00;
	if(!isdefined(param_00))
	{
		var_01 = -3;
		var_02 = 3;
	}

	return [var_01,var_02];
}