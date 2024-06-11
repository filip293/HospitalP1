extends Label

var counter: float = 0.0

func _ready():
	$/root/Node3D/VHS/Time.text = format_time(counter)
	$/root/Node3D/VHS/Record.play("Record")

func _process(delta):
	counter += delta
	text = format_time(counter)

func format_time(seconds: float) -> String:
	var total_seconds = int(seconds)
	var hours = total_seconds / 3600
	var minutes = (total_seconds / 60) % 60
	var secs = total_seconds % 60
	return pad_zero(hours, 2) + ":" + pad_zero(minutes, 2) + ":" + pad_zero(secs, 2)

func pad_zero(value: int, length: int) -> String:
	var str_value = str(value)
	while str_value.length() < length:
		str_value = "0" + str_value
	return str_value
