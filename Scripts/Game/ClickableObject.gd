extends Node2D

class_name ClickableObject
@onready var CollisionShape = $Area2D/CollisionShape2D

var bIsEnabled = true

@export_multiline var DefaultContent = "Hrmm maybe this can be used for something later."


func IsMouseClicked(mouse_pos: Vector2) -> bool:
	var shape = CollisionShape.shape
	var extents = shape.extents
	var top_left = CollisionShape.global_position - extents
	var bottom_right = CollisionShape.global_position + extents

	return mouse_pos.x >= top_left.x and mouse_pos.x <= bottom_right.x and mouse_pos.y >= top_left.y and mouse_pos.y <= bottom_right.y

func _input(event):
	if EventManager.bIsInDialogue:
		return
	if EventManager.CanClickObject() == false:
		return
	if event.is_action_pressed("mouse_click"):
		if IsMouseClicked(get_global_mouse_position()):
			SuccessfulMouseClick()

			await EventManager.InjectDetDialogueComplete

			EventManager.StartClickTimer()

func SuccessfulMouseClick():
	EventManager.InjectDetDialogue.emit(DefaultContent)
