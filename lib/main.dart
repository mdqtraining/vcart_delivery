import 'package:eatfit_delivery_partner/Go_Router/routeDefination.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/OrderList/particularDeliveryItemNotifier.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/OrderList/particularPickupItemNotifier.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/profileNotifier.dart';
import 'package:eatfit_delivery_partner/view/order_Screen._Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Go_Router/Routing_setup.dart';



void main() async{
   // WidgetsFlutterBinding.ensureInitialized();
   // await profileNotifier().fetchProfileImageApi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        //deliveryPersonProfileNotifier
       // ChangeNotifierProvider(create: (context) => AccountProfileViewModel()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => profileNotifier()),
        ChangeNotifierProvider(create: (context) => getOrders_Notifier()),
        ChangeNotifierProvider(create: (context) => GetParticularDeliveryItem()),
        ChangeNotifierProvider(create: (context) => ParticularPickupItemNotifier()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreenStore1(),
        //routerConfig: AppRouter().router,
      ),
    );
  }
}


