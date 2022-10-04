/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42832.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 30
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:18:22 PM
*******************************************************************/

//Function Number: 1
lib_A750::init()
{
	lib_A750::snd_message_init();
	lib_A750::register_common_mp_snd_messages();
	thread lib_A750::snd_mp_mix_init();
}

//Function Number: 2
lib_A750::snd_mp_mix_init()
{
	level._snd.dynamic_event_happened = 0;
	if(isdefined(level.var_328) && level.var_328.size > 0)
	{
		foreach(var_01 in level.var_328)
		{
			var_01 method_84D7("mp_init_mix");
			wait(0.05);
			var_01 method_84D7("mp_pre_event_mix");
			wait(0.05);
		}
	}
}

//Function Number: 3
lib_A750::snd_mp_mix_post_event()
{
	level._snd.dynamic_event_happened = 1;
	if(isdefined(level.var_328) && level.var_328.size > 0)
	{
		foreach(var_01 in level.var_328)
		{
			var_01 method_84D8("mp_pre_event_mix");
			wait(0.05);
			var_01 method_84D7("mp_post_event_mix");
			wait(0.05);
		}
	}
}

//Function Number: 4
lib_A750::snd_mp_player_join()
{
	self method_84D7("mp_init_mix");
	if(!isdefined(level._snd.dynamic_event_happened) || !level._snd.dynamic_event_happened)
	{
		self method_84D7("mp_pre_event_mix");
		return;
	}

	self method_84D8("mp_pre_event_mix");
	self method_84D7("mp_post_event_mix");
}

//Function Number: 5
lib_A750::snd_message_init()
{
	if(!isdefined(level._snd))
	{
		level._snd = spawnstruct();
	}

	if(!isdefined(level._snd.messages))
	{
		level._snd.messages = [];
	}
}

//Function Number: 6
lib_A750::snd_register_message(param_00,param_01)
{
	level._snd.messages[param_00] = param_01;
}

//Function Number: 7
lib_A750::snd_music_message(param_00,param_01,param_02)
{
	level notify("stop_other_music");
	level endon("stop_other_music");
	if(isdefined(param_02))
	{
		childthread lib_A750::snd_message("snd_music_handler",param_00,param_01,param_02);
		return;
	}

	if(isdefined(param_01))
	{
		childthread lib_A750::snd_message("snd_music_handler",param_00,param_01);
		return;
	}

	childthread lib_A750::snd_message("snd_music_handler",param_00);
}

//Function Number: 8
lib_A750::snd_message(param_00,param_01,param_02,param_03)
{
	if(isdefined(level._snd.messages[param_00]))
	{
		if(isdefined(param_03))
		{
			thread [[ level._snd.messages[param_00] ]](param_01,param_02,param_03);
			return;
		}

		if(isdefined(param_02))
		{
			thread [[ level._snd.messages[param_00] ]](param_01,param_02);
			return;
		}

		if(isdefined(param_01))
		{
			thread [[ level._snd.messages[param_00] ]](param_01);
			return;
		}

		thread [[ level._snd.messages[param_00] ]]();
		return;
	}
}

//Function Number: 9
lib_A750::register_common_mp_snd_messages()
{
	lib_A750::snd_register_message("mp_exo_cloak_activate",::lib_A750::mp_exo_cloak_activate);
	lib_A750::snd_register_message("mp_exo_cloak_deactivate",::lib_A750::mp_exo_cloak_deactivate);
	lib_A750::snd_register_message("mp_exo_health_activate",::lib_A750::mp_exo_health_activate);
	lib_A750::snd_register_message("mp_exo_health_deactivate",::lib_A750::mp_exo_health_deactivate);
	lib_A750::snd_register_message("mp_regular_exo_hover",::lib_A750::mp_regular_exo_hover);
	lib_A750::snd_register_message("mp_suppressed_exo_hover",::lib_A750::mp_suppressed_exo_hover);
	lib_A750::snd_register_message("mp_exo_mute_activate",::lib_A750::mp_exo_mute_activate);
	lib_A750::snd_register_message("mp_exo_mute_deactivate",::lib_A750::mp_exo_mute_deactivate);
	lib_A750::snd_register_message("mp_exo_overclock_activate",::lib_A750::mp_exo_overclock_activate);
	lib_A750::snd_register_message("mp_exo_overclock_deactivate",::lib_A750::mp_exo_overclock_deactivate);
	lib_A750::snd_register_message("mp_exo_ping_activate",::lib_A750::mp_exo_ping_activate);
	lib_A750::snd_register_message("mp_exo_ping_deactivate",::lib_A750::mp_exo_ping_deactivate);
	lib_A750::snd_register_message("mp_exo_repulsor_activate",::lib_A750::mp_exo_repulsor_activate);
	lib_A750::snd_register_message("mp_exo_repulsor_deactivate",::lib_A750::mp_exo_repulsor_deactivate);
	lib_A750::snd_register_message("mp_exo_repulsor_repel",::lib_A750::mp_exo_repulsor_repel);
	lib_A750::snd_register_message("mp_exo_shield_activate",::lib_A750::mp_exo_shield_activate);
	lib_A750::snd_register_message("mp_exo_shield_deactivate",::lib_A750::mp_exo_shield_deactivate);
	lib_A750::snd_register_message("goliath_pod_burst",::lib_A750::mp_ks_goliath_pod_burst);
	lib_A750::snd_register_message("goliath_death_explosion",::lib_A750::mp_ks_goliath_death_explosion);
	lib_A750::snd_register_message("goliath_self_destruct",::lib_A750::mp_ks_goliath_self_destruct);
	lib_A750::snd_register_message("exo_knife_player_impact",::lib_A750::mp_wpn_exo_knife_player_impact);
}

