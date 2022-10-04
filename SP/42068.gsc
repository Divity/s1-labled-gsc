/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42068.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:54 PM
*******************************************************************/

//Function Number: 1
lib_A454::main()
{
	codescripts\character::setmodelfromarray(lib_A692::main());
	codescripts\character::attachhead("alias_seoul_civilian_head_males_b",lib_A697::main());
	self.voice = "american";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A454::precache()
{
	codescripts\character::precachemodelarray(lib_A692::main());
	codescripts\character::precachemodelarray(lib_A697::main());
}