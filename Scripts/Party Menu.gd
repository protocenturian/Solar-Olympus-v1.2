extends GridContainer
@export var game_party = load("res://Resources/Party_System/Player Party.tres")

signal charstat(data)

var party_size = 3
var backup_size = 2

var heroes = game_party.heroes

func _ready():
	var Active = $Party
	remove_child(Active)
	var Backup = $Backup
	remove_child(Backup)
	
	for i in party_size:
		var slot := PartySlot.new()
		slot.init(Vector2i(201, 62))
		add_child(slot)
	for i in backup_size:
		var slot := PartySlot.new()
		slot.init(Vector2i(201, 62))
		add_child(slot)
		
	for i in heroes.size():
		var hero := preload("res://Scenes/party_member.tscn").instantiate()
		hero.init(heroes[i])
		get_child(i).add_child(hero)
		
	add_child(Active,false)
	add_child(Backup,false)
	move_child(Active, 0)
	move_child(Backup, 4)

func set_focus():
	var start_focus = get_child(1).get_child(0).get_node("Player Container/Character Button")
	start_focus.button_pressed = true

func track_focus():
	var character1 = get_child(1).get_child(0).get_node("Player Container/Character Button")
	var character2 = get_child(2).get_child(0).get_node("Player Container/Character Button")
	var character3 = get_child(3).get_child(0).get_node("Player Container/Character Button")
	var character4 = get_child(5).get_child(0).get_node("Player Container/Character Button")
	var character5 = get_child(6).get_child(0).get_node("Player Container/Character Button")
	
	if character1.button_pressed:
		var data = game_party.heroes[0]
		charstat.emit(data)
	if character2.button_pressed:
		var data = game_party.heroes[1]
		charstat.emit(data)
	if character3.button_pressed:
		var data = game_party.heroes[2]
		charstat.emit(data)
	if character4.button_pressed:
		var data = game_party.heroes[3]
		charstat.emit(data)
	if character5.button_pressed:
		var data = game_party.heroes[4]
		charstat.emit(data)
