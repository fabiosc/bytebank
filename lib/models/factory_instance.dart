import 'package:bytebank/database/dao/interface_repository.dart';

import 'contact.dart';

T? createInstanceOf<T extends Entity>() {
  final factories = <Type, T Function()>{
    Contact: () => Contact() as T,
  };

  final createInstance = factories[T];

  return createInstance?.call(); // Same as createInstance() but null safety
}