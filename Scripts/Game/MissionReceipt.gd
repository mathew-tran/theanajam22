extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableReceipt", Callable(self, "OnMission1EnableReceipt"))

	bIsEnabled = false

func OnMission1EnableReceipt():
	bIsEnabled = true


func SuccessfulMouseClick():
	if bIsEnabled:


		EventManager.Mission1ReceiptFound.emit()
		queue_free()
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
