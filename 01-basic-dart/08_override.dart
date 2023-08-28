void main(){

 final Hero spiderMan = Hero(name:'Dc. Strager');

 print(spiderMan.toString());
 print(spiderMan.name);
 print(spiderMan.power);

}

class Hero {
  String name;
  int? power; 

  Hero({
    required this.name,
    this.power = 0
  });

  @override // Indica que vamos a sobreescribir un metodo existe del la clase
  String toString(){
    return 'Hola $name tu poder es de $power';  
  }

}


  


