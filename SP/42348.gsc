/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42348.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A56C::func_77FE()
{
	var_00 = spawnstruct();
	var_00.var_CD8 = [];
	return var_00;
}

//Function Number: 2
lib_A56C::func_77FC(param_00,param_01)
{
	self.var_CD8[param_00] = param_01;
}

//Function Number: 3
lib_A56C::func_77F8(param_00)
{
	return self.var_CD8[param_00];
}

//Function Number: 4
lib_A56C::func_77F6(param_00)
{
	if(isarray(param_00))
	{
		self.var_CD8 = param_00;
		return;
	}

	self.var_CD8 = param_00.var_CD8;
}

//Function Number: 5
lib_A56C::func_77FB(param_00)
{
	self.var_CD8[self.var_CD8.size] = param_00;
}

//Function Number: 6
lib_A56C::func_77FA()
{
	var_00 = self.var_CD8[self.var_CD8.size - 1];
	self.var_CD8[self.var_CD8.size - 1] = undefined;
	return var_00;
}

//Function Number: 7
lib_A56C::func_77F5()
{
	self.var_CD8 = [];
}

//Function Number: 8
lib_A56C::func_77F9()
{
	return self.var_CD8.size;
}

//Function Number: 9
lib_A56C::func_77F7(param_00)
{
	var_01 = spawnstruct();
	var_01.func = param_00;
	return var_01;
}

//Function Number: 10
lib_A56C::func_77FD(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00 lib_A56C::func_77F9() - 1;var_02++)
	{
		for(var_03 = var_02 + 1;var_03 < param_00 lib_A56C::func_77F9();var_03++)
		{
			if(param_01 [[ param_01.func ]](param_00 lib_A56C::func_77F8(var_03),param_00 lib_A56C::func_77F8(var_02)))
			{
				var_04 = param_00 lib_A56C::func_77F8(var_03);
				param_00 lib_A56C::func_77FC(var_03,param_00 lib_A56C::func_77F8(var_02));
				param_00 lib_A56C::func_77FC(var_02,var_04);
			}
		}
	}
}