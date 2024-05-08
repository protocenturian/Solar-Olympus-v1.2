extends Container

@onready var party_menu = get_node("Panel/HBoxContainer/Party Menu")
@onready var CharStats = get_node("Panel/HBoxContainer/Character Stats")
@onready var job_tree = get_node("Panel/HBoxContainer/Job Tree")
@onready var equipment = get_node("Panel/HBoxContainer/Equipment Page")
@onready var settings = get_node("Panel/HBoxContainer/Settings")

func _ready():
	visible = false
	settings.visible = false

func _input(event):
	if event.is_action_pressed("menu button"):
			get_tree().paused = !get_tree().paused
			visible = !visible
			ready_party_menu()

func ready_party_menu():
	party_menu.set_focus()
	_on_party_pressed()

func _on_party_pressed():
	party_menu.visible = true
	CharStats.visible = true
	job_tree.visible = true
	equipment.visible = false
	settings.visible = false
func _on_settings_pressed():
	party_menu.visible = false
	CharStats.visible = false
	job_tree.visible = false
	equipment.visible = false
	settings.visible = true
func _on_equipment_pressed():
	party_menu.visible = true
	CharStats.visible = true
	job_tree.visible = false
	equipment.visible = true
	settings.visible = false
