import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'theme/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  String error = "";
  bool loading = false;

  Future<void> signup() async {
    setState(() {
      loading = true;
      error = "";
    });

    final res = await http.post(
      Uri.parse("https://coffee-store-backend-wmt5.onrender.com/auth/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name.text,
        "email": email.text,
        "password": password.text,
      }),
    );

    if (res.statusCode == 201) {
      Navigator.pop(context);
    } else {
      setState(() {
        error = jsonDecode(res.body)["message"];
      });
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientBg),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Create Account ☕",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: coffeeBrown,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _input(name, "Name", Icons.person),
                  const SizedBox(height: 12),
                  _input(email, "Email", Icons.email),
                  const SizedBox(height: 12),
                  _input(password, "Password", Icons.lock, obscure: true),

                  if (error.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(error, style: const TextStyle(color: Colors.red)),
                  ],

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loading ? null : signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: coffeeBrown,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(TextEditingController c, String hint, IconData icon,
      {bool obscure = false}) {
    return TextField(
      controller: c,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: cream,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
