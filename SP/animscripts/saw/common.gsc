/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: common.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 615 ms
 * Timestamp: 4/20/2022 8:19:23 PM
*******************************************************************/

//Function Number: 1
main(param_00)
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4("saw");
	if(!isdefined(param_00))
	{
		return;
	}

	self.var_7.var_8A14 = "saw";
	if(isdefined(param_00.script_delay_min))
	{
		var_01 = param_00.script_delay_min;
	}
	else
	{
		var_01 = lib_A54E::func_192C("delay");
	}

	if(isdefined(param_00.script_delay_max))
	{
		var_02 = param_00.script_delay_max - var_01;
	}
	else
	{
		var_02 = lib_A54E::func_192C("delay_range");
	}

	if(isdefined(param_00.var_7964))
	{
		var_03 = param_00.var_7964;
	}
	else
	{
		var_03 = lib_A54E::func_192C("burst");
	}

	if(isdefined(param_00.var_7963))
	{
		var_04 = param_00.var_7963 - var_03;
	}
	else
	{
		var_04 = lib_A54E::func_192C("burst_range");
	}

	var_05 = gettime();
	var_06 = "start";
	animscripts\shared::func_6866(self.weapon,"none");
	param_00 show();
	if(isdefined(param_00.var_98B))
	{
		self.var_7.var_6E8A = ::func_6E8A;
		self.var_7.var_9C34 = param_00;
		param_00 notify("being_used");
		thread func_8F03();
	}
	else
	{
		self.var_7.var_6E8A = ::func_6F1A;
	}

	param_00.var_2C7D = 0;
	thread func_37CF(param_00);
	self method_8193(self.var_6F8B);
	self method_8145(self.var_6F8B,1,0.2,1);
	self method_8146(self.var_7F5);
	self method_8146(self.var_7F4);
	param_00 method_8146(param_00.var_7F5);
	param_00 method_8146(param_00.var_7F4);
	param_00 endon("death");
	for(;;)
	{
		if(param_00.var_2C7D)
		{
			thread func_2D78(param_00);
			func_A0F2(randomfloatrange(var_03,var_03 + var_04),param_00);
			param_00 notify("turretstatechange");
			if(param_00.var_2C7D)
			{
				thread func_2BE0(param_00);
				wait(randomfloatrange(var_01,var_01 + var_02));
			}

			continue;
		}

		thread func_2BE0(param_00);
		param_00 waittill("turretstatechange");
	}
}

//Function Number: 2
func_A0F2(param_00,param_01)
{
	param_01 endon("turretstatechange");
	wait(param_00);
}

//Function Number: 3
func_37CF(param_00)
{
	self endon("killanimscript");
	var_01 = cos(15);
	for(;;)
	{
		while(isdefined(self.enemy))
		{
			var_02 = self.enemy.var_2E6;
			var_03 = param_00 gettagangles("tag_aim");
			if(common_scripts\utility::within_fov(param_00.var_2E6,var_03,var_02,var_01) || distancesquared(param_00.var_2E6,var_02) < 40000)
			{
				if(!param_00.var_2C7D)
				{
					param_00.var_2C7D = 1;
					param_00 notify("turretstatechange");
				}
			}
			else if(param_00.var_2C7D)
			{
				param_00.var_2C7D = 0;
				param_00 notify("turretstatechange");
			}

			wait(0.05);
		}

		if(param_00.var_2C7D)
		{
			param_00.var_2C7D = 0;
			param_00 notify("turretstatechange");
		}

		wait(0.05);
	}
}

//Function Number: 4
func_99BB(param_00,param_01)
{
	if(param_00 <= 0)
	{
		return;
	}

	self endon("killanimscript");
	param_01 endon("turretstatechange");
	wait(param_00);
	param_01 notify("turretstatechange");
}

//Function Number: 5
func_8F03()
{
	self endon("killanimscript");
	for(;;)
	{
		if(!isdefined(self.node) || distancesquared(self.var_2E6,self.node.var_2E6) > 4096)
		{
			self method_818B();
		}

		wait(0.25);
	}
}

//Function Number: 6
func_6E8A(param_00)
{
	if(param_00 == "pain")
	{
		if(isdefined(self.node) && distancesquared(self.var_2E6,self.node.var_2E6) < 4096)
		{
			self.var_7.var_9C34 hide();
			animscripts\shared::func_6866(self.weapon,"right");
			self.var_7.var_6E8A = ::func_6E88;
			return;
		}
		else
		{
			self method_818B();
		}
	}

	if(param_00 == "saw")
	{
		var_01 = self method_8194();
		return;
	}

	self.var_7.var_9C34 delete();
	self.var_7.var_9C34 = undefined;
	animscripts\shared::func_6866(self.weapon,"right");
}

//Function Number: 7
func_6E88(param_00)
{
	if(!isdefined(self.node) || distancesquared(self.var_2E6,self.node.var_2E6) > 4096)
	{
		self method_818B();
		self.var_7.var_9C34 delete();
		self.var_7.var_9C34 = undefined;
		if(isdefined(self.weapon) && self.weapon != "none")
		{
			animscripts\shared::func_6866(self.weapon,"right");
			return;
		}

		return;
	}

	if(param_00 != "saw")
	{
		self.var_7.var_9C34 delete();
	}
}

//Function Number: 8
func_6F1A(param_00)
{
	animscripts\shared::func_6866(self.weapon,"right");
}

//Function Number: 9
func_2D78(param_00)
{
	self method_814B(%additive_saw_idle,0,0.1);
	self method_814B(%additive_saw_fire,1,0.1);
	param_00 func_99A8();
	func_99A7(param_00);
}

//Function Number: 10
func_2BE0(param_00)
{
	self method_814B(%additive_saw_idle,1,0.1);
	self method_814B(%additive_saw_fire,0,0.1);
	param_00 func_99A6();
}

//Function Number: 11
func_99A7(param_00)
{
	self endon("killanimscript");
	param_00 endon("turretstatechange");
	for(;;)
	{
		param_00 shootturret();
		wait(0.1);
	}
}

//Function Number: 12
func_99A8()
{
	self method_814B(%additive_saw_idle,0,0.1);
	self method_814B(%additive_saw_fire,1,0.1);
}

//Function Number: 13
func_99A6()
{
	self method_814B(%additive_saw_idle,1,0.1);
	self method_814B(%additive_saw_fire,0,0.1);
}