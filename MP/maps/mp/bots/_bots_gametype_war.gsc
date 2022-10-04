/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _bots_gametype_war.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 212 ms
 * Timestamp: 4/20/2022 8:13:11 PM
*******************************************************************/

//Function Number: 1
main()
{
	setup_callbacks();
	setup_bot_war();
}

//Function Number: 2
setup_callbacks()
{
	level.bot_funcs["gametype_think"] = ::bot_war_think;
}

//Function Number: 3
setup_bot_war()
{
}

//Function Number: 4
bot_war_think()
{
	self notify("bot_war_think");
	self endon("bot_war_think");
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self endon("owner_disconnect");
	for(;;)
	{
		self [[ self.personality_update_function ]]();
		wait(0.05);
	}
}