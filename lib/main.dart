import 'package:flutter/material.dart' hide Characters;
import 'package:flutter/services.dart';
import 'package:game_characters_ui/ui/screens/charcters/characters_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Characters 3D',
    //  showPerformanceOverlay: true,
      theme: ThemeData(
       textTheme: GoogleFonts.firaSansCondensedTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Characters(),      
    );
  }


}
