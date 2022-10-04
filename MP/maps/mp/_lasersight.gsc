/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _lasersight - 42817.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 65 ms
 * Timestamp: 4/20/2022 8:17:28 PM
*******************************************************************/

//Function Number: 1
lasersight_think()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self.var_54D7 = undefined;
	self.var_A1BE = 0;
	self.has_laser = 0;
	for(;;)
	{
		while(maps\mp\_utility::isemped() && self.has_laser)
		{
			wait(0.05);
			self method_80B3();
			self.var_A1BE = 1;
			continue;
		}

		if(self.var_A1BE && self.has_laser)
		{
			self.var_A1BE = 0;
			self method_80B2(get_laser_name());
		}

		if(issubstr(self getcurrentweapon(),"maaws") || issubstr(self getcurrentweapon(),"dlcgun11loot3"))
		{
			self.has_laser = 1;
		}

		if(self.has_laser && self method_812C())
		{
			if(isdefined(self.var_54D7) && self.var_54D7)
			{
				self method_80B3();
				self.var_54D7 = 0;
				while(!self method_84E0() && self method_812C())
				{
					wait(0.05);
				}

				while(self method_84E0() && self method_812C())
				{
					wait(0.05);
				}

				while(self method_812C())
				{
					wait(0.05);
				}

				self method_80B2(get_laser_name());
				self.var_54D7 = 1;
			}
		}

		if(!self.has_laser)
		{
			if(isdefined(self.var_54D7) && self.var_54D7)
			{
				self method_80B3();
				self.var_54D7 = 0;
			}
		}
		else if(!isdefined(self.var_54D7) || !self.var_54D7)
		{
			self method_80B2(get_laser_name());
			self.var_54D7 = 1;
		}

		wait(0.05);
	}
}

//Function Number: 2
get_laser_name()
{
	var_00 = self getcurrentweapon();
	if(issubstr(var_00,"_dlcgun10loot5") || maps\mp\gametypes\_class::isexoxmg(var_00) || maps\mp\gametypes\_class::issac3(var_00))
	{
		return "mp_attachment_lasersight_short";
	}

	return "mp_attachment_lasersight";
}