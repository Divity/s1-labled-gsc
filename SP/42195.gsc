/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42195.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 17 ms
 * Timestamp: 4/20/2022 8:21:58 PM
*******************************************************************/

//Function Number: 1
lib_A4D3::main()
{
	self setmodel("marines_body_assault");
	codescripts\character::attachhead("alias_us_marine_heads",lib_A69C::main());
	self.voice = "sentinel";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4D3::precache()
{
	precachemodel("marines_body_assault");
	codescripts\character::precachemodelarray(lib_A69C::main());
}