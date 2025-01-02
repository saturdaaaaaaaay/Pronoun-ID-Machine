extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var focus = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_node("Accented Letters/Letter Buttons/Lowercase Letters").get_children():
		child.connect("item_clicked", self, "type_letter")
		
	for child in get_node("Accented Letters/Letter Buttons/Uppercase Letters").get_children():
		child.connect("item_clicked", self, "type_letter")
		
	get_viewport().connect("gui_focus_changed", self, "_on_focus_changed")
		
func type_letter(path):
	if focus != null:
		var focus_textedit = get_node(focus)
		var letter = get_node(str(path) + "/RichTextLabel")
		
		focus_textedit.insert_text_at_cursor(letter.get_text())

func _on_focus_changed(control):
	if control != null:
		focus = control.name
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
