extends MarginContainer


const WHAT_FILE_NAME = "res://what.tres"
const HOW_FILE_NAME = "res://how.tres"

var what_array: PoolStringArray
var how_array: PoolStringArray


func _ready() -> void:
	what_array = _load_file(WHAT_FILE_NAME)
	how_array = _load_file(HOW_FILE_NAME)
	randomize()


func _load_file(file_name: String) -> PoolStringArray:
	var file := File.new()
	file.open(file_name, File.READ)
	var string := file.get_as_text()
	file.close()
	return string.split("\n", false)


func _get_random_string(array: PoolStringArray) -> String:
	var index := randi() % array.size()
	return array[index]


func _on_WhatButton_pressed() -> void:
	$"%WhatTextEdit".text = _get_random_string(what_array)


func _on_HowButton_pressed() -> void:
	$"%HowTextEdit".text = _get_random_string(how_array)


func _on_WhatHowButton_pressed() -> void:
	_on_WhatButton_pressed()
	_on_HowButton_pressed()
