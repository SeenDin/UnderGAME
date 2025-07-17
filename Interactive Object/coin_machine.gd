extends CollisionShape2D

# Ссылка на AudioStreamPlayer
var audio_player: AudioStreamPlayer  # Убедитесь, что путь к AudioStreamPlayer правильный

# Ссылка на игрока
var player_in_range = false

func _ready():
	# Убедитесь, что AudioStreamPlayer настроен с нужным звуком в редакторе
		pass  # Здесь можно добавить код, если нужно что-то инициализировать
		
func _process(delta):
	# Проверяем, нажата ли кнопка взаимодействия (например, "ui_accept")
	if player_in_range and Input.is_action_just_pressed("ui_accept"):
		play_sound()

func _on_CollisionShape2D_body_entered(body):
	# Проверяем, является ли объект игроком
	if body.is_in_group("player"):  # Убедитесь, что ваш игрок добавлен в группу "player"
		player_in_range = true

func _on_CollisionShape2D_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

# Метод для воспроизведения звука
func play_sound():
	if audio_player:  # Проверяем, что audio_player инициализирован
		audio_player.play()
