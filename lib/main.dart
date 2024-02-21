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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = " ";
  var bgColor = Colors.indigo.shade300;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text('BMI App')),
      ),
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfff6d365),Color(0xfffda085),Color(0xfffbc2eb),Color(0xffe6dee9)
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('B M I',style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                ),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(

                    label: Text('Enter Your Waight (in Kgs) '),
                    prefixIcon: Icon(Icons.line_weight_rounded),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in feet)'),
                    prefixIcon: Icon(Icons.height_outlined)
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height(in inch)'),
                    prefixIcon: Icon(Icons.height_rounded),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                    height: 50,
                    width: 150,
                    color: Colors.green.shade300,
                    child: ElevatedButton(onPressed: (){
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      // if blanks are empty anyone then
                      if(wt!= "" && ft!= "" && inch!= ""){
                        // BMI Calculation here
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);

                        // CONVERSION INT TO METER CM AND METER
                        var tInch = (ift * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tm = tCm / 100;

                        //BMI CALCULATION
                        var bmi = iwt / (tm * tm);
                        var msg = "";

                        // color declaration
                        if(bmi > 25){
                          msg = "You are OverWeighted";
                          bgColor = Colors.orange.shade200;

                        }else if(bmi <18){
                          msg = "You are underWeighted";
                          bgColor = Colors.red.shade200;

                        }else{

                          msg = "You are healthy";
                          bgColor = Colors.green.shade300;
                        }

                        // called setstate
                        setState(() {
                          result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      }
                      else{

                        setState(() {
                          result = " Please fill all the blanks!!";
                        });
                      }
                    }, child: Text('Calculate',
                      style:
                    TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    ))),
SizedBox(height: 20,),
                Text(result,style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 20),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
