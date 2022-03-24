import 'package:bytebank/database/repository/contact_repository.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final Contact? contact;

  const ContactForm({Key? key,
    this.contact,
  }) : super (key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final ContactRepository _contactRepository = ContactRepository();

  @override
  Widget build(BuildContext context) {
    String titleText = 'New Contact';
    String buttonText = 'Save new contact';
    if (widget.contact != null) {
      _nameController.text = widget.contact?.name ?? "";
      _accountNumberController.text =
          widget.contact?.accountNumber.toString() ?? "";
      titleText = 'Edit Contact';
      buttonText = 'Save';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full name',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(
                  labelText: 'Account number',
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(buttonText),
                  onPressed: () => saveContact(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveContact(BuildContext context) {
    bool isNewContact = widget.contact != null ? false : true;
    final Contact newContact = Contact(
      id: isNewContact ? 0 : widget.contact?.id,
      name: _nameController.text,
      accountNumber: int.tryParse(_accountNumberController.text),
    );
    if (newContact.id == 0) {
      _contactRepository.save(newContact).then((id) => Navigator.pop(context));
    } else {
      _contactRepository
          .update(newContact)
          .then((id) => Navigator.pop(context));
    }
  }
}
