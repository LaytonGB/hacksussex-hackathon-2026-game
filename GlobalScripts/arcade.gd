extends Node

@onready var popup = $"../PopUp"


func _on_basketball_entered(area: Area3D) -> void:
	popup.visible = true
	


func _on_basketball_left(area: Area3D) -> void:
	popup.visible = false
	
