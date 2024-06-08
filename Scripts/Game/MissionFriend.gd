extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableRosemary", Callable(self, "OnMission1EnableRosemary"))
	EventManager.connect("Mission1RosemaryTalkedTo", Callable(self, "OnMission1RosemaryTalkedTo"))
	EventManager.connect("Mission1KillerFound", Callable(self,"OnMission1KillerFound"))
	bIsEnabled = false

func OnMission1EnableRosemary():
	bIsEnabled = true

func OnMission1RosemaryTalkedTo():
	bIsEnabled = false

func OnMission1KillerFound():
	bIsEnabled = false
	DefaultContent = "He said thanks to us on finding the killer"

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.InjectDetDialogue.emit("...\n...\n..\nHe seems not to have anything for us. He seems to scared to speak.\nLet's look elsewhere, yeah?")
		bIsEnabled = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
