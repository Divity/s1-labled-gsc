/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _areas - 42786.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 164 ms
 * Timestamp: 4/20/2022 8:17:01 PM
*******************************************************************/

//Function Number: 1
init()
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

	thread onplayerconnect();
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.softlanding = undefined;
		var_00 thread softlandingwaiter();
	}
}

//Function Number: 3
playerentersoftlanding(param_00)
{
	self.softlanding = param_00;
}

//Function Number: 4
playerleavesoftlanding(param_00)
{
	self.softlanding = undefined;
}

//Function Number: 5
softlandingwaiter()
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