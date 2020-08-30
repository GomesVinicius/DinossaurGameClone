extends Area2D

onready var dino = get_parent().get_node('Dino')
const FLOOR = Vector2(1340, 647)
var speed = Vector2(-500, 0)

func _ready():
	set_position(FLOOR)
	
	connect('area_entered', dino, 'colide')
	pass
	
func _physics_process(delta):
	set_position(get_position() + speed * delta)
