extends Area2D
var direction:= Vector2.LEFT
var speed = 100
var cars = [preload("res://graphics/cars/green.png"),preload("res://graphics/cars/yellow.png"),preload("res://graphics/cars/red.png")]

func _ready() -> void:
	if position.x < 5:
		direction=Vector2.RIGHT
		$Sprite2D.flip_h=true
	$Sprite2D.texture = cars.pick_random()

func _process(delta: float) -> void:
	position+= direction * speed*delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
