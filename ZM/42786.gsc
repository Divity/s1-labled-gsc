/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42786.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:24:06 PM
*******************************************************************/

//Function Number: 1
lib_A722::init()
{
	level.softlandingtriggers = getentarray("trigger_multiple_softlanding","classname");
	var_00 = getentarray("destructible_vehicle","targetname");
	foreach(var_02 in level.softlandingtriggers)
	{
		if(var_02.script_type != "car")
		{
			continue;
		}

		foreach(var_04 in var_00)
		{
			if(distance(var_02.var_2E6,var_04.var_2E6) > 64)
			{
				continue;
			}

			var_02.destructible = var_04;
		}
	}

	thread lib_A722::onplayerconnect();
}

//Function Number: 2
lib_A722::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.softlanding = undefined;
		var_00 thread lib_A722::softlandingwaiter();
	}
}

//Function Number: 3
lib_A722::playerentersoftlanding(param_00)
{
	self.softlanding = param_00;
}

//Function Number: 4
lib_A722::playerleavesoftlanding(param_00)
{
	self.softlanding = undefined;
}

//Function Number: 5
lib_A722::softlandingwaiter()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("soft_landing",var_00,var_01);
		if(!isdefined(var_00.destructible))
		{
			continue;
		}
	}
}