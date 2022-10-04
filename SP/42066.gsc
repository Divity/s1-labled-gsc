/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42066.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:54 PM
*******************************************************************/

//Function Number: 1
lib_A452::main()
{
	codescripts\character::setmodelfromarray(lib_A690::main());
	codescripts\character::attachhead("alias_seoul_civilian_head_females",lib_A695::main());
	self.voice = "american";
	self method_83DB("vestlight");
}

//Function Number: 2
lib_A452::precache()
{
	codescripts\character::precachemodelarray(lib_A690::main());
	codescripts\character::precachemodelarray(lib_A695::main());
}