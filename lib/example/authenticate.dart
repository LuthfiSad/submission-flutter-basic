import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  // Validate function for empty fields
  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Information'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Table(
                  border: TableBorder.all(color: Colors.grey),
                  children: [
                    TableRow(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Email',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_emailController.text),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Password',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_passwordController.text),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      _emailController.clear();
      _passwordController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        'LOGIN',
                        style:
                            TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
              
                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                      ),
                      validator: (value) => _validateField(value, 'Email'),
                      enabled: !_isLoading,
                    ),
                    const SizedBox(height: 10),
              
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText, // Menyembunyikan teks password
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => setState(() {
                            _obscureText = !_obscureText;
                          }), // Toggle icon
                        ),
                      ),
                      validator: (value) => _validateField(value, 'Password'),
                      enabled: !_isLoading,
                    ),
                    const SizedBox(height: 20),
              
                    // Submit Button
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _isLoading ? Colors.grey : Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: Text(
                        "Sign In".toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text('or sign in with'),
                      // child: Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text('Don\'t have an account? '),
                      //     TextButton(
                      //       style: TextButton.styleFrom(
                      //         padding:
                      //             EdgeInsets.zero, // Mengatur padding ke nol
                      //         minimumSize:
                      //             Size.zero, // Mengatur ukuran minimum ke nol
                      //         tapTargetSize: MaterialTapTargetSize
                      //             .shrinkWrap, // Mengurangi ukuran target tap
                      //         // visualDensity: VisualDensity
                      //         //     .compact, // Mengurangi density visual
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(0),
                      //         ),
                      //       ),
                      //       onPressed: () {
                      //         showDialog(
                      //             context: context,
                      //             builder: (BuildContext context) {
                      //               return AlertDialog(
                      //                 title: const Text('Register'),
                      //                 content: const Text(
                      //                     'Are you sure you want to register?'),
                      //                 actions: <Widget>[
                      //                   TextButton(
                      //                     child: const Text('Cancel'),
                      //                     onPressed: () {
                      //                       Navigator.pop(context);
                      //                     },
                      //                   ),
                      //                   TextButton(
                      //                     child: const Text('Register'),
                      //                     onPressed: () {
                      //                       Navigator.pop(context);
                      //                     },
                      //                   ),
                      //                 ],
                      //               );
                      //             });
                      //         // Navigator.of(context).push(MaterialPageRoute(
                      //         //   builder: (BuildContext context) =>
                      //         //       AlertDialog(
                      //         //     title: const Text('Register'),
                      //         //     content: const Text(
                      //         //         'Are you sure you want to register?'),
                      //         //     actions: <Widget>[
                      //         //       TextButton(
                      //         //         child: const Text('Cancel'),
                      //         //         onPressed: () {
                      //         //           Navigator.pop(context);
                      //         //         },
                      //         //       ),
                      //         //       TextButton(
                      //         //         child: const Text('Register'),
                      //         //         onPressed: () {
                      //         //           Navigator.pop(context);
                      //         //         },
                      //         //       ),
                      //         //     ],
                      //         //   ),
                      //         // ));
                      //       },
                      //       child: const Text('Register',
                      //           style: TextStyle(color: Colors.blue)),
                      //     ),
                      //   ],
                      // ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.all(10),
                          ),
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.all(10),
                          ),
                          icon: const Icon(
                            Icons.tram_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.all(10),
                          ),
                          icon: const Icon(
                            Icons.tram_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
