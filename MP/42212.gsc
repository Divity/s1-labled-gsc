/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42212.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:18:13 PM
*******************************************************************/

//Function Number: 1
lib_A4E4::main()
{
	self setmodel("mp_sentinel_body_nojet_b");
	codescripts\character::attachhead("alias_mp_sentinel_heads",lib_A685::main());
	self setviewmodel("viewhands_s1_pmc");
	self.voice = "american";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4E4::precache()
{
	precachemodel("mp_sentinel_body_nojet_b");
	codescripts\character::precachemodelarray(lib_A685::main());
	precachemodel("viewhands_s1_pmc");
}