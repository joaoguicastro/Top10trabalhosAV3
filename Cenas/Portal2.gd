extends Area2D  # Certifique-se de que este script está anexado ao seu Area2D

# Defina o caminho para a cena da próxima fase
var path_para_proxima_fase = "res://Cenas/Fase3.tscn"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		# Muda para a próxima fase
		get_tree().change_scene(path_para_proxima_fase)

func _ready():
	# Conecta o sinal body_entered a este script
	connect("body_entered", self, "_on_Area2D_body_entered")
