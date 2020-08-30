extends ParallaxBackground

var paralax_offset = 0

func _ready():
	get_node('ParallaxLayer/sprites').set_position(Vector2(0, 708))
	pass

func _physics_process(delta):
	print('a')
	paralax_offset -= delta * 1000
	set_scroll_offset(Vector2(paralax_offset, 0))
	print(paralax_offset)
	pass
