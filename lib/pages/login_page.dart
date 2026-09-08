import 'package:flutter/material.dart';
import 'package:to_do_app/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/util/app_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kNavy,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      if (mounted) Navigator.pop(context);
      
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-credential') {
        showErrorMessage("E-posta veya şifre hatalı!");
      } 
      else if (e.code == 'invalid-email') {
        showErrorMessage("Geçerli bir e-posta adresi giriniz!");
      }
      else {
        showErrorMessage("Bir hata oluştu: ${e.code}"); 
      }
  }
  }

  @override
  void dispose() { 
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-posta', 
                        prefixIcon: Icon(Icons.email), 
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Şifre', 
                        prefixIcon: Icon(Icons.lock), 
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                    
                      onPressed: signUserIn, 
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)
                      ),
                      child: const Text('Giriş Yap')
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Hesabın yok mu?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text('Kayıt Ol')
                        )
                      ]
                    )
                  ]
                )
              ),
            ),
          )
        )
    );
  }
}