void main(){
  
  // Tipos de datos
  const String pokemon = 'Pichaku';
  const int hp = 100;
  const bool isAlive = true;
  final List<String> abilities = ['impostor', 'super-fuerza']; // array
  final images = <String>['cara.png', 'back.png'];

  // Dymanic 
  dynamic errorMessage = "Usuario y/o contraseña invalidos";
  errorMessage = true;
  errorMessage = [1,2,3,4,5,6,7];
  errorMessage = {1,2,3,4,5,6}; // set
  
  print("""
   $pokemon
   $hp
   $isAlive
   $abilities
   $images
   $errorMessage
  """);



}