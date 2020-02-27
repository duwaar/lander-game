extends Node2D

signal try_again


func _on_MenuButton_button_up():
	emit_signal("try_again")
