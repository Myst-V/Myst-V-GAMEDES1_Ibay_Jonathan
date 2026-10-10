
# player.gd
# Name: Jonathan Ibay
# Course: GAMDES1
# Date: October 10, 2026
# Controls the Player: gravity, running, jumping, and respawning.
# Attach this script to the Player node (a CharacterBody2D).
extends CharacterBody2D


# Running speed, in pixels per second.
const SPEED: float = 300.0

# Jump strength, in pixels per second.
# Negative because up is negative on Godot's Y axis.
const JUMP_VELOCITY: float = -450.0

# --- Variables ---

# Gets gravity from the project's physics settings.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

# Saves where the player started.
var start_position: Vector2

# Runs once when the Player enters the scene.
func _ready() -> void:
	start_position = global_position
	add_to_group("player")

# Handles gravity, jumping, running, and collision.
func _physics_process(delta: float) -> void:
	# Apply gravity while in the air.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump only while standing on a surface.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Move left or right.
	var direction: float = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	# Move the player and handle solid collisions.
	move_and_slide()

# Returns the player to the starting position.
func respawn() -> void:
	global_position = start_position
	velocity = Vector2.ZERO
