extends TextureRect

var hero_data : Hero
var original_scene : Node

func _on_party_member_data(hero, origin):
	hero_data = hero
	original_scene = origin


func create_drag_icon() -> TextureRect:
	var icon = TextureRect.new()
	icon.size = Vector2i(62, 62)
	icon.texture = hero_data.token_sprite
	return icon

func _get_drag_data(_at_position : Vector2) -> Array:
	var drag_data = [hero_data, original_scene]
	var drag_icon = create_drag_icon()
	
	set_drag_preview(drag_icon)
	
	return drag_data
