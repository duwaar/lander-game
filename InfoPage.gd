tool
extends Node2D

signal main_menu

export(Texture) var background = null setget set_bg
export(String) var title = "title" setget set_title
export(String) var body = "body" setget set_body

func _ready():
	$Background.texture = background
	$TitleLabel.text = title
	$BodyLabel.text = body

func set_bg(picture):
	background = picture
	$Background.texture = picture

func set_title(text):
	title = text
	$TitleLabel.text = text

func set_body(text):
	body = text
	$BodyLabel.text = text

func _on_MenuButton_button_up():
	emit_signal("main_menu")
