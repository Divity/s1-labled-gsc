/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42108.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:55 PM
*******************************************************************/

//Function Number: 1
lib_A47C::main()
{
	self setmodel("atlas_pmc_body");
	codescripts\character::attachhead("alias_pmc_helmet_heads",lib_A68A::main());
	self.voice = "xslice";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A47C::precache()
{
	precachemodel("atlas_pmc_body");
	codescripts\character::precachemodelarray(lib_A68A::main());
}