import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _contactsMaterialButton(context),
          ),
        ],
      ),
    );
  }
  Material _contactsMaterialButton(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          _goToContactList(context);
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 100,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Icon(
                Icons.people,
                size: 24.0,
              ),
              Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goToContactList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ContactsList(),
      ),
    );
  }
}
