class_name PartySlot
extends PanelContainer

var game_party = load("res://Resources/Party_System/Player Party.tres")

func init(cms: Vector2i) -> void:
	custom_minimum_size = cms

func _can_drop_data(_at_position, data) -> bool:
	if(data[0] is Hero):
		return true
	return false

func _drop_data(_at_position, data):
	if(data[0] is Hero):
		var a = game_party.heroes.find(data[0])
		var b = game_party.heroes.find(get_child(0).hero_data)
		var t = game_party.heroes[a]
		game_party.heroes[a] = game_party.heroes[b]
		game_party.heroes[b] = t
		var original_node = data[1]
		var new_node = get_child(0)
		new_node.hero_data = game_party.heroes[b]
		new_node.set_status()
		original_node.hero_data = game_party.heroes[a]
		original_node.set_status()
		if original_node.get_child(0).get_child(2).button_pressed:
			new_node.get_child(0).get_child(2).button_pressed = true

