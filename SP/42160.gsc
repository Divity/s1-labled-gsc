/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42160.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:56 PM
*******************************************************************/

//Function Number: 1
lib_A4B0::main()
{
	self setmodel("npc_exo_armor_base");
	self attach("npc_exo_armor_atlas_head","",1);
	self.headmodel = "npc_exo_armor_atlas_head";
	self.voice = "atlas";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A4B0::precache()
{
	precachemodel("npc_exo_armor_base");
	precachemodel("npc_exo_armor_atlas_head");
}