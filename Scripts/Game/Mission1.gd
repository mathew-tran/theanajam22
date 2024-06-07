extends MissionBase

func ActivateMission():

	EventManager.AddJournalEntry.emit("Going to assist Floatsworth with an investigation today.")

	var content1 = "Welcome fellow detective.\nI need some help on this case. \nCan you help me?"
	EventManager.InjectDetDialogue.emit(content1)

	await EventManager.InjectDetDialogueComplete
	var content2 = "Great. I knew you would!\nCould you go to my office near the clock tower. I have left a case file on the ground!"
	EventManager.InjectDetDialogue.emit(content2)

	EventManager.AddJournalEntry.emit("Met Detective Floatsworth, I need to pick up a case file on the ground near his office.\nHis professionalism terrifies me.")



	EventManager.InjectDetEmote.emit(EventManager.EMOTE.ANGRY)

	await EventManager.InjectDetDialogueComplete

	EventManager.InjectDetEmote.emit(EventManager.EMOTE.NEUTRAL)
	EventManager.InjectObjective.emit("Get case file from Detective Floatsworth's house near the Clock Tower")

	EventManager.Mission1EnableCase.emit()

	await EventManager.MissionCasePickup

	EventManager.ClearObjective.emit()

	var content3 = "Nice job finding it!\nSo let's see here.."
	EventManager.InjectDetDialogue.emit(content3)

func DeactivateMission():
	pass
