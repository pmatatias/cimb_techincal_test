import 'package:cimb_technical_test/src/utils/konstanta.dart';
import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.cPurple,
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 380),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: bxShadow,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 80),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem Ipsum App",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Email',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          final isValid =
                              RegExp(emailPattern).hasMatch(value ?? '');
                          if (!isValid) {
                            return "Email not valid";
                          }
                          return null;
                        },
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Palette.fillColor,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter your email',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Password',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        controller: _passwordCtrl,
                        obscureText: _isObscure,
                        validator: (value) {
                          final isValid =
                              RegExp(passwordPattern).hasMatch(value ?? '');

                          if (!isValid) {
                            return "Password must contain uppercase, lowercase, number and special character";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          filled: true,
                          errorMaxLines: 2,
                          fillColor: Palette.fillColor,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.grey),
                          suffixIconConstraints: const BoxConstraints(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              _isObscure = !_isObscure;
                              setState(() {});
                            },
                          ),
                          hintText: 'Enter your password',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(16)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                              (route) => false);
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
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

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }
}
