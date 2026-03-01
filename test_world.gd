extends Node3D
class_name TestWorld

@export var character: Character
signal _on_basketball_entered(body: Node3D) 
signal _on_basketball_left(body: Node3D)

func _on_area_3d_area_entered(body: Node3D) -> void:
	emit_signal("_on_basketball_entered", body)
	print("basketball entered")
	




func _on_area_3d_area_exited(body: Node3D) -> void:
	emit_signal("_on_basketball_left", body)
