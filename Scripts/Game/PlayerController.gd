extends Camera2D

var HorizontalSpeed = 200
var VerticalSpeed = 200

var VerticalRestraints = {
	"MIN" : -3000,
	"MAX" : 500
}

var HorizontalRestraints = {
	"MIN" : 0,
	"MAX" : 3000
}

func _process(delta):
	if Input.is_action_pressed("move_left"):
		global_position.x -= HorizontalSpeed * delta
		if global_position.x <= HorizontalRestraints["MIN"]:
			global_position.x = HorizontalRestraints["MIN"]
	if Input.is_action_pressed("move_right"):
		global_position.x += HorizontalSpeed * delta
		if global_position.x > HorizontalRestraints["MAX"]:
			global_position.x = HorizontalRestraints["MAX"]

	if Input.is_action_pressed("move_up"):
		global_position.y -= VerticalSpeed * delta
		if global_position.y <= VerticalRestraints["MIN"]:
			global_position.y = VerticalRestraints["MIN"]
	if Input.is_action_pressed("move_down"):
		global_position.y += VerticalSpeed * delta
		if global_position.y > VerticalRestraints["MAX"]:
			global_position.y = VerticalRestraints["MAX"]
