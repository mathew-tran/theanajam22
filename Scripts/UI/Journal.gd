extends Panel

@onready var JournalEntryClass = preload("res://Prefabs/UI/JournalEntry.tscn")
@onready var JournalContainer = $Panel/ScrollContainer/VBoxContainer
func _ready():
	EventManager.connect("AddJournalEntry", Callable(self, "OnAddJournalEntry"))

func _input(event):
	if EventManager.bIsInDialogue:
		visible = false
		return
	if event.is_action_released("journal"):
		visible = !visible

func OnAddJournalEntry(content):
	var newContent = "=====" + get_current_time_stamp() + "=====\n" + content
	var instance = JournalEntryClass.instantiate()
	instance.SetText(newContent)
	JournalContainer.add_child(instance)
	await get_tree().process_frame
	JournalContainer.move_child(instance, 0)


func get_current_time_stamp() -> String:
	var current_time = Time.get_datetime_dict_from_system()
	var hour = String("%02d" % current_time.hour)
	var minute = String("%02d" % current_time.minute)
	var second = String("%02d" % current_time.second)
	return "[" + hour + ":" + minute + ":" + second + "]"
