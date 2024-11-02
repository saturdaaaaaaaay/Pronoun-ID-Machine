extends Sprite


signal item_clicked(path)
signal item_unclicked(path)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Area2D").input_pickable = true
	get_node("Area2D").connect("input_event", self, "_on_ClickableItem_input_event")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ClickableItem_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		var path = self.get_path()
		if (event.pressed):
			emit_signal("item_clicked", path)
		else:
			emit_signal("item_unclicked", path)

func set_input_pickable(pickable):
	get_node("Area2D").input_pickable = pickable
