/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _exo_shield - 42805.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 209 ms
 * Timestamp: 4/20/2022 8:17:19 PM
*******************************************************************/

//Function Number: 1
exo_shield_think()
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_shield_taken");
	self notify("exo_shield_think_end");
	self endon("exo_shield_think_end");
	var_00 = get_exo_shield_weapon();
	if(!self hasweapon(var_00))
	{
		return;
	}

	self method_84A6(var_00,1);
	var_01 = function_0297(var_00);
	var_02 = self method_84A5(var_00);
	if(self getoffhandsecondaryclass() == var_00)
	{
		self setclientomnvar("ui_exo_battery_level0",var_02);
		self setclientomnvar("exo_ability_nrg_req0",var_01);
		self setclientomnvar("exo_ability_nrg_total0",var_02);
	}
	else if(self getoffhandprimaryclass() == var_00)
	{
		self setclientomnvar("ui_exo_battery_level1",var_02);
		self setclientomnvar("exo_ability_nrg_req1",var_01);
		self setclientomnvar("exo_ability_nrg_total1",var_02);
	}

	thread wait_for_player_death(var_00);
	for(;;)
	{
		self waittillmatch(var_00,"grenade_pullback");
		maps\mp\_snd_common_mp::snd_message("mp_exo_shield_activate");
		self.connectedpostgame["numberOfTimesShieldUsed"]++;
		maps\mp\_exo_battery::set_exo_ability_hud_omnvar(var_00,"ui_exo_battery_toggle",1);
		self.exo_shield_on = 1;
		if(!isagent(self))
		{
			thread maps\mp\_exo_battery::update_exo_battery_hud(var_00);
		}

		if(self method_84A8(var_00) == 1)
		{
			self waittillmatch(var_00,"battery_discharge_end");
		}

		maps\mp\_snd_common_mp::snd_message("mp_exo_shield_deactivate");
		maps\mp\_exo_battery::set_exo_ability_hud_omnvar(var_00,"ui_exo_battery_toggle",0);
		self.exo_shield_on = 0;
	}
}

//Function Number: 2
take_exo_shield()
{
	self notify("kill_battery");
	self notify("exo_shield_taken");
	self takeweapon(get_exo_shield_weapon());
}

//Function Number: 3
give_exo_shield()
{
	self giveweapon(get_exo_shield_weapon());
	thread exo_shield_think();
}

//Function Number: 4
get_exo_shield_weapon()
{
	if(isdefined(level.exoshieldweapon))
	{
		return level.exoshieldweapon;
	}

	level.exoshieldweapon = "exoshield_equipment_mp";
	if(isdefined(level.var_511A))
	{
		level.exoshieldweapon = "exoshieldhorde_equipment_mp";
	}

	return level.exoshieldweapon;
}

//Function Number: 5
wait_for_player_death(param_00)
{
	level endon("game_ended");
	self endon("disconnect");
	common_scripts\utility::waittill_any("death","joined_team","faux_spawn","exo_shield_taken");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar(param_00,"ui_exo_battery_toggle",0);
	self.exo_shield_on = 0;
	self method_84C6();
}