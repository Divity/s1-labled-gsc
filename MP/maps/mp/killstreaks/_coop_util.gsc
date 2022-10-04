/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _coop_util - 42939.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 31
 * Decompile Time: 1672 ms
 * Timestamp: 4/20/2022 8:15:59 PM
*******************************************************************/

//Function Number: 1
init()
{
	if(!level.teambased)
	{
		return;
	}

	level.streaksupportqueueallies = [];
	level.streaksupportqueueaxis = [];
	level.streaksuppordisabledcount = [];
	setdvar("scr_coop_util_delay","1");
}

//Function Number: 2
promptforstreaksupport(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!level.teambased)
	{
		return;
	}

	var_07 = (0,0,0);
	if(isdefined(param_05))
	{
		var_07 = param_05.var_2E6;
	}

	var_08 = spawn("script_model",var_07);
	var_08 hide();
	var_08.inliveplayerkillstreak = param_00;
	var_08.needsupportvo = param_03;
	var_08.buddyjoinedvo = param_04;
	var_08.streakplayer = param_05;
	var_08.joinedvo = param_06;
	var_08.jointext = param_01;
	var_08.splashref = param_02;
	var_08.active = 0;
	var_08.promptid = getuniquestreakpromptid();
	if(isdefined(param_05))
	{
		var_08 disableplayeruse(param_05);
	}

	addstreaksupportprompt(var_08);
	return var_08.promptid;
}

//Function Number: 3
stoppromptforstreaksupport(param_00)
{
	if(!level.teambased)
	{
		return;
	}

	foreach(var_02 in level.streaksupportqueueallies)
	{
		if(var_02.promptid == param_00)
		{
			thread removestreaksupportprompt(var_02);
			return;
		}
	}

	foreach(var_02 in level.streaksupportqueueaxis)
	{
		if(var_02.promptid == param_00)
		{
			thread removestreaksupportprompt(var_02);
			return;
		}
	}
}

//Function Number: 4
waittillbuddyjoinedstreak(param_00)
{
	for(;;)
	{
		level waittill("buddyJoinedStreak",var_01,var_02);
		if(var_02 == param_00)
		{
			return var_01;
		}
	}
}

//Function Number: 5
playersetupcoopstreak(param_00)
{
	playersetupcoopstreakinternal(param_00);
}

//Function Number: 6
playerresetaftercoopstreak()
{
	playerresetaftercoopstreakinternal();
}

//Function Number: 7
playerstoppromptforstreaksupport()
{
	if(!level.teambased)
	{
		return;
	}

	if(!isdefined(level.streaksuppordisabledcount[self.assistedsuicide]))
	{
		level.streaksuppordisabledcount[self.assistedsuicide] = 0;
	}

	level.streaksuppordisabledcount[self.assistedsuicide]++;
	if(level.streaksuppordisabledcount[self.assistedsuicide] > 1)
	{
		return;
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		foreach(var_01 in level.streaksupportqueueallies)
		{
			var_01 disableplayeruse(self);
		}

		return;
	}

	foreach(var_01 in level.streaksupportqueueaxis)
	{
		var_01 disableplayeruse(self);
	}
}

//Function Number: 8
playerstartpromptforstreaksupport()
{
	if(!level.teambased)
	{
		return;
	}

	level.streaksuppordisabledcount[self.assistedsuicide]--;
	if(level.streaksuppordisabledcount[self.assistedsuicide] > 0)
	{
		return;
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		foreach(var_01 in level.streaksupportqueueallies)
		{
			if(self != var_01.streakplayer)
			{
				var_01 enableplayeruse(self);
			}
		}

		return;
	}

	foreach(var_01 in level.streaksupportqueueaxis)
	{
		if(self != var_01.streakplayer)
		{
			var_01 enableplayeruse(self);
		}
	}
}

//Function Number: 9
addstreaksupportprompt(param_00)
{
	if(param_00.inliveplayerkillstreak == "allies")
	{
		level.streaksupportqueueallies[level.streaksupportqueueallies.size] = param_00;
		if(level.streaksupportqueueallies.size == 1)
		{
			level thread startstreaksupportprompt(param_00);
			return;
		}

		return;
	}

	level.streaksupportqueueaxis[level.streaksupportqueueaxis.size] = param_00;
	if(level.streaksupportqueueaxis.size == 1)
	{
		level thread startstreaksupportprompt(param_00);
	}
}

