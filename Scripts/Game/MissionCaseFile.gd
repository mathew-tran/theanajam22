extends Sprite2D

var bIsEnabled = false
@onready var CollisionShape = $Area2D/CollisionShape2D
func _ready():
	EventManager.connect("Mission1EnableCase", Callable(self, "OnMission1EnableCase"))
	set_process(false)

func _input(event):
	if event.is_action_pressed("mouse_click"):
		if _is_click_within_bounds(get_global_mouse_position()):
			EventManager.MissionCasePickup.emit()
			queue_free()

func OnMission1EnableCase():
	set_process(true)

func _is_click_within_bounds(mouse_pos: Vector2) -> bool:
	var shape = CollisionShape.shape
	var extents = shape.extents
	var top_left = CollisionShape.global_position - extents
	var bottom_right = CollisionShape.global_position + extents

	return mouse_pos.x >= top_left.x and mouse_pos.x <= bottom_right.x and mouse_pos.y >= top_left.y and mouse_pos.y <= bottom_right.y
