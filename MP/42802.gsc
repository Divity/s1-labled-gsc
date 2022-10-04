/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42802.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:18:18 PM
*******************************************************************/

//Function Number: 1
lib_A732::exo_mute_think()
{
	self notify("exo_mute_taken");
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_mute_taken");
	if(!self hasweapon("exomute_equipment_mp"))
	{
		return;
	}

	lib_A732::exo_mute_init();
	thread lib_A732::monitor_player_death();
	thread lib_A732::wait_for_game_end();
	for(;;)
	{
		self waittill("exo_ability_activate",var_00);
		if(var_00 == "exomute_equipment_mp")
		{
			thread lib_A732::try_use_exo_mute();
		}
	}
}

//Function Number: 2
lib_A732::exo_mute_init()
{
	self.mute_on = 0;
	self method_84A6("exomute_equipment_mp",1);
	var_00 = self method_84A5("exomute_equipment_mp");
	if(self getoffhandsecondaryclass() == "exomute_equipment_mp")
	{
		self setclientomnvar("exo_ability_nrg_req0",0);
		self setclientomnvar("exo_ability_nrg_total0",var_00);
		self setclientomnvar("ui_exo_battery_level0",var_00);
	}
	else if(self getoffhandprimaryclass() == "exomute_equipment_mp")
	{
		self setclientomnvar("exo_ability_nrg_req1",0);
		self setclientomnvar("exo_ability_nrg_total1",var_00);
		self setclientomnvar("ui_exo_battery_level1",var_00);
	}

	if(!isdefined(level.exo_mute_3p))
	{
		level.exo_mute_3p = loadfx("vfx/unique/exo_mute_3p");
	}

	wait(0.05);
	if(!maps\mp\_utility::invirtuallobby())
	{
	}
}

//Function Number: 3
lib_A732::try_use_exo_mute()
{
	self endon("exo_mute_taken");
	if(self.mute_on == 1)
	{
		thread lib_A732::stop_exo_mute(1);
		return;
	}

	thread lib_A732::start_exo_mute();
}

//Function Number: 4
lib_A732::killmutefx()
{
	if(isdefined(self.mute_fx))
	{
		self.mute_fx delete();
		self.mute_fx = undefined;
	}
}

//Function Number: 5
lib_A732::start_exo_mute()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_mute_taken");
	self endon("end_exo_mute");
	self.mute_on = 1;
	maps\mp\_utility::giveperk("specialty_quieter",0);
	self method_849F("exomute_equipment_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("exomute_equipment_mp","ui_exo_battery_toggle",1);
	thread maps\mp\_exo_battery::update_exo_battery_hud("exomute_equipment_mp");
	thread lib_A732::monitor_mute_battery_charge();
	maps\mp\_snd_common_mp::snd_message("mp_exo_mute_activate");
	wait(0.05);
	if(!self.mute_on)
	{
		return;
	}

	if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
	{
		self.mute_fx = function_02C1(level.exo_mute_3p,self,"TAG_ORIGIN");
		triggerfx(self.mute_fx);
	}
}

//Function Number: 6
lib_A732::stop_exo_mute(param_00)
{
	if(!isdefined(self.mute_on) || !self.mute_on)
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	self notify("end_exo_mute");
	self.mute_on = 0;
	self unsetperk("specialty_quieter",1);
	self method_84A0("exomute_equipment_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("exomute_equipment_mp","ui_exo_battery_toggle",0);
	lib_A732::killmutefx();
	if(param_00 == 1)
	{
		maps\mp\_snd_common_mp::snd_message("mp_exo_mute_deactivate");
		wait(0.05);
		if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
		{
		}
	}
}

//Function Number: 7
lib_A732::monitor_player_death()
{
	self endon("disconnect");
	common_scripts\utility::waittill_any("death","joined_team","faux_spawn","exo_mute_taken");
	thread lib_A732::stop_exo_mute(0);
}

//Function Number: 8
lib_A732::monitor_mute_battery_charge()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_mute_taken");
	self endon("end_exo_mute");
	while(self.mute_on == 1)
	{
		if(self method_84A2("exomute_equipment_mp") <= 0)
		{
			thread lib_A732::stop_exo_mute(1);
		}

		wait(0.05);
	}
}

//Function Number: 9
lib_A732::take_exo_mute()
{
	self notify("kill_battery");
	self notify("exo_mute_taken");
	self takeweapon("exomute_equipment_mp");
}

//Function Number: 10
lib_A732::give_exo_mute()
{
	self giveweapon("exomute_equipment_mp");
	thread lib_A732::exo_mute_think();
}

//Function Number: 11
lib_A732::wait_for_game_end()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_mute_taken");
	level waittill("game_ended");
	thread lib_A732::stop_exo_mute(0);
}