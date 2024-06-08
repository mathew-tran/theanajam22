extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableRosemary", Callable(self, "OnMission1EnableRosemary"))
	EventManager.connect("Mission1KillerFound", Callable(self, "OnMission1KillerFound"))
	bIsEnabled = false

func OnMission1EnableRosemary():
	bIsEnabled = true

func OnMission1KillerFound():
	bIsEnabled = false
	DefaultContent = "...\n...\nShe thanks us for helping find Benny's killer.\nWe should leave her be for now\nEventful day."
func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1RosemaryTalkedTo.emit()
		DefaultContent = "...\nI think she needs some time alone. Let's try to find out what happened.\n..."
		bIsEnabled = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
