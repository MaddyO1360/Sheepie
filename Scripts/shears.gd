extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var shears = preload("res://Scenes/shears.tscn")
var x : int = 0


func _ready() -> void:
	pass

func spawn():
	var new_shears = shears.instatiate()
	add_child(new_shears)

func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#this func below allows for gravity to act and be realistic
	move_and_slide()
	


func _on_drop_timer_timeout() -> void:
	spawn() # Replace with function body.
	while x < 10:
		print(x+1)
	
