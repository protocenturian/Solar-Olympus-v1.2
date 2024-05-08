extends Control
class_name PartyMember

signal data(hero, origin)

@onready var indicator = $Indicator
@onready var token = $"Player Container/HBoxContainer/Token_Art"
@onready var player = $"Player Container/HBoxContainer/VBoxContainer/Player"
@onready var stats = $"Player Container/HBoxContainer/VBoxContainer/Stats"
@export var hero_data: Hero

func init(p: Hero) -> void:
	hero_data = p

func _ready():
	set_status()
	indicator.hide()

func set_status():
	token.texture = hero_data.token_sprite
	player.get_node("Name").text = hero_data.name
	player.get_node("Name/Level").text = "Level %s" % [hero_data.level]
	player.get_node("Name/Level/EXP").value = hero_data.exp
	player.get_node("Name/Level/EXP").max_value = hero_data.req_exp
	
	stats.get_node("Status").text = "HP: %d/%d" % [hero_data.HP, hero_data.max_HP]
	stats.get_node("Status/Health").max_value = hero_data.max_HP
	stats.get_node("Status/Health").value = hero_data.HP
	stats.get_node("Status/Health/Limit").value = hero_data.limit
	stats.get_node("Status/Health/Limit").max_value = hero_data.max_limit
	send_data()
 
func send_data():
	var hero = hero_data
	var origin = self
	data.emit(hero, origin)

func _on_character_button_toggled(toggled_on):
	if toggled_on:
		var parent_node = get_parent().get_parent()
		parent_node.track_focus()
		indicator.visible = true
	else:
		indicator.visible = false


