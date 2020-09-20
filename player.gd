extends KinematicBody2D

var pos = Vector2.ZERO

onready var animation  = $AnimationPlayer
onready var sprite  = $Sprite
onready var joy=$joystick
onready var btn=$joystick/button
 

var is_jumping = false

func _physics_process(delta):
	pos=move_and_slide(pos,Vector2.UP)
	if is_on_floor():
		is_jumping=false
		#animation.play("idle")
		

func _process(delta):
	var direction =  Input.get_action_strength("move_left")-Input.get_action_strength("move_right")+ joy.get_now_pos()
	pos.y += 2000*delta
	pos.x = direction *350
	
	if btn.is_pressed() && not is_jumping:
		pos.y=-1000
		is_jumping=true
	if is_jumping:
		animation.play("jump")
	elif direction!=0:
		animation.play("walk")
	else:
		animation.play("idle")
		
	sprite.flip_h=direction<0
	
func _input(event):
	if event.is_action_pressed("jump") && not is_jumping:
		pos.y=-1000
		is_jumping=true


