extends Node2D


@export var Center : Vector2;
@export var polygonNode : Polygon2D;

@export var polygonPoints : PackedVector2Array;


func _ready():
	polygonNode  = $Polygon2D;
