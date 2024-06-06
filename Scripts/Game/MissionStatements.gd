extends Node

var Index = -1

func _ready():
	GoToNextMission()

func GoToNextMission():
	if Index != -1:
		get_child(Index).DeactivateMission()
	Index += 1
	if get_child_count() > Index:
		get_child(Index).ActivateMission()
