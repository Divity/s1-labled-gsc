/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42190.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:57 PM
*******************************************************************/

//Function Number: 1
lib_A4CE::main()
{
	self setmodel("body_sp_usmc_ryan");
	self attach("head_sp_usmc_ryan_ryan_body","",1);
	self.headmodel = "head_sp_usmc_ryan_ryan_body";
	self.voice = "american";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4CE::precache()
{
	precachemodel("body_sp_usmc_ryan");
	precachemodel("head_sp_usmc_ryan_ryan_body");
}