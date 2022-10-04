/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: streak_mp_blackbox.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 28
 * Decompile Time: 1074 ms
 * Timestamp: 4/20/2022 8:24:02 PM
*******************************************************************/

//Function Number: 1
streak_init()
{
	precacheitem("iw5_dlcgun12loot4_mp");
	precacheshader("dpad_killstreak_lost_static");
	precacheshader("overlay_blackbox_killstreak");
	level.killstreakfuncs["mp_blackbox"] = ::tryusempblackbox;
	level.mapkillstreak = "mp_blackbox";
	level.mapkillstreakpickupstring = &"MP_BLACKBOX_MAP_KILLSTREAK_PICKUP";
	level.killstreakoverlay = "overlay_blackbox_killstreak";
	level.killstreak_trail_fx = loadfx("vfx/map/mp_blackbox/trail_on_character");
	level.killstreak_chest_fx = loadfx("vfx/map/mp_blackbox/killstreak_chest_vfx");
}

//Function Number: 2
test_give_players_map_killstreak()
{
	wait(60);
	for(;;)
	{
		if(isdefined(level.var_328) && level.var_328.size > 0)
		{
			var_00 = level.var_328[randomintrange(0,level.var_328.size)];
			if(isdefined(var_00) && var_00.inliveplayerkillstreak != "spectator" && isdefined(var_00.killstreakmodules) && !var_00 hasweapon("iw5_dlcgun12loot4_mp") && !isbot(var_00) && !isagent(var_00))
			{
				if(!isdefined(var_00.map_killstreak_active) || !var_00.map_killstreak_active)
				{
					if(!isdefined(var_00.given_map_killstreak) || !var_00.given_map_killstreak)
					{
						var_00.given_map_killstreak = 1;
						var_00 maps\mp\killstreaks\_killstreaks::givekillstreak(level.mapkillstreak);
					}
				}
			}
		}

		wait(20);
	}
}

//Function Number: 3
tryusempblackbox(param_00,param_01)
{
	if(maps\mp\_utility::isusingremote())
	{
		return 0;
	}

	if(maps\mp\_utility::isairdenied())
	{
		return 0;
	}

	if(maps\mp\_utility::isemped())
	{
		return 0;
	}

	if(maps\mp\_utility::isjuggernaut())
	{
		return 0;
	}

	if(isdefined(self.map_killstreak_active) && self.map_killstreak_active)
	{
		return 0;
	}

	thread enable_alien_mode();
	return 1;
}

//Function Number: 4
setcreature()
{
	self.radar_highlight = newclienthudelem(self);
	self.radar_highlight.color = (1,0.015,0.015);
	self.radar_highlight.alpha = 1;
	self.radar_highlight method_83A4(60);
}

//Function Number: 5
unsetcreature()
{
	if(isdefined(self.radar_highlight))
	{
		self.radar_highlight destroy();
	}
}

//Function Number: 6
enable_alien_mode()
{
	self playsoundasmaster("ks_blackbox_spore_use");
	level.perksetfuncs["specialty_exo_creature"] = ::setcreature;
	level.perkunsetfuncs["specialty_exo_creature"] = ::unsetcreature;
	self.map_killstreak_active = 1;
	disable_exo_usage();
	alien_mode_abilities(0);
	enable_clientfx();
	enable_fx();
	thread alien_mode_reapply_on_death();
	alien_mode_timer();
	self notify("notify_end_killstreak_mode");
	self.map_killstreak_active = 0;
	disable_alien_mode();
	disable_clientfx();
	disable_fx();
	reenable_exo_usage();
	level.perksetfuncs["specialty_exo_creature"] = undefined;
	level.perkunsetfuncs["specialty_exo_creature"] = undefined;
}

//Function Number: 7
disable_alien_mode()
{
	alien_mode_overdrive_off();
	alien_extra_health_off();
	self allowsprint(0);
	wait(0.1);
	remove_alien_perks();
	self allowsprint(1);
	self notify("stop_exo_repulsor");
	self.killstreaksdisabled = undefined;
}

