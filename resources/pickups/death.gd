extends Pickups
class_name Death

func activate():
	super.active()
	player_reference.get_tree().call_group("Enemy", "drop_item")
