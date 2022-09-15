extends Node

var RANDOM
var is_zoomed = false

func _ready():
	RANDOM = RandomNumberGenerator.new()
	RANDOM.randomize()
	pass # Replace with function body.

#func _process(_delta):
#	if Input.is_action_just_pressed("ui_cancel") and !is_zoomed:
#		is_zoomed=true
#		$Tween.interpolate_property($Camera2D, "zoom", Vector2(1,1), Vector2(0.5, 0.5), 0.5, 
#		Tween.TRANS_LINEAR, Tween.EASE_OUT)
#	elif Input.is_action_just_pressed("ui_cancel") and is_zoomed:
#		is_zoomed=false
#		#$Camera2D.zoom = Vector2(1,1)
#		$Tween.interpolate_property($Camera2D, "zoom", Vector2(0.5, 0.5), Vector2(1, 1), 0.5, 
#		Tween.TRANS_LINEAR, Tween.EASE_OUT)
#	$Tween.start()
