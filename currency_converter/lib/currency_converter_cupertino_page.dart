import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPage();
}

class _CurrencyConverterCupertinoPage extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: Color.fromARGB(255, 99, 149, 255),
          middle: Text('Currency Converter'),
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
            Text(
              '₱ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
            ),

            Padding(
              padding:
                  const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 25),
              child: CupertinoTextField(
                controller: textEditingController,
                placeholder: 'Enter amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar_circle),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(64, 211, 211, 211),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50)
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
              child: CupertinoButton(
                  onPressed: () {
                    //debug console
                    try {
                      setState(() {
                        result = double.parse(textEditingController.text) * 56.3;
                      });
                    } catch (e) {}

                    build(context);
                  },
                  color: const Color.fromARGB(255, 99, 149, 255),
                  borderRadius: BorderRadius.circular(50),
                  child: const Text('Convert')),
            ),

            //clear button
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 16),
              child: CupertinoButton(
                onPressed: () {
                  textEditingController.clear();
                  setState(() {
                    result = 0;
                  });
                },
                color: CupertinoColors.systemRed,
                borderRadius: BorderRadius.circular(50),
                child: const Text('Clear'),
              ),
            )
          ]
        )
      )
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}