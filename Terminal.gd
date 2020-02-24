extends Node2D

func _ready():
	$TerminalTextbox.text = ''

func print_line(line):
	$TerminalTextbox.text = $TerminalTextbox.text + '$ ' + line + '\n'

