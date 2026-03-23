extends CharacterBody2D

@onready var whiteSheep = $CompositeSheeps/whitesheep
@onready var lightgreySheep = $CompositeSheeps/lightgreysheep
@onready var greySheep = $CompositeSheeps/greysheep
@onready var darkgreySheep = $CompositeSheeps/darkgreysheep
@onready var blackSheep = $CompositeSheeps/blacksheep
@onready var rainbowSheep = $CompositeSheeps/rainbowsheep
const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var x = 0
var n = 0
var sprites = {
	1: preload("res://Assets/lightgrey_sheep.png"),
	2: preload("res://Assets/grey_sheep.png"),
	3: preload("res://Assets/darkgrey_sheep.png"),
	4: preload("res://Assets/blackgrey_sheep.png"),
	5: preload("res://Assets/rainbow_sheep.png"),
}


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		#changes direction of player depending on input
		#if dir = 0 --> no movement; -1 --> left; 1 --> right
		#$"." isn't a character to use; you should use $Sprite2D
		$Sprite2D.flip_h = direction > 0
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_timer_timeout() -> void:
	#change to onestop timer (have like multiple ones) later tho
	whiteSheep.texture = sprites[1]
"""
while n < 6:
		n +=1
		whiteSheep.texture = sprites[n]
"""
	
