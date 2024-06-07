extends Panel

func _ready():
	pass

func _on_visibility_changed():
	EventManager.bIsInPauseMenu = is_visible_in_tree()

	if is_inside_tree():
		get_tree().paused = is_visible_in_tree()

func _input(event):
	if event.is_action_released("pause"):
		visible = !visible


func _on_resume_resume_clicked():
	visible = false
