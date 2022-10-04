/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _exo_repulsor - 42804.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 477 ms
 * Timestamp: 4/20/2022 8:17:19 PM
*******************************************************************/

//Function Number: 1
exo_repulsor_think()
{
	self notify("exo_repulsor_taken");
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_repulsor_taken");
	if(!self hasweapon("exorepulsor_equipment_mp"))
	{
		return;
	}

	exorepulsorinit();
	thread monitorplayerdeath();
	thread wait_for_game_end();
	for(;;)
	{
		self waittill("exo_ability_activate",var_00);
		if(var_00 == "exorepulsor_equipment_mp")
		{
			thread tryuserepulsor();
		}
	}
}

//Function Number: 2
exorepulsorinit()
{
	self.repulsoractive = 0;
	self method_84A6("exorepulsor_equipment_mp",1);
	var_00 = self method_84A5("exorepulsor_equipment_mp");
	self.var_7011 = 0;
	if(self getoffhandsecondaryclass() == "exorepulsor_equipment_mp")
	{
		self setclientomnvar("exo_ability_nrg_req0",0);
		self setclientomnvar("exo_ability_nrg_total0",var_00);
		self setclientomnvar("ui_exo_battery_level0",var_00);
	}
	else if(self getoffhandprimaryclass() == "exorepulsor_equipment_mp")
	{
		self setclientomnvar("exo_ability_nrg_req1",0);
		self setclientomnvar("exo_ability_nrg_total1",var_00);
		self setclientomnvar("ui_exo_battery_level1",var_00);
	}

	if(!isdefined(level.var_34E0))
	{
		level.var_34E0 = loadfx("vfx/explosion/exo_repulsor_impact");
	}

	if(!isdefined(level.exo_repulsor_activate_vfx))
	{
		level.exo_repulsor_activate_vfx = loadfx("vfx/unique/repulsor_bubble");
	}

	if(!isdefined(level.exo_repulsor_deactivate_vfx))
	{
		level.exo_repulsor_deactivate_vfx = loadfx("vfx/unique/repulsor_bubble_deactivate");
	}

	if(!isdefined(level.exo_repulsor_player_vfx_active))
	{
		level.exo_repulsor_player_vfx_active = loadfx("vfx/unique/exo_repulsor_emitter");
	}

	if(!isdefined(level.exo_repulsor_player_vfx_inactive))
	{
		level.exo_repulsor_player_vfx_inactive = loadfx("vfx/unique/exo_repulsor_inactive");
	}

	wait(0.05);
	if(!maps\mp\_utility::invirtuallobby())
	{
		playfxontag(level.exo_repulsor_player_vfx_inactive,self,getrepulsortag());
	}
}

//Function Number: 3
getrepulsortag()
{
	if(isdefined(level.getrepulsortagfunc))
	{
		return self [[ level.getrepulsortagfunc ]]();
	}

	return "TAG_JETPACK";
}

//Function Number: 4
tryuserepulsor(param_00)
{
	self endon("exo_repulsor_taken");
	if(self.repulsoractive == 1)
	{
		thread stop_repulsor(1);
		return;
	}

	thread start_repulsor();
}

//Function Number: 5
killrepulsorfx()
{
	if(isdefined(self.repulsor_fx))
	{
		self.repulsor_fx delete();
		self.repulsor_fx = undefined;
	}
}

//Function Number: 6
start_repulsor()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("stop_exo_repulsor");
	self endon("exo_repulsor_taken");
	self.repulsoractive = 1;
	thread do_exo_repulsor();
	self method_849F("exorepulsor_equipment_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("exorepulsor_equipment_mp","ui_exo_battery_toggle",1);
	thread maps\mp\_exo_battery::update_exo_battery_hud("exorepulsor_equipment_mp");
	maps\mp\_snd_common_mp::snd_message("mp_exo_repulsor_activate");
	killrepulsorfx();
	if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
	{
		self.repulsor_fx = function_02C1(level.exo_repulsor_player_vfx_active,self,getrepulsortag());
		triggerfx(self.repulsor_fx);
	}

	wait(0.05);
	if(!self.repulsoractive)
	{
		return;
	}

	if(isdefined(level.exo_repulsor_activate_vfx))
	{
		playfxontagforclients(level.exo_repulsor_activate_vfx,self,"j_head",self);
	}
}

