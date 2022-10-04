/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42207.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:59 PM
*******************************************************************/

//Function Number: 1
lib_A4DF::main()
{
	self setmodel("marines_body_smg");
	codescripts\character::attachhead("alias_us_marine_heads",lib_A69C::main());
	self.voice = "sentinel";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4DF::precache()
{
	precachemodel("marines_body_smg");
	codescripts\character::precachemodelarray(lib_A69C::main());
}