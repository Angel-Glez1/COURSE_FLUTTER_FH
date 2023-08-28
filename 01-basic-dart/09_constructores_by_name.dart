void main(){


 final Map<String, dynamic>responseApi = {
   'name': 'Hukl',
   'power': 'Fuerza',
   'isAlive11': false,    
 };

 final Hero hero = Hero.fromApi(responseApi);
 print(hero.toString());
  
}

class Hero { 
 
  String name;
  String power; 
  bool isAlive;
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive,
  });


  Hero.fromApi(Map<String, dynamic> json): 
    name = json['name'] ?? 'Not foud name',
    power = json['power'] ?? 'Not Found power',
    isAlive = json['isAlive'] ?? false;
  

  @override 
  String toString(){
    return 'Nombre: $name, Poder: $power, Vive: ${ isAlive ? 'Yes' : 'Nop' }';  
  }

}
