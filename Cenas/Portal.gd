extends Area2D 

var path_para_proxima_fase = "res://Cenas/Fase2.tscn"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(path_para_proxima_fase)

func _ready():
	connect("body_entered", self, "_on_Area2D_body_entered")
