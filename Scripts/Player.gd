extends KinematicBody2D

const moveSpeed = 100
const maxSpeed = 100

const jumpHeight = -300 
const up = Vector2(0,-1)
const gravity = 1500  

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity * delta

	if is_on_floor():
		motion.y = 0  
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = jumpHeight

	var friction = false

	if Input.is_action_just_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = min(motion.x + moveSpeed, maxSpeed)
		friction = true

	elif Input.is_action_just_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		motion.x = max(motion.x - moveSpeed, -maxSpeed)
		friction = true

	else:
		animationPlayer.play("Idle")

	if friction:
		motion.x = lerp(motion.x, 0, 0.5)

	move_and_slide(motion, Vector2(0, -1))
	
func add_Coin():
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer", true, false)
	
	canvasLayer.handleCoincollected()
	
func _loseLife():
	print("Nos hemos pinchado, perfermos vida o reiniciamos el nivel.")
	get_tree().reload_current_scene()


## SPIKES DAMAGE
func _on_Object_body_entered(body):
	if body.name == "Player": 
		print("Hemos pinchado")
		get_tree().reload_current_scene()

