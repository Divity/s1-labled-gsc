/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: window_down.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 174 ms
 * Timestamp: 4/20/2022 8:19:54 PM
*******************************************************************/

//Function Number: 1
main()
{
	var_00 = %windowclimb_fall;
	var_01 = %windowclimb_land;
	var_02 = 35;
	self.var_28B3 = "crouch";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("noclip");
	var_03 = self getnegotiationstartnode();
	self method_818F("face angle",var_03.var_41[1]);
	var_04 = var_03.var_9723 - var_03.var_2E6[2];
	self method_8110("traverse",var_00,%body,1,0.15,1);
	thread animscripts\notetracks::func_2D06("traverse","stop_traverse_notetracks");
	wait(1.5);
	var_05 = (0,var_03.var_41[1],0);
	var_06 = anglestoforward(var_05);
	var_06 = var_06 * 85;
	var_07 = bullettrace(var_03.var_2E6 + var_06,var_03.var_2E6 + var_06 + (0,0,-500),0,undefined);
	var_08 = var_07["position"][2];
	var_09 = var_03.var_2E6[2] - var_08;
	var_0A = 0;
	for(var_0B = 0;var_0B < level.var_A32F.size;var_0B++)
	{
		if(var_09 < level.var_A32F[var_0B])
		{
			continue;
		}

		var_0A = var_09 - level.var_A32F[var_0B];
	}

	thread animscripts\traverse\shared::func_9257(var_0A * -1);
	var_0C = self.var_2E6[2];
	var_0D = 0;
	level.var_9735 = [];
	for(;;)
	{
		var_0D = var_0C - self.var_2E6[2];
		if(self.var_2E6[2] - var_0D < var_08)
		{
			break;
		}

		var_0C = self.var_2E6[2];
		wait(0.05);
	}

	if(isdefined(self.var_1DA))
	{
		self playsoundasmaster("Land_" + self.var_1DA);
	}

	self notify("stop_traverse_notetracks");
	self method_8110("traverse",var_01,%body,1,0.15,1);
	self method_818D("gravity");
	animscripts\shared::func_2D05("traverse");
}

//Function Number: 2
func_6FAD(param_00)
{
	level notify("print_this_" + param_00);
	level endon("print_this_" + param_00);
	wait(0.05);
}

//Function Number: 3
func_8513(param_00,param_01)
{
	wait(0.05);
}

//Function Number: 4
func_6FAE(param_00,param_01)
{
	level notify("prrint_this_" + param_01);
	level endon("prrint_this_" + param_01);
	wait(0.05);
}