/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42827.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:24:11 PM
*******************************************************************/

//Function Number: 1
lib_A74B::opticsthermal_think()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	if(isagent(self))
	{
		return;
	}

	var_00 = 0.65;
	self.opticsthermalenabled = 0;
	self.orbitalthermalmode = 0;
	self.has_opticsthermal = 0;
	for(;;)
	{
		var_01 = !self.has_opticsthermal;
		var_01 = var_01 | self.has_opticsthermal && self playerads() < var_00;
		var_01 = var_01 | self isusingturret();
		var_01 = var_01 | self.orbitalthermalmode;
		if(var_01)
		{
			lib_A74B::opticsthermal_blur_off(self);
		}
		else
		{
			lib_A74B::opticsthermal_blur(self,0.05);
		}

		wait(0.05);
	}
}

//Function Number: 2
lib_A74B::opticsthermal_blur(param_00,param_01)
{
	if(param_00.opticsthermalenabled)
	{
		return;
	}

	param_00 method_84A9(3);
	param_00 method_84AB(70,0,40,80);
	param_00.opticsthermalenabled = 1;
}

//Function Number: 3
lib_A74B::opticsthermal_blur_off(param_00)
{
	if(!param_00.opticsthermalenabled)
	{
		return;
	}

	param_00 method_84AA();
	param_00.opticsthermalenabled = 0;
}