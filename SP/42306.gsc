/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42306.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 6
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:17 PM
*******************************************************************/

//Function Number: 1
lib_A542::main()
{
	level.var_4F95 = [];
}

//Function Number: 2
lib_A542::func_4F97(param_00,param_01)
{
	if(1)
	{
		return spawnstruct();
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	var_02 = newhudelem();
	var_02.alignx = "right";
	var_02.aligny = "top";
	var_02.horzalign = "right";
	var_02.vertalign = "top";
	var_02.alpha = 0;
	var_02.index = level.var_4F95.size;
	var_02.var_84D8 = param_01;
	var_02 setshader(param_00,40,40);
	level.var_4F95[var_02.index] = var_02;
	lib_A542::func_4F9B();
	return var_02;
}

//Function Number: 3
lib_A542::func_4F99()
{
	if(1)
	{
		return;
	}

	self.var_84D8 = 0;
	lib_A542::func_4F9B();
}

//Function Number: 4
lib_A542::func_4F9A()
{
	if(1)
	{
		return;
	}

	self.var_84D8 = 1;
	lib_A542::func_4F9B();
}

//Function Number: 5
lib_A542::func_4F9B()
{
	if(1)
	{
		return;
	}

	var_00 = -18;
	var_01 = 8;
	var_02 = 42;
	var_03 = 0;
	for(var_04 = 0;var_04 < level.var_4F95.size;var_04++)
	{
		if(level.var_4F95[var_04].var_84D8)
		{
			var_05 = var_01 + var_02 * var_03;
			if(var_05 != level.var_4F95[var_04].y)
			{
				level.var_4F95[var_04].x = var_00;
				if(level.var_4F95[var_04].alpha != 0)
				{
					level.var_4F95[var_04] moveovertime(0.3);
				}

				level.var_4F95[var_04].y = var_05;
			}

			if(level.var_4F95[var_04].alpha != 1)
			{
				level.var_4F95[var_04] fadeovertime(0.3);
				level.var_4F95[var_04].alpha = 1;
			}

			var_03++;
			continue;
		}

		level.var_4F95[var_04] fadeovertime(0.3);
		level.var_4F95[var_04].alpha = 0;
	}
}

//Function Number: 6
lib_A542::func_4F98()
{
	if(1)
	{
		return;
	}

	self destroy();
	var_00 = 0;
	var_01 = level.var_4F95;
	level.var_4F95 = [];
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(isdefined(var_01[var_02]))
		{
			level.var_4F95[level.var_4F95.size] = var_01[var_02];
		}
	}

	lib_A542::func_4F9B();
}