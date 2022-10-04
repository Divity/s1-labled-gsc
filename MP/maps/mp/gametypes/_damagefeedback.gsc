/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _damagefeedback - 42884.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 174 ms
 * Timestamp: 4/20/2022 8:13:46 PM
*******************************************************************/

//Function Number: 1
init()
{
}

//Function Number: 2
updatedamagefeedback(param_00,param_01)
{
	if(!isplayer(self) || !isdefined(param_00))
	{
		return;
	}

	switch(param_00)
	{
		case "scavenger":
			break;

		case "hitspecialarmor":
			break;

		case "hitjuggernaut":
		case "hitlightarmor":
		case "hitblastshield":
			break;

		case "mp_solar":
			break;

		case "laser":
			break;

		case "headshot":
			break;

		case "hitmorehealth":
			break;

		case "killshot":
			break;

		case "killshot_headshot":
			break;

		case "nosound":
			break;

		case "none":
			break;

		default:
			break;
	}
}

//Function Number: 3
setdamagefeedbackclientomnvar(param_00)
{
	var_01 = gettime();
	if(isdefined(self.damagefeedbacktime))
	{
		var_02 = self.damagefeedbacktime;
	}
	else
	{
		var_02 = 0;
	}

	if(var_01 - var_02 < 300 && self getclientomnvar("damage_feedback") == param_00)
	{
		return;
	}

	self.damagefeedbacktime = var_01;
	self setclientomnvar("damage_feedback",param_00);
}