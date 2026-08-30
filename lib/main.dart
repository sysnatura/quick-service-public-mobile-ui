import 'package:aqscustomer/providers/change_password_provider.dart';
import 'package:aqscustomer/providers/delete_customer_address.dart';
import 'package:aqscustomer/providers/get_all_bookings_provider.dart';
import 'package:aqscustomer/providers/get_all_city_provider.dart';
import 'package:aqscustomer/providers/get_all_country_provider.dart';
import 'package:aqscustomer/providers/get_all_state_provider.dart';
import 'package:aqscustomer/providers/get_customer_address.dart';
import 'package:aqscustomer/providers/get_service_questions_provider.dart';
import 'package:aqscustomer/providers/get_single_address_provider.dart';
import 'package:aqscustomer/providers/login.dart';
import 'package:aqscustomer/providers/real_estate_provider.dart';
import 'package:aqscustomer/providers/service_category_provider.dart';
import 'package:aqscustomer/providers/service_list_provider.dart';
import 'package:aqscustomer/providers/single_customer_provider.dart';
import 'package:aqscustomer/providers/update_profile_provider.dart';
import 'package:aqscustomer/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  SharedPreferences.setMockInitialValues({});
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ServiceCategoryProvider>(create: (_) => ServiceCategoryProvider()),
  ChangeNotifierProvider<ServiceListProvider>(create: (_) => ServiceListProvider()),
  ChangeNotifierProvider<GetCustomerAddressProvider>(create: (_)=>GetCustomerAddressProvider()),
  ChangeNotifierProvider<DeleteCustomerAddressProvider>(create: (_)=>DeleteCustomerAddressProvider()),
  ChangeNotifierProvider<LoginProvider>(create: (_)=>LoginProvider()),
  ChangeNotifierProvider<SingleCustomerProvider>(create: (_)=>SingleCustomerProvider()),
  ChangeNotifierProvider<ChangePasswordProvider>(create: (_)=>ChangePasswordProvider()),
  ChangeNotifierProvider<RealEstateProvider>(create: (_)=>RealEstateProvider()),
  ChangeNotifierProvider<GetAllCountryProvider>(create: (_)=>GetAllCountryProvider()),
  ChangeNotifierProvider<GetAllStateProvider>(create: (_)=>GetAllStateProvider()),
  ChangeNotifierProvider<GetAllCityProvider>(create: (_)=>GetAllCityProvider()),
  ChangeNotifierProvider<GetAllBookingsProvider>(create: (_)=>GetAllBookingsProvider()),
  ChangeNotifierProvider<UpdateProfileProvider>(create: (_)=>UpdateProfileProvider()),
  ChangeNotifierProvider<GetSingleAddressProvider>(create: (_)=>GetSingleAddressProvider()),
  ChangeNotifierProvider<GetServiceQuestionsProvider>(create: (_)=>GetServiceQuestionsProvider()),

];