//Function Number: 10
removestreaksupportprompt(param_00)
{
	var_01 = param_00.active;
	param_00.active = 0;
	param_00 notify("streakPromptStopped");
	if(param_00.inliveplayerkillstreak == "allies")
	{
		level.streaksupportqueueallies = common_scripts\utility::array_remove(level.streaksupportqueueallies,param_00);
		if(var_01 && level.streaksupportqueueallies.size > 0)
		{
			level thread startstreaksupportprompt(level.streaksupportqueueallies[0]);
		}
	}
	else
	{
		level.streaksupportqueueaxis = common_scripts\utility::array_remove(level.streaksupportqueueaxis,param_00);
		if(var_01 && level.streaksupportqueueaxis.size > 0)
		{
			level thread startstreaksupportprompt(level.streaksupportqueueaxis[0]);
		}
	}

	thread delaydeleteprompt(param_00);
}

//Function Number: 11
delaydeleteprompt(param_00)
{
	wait(1);
	param_00 delete();
}

//Function Number: 12
getuniquestreakpromptid(param_00)
{
	var_01 = 0;
	foreach(var_03 in level.streaksupportqueueallies)
	{
		if(var_03.promptid >= var_01)
		{
			var_01 = var_03.promptid + 1;
		}
	}

	foreach(var_03 in level.streaksupportqueueaxis)
	{
		if(var_03.promptid >= var_01)
		{
			var_01 = var_03.promptid + 1;
		}
	}

	return var_01;
}

//Function Number: 13
startstreaksupportprompt(param_00)
{
	param_00.active = 1;
	level thread handleprompt(param_00);
	level thread onconnectprompt(param_00);
	foreach(var_02 in level.var_328)
	{
		if(isdefined(param_00.streakplayer) && var_02 == param_00.streakplayer)
		{
			continue;
		}

		if(maps\mp\_utility::isreallyalive(var_02) && var_02.inliveplayerkillstreak == param_00.inliveplayerkillstreak)
		{
			var_02 thread playersetupstreakprompt(param_00);
		}

		var_02 thread playeronspawnprompt(param_00);
	}
}

//Function Number: 14
onconnectprompt(param_00)
{
	level endon("game_ended");
	param_00 endon("streakPromptStopped");
	for(;;)
	{
		level waittill("connected",var_01);
		var_01 thread playeronspawnprompt(param_00);
	}
}

//Function Number: 15
playeronspawnprompt(param_00)
{
	level endon("game_ended");
	self endon("disconnect");
	param_00 endon("streakPromptStopped");
	for(;;)
	{
		self waittill("spawned_player");
		if(self.inliveplayerkillstreak == param_00.inliveplayerkillstreak)
		{
			thread playersetupstreakprompt(param_00);
		}
	}
}

//Function Number: 16
playersetupstreakprompt(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	param_00 endon("streakPromptStopped");
	while(maps\mp\_utility::isusingremote() || maps\mp\_utility::isinremotetransition())
	{
		wait 0.05;
	}

	playerdisabledwait(param_00);
	thread playerdisplayjoinrequest(param_00);
	thread playertakestreaksupportinput(param_00);
}

//Function Number: 17
playerdisabledwait(param_00)
{
	if(!isdefined(level.streaksuppordisabledcount[self.assistedsuicide]))
	{
		return;
	}

	if(level.streaksuppordisabledcount[self.assistedsuicide] > 0)
	{
		param_00 disableplayeruse(self);
		while(level.streaksuppordisabledcount[self.assistedsuicide] > 0)
		{
			wait 0.05;
		}
	}
}

//Function Number: 18
playerdisplayjoinrequest(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	param_00 endon("streakPromptStopped");
	if(isdefined(param_00.splashref))
	{
		thread maps\mp\gametypes\_hud_message::coopkillstreaksplashnotify(param_00.splashref,param_00.needsupportvo);
	}
}

