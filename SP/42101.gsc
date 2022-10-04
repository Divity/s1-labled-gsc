/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42101.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:55 PM
*******************************************************************/

//Function Number: 1
lib_A475::main()
{
	self setmodel("nk_army_assault_body");
	self attach("nk_army_a_head","",1);
	self.headmodel = "nk_army_a_head";
	self.voice = "northkorea";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A475::precache()
{
	precachemodel("nk_army_assault_body");
	precachemodel("nk_army_a_head");
}