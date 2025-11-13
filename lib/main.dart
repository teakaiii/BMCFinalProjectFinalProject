import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

// --- APP COLOR PALETTE ---
const Color kRichBlack = Color(0xFF1D1F24); // Dark black
const Color kBrown = Color(0xFF8B5E3C);     // Main coffee brown
const Color kLightBrown = Color(0xFFD2B48C);// Lighter tan
const Color kOffWhite = Color(0xFFF8F4F0);  // Background off-white

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Charlotte Folk',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kBrown,
            brightness: Brightness.light,
            primary: kBrown,
            onPrimary: Colors.white,
            secondary: kLightBrown,
            background: kOffWhite,
            surface: Colors.white,
            onSurface: kRichBlack,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: kOffWhite,
          textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
            displayLarge: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme).displayLarge,
            displayMedium: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme).displayMedium,
            displaySmall: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme).displaySmall,
            headlineMedium: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme).headlineMedium,
            headlineSmall: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme).headlineSmall,
            titleLarge: GoogleFonts.playfairDisplayTextTheme(Theme.of(context).textTheme).titleLarge,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kBrown,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            labelStyle: TextStyle(color: kBrown.withOpacity(0.8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kBrown, width: 1.5),
            ),
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shadowColor: kRichBlack.withOpacity(0.1),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: kOffWhite,
            foregroundColor: kRichBlack,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: GoogleFonts.playfairDisplay(
              color: kRichBlack,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
