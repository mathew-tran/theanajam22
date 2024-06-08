extends ClickableObject

var bEnableRoseMary = false
var bEnableClementine = false
func _ready():
	EventManager.connect("Mission1EnableRosemary", Callable(self, "OnMission1EnableRosemary"))
	EventManager.connect("Mission1EnableClementine", Callable(self, "OnMission1EnableClementine"))
	bEnableRoseMary = false

func OnMission1EnableRosemary():
	bEnableRoseMary = true

func OnMission1EnableClementine():
	bEnableClementine = true

func SuccessfulMouseClick():
	if bEnableRoseMary:
		EventManager.InjectDetDialogue.emit("...\nShe seems preoccupied and won't talk.\nShe seems scared.\n")
		bEnableRoseMary = false
	elif bEnableClementine:
		EventManager.Mission1CelementineTalkedTo.emit()
		DefaultContent = "She gave us enough information to go off of. Let's look for the killer."
		bEnableClementine = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
