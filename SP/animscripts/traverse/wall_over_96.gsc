/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: wall_over_96.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 136 ms
 * Timestamp: 4/20/2022 8:19:53 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_9731 = 1;
	func_0880(%traverse90,96);
}

//Function Number: 2
func_0880(param_00,param_01)
{
	self.var_28B3 = "crouch";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_02 = self getnegotiationstartnode();
	self method_818F("face angle",var_02.var_41[1]);
	var_03 = var_02.var_9723 - var_02.var_2E6[2];
	self method_8110("traverse",param_00,%body,1,0.15,1);
	var_04 = gettime();
	thread animscripts\notetracks::func_2D06("traverse","no clear",::func_4541);
	if(!animhasnotetrack(param_00,"gravity on"))
	{
		var_04 = 1.23;
		var_05 = 0.2;
		wait(5);
		self method_818D("gravity");
		wait(var_05);
		return;
	}

	self waittillmatch("gravity on","traverse");
	self method_818D("gravity");
	if(!animhasnotetrack(param_00,"blend"))
	{
		wait(0.2);
		return;
	}

	self waittillmatch("blend","traverse");
}

//Function Number: 3
func_4541(param_00)
{
	if(param_00 != "traverse_death")
	{
		return;
	}

	self endon("killanimscript");
	if(self.health == 1)
	{
		self.var_7.var_612B = 1;
		if(self.var_9731 > 1)
		{
			self method_810F("deathanim",%traverse90_end_death,%body,1,0.2,1);
		}
		else
		{
			self method_810F("deathanim",%traverse90_start_death,%body,1,0.2,1);
		}

		animscripts\face::func_7821("death");
	}

	self.var_9731++;
}