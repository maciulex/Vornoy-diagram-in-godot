GDPC                 �                                                                         T   res://.godot/exported/133200997/export-15375209140619de2ccf37fb23fa3f5a-point.scn   0>      �      �Ϫ4l��Z�����"�    T   res://.godot/exported/133200997/export-28e28515b12724653b014f41a64850aa-Vornoy.scn  A            ��#ceIz���E�H80    X   res://.godot/exported/133200997/export-52da0abab86e6d1a7311a08b23751124-main_game.scn    8      #      e/"��#��H�~_#�    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex       ^      2��r3��MgB�[79       res://.godot/uid_cache.bin  �T      w       �e�J3�O�a�ɉ�       res://Circle.gd         �      k��t�8��B:c�       res://Vornoy.tscn.remap D      c       -�9A!�a9�=�2o       res://icon.svg  �D      N      ]��s�9^w/�����       res://icon.svg.import   `      �       �9��X7�^1��AG$'�       res://main_game.gd  0      �&      ��=�Eb�}��+��{R       res://main_game.tscn.remap  0C      f       *]���25�<}��."�       res://point.tscn.remap  �C      b       K1CN����/ �ӆ�       res://project.binaryPU      �      Z�+�wP�ׇ0�tQ��    m�~�list=Array[Dictionary]([])
#�
extends Node2D

var center : Vector2 = Vector2(0,0);
var radius : int = 0; 

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 2048
	var points_arc = [];

	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.append(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)

func _draw():
	var angle_from = 0
	var angle_to = 360
	var color = Color(1.0, 0.0, 0.0)
	draw_circle_arc(center, radius, angle_from, angle_to, color)

func update(centeri, radiusi):
	center = centeri;
	radius = radiusi;
	_draw();
�GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  �U[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cqxgo30ye03t5"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 i��
���� �F�dPextends Node2D


@export var AMOUNT_OF_POINTS : int = 40;
@export var dealay : float = 0.0;
@export var timeToReset : float = 3;
var BOARD_SIZE : Vector2;
var MARGIN_FOR_POINTS = 20;
var POINTS_MINIMUM_DISTANCE = 90;

var points  : Array;
var lines   : Array;
var centers : Array;
var triangles : Array;
enum CirclePosition {INSIDE, ON_EDGE, OUTSIDE}
var pointNode = preload("res://point.tscn");



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

class Polygon:
	var points : Array = [];
	var lines  : Array = [];
	var centerPoint : int;

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

func getClosestPointIndex(Point, exceptions) -> Array:
	var lowestDist	    = -1;
	var lowestDistIndex = -1;
	for i in range(AMOUNT_OF_POINTS):
		if (i == Point || exceptions.find(i) != -1):
			continue;
			
		var distance = getDst(points[Point],points[i])
		
		if (lowestDist == -1):
			lowestDist = distance;
			lowestDistIndex = i;
			continue;
		if (distance < lowestDist):
			lowestDist = distance;
			lowestDistIndex = i;
	return [lowestDistIndex, lowestDist];

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
		(1080/2)-A/2-margin,
		0-margin
	)
	var b = Vector2(
		(1080/2)+A/2+margin,
		0-margin
	)
	var c = Vector2(
		A/2,
		2500+margin
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
	var oryginalSuper =  getBigTriangle();
	#removeWithSuper(oryginalSuper);
	
	for tri in triangles:
		#drawLine(tri[0], tri[1]);
		#drawLine(tri[1], tri[2]);
		#drawLine(tri[2], tri[0]);
		pass;

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
	var centers = []
	triangulation()
	#for triangle in triangles:
	#	var S = getTriangleCircumcenterCenter(triangle);
	#	centers.append(S);
		
	#for center in range(centers.size()-1):
	#	drawLine(centers[center], centers[center+1], Color("CORAL"))
	for triangle in triangles:
		for t2 in triangles:
			var a1 = triangle.find(t2[0]) != -1;
			var a2 = triangle.find(t2[1]) != -1;
			var a3 = triangle.find(t2[2]) != -1;
			if (a1 && a2) || (a2 && a3) || (a1 && a3):
				var S = getTriangleCircumcenterCenter(triangle);
				var S2 = getTriangleCircumcenterCenter(t2);
				drawCross(S, Color("BLUE_VIOLET"))
				drawCross(S2, Color("BLUE_VIOLET"))
				centers.append([S,S2]);
				drawLine(S, S2, Color("CORAL"))
				await get_tree().create_timer(dealay).timeout
	$Timer.start(timeToReset);
		
# Called when the node enters the scene tree for the first time.
func _ready():
	BOARD_SIZE = Vector2(1920,1080);

	getRandomPoints()
	VernoiDiagram()
	#print(points);
	
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

func _on_timer_timeout():
	BOARD_SIZE = Vector2(1920,1080);
	points = [];
	lines = [];
	centers = [];
	triangles = [];
	var node2d = Node2D;
	
	deleteAllChilds($Circles);
	deleteAllChilds($Points);
	deleteAllChilds($Lines);
	
	getRandomPoints()
	VernoiDiagram()
�C9�lRSRC                     PackedScene            ��������                                               	   Camera2D    resource_local_to_scene    resource_name    interpolation_mode    offsets    colors    script 	   gradient    width    use_hdr 	   _bundled       Script    res://main_game.gd ��������   Script    res://Circle.gd ��������      local://Gradient_f0skw �          local://GradientTexture1D_qqfiw �         local://PackedScene_ao4t8 )      	   Gradient             GradientTexture1D                          PackedScene    
      	         names "      
   main_game    script    Node2D    Background 	   position    scale    texture 	   Sprite2D    Points    RemoteTransform2D    remote_path 	   Camera2D    Line2D    width    Lines    Circle    Circles    Timer    _on_timer_timeout    timeout    	   variants    	             
    @�D ��C
   ����)�o�         
     �@              
     oD �D     �?               node_count    
         nodes     X   ��������       ����                            ����                                       ����                	   	   ����         
                       ����                           ����                           ����                      ����                           ����                      ����              conn_count             conns        	                              node_paths              editable_instances              version             RSRC P�+͐<�S�X�8RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_51q5p �          PackedScene          	         names "         point    Node2D    Line2D    points    Line2D2 	   position    	   variants       %                �?  �?
     �?    %                ��  �?      node_count             nodes        ��������       ����                      ����                            ����                         conn_count              conns               node_paths              editable_instances              version             RSRCRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_yreiy �          PackedScene          	         names "         Node2D    	   variants              node_count             nodes        ��������        ����              conn_count              conns               node_paths              editable_instances              version             RSRC���k�N[remap]

path="res://.godot/exported/133200997/export-52da0abab86e6d1a7311a08b23751124-main_game.scn"
����H���c�[remap]

path="res://.godot/exported/133200997/export-15375209140619de2ccf37fb23fa3f5a-point.scn"
�8���2���O���C[remap]

path="res://.godot/exported/133200997/export-28e28515b12724653b014f41a64850aa-Vornoy.scn"
;WE_� i� �t<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
�   ܤ�v�b|R   res://icon.svg6���	��a   res://main_game.tscn��A.)Gv   res://point.tscn./����)   res://Vornoy.tscnP,�\ ��ECFG      application/config/name         Voronoi diagram    application/run/main_scene         res://main_game.tscn   application/config/features(   "         4.0    GL Compatibility       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      �  #   display/window/size/viewport_height      8  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility�F�4D�����\��T