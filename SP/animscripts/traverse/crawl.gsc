/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: crawl.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 44 ms
 * Timestamp: 4/20/2022 8:19:34 PM
*******************************************************************/

//Function Number: 1
main()
{
	animscripts\setposemovement::func_7024();
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	self method_8110("crawlanim",%prone_crawl,%body,1,0.1,1);
	animscripts\shared::func_2D05("crawlanim");
	self.var_7.var_5F58 = "run";
	self.var_7.var_6E57 = "crouch";
}