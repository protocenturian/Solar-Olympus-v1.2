extends Node2D

@onready var player = $Player
@onready var tile_map : TileMap

func _ready():
	Global.load_scenes()
	load_map()
	load_player()

func load_map():
	var current_scene = get_child(0)
	var new_scene = Global.activezone.instantiate()
	call_deferred("remove_child", current_scene)
	call_deferred("add_child", new_scene)
	call_deferred("move_child", new_scene, 0)
	current_scene.queue_free()

func load_player():
	tile_map = get_tree().get_first_node_in_group("Overworld_Zones")
	var map_pos = tile_map.map_to_local(Global.player_pos)
	player.position = map_pos


func _on_player_change_map(inputs, dir, current_tile):
	tile_map = get_tree().get_first_node_in_group("Overworld_Zones")
	var current_scene = get_child(0)
	if dir == "ui_left":
		var new_scene = Global.Neighbor1.instantiate()
		var new_position : Vector2i = Vector2i(current_tile + (inputs[dir]*-19))
		Global.mapx = (Global.mapx-1)
		Global.load_scenes()
		call_deferred("remove_child", current_scene)
		call_deferred("add_child", new_scene)
		call_deferred("move_child", new_scene, 0)
		player.position = tile_map.map_to_local(new_position)
		current_scene.queue_free()
	if dir == "ui_right":
		var new_scene = Global.Neighbor2.instantiate()
		var new_position : Vector2i = Vector2i(current_tile + (inputs[dir]*-19))
		Global.mapx = (Global.mapx+1)
		Global.load_scenes()
		call_deferred("remove_child", current_scene)
		call_deferred("add_child", new_scene)
		call_deferred("move_child", new_scene, 0)
		player.position = tile_map.map_to_local(new_position)
		current_scene.queue_free()
	if dir == "ui_up":
		var new_scene = Global.Neighbor3.instantiate()
		var new_position : Vector2i = Vector2i(current_tile + (inputs[dir]*-11))
		Global.mapy = (Global.mapy-1)
		Global.load_scenes()
		call_deferred("remove_child", current_scene)
		call_deferred("add_child", new_scene)
		call_deferred("move_child", new_scene, 0)
		player.position = tile_map.map_to_local(new_position)
		current_scene.queue_free()
	if dir == "ui_down":
		var new_scene = Global.Neighbor4.instantiate()
		var new_position : Vector2i = Vector2i(current_tile + (inputs[dir]*-11))
		Global.mapy = (Global.mapy+1)
		Global.load_scenes()
		call_deferred("remove_child", current_scene)
		call_deferred("add_child", new_scene)
		call_deferred("move_child", new_scene, 0)
		player.position = tile_map.map_to_local(new_position)
		current_scene.queue_free()


func _on_player_encounter_start(target_tile):
	var encounter : Vector2i = target_tile
	