//Function Number: 8
disable_exo_usage()
{
	if(self hasweapon("adrenaline_mp"))
	{
		self.has_overclock_ability = 1;
		self.overclock_battery_charge = self method_84A2("adrenaline_mp");
		self method_84A3("adrenaline_mp",0);
	}

	if(self hasweapon("extra_health_mp"))
	{
		self.has_stim_ability = 1;
		self.stim_battery_charge = self method_84A2("extra_health_mp");
		self method_84A3("extra_health_mp",0);
	}

	if(isdefined(level.cloakweapon) && self hasweapon(level.cloakweapon))
	{
		self.has_cloak_ability = 1;
		self.cloak_battery_charge = self method_84A2(maps\mp\_exo_cloak::get_exo_cloak_weapon());
		self method_84A3(maps\mp\_exo_cloak::get_exo_cloak_weapon(),0);
	}

	if(isdefined(level.hoverweapon) && self hasweapon(level.hoverweapon))
	{
		self.has_hover_ability = 1;
		self.hover_battery_charge = self method_84A2(level.hoverweapon);
		self method_84A3(level.hoverweapon,0);
	}

	if(self hasweapon("exomute_equipment_mp"))
	{
		self.has_mute_ability = 1;
		self.mute_battery_charge = self method_84A2("exomute_equipment_mp");
		self method_84A3("exomute_equipment_mp",0);
	}

	if(self hasweapon("exoping_equipment_mp"))
	{
		self.has_ping_ability = 1;
		self.ping_battery_charge = self method_84A2("exoping_equipment_mp");
		self method_84A3("exoping_equipment_mp",0);
	}

	if(self hasweapon("exorepulsor_equipment_mp"))
	{
		self.has_trophy_ability = 1;
		self.trophy_battery_charge = self method_84A2("exorepulsor_equipment_mp");
		self method_84A3("exorepulsor_equipment_mp",0);
	}

	if(isdefined(level.exoshieldweapon) && self hasweapon(level.exoshieldweapon))
	{
		self.has_shield_ability = 1;
		self.shield_battery_charge = self method_84A2(maps\mp\_exo_shield::get_exo_shield_weapon());
		self method_84A3(maps\mp\_exo_shield::get_exo_shield_weapon(),0);
	}
}

//Function Number: 9
reenable_exo_usage()
{
	if(isdefined(self.has_overclock_ability) && self.has_overclock_ability == 1)
	{
		self method_84A3("adrenaline_mp",self.overclock_battery_charge);
	}

	if(isdefined(self.has_stim_ability) && self.has_stim_ability == 1)
	{
		self method_84A3("extra_health_mp",self.stim_battery_charge);
	}

	if(isdefined(self.has_cloak_ability) && self.has_cloak_ability == 1)
	{
		self method_84A3(maps\mp\_exo_cloak::get_exo_cloak_weapon(),self.cloak_battery_charge);
	}

	if(isdefined(self.has_hover_ability) && self.has_hover_ability == 1)
	{
		self method_84A3(level.hoverweapon,self.hover_battery_charge);
	}

	if(isdefined(self.has_mute_ability) && self.has_mute_ability == 1)
	{
		self method_84A3("exomute_equipment_mp",self.mute_battery_charge);
	}

	if(isdefined(self.has_ping_ability) && self.has_ping_ability == 1)
	{
		self method_84A3("exoping_equipment_mp",self.ping_battery_charge);
	}

	if(isdefined(self.has_trophy_ability) && self.has_trophy_ability == 1)
	{
		self method_84A3("exorepulsor_equipment_mp",self.trophy_battery_charge);
	}

	if(isdefined(self.has_shield_ability) && self.has_shield_ability == 1)
	{
		self method_84A3(maps\mp\_exo_shield::get_exo_shield_weapon(),self.shield_battery_charge);
	}
}

//Function Number: 10
alien_mode_abilities(param_00)
{
	alien_mode_overdrive_on();
	thread alien_extra_health_on(param_00);
	give_alien_perks();
	self.killstreaksdisabled = 1;
	thread alien_mode_exo_repulsor_on();
	thread alien_mode_unlimited_ammo();
}

//Function Number: 11
give_alien_perks()
{
	self setviewkickscale(0.5);
	maps\mp\_utility::giveperk("specialty_exo_slamboots",0);
	maps\mp\_utility::giveperk("specialty_radarimmune",0);
	maps\mp\_utility::giveperk("specialty_exoping_immune",0);
	maps\mp\_utility::giveperk("specialty_hard_shell",0);
	maps\mp\_utility::giveperk("specialty_throwback",0);
	maps\mp\_utility::giveperk("_specialty_blastshield",0);
	self.specialty_blastshield_bonus = maps\mp\_utility::getintproperty("perk_blastShieldScale",45) / 100;
	if(isdefined(level.hardcoremode) && level.hardcoremode)
	{
		self.specialty_blastshield_bonus = maps\mp\_utility::getintproperty("perk_blastShieldScale_HC",90) / 100;
	}

	maps\mp\_utility::giveperk("specialty_lightweight",0);
	maps\mp\_utility::giveperk("specialty_explosivedamage",0);
	maps\mp\_utility::giveperk("specialty_blindeye",0);
	maps\mp\_utility::giveperk("specialty_plainsight",0);
	maps\mp\_utility::giveperk("specialty_coldblooded",0);
	maps\mp\_utility::giveperk("specialty_spygame",0);
	maps\mp\_utility::giveperk("specialty_heartbreaker",0);
	maps\mp\_utility::giveperk("specialty_moreminimap",0);
	maps\mp\_utility::giveperk("specialty_silentkill",0);
	maps\mp\_utility::giveperk("specialty_quickswap",0);
	maps\mp\_utility::giveperk("specialty_fastoffhand",0);
	maps\mp\_utility::giveperk("specialty_sprintreload",0);
	maps\mp\_utility::giveperk("specialty_sprintfire",0);
	maps\mp\_utility::giveperk("specialty_empimmune",0);
	maps\mp\_utility::giveperk("specialty_stun_resistance",0);
	self.stunscaler = 0.1;
	self setviewkickscale(0.2);
	self.ammopickup_scalar = 0.2;
	maps\mp\_utility::giveperk("specialty_scavenger",0);
	maps\mp\_utility::giveperk("specialty_bulletresupply",0);
	maps\mp\_utility::giveperk("specialty_extraammo",0);
	maps\mp\_utility::giveperk("specialty_hardline",0);
	maps\mp\_utility::giveperk("specialty_exo_creature",0);
}

