extends Node2D
var car_scene:PackedScene = preload("res://scenes/car.tscn")
var time = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	call_deferred("exit_to_menu")
	GlobalNode.winState = GlobalNode.GAME_STATE.WIN
	if  time < GlobalNode.time_to_complete:
		GlobalNode.time_to_complete = time

func _ready() -> void:
	$Objects/Player.position = $Objects/PlayerSpawn.position
	
func _on_timer_timeout() -> void:
	var car:Area2D = car_scene.instantiate()
	var car_start_pos:Marker2D = $CarStartMarkers.get_children().pick_random()
	car.position = car_start_pos.position
	
	$Objects.add_child(car)
	car.connect("body_entered",player_car_collision)
	
func player_car_collision(body):
	call_deferred("exit_to_menu")
	GlobalNode.winState = GlobalNode.GAME_STATE.LOSS
	

func exit_to_menu():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	
func _on_elapsed_timer_timeout() -> void:
	time+=1
	$CanvasLayer/Label.text = "Time Elapsed: "+str(time)
