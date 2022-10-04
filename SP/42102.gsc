/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42102.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:55 PM
*******************************************************************/

//Function Number: 1
lib_A476::main()
{
	self setmodel("nk_army_shotgun_body");
	self attach("nk_army_b_head","",1);
	self.headmodel = "nk_army_b_head";
	self.voice = "northkorea";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A476::precache()
{
	precachemodel("nk_army_shotgun_body");
	precachemodel("nk_army_b_head");
}