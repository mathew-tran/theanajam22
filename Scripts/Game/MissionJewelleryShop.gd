extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableJewelleryStore", Callable(self, "OnMission1EnableJewelleryStore"))
	bIsEnabled = false

func OnMission1EnableJewelleryStore():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1WentToJewelleryStore.emit()
		bIsEnabled = false
		DefaultContent = "..\nAlready went here. We should look elsewhere!"
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
