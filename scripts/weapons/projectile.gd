extends Area2D

var direction : Vector2 = Vector2.RIGHT
var speed : float = 200
var damage : float = 1
var source

func _physics_process(delta):
	position += direction *speed * delta

func _on_body_entered(body):
	if body.has_method("take_damage"):
		if "might" in source:
			body.take_damage(damage * source.might)
		else:
			body.take_damage(damage)
		
		body.knockback = direction * 75

func _on_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.get_parent().has_method("take_damage"):
		area.get_parent().take_damage(damage)
