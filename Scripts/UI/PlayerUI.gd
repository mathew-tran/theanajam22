extends Control

@onready var SpeechLabel = $"Control/Speech Bubble/Label"
@onready var SpeechBubble = $"Control/Speech Bubble"

@onready var ObjectivePanel = $Objective
@onready var ObjectiveLabel = $Objective/Label

var CurrentContent = []
var CurrentContentIndex = 0
func _ready():
	visible = true
	$Control/AnimationPlayer.play("animate")
	EventManager.connect("PlayerHitTopBoundary", Callable(self, "OnPlayerHitTopBoundary"))
	EventManager.connect("PlayerHitBottomBoundary", Callable(self, "OnPlayerHitBottomBoundary"))
	EventManager.connect("PlayerHitLeftBoundary", Callable(self, "OnPlayerHitLeftBoundary"))
	EventManager.connect("PlayerHitRightBoundary", Callable(self, "OnPlayerHitRightBoundary"))
	EventManager.connect("InjectDetDialogue", Callable(self, "OnInjectDetDialogue"))
	EventManager.connect("InjectObjective", Callable(self, "OnInjectObjective"))
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
			if CurrentContentIndex < len(CurrentContent) - 1:
				EventManager.InjectDialogueContinue.emit()
				CurrentContentIndex += 1
				SetText()
			else:
				ClearText()
				CurrentContent = []
				EventManager.InjectDetDialogueComplete.emit()
func SetText():
	SpeechLabel.text = CurrentContent[CurrentContentIndex]

func ClearText():
	SpeechLabel.text = ""
	SpeechBubble.visible = false

func SetObjectiveLabel(content):
	ObjectivePanel.visible = true
	ObjectiveLabel.text = content

func ClearObjective():
	ObjectivePanel.visible = false

func OnInjectDetDialogue(content):
	CurrentContent = SplitString(content)
	CurrentContentIndex = 0
	SetText()
	SpeechBubble.visible = true

func OnInjectObjective(content):
	SetObjectiveLabel(content)

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
