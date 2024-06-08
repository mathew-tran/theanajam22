extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableBarber", Callable(self, "OnMission1EnableBarber"))
	bIsEnabled = false

func OnMission1EnableBarber():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1BarberTalkedTo.emit()
		bIsEnabled = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
