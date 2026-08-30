import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() { 
    _emailController.dispose();
    _passwordController.dispose();
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
                                    ElevatedButton(
                                        onPressed: () 
                                        {print("Giriş Yapılacak");},
                                    style:ElevatedButton.styleFrom(
                                        minimumSize: const Size(double.infinity,50)),child: const Text('Giriş Yap')),
                                    SizedBox(height: 10),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                        const Text('Hesabın yok mu?'),
                                        TextButton(
                                            onPressed:() {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:(context) => const RegisterPage(),),
                                                        );
                                                        },
                                                        child: const Text('Kayıt Ol'))])
                            ])),
            ),
        ))
    );
  }
}