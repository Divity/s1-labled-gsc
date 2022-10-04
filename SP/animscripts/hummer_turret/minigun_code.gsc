/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: minigun_code.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 171 ms
 * Timestamp: 4/20/2022 8:19:22 PM
*******************************************************************/

//Function Number: 1
main(param_00)
{
	param_00.var_37D6 = 0.1;
	param_00.var_1FDB = 45;
	param_00.var_37D1 = ::func_37D0;
	param_00.var_8A23 = ::func_5C68;
	param_00.var_277A = 20;
	animscripts\hummer_turret\common::func_4B04(param_00,"minigun");
	wait(0.05);
	param_00 notify("turret_ready");
}

//Function Number: 2
func_5C68(param_00,param_01)
{
	if(param_01 getbarrelspinrate() > 0)
	{
		param_01 stopbarrelspin();
	}
}

//Function Number: 3
func_37D0(param_00)
{
	self endon("death");
	self endon("dismount");
	param_00 endon("kill_fireController");
	param_00 endon("death");
	param_00.var_35A9 = 600;
	param_00.var_35A8 = 900;
	var_01 = -1;
	var_02 = undefined;
	var_03 = undefined;
	param_00.var_35AD = 250;
	param_00.var_35AC = 2250;
	var_04 = -1;
	var_05 = undefined;
	var_06 = 0;
	var_07 = 0;
	param_00.var_7BFD = 15;
	if(isdefined(param_00.var_7BFE))
	{
		param_00.var_7BFD = param_00.var_7BFE;
	}

	param_00.firetime = 0;
	animscripts\hummer_turret\common::func_2BE0(param_00);
	for(;;)
	{
		if(param_00.var_2C7D && !var_06 && !self.var_50EB)
		{
			var_06 = 1;
			if(!var_07)
			{
				param_00 func_5C6D();
				var_07 = 1;
			}

			param_00 notify("startfiring");
			var_01 = gettime();
			animscripts\hummer_turret\common::func_2D78(param_00);
			wait(0.05);
		}
		else if(!param_00.var_2C7D && var_06)
		{
			if(!isdefined(var_02))
			{
				var_02 = gettime();
			}

			if(!isdefined(var_03))
			{
				var_03 = randomfloatrange(param_00.var_35A9,param_00.var_35A8);
			}

			if(gettime() - var_02 >= var_03)
			{
				var_06 = 0;
				animscripts\hummer_turret\common::func_2BE0(param_00);
				var_04 = gettime();
				var_02 = undefined;
				var_03 = undefined;
			}
		}
		else if(!param_00.var_2C7D && !var_06 && var_07)
		{
			if(!isdefined(var_05))
			{
				var_05 = randomfloatrange(param_00.var_35AD,param_00.var_35AC);
			}

			if(self.var_50EB || gettime() - var_04 >= var_05)
			{
				param_00 stopbarrelspin();
				var_07 = 0;
				var_05 = undefined;
			}
		}

		if(param_00.var_99BA == "fire")
		{
			param_00.firetime = param_00.firetime + 0.05;
		}

		if(param_00.firetime > param_00.var_7BFD)
		{
			param_00.var_2C7D = 0;
			var_06 = 0;
			animscripts\hummer_turret\common::func_2BE0(param_00);
			var_04 = -1;
			var_02 = undefined;
			var_03 = undefined;
			thread animscripts\hummer_turret\common::func_2D75(param_00);
			param_00.firetime = 0;
		}

		wait(0.05);
		if(!isdefined(param_00))
		{
			break;
		}
	}
}

//Function Number: 4
func_5C6D()
{
	if(self getbarrelspinrate() == 1)
	{
		return;
	}

	self startbarrelspin();
	while(self getbarrelspinrate() < 1)
	{
		wait(0.05);
	}
}