/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42812.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:18:20 PM
*******************************************************************/

//Function Number: 1
lib_A73C::watchfasthealusage()
{
	self endon("spawned_player");
	self endon("disconnect");
	self endon("death");
	self endon("faux_spawn");
	if(!isdefined(level.fasthealsettings))
	{
		lib_A73C::fasthealinit();
	}

	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		if(var_01 == "fast_heal_mp")
		{
			if(!isalive(self))
			{
				var_00 delete();
				return;
			}

			thread lib_A73C::tryusefastheal();
		}
	}
}

//Function Number: 2
lib_A73C::fasthealinit()
{
	self.fasthealsettings = spawnstruct();
}

//Function Number: 3
lib_A73C::tryusefastheal()
{
	if(!isdefined(self.fasthealsettings))
	{
		lib_A73C::fasthealinit();
	}

	lib_A73C::resetfastheal();
	thread lib_A73C::startfastheal();
	thread lib_A73C::monitorplayerdeath();
	return 1;
}

//Function Number: 4
lib_A73C::startfastheal()
{
	self endon("ClearFastHeal");
	self endon("death");
	self method_82F4("earn_superbonus");
	self.fasthealsettings.juggernautoverlay = newclienthudelem(self);
	self.fasthealsettings.juggernautoverlay.x = 0;
	self.fasthealsettings.juggernautoverlay.y = 0;
	self.fasthealsettings.juggernautoverlay.horzalign = "fullscreen";
	self.fasthealsettings.juggernautoverlay.vertalign = "fullscreen";
	self.fasthealsettings.juggernautoverlay setshader("exo_hud_cloak_overlay",640,480);
	self.fasthealsettings.juggernautoverlay.archive = 1;
	self.fasthealsettings.juggernautoverlay.alpha = 1;
	self.isfastheal = 1;
	self.ignoreregendelay = 1;
	self.healthregenlevel = 0.99;
	self notify("damage");
	wait(10);
	self.healthregenlevel = undefined;
	self.isfastheal = 0;
	if(isdefined(self.fasthealsettings.juggernautoverlay))
	{
		self.fasthealsettings.juggernautoverlay destroy();
	}

	self notify("EndFastHeal");
}

//Function Number: 5
lib_A73C::resetfastheal()
{
	if(isdefined(self.isfastheal) && self.isfastheal == 1)
	{
		if(isdefined(self.fasthealsettings.juggernautoverlay))
		{
			self.fasthealsettings.juggernautoverlay destroy();
		}

		self.healthregenlevel = undefined;
		self notify("ClearFastHeal");
	}
}

//Function Number: 6
lib_A73C::monitorplayerdeath()
{
	self endon("EndFastHeal");
	self waittill("death");
	self.healthregenlevel = undefined;
	self.isfastheal = 0;
	if(isdefined(self.fasthealsettings.juggernautoverlay))
	{
		self.fasthealsettings.juggernautoverlay destroy();
	}
}

//Function Number: 7
lib_A73C::printhealthtoscreen()
{
	self endon("EndFastHeal");
	self endon("death");
	for(;;)
	{
		iprintlnbold(self.health);
		wait(1);
	}
}