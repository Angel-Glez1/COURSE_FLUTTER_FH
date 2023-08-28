void main(){


    final windPlant = WindPlant( initialEnergy: 1000 );
    print(windPlant);


}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  
    double energyLeft;
    PlantType type;


    EnergyPlant({
      required this.energyLeft,
      required this.type
    });


    void consumeEnergy(double amount);

    void otroMetodo();
}


class WindPlant extends EnergyPlant {
  
    WindPlant({ required double initialEnergy })
        :super( energyLeft: initialEnergy, type: PlantType.wind);

    @override
    void consumeEnergy(double amount){
      energyLeft -= amount;
    }

    @override
    void otroMetodo(){
        print('Otro Method');
    }
      
}


class NuclearPlant implements EnergyPlant {

    @override
    double energyLeft;

    @override
    PlantType type = PlantType.nuclear;


    NuclearPlant({
      required this.energyLeft,
    });

    
    @override
    void consumeEnergy(double amount){
    }

    @override
    void otroMetodo(){
    }
  
}