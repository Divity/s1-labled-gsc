/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42176.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:57 PM
*******************************************************************/

//Function Number: 1
lib_A4C0::main()
{
	self setmodel("atlas_pmc_smg_asi");
	codescripts\character::attachhead("alias_pmc_casual_heads_asi",lib_A689::main());
	self.voice = "atlas";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4C0::precache()
{
	precachemodel("atlas_pmc_smg_asi");
	codescripts\character::precachemodelarray(lib_A689::main());
}