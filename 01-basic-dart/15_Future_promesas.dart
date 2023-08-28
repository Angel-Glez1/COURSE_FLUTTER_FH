void main() async {
  
  print('Inicio del programa');

  try{   
    final datos = await getHttp('https://api.test');
    print(datos);
    
  } on Exception catch(e){
    print('Tenemos una exception $e');
  
  }catch(err){
    print(err);
    
  }finally{
     print('Fin');
  }
  
  print('Fin del programa');
}


Future<String> getHttp(String url) async  {
  await Future.delayed(const Duration(seconds: 3));
  throw Exception('No hay datos en la url');
}


