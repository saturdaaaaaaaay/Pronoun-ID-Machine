extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var start_blink = get_random_blink()
var timer = 0
var blinking = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_random_blink():
	return rng.randf_range(60, 350)
	
func toggle_blink(toggle):
	blinking = toggle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if blinking:
		timer = timer + 1
		if timer > start_blink:
			get_node("Features/Eyes").hide()
			get_node("Features/Blink").show()
			if timer > start_blink + 10:
				timer = 0
				start_blink = get_random_blink()
		else:
			get_node("Features/Eyes").show()
			get_node("Features/Blink").hide()
	else:
		get_node("Features/Eyes").show()
		get_node("Features/Blink").hide()
