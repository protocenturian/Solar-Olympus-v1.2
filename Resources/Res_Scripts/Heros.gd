extends Resource
class_name Hero

@export var name : String
@export var job : String
#Leveling
@export var level : int
@export var exp : int
@export var req_exp : int
#CHARACTER SPRITES
@export var overworld_sprite : Texture2D
@export var token_sprite : Texture2D
@export var battle_sprite : Texture2D
#STAT FORMULAS
@export var XP_for : String = "90*1.39^%s"
@export var HP_for : String = "%s*1.15^%s"
@export var ATK_for : String = "%s*1.13^%s"
@export var DEF_for : String = "%s*1.11^%s"
@export var ACC_EVA : String = "%s*1.09^%s"
#CHARACTER STATS
@export var HP : int
@export var max_HP : int
#Limit Break
@export var limit : int
@export var max_limit : int
#Physical
@export var Phys_Attack : int
@export var Phys_Defense : int
#Tech
@export var Tech_Attack : int
@export var Tech_Defense : int
#Auxillory
@export var Accuracy : int
@export var Evade : int

@export var elemental_res = {
	"Pyro" : 0,
	"Aero" : 0,
	"Geo" : 0,
	"Hydro" : 0,
	"Bio" : 0,
	"Electric" : 0,
	"Bomb" : 0,
	"Shock" : 0,
	"Frost" : 0,
	"Virus" : 0
}

@export var Skills : Array[Resource]
