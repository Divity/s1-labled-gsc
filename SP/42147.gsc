/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42147.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:56 PM
*******************************************************************/

//Function Number: 1
lib_A4A3::main()
{
	self setmodel("body_hero_will_marine");
	self attach("head_hero_will_marines","",1);
	self.headmodel = "head_hero_will_marines";
	self.voice = "xslice";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4A3::precache()
{
	precachemodel("body_hero_will_marine");
	precachemodel("head_hero_will_marines");
}