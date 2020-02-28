extends Node2D

signal start
signal about

func _on_StartButton_button_up():
	emit_signal("start")

func _on_AboutButton_button_up():
	emit_signal("about")