//Function Number: 19
waittillplayercanbebuddy(param_00,param_01)
{
	if(maps\mp\_utility::isinremotetransition())
	{
		param_00 maps\mp\killstreaks\_killstreaks::playerwaittillridekillstreakcomplete();
	}

	wait 0.05;
	if(maps\mp\_utility::isusingremote())
	{
		param_00 waittill("stopped_using_remote");
	}
}

//Function Number: 20
waittillpromptactivated(param_00)
{
	param_00 endon("streakPromptStopped");
	param_00 waittill("trigger");
	return 1;
}

//Function Number: 21
playertakestreaksupportinput(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		waittillplayercanbebuddy(self);
		var_01 = waittillpromptactivated(param_00);
		if(!isdefined(var_01))
		{
			return;
		}

		if(!param_00.active)
		{
			return;
		}

		if(isdefined(self method_84C5()) && self method_84C5() == param_00 && self usebuttonpressed() && self isonground())
		{
			var_02 = playergetusetime();
			var_01 = playerhandlejoining(param_00,var_02);
			if(var_01 || !param_00.active)
			{
				return;
			}
		}
	}
}

//Function Number: 22
playergetusetime()
{
	if(getdvarint("scr_coop_util_delay",1) == 0)
	{
		return 1.25;
	}

	var_00 = self.score;
	var_01 = self.score;
	for(var_02 = 1;var_02 < level.var_328.size;var_02++)
	{
		var_03 = level.var_328[var_02];
		if(var_03.inliveplayerkillstreak != self.inliveplayerkillstreak)
		{
			continue;
		}

		if(var_03.score > var_01)
		{
			var_01 = var_03.score;
			continue;
		}

		if(var_03.score < var_00)
		{
			var_00 = var_03.score;
		}
	}

	var_04 = var_01 - var_00;
	if(var_04 == 0)
	{
		return 1.25;
	}

	var_05 = self.score - var_00 / var_04;
	var_06 = 1.25;
	var_07 = 1.25 + var_05 * var_06;
	return var_07;
}

//Function Number: 23
handleprompt(param_00)
{
	param_00 maps\mp\_utility::makegloballyusablebytype("coopStreakPrompt",param_00.jointext,undefined,param_00.inliveplayerkillstreak);
	param_00 waittill("streakPromptStopped");
	param_00 maps\mp\_utility::makegloballyunusablebytype();
}

//Function Number: 24
playerhandlejoining(param_00,param_01)
{
	var_02 = param_01 * 1000;
	if(param_00 useholdthink(self,var_02,param_00))
	{
		level notify("buddyJoinedStreak",self,param_00.promptid);
		thread maps\mp\_events::killstreakjoinevent();
		if(isdefined(param_00.streakplayer) && isalive(param_00.streakplayer))
		{
			if(isdefined(param_00.joinedvo))
			{
				thread maps\mp\_utility::leaderdialogonplayer(param_00.joinedvo);
			}

			if(isdefined(param_00.buddyjoinedvo))
			{
				param_00.streakplayer thread maps\mp\_utility::leaderdialogonplayer(param_00.buddyjoinedvo);
			}

			if(isdefined(param_00.streakplayer.var_2517))
			{
				setmatchdata("killstreaks",param_00.streakplayer.var_2517,"coopPlayerIndex",self.clientid);
			}
		}

		param_00 notify("streakPromptStopped");
		return 1;
	}

	return 0;
}

//Function Number: 25
useholdthink(param_00,param_01,param_02)
{
	param_00 playerlinkto(param_02);
	param_00 playerlinkedoffsetenable();
	param_00.manuallyjoiningkillstreak = 1;
	thread useholdthinkcleanuponplayerdeath(param_00);
	self.curprogress = 0;
	self.inuse = 1;
	self.userate = 0;
	self.var_9C11 = param_01;
	if(isdefined(param_00.inwater))
	{
		param_00 method_8119(0);
		param_00 method_811A(0);
	}

	param_00 maps\mp\_utility::_giveweapon("killstreak_remote_turret_mp");
	param_00 switchtoweapon("killstreak_remote_turret_mp");
	param_00 disableweaponswitch();
	param_00 thread personalusebar(self,param_02);
	var_03 = useholdthinkloop(param_00,param_02);
	if(!isdefined(var_03))
	{
		var_03 = 0;
	}

	if(isalive(param_00) && !var_03)
	{
		param_00 playerresetaftercoopstreakinternal();
	}

	self.inuse = 0;
	self.curprogress = 0;
	if(isdefined(param_00))
	{
		param_00.manuallyjoiningkillstreak = 0;
		param_00 setclientomnvar("ui_use_bar_text",0);
		param_00 setclientomnvar("ui_use_bar_end_time",0);
		param_00 setclientomnvar("ui_use_bar_start_time",0);
	}

	self notify("coopUtilUseHoldThinkComplete");
	return var_03;
}

