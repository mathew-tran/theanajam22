extends Control

@onready var SpeechLabel = $"Control/Speech Bubble/Label"
@onready var SpeechBubble = $"Control/Speech Bubble"

@onready var ObjectivePanel = $Objective
@onready var ObjectiveLabel = $Objective/Label

@onready var FloatsWorthSprite = $Control/Sprite2D
@onready var BlackoutPanel = $BlackoutPanel

var CurrentContent = []
var CurrentContentIndex = 0

var SpeechTween : Tween
func _ready():
	visible = true
	$Control/AnimationPlayer.play("animate")
	EventManager.connect("PlayerHitTopBoundary", Callable(self, "OnPlayerHitTopBoundary"))
	EventManager.connect("PlayerHitBottomBoundary", Callable(self, "OnPlayerHitBottomBoundary"))
	EventManager.connect("PlayerHitLeftBoundary", Callable(self, "OnPlayerHitLeftBoundary"))
	EventManager.connect("PlayerHitRightBoundary", Callable(self, "OnPlayerHitRightBoundary"))
	EventManager.connect("InjectDetDialogue", Callable(self, "OnInjectDetDialogue"))
	EventManager.connect("InjectObjective", Callable(self, "OnInjectObjective"))
	EventManager.connect("ClearObjective", Callable(self, "OnClearObjective"))
	EventManager.connect("InjectDetEmote", Callable(self, "OnInjectDetEmote"))
	ClearText()
	ClearObjective()

func OnPlayerHitTopBoundary():
	$TopBoundaryHint.ActivateHint()

func OnPlayerHitBottomBoundary():
	$BottomBoundaryHint.ActivateHint()

func OnPlayerHitLeftBoundary():
	$LeftBoundaryHint.ActivateHint()

func OnPlayerHitRightBoundary():
	$RightBoundaryHint.ActivateHint()

func _input(event):
	if event.is_action_pressed("mouse_click"):
		if CurrentContent != []:
			if is_instance_valid(SpeechTween):
				KillTween()
				return

			if CurrentContentIndex < len(CurrentContent) - 1:
				EventManager.InjectDialogueContinue.emit()
				CurrentContentIndex += 1
				SetText()
			else:
				ClearText()
				CurrentContent = []
				EventManager.InjectDetDialogueComplete.emit()
		else:
			ClearText()


func KillTween():
	SpeechLabel.visible_characters = -1
	SpeechTween.stop()
	SpeechTween.kill()
	SpeechTween = null


func SetText():
	BlackoutPanel.visible = true
	SpeechLabel.visible_characters = 0
	SpeechLabel.text = CurrentContent[CurrentContentIndex]
	SpeechTween = get_tree().create_tween()


	var duration = 0.0
	for x in range(0, len(CurrentContent[CurrentContentIndex])):
		duration += .03
	SpeechTween.tween_property(SpeechLabel, "visible_characters", len(CurrentContent[CurrentContentIndex]), duration)
	SpeechTween.tween_callback(KillTween)

func ClearText():
	if BlackoutPanel.visible:
		BlackoutPanel.visible = false
		SpeechLabel.text = ""
		SpeechBubble.visible = false
		EventManager.bIsInDialogue = false


func SetObjectiveLabel(content):
	var tween = get_tree().create_tween()
	ObjectivePanel.modulate = Color(1,1,1,0)
	ObjectivePanel.position.y = -100
	tween.tween_property(ObjectivePanel, "modulate", Color.WHITE, .2)
	tween.tween_property(ObjectivePanel, "position:y", 88, .2)
	ObjectivePanel.visible = true
	ObjectiveLabel.text = content

func ClearObjective():
	ObjectivePanel.visible = false

func OnInjectDetDialogue(content):
	CurrentContent = SplitString(content)
	CurrentContentIndex = 0
	SetText()
	SpeechBubble.visible = true
	EventManager.bIsInDialogue = true

func OnInjectObjective(content):
	SetObjectiveLabel(content)

func OnInjectDetEmote(emote : EventManager.EMOTE):
	if emote == EventManager.EMOTE.ANGRY:
		FloatsWorthSprite.texture = load("res://Art/DetFloatsworthAngry.svg")
	elif emote == EventManager.EMOTE.NEUTRAL:
		FloatsWorthSprite.texture = load("res://Art/DetFloatsworth.svg")
	elif emote == EventManager.EMOTE.BLUSH:
		FloatsWorthSprite.texture = load("res://Art/DetFloatsworthBlush.svg")
	elif emote == EventManager.EMOTE.SAD:
		FloatsWorthSprite.texture = load("res://Art/DetFloatsworthSad.svg")

func OnClearObjective():
	ClearObjective()

func SplitString(s: String):
	var result = []
	s = s.strip_edges()
	var splitString = s.split("\n")
	for split in splitString:
		if len(split) >= 100:
			var words = split.split(" ")
			var sentence = ""
			for word in words:
				if len(sentence) + len(word) < 100:
					sentence += word + " "
				else:
					result.append(sentence)
					sentence = word + " "
			if sentence != "":
				result.append(sentence)
		else:
			result.append(split)
	return result
