/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42072.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:54 PM
*******************************************************************/

//Function Number: 1
lib_A458::main()
{
	self setmodel("civ_seoul_male_body_f");
	self attach("civ_seoul_male_head_c","",1);
	self.headmodel = "civ_seoul_male_head_c";
	self.voice = "american";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A458::precache()
{
	precachemodel("civ_seoul_male_body_f");
	precachemodel("civ_seoul_male_head_c");
}