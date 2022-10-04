/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: window_2.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 87 ms
 * Timestamp: 4/20/2022 8:19:54 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CBC("wallhop",40);
		return;
	}

	func_0881(%windowclimb,35);
}

//Function Number: 2
func_0881(param_00,param_01)
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
	wait(0.7);
	thread animscripts\traverse\shared::func_9257(var_03 - param_01);
	wait(0.9);
	self method_818D("gravity");
	animscripts\shared::func_2D05("traverse");
}