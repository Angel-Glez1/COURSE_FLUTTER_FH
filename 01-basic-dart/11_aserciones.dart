void main(){
  
  final result = Square( side: 5);
  print(result.calcularArea());
  print(result.area);

}

class Square {  

  double _side;

  Square({ required side }):
    assert(side >= 0, 'Side must be >= 0'),
    _side = side; 

  double get area{
    return _side;
   }

  set area(double area){
     _side = area;
  }

  
  double calcularArea(){
    return _side * _side;  
  }
}