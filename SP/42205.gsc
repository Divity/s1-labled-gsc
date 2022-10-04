/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42205.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:58 PM
*******************************************************************/

//Function Number: 1
lib_A4DD::main()
{
	self setmodel("marines_body_assault");
	self attach("marines_head_a","",1);
	self.headmodel = "marines_head_a";
	self.voice = "sentinel";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4DD::precache()
{
	precachemodel("marines_body_assault");
	precachemodel("marines_head_a");
}