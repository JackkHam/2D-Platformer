extends Node


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func fade_in():
	animation_player.play("fadetoblack")
	await animation_player.animation_finished
	
func fade_out():
	animation_player.play("fadeoutblack")
	await animation_player.animation_finished
	
