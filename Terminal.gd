extends Node2D

func _ready():
	clear()

func print_line(line):
	$TerminalTextbox.text = $TerminalTextbox.text + '$ ' + line + '\n'

func clear():
	$TerminalTextbox.text = ''
