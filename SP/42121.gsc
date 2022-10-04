/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42121.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:56 PM
*******************************************************************/

//Function Number: 1
lib_A489::main()
{
	self setmodel("atlas_pmc_assault_gideon");
	self attach("head_hero_gideon_beanie","",1);
	self.headmodel = "head_hero_gideon_beanie";
	self.voice = "xslice";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A489::precache()
{
	precachemodel("atlas_pmc_assault_gideon");
	precachemodel("head_hero_gideon_beanie");
}