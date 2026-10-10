extends CharacterBody2D

var direction := Vector2(1,1)
const SPEED=100

func _physics_process(_delta: float) -> void:
	direction=Input.get_vector("left","right","up","down")

	velocity= direction * SPEED
	animate()
	move_and_slide()

func animate():
	if direction.x !=0:
		$AnimatedSprite2D.animation = "left_right"
		$AnimatedSprite2D.flip_h = direction.x > 0
	elif direction.y < 0:
		$AnimatedSprite2D.animation = "top"
	elif direction.y >0:
		$AnimatedSprite2D.animation = "bottom"
	else:
		$AnimatedSprite2D.frame = 0
