/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _healthoverlay - 42895.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 499 ms
 * Timestamp: 4/20/2022 8:14:06 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.healthoverlaycutoff = 0.55;
	var_00 = 5;
	var_00 = maps\mp\gametypes\_tweakables::gettweakablevalue("player","healthregentime");
	level.playerhealth_regularregendelay = var_00 * 1000;
	level.healthregendisabled = level.playerhealth_regularregendelay <= 0;
	level thread onplayerconnect();
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread onplayerspawned();
	}
}

//Function Number: 3
onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		thread playerhealthregen();
	}
}

//Function Number: 4
playerhealthregen()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	self endon("goliath_equipped");
	self endon("faux_spawn");
	level endon("game_ended");
	if(self.health <= 0)
	{
		return;
	}

	var_00 = 0;
	var_01 = 0;
	thread playerpainbreathingsound();
	self notify("playerHealthRegen");
	for(;;)
	{
		self waittill("damage",var_02,var_03,var_04,var_05,var_06);
		if(self.health <= 0)
		{
			return;
		}

		var_01 = gettime();
		var_07 = self.health / self.var_275;
		if(!isdefined(self.healthregenlevel))
		{
			self.var_72D1 = 1;
		}
		else if(self.healthregenlevel == 0.33)
		{
			self.var_72D1 = 0.75;
		}
		else if(self.healthregenlevel == 0.66)
		{
			self.var_72D1 = 0.5;
		}
		else if(self.healthregenlevel == 0.99)
		{
			self.var_72D1 = 0.3;
		}
		else
		{
			self.var_72D1 = 1;
		}

		if(var_07 <= level.healthoverlaycutoff)
		{
			self.var_D82 = 1;
		}

		thread healthregeneration(var_01,var_07);
		thread breathingmanager(var_01,var_07,var_02,var_06);
	}
}

//Function Number: 5
breathingmanager(param_00,param_01,param_02,param_03)
{
	self notify("breathingManager");
	self endon("breathingManager");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	level endon("game_ended");
	if(maps\mp\_utility::isusingremote() || maps\mp\_utility::isinremotetransition())
	{
		return;
	}

	if(!isplayer(self))
	{
		return;
	}

	if((isdefined(param_03) && param_03 != "MOD_FALLING") || isdefined(param_02) && param_02 > 1)
	{
		playdamagesound(param_00);
	}

	if(isdefined(level.iszombiegame) && level.iszombiegame)
	{
		return;
	}

	self.var_17E6 = param_00 + 3000 * self.var_72D1;
	wait(7 * self.var_72D1);
	if(!level.gameended && isdefined(self.var_D82) && self.var_D82 == 1)
	{
		if(!maps\mp\killstreaks\_juggernaut::get_is_in_mech())
		{
			if(self method_843A())
			{
				self method_82F4("deaths_door_exit_female");
			}
			else
			{
				self method_82F4("deaths_door_exit");
			}
		}

		self.var_D82 = 0;
	}
}

//Function Number: 6
playdamagesound(param_00)
{
	if(isdefined(level.customplaydamagesound))
	{
		self thread [[ level.customplaydamagesound ]](param_00);
		return;
	}

	if(isdefined(self.damage_sound_time) && self.damage_sound_time + 5000 > param_00)
	{
		return;
	}

	self.damage_sound_time = param_00;
	var_01 = randomintrange(1,8);
	if(!maps\mp\killstreaks\_juggernaut::get_is_in_mech())
	{
		if(self.inliveplayerkillstreak == "axis")
		{
			if(self method_843A())
			{
				self playsoundasmaster("generic_pain_enemy_fm_" + var_01);
				return;
			}

			self playsoundasmaster("generic_pain_enemy_" + var_01);
			return;
		}

		if(self method_843A())
		{
			self playsoundasmaster("generic_pain_friendly_fm_" + var_01);
			return;
		}

		self playsoundasmaster("generic_pain_friendly_" + var_01);
		return;
	}
}

//Function Number: 7
healthregeneration(param_00,param_01)
{
	self notify("healthRegeneration");
	self endon("healthRegeneration");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	self endon("goliath_equipped");
	level endon("game_ended");
	if(level.healthregendisabled)
	{
		return;
	}

	if(!isdefined(self.ignoreregendelay))
	{
		self.ignoreregendelay = 0;
	}

	if(self.ignoreregendelay == 0)
	{
		wait(level.playerhealth_regularregendelay / 1000 * self.var_72D1);
	}
	else
	{
		self.ignoreregendelay = 0;
	}

	if(param_01 < 0.55)
	{
		var_02 = 1;
	}
	else
	{
		var_02 = 0;
	}

	for(;;)
	{
		if(self.var_72D1 == 0.75)
		{
			wait(0.2);
			if(self.health < self.var_275)
			{
				self.health = self.health + 5;
			}
			else
			{
				break;
			}
		}
		else if(self.var_72D1 == 0.5)
		{
			wait(0.05);
			if(self.health < self.var_275)
			{
				self.health = self.health + 2;
			}
			else
			{
				break;
			}
		}
		else if(self.var_72D1 == 0.3)
		{
			wait(0.15);
			if(self.health < self.var_275)
			{
				self.health = self.health + 40;
			}
			else
			{
				break;
			}
		}
		else if(!isdefined(self.var_72D1) || self.var_72D1 == 1)
		{
			wait(0.05);
			if(self.health < self.var_275)
			{
				self.health = self.health + 1;
				param_01 = self.health / self.var_275;
			}
			else
			{
				break;
			}
		}

		if(self.health > self.var_275)
		{
			self.health = self.var_275;
		}
	}

	maps\mp\gametypes\_damage::resetattackerlist();
	if(var_02)
	{
		maps\mp\gametypes\_missions::healthregenerated();
	}
}

//Function Number: 8
wait_for_not_using_remote()
{
	self notify("waiting_to_stop_remote");
	self endon("waiting_to_stop_remote");
	self endon("death");
	level endon("game_ended");
	self waittill("stopped_using_remote");
	maps\mp\_utility::revertvisionsetforplayer(0);
}

//Function Number: 9
playerpainbreathingsound()
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	if(getdvarint("virtuallobbyactive",0))
	{
		return;
	}

	if(!isplayer(self))
	{
		return;
	}

	if(isdefined(level.iszombiegame) && level.iszombiegame)
	{
		return;
	}

	wait(3);
	for(;;)
	{
		wait(0.2);
		if(self.health <= 0)
		{
			return;
		}

		if(self.health >= self.var_275 * 0.55)
		{
			continue;
		}

		if(level.healthregendisabled && gettime() > self.var_17E6)
		{
			continue;
		}

		if(maps\mp\_utility::isusingremote() || maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(!maps\mp\killstreaks\_juggernaut::get_is_in_mech())
		{
			if(self method_843A())
			{
				self method_82F4("deaths_door_mp_female");
			}
			else
			{
				self method_82F4("deaths_door_mp_male");
			}
		}

		wait(1.284);
		wait(0.1 + randomfloat(0.8));
	}
}