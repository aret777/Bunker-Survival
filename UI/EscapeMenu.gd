extends Control

var GamePaused = false setget _game_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"): #escape key
		self.GamePaused = !GamePaused

func _game_is_paused (value):
	GamePaused = value
	get_tree().paused = GamePaused
	visible = GamePaused
	
func _on_ResumeButton_pressed():
	self.GamePaused = false

func _on_QuitButton_pressed():
	get_tree().quit()
