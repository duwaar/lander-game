extends Node

# Signals
signal crashed
signal landed

# Physics quantities
var altitude = 2000
var velocity = 0
const gravity = -5
var ship_mass = 1000
const engine_force = 20000

# Vehicle status
var fuel = 100
var engine_on = false
const max_landing_speed = 10
var landed = false

func _process(delta):
	if not landed:
		landed = check_landed()
	update_position(delta)
	update_velocity(delta)
	update_fuel(delta)


func update_position(delta):
	altitude += velocity*delta + 0.5*get_acceleration()*pow(delta,2)
	if landed:
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

func check_landed():
	if (-0.1 <= altitude
			and altitude <= 0.1
			and -max_landing_speed <= velocity
			and velocity <= max_landing_speed
			):
		emit_signal("landed")
		return true
	elif (altitude <= 0 and abs(velocity) >= max_landing_speed):
		emit_signal("crashed")
		return true
	else:
		return false
