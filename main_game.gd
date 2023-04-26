extends Node2D


@export var AMOUNT_OF_POINTS : int = 150;
@export var dealay : float = 0.0;
@export var timeToReset : float = 20;
var BOARD_SIZE : Vector2;
var MARGIN_FOR_POINTS = 20;
var POINTS_MINIMUM_DISTANCE = 90;

var points  : Array;
var lines   : Array;
var polyLines : Array;
var polyLinesCenters : Array;
var triangles : Array;
enum CirclePosition {INSIDE, ON_EDGE, OUTSIDE}
var pointNode = preload("res://point.tscn");

var polygons = [];
var SimplePolygon = preload("res://polygon.tscn");


func getRandomPoints():
	#points = [Vector2(1595, 999), Vector2(1498, 142), Vector2(178, 77), Vector2(559, 904),Vector2(1879, 882), Vector2(1619, 330), Vector2(1448, 596)];
	for i in range(AMOUNT_OF_POINTS):
		var point = generateRandomPoint();
		points.append(point);
	#	drawCross(points[i])
	for i in range(AMOUNT_OF_POINTS):
		drawCross(points[i])
		
func generateRandomPoint(margin = true) -> Vector2:
	var point;
	while (true):
		point = Vector2(randi_range(MARGIN_FOR_POINTS, BOARD_SIZE.x-MARGIN_FOR_POINTS), 
							randi_range(MARGIN_FOR_POINTS, BOARD_SIZE.y-MARGIN_FOR_POINTS)
						);
		if (checkForMargines(point) || !margin):
			break;
	return point








func checkForMargines(point) -> bool:
	for p in points:			
		if p.distance_to(point) < POINTS_MINIMUM_DISTANCE:
			return false;
	return true;





func getDst(point1, point2):
	return (
		(point2.x-point1.x)*(point2.x-point1.x) +
		(point2.y-point1.y)*(point2.y-point1.y)
	)

func getPointDeg(point, point2, deg):
	var angle = deg_to_rad(deg);
	var cosd = cos(angle);
	var sind = sin(angle);
	
	var x1 = point.x - point2.x;
	var y1 = point.y - point2.y;

	return Vector2(
		(cosd * x1) - (sind * y1) + point2.x,
		(sind * x1) + (cosd * y1) + point2.y
	)
	
func drawLine(point1, point2, color : Color = Color(255,255,255)):
	var line = $Line2D.duplicate();
	line.points = PackedVector2Array([point1, point2])
	line.default_color = color;
	$Lines.add_child(line);

func drawCircle(s, r):
	var circle_inst = $Circle.duplicate();
	circle_inst.update(s,r);
	$Circles.add_child(circle_inst);

func drawCross(point : Vector2, color : Color = Color(255,255,255)):
	var insta_pointNode = pointNode.instantiate();
	insta_pointNode.position = point;
	insta_pointNode.get_node("Line2D").default_color = color;
	insta_pointNode.get_node("Line2D2").default_color = color;
	$Points.add_child(insta_pointNode);

func isOnEdgeOfCircle(point : Vector2, S : Vector2, r) -> CirclePosition:
	#(point.x*point.x) + (point.y*point.y) - 2*(S.x*point.x)-2*(S.y*point.y)
	var res = pow(point.x - S.x,2) + pow(point.y - S.y,2);
	#print(res, " | ", r, " | ", res - r)
	r = r*r
	#print(r, " | ",res)
	
	if res == r:
		drawCross(point, Color(144,50,144));
		#print("edge fund")
		return CirclePosition.ON_EDGE;
	if (res < r):
		return CirclePosition.INSIDE	
	return CirclePosition.OUTSIDE

func getBigTriangle():
	var H = 2500;
	var A = 4000;
	var margin = 40
	var a = Vector2(
		(BOARD_SIZE.y/2)-A/2-margin,
		0-margin
	)
	var b = Vector2(
		(BOARD_SIZE.y/2)+A/2+margin,
		0-margin
	)
	var c = Vector2(
		A/2,
		H+margin
	)
	return[a,b,c];
	
func makeSuperTriangle():

	triangles.append(getBigTriangle());
	#var monitor_center = Vector2(1920/2, 1080/2);
	#drawLine(monitor_center, a);
	#drawLine(monitor_center, b);
	#drawLine(monitor_center, c);



func isVectorEqual(v1,v2):
	if (v1.x == v2.x && v2.y == v1.y):
		return true;
	return false;

func get_distanced(point1, point2):
	#print(point1, point2);
	return sqrt(
		(( point2.x - point1.x) * (point2.x - point1.x)) + 
		(( point2.y - point1.y) * (point2.y - point1.y))
	)

func getTriangleCircumcenterRadius(triangle):
	var a = get_distanced(triangle[0], triangle[1])
	var b = get_distanced(triangle[1], triangle[2])
	var c = get_distanced(triangle[2], triangle[0])
	#print(a ," || ", b," || ",c)
	var r = (a*b*c) / sqrt((a+b+c)*(b+c-a)*(c+a-b)*(a+b-c));
	#print("..",r,"..")
	return r;


