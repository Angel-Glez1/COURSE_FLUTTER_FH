void main(){
  
print(greetEveryone());
print(addTwoNumbers(10, 5));
print(addTwoNumbersOptional(12));
print(getName('Angel Armando'));

}


String getName (String name) => 'Hola $name';

String greetEveryone(){
  return 'Hola a todos :D';
}

int addTwoNumbers(int a, int b){
  return a + b;
}


int addTwoNumbersOptional(int a, [int b = 10]){
  //Otras formas de asignar valores por defecto.
  //b = b ?? 2;
  //b ??= 2:
  return a + b;
}
  


