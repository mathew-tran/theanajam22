extends TextureRect

func _ready():
	modulate = Color(1,1,1, 0)

func ActivateHint():
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.play("animate")
