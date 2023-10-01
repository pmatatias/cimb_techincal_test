import 'package:cimb_technical_test/src/utils/konstanta.dart';
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
      body: Center(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Email',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBE2EF),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: bxShadow,
                      ),
                      height: 60.0,
                      child: TextFormField(
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter your email',
                          // hintStyle: TextStyle(color: Colors.black),
                        ),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBE2EF),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: bxShadow,
                      ),
                      height: 60.0,
                      child: TextFormField(
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        controller: _passwordCtrl,
                        obscureText: _isObscure,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                      ),
                    )
                  ],
                ),
              ],
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
