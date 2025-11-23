import 'package:flutter/material.dart';

List<Motorcycle> motorcycle = [
  Motorcycle('dugati', 12000),
  Motorcycle('yamaha', 14000),
  Motorcycle('BMW', 30000),
  Motorcycle('honda', 8000)
];

class Motorcycle {
  String model;
  int price;
  int warranty = 1;
  bool insurance = false;
  Motorcycle(this.model, this.price);

  @override
  String toString() {
    return '$model Price: \$$price';
  }

  String getTotalPrice() {

    int insuranceAmount = insurance ? 1000 : 0;
    if (warranty == 1) {
      return (price * 1.0 + insuranceAmount).toStringAsFixed(0);
    }
    return (price * 1.1 + insuranceAmount).toStringAsFixed(0);
  }
}

class MyDropdownMenuWidget extends StatefulWidget {
  const MyDropdownMenuWidget({required this.updateMotorcycle, super.key});
  final Function(Motorcycle) updateMotorcycle;

  @override
  State<MyDropdownMenuWidget> createState() => _MyDropdownMenuWidgetState();
}

class _MyDropdownMenuWidgetState extends State<MyDropdownMenuWidget> {

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210.0,
        initialSelection: motorcycle[0],
        onSelected: (motorcycle) {
          setState(() {
            widget.updateMotorcycle(motorcycle as Motorcycle);
          });
        },
        dropdownMenuEntries: motorcycle.map<DropdownMenuEntry<Motorcycle>>((Motorcycle motorcycle) {
          return DropdownMenuEntry(value: motorcycle, label: motorcycle.toString());
        }).toList());
  }
}

class WarrantyWidget extends StatefulWidget {

  WarrantyWidget({required this.motorcycle, required this.updateWarranty, super.key});
  final Function(int) updateWarranty;
  Motorcycle motorcycle;

  @override
  State<WarrantyWidget> createState() => WarrantyWidgetState();
}

class WarrantyWidgetState extends State<WarrantyWidget> {
  int _years = 1;

  @override
  Widget build(BuildContext context) {

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Warranty', style: TextStyle(fontSize: 15.0),),
      Radio(
        value: 1,
        groupValue: widget.motorcycle.warranty,
        onChanged: (val) {
          setState(() {
            _years = val as int;
            widget.updateWarranty(_years);
          });
        },
      ),
      const Text('1 year', style: TextStyle(fontSize: 15.0)),
      Radio(
        value: 5,
        groupValue: widget.motorcycle.warranty,
        onChanged: (val) {
          setState(() {
            _years = val as int;
            widget.updateWarranty(_years);
          });
        },
      ),
      const Text('5 years', style: TextStyle(fontSize: 15.0),)
    ]);
  }

}
