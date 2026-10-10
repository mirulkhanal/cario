extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalNode.winState != GlobalNode.GAME_STATE.LOSS:
		$ScoreLabel.text = 'High Score: ' + str(GlobalNode.time_to_complete)
	else:
		$ScoreLabel.text = 'YOU LOOSE SUCKER 😝'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