//Function Number: 10
lib_A750::mp_exo_cloak_activate()
{
	self playsoundasmaster("mp_exo_cloak_activate");
}

//Function Number: 11
lib_A750::mp_exo_cloak_deactivate()
{
	self playsoundasmaster("mp_exo_cloak_deactivate");
}

//Function Number: 12
lib_A750::mp_exo_health_activate()
{
	self playsoundasmaster("mp_exo_stim_activate");
}

//Function Number: 13
lib_A750::mp_exo_health_deactivate()
{
	self playsoundasmaster("mp_exo_stim_deactivate");
}

//Function Number: 14
lib_A750::mp_regular_exo_hover()
{
	self method_82F4("mp_exo_hover_activate");
	self method_82F4("mp_exo_hover_fuel");
	self waittill("stop_exo_hover_effects");
	self method_82F4("mp_exo_hover_deactivate");
	self method_82F5("mp_exo_hover_sup_fuel");
}

//Function Number: 15
lib_A750::mp_suppressed_exo_hover()
{
	self method_82F4("mp_exo_hover_sup_activate");
	self method_82F4("mp_exo_hover_sup_fuel");
	self waittill("stop_exo_hover_effects");
	self method_82F4("mp_exo_hover_sup_deactivate");
	self method_82F5("mp_exo_hover_sup_fuel");
}

//Function Number: 16
lib_A750::mp_exo_mute_activate()
{
	self method_82F4("mp_exo_mute_activate");
}

//Function Number: 17
lib_A750::mp_exo_mute_deactivate()
{
	self method_82F4("mp_exo_mute_deactivate");
}

//Function Number: 18
lib_A750::mp_exo_overclock_activate()
{
	self playsoundasmaster("mp_exo_overclock_activate");
}

//Function Number: 19
lib_A750::mp_exo_overclock_deactivate()
{
	self playsoundasmaster("mp_exo_overclock_deactivate");
}

//Function Number: 20
lib_A750::mp_exo_ping_activate()
{
	self method_82F4("mp_exo_ping_activate");
}

//Function Number: 21
lib_A750::mp_exo_ping_deactivate()
{
	self playsoundasmaster("mp_exo_ping_deactivate");
}

//Function Number: 22
lib_A750::mp_exo_repulsor_activate()
{
	self playsoundasmaster("mp_exo_trophy_activate");
}

//Function Number: 23
lib_A750::mp_exo_repulsor_deactivate()
{
	self playsoundasmaster("mp_exo_trophy_deactivate");
}

//Function Number: 24
lib_A750::mp_exo_repulsor_repel()
{
	playsoundatpos(self.var_2E6,"mp_exo_trophy_intercept");
}

//Function Number: 25
lib_A750::mp_exo_shield_activate()
{
	self playsoundasmaster("mp_exo_shield_activate");
}

//Function Number: 26
lib_A750::mp_exo_shield_deactivate()
{
	self playsoundasmaster("mp_exo_shield_deactivate");
}

//Function Number: 27
lib_A750::mp_wpn_exo_knife_player_impact()
{
	playsoundatpos(self.var_2E6,"wpn_combatknife_stab_npc");
}

//Function Number: 28
lib_A750::mp_ks_goliath_pod_burst()
{
	self method_82F4("goliath_suit_up_pod_burst");
}

//Function Number: 29
lib_A750::mp_ks_goliath_death_explosion()
{
	self playsoundasmaster("goliath_death_destruct");
}

//Function Number: 30
lib_A750::mp_ks_goliath_self_destruct()
{
	self playsoundasmaster("goliath_death_destruct");
}