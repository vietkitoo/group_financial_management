import 'package:flutter/material.dart';
import '../logic/name_stream.dart';

class WelcomePage extends StatefulWidget {
  final NameStream nameStream;

  const WelcomePage({super.key, required this.nameStream});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    widget.nameStream.changeName(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Please enter your name:'),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Your name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onNameChanged,
              child: Container(color: Colors.red, height: 10, width: 10),
            ),
          ],
        ),
      ),
    );
  }
}
