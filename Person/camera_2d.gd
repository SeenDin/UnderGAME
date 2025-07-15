extends Camera2D

@export var look_ahead_distance: float = 150
@export var look_ahead_speed: float = 5.0

var target_offset: float = 0.0

func _process(delta):
	var player = get_parent() as CharacterBody2D
	if player:
		# Определяем направление по velocity или вводу
		var direction = sign(player.velocity.x) if abs(player.velocity.x) > 10 else 0
		
		# Плавное изменение смещения
		target_offset = lerp(target_offset, direction * look_ahead_distance, look_ahead_speed * delta)
		offset.x = target_offset
