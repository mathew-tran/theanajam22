extends Control

func _ready():
	$Control/AnimationPlayer.play("animate")
	EventManager.connect("PlayerHitTopBoundary", Callable(self, "OnPlayerHitTopBoundary"))
	EventManager.connect("PlayerHitBottomBoundary", Callable(self, "OnPlayerHitBottomBoundary"))
	EventManager.connect("PlayerHitLeftBoundary", Callable(self, "OnPlayerHitLeftBoundary"))
	EventManager.connect("PlayerHitRightBoundary", Callable(self, "OnPlayerHitRightBoundary"))

func OnPlayerHitTopBoundary():
	$TopBoundaryHint.ActivateHint()

func OnPlayerHitBottomBoundary():
	$BottomBoundaryHint.ActivateHint()

func OnPlayerHitLeftBoundary():
	$LeftBoundaryHint.ActivateHint()

func OnPlayerHitRightBoundary():
	$RightBoundaryHint.ActivateHint()
