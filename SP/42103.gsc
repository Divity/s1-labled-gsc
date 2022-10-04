/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42103.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:55 PM
*******************************************************************/

//Function Number: 1
lib_A477::main()
{
	self setmodel("nk_army_smg_body");
	self attach("nk_army_c_head","",1);
	self.headmodel = "nk_army_c_head";
	self.voice = "northkorea";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A477::precache()
{
	precachemodel("nk_army_smg_body");
	precachemodel("nk_army_c_head");
}