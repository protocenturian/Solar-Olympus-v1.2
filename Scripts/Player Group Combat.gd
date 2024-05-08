extends Node2D
@export var game_party = load("res://Resources/Party_System/Player Party.tres")
@onready var Char1 = $Character1
@onready var Char2 = $Character2
@onready var Char3 = $Character3

func _ready():
	Char1.texture = game_party.heroes[0].battle_sprite
	Char2.texture = game_party.heroes[1].battle_sprite
	Char3.texture = game_party.heroes[2].battle_sprite