//Function Number: 26
useholdthinkcleanuponplayerdeath(param_00)
{
	self endon("coopUtilUseHoldThinkComplete");
	param_00 common_scripts\utility::waittill_any("death","disconnect");
	if(isdefined(param_00))
	{
		param_00 playerresetaftercoopstreakinternal();
		param_00.manuallyjoiningkillstreak = 0;
		param_00 setclientomnvar("ui_use_bar_text",0);
		param_00 setclientomnvar("ui_use_bar_end_time",0);
		param_00 setclientomnvar("ui_use_bar_start_time",0);
	}
}

//Function Number: 27
playerresetaftercoopstreakinternal()
{
	maps\mp\killstreaks\_killstreaks::takekillstreakweaponifnodupe("killstreak_predator_missile_mp");
	maps\mp\killstreaks\_killstreaks::takekillstreakweaponifnodupe("killstreak_remote_turret_mp");
	self method_8119(1);
	self method_811A(1);
	self enableweaponswitch();
	self switchtoweapon(common_scripts\utility::getlastweapon());
	thread playerdelaycontrol();
	self unlink();
}

//Function Number: 28
playersetupcoopstreakinternal(param_00)
{
	if(isdefined(param_00))
	{
		wait(param_00);
	}

	self enableweaponswitch();
	maps\mp\_utility::_giveweapon("killstreak_predator_missile_mp");
	self switchtoweaponimmediate("killstreak_predator_missile_mp");
	maps\mp\killstreaks\_killstreaks::takekillstreakweaponifnodupe("killstreak_remote_turret_mp");
	self disableweaponswitch();
}

//Function Number: 29
playerdelaycontrol()
{
	self endon("disconnect");
	maps\mp\_utility::freezecontrolswrapper(1);
	wait(0.5);
	maps\mp\_utility::freezecontrolswrapper(0);
}

//Function Number: 30
personalusebar(param_00,param_01)
{
	self endon("disconnect");
	param_01 endon("streakPromptStopped");
	self setclientomnvar("ui_use_bar_text",2);
	self setclientomnvar("ui_use_bar_start_time",int(gettime()));
	var_02 = -1;
	while(maps\mp\_utility::isreallyalive(self) && isdefined(param_00) && param_00.inuse && !level.gameended)
	{
		if(var_02 != param_00.userate)
		{
			if(param_00.curprogress > param_00.var_9C11)
			{
				param_00.curprogress = param_00.var_9C11;
			}

			if(param_00.userate > 0)
			{
				var_03 = gettime();
				var_04 = param_00.curprogress / param_00.var_9C11;
				var_05 = var_03 + 1 - var_04 * param_00.var_9C11 / param_00.userate;
				self setclientomnvar("ui_use_bar_end_time",int(var_05));
			}

			var_02 = param_00.userate;
		}

		wait(0.05);
	}

	self setclientomnvar("ui_use_bar_end_time",0);
}

//Function Number: 31
useholdthinkloop(param_00,param_01)
{
	param_01 endon("streakPromptStopped");
	while(!level.gameended && isdefined(self) && maps\mp\_utility::isreallyalive(param_00) && param_00 usebuttonpressed() && self.curprogress < self.var_9C11)
	{
		self.curprogress = self.curprogress + 50 * self.userate;
		if(isdefined(self.exocount))
		{
			self.userate = 1 * self.exocount;
		}
		else
		{
			self.userate = 1;
		}

		if(self.curprogress >= self.var_9C11)
		{
			return maps\mp\_utility::isreallyalive(param_00);
		}

		wait(0.05);
	}

	return 0;
}