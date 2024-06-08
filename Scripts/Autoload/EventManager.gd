extends Node

enum EMOTE {
	NEUTRAL,
	ANGRY,
	SAD,
	BLUSH
}
signal PlayerHitLeftBoundary
signal PlayerHitRightBoundary
signal PlayerHitTopBoundary
signal PlayerHitBottomBoundary
signal InjectDetDialogue (content)
signal InjectDialogueContinue
signal InjectDetDialogueComplete

signal InjectObjective(content)
signal ClearObjective
signal InjectDetEmote(emote : EMOTE)
signal AddJournalEntry(content)


signal Mission1EnableCase
signal MissionCasePickup

signal Mission1EnableDeadFriend
signal Mission1DeadFriendFound

signal Mission1EnableScissors
signal Mission1ScissorsFound

signal Mission1EnableBarber
signal Mission1BarberTalkedTo

signal Mission1EnableLargeCoat
signal Mission1LargeCoatFound

signal Mission1EnableRosemary
signal Mission1RosemaryTalkedTo

signal Mission1EnableReceipt
signal Mission1ReceiptFound

signal Mission1EnableJewelleryStore
signal Mission1WentToJewelleryStore

signal Mission1EnableClementine
signal Mission1CelementineTalkedTo

signal Mission1EnableFindKiller
signal Mission1KillerFound

var bIsInDialogue = false
var bIsInPauseMenu = false

var ClickTimer : Timer

func _ready():
	ClickTimer = Timer.new()
	ClickTimer.one_shot = true
	ClickTimer.wait_time = .3
	add_child(ClickTimer)

func CanDoDialogue():
	return bIsInDialogue and bIsInPauseMenu == false

func CanClickObject():
	return ClickTimer.time_left == 0.0 and bIsInPauseMenu == false and bIsInDialogue == false

func CanDoAction():
	if bIsInPauseMenu:
		return false
	return bIsInDialogue == false

func StartClickTimer():
	ClickTimer.start()

