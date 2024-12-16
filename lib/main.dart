import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tarea_app/navegadores/drawer.dart';
import 'package:tarea_app/screen1.dart';
import 'package:tarea_app/screens2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido a NoteKeeper"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: const MyDrawer(), // Aquí se agrega el Drawer personalizado
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/736x/69/48/da/6948dab430eacfc976d48eb22cdc998b.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "NoteKeeper",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "¡Gestiona tus notas de manera fácil y rápida!",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '"Organiza y recuerda todo en un solo lugar"',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: appLogo(),
                ),
                const SizedBox(height: 20),
                loginButton(context),
                const SizedBox(height: 10),
                registerButton(context),
                const Spacer(),
                footer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget loginButton(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () => navigateToLogin(context),
    label: const Text(
      "Iniciar Sesión",
      style: TextStyle(fontSize: 18),
    ),
    icon: const Icon(Icons.login_outlined, size: 20),
  );
}

Widget registerButton(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () => navigateToRegister(context),
    label: const Text(
      "Registrarse",
      style: TextStyle(fontSize: 18),
    ),
    icon: const Icon(Icons.app_registration_rounded, size: 20),
  );
}

void navigateToLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Screen2()),
  );
}

void navigateToRegister(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Screens1()),
  );
}

Widget appLogo() {
  return Image.network(
    "https://cdn-icons-png.flaticon.com/128/1828/1828884.png", // Cambié el logo a algo más relacionado con notas
    width: 300,
    height: 300,
  );
}

Widget footer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Desarrollado por:",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Nombre: Fernando Andrango",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "GitHub: vouNando",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}


