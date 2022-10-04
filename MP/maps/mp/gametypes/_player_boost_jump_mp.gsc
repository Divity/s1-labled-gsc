/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _player_boost_jump_mp - 42917.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 214 ms
 * Timestamp: 4/20/2022 8:14:30 PM
*******************************************************************/

//Function Number: 1
boost_jump_wrapper()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	maps\mp\_utility::gameflagwait("prematch_done");
	thread play_boost_sound();
}

//Function Number: 2
play_boost_sound()
{
	self endon("death");
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	var_00 = self method_83B3();
	for(;;)
	{
		var_01 = self method_83B3();
		if(var_01)
		{
			if(var_01 != var_00)
			{
				self playrumbleonentity("damage_heavy");
				maps\mp\_utility::playsoundinspace("boost_jump_plr_mp",self.var_2E6);
			}
		}

		var_00 = var_01;
		wait(0.05);
	}
}

//Function Number: 3
playerboostjumpprecaching()
{
}