extends Control

var MenuOriginPosition := Vector2.ZERO
var MenuOriginSize := Vector2.ZERO
var MenuTransitionTime := 0.5
var CurrentMenu
var MenusArr := []

onready var Menu1 = $Menu1
onready var Menu2 = $Menu2
onready var Tween1 = $Tween
onready var Anim = $AnimationPlayer

func _ready():
	MenuOriginPosition = Vector2(0,0)
	MenuOriginSize = get_viewport().size
	CurrentMenu = Menu1
	Anim.play("fade_in")


func _move_to_next_menu(next_menu_id: String):
	var next_menu = _get_menu_from_menu_id(next_menu_id)
#	CurrentMenu.rect_global_position = Vector2(-MenuOriginSize.x, 0)
#	next_menu.rect_global_position = MenuOriginPosition
	
	Tween1.interpolate_property(CurrentMenu, "rect_global_position", CurrentMenu.rect_global_position, \
	Vector2(-MenuOriginSize.x, 0), MenuTransitionTime) #smooth transition of 2nd menu from offscreen
	Tween1.interpolate_property(next_menu, "rect_global_position", next_menu.rect_global_position, \
	MenuOriginPosition, MenuTransitionTime) #smooth transition of first menu to left
	Tween1.start()
	
	MenusArr.append(CurrentMenu)
	CurrentMenu = next_menu
	
	
func _move_to_previous_menu():
	var previous_menu = MenusArr.pop_back()
	if previous_menu != null:
#		previous_menu.rect_global_position = MenuOriginPosition
#		CurrentMenu.rect_global_position = Vector2(MenuOriginSize.x, 0)
		Tween1.interpolate_property(previous_menu, "rect_global_position", previous_menu.rect_global_position, \
		MenuOriginPosition, MenuTransitionTime) #smooth transition of 1st menu from offscreen
		Tween1.interpolate_property(CurrentMenu, "rect_global_position", CurrentMenu.rect_global_position, \
		Vector2(MenuOriginSize.x, 0), MenuTransitionTime) #smooth transition of first menu to right (no minus in vector)
		Tween1.start()
		CurrentMenu = previous_menu


func _get_menu_from_menu_id(menu_id: String) -> Control:
	match menu_id:
		"Menu1": return Menu1
		"Menu2": return Menu2
		_: return Menu1 #default
		

func _on_Scenarios_pressed():
	 _move_to_next_menu("Menu2")

func _on_Back_pressed():
	_move_to_previous_menu()

func _on_Exit_pressed():
	get_tree().quit()


func _on_AtomicWarButton_pressed():
	get_tree().change_scene("res://World.tscn")
	
