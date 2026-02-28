extends SubViewportContainer

@onready var test_world: TestWorld = %test_world

func _unhandled_input(event: InputEvent) -> void:
	test_world.character._unhandled_input(event)
