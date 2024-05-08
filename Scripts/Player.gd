extends Node2D
class_name Player

@export var world_data = load("res://Resources/World_data/Start_Game.tres")
@onready var tile_map
signal change_map(inputs, dir, current_tile)
signal encounter_start(target_tile)

var animation_speed = 4
var moving = false
var teleporting = false
var in_combat = false

var inputs = {
	'ui_up' : Vector2i.UP,
	'ui_down' : Vector2i.DOWN,
	'ui_left' : Vector2i.LEFT,
	'ui_right' : Vector2i.RIGHT
}

func _process(_delta):
	if moving:
		return
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			move(dir)

func move(dir):
	tile_map = get_tree().get_first_node_in_group("Overworld_Zones")

	var current_tile: Vector2i = tile_map.local_to_map(global_position)

	var target_tile: Vector2i = Vector2i(current_tile + inputs[dir])

	var walk_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	var int_data: TileData = tile_map.get_cell_tile_data(1, target_tile)
	
	if int_data:
		var teleport = int_data.get_custom_data("teleport")
		var encounter = int_data.get_custom_data("encounter")
		if teleport and !teleporting:
			teleporting = true
			moving = true
			change_map.emit(inputs, dir, current_tile)
			await get_tree().create_timer(0.2).timeout
			teleporting = false
			moving = false
		if encounter and !in_combat:
			in_combat = true
			moving = true
			encounter_start.emit(target_tile)
			print("in COMBAT")
			await get_tree().create_timer(0.5).timeout
			in_combat = false
			moving = false
	if walk_data and !int_data:
		var walkable = walk_data.get_custom_data("walkable")
		if walkable:
			var tween = create_tween()
			tween.tween_property(self, "position",
				tile_map.map_to_local(target_tile), 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
			world_data.player_pos = target_tile
			moving = true
			await tween.finished
			moving = false

