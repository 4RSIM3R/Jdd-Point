import 'package:get_it/get_it.dart';
import 'package:tes_flutter/network/getdata.dart';
import 'package:tes_flutter/serializer/serializer.dart';
import 'package:tes_flutter/state/balance.dart';
import 'package:tes_flutter/state/transaction.dart';

//Instance Pacakeg Get_It
GetIt locator = GetIt.I;

void setUpLocator(){
  //Model
  locator.registerFactory<Balance>(() => Balance());
  //LazySingleton
  locator.registerLazySingleton<GetData>(() => GetData());
}

// Factory: When you request an instance of the type from 
//the service provider you’ll get a new instance everytime. 
//Good for registering ViewModels that need to run the same logic 
// on start or that has to be new when the view is opened.

// Singleton: Singletons can be registered in two ways. 
//Provide an implementation upon registration 
// or provide a lamda that will be invoked the first time 
//your instance is requested (LazySingleton). The Locator 
//keeps a single instance of your registered type and will 
//always return you that instance.