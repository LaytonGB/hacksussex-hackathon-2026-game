extends SubViewportContainer

@onready var test_world: TestWorld = %test_world
@onready var popup = %PopUp
var basketball_within_reach = false


var keep_pointer_centered := true :
	set(value):
		keep_pointer_centered = value
		if value:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _unhandled_input(event: InputEvent) -> void:
	if basketball_within_reach and event.is_action_pressed("interact"):
		get_tree().change_scene_to_file("res://Scenes/BasketballInteraction/BasketballInteraction.tscn")
		
	
	if event.is_action_pressed("ui_menu"):
		keep_pointer_centered = !keep_pointer_centered
		return
	
	test_world.character._unhandled_input(event)


	


func _on_basketball_entered(body: Node3D) -> void:
	basketball_within_reach = true
	popup.visible = !popup.visible
	
	



func _on_basketball_left(body: Node3D) -> void:
	basketball_within_reach = false
	popup.visible = !popup.visible
