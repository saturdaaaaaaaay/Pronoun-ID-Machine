extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var FAR_RIGHT = 1075

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for cloud in get_node(".").get_children():
		cloud.translate(Vector2(.2, 0))
		var position = cloud.get_position()
		if position.x > FAR_RIGHT:
			cloud.set_position(Vector2(-110, position.y))
