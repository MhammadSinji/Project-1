import 'package:flutter/material.dart';
import 'motorcycle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String totalPrice = motorcycle.first.getTotalPrice();
  Motorcycle motorcycle = motorcycle.first;

  void updateMotorcycle(Motorcycle motorcycle) {
    setState(() {
      this.motorcycle = motorcycle;
      totalPrice = motorcycle.getTotalPrice();
    });
  }

  void updateWarranty(int warranty) {
    setState(() {
      motorcycle.warranty= warranty;
      totalPrice = car.getTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: Center(
              child: Column(children: [
              const SizedBox(height: 15.0),
              const Text('Select Model', style: TextStyle(fontSize: 25.0)),
              const SizedBox(height: 10.0),
              MyDropdownMenuWidget(updateMotorcycle: updateMotorcycle),
              const SizedBox(height: 10.0),
              WarrantyWidget(updateWarranty: updateWarranty, motorcycle: motorcycle),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Insurance', style: TextStyle(fontSize: 18.0)),
                  Checkbox(value: motorcycle.insurance, onChanged: (bool? value) {
                    setState(() {
                      motorcycle.insurance = value as bool;
                      totalPrice = motorcycle.getTotalPrice();
                  });
              })]),
              const SizedBox(height: 10.0),
              Text('Total Price: $totalPrice', style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
            ])));
  }
}