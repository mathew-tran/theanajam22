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


signal Mission1EnableCase
signal MissionCasePickup

var bIsInDialogue = false

var ClickTimer : Timer

func _ready():
	ClickTimer = Timer.new()
	ClickTimer.one_shot = true
	add_child(ClickTimer)

func CanClickObject():
	return ClickTimer.time_left == 0.0

func StartClickTimer():
	ClickTimer.start()
