extends Node
class_name InventoryGlobal


signal coins_changed(new_coins: int)


@export var coins: int = 0:
	set(value):
		coins = value
		coins_changed.emit(coins)
