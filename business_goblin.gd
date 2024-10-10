class_name BusinessGoblin
extends CharacterBody2D

@export var max_speed = 40.0
@export var acceleration = 40.0

@onready var ray_cast_2d = $RayCast2D
@onready var finite_state_machine = $FiniteStateMachine
@onready var enemy_wander_state = $FiniteStateMachine/EnemyWanderState
@onready var enemy_chase_state = $FiniteStateMachine/EnemyChaseState

func _ready():
	enemy_wander_state.found_player.connect(finite_state_machine.change_state.bind(enemy_chase_state))
	enemy_chase_state.lost_player.connect(finite_state_machine.change_state.bind(enemy_wander_state))

func _physics_process(delta):
	ray_cast_2d.target_position = get_local_mouse_position()
	
