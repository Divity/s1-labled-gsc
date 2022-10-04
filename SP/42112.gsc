/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42112.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:55 PM
*******************************************************************/

//Function Number: 1
lib_A480::main()
{
	self setmodel("body_hero_cormack_marine_damage");
	self attach("head_hero_cormack_marines_damage","",1);
	self.headmodel = "head_hero_cormack_marines_damage";
	self.voice = "xslice";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A480::precache()
{
	precachemodel("body_hero_cormack_marine_damage");
	precachemodel("head_hero_cormack_marines_damage");
}