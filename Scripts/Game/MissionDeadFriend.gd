extends ClickableObject

func _ready():
	EventManager.connect("Mission1EnableDeadFriend", Callable(self, "OnMission1EnableDeadFriend"))
	bIsEnabled = false

func OnMission1EnableDeadFriend():
	bIsEnabled = true

func SuccessfulMouseClick():
	if bIsEnabled:
		EventManager.Mission1DeadFriendFound.emit()
		DefaultContent = "Poor Benny... We got to find out how did this!"
		bIsEnabled = false
	else:
		EventManager.InjectDetDialogue.emit(DefaultContent)
