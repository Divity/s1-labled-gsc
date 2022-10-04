/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42175.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:56 PM
*******************************************************************/

//Function Number: 1
lib_A4BF::main()
{
	self setmodel("atlas_pmc_smg");
	codescripts\character::attachhead("alias_pmc_casual_heads",lib_A688::main());
	self.voice = "atlas";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4BF::precache()
{
	precachemodel("atlas_pmc_smg");
	codescripts\character::precachemodelarray(lib_A688::main());
}