//Function Number: 7
stop_repulsor(param_00)
{
	if(!isdefined(self.repulsoractive) || !self.repulsoractive)
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	self notify("stop_exo_repulsor");
	self.repulsoractive = 0;
	self method_84A0("exorepulsor_equipment_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("exorepulsor_equipment_mp","ui_exo_battery_toggle",0);
	killrepulsorfx();
	if(param_00 == 1)
	{
		maps\mp\_snd_common_mp::snd_message("mp_exo_repulsor_deactivate");
		if(!isdefined(self.exo_cloak_on) || self.exo_cloak_on == 0)
		{
			self.repulsor_fx = function_02C1(level.exo_repulsor_player_vfx_inactive,self,getrepulsortag());
			triggerfx(self.repulsor_fx);
		}

		wait(0.05);
		if(isdefined(level.exo_repulsor_deactivate_vfx))
		{
			playfxontagforclients(level.exo_repulsor_deactivate_vfx,self,"j_head",self);
		}
	}
}

//Function Number: 8
monitorplayerdeath()
{
	level endon("game_ended");
	self endon("disconnect");
	common_scripts\utility::waittill_any("death","joined_team","faux_spawn","exo_repulsor_taken");
	self.var_7011 = 0;
	thread stop_repulsor(0);
}

//Function Number: 9
update_exo_battery_hud()
{
	var_00 = self method_84A2("exorepulsor_equipment_mp");
	maps\mp\_exo_battery::set_exo_ability_hud_omnvar("exorepulsor_equipment_mp","ui_exo_battery_level",var_00);
}

//Function Number: 10
do_exo_repulsor()
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("stop_exo_repulsor");
	self endon("exo_repulsor_taken");
	while(self method_84A2("exorepulsor_equipment_mp") > 0)
	{
		for(var_00 = 0;var_00 < level.grenades.size;var_00++)
		{
			var_01 = level.grenades[var_00];
			if(!isdefined(var_01.fx_origin))
			{
				continue;
			}

			if(isdefined(var_01.fx_origin) && maps\mp\_utility::is_exo_ability_weapon(var_01.fx_origin))
			{
				continue;
			}

			if(!isdefined(var_01.owner))
			{
				continue;
			}

			if(isdefined(var_01.owner) && var_01.owner == self)
			{
				continue;
			}

			if(level.teambased && isdefined(var_01.owner.inliveplayerkillstreak) && var_01.owner.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				continue;
			}

			var_02 = distance(var_01.var_2E6,self.var_2E6);
			if(var_02 < 385)
			{
				if(sighttracepassed(self geteye(),var_01.var_2E6,0,self))
				{
					var_03 = var_01.var_2E6 - self.var_2E6;
					var_04 = vectortoangles(var_03);
					var_05 = anglestoup(var_04);
					var_06 = anglestoforward(var_04);
					var_07 = vectornormalize(var_06);
					var_08 = var_01.var_2E6 - 0.2 * var_02 * var_07;
					playfx(level.var_34E0,var_08,var_07,var_05);
					var_01 maps\mp\_snd_common_mp::snd_message("mp_exo_repulsor_repel");
					if(var_01.fx_origin == "explosive_drone_mp")
					{
						var_01 notify("mp_exo_repulsor_repel");
						var_01 thread maps\mp\_explosive_drone::explosivegrenadedeath();
					}
					else
					{
						if(isdefined(level.iszombiegame) && level.iszombiegame)
						{
							var_01 notify("repulsor_repel");
						}

						var_01 delete();
					}

					self.var_7011++;
					maps\mp\gametypes\_missions::processchallenge("ch_exoability_repulser");
					self method_84A1("exorepulsor_equipment_mp",int(self method_84A5("exorepulsor_equipment_mp") / 2));
					update_exo_battery_hud();
				}
			}
		}

		for(var_00 = 0;var_00 < level.missiles.size;var_00++)
		{
			var_09 = level.missiles[var_00];
			if(!isdefined(var_09.owner))
			{
				continue;
			}

			if(isdefined(var_09.owner) && var_09.owner == self)
			{
				continue;
			}

			if(level.teambased && isdefined(var_09.owner.inliveplayerkillstreak) && var_09.owner.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				continue;
			}

			var_0A = distance(var_09.var_2E6,self.var_2E6);
			if(var_0A < 385)
			{
				if(sighttracepassed(self geteye(),var_09.var_2E6,0,self))
				{
					var_0B = var_09.var_2E6 - self.var_2E6;
					var_0C = vectortoangles(var_0B);
					var_0D = anglestoup(var_0C);
					var_0E = anglestoforward(var_0C);
					var_0F = vectornormalize(var_0E);
					var_08 = var_09.var_2E6 - 0.2 * var_0A * var_0F;
					playfx(level.var_34E0,var_08,var_0F,var_0D);
					var_09 maps\mp\_snd_common_mp::snd_message("mp_exo_repulsor_repel");
					if(isdefined(var_09.fx_origin) && var_09.fx_origin == "iw5_exocrossbow_mp")
					{
						stopfxontag(common_scripts\utility::getfx("exocrossbow_sticky_blinking"),var_09.var_3B75,"tag_origin");
					}

					var_09 delete();
					self.var_7011++;
					maps\mp\gametypes\_missions::processchallenge("ch_exoability_repulser");
					self method_84A1("exorepulsor_equipment_mp",int(self method_84A5("exorepulsor_equipment_mp") / 2));
					update_exo_battery_hud();
				}
			}
		}

		for(var_00 = 0;var_00 < level.explosivedrones.size;var_00++)
		{
			var_10 = level.explosivedrones[var_00];
			if(isdefined(var_10))
			{
				if(!isdefined(var_10.owner))
				{
					continue;
				}

				if(isdefined(var_10.owner) && var_10.owner == self)
				{
					continue;
				}

				if(level.teambased && isdefined(var_10.owner.inliveplayerkillstreak) && var_10.owner.inliveplayerkillstreak == self.inliveplayerkillstreak)
				{
					continue;
				}

				var_11 = distance(var_10.var_2E6,self.var_2E6);
				if(var_11 < 385)
				{
					if(sighttracepassed(self geteye(),var_10.var_2E6,0,self))
					{
						var_12 = var_10.var_2E6 - self.var_2E6;
						var_13 = vectortoangles(var_12);
						var_14 = anglestoup(var_13);
						var_15 = anglestoforward(var_13);
						var_16 = vectornormalize(var_15);
						var_08 = var_10.var_2E6 - 0.2 * var_11 * var_16;
						playfx(level.var_34E0,var_08,var_16,var_14);
						var_10 maps\mp\_snd_common_mp::snd_message("mp_exo_repulsor_repel");
						if(isdefined(var_10.explosivedrone))
						{
							var_10.explosivedrone delete();
						}

						var_10 delete();
						self.var_7011++;
						maps\mp\gametypes\_missions::processchallenge("ch_exoability_repulser");
						self method_84A1("exorepulsor_equipment_mp",int(self method_84A5("exorepulsor_equipment_mp") / 2));
						update_exo_battery_hud();
					}
				}
			}
		}

		foreach(var_18 in level.trackingdrones)
		{
			if(!isdefined(var_18.owner))
			{
				continue;
			}

			if(isdefined(var_18.owner) && var_18.owner == self)
			{
				continue;
			}

			if(level.teambased && isdefined(var_18.owner.inliveplayerkillstreak) && var_18.owner.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				continue;
			}

			var_19 = distance(var_18.var_2E6,self.var_2E6);
			if(var_19 < 385)
			{
				if(sighttracepassed(self geteye(),var_18.var_2E6,0,self))
				{
					var_1A = var_18.var_2E6 - self.var_2E6;
					var_1B = vectortoangles(var_1A);
					var_1C = anglestoup(var_1B);
					var_1D = anglestoforward(var_1B);
					var_1E = vectornormalize(var_1D);
					var_08 = var_18.var_2E6 - 0.2 * var_19 * var_1E;
					playfx(level.var_34E0,var_08,var_1E,var_1C);
					var_18 maps\mp\_snd_common_mp::snd_message("mp_exo_repulsor_repel");
					if(!function_0294(var_18) && isdefined(var_18))
					{
						var_18 notify("death");
						maps\mp\_utility::decrementfauxvehiclecount();
					}

					self.var_7011++;
					maps\mp\gametypes\_missions::processchallenge("ch_exoability_repulser");
					self method_84A1("exorepulsor_equipment_mp",int(self method_84A5("exorepulsor_equipment_mp") / 2));
					update_exo_battery_hud();
				}
			}
		}

		if(self.var_7011 >= 2)
		{
			if(!isdefined(level.var_511A))
			{
				thread maps\mp\_events::fourplayevent();
			}

			self.var_7011 = self.var_7011 - 2;
		}

		wait(0.05);
	}

	thread stop_repulsor(1);
}

//Function Number: 11
take_exo_repulsor()
{
	self notify("kill_battery");
	self notify("exo_repulsor_taken");
	self takeweapon("exorepulsor_equipment_mp");
}

//Function Number: 12
give_exo_repulsor()
{
	self giveweapon("exorepulsor_equipment_mp");
	thread exo_repulsor_think();
}

//Function Number: 13
wait_for_game_end()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	self endon("exo_repulsor_taken");
	level waittill("game_ended");
	thread stop_repulsor(0);
}