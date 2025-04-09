import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopBar(),
      body: HomeBodyApp(), // Ensure HomeBodyApp is in the body here
    );
  }
}

class HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTopBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("History Calculator App"),
      titleTextStyle: TextStyle(
        color: const Color(0xFF000000),
        fontSize: 20,
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF2196F3),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); // Standard AppBar height
}

class HomeBodyApp extends StatefulWidget {
  const HomeBodyApp({super.key});

  @override
  _HomeBodyAppState createState() => _HomeBodyAppState();
}

class _HomeBodyAppState extends State<HomeBodyApp> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _displayAnswer = ''; // Store the answer as a string
  Color _answerColor = const Color(0xFF000000);

  void _getAge() {
    final int currentYear = int.tryParse(_firstNumberController.text) ?? 0;
    final int birthYear = int.tryParse(_secondNumberController.text) ?? 0;

    if (currentYear > 0 && birthYear > 0) {
      final int age = currentYear - birthYear;
      setState(() {
        _displayAnswer = 'Your Age: $age years';
        _answerColor = Colors.green; // Color for successful calculation
      });
    } else {
      setState(() {
        _displayAnswer = 'Invalid input, please enter valid years.';
        _answerColor = Colors.red; // Color for error message
        
      });
    }

    _firstNumberController.clear();
    _secondNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTextField('Enter the current year', _firstNumberController),
            const SizedBox(height: 20),
            _buildTextField('Enter the year you were born', _secondNumberController),
            const SizedBox(height: 30),
            _buildButton('Calculate', _getAge, const Color(0xFFE040FB)),
            const SizedBox(height: 20),
            // Display the answer here
            Text(
              _displayAnswer,
              style: TextStyle(
                fontSize: 24,
                color: _answerColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