//Function Number: 12
should_remove_alien_perk(param_00)
{
	if(maps\mp\_utility::_hasperk(param_00))
	{
		return 0;
	}

	var_01 = isdefined(self.reinforcementperks) && isdefined(self.reinforcementperks[param_00]) && self.reinforcementperks[param_00];
	if(var_01)
	{
		return 0;
	}

	return 1;
}

//Function Number: 13
remove_alien_perks()
{
	if(should_remove_alien_perk("specialty_extended_battery"))
	{
		maps\mp\_utility::_unsetperk("specialty_exo_slamboots");
	}

	if(should_remove_alien_perk("specialty_class_lowprofile"))
	{
		maps\mp\_utility::_unsetperk("specialty_radarimmune");
		maps\mp\_utility::_unsetperk("specialty_exoping_immune");
	}

	if(should_remove_alien_perk("specialty_class_flakjacket"))
	{
		maps\mp\_utility::_unsetperk("specialty_hard_shell");
		maps\mp\_utility::_unsetperk("specialty_throwback");
		maps\mp\_utility::_unsetperk("_specialty_blastshield");
	}

	if(should_remove_alien_perk("specialty_class_lightweight"))
	{
		maps\mp\_utility::_unsetperk("specialty_lightweight");
	}

	if(should_remove_alien_perk("specialty_class_dangerclose"))
	{
		maps\mp\_utility::_unsetperk("specialty_explosivedamage");
	}

	if(should_remove_alien_perk("specialty_class_blindeye"))
	{
		maps\mp\_utility::_unsetperk("specialty_blindeye");
		maps\mp\_utility::_unsetperk("specialty_plainsight");
	}

	if(should_remove_alien_perk("specialty_class_coldblooded"))
	{
		maps\mp\_utility::_unsetperk("specialty_coldblooded");
		maps\mp\_utility::_unsetperk("specialty_spygame");
		maps\mp\_utility::_unsetperk("specialty_heartbreaker");
	}

	if(should_remove_alien_perk("specialty_class_peripherals") || maps\mp\_utility::practiceroundgame())
	{
		maps\mp\_utility::_unsetperk("specialty_moreminimap");
		maps\mp\_utility::_unsetperk("specialty_silentkill");
	}

	if(should_remove_alien_perk("specialty_class_fasthands"))
	{
		maps\mp\_utility::_unsetperk("specialty_quickswap");
		maps\mp\_utility::_unsetperk("specialty_fastoffhand");
		maps\mp\_utility::_unsetperk("specialty_sprintreload");
	}

	if(should_remove_alien_perk("specialty_class_dexterity"))
	{
		maps\mp\_utility::_unsetperk("specialty_sprintfire");
	}

	if(should_remove_alien_perk("specialty_class_hardwired"))
	{
		maps\mp\_utility::_unsetperk("specialty_empimmune");
		maps\mp\_utility::_unsetperk("specialty_stun_resistance");
	}

	if(should_remove_alien_perk("specialty_class_toughness"))
	{
		self setviewkickscale(0.5);
	}

	if(should_remove_alien_perk("specialty_class_scavenger"))
	{
		maps\mp\_utility::_unsetperk("specialty_scavenger");
		maps\mp\_utility::_unsetperk("specialty_bulletresupply");
		maps\mp\_utility::_unsetperk("specialty_extraammo");
	}

	if(should_remove_alien_perk("specialty_class_hardline"))
	{
		maps\mp\_utility::_unsetperk("specialty_hardline");
	}

	maps\mp\_utility::_unsetperk("specialty_exo_creature");
}

