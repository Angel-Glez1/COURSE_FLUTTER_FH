void main(){
  
  final numbers = <int>[1,2,3,4,5,5,5,6,7,8,9,9];
  print('Number $numbers');
  print('Length ${ numbers.length }');
  print('Frist Element ${ numbers[0] }  ${numbers.first} ');
  print('Last Elemnt ${ numbers.last } ');

  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()} ');
  print('Set:  ${reversedNumbers.toSet()} ');

  final numbersGreaterThan5 = numbers.where((int num){
    return num > 5;
  });

  print('>5 ${numbersGreaterThan5.toSet()}');
  print('>5 ${numbersGreaterThan5.toList()}');
}