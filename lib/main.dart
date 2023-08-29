import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isOn = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(isOn ? "ON" : "OFF"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: CustomButton(
                  onPressed: () {

                    setState(() {

                    print('Primer botón presionado');
                    isOn = true;
                                          
                                        });

                  },
                  buttonColor: Colors.green,
                  buttonText: 'ON',
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    // Action when the second button is pressed
                    print('Segundo botón presionado');
                    print(isOn);
                  },
                  buttonColor: Colors.yellow,
                  buttonText: 'AYUDA',
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    // Action when the third button is pressed
                    setState(() {

                    print('Tercer botón presionado');
                    isOn = false;
                                          
                                        });
                  },
                  buttonColor: Colors.red,
                  buttonText: 'SALIR',
                ),
              ),
            ],
          ),
        ),

    );

  }



}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonText;

  const CustomButton({
    required this.onPressed,
    required this.buttonColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: const Size(double.infinity, 0),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
