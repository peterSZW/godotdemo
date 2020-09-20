extends Sprite


var is_press = false
var button_index =-1


func _input(event):
	if  (event is InputEventScreenTouch and event.is_pressed()):
		if (self.global_position -  event.position).length()<70:
			is_press=true
			button_index = event.index

	if event is InputEventScreenTouch and !event.is_pressed():
		if button_index==event.index:
			is_press=false
			button_index=-1
		
func is_pressed():
	return is_press
