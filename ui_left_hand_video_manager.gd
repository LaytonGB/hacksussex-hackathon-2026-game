extends VideoStreamPlayer
class_name UiLeftHandVideoManager


@export var _vid_stationary: VideoStreamTheora
@export var _vid_walk: VideoStreamTheora
@export var _vid_crouch: VideoStreamTheora
@export var _vid_sprint: VideoStreamTheora
@export var _vid_jump: VideoStreamTheora


func _ready() -> void:
	CharacterState.state_change.connect(_on_character_state_state_change)


func _on_character_state_state_change(new_state: CharacterState.State, _prev_state: CharacterState.State) -> void:
	match new_state:
		CharacterState.State.STATIONARY:
			self.stream = _vid_stationary
		CharacterState.State.WALKING:
			self._play(_vid_walk)
		CharacterState.State.CROUCHING:
			self._play(_vid_crouch)
		CharacterState.State.SPRINTING:
			self._play(_vid_sprint)
		CharacterState.State.JUMPING:
			self._play(_vid_jump, false)


func _play(new_stream: VideoStreamTheora, do_loop: bool = true) -> void:
	self.stream = new_stream
	self.loop = do_loop
	self.play()
