extends Node2D
tool

var start_angle = 230
var sweep_angle = 80
var end_angle = start_angle + sweep_angle

export(String) var title_text = "title" setget set_title_text
export(String) var min_text = "min" setget set_min_text
export(String) var mid_text = "mid" setget set_mid_text
export(String) var max_text = "max" setget set_max_text


func set_gauge(fraction):
	var set_angle = start_angle + sweep_angle * (1 - fraction)
	$Needle.rotation_degrees = clamp(set_angle, start_angle, end_angle)

func set_min_text(string):
	min_text = string
	$Min.text = string

func set_mid_text(string):
	mid_text = string
	$Mid.text = string

func set_max_text(string):
	max_text = string
	$Max.text = string

func set_title_text(string):
	title_text = string
	$Title.text = string