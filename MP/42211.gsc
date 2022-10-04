/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42211.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:18:13 PM
*******************************************************************/

//Function Number: 1
lib_A4E3::main()
{
	self setmodel("mp_body_cloak_test");
	self attach("mp_head_cloak_test","",1);
	self.headmodel = "mp_head_cloak_test";
	self setviewmodel("mp_viewhands_cloak_test");
	self.voice = "american";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4E3::precache()
{
	precachemodel("mp_body_cloak_test");
	precachemodel("mp_head_cloak_test");
	precachemodel("mp_viewhands_cloak_test");
}