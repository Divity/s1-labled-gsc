/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: jump_across_100.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 43 ms
 * Timestamp: 4/20/2022 8:19:40 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CAA("window_40",20);
		return;
	}

	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	var_01 = [];
	var_01[0] = %jump_across_100_spring;
	var_01[1] = %jump_across_100_lunge;
	var_01[2] = %jump_across_100_stumble;
	var_02 = var_01[randomint(var_01.size)];
	self method_8110("jumpanim",var_02,%body,1,0.1,1);
	animscripts\shared::func_2D05("jumpanim");
}