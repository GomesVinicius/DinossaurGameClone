extends Area2D

const FLOOR = Vector2(100, 585)
const GRAVITY = 4000
var speed = Vector2()
var speed_jump = -1100
var modify_gravity = 2.4

func _ready():
	# OS.window_size
	set_position(FLOOR)
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed('jump'):
		speed.y += GRAVITY * delta
	else:
		speed.y += GRAVITY * delta * modify_gravity

	if Input.is_action_just_pressed('jump') and position == FLOOR:
		speed.y = speed_jump

	position += speed * delta

	if get_position().y > FLOOR.y:
		set_position(FLOOR)
		speed = Vector2()
