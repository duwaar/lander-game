extends Node2D

signal display_altitude
signal display_velocity
signal display_fuel
signal engine_on
signal engine_off

func _ready():
	$Terminal.print_line("LanderOS v27.4.0 read-only mode:")
	

func gauge_altitude(altitude):
	var max_abs_altitude = 10000
	var log_altitude = log(clamp(altitude, 0, max_abs_altitude) + 1)
	$Altimeter.set_gauge(log_altitude / log(max_abs_altitude))

func gauge_velocity(velocity):
	var max_abs_velocity = 500
	var log_velocity
	if velocity > 0:
		log_velocity = log(clamp(velocity, 0, 500) + 1.000001)
	elif velocity < 0:
		log_velocity = -log(clamp(abs(velocity), 0, 500) + 1)
	else:
		log_velocity = 0.0000001
	$Spedometer.set_gauge(log_velocity / log(max_abs_velocity) + 0.5)

func gauge_fuel(fuel):
	$Fuel.set_gauge(fuel / 100)

func gauge_engine(engine_on):
	if engine_on:
		$EngineLight.engine_light_on()
	else:
		$EngineLight.engine_light_off()

func display_altitude(altitude):
	$Terminal.print_line("Radar altitude: " + str(altitude))

func display_velocity(velocity):
	$Terminal.print_line("Velocity: " + str(velocity))

func display_fuel(fuel):
	$Terminal.print_line("Fuel remaining: " + str(fuel))

func display_engine_state(engine_on):
	var state = ""
	if engine_on:
		state = "ON"
	else:
		state = "OFF"
	$Terminal.print_line("Engine: " + state)

func display_all(altitude, velocity, fuel, engine_on):
	$Terminal.print_line("LANDER STATUS")
	display_altitude(altitude)
	display_velocity(velocity)
	display_fuel(fuel)
	display_engine_state(engine_on)
	$Terminal.print_line("")

func display_landed_message():
	$Terminal.print_line("Landed safely. Good work, captain.")
	$Terminal.print_line("Engine shut down.")
	$Terminal.print_line("LanderOS shutting down...")

func display_crashed():
	$Terminal.print_line("Crashed. You fucked up.")
	$Crashed.z_index = 3


func _on_AltitudeButton_button_up():
	emit_signal("display_altitude")

func _on_FuelButton_button_up():
	emit_signal("display_fuel")

func _on_EngineButton_button_down():
	emit_signal("engine_on")

func _on_EngineButton_button_up():
	emit_signal("engine_off")

func _on_VelocityButton_button_up():
	emit_signal("display_velocity")

func _on_TestButton_button_up():
	$Terminal.print_line("LanderOS output test.")

