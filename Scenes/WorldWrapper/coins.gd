extends Label


func _ready() -> void:
	Inventory.coins_changed.connect(_on_inventory_coins_changed)


func _on_inventory_coins_changed(new_coins: int) -> void:
	self.text = "Coins: %s" % new_coins
