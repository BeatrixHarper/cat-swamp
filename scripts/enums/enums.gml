function enums(){
	#macro anim_end ((image_index + image_speed) >= image_number || (image_index + image_speed) < 0)
	
	enum move { right, up, left, down, };
	enum tm { player, enemy, };
	enum dashinput { double, space };
}