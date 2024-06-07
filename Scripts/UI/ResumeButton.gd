extends Button

signal ResumeClicked

func _on_button_up():
	emit_signal("ResumeClicked")
