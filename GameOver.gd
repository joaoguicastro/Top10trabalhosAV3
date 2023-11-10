extends Control


func _on_Reiniciar_pressed():
	get_tree().change_scene("res://Cenas/Fase.tscn")


func _on_Sair_pressed():
	get_tree().quit()
