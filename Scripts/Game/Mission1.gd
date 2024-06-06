extends MissionBase

func ActivateMission():
	var content1 = "Welcome fellow detective.\nI need some help on this case. \nCan you help me?"
	EventManager.InjectDetDialogue.emit(content1)


func DeactivateMission():
	pass
