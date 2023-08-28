void main(){
  
  final result = Square( side: 25);
  result.area = 12;
  print(result.calcularArea());
  print(result.area);

}



class Square {  

  double _side;

  Square({ required side }):
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