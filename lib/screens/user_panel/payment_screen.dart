import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = 'UPI';
  final promoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Text("Select Payment Method", style: TextStyle(fontWeight: FontWeight.bold)),
          Column(children: ['UPI', 'Card', 'Wallet'].map((method) {
            return RadioListTile<String>(
              title: Text(method),
              value: method,
              groupValue: selectedMethod,
              onChanged: (val) => setState(() => selectedMethod = val!),
            );
          }).toList()),
          SizedBox(height: 10),
          TextField(
            controller: promoCtrl,
            decoration: InputDecoration(labelText: "Promo Code", suffixIcon: Icon(Icons.discount)),
          ),
          SizedBox(height: 20),
          Text("Total Amount: ₹300", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.confirmation);
            },
            child: Text("Confirm & Pay"),
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          )
        ]),
      ),
    );
  }
}
