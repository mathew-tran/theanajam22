extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableRosemary", Callable(self, "OnMission1EnableRosemary"))
	bIsEnabled = false

func OnMission1EnableRosemary():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1RosemaryTalkedTo.emit()
		DefaultContent = "...\nI think she needs some time alone. Let's try to find out what happened.\n..."
		bIsEnabled = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
