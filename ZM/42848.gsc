/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42848.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 7 ms
 * Timestamp: 4/20/2022 8:24:12 PM
*******************************************************************/

//Function Number: 1
lib_A760::init()
{
	var_00 = [];
	var_01 = getentarray("zipline","targetname");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = maps\mp\gametypes\_gameobjects::createuseobject("neutral",var_01[var_02],var_00,(0,0,0));
		var_03 maps\mp\gametypes\_gameobjects::allowuse("any");
		var_03 maps\mp\gametypes\_gameobjects::setusetime(0.25);
		var_03 maps\mp\gametypes\_gameobjects::setusetext(&"MP_ZIPLINE_USE");
		var_03 maps\mp\gametypes\_gameobjects::setusehinttext(&"MP_ZIPLINE_USE");
		var_03 maps\mp\gametypes\_gameobjects::setvisibleteam("any");
		var_03.onbeginuse = ::lib_A760::onbeginuse;
		var_03.onuse = ::lib_A760::onuse;
		var_04 = [];
		var_05 = getent(var_01[var_02].target,"targetname");
		if(!isdefined(var_05))
		{
		}

		while(isdefined(var_05))
		{
			var_04[var_04.size] = var_05;
			if(isdefined(var_05.target))
			{
				var_05 = getent(var_05.target,"targetname");
				continue;
			}

			break;
		}

		var_03.targets = var_04;
	}

	precachemodel("tag_player");
	lib_A760::init_elevator();
}

//Function Number: 2
lib_A760::onbeginuse(param_00)
{
	param_00 playsoundasmaster("scrambler_pullout_lift_plr");
}

//Function Number: 3
lib_A760::onuse(param_00)
{
	param_00 thread lib_A760::zip(self);
}

//Function Number: 4
lib_A760::zip(param_00)
{
	self endon("death");
	self endon("disconnect");
	self endon("zipline_drop");
	level endon("game_ended");
	var_01 = spawn("script_origin",param_00.trigger.var_2E6);
	var_01.var_2E6 = param_00.trigger.var_2E6;
	var_01.var_41 = self.var_41;
	var_01 setmodel("tag_player");
	self playerlinktodelta(var_01,"tag_player",1,180,180,180,180);
	thread lib_A760::watchdeath(var_01);
	thread lib_A760::watchdrop(var_01);
	var_02 = param_00.targets;
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = distance(var_01.var_2E6,var_02[var_03].var_2E6) / 600;
		var_05 = 0;
		if(var_03 == 0)
		{
			var_05 = var_04 * 0.2;
		}

		var_01 moveto(var_02[var_03].var_2E6,var_04,var_05);
		if(var_01.var_41 != var_02[var_03].var_41)
		{
			var_01 rotateto(var_02[var_03].var_41,var_04 * 0.8);
		}

		wait(var_04);
	}

	self notify("destination");
	self unlink();
	var_01 delete();
}

//Function Number: 5
lib_A760::watchdrop(param_00)
{
	self endon("death");
	self endon("disconnect");
	self endon("destination");
	level endon("game_ended");
	self notifyonplayercommand("zipline_drop","+gostand");
	self waittill("zipline_drop");
	self unlink();
	param_00 delete();
}

//Function Number: 6
lib_A760::watchdeath(param_00)
{
	self endon("disconnect");
	self endon("destination");
	self endon("zipline_drop");
	level endon("game_ended");
	self waittill("death");
	self unlink();
	param_00 delete();
}

//Function Number: 7
lib_A760::init_elevator()
{
	var_00 = [];
	var_01 = getentarray("elevator_button","targetname");
	level.elevator = spawnstruct();
	level.elevator.location = "floor1";
	level.elevator.states = [];
	level.elevator.states["elevator"] = "closed";
	level.elevator.destinations = [];
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = maps\mp\gametypes\_gameobjects::createuseobject("neutral",var_01[var_02],var_00,(0,0,0));
		var_03 maps\mp\gametypes\_gameobjects::allowuse("any");
		var_03 maps\mp\gametypes\_gameobjects::setusetime(0.25);
		var_03 maps\mp\gametypes\_gameobjects::setusetext(&"MP_ZIPLINE_USE");
		var_03 maps\mp\gametypes\_gameobjects::setusehinttext(&"MP_ZIPLINE_USE");
		var_03 maps\mp\gametypes\_gameobjects::setvisibleteam("any");
		var_03.onbeginuse = ::lib_A760::onbeginuse_elevator;
		var_03.onuse = ::lib_A760::onuse_elevator;
		var_03.location = var_01[var_02].script_label;
		level.elevator.states[var_01[var_02].script_label] = "closed";
		if(isdefined(var_01[var_02].target))
		{
			var_04 = common_scripts\utility::getstruct(var_01[var_02].target,"targetname");
			if(isdefined(var_04))
			{
				level.elevator.destinations[var_01[var_02].script_label] = var_04;
			}
		}
	}
}

