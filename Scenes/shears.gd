extends CharacterBody2D


#@onready shear = load("res://Assets/closed_scissors.png")
#var new_shear = shear.instantiate()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		

func spawn():
	#if $Sprite2D.position.y < 
	pass
