import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Home%20Screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String passw = "123456";
  bool password = true;
  String pass = "";
  gohomescreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  showdialog() {
    setState(() {
      addDialogbox(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/2.gif",
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            Center(
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: textfield(emailcontroller)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Flexible(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        pass = value;
                      });
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      label: const Text(
                        "Password",
                        style: TextStyle(color: Colors.orange),
                        // selectionColor: Colors.orange,
                      ),
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.orange,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            password = !password;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    obscureText: password,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.orange, width: 3),
                  minimumSize: const Size(200, 60),
                  primary: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    pass == passw ? gohomescreen() : showdialog();
                  });
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Not Have an Account? Register.",
                  style: TextStyle(color: Colors.orange),
                ))
          ],
        ),
      ),
    );
  }

//appbar widget
  AppBar appbar() {
    return AppBar(
      backgroundColor: white,
      title: const Text(
        "Login",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget textfield(final emailcontroller) {
    return TextField(
      controller: emailcontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        label: const Text(
          "Email",
          style: TextStyle(color: Colors.orange),
        ),
        prefixIcon: const Icon(Icons.email, color: Colors.orange),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, color: Colors.orange),
          onPressed: () => emailcontroller.clear(),
        ),
      ),
    );
  }

  void addDialogbox(
    BuildContext context,
  ) =>
      showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          title: Text("Wrong Password"),
          content: Text("Please try again"),
        ),
      );
}
