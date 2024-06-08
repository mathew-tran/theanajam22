extends MissionBase

func ActivateMission():

	EventManager.AddJournalEntry.emit("Going to assist Detective Floatsworth in Balloon City with an investigation today.")

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

	var content3 = "Nice job finding it!\nSo let's see here..\n.. So there's a potential murder. Puncture wounds. The body is somewhere south east of here.\nShould be easy to find."
	EventManager.InjectDetDialogue.emit(content3)

	await EventManager.InjectDetDialogueComplete

	EventManager.AddJournalEntry.emit("Picked up the case file. We are looking at a potential murder. We need to look for the body somewhere south east of the city.")
	EventManager.InjectObjective.emit("Find the body")

	EventManager.Mission1EnableDeadFriend.emit()

	await EventManager.Mission1DeadFriendFound

	EventManager.InjectDetEmote.emit(EventManager.EMOTE.SAD)
	EventManager.ClearObjective.emit()

	var content4 = "Oh.. I know this fellow. His name was Benny.\n.. Benny was always tying knots in his string. Said it helped him think, but he was always left all tangled up."
	EventManager.InjectDetDialogue.emit(content4)

	EventManager.AddJournalEntry.emit("Victim's name was Benny. A tall, slim, green balloon with a large slash across his chest. Detective Floatsworth seems to have known him.")
	await EventManager.InjectDetDialogueComplete

	var content5 = ".. Well, let's look around. There's bound to be something around here. What a shame."
	EventManager.InjectDetDialogue.emit(content5)
	EventManager.InjectDetEmote.emit(EventManager.EMOTE.NEUTRAL)
	await  EventManager.InjectDetDialogueComplete

	EventManager.InjectObjective.emit("Look for clues around the body")
	EventManager.AddJournalEntry.emit("Trying to look for clues. Maybe a tool or another balloon that tried to kill Benny.")

	EventManager.Mission1EnableScissors.emit()

	await  EventManager.Mission1ScissorsFound

	EventManager.ClearObjective.emit()
	var content6 = "Ah ha! A pair of scissors. Nice catch detective.\nI am sure there's a crafts shop in town. I think that'd be our next best bet."
	EventManager.InjectDetDialogue.emit(content6)

	await EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Find the crafts shop")
	EventManager.AddJournalEntry.emit("We found the supposed murder weapon nearby the clock tower. Not too far from the body. Going to search the crafts shop next.")
func DeactivateMission():
	pass
