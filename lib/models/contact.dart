import 'package:bytebank/database/dao/interface_repository.dart';

class Contact implements Entity{
  final int? id;
  final String? name;
  final int? accountNumber;

  Contact({
    this.id,
    this.name,
    this.accountNumber,
  }
  );

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }

  @override
  ContactEntity getEntityUtil() {
    return ContactEntity();
  }
}

class ContactEntity implements EntityUtil<Contact>{
  static const String _tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';
  static const String _whereSetence = 'id = ?';

  @override
  String getTableName() {
    return _tableName;
  }

  @override
  String getTableSql() {
    return _tableSql;
  }

  @override
  String getWhereSetence(Contact contact) {
    return _whereSetence.replaceAll("?", contact.id.toString());
  }

  @override
  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contactMap = <String, dynamic>{};
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  @override
  List<Contact> toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        id: row[_id],
        name: row[_name],
        accountNumber: row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

  @override
  bool isNull(Contact contact) {
    return contact.id == null ||
        contact.name == null ||
        contact.accountNumber == null;
  }
}
