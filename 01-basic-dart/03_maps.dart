

// Un map es como un objeto liteal en javascript.
void main(){
  
  final Map<String, dynamic>pokemon = {
    'name': 'Pikachu',
    'hp': 100,
    'isAlive': true,
    'images' : <String>['back.png', 'background.png'],
    'porcentage': <int, String>{
      10: 'Casi Muerto',
      50: 'No te rindas aun tienes mucho por dar',
      100: 'Nadien puede contigo'
    }
  };

  print(pokemon);
  print(pokemon['name']);
  print('Nota: ${pokemon['porcentage'][10]}');
}