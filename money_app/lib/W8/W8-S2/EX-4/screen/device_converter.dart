import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

enum Device {
  riel(toDollars: 4000, label: 'riel'),
  dong(toDollars: 25402, label: 'dong'),
  euros(toDollars: 0.95, label: 'euros');

  final double toDollars;
  final String label;
  const Device({required this.toDollars, required this.label});
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  double device = 0;
  Device deviceType = Device.riel;

  double get amount => device * deviceType.toDollars;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              setState(() {
                device = double.parse(value);
              });
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white)),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          // Text(deviceType.label),
          DropdownButton(
            value: deviceType,
            items: const [
              DropdownMenuItem(
                value: Device.riel,
                child: Text('riel'),
              ),
              DropdownMenuItem(
                value: Device.dong,
                child: Text('dong'),
              ),
              DropdownMenuItem(
                value: Device.euros,
                child: Text('euros'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                deviceType = value!;
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(amount.toString()))
        ],
      )),
    );
  }
}
