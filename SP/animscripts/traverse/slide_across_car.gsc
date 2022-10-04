/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: slide_across_car.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 129 ms
 * Timestamp: 4/20/2022 8:19:50 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		func_8619();
		return;
	}

	func_861A();
}

//Function Number: 2
func_861A()
{
	var_00 = [];
	var_00["traverseAnim"] = %slide_across_car;
	var_00["traverseToCoverAnim"] = %slide_across_car_2_cover;
	var_00["coverType"] = "Cover Crouch";
	var_00["traverseHeight"] = 38;
	var_00["interruptDeathAnim"][0] = animscripts\utility::func_CD8(%slide_across_car_death);
	var_00["traverseSound"] = "npc_car_slide_hood";
	var_00["traverseToCoverSound"] = "npc_car_slide_cover";
	animscripts\traverse\shared::func_2D85(var_00);
}

//Function Number: 3
func_8619()
{
	self endon("killanimscript");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	self method_8142(%animscript_root,0.1);
	self method_8113("traverse",level.dogtraverseanims["jump_up_40"],1,0.1,1);
	animscripts\shared::func_2D05("traverse");
	thread common_scripts\utility::play_sound_in_space("anml_dog_bark",self gettagorigin("tag_eye"));
	self method_8142(%animscript_root,0);
	self method_8113("traverse",level.dogtraverseanims["jump_down_40"],1,0,1);
	animscripts\shared::func_2D05("traverse");
	self method_818D("gravity");
}