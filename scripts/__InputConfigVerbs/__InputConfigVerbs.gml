function __InputConfigVerbs()
{
    enum INPUTS
    {
        UP,
        DOWN,
        LEFT,
        RIGHT,
		FIRE,
		DASH,
		PAUSE,
		EXITRUN,
		CONFIRM,
		MOUSECONFIRM,
		BACK,
		
		AIMUP,
		AIMDOWN,
		AIMLEFT,
		AIMRIGHT,
    }
    
    enum CLUSTERS
    {
        NAVIGATION,
		AIMING,
    }
    
    InputDefineVerb(INPUTS.UP,			"up",         "W",				  [-gp_axislv,	  gp_padu]);
    InputDefineVerb(INPUTS.DOWN,		"down",       "S",				  [ gp_axislv,	  gp_padd]);
    InputDefineVerb(INPUTS.LEFT,		"left",       "A",				  [-gp_axislh,	  gp_padl]);
    InputDefineVerb(INPUTS.RIGHT,		"right",      "D",				  [ gp_axislh,	  gp_padr]);
	InputDefineVerb(INPUTS.FIRE,		"fire",		  mb_left,			  [ gp_shoulderr, gp_shoulderrb]);
	InputDefineVerb(INPUTS.DASH,		"dash",		  vk_space,			  [ gp_shoulderl, gp_shoulderlb]);
	InputDefineVerb(INPUTS.PAUSE,		"pause",	  vk_escape,		    gp_start);
	InputDefineVerb(INPUTS.EXITRUN,		"exitrun",	  vk_space,			    gp_select);
	
	InputDefineVerb(INPUTS.AIMUP,		"aimup",	  undefined,		   -gp_axisrv);
	InputDefineVerb(INPUTS.AIMDOWN,		"aimdown",	  undefined,		    gp_axisrv);
	InputDefineVerb(INPUTS.AIMLEFT,		"aimleft",	  undefined,		   -gp_axisrh);
	InputDefineVerb(INPUTS.AIMRIGHT,	"aimright",	  undefined,		    gp_axisrh);
	
	InputDefineVerb(INPUTS.MOUSECONFIRM, "mbconfirm", mb_left,				undefined);
	
if (!INPUT_ON_SWITCH){
	InputDefineVerb(INPUTS.CONFIRM,		"confirm",	 [vk_space, mb_left],	gp_face2);
	InputDefineVerb(INPUTS.BACK,		"back",		  vk_escape,			gp_face1);
}
else{
	InputDefineVerb(INPUTS.CONFIRM,		"confirm",	 [vk_space, mb_left],	gp_face1);
	InputDefineVerb(INPUTS.BACK,		"back",		  vk_escape,			gp_face2);
}
	
    //Define a cluster of verbs for moving around
    InputDefineCluster(CLUSTERS.NAVIGATION, INPUTS.UP, INPUTS.RIGHT, INPUTS.DOWN, INPUTS.LEFT);
	InputDefineCluster(CLUSTERS.AIMING, INPUTS.AIMUP, INPUTS.AIMRIGHT, INPUTS.AIMDOWN, INPUTS.AIMLEFT);
}