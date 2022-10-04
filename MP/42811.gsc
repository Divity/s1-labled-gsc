/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42811.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:18:19 PM
*******************************************************************/

//Function Number: 1
lib_A73B::watchextrahealthusage()
{
	self notify("exo_health_taken");
	level endon("game_ended");
	self endon("disconnect");
	self endon("death");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_health_taken");
	if(!self hasweapon("extra_health_mp"))
	{
		return;
	}

	lib_A73B::extrahealthinit();
	thread lib_A73B::monitorplayerdeath();
	thread lib_A73B::wait_for_game_end();
	for(;;)
	{
		self waittill("exo_ability_activate",var_00);
		if(var_00 == "extra_health_mp")
		{
			if(!isalive(self))
			{
				return;
			}

			thread lib_A73B::tryuseextrahealth();
		}
	}
}

//Function Number: 2
lib_A73B::extrahealthinit()
{
	self.exo_health_on = 0;
	self method_84A6("extra_health_mp",1);
	var_00 = self method_84A5("extra_health_mp");
	if(self getoffhandsecondaryclass() == "extra_health_mp")
	{
		self setclientomnvar("exo_ability_nrg_req0",0);
		self setclientomnvar("exo_ability_nrg_total0",var_00);
		self setclientomnvar("ui_exo_battery_level0",var_00);
	}
	else if(self getoffhandprimaryclass() == "extra_health_mp")
	{
		self setclientomnvar("exo_ability_nrg_req1",0);
		self setclientomnvar("exo_ability_nrg_total1",var_00);
		self setclientomnvar("ui_exo_battery_level1",var_00);
	}

	if(!isdefined(level.exo_health_le_inactive_vfx))
	{
		level.exo_health_le_inactive_vfx = loadfx("vfx/unique/exo_health_le_inactive");
	}

	if(!isdefined(level.exo_health_le_active_vfx))
	{
		level.exo_health_le_active_vfx = loadfx("vfx/unique/exo_health_le_active");
	}

	if(!isdefined(level.exo_health_rt_inactive_vfx))
	{
		level.exo_health_rt_inactive_vfx = loadfx("vfx/unique/exo_health_rt_inactive");
	}

	if(!isdefined(level.exo_health_rt_active_vfx))
	{
		level.exo_health_rt_active_vfx = loadfx("vfx/unique/exo_health_rt_active");
	}

	wait(0.05);
	if(!maps\mp\_utility::invirtuallobby())
	{
		playfxontag(level.exo_health_le_inactive_vfx,self,"J_Shoulder_LE");
		playfxontag(level.exo_health_rt_inactive_vfx,self,"J_Shoulder_RI");
	}
}

//Function Number: 3
lib_A73B::tryuseextrahealth()
{
	self endon("exo_health_taken");
	if(self.exo_health_on == 1)
	{
		thread lib_A73B::stopextrahealth(1);
		return;
	}

	thread lib_A73B::startextrahealth();
}

//Function Number: 4
lib_A73B::killstimfx()
{
	if(isdefined(self.stim_fx_l))
	{
		self.stim_fx_l delete();
		self.stim_fx_l = undefined;
	}

	if(isdefined(self.stim_fx_r))
	{
		self.stim_fx_r delete();
		self.stim_fx_r = undefined;
	}
}

//Function Number: 5
lib_A73B::startextrahealth()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_health_taken");
	self endon("EndExtraHealth");
	self.exo_health_on = 1;
	self.var_275 = int(self.var_275 * 1.4);
	self.ignoreregendelay = 1;
	self.healthregenlevel = 0.99;
	self notify("damage");
	self method_849F("extra_health_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("extra_health_mp","ui_exo_battery_toggle",1);
	thread maps\mp\_exo_battery::update_exo_battery_hud("extra_health_mp");
	thread lib_A73B::monitory_health_battery_charge();
	maps\mp\_snd_common_mp::snd_message("mp_exo_health_activate");
	lib_A73B::killstimfx();
	wait(0.05);
	if(!self.exo_health_on)
	{
		return;
	}

	if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
	{
		self.stim_fx_l = function_02C1(level.exo_health_le_active_vfx,self,"J_Shoulder_LE");
		self.stim_fx_r = function_02C1(level.exo_health_rt_active_vfx,self,"J_Shoulder_RI");
		triggerfx(self.stim_fx_l);
		triggerfx(self.stim_fx_r);
	}
}

//Function Number: 6
lib_A73B::stopextrahealth(param_00)
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_health_taken");
	if(!isdefined(self.exo_health_on) || !self.exo_health_on)
	{
		return;
	}

	self notify("EndExtraHealth");
	self endon("EndExtraHealth");
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	self.exo_health_on = 0;
	if(isdefined(level.var_511A))
	{
		self.var_275 = self.var_1E37 + self.hordearmor * 40;
	}
	else
	{
		self.var_275 = int(self.var_275 / 1.4);
	}

	if(self.health > self.var_275)
	{
		self.health = self.var_275;
	}

	self.healthregenlevel = undefined;
	self method_84A0("extra_health_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("extra_health_mp","ui_exo_battery_toggle",0);
	lib_A73B::killstimfx();
	if(param_00 == 1)
	{
		maps\mp\_snd_common_mp::snd_message("mp_exo_health_deactivate");
		wait(0.05);
		if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
		{
			self.stim_fx_l = function_02C1(level.exo_health_le_inactive_vfx,self,"J_Shoulder_LE");
			self.stim_fx_r = function_02C1(level.exo_health_rt_inactive_vfx,self,"J_Shoulder_RI");
			triggerfx(self.stim_fx_l);
			triggerfx(self.stim_fx_r);
		}
	}
}

//Function Number: 7
lib_A73B::monitorplayerdeath()
{
	level endon("game_ended");
	self endon("disconnect");
	common_scripts\utility::waittill_any("death","joined_team","faux_spawn","exo_health_taken");
	thread lib_A73B::stopextrahealth(0);
}

//Function Number: 8
lib_A73B::monitory_health_battery_charge()
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_health_taken");
	while(self.exo_health_on == 1)
	{
		if(self method_84A2("extra_health_mp") <= 0)
		{
			thread lib_A73B::stopextrahealth(1);
		}

		wait(0.05);
	}
}

//Function Number: 9
lib_A73B::take_exo_health()
{
	self notify("kill_battery");
	self notify("exo_health_taken");
	self takeweapon("extra_health_mp");
}

//Function Number: 10
lib_A73B::give_exo_health()
{
	self giveweapon("extra_health_mp");
	thread lib_A73B::watchextrahealthusage();
}

//Function Number: 11
lib_A73B::wait_for_game_end()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_health_taken");
	level waittill("game_ended");
	thread lib_A73B::stopextrahealth(0);
}