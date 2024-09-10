import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/components/PrimaryButton.dart';
import 'package:women_safety_app/components/custom_textfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;

  _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());
        _showMessage(context, 'Password reset email has been sent!');
      } on FirebaseAuthException catch (e) {
        _showMessage(context, e.message ?? 'An error occurred');
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter your email address and we will send you a link to reset your password.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: 'Enter your email',
                keyboardtype: TextInputType.emailAddress,
                controller: _emailController,
                validate: (email) {
                  if (email!.isEmpty || !email.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              PrimaryButton(
                title: 'Reset Password',
                onPressed: _resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
