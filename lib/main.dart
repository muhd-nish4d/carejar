import 'package:carejar/models/doctor_model/doctors_model.dart';
import 'package:carejar/provider/details_provider.dart';
import 'package:carejar/provider/doctors_provider.dart';
import 'package:carejar/screens/splash/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DoctorModelAdapter().typeId)) {
    Hive.registerAdapter(DoctorModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //This provider work for get the doctors list such as
        //name, id, and username
        ChangeNotifierProvider(
          create: (context) => DoctorsProvider(),
        ),
        //This provider work for get the doctors details from firebase
        //such as specialy, education and training and language spoken
        ChangeNotifierProvider(
          create: (context) => DetailsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.signikaNegativeTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
