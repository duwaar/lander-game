extends Node2D

func engine_light_on():
	$LightSprites/EngineLightOn.z_index = 0

func engine_light_off():
	$LightSprites/EngineLightOn.z_index = -1