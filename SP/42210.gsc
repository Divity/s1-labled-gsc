/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42210.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:59 PM
*******************************************************************/

//Function Number: 1
lib_A4E2::main()
{
	self setmodel("marines_body_assault_drop_pod");
	self attach("marines_head_a","",1);
	self.headmodel = "marines_head_a";
	self.voice = "sentinel";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4E2::precache()
{
	precachemodel("marines_body_assault_drop_pod");
	precachemodel("marines_head_a");
}