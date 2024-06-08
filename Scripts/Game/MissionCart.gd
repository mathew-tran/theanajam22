extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableFindKiller", Callable(self, "OnMission1EnableFindKiller"))
	bIsEnabled = false
	EventManager.connect("Mission1KillerFound", Callable(self, "OnMission1KillerFound"))

func OnMission1KillerFound():
	bIsEnabled = false
	DefaultContent = "Just a rail car."

func OnMission1EnableFindKiller():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:

		DefaultContent = "Nothing here."
		EventManager.InjectDetDialogue.emit(DefaultContent)
		bIsEnabled = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
