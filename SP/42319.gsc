/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42319.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A54F::main(param_00,param_01)
{
	thread lib_A54F::func_7EE3(self,param_00,param_01);
}

//Function Number: 2
lib_A54F::func_8ECA(param_00,param_01,param_02)
{
	param_01 waittill("death");
	if(!isdefined(param_00))
	{
		return;
	}

	if(function_0294(param_00))
	{
		return;
	}

	param_00 setmode("manual");
	param_00 cleartargetentity();
	param_00 stopfiring();
}

//Function Number: 3
lib_A54F::func_52D5(param_00,param_01)
{
	param_01 endon("death");
	for(;;)
	{
		var_02 = param_00 gettagangles("tag_aim_pivot");
		param_01 method_818F("face angle",var_02[1]);
		wait(0.05);
	}
}

//Function Number: 4
lib_A54F::func_7EE3(param_00,param_01,param_02)
{
	param_01 endon("death");
	param_00 endon("death");
	param_00 setmode("auto_nonai");
	param_01 linkto(param_00,param_02.var_85A8,(0,0,0),(0,0,0));
	thread lib_A54F::func_8ECA(param_00,param_01,param_02);
	thread lib_A54F::func_52D5(param_00,param_01);
	var_03 = param_00 gettagorigin(param_02.var_85A8);
	var_04 = param_00 gettagangles(param_02.var_85A8);
	param_00 lib_A59F::func_C74(param_01,param_02.var_85A8,param_02.var_4B60);
}