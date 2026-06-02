import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: ListView(
        children: [
          Pinput(
            length: 5,

            defaultPinTheme: PinTheme(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
              ),
            ),

            focusedPinTheme: PinTheme(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      Colors.deepPurple,
                  width: 2,
                ),
                borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
              ),
            ),
            onChanged: (value) {
              print("Changed: $value");
            },

            onCompleted: (pin) {
              print("Completed: $pin");
            },
          ),
        ],
      ),
    );
  }
}
