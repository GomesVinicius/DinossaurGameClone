extends Area2D

const FLOOR = Vector2(100, 605) #618 touch floor
const GRAVITY = 4000
var speed = Vector2()
var speed_jump = -1280
var modify_gravity = 2.4

var time = 0.0
var interval = 3
var interval_min = 0.5
var interval_max = 3.5

var cactus_list = [
	preload('res://sprites/CactusSmall1.tscn'),
	preload('res://sprites/CactusSmall2.tscn'),
	preload('res://sprites/CactusSmall3.tscn'),
	preload('res://sprites/CactusTall1.tscn'),
	preload('res://sprites/CactusTall2.tscn'),
	preload('res://sprites/CactusTall3.tscn'),
	]

func _ready():
	# OS.window_size
	set_position(FLOOR)
	randomize()
	pass

func _physics_process(delta):
	
	time += delta
	
	if time >= interval:
		time = 0
		
		var cactus = rand_range(0, cactus_list.size())
		get_parent().add_child(cactus_list[cactus].instance())
		
		interval = rand_range(interval_min, interval_max)
	
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
		
func colide(event):
	queue_free()
