extends MissionBase

func ActivateMission():

	EventManager.AddJournalEntry.emit("Going to assist Detective Floatsworth in Balloon City with an investigation today.")

	var content1 = "Welcome fellow detective.\nI heard you had a KEEN eye for spotting things!\nI need some help on this case. \nCan you help me?"
	EventManager.InjectDetDialogue.emit(content1)
	await EventManager.InjectDetDialogueComplete
	var content2 = "Great. I knew you would! Not like you had a choice haha!\nCould you go to my office near the clock tower. I have left a case file on the ground!"
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
	var content6 = "Ah ha! A pair of scissors. Nice catch detective.\n There's a barber shop in town. I think that'd be our next best bet.\nDo you like my hair? He's been cutting it for years!"
	EventManager.InjectDetDialogue.emit(content6)

	await EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Find the barber shop")
	EventManager.AddJournalEntry.emit("We found the supposed murder weapon nearby the clock tower. Not too far from the body. Going to search the barber shop next.")

	EventManager.Mission1EnableBarber.emit()
	await EventManager.Mission1BarberTalkedTo

	EventManager.ClearObjective.emit()
	var content7 = "Don't worry. Let me do the talking. I know Bubbles. He's been doing my hair for years.\nThis should be quick...."
	EventManager.InjectDetDialogue.emit(content7)
	EventManager.InjectDetEmote.emit(EventManager.EMOTE.BLUSH)
	await  EventManager.InjectDetDialogueComplete
	EventManager.AddJournalEntry.emit("Detective Floatsworth talked to his favorite barber, Bubbles. Turns out a pair of scissors went missing. Bubbles noted he saw a mysterious man with a LARGE COAT.")

	EventManager.InjectDetEmote.emit(EventManager.EMOTE.NEUTRAL)
	var content8 = "....\n...\n...\nBubbles said there was a blue pair of scissors that went missing yesterday. He thought he misplaced it.\nHowever...\nHe did notice an odd character yesterday wearing a large coat.\nLet's go and find them!"
	EventManager.InjectDetDialogue.emit(content8)
	EventManager.AddJournalEntry.emit("On the lookout for a large coat. It could be anywhere.")

	await  EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Find someone with a large coat!")
	EventManager.Mission1EnableLargeCoat.emit()

	await EventManager.Mission1LargeCoatFound
	EventManager.ClearObjective.emit()

	var content9 = "Well we see a large coat here. Hrm. Maybe we should ask around. I am lost, good thing I have you helping me out!"
	EventManager.InjectDetDialogue.emit(content9)
	await EventManager.InjectDetDialogueComplete

	EventManager.AddJournalEntry.emit("Dead end, going to talk around and look for clues")

	EventManager.InjectObjective.emit("Talk to balloons outside")

	EventManager.Mission1EnableRosemary.emit()

	await EventManager.Mission1RosemaryTalkedTo
	EventManager.ClearObjective.emit()
	var content10 = "I'll chat to her.\n...\n...\n...\nHer name is Rosemary, she turned out to be Benny's partner.\n...\nTurns out he lived near the hospital.. Let's check it out.\n"
	EventManager.InjectDetDialogue.emit(content10)

	await EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Look for clues around Benny's place")
	EventManager.AddJournalEntry.emit("We found Benny's partner, Rosemary. Now we are looking for where Benny lived. He lived near the hospital")
	EventManager.Mission1EnableReceipt.emit()

	await EventManager.Mission1ReceiptFound
	EventManager.ClearObjective.emit()
	EventManager.InjectDetDialogue.emit("A receipt to buy a diamond ring it seems.\nBenny must've had something special planned for Rosemary before the incident.\n...\nLet's check the jewellery store.")
	EventManager.AddJournalEntry.emit("We found a receipt near Benny's place. It looked like he was planning to propose on the next meet with Rosemary")

	await EventManager.InjectDetDialogueComplete

	EventManager.InjectObjective.emit("Look for jewellery store")
	EventManager.Mission1EnableJewelleryStore.emit()

	await EventManager.Mission1WentToJewelleryStore
	EventManager.ClearObjective.emit()
	var content11 = "...\n...\nThe owner here says that Benny was here a couple weeks ago\nBut before he bought the ring he seemed to have a fight with a balloon with a large coat\n..\nBack to the balloon with a large coat again.\nLet's look around for clues"
	EventManager.InjectDetDialogue.emit(content11)
	EventManager.AddJournalEntry.emit("We talked to the owner of the jewelery store. Benny had a fight with someone in a large coat. Detective Floatsworth seems lost and now we are looking around for clues")

	await EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Look around for clues")
	EventManager.Mission1EnableClementine.emit()

	await EventManager.Mission1CelementineTalkedTo
	EventManager.ClearObjective.emit()
	EventManager.AddJournalEntry.emit("There was a balloon behind a rock who told us what happened. Her name is Clementine. Benny was on the way to propose to Rosemary last night. But then he got stopped by the killer wearing a large coat.")

	var content12 = "...\n...\nHer name is Clementine. She saw everything.\nLast night she saw get Benny murdered by someone in a large coat with the scissors.\nShe thinks he's hiding in one of the railcars"
	EventManager.InjectDetDialogue.emit(content12)

	await EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Look for the killer")
	EventManager.Mission1EnableFindKiller.emit()

	await EventManager.Mission1KillerFound
	EventManager.ClearObjective.emit()
	var content13 = "..\nGot you!\n...\n...\n...\nWe got the killer.\nNice work detective! Couldn't have done it without you!"
	EventManager.InjectDetDialogue.emit(content13)

	await EventManager.InjectDetDialogueComplete
	EventManager.InjectObjective.emit("Mission completed. Thanks for playing!")
	EventManager.AddJournalEntry.emit("Found the killer in the black railcar. My work has been done for the day")

func DeactivateMission():
	pass
