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
