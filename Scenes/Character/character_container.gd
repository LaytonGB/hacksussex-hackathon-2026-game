extends SubViewportContainer

@onready var test_world: TestWorld = %test_world

var keep_pointer_centered := true :
	set(value):
		keep_pointer_centered = value
		if value:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_menu"):
		keep_pointer_centered = !keep_pointer_centered
		return
	
	test_world.character._unhandled_input(event)
