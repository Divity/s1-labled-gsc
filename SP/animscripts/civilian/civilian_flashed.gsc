/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: civilian_flashed.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 69 ms
 * Timestamp: 4/20/2022 8:19:18 PM
*******************************************************************/

//Function Number: 1
func_3D6E()
{
	return level.var_1E0F[randomint(level.var_1E0F.size)];
}

//Function Number: 2
main()
{
	var_00 = lib_A59A::func_38A5();
	if(var_00 <= 0)
	{
		return;
	}

	animscripts\flashed::func_38A4(func_3D6E(),var_00);
}