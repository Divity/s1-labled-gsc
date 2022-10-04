/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _stock - 42835.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 33 ms
 * Timestamp: 4/20/2022 8:17:39 PM
*******************************************************************/

//Function Number: 1
stock_think()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self.has_stock = 0;
	for(;;)
	{
		if(!self.has_stock)
		{
			if(self hasperk("specialty_stalker",1))
			{
				self unsetperk("specialty_stalker",1);
			}

			wait(0.05);
			continue;
		}

		if(!self hasperk("specialty_stalker",1))
		{
			self setperk("specialty_stalker",1,0);
		}

		wait(0.05);
	}
}