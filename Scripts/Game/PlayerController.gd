extends Camera2D

var HorizontalSpeed = 400
var VerticalSpeed = 400

var VerticalRestraints = {
	"MIN" : -3000,
	#"MIN" : -10,
	"MAX" : 500
}

var HorizontalRestraints = {
	"MIN" : 0,
	"MAX" : 3000
	#"MAX" : 100
}

var MinScrollAmount = .8
var MaxScrollAmount = 2.6
var ScrollSpeed = 10


func _process(delta):
	if EventManager.CanDoAction() == false:
		return

	var originalPosition = global_position

	if Input.is_action_pressed("move_left"):
		global_position.x -= HorizontalSpeed * delta

	if Input.is_action_pressed("move_right"):
		global_position.x += HorizontalSpeed * delta


	if Input.is_action_pressed("move_up"):
		global_position.y -= VerticalSpeed * delta


	if Input.is_action_pressed("move_down"):
		global_position.y += VerticalSpeed * delta


	if Input.is_action_just_pressed("scroll_up"):
		zoom += Vector2(1,1) * ScrollSpeed * delta
		if zoom.x > MaxScrollAmount:
			zoom = Vector2(MaxScrollAmount, MaxScrollAmount)
	if Input.is_action_just_pressed("scroll_down"):
		zoom -= Vector2(1,1) * ScrollSpeed * delta
		if zoom.x < MinScrollAmount:
			zoom = Vector2(MinScrollAmount, MinScrollAmount)

	var adjustedDelta = 1.0 / 60.0

	if Input.is_action_pressed("middle_click") and global_position == originalPosition:

		$MiddleMouseImage.visible = true
		if get_global_mouse_position().distance_to($MiddleMouseImage.global_position) > 30:
			var dir = (get_global_mouse_position() - $MiddleMouseImage.global_position).normalized()
			position += dir * adjustedDelta * HorizontalSpeed
			$MiddleMouseImage.look_at(get_global_mouse_position())
			$MiddleMouseImage.texture = preload("res://Art/UI/PointerIcon.png")
		else:
			$MiddleMouseImage.texture = preload("res://Art/UI/MoveIcon.png")
			$MiddleMouseImage.rotation_degrees = 0
	else:
		$MiddleMouseImage.visible = false

	if global_position.y < VerticalRestraints["MIN"]:
		global_position.y = VerticalRestraints["MIN"]
		EventManager.PlayerHitTopBoundary.emit()

	if global_position.y > VerticalRestraints["MAX"]:
		global_position.y = VerticalRestraints["MAX"]
		EventManager.PlayerHitBottomBoundary.emit()

	if global_position.x > HorizontalRestraints["MAX"]:
		global_position.x = HorizontalRestraints["MAX"]
		EventManager.PlayerHitRightBoundary.emit()

	if global_position.x < HorizontalRestraints["MIN"]:
		global_position.x = HorizontalRestraints["MIN"]
		EventManager.PlayerHitLeftBoundary.emit()
