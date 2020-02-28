extends Node2D

var cmd_time_accumulator = 0
var flying = true

func _ready():
	$Menu.visible = true
	$ControlPanel.visible = false
	$About.visible = false

func _process(delta):
	$ControlPanel.gauge_altitude($LanderState.altitude)
	$ControlPanel.gauge_velocity($LanderState.velocity)
	$ControlPanel.gauge_fuel($LanderState.fuel)
	$ControlPanel.gauge_engine($LanderState.engine_on)
	
	if flying:
		cmd_time_accumulator += delta
		if cmd_time_accumulator >= 5:
			$ControlPanel.display_all(
					$LanderState.altitude,
					$LanderState.velocity,
					$LanderState.fuel,
					$LanderState.engine_on)
			cmd_time_accumulator = 0


func _on_ControlPanel_display_altitude():
	$ControlPanel.display_altitude($LanderState.altitude)

func _on_ControlPanel_display_fuel():
	$ControlPanel.display_fuel($LanderState.fuel)

func _on_ControlPanel_display_velocity():
	$ControlPanel.display_velocity($LanderState.velocity)

func _on_ControlPanel_engine_off():
	$LanderState.engine_on = false
	$ControlPanel.display_engine_state($LanderState.engine_on)

func _on_ControlPanel_engine_on():
	if flying:
		$LanderState.engine_on = true
		$ControlPanel.display_engine_state($LanderState.engine_on)


func _on_LanderState_crashed():
	flying = false
	$LanderState.engine_on = false
	$ControlPanel.visible = false
	$Crashed.visible = true

func _on_LanderState_landed():
	flying = false
	$LanderState.engine_on = false
	$ControlPanel.visible = false
	$Landed.visible = true

func _on_Menu_about():
	$Menu.visible = false
	$About.visible = true

func _on_Menu_start():
	flying = true
	$Menu.visible = false
	$ControlPanel.visible = true
	$ControlPanel.reset()
	$LanderState.reset()

func _on_Help_main_menu():
	$Help.visible = false
	$Menu.visible = true

func _on_About_main_menu():
	$About.visible = false
	$Menu.visible = true

func _on_Crashed_main_menu():
	$Crashed.visible = false
	$Menu.visible = true

func _on_Landed_main_menu():
	$Landed.visible = false
	$Menu.visible = true
