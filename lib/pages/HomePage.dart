import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String outPut = "0";
  String operator = "";
  double num1 = 0.0;
  double num2 = 0.0;

  void whenPressedButton(String process) {
    setState(() {
      if (process == "C") {
        outPut = "";
        operator = "";
        num1 = 0.0;
        num2 = 0.0;
      } else if (process == "/" ||
          process == "*" ||
          process == "-" ||
          process == "+") {
        operator = process;
        num1 = double.parse(outPut);
        outPut = "";
      } else if (process == ".") {
        if (outPut.contains(".")) {
          return;
        } else {
          outPut = outPut + process;
        }
      } else if (process == "=") {
        num2 = double.parse(outPut);
        outPut = "";
        if (operator == "+") {
          outPut = (num1 + num2).toString();
        }
        if (operator == "-") {
          outPut = (num1 - num2).toString();
        }
        if (operator == "*") {
          outPut = (num1 * num2).toString();
        }
        if (operator == "/") {
          outPut = (num1 / num2).toString();
        }

        num1 = 0.0;
        num2 = 0.0;
        operator = "";
      } else {
        outPut = outPut + process;
      }
    });
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => whenPressedButton(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("Calculator App"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    outPut,
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('C'),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('='),
            ],
          ),
        ],
      ),
    );
  }
}
