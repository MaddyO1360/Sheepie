extends Area2D


'''
@onready var coin_scene = preload("res://Scenes/coin.tscn")
#spawn gen --> uses random generator to create any number
#rng is limited to the x and y pos given ranges
#instantiate a new coin
func spawn():
	var rng = RandomNumberGenerator.new()
	var new_coin = coin_scene.instantiate()
	$Sprite2D.global_position.x = rng.randi_range(10, 200)
	$Sprite2D.global_position.y = rng.randi_range(10, 100)
	new_coin.set_global_position(Vector2($Sprite2D.global_position.x, 50))
	add_child(new_coin)
'''
#I think i'm getting an error because of body entered method
#spawning works but it duplicates for some weird reason
#the main goal is to just move the coin rather than create a whole new one
#^^^ it would duplicate bc the sprite2D would move positions but not the whole scene
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var rng = RandomNumberGenerator.new()
		# error = area2D node's pos doesn't change with Sprite2D's pos
		#^^^ this is because when you add $Sprite2D. ---, that limits what's being moved
		#so, just put in the ---- that you want to move the entire scene
		global_position.x = rng.randi_range(100, 1000)
		global_position.y = rng.randi_range(100, 675)
		set_global_position(Vector2(global_position.x, global_position.y))
		
		
		
	


func _on_tile_map_layer_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
