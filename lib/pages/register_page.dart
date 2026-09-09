import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/util/app_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kNavy,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white,fontSize:16),
            ),
          ),
        );
      },
    );
  }

  void signUserUp() async {
    showDialog(
      context:context,
      builder:(context) => const Center(child:CircularProgressIndicator()),
    );
    try {
    if (_passwordController.text == _confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } else {
      Navigator.pop(context);
      showErrorMessage("Şifreler eşleşmiyor!");
      return;
    }

    if (mounted) Navigator.pop(context);

  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    showErrorMessage(e.code);
  }
  }

  @override
  void dispose() { 
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(child: Center(
            child:SingleChildScrollView(
                child:Padding(
                    padding: const EdgeInsets.all(20.0),
                child:Column(mainAxisAlignment: MainAxisAlignment.center,children:[
                    TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,decoration: const InputDecoration(
                            labelText: 'E-posta', prefixIcon: Icon(Icons.email), border: OutlineInputBorder()),),
                            SizedBox(height: 15),
                            TextField(
                                controller: _passwordController,obscureText: true,decoration: const InputDecoration(
                                    labelText: 'Şifre', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()),),
                                    SizedBox(height:20),
                                    TextField(
                                controller: _confirmPasswordController,obscureText: true,decoration: const InputDecoration(
                                    labelText: 'Şifre Tekrar', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()),),
                                    SizedBox(height:20),
                                    ElevatedButton(
                                      onPressed: signUserUp, // Sadece burası değişti!
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(double.infinity, 50)),
                                        child: const Text('Kayıt Ol'),
                                        ),
                                    SizedBox(height: 10),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                        const Text('Zaten üye misin?'),
                                        TextButton(
                                            onPressed:() {
                                              Navigator.pop(context);
                                                        },
                                                        child: const Text('Giriş Yap'),)])
                            ])),
            ),
        ))
    );
  }
}