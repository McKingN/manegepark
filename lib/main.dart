import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ManegePark',
      routes: {
        '/': (context) => const MyHomePage(),
        '/welcome': (context) => const WelcomeScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text('Welcome!', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showWelcomeScreen() {
  Navigator.of(context).pushNamed('/welcome');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Center(
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.black;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
            ),
            onPressed: _showWelcomeScreen,
            child: const Text('NOS PARKINGS DISPONIBLES'),
          ),
          const SizedBox(height: 25),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.black;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
            ),
            onPressed: _showWelcomeScreen,
            child: const Text('GERER MON STATIONNEMENT'),
          ),
              ],
        ),
      ),
    );
  }
}



class Authentification extends StatelessWidget {
  const Authentification({super.key});

  TextEditingController _pinCodeController = TextEditingController();
  String _pinCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text('Welcome!', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}




class ThirdScreen extends StatefulWidget {
  
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {


 
  TextEditingController _pinCodeController = TextEditingController();
  String _pinCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/step1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gestion de mon stationnement'),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: true,
                keyboardType: TextInputType.number,
                onChanged: (pinCode) {
                  setState(() {
                    _pinCode = pinCode;
                  });
                },
                controller: _pinCodeController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  selectedFillColor: Color.fromARGB(255, 202, 108, 108),
                  selectedColor: Color.fromARGB(255, 60, 189, 77),
                  inactiveFillColor: Color.fromARGB(255, 58, 45, 104),
                  inactiveColor: Color.fromARGB(255, 155, 25, 122),
                  activeFillColor: Color.fromARGB(255, 197, 204, 98),
                  activeColor: Color.fromARGB(255, 39, 117, 161),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_pinCode == '1234') {
                    // Replace this with your own authentication logic
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Authentification reussie')),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Code incorrect')),
                    );
                  }
                },
                child: Text('S\'authentifier'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}