extends CharacterBody2D

var speed : float = 150
var health : float = 100:
	set(value):
		health = value
		%healthbar.value = value

var nearest_enemy : CharacterBody2D
var nearest_enemy_distance : float = INF

func _physics_process(delta):
	if nearest_enemy:
		nearest_enemy_distance = nearest_enemy.separation
		print(nearest_enemy.name)
	else:
		nearest_enemy_distance = INF
		
	velocity = Input.get_vector("left","right","up","down") * speed
	move_and_collide(velocity * delta)

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func take_damage(amount):
	health -= amount
	print(amount)

func _on_self_damage_body_entered(body: Node2D) -> void:
	take_damage(body.damage)


func _on_timer_timeout():
	%collision.set_deferred('disabled', true)
	%collision.set_deferred('disabled', false)