//Function Number: 14
alien_extra_health_on(param_00)
{
	thread maps\mp\perks\_perkfunctions::setlightarmor();
	self.var_275 = int(self.var_275 * 3);
	self.ignoreregendelay = 1;
	self.healthregenlevel = 0.99;
	if(param_00)
	{
		self waittill("playerHealthRegen");
	}

	self notify("damage");
	maps\mp\_extrahealth::killstimfx();
}

//Function Number: 15
alien_extra_health_off()
{
	thread maps\mp\perks\_perkfunctions::unsetlightarmor();
	if(isdefined(level.var_511A))
	{
		self.var_275 = self.var_1E37 + self.hordearmor * 40;
	}
	else
	{
		self.var_275 = int(self.var_275 / 3);
	}

	if(self.health > self.var_275)
	{
		self.health = self.var_275;
	}

	self.healthregenlevel = undefined;
	maps\mp\_extrahealth::killstimfx();
}

//Function Number: 16
alien_mode_overdrive_on()
{
	if(isdefined(self.overclock_on) && self.overclock_on == 1)
	{
		thread maps\mp\_adrenaline::stopadrenaline(1);
	}

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
		self.movespeedscaler = min(level.classsettings[var_00]["speed"] + 0.25,10);
	}

	maps\mp\gametypes\_weapons::updatemovespeedscale();
	thread maps\mp\_adrenaline::killoverclockfx();
}

//Function Number: 17
alien_mode_overdrive_off()
{
	self notify("EndAdrenaline");
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
		var_00 = self getclientomnvar("ui_horde_player_class");
		self.movespeedscaler = level.classsettings[var_00]["speed"];
	}

	maps\mp\gametypes\_weapons::updatemovespeedscale();
	self.adrenaline_speed_scalar = undefined;
}

//Function Number: 18
alien_mode_exo_ping_on()
{
	if(isdefined(self.exo_ping_on) && self.exo_ping_on == 1)
	{
		thread maps\mp\_exo_ping::stop_exo_ping();
	}

	var_00 = 1;
	var_01 = 2;
	thread maps\mp\_threatdetection::detection_highlight_hud_effect(self,60 + var_00);
	while(self.map_killstreak_active)
	{
		foreach(var_03 in level.var_328)
		{
			if(!isdefined(var_03) || !isalive(var_03) || self.inliveplayerkillstreak == var_03.inliveplayerkillstreak)
			{
				continue;
			}

			var_04 = var_03;
			var_04 maps\mp\_threatdetection::addthreatevent([self],var_00 + 0.05,"PAINT_KILLSTREAK",1,0);
		}

		wait(var_00);
	}
}

//Function Number: 19
alien_mode_exo_repulsor_on()
{
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

	if(isdefined(self.repulsoractive) && self.repulsoractive == 1)
	{
		thread maps\mp\_exo_repulsor::stop_repulsor(1);
	}

	thread alien_mode_repulsor_on();
}

//Function Number: 20
alien_mode_repulsor_on()
{
	level endon("game_ended");
	self endon("stop_exo_repulsor");
	maps\mp\_exo_repulsor::exorepulsorinit();
	for(;;)
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
						var_01 delete();
					}

					self.var_7011++;
					maps\mp\gametypes\_missions::processchallenge("ch_exoability_repulser");
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

	thread maps\mp\_exo_repulsor::stop_repulsor(1);
}

//Function Number: 21
alien_mode_unlimited_ammo()
{
	self endon("notify_end_killstreak_mode");
	for(;;)
	{
		var_00 = self getcurrentweapon();
		self waittill("reload");
		self setweaponammostock(var_00,weaponstartammo(var_00));
	}
}

//Function Number: 22
alien_mode_reapply_on_death()
{
	self endon("notify_end_killstreak_mode");
	for(;;)
	{
		self waittill("death");
		disable_alien_mode();
		self waittill("spawnplayer_giveloadout");
		alien_mode_abilities(1);
		thread aud_play_respawn_squish();
		wait(0.2);
		enable_fx();
	}
}

//Function Number: 23
alien_mode_timer()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("joined_team");
	self endon("faux_spawn");
	wait(60);
}

//Function Number: 24
enable_clientfx()
{
	self method_8491("clut_mp_blackbox_ks",0.2);
}

//Function Number: 25
disable_clientfx()
{
	self method_8492(0.5);
}

//Function Number: 26
enable_fx()
{
	playfxontag(level.killstreak_chest_fx,self,"j_spine4");
	playfxontag(level.killstreak_trail_fx,self,"tag_origin");
}

//Function Number: 27
disable_fx()
{
	stopfxontag(level.killstreak_trail_fx,self,"tag_origin");
	stopfxontag(level.killstreak_chest_fx,self,"j_spine4");
}

//Function Number: 28
aud_play_respawn_squish()
{
	wait(0.5);
	self playsoundasmaster("ks_blackbox_spore_respawn");
}