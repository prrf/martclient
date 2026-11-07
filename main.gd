extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Mart.play("gif")
	$EvilMart.play("gif")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = $VBoxContainer/LineEdit.text
	if $VBoxContainer/LineEdit.text.to_lower().contains("evil"):
		$Mart.visible = false
		$EvilMart.visible = true
		$ColorRect.color = Color(0.282, 0.0, 0.0, 1.0)
		$VBoxContainer/Label.modulate = Color(1,0,0,1)
		$VBoxContainer/Label.text = "EVIL's Marts"
		DisplayServer.window_set_title("EVIL's Marts")
	else:
		$Mart.visible = true
		$EvilMart.visible = false
		$ColorRect.color = Color(0.0, 0.0, 0.282)
		$VBoxContainer/Label.modulate = Color(0.494, 0.761, 1.0)
		$VBoxContainer/Label.text = "ellie's Marts"
		DisplayServer.window_set_title("ellie's Marts")
	pass


func _on_button_pressed() -> void:
	if $VBoxContainer/LineEdit.text != "":
		Websocketclient.socket.send_text($VBoxContainer/LineEdit.text)
	pass # Replace with function body.
