extends Sprite

var ondraging = -1
func _physics_process(delta):
	self.global_position=Vector2(200,400)
func _input(event):
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		if (self.global_position -  event.position).length()<70 or ondraging ==event.index:
			ondraging =event.index
			$point.global_position = event.position
			if  $point.position.length() > 70:
				$point.position =  $point.position.normalized()*70
	if event is InputEventScreenTouch and !event.is_pressed():
		if ondraging ==event.index:
			$point.position = Vector2.ZERO
			ondraging =-1
 

func get_now_pos():
	return $point.position.normalized().x
		
