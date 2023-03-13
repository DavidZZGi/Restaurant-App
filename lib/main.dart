import 'package:Ecommerce/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/config/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Simple_Bloc_Observer.dart';
import 'blocs/wishlist_bloc/wishlist_bloc_bloc.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBlocBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted()))
      ],
      child: MaterialApp(
        title: 'Shoper',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeAppScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
