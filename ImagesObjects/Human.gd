extends "res://ImagesObjects/BasicModel.gd"

onready var sprite = $Sprite
onready var namelabel = $NameLabel
onready var Selected = false
var AvatarID 
var SpriteNumber = GlobalVariables.RANDOM.randi_range(1,3)

enum DIRECTION {LEFT = -1, RIGHT = -1}
export (DIRECTION) var WALKING_DIRECTION
var state 
onready var FloorLeft = $FloorLeft
onready var FloorRight = $FloorRight
onready var WallRight = $WallRight
onready var WallLeft = $WallLeft

func _ready():
	namelabel.text = Name + " " + Surname[0]
	if Sex==0: #male
		if Age >=50:
			AvatarID = 13
		else: 
			AvatarID = GlobalVariables.RANDOM.randi_range(0,12)
		match SpriteNumber:
			1: 
				sprite.texture = load("res://Images/Man1/Idle.png")
				sprite.set_hframes(6)
			2: 
				sprite.texture = load("res://Images/Man2/Idle.png")
				sprite.set_hframes(4)
			3: 
				sprite.texture = load("res://Images/Man3/Idle.png")
				sprite.set_hframes(4)
		
	if Sex==1: #female
		if Age >=50:
			AvatarID = 20
		else: 
			AvatarID = GlobalVariables.RANDOM.randi_range(14,19)
		match SpriteNumber:
			1: 
				sprite.texture = load("res://Images/Woman1/Idle.png")
				sprite.set_hframes(4)
			2: 
				sprite.texture = load("res://Images/Woman2/Idle.png")
				sprite.set_hframes(4)
			3: 
				sprite.texture = load("res://Images/Woman3/Idle.png")
				sprite.set_hframes(4)
				
	_CheckChars()
	#movement next
	state = WALKING_DIRECTION
	
#func _physics_process(_delta):
#	match state: 
#		DIRECTION.RIGHT:
#			motion.x = MAX_SPEED
#			if not FloorRight.is_colliding() or WallRight.is_colliding():
#				state = DIRECTION.LEFT
#		DIRECTION.LEFT:
#			motion.x = -MAX_SPEED
#			if not FloorLeft.is_colliding() or WallLeft.is_colliding():
#				state = DIRECTION.RIGHT
#	sprite.scale.x = sign(motion.x)
#	motion = move_and_slide_with_snap(motion, Vector2.DOWN * 4, Vector2.UP, true, 4, deg2rad(46))
#
	
func _CheckChars():
	if Sex==0: 
		print("Male ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
	if Sex==1: 
		print("Female ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
		
func _getAvatarID():
	return AvatarID


