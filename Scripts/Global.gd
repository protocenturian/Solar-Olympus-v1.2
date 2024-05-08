extends Node
#Zone Manager
var world_data = load("res://Resources/World_data/Start_Game.tres")

var mapx = world_data.mapx
var mapy = world_data.mapy
var zone = "res://Scenes/Overworld_Zones/SCN_area_[%sx%s].tscn"
var current_zone = zone % [mapx, mapy]

var NeighborL = zone % [mapx-1, mapy]
var NeighborR = zone % [mapx+1, mapy]
var NeighborU = zone % [mapx, mapy-1]
var NeighborD = zone % [mapx, mapy+1]

var activezone = ResourceLoader.load_threaded_get(current_zone)
var Neighbor1 = ResourceLoader.load_threaded_get(NeighborL)
var Neighbor2 = ResourceLoader.load_threaded_get(NeighborR)
var Neighbor3 = ResourceLoader.load_threaded_get(NeighborU)
var Neighbor4 = ResourceLoader.load_threaded_get(NeighborD)

func load_scenes():
	current_zone = zone % [mapx, mapy]
	activezone = ResourceLoader.load(current_zone)
	if mapx >0:
		NeighborL = zone % [mapx-1, mapy]
		Neighbor1 = ResourceLoader.load(NeighborL)
	if mapx <11:
		NeighborR = zone % [mapx+1, mapy]
		Neighbor2 = ResourceLoader.load(NeighborR)
	if mapy >0:
		NeighborU = zone % [mapx, mapy-1]
		Neighbor3 = ResourceLoader.load(NeighborU)
	if mapy <9:
		NeighborD = zone % [mapx, mapy+1]
		Neighbor4 = ResourceLoader.load(NeighborD)

#Player Manager
var player_pos : Vector2i = world_data.player_pos
