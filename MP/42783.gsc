/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42783.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:18:16 PM
*******************************************************************/

//Function Number: 1
lib_A71F::watchadrenalineusage()
{
	self notify("exo_overclock_taken");
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_overclock_taken");
	if(!self hasweapon("adrenaline_mp"))
	{
		return;
	}

	lib_A71F::adrenalineinit();
	thread lib_A71F::monitorplayerdeath();
	thread lib_A71F::wait_for_game_end();
	for(;;)
	{
		self waittill("exo_adrenaline_fire");
		if(!isalive(self))
		{
			return;
		}

		thread lib_A71F::tryuseadrenaline();
	}
}

//Function Number: 2
lib_A71F::adrenalineinit()
{
	self.overclock_on = 0;
	self method_84A6("adrenaline_mp",1);
	var_00 = self method_84A5("adrenaline_mp");
	if(self getoffhandsecondaryclass() == "adrenaline_mp")
	{
		self setclientomnvar("exo_ability_nrg_req0",0);
		self setclientomnvar("exo_ability_nrg_total0",var_00);
		self setclientomnvar("ui_exo_battery_level0",var_00);
	}
	else if(self getoffhandprimaryclass() == "adrenaline_mp")
	{
		self setclientomnvar("exo_ability_nrg_req1",0);
		self setclientomnvar("exo_ability_nrg_total1",var_00);
		self setclientomnvar("ui_exo_battery_level1",var_00);
	}

	if(!isdefined(level.exo_overclock_vfx_le_active))
	{
		level.exo_overclock_vfx_le_active = loadfx("vfx/lights/exo_overclock_hip_le_start");
	}

	if(!isdefined(level.exo_overclock_vfx_ri_active))
	{
		level.exo_overclock_vfx_ri_active = loadfx("vfx/lights/exo_overclock_hip_ri_start");
	}

	if(!isdefined(level.exo_overclock_vfx_le_inactive))
	{
		level.exo_overclock_vfx_le_inactive = loadfx("vfx/lights/exo_overclock_hip_le_inactive");
	}

	if(!isdefined(level.exo_overclock_vfx_ri_inactive))
	{
		level.exo_overclock_vfx_ri_inactive = loadfx("vfx/lights/exo_overclock_hip_ri_inactive");
	}

	wait(0.05);
	if(!maps\mp\_utility::invirtuallobby())
	{
		playfxontag(level.exo_overclock_vfx_le_inactive,self,"J_Hip_LE");
		playfxontag(level.exo_overclock_vfx_ri_inactive,self,"J_Hip_RI");
	}
}

//Function Number: 3
lib_A71F::tryuseadrenaline()
{
	self endon("exo_overclock_taken");
	if(self.overclock_on == 1)
	{
		thread lib_A71F::stopadrenaline(1);
		return;
	}

	thread lib_A71F::startadrenaline();
}

//Function Number: 4
lib_A71F::killoverclockfx()
{
	if(isdefined(self.overclock_fx_l))
	{
		self.overclock_fx_l delete();
		self.overclock_fx_l = undefined;
	}

	if(isdefined(self.overclock_fx_r))
	{
		self.overclock_fx_r delete();
		self.overclock_fx_r = undefined;
	}
}

//Function Number: 5
lib_A71F::startadrenaline()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_overclock_taken");
	self endon("EndAdrenaline");
	self.overclock_on = 1;
	maps\mp\gametypes\_gamelogic::sethasdonecombat(self,1);
	self.adrenaline_speed_scalar = 1.12;
	if(maps\mp\_utility::_hasperk("specialty_lightweight"))
	{
		self.movespeedscaler = self.adrenaline_speed_scalar + maps\mp\_utility::lightweightscalar() - 1;
	}
	else
	{
		self.movespeedscaler = self.adrenaline_speed_scalar;
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		var_00 = self getclientomnvar("ui_horde_player_class");
		self.movespeedscaler = min(level.classsettings[var_00]["speed"] + 0.25,1.12);
	}

	maps\mp\gametypes\_weapons::updatemovespeedscale();
	self method_849F("adrenaline_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("adrenaline_mp","ui_exo_battery_toggle",1);
	thread maps\mp\_exo_battery::update_exo_battery_hud("adrenaline_mp");
	thread lib_A71F::monitor_overclock_battery_charge();
	maps\mp\_snd_common_mp::snd_message("mp_exo_overclock_activate");
	lib_A71F::killoverclockfx();
	wait(0.05);
	if(!self.overclock_on)
	{
		return;
	}

	if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
	{
		self.overclock_fx_l = function_02C1(level.exo_overclock_vfx_le_active,self,"J_Hip_LE");
		self.overclock_fx_r = function_02C1(level.exo_overclock_vfx_ri_active,self,"J_Hip_RI");
		triggerfx(self.overclock_fx_l);
		triggerfx(self.overclock_fx_r);
	}
}

//Function Number: 6
lib_A71F::stopadrenaline(param_00)
{
	if(!isdefined(self.overclock_on) || !self.overclock_on)
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	self notify("EndAdrenaline");
	self.overclock_on = 0;
	if(maps\mp\_utility::_hasperk("specialty_lightweight"))
	{
		self.movespeedscaler = maps\mp\_utility::lightweightscalar();
	}
	else
	{
		self.movespeedscaler = level.baseplayermovescale;
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		var_01 = self getclientomnvar("ui_horde_player_class");
		self.movespeedscaler = level.classsettings[var_01]["speed"];
	}

	maps\mp\gametypes\_weapons::updatemovespeedscale();
	self.adrenaline_speed_scalar = undefined;
	self method_84A0("adrenaline_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("adrenaline_mp","ui_exo_battery_toggle",0);
	lib_A71F::killoverclockfx();
	if(param_00 == 1)
	{
		maps\mp\_snd_common_mp::snd_message("mp_exo_overclock_deactivate");
		wait(0.05);
		if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
		{
			self.overclock_fx_l = function_02C1(level.exo_overclock_vfx_le_inactive,self,"J_Hip_LE");
			self.overclock_fx_r = function_02C1(level.exo_overclock_vfx_ri_inactive,self,"J_Hip_RI");
			triggerfx(self.overclock_fx_l);
			triggerfx(self.overclock_fx_r);
		}
	}
}

//Function Number: 7
lib_A71F::monitorplayerdeath()
{
	self endon("disconnect");
	common_scripts\utility::waittill_any("death","joined_team","faux_spawn","exo_overclock_taken");
	thread lib_A71F::stopadrenaline(0);
}

//Function Number: 8
lib_A71F::monitor_overclock_battery_charge()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_overclock_taken");
	self endon("EndAdrenaline");
	while(self.overclock_on == 1)
	{
		if(self method_84A2("adrenaline_mp") <= 0)
		{
			thread lib_A71F::stopadrenaline(1);
		}

		wait(0.05);
	}
}

//Function Number: 9
lib_A71F::take_exo_overclock()
{
	self notify("kill_battery");
	self notify("exo_overclock_taken");
	self takeweapon("adrenaline_mp");
}

//Function Number: 10
lib_A71F::give_exo_overclock()
{
	self giveweapon("adrenaline_mp");
	thread lib_A71F::watchadrenalineusage();
}

//Function Number: 11
lib_A71F::wait_for_game_end()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_overclock_taken");
	level waittill("game_ended");
	thread lib_A71F::stopadrenaline(0);
}