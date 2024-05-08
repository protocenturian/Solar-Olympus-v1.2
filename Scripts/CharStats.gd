extends VBoxContainer

var hero_data : Hero

@onready var namebox = $NameBox
@onready var textbox = $HBoxContainer/TextureRect
@onready var status = $HBoxContainer/Status
@onready var ele_res = $"Elemental Res"

func _on_party_menu_charstat(data):
	hero_data = data
	setup()

func setup():
	textbox.texture = hero_data.battle_sprite
	
	namebox.get_node("Name_Level").text = "%s\nLevel %s" % [hero_data.name, hero_data.level]
	namebox.get_node("Job").text = hero_data.job
	
	status.get_node("HP_Per").text = str(hero_data.max_HP)
	status.get_node("Phys_ATK").text = str(hero_data.Phys_Attack)
	status.get_node("Tech_ATK").text = str(hero_data.Tech_Attack)
	status.get_node("Phys_DEF").text = str(hero_data.Phys_Defense)
	status.get_node("Tech_DEF").text = str(hero_data.Tech_Defense)
	status.get_node("ACC").text = str(hero_data.Accuracy)
	status.get_node("EVA").text = str(hero_data.Evade)
	
	var res_list = hero_data.elemental_res.keys()
	for i in res_list:
		var chosen_res = "%s/%s Res" % [i, i]
		ele_res.get_node(chosen_res).text = "%s%%" % [hero_data.elemental_res[i]]
