import 'dart:async';

class NameStream {
  final _nameController = StreamController<String>.broadcast();

  Stream<String> get nameStream => _nameController.stream;

  void changeName(String newName) {
    _nameController.sink.add(newName);
  }

  void dispose() {
    _nameController.close();
  }
}
