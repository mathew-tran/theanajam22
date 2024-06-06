extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableCase", Callable(self, "OnMission1EnableCase"))


func OnMission1EnableCase():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.MissionCasePickup.emit()
		queue_free()
	else:
		EventManager.InjectDetDialogue.emit("DefaultContent")
