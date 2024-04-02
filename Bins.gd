extends Node2D

var bins
var SPEED = 200
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	var bin1 = get_node("1")
	var bin2 = get_node("2")
	var bin3 = get_node("3")
	bins = [bin1,bin2,bin3]
	for bin in bins:
		_randomizeHeight(bin)
	player = get_node("../Player/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not player.dead:
		for bin in bins:
			bin.position.x -= delta*SPEED
			if bin.position.x < -680:
				_resetBin(bin)

func _resetBin(bin):
	_randomizeHeight(bin)
	bin.position.x = 1200
	
func _randomizeHeight(bin):
	var rng = RandomNumberGenerator.new()
	bin.position.y = rng.randi_range(-30,395)
