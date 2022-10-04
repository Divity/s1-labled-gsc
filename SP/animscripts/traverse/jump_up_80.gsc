/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: jump_up_80.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 46 ms
 * Timestamp: 4/20/2022 8:19:41 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	var_01 = var_00.var_9723 - var_00.var_2E6[2];
	thread animscripts\traverse\shared::func_9257(var_01 - 80);
	self method_8142(%animscript_root,0.2);
	self method_8113("jump_up_80",level.dogtraverseanims["jump_up_80"],1,0.2,1);
	animscripts\shared::func_2D05("jump_up_80");
}