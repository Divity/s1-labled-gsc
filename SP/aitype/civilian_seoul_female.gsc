/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: civilian_seoul_female.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 98 ms
 * Timestamp: 4/20/2022 8:19:15 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_C8E = "";
	self.var_7ED = "";
	self.inliveplayerkillstreak = "neutral";
	self.type = "civilian";
	self.var_8F77 = "regular";
	self.var_A = 0.2;
	self.health = 100;
	self.var_1D6 = "";
	self.var_1D3 = 0;
	self.secondaryweapon = "";
	self.var_8557 = "";
	if(isai(self))
	{
		self method_816C(256,0);
		self method_816D(768,1024);
	}

	self.weapon = "none";
	lib_A452::main();
}

//Function Number: 2
spawner()
{
	self method_8040("neutral");
}

//Function Number: 3
precache()
{
	lib_A452::precache();
}