//Function Number: 8
lib_A760::onbeginuse_elevator(param_00)
{
}

//Function Number: 9
lib_A760::onuse_elevator(param_00)
{
	switch(self.location)
	{
		case "floor1":
			break;

		case "floor2":
			break;

		case "elevator":
			break;
	}
}

//Function Number: 10
lib_A760::open(param_00)
{
	level.elevator.states[param_00] = "opening";
	var_01 = getent("e_door_" + param_00 + "_left","targetname");
	var_02 = getent("e_door_" + param_00 + "_right","targetname");
	if(isdefined(var_01.var_39B) && var_01.var_39B == "fahrenheit")
	{
		var_01 moveto(var_01.var_2E6 - anglestoforward(var_01.var_41) * 35,2);
		var_02 moveto(var_02.var_2E6 + anglestoforward(var_02.var_41) * 35,2);
		var_01 playsoundasmaster("elev_door_open");
	}
	else
	{
		var_01 moveto(var_01.var_2E6 - anglestoright(var_01.var_41) * 35,2);
		var_02 moveto(var_02.var_2E6 + anglestoright(var_02.var_41) * 35,2);
	}

	wait(2);
	level.elevator.states[param_00] = "opened";
	if(param_00 == "elevator")
	{
		level thread lib_A760::autoclose();
	}
}

//Function Number: 11
lib_A760::close(param_00)
{
	level.elevator.states[param_00] = "closing";
	var_01 = getent("e_door_" + param_00 + "_left","targetname");
	var_02 = getent("e_door_" + param_00 + "_right","targetname");
	if(isdefined(var_01.var_39B) && var_01.var_39B == "fahrenheit")
	{
		var_01 moveto(var_01.var_2E6 + anglestoforward(var_01.var_41) * 35,2);
		var_02 moveto(var_02.var_2E6 - anglestoforward(var_02.var_41) * 35,2);
		var_01 playsoundasmaster("elev_door_close");
	}
	else
	{
		var_01 moveto(var_01.var_2E6 + anglestoright(var_01.var_41) * 35,2);
		var_02 moveto(var_02.var_2E6 - anglestoright(var_02.var_41) * 35,2);
	}

	wait(2);
	level.elevator.states[param_00] = "closed";
}

//Function Number: 12
lib_A760::autoclose()
{
	level endon("stop_autoClose");
	wait(10);
	level thread lib_A760::close(level.elevator.location);
	level thread lib_A760::close("elevator");
}

//Function Number: 13
lib_A760::move()
{
	level.elevator.states["elevator"] = "moving";
	var_00 = getent("e_door_elevator_left","targetname");
	var_01 = getent("e_door_elevator_right","targetname");
	var_02 = getent("elevator","targetname");
	if(level.elevator.location == "floor1")
	{
		level.elevator.location = "floor2";
		var_03 = var_00.var_2E6[2] - level.elevator.destinations["floor1"].var_2E6[2];
		var_00 moveto((var_00.var_2E6[0],var_00.var_2E6[1],level.elevator.destinations["floor2"].var_2E6[2] + var_03),5);
		var_03 = var_01.var_2E6[2] - level.elevator.destinations["floor1"].var_2E6[2];
		var_01 moveto((var_01.var_2E6[0],var_01.var_2E6[1],level.elevator.destinations["floor2"].var_2E6[2] + var_03),5);
		var_02 moveto(level.elevator.destinations["floor2"].var_2E6,5);
	}
	else
	{
		level.elevator.location = "floor1";
		var_03 = var_01.var_2E6[2] - level.elevator.destinations["floor2"].var_2E6[2];
		var_00 moveto((var_00.var_2E6[0],var_00.var_2E6[1],level.elevator.destinations["floor1"].var_2E6[2] + var_03),5);
		var_03 = var_01.var_2E6[2] - level.elevator.destinations["floor2"].var_2E6[2];
		var_01 moveto((var_01.var_2E6[0],var_01.var_2E6[1],level.elevator.destinations["floor1"].var_2E6[2] + var_03),5);
		var_02 moveto(level.elevator.destinations["floor1"].var_2E6,5);
	}

	wait(5);
	var_02 playsoundasmaster("elev_bell_ding");
	level.elevator.states["elevator"] = "closed";
}