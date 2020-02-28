extends Node

# Signals
signal crashed
signal landed

# Physics quantities
var altitude = 0.0
var velocity = 0.0
const gravity = -5.0
const ship_mass = 1000.0
const engine_force = 20000.0

# Vehicle status
var fuel = 100.0
var engine_on = false
const max_landing_speed = 10.0
var flying = false

func _process(delta):
	if flying:
		flying = check_flying()
		update_position(delta)
		update_velocity(delta)
		update_fuel(delta)

func reset():
	altitude = 3000
	velocity = 0
	flying = true

func update_position(delta):
	if flying:
		altitude += velocity*delta + 0.5*get_acceleration()*pow(delta,2)
	else:
		altitude = 0
		velocity = 0

func update_velocity(delta):
	velocity += get_acceleration()*delta

func update_fuel(delta):
	if engine_on:
		fuel -= delta

func get_acceleration():
	var thrust
	if engine_on:
		thrust = engine_force / ship_mass
	else:
		thrust = 0
	return gravity + thrust

func check_flying():
	if (-0.1 <= altitude
			and altitude <= 0.1
			and -max_landing_speed <= velocity
			and velocity <= max_landing_speed
			):
		emit_signal("landed")
		return false
	elif (altitude <= 0
			and abs(velocity) >= max_landing_speed
			):
		emit_signal("crashed")
		return false
	else:
		return true
