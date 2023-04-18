
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstScreen(),
  ));
}





class FirstScreen extends StatelessWidget {
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text('Disponibilité'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
                child: Text('Gestion de mon stationnement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






class SecondScreen extends StatelessWidget {
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
              Text('Disponibilité'),
              SizedBox(height: 20),
              Text('Item 1'),
              Text('Item 2'),
              Text('Item 3'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Retour'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
                child: Text('Payer'),
              ),
            ],
          ),
        ],
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
