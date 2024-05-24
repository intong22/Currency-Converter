import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});

  @override
  State createState(){
    return _CurrencyConverterState();
  }
}

class _CurrencyConverterState extends State{
  
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  
  //avoids memory leaks
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 149, 255),
        title: const Text('Currency Converter'),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '₱ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}', 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 25),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter amount in USD',
                  prefixIcon: Icon(Icons.monetization_on),
                  filled: true,
                  fillColor: Color.fromARGB(64, 211, 211, 211),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                      ),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            
            //buttons
            //elevated
            //appears like text
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: TextButton(
                onPressed: (){
                  //debug console
                  try{
                    setState(() {
                      result = double.parse(textEditingController.text) * 56.3;
                    });
                  }
                  catch (e){}

                  build(context);
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 99, 149, 255),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Convert')
                ),
            ),

            //clear button
            Padding(
              padding:  const EdgeInsets.only(right: 20, left: 20, top: 16),
              child: TextButton(
                onPressed: (){
                  textEditingController.clear();
                  setState(() {
                    result = 0;
                  });
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Clear'),
              ),
            )
            ]
        )
      )
    );
  }
}
