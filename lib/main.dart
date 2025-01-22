import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/OrderList/particularDeliveryItemNotifier.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/OrderList/particularPickupItemNotifier.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/profileNotifier.dart';
import 'package:eatfit_delivery_partner/view/Account_Screen/account_Activity/account_Screen_assembled.dart';
import 'package:eatfit_delivery_partner/view/account_Screen_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Go_Router/Routing_setup.dart';
import 'app_components/bottomNavigation.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => profileNotifier()),
        ChangeNotifierProvider(create: (context) => getOrders_Notifier()),
        ChangeNotifierProvider(create: (context) => GetParticularDeliveryItem()),
        ChangeNotifierProvider(create: (context) => ParticularPickupItemNotifier()),
      ],

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'EatFit_Delivery',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouter().router,
       //home:MainRouteStarts(),
      ),
    );
  }
}


