extends Camera2D

export var CameraSpeed = 50
export var ZoomSpeed = 100
export var ZoomMargin = 0.1
export var ZoomMax = 2
export var ZoomMin = 0.5
var ZoomPosition = Vector2()
var ZoomFactor = 1.0
var Zooming = false

func _process(delta):
	if position.x < -1000: position.x=-1000
	if position.x >1375: position.x=1375
	if position.y < 0: position.y=0
	if position.y >1400: position.y=1400
	var input_x_direction = (int(Input.is_action_pressed("ui_right"))) - (int(Input.is_action_pressed("ui_left")))
	position.x += input_x_direction * CameraSpeed * delta *100
	#position.x = lerp (position.x, position.x + input_x_direction * CameraSpeed * zoom.x, CameraSpeed * delta)
	var input_y_direction = (int(Input.is_action_pressed("ui_down"))) - (int(Input.is_action_pressed("ui_up")))
	position.y += input_y_direction * CameraSpeed * delta *100
	#position.y = lerp (position.y, position.y + input_y_direction * CameraSpeed * zoom.y, CameraSpeed * delta)
	print ("position x = ", position.x)
	print ("position y = ", position.y)
	
	#zoom in and out
	zoom.x = lerp(zoom.x, zoom.x * ZoomFactor, ZoomSpeed * delta)
	zoom.y = lerp(zoom.y, zoom.y * ZoomFactor, ZoomSpeed * delta)
	#limits of zoom
	zoom.x = clamp(zoom.x, ZoomMin, ZoomMax)
	zoom.y = clamp(zoom.y, ZoomMin, ZoomMax)
	
	if not Zooming: ZoomFactor = 1.0
	pass
	
func _input(event):
	if abs(ZoomPosition.x - get_global_mouse_position().x) > ZoomMargin:
		ZoomFactor = 1.0
	if abs(ZoomPosition.y - get_global_mouse_position().y) > ZoomMargin:
		ZoomFactor = 1.0
		
	if event is InputEventMouseButton:
		if event.is_pressed():
			Zooming = true
			if event.button_index == BUTTON_WHEEL_UP:
				ZoomFactor -= 0.1 
				ZoomPosition = get_global_mouse_position()
			if event.button_index == BUTTON_WHEEL_DOWN:
				ZoomFactor += 0.1 
				ZoomPosition = get_global_mouse_position()
		else: 
			Zooming = false
	print ("Zoomfactor = ", zoom.x, "and ", zoom.y)
			
	
	
	
	
	
	
	
	
	
