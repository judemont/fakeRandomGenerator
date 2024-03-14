import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fakeRandomGenerator/widgets/settings.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var minController = TextEditingController();
  var maxController = TextEditingController();
  var wantedNumController = TextEditingController();
  var generatedNumber = 0;

  @override
  void initState() {
    super.initState();
    minController = TextEditingController(text: "1");
    maxController = TextEditingController(text: "100");
    wantedNumController = TextEditingController(text: "42");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Random Number Generator"),
        ),
        drawer: Drawer(
          child: Settings(
            wantedNumController: wantedNumController,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                generatedNumber.toString(),
                style: TextStyle(fontSize: 50),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: minController,
                decoration: const InputDecoration(labelText: "Minimum"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              TextField(
                controller: maxController,
                decoration: const InputDecoration(labelText: "Maximum"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onLongPress: generate,
                  onPressed: () => generate(realRandom: true),
                  child: Text("Generate"))
            ],
          ),
        ));
  }

  Future<void> generate({bool realRandom = false}) async {
    Random rndm = Random();
    int max = int.parse(maxController.text);
    int min = int.parse(minController.text);

    for (var i = 0; i < 50; i++) {
      setState(() {
        generatedNumber = rndm.nextInt(max - min) + min;
      });

      await Future.delayed(const Duration(milliseconds: 20));
    }
    if (!realRandom && generatedNumber <= max && generatedNumber >= min) {
      setState(() {
        generatedNumber = int.parse(wantedNumController.text);
      });
    }
  }
}
