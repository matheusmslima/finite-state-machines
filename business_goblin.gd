class_name BusinessGoblin
extends CharacterBody2D

@export var max_speed = 40.0
@export var acceleration = 40.0

@onready var ray_cast_2d = $RayCast2D

func _physics_process(delta):
	ray_cast_2d.target_position = get_local_mouse_position()
	
