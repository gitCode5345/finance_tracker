import 'package:finance_tracker/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL', fallback: ''),
    anonKey: dotenv.get('SUPABASE_ANON_KEY', fallback: ''),
  );

  runApp(MyApp());
}