func lineFromPoints(point1, point2):
	var a = point2.y - point1.y;
	var b = point1.x - point2.x;
	return [
			a,
			b,
			(a*point1.x) + (b*point1.y)
		];
func perpendicularBisectorFromLine(point1, point2, abc):
	var midpoint = [
			(point1.x+point2.x)/2,
			(point1.y+point2.y)/2
		];
	abc[2] = (abc[1]*(-1))*midpoint[0] + abc[0]*midpoint[1];
	var tmp = abc[0];
	abc[0] = abc[1] * (-1);
	abc[1] = tmp;
	return abc;
#stolen and translated from geeks for geeks
func getTriangleCircumcenterCenter(triangle):
	var abc = lineFromPoints(triangle[0], triangle[1]); 
	var efg = lineFromPoints(triangle[1], triangle[2]);
	
	abc = perpendicularBisectorFromLine(triangle[0], triangle[1], abc);
	efg = perpendicularBisectorFromLine(triangle[1], triangle[2], efg);
	
	var deter = abc[0]*efg[1] - efg[0]*abc[1];

	var x = (efg[1]*abc[2] - abc[1]*efg[2])/deter;
	var y = (abc[0]*efg[2] - efg[0]*abc[2])/deter;
	return Vector2(x,y);

func triangleEquality(t1, t2):
	var a1 = t1.find(t2[0]);
	var a2 = t1.find(t2[1]);
	var a3 = t1.find(t2[2]);
	if (a1 != -1 && a2 != -1 && a3 != -1):
		return true;
	return false;
	

	
func fundTriantgleIndex(triangle):
	var counter = 0;
	for tri in triangles:
		if triangleEquality(tri, triangle):
			return counter;
		counter += 1;
		pass;
		

func isSharedEdge(arr, triangle, edge, second = false) -> bool:
	for tri in arr:
		if (triangleEquality(triangle, tri)):
			continue
		var a1 = tri.find(edge[0]);
		var a2 = tri.find(edge[1]);
		if (a1 != -1 && a2 != -1):
			return true;
	if (!second):
		isSharedEdge(arr, triangle, [edge[1], edge[0]], true)
	return false;
		

func triangulation():
	makeSuperTriangle();
	for point in points:
		var badTriangles : Array = [];
		for triangle in triangles:
			var S = getTriangleCircumcenterCenter(triangle);
			var R = getTriangleCircumcenterRadius(triangle);
			#drawCross(S, Color(255,0,255))
			#drawCircle(S,R)
			#print("outside: ", isOnEdgeOfCircle(point, S, R), ", " ,point, ", ", S, ", ", R);
			var positionOnCircle = isOnEdgeOfCircle(point, S, R);
			if (positionOnCircle == CirclePosition.INSIDE || positionOnCircle == CirclePosition.ON_EDGE):
				#print("inside")
				badTriangles.append(triangle);
			pass;
				
		var polygon = [];
		#print("here ", badTriangles)
		for triangle in badTriangles:
			if (!isSharedEdge(badTriangles, triangle, [triangle[0], triangle[1]])):
				polygon.append([triangle[0], triangle[1]]);
			if (!isSharedEdge(badTriangles, triangle, [triangle[0], triangle[2]])):
				polygon.append([triangle[0], triangle[2]]);
			if (!isSharedEdge(badTriangles, triangle, [triangle[1], triangle[2]])):
				polygon.append([triangle[1], triangle[2]]);
				
		#print("poly",polygon)		
		for triangle in badTriangles:
			var index = fundTriantgleIndex(triangle)
			triangles.remove_at(index);
			#print(index);
		
		for edge in polygon:
			var newTriangle = [
				point,
				Vector2(edge[0]),
				Vector2(edge[1])
			]
			triangles.append(newTriangle);
			#drawLine(newTriangle[0], newTriangle[1], Color("CORAL"));
			#drawLine(newTriangle[1], newTriangle[2], Color("CORAL"));
			#drawLine(newTriangle[0], newTriangle[2], Color("CORAL"));
		#await get_tree().create_timer(2).timeout
	#var oryginalSuper =  getBigTriangle();
	#removeWithSuper(oryginalSuper);
	
	return;
	for tri in triangles:
		drawLine(tri[0], tri[1]);
		drawLine(tri[1], tri[2]);
		drawLine(tri[2], tri[0]);
	#	pass;

func removeWithSuper(oryginalSuper):
	var Clean = false;
	while !Clean:
		Clean = true;
		for tri in triangles:
			if (tri[0] == oryginalSuper[0] || tri[0] == oryginalSuper[1] || tri[0] == oryginalSuper[2] ||
				tri[1] == oryginalSuper[0] || tri[1] == oryginalSuper[1] || tri[1] == oryginalSuper[2] ||
				tri[2] == oryginalSuper[0] || tri[2] == oryginalSuper[1] || tri[2] == oryginalSuper[2] 
				):
				triangles.remove_at(fundTriantgleIndex(tri));
				Clean = false;
			


