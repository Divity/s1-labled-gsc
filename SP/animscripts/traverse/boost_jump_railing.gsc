/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: boost_jump_railing.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 97 ms
 * Timestamp: 4/20/2022 8:19:34 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.var_98)
	{
		var_00 = self getnegotiationstartnode();
		switch(var_00.var_39B)
		{
			case "boost_jump_128_across_128_down_32_railing":
				break;

			case "boost_jump_128_across_140_down_32_railing":
				break;

			case "boost_jump_128_across_196_down_32_railing":
				break;

			case "boost_jump_128_across_256_down_32_railing":
				break;

			case "boost_jump_256_across_128_down_32_railing":
				break;

			case "boost_jump_256_across_140_down_32_railing":
				break;

			case "boost_jump_256_across_196_down_32_railing":
				break;

			case "boost_jump_256_across_256_down_32_railing":
				break;

			case "boost_jump_128_across_128_up_32_railing":
				break;

			case "boost_jump_128_across_140_up_32_railing":
				break;

			case "boost_jump_128_across_196_up_32_railing":
				break;

			case "boost_jump_128_across_256_up_32_railing":
				break;

			case "boost_jump_256_across_128_up_32_railing":
				break;

			case "boost_jump_256_across_140_up_32_railing":
				break;

			case "boost_jump_256_across_196_up_32_railing":
				break;

			case "boost_jump_256_across_256_up_32_railing":
				break;

			default:
				break;
		}
	}
}

//Function Number: 2
func_7570(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 32;
	}

	var_03 = [];
	var_03["traverseAnim"] = param_00;
	var_03["traverseNotetrackFunc"] = ::animscripts\traverse\boost::func_60AE;
	var_03["traverseHeight"] = 32;
	animscripts\traverse\shared::func_2D85(var_03);
	if(isdefined(self) && isalive(self) && isdefined(param_01) && param_01)
	{
		lib_A5DE::snd_message("boost_land_npc");
		self method_8110("boostJumpLand",%boost_jump_land_2_run_b,%body,1,0.2,1);
		animscripts\shared::func_2D05("boostJumpLand",::animscripts\traverse\boost::func_60AE);
	}
}