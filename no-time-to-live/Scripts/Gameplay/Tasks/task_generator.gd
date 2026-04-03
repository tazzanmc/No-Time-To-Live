extends Node
class_name task_generator

# Public vars
@export var normal_tasks_scene: PackedScene
@export var linked_tasks_scene: PackedScene
@export var vital_tasks_scene: PackedScene
@export var auto_tasks_scene: PackedScene

# Private vars
@onready var instance = { 
	"normal":normal_tasks_scene.instantiate(),
	"linked":linked_tasks_scene.instantiate(),
	"vital":vital_tasks_scene.instantiate(),
	"auto":auto_tasks_scene.instantiate(),
	}

func _ready() -> void:
	add_child(instance.normal)
	add_child(instance.linked)
	add_child(instance.vital)
	add_child(instance.auto)
	spawn_task("normal", "t", true, Vector2(500, 500))

## Gets a desired task from the desired type via 1st letter in name
func get_from_instance(type: String, task: String, random: bool) -> int:
	var tasks :=[]
	for i in instance[type].get_child_count():
		if instance[type].get_child(i).name.begins_with(task):
			tasks.append(i)
	if random == true:
		return tasks.pick_random()
	else:
		return tasks[0]

## Spawns a desired task from the desired type via 1st letter in name
func spawn_task(type: String, task: String, random: bool, pos: Vector2) -> void:
	var inst_task = instance[type].get_child(get_from_instance(type, task, random)).duplicate()
	add_child(inst_task)
	inst_task.translate(pos)
