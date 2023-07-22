import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shopping_hub/pages/contact-us.dart';
import 'package:shopping_hub/pages/home_page.dart';
import 'package:shopping_hub/pages/profile.dart';
import 'package:shopping_hub/pages/promotions.dart';
import 'package:shopping_hub/pages/purchase-history.dart';
import 'package:shopping_hub/pages/settings.dart';

import 'auth.dart';
import 'model/cart_model.dart';
import 'model/categoary_model.dart';
import 'model/favourite_provider.dart';
import 'model/item_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => AuthProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoaryModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => FavouriteModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          fontFamily: 'Roboto',
          primaryColor: HexColor("#0EC42B"),
          dialogBackgroundColor: HexColor("#C8FFC1"),

        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          fontFamily: 'Roboto',
          primaryColor: HexColor("#0EC42B"),
          dialogBackgroundColor: HexColor("#C8FFC1"),
        ),

        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/profile': (context) => const profile(),
          '/purchase-history': (context) => const purchasehistory(),
          '/contact-us': (context) => const contactus(),
          '/settings': (context) => const settings(),
          '/promotions': (context) => const promotions(),
        },
      ),
    );
  }
}