func VernoiDiagram():
	triangulation()
	
	#for triangle in triangles:
	#	var S = getTriangleCircumcenterCenter(triangle);
	#	polyLines.append(S);
		
	#for center in range(polyLines.size()-1):
	#	drawLine(polyLines[center], polyLines[center+1], Color("CORAL"))
	for triangle in triangles:
		for t2 in triangles:
			var a1 = triangle.find(t2[0]) != -1;
			var a2 = triangle.find(t2[1]) != -1;
			var a3 = triangle.find(t2[2]) != -1;
			if (a1 && a2) || (a2 && a3) || (a1 && a3):
				var S = getTriangleCircumcenterCenter(triangle);
				var S2 = getTriangleCircumcenterCenter(t2);
				if (polyLines.find([S,S2]) == -1 && polyLines.find([S2,S]) == -1):
					drawCross(S2, Color("BLUE_VIOLET"))
					drawCross(S, Color("BLUE_VIOLET"))
					drawLine(S, S2, Color("CORAL"))
					polyLines.append([S,S2]);
				#await get_tree().create_timer(dealay).timeout
	$Timer.start(timeToReset);

func squaredPolar(point,center):
	return Vector2(
		atan2(point.y - center.y, point.x - center.x),
		pow(point.x-center.x,2)+pow(point.y-center.y,2)
	)

func polyPointsCustomSort(a, b):
	print(a[0].x - b[0].x || a[0].y - b[0].y, " ", a[0].x - b[0].x," ", a[0].y - b[0].y)
	return a[0].x - b[0].x || a[0].y - b[0].y
		

func getPolygons():
	getAllLinesCenters();
	for centerIndex in range(points.size()):
		var newPoly = SimplePolygon.instantiate();
		newPoly.Center = points[centerIndex];
		for polyLine in range(polyLinesCenters.size()):
			var testLine = [polyLinesCenters[polyLine], points[centerIndex]];
			var isColliding = false;
			for collider in range(polyLinesCenters.size()):
				if (collider == polyLine):
					continue;
				if(intersect(testLine[0], testLine[1], polyLines[collider][0], polyLines[collider][1])):
					isColliding = true;
					break;
			if !isColliding:
				if (newPoly.polygonPoints.find(polyLines[polyLine][0]) == -1):
					newPoly.polygonPoints.append(polyLines[polyLine][0]);
				if (newPoly.polygonPoints.find(polyLines[polyLine][1]) == -1):
					newPoly.polygonPoints.append(polyLines[polyLine][1]);
		newPoly.polygonPoints = Geometry2D.convex_hull(newPoly.polygonPoints);
		polygons.append(newPoly);
		#newPoly.polygonPoints


func ccw(A : Vector2, B : Vector2, C : Vector2):
	return (C.y-A.y) * (B.x - A.x) > (B.y - A.y) * (C.x - A.x) 

func intersect(A : Vector2, B : Vector2, C : Vector2, D : Vector2):
	return ccw(A,C,D) != ccw(B,C,D) and ccw(A,B,C) != ccw(A,B,D);
	
func getAllLinesCenters():
	for line in polyLines:
		polyLinesCenters.append(getLineCenter(line[0], line[1]));

	
func getLineCenter(A : Vector2, B : Vector2):
	return Vector2(
		(A.x+B.x)/2,
		(A.y+B.y)/2
	)



# Called when the node enters the scene tree for the first time.
func _ready():
	var time_before = Time.get_ticks_msec()
	BOARD_SIZE = Vector2(1920,1080);

	getRandomPoints()

	
	VernoiDiagram()
	#print(points);

		
	
	var total_time = Time.get_ticks_msec() - time_before
	print("Time taken Vornoy: " + str(total_time))
	
	return;
	time_before = Time.get_ticks_msec()
	
	getPolygons();
	
	total_time = Time.get_ticks_msec() - time_before
	print("Time taken polygon determination: " + str(total_time))
	

	for point in range(polygons[5].polygonPoints.size()-1):
		drawLine(polygons[5].polygonPoints[point], polygons[5].polygonPoints[point+1], Color("RED"));
	
	return;
	var A = Vector2(100,100);
	var B = Vector2(0,100);
	var C = Vector2(50,500);
	var D = Vector2(50,100);
	print(intersect(A,B,C,D))
	
	return;
	var point1 = Vector2(500,412);
	var point2 = Vector2(123,412);
	var point3 = Vector2(500,1000);
	
	drawLine(point1, point2);
	drawLine(point1, point3);
	drawLine(point3, point2);
	
	
	var triangle = [point1,point2,point3];
	
	var S = getTriangleCircumcenterCenter(triangle);
	var R = getTriangleCircumcenterRadius(triangle);
	drawCross(S, Color(255,0,255))
	drawCircle(S,R)
	#drawLine(points[0], points[1]);


func deleteAllChilds(parent):
	for n in parent.get_children():
		parent.remove_child(n)
		n.queue_free()

func resetAll():
	BOARD_SIZE = Vector2(1920,1080);
	points = [];
	lines = [];
	polyLines = [];
	triangles = [];
	polyLinesCenters = [];
	
	deleteAllChilds($Circles);
	deleteAllChilds($Points);
	deleteAllChilds($Lines);

func _on_timer_timeout():
	resetAll();
	getRandomPoints()
	VernoiDiagram()
