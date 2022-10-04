/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42196.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:58 PM
*******************************************************************/

//Function Number: 1
lib_A4D4::main()
{
	self setmodel("marines_body_assault_lowlod");
	self attach("marines_head_b_lowlod","",1);
	self.headmodel = "marines_head_b_lowlod";
	self.voice = "sentinel";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4D4::precache()
{
	precachemodel("marines_body_assault_lowlod");
	precachemodel("marines_head_b_lowlod");
}