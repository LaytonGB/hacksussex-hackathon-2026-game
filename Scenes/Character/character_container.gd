extends SubViewportContainer

@onready var airport: Airport = %Airport

var keep_pointer_centered := false :
	set(value):
		keep_pointer_centered = value
		if value:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_menu"):
		keep_pointer_centered = false
		return
	
	if event is InputEventMouseButton and event.is_pressed():
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		keep_pointer_centered = true
	
	airport.character._unhandled_input(event)
