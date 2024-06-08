extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableScissors", Callable(self, "OnMission1EnableScissors"))
	bIsEnabled = false

func OnMission1EnableScissors():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1ScissorsFound.emit()
		queue_free()
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
