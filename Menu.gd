extends Node2D


signal start
signal help
signal about


func _on_StartButton_button_up():
	emit_signal("start")

func _on_HelpButton_button_up():
	emit_signal("help")

func _on_AboutButton_button_up():
	emit_signal("about")
