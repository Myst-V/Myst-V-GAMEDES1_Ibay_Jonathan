
# enemy.gd
# Name: Jonathan Ibay
# Course: GAMDES1
# Date: October 10, 2026
# Detects when the player touches the enemy and sends the player back to the start.
# Attach this script to the Enemy node (a CharacterBody2D).
extends CharacterBody2D

# _ready() runs once when the Enemy first appears in the game.
func _ready() -> void:
	# Connect the Hitbox's body_entered signal.
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)

# Runs whenever something enters the Hitbox.
func _on_hitbox_body_entered(body) -> void:
	# Check if the object is the player.
	if body.is_in_group("player"):
		print("Player touched the enemy!")
		body.respawn()
