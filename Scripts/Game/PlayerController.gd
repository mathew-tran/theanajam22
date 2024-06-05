extends Camera2D

var HorizontalSpeed = 200
var VerticalSpeed = 200

var VerticalRestraints = {
	"MIN" : 376,
	"MAX" : 800
}

var HorizontalRestraints = {
	"MIN" : 376,
	"MAX" : 800
}

func _process(delta):
	if Input.is_action_pressed("move_left"):
		global_position.x -= HorizontalSpeed * delta
	if Input.is_action_pressed("move_right"):
		global_position.x += HorizontalSpeed * delta

	if Input.is_action_pressed("move_up"):
		global_position.y -= VerticalSpeed * delta
	if Input.is_action_pressed("move_down"):
		global_position.y += VerticalSpeed * delta
