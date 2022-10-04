/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: jump_across_72.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 45 ms
 * Timestamp: 4/20/2022 8:19:41 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CAA("wallhop",20);
		return;
	}

	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	self method_8110("jumpanim",%jump_across_72,%body,1,0.1,1);
	self waittillmatch("gravity on","jumpanim");
	self method_818D("gravity");
	animscripts\shared::func_2D05("jumpanim");
}