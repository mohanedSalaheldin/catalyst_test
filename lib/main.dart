import 'package:catalyst_test/home.dart';
import 'package:catalyst_test/injection.dart';
import 'package:catalyst_test/src/features/bloc_observer.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set the Bloc observer
  Bloc.observer = const SimpleBlocObserver();
  // Initialize dependency injection

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UsersCubit>()..getAllUsers(),
        )
      ],
      child: MaterialApp(
        title: 'Catalyst',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: HexColor('#eeede7'),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
            titleSmall: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: const ColorScheme.light(),
          useMaterial3: true,
        ),
        // home: const UsersScreen(),
        home: const HomeScreen(),
      ),
    );
  }
}
