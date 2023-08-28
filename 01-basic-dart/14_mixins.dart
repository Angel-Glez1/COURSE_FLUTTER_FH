abstract class Animal {}


abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}


mixin class Caminante {
  void caminar () => print('Estoy Caminado');
}

mixin class Volador {
  void volar () => print('Estoy Volando');
}

mixin class Nadador {
  void nadar () => print('Estoy Nadador');
}



class Delfin extends Mamifero with Volador {}
class Perro extends Mamifero with Nadador, Caminante {}
class Pato extends Ave with Nadador, Volador, Caminante{}


void main (){

  final sofy = Perro();
  sofy.nadar();
  sofy.caminar();


  final lucas = Pato();
  lucas.caminar();
  lucas.nadar();
  lucas.volar();
}