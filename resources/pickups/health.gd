extends Pickups
class_name Health

@export var amount : int = 20

func activate():
	super.active()
	player_reference.health += amount