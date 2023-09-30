import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GET STARTED WITH \nresumeAI",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
              height: 0.9
            ),
          ),
          SizedBox(height: 30,),
          Text("Powered by OpenAi's GPT 3.5 Turbo Language Model", style: TextStyle(fontSize: 21, height: 1.7),),
        ],
      ),
    );
  }
}
