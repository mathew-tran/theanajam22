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
	if EventManager.bIsInDialogue:
		return

	if Input.is_action_pressed("move_left"):
		global_position.x -= HorizontalSpeed * delta
		if global_position.x <= HorizontalRestraints["MIN"]:
			global_position.x = HorizontalRestraints["MIN"]
			EventManager.PlayerHitLeftBoundary.emit()
	if Input.is_action_pressed("move_right"):
		global_position.x += HorizontalSpeed * delta
		if global_position.x > HorizontalRestraints["MAX"]:
			global_position.x = HorizontalRestraints["MAX"]
			EventManager.PlayerHitRightBoundary.emit()

	if Input.is_action_pressed("move_up"):
		global_position.y -= VerticalSpeed * delta
		if global_position.y <= VerticalRestraints["MIN"]:
			global_position.y = VerticalRestraints["MIN"]
			EventManager.PlayerHitTopBoundary.emit()
	if Input.is_action_pressed("move_down"):
		global_position.y += VerticalSpeed * delta
		if global_position.y > VerticalRestraints["MAX"]:
			global_position.y = VerticalRestraints["MAX"]
			EventManager.PlayerHitBottomBoundary.emit()

	if Input.is_action_just_pressed("scroll_up"):
		zoom += Vector2(1,1) * ScrollSpeed * delta
		if zoom.x > MaxScrollAmount:
			zoom = Vector2(MaxScrollAmount, MaxScrollAmount)
	if Input.is_action_just_pressed("scroll_down"):
		zoom -= Vector2(1,1) * ScrollSpeed * delta
		if zoom.x < MinScrollAmount:
			zoom = Vector2(MinScrollAmount, MinScrollAmount)
