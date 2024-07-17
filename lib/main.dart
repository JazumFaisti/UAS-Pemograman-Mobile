import 'package:flutter/material.dart';
import 'package:nft_market/presentation/pages/get_started_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://uzckazgpgqqsjdvhikks.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6Y2themdwZ3Fxc2pkdmhpa2tzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEwNzgxMzksImV4cCI6MjAzNjY1NDEzOX0.SoFA9tuh8FzECUfxik3zYFsugf_EgfT61KG4F_-MlZA");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
    );
  }
}
