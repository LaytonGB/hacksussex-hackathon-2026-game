extends Control

var thrown = false
var offset = Vector3(0,0.75,0)
var duration = 2.0
@onready var ball = %ball
@onready var start_pos : Vector3 = ball.global_position
@onready var end_pos : Vector3 = start_pos + offset
var time_done = false



func _process(delta) -> void:
	_start_fade_move()
	if time_done:
		$WorldWrapper/SubViewport/TextureRect.visible = true
	
	
func _start_fade_move() -> void:
	var tween := create_tween().bind_node(ball)
	if not tween:
		return  # safety check

	var prop_tween = tween.tween_property(ball, "global_position", end_pos, duration)
	if prop_tween:
		prop_tween.set_trans(Tween.TRANS_BOUNCE)
		prop_tween.set_ease(Tween.EASE_OUT_IN)

	prop_tween = tween.tween_property(ball, "global_position", start_pos, duration)
	if prop_tween:
		prop_tween.set_trans(Tween.TRANS_BOUNCE)
		prop_tween.set_ease(Tween.EASE_OUT_IN)
	
	tween.tween_callback(_start_fade_move)


func _on_timer_timeout() -> void:
	time_done = true
