extends Node2D

var health = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Player ready. Health: ",
health)
	take_damage(30)
	
func take_damage(amount):
	health -= amount
	print("Ouch! Health is now: ", health)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
