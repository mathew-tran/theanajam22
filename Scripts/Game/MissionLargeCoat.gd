extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableLargeCoat", Callable(self, "OnMission1EnableLargeCoat"))
	bIsEnabled = false

func OnMission1EnableLargeCoat():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1LargeCoatFound.emit()
		queue_free()
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
