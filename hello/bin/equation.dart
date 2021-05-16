import 'dart:io';

void main() {
  var x1 = 0, x2 = 0, y1 = 0, y2 = 0; //intiial values
  stdout.write('Enter the first co-ordinate.');
  print('(X,Y)');
  x1 = int.parse(stdin.readLineSync());
  y1 = int.parse(stdin.readLineSync());
  print('Enter the second co-ordinate.');
  x2 = int.parse(stdin.readLineSync());
  y2 = int.parse(stdin.readLineSync());

  var line = Line(point: Point(x: x1, y: y1), secondPoint: Point(x: x2, y: y2));
  line.printLine();
}

class Point {
  int x, y;
  Point({this.x, this.y});
}

class Line {
  var point = Point(x: 0, y: 0);
  var secondPoint = Point(x: 0, y: 0);
  var slope;
  var flag;

  Line({this.point, this.secondPoint}) {
    slope = (point.y - secondPoint.y) / (point.x - secondPoint.x);
    if (slope > 0 || slope < 0) //for checking error of 0/0 error
      flag = 1;
    else
      flag = -1;
  }
  void printLine() {
    if (flag == 1 && secondPoint.x != point.x) {
      stdout.write('y=');
      slope == 0
          ? stdout.write('${secondPoint.y}')
          : (-slope * secondPoint.x + secondPoint.y) >= 0
              ? stdout
                  .write('${slope}x+${-slope * secondPoint.x + secondPoint.y}')
              : stdout
                  .write('${slope}x${-slope * secondPoint.x + secondPoint.y}');
    } else if (secondPoint.x == point.x) {
      print('x=${secondPoint.x}');
    } else
      print(
          'Line cannot be printed. It\'s a point co-odinate that you entered.');
  }
}
