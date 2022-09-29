import 'package:flutter/material.dart';

import '../../config.dart';

import '../bottom_navbar.dart';

// ignore: camel_case_types
class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// ignore: camel_case_types
class _LoginState extends State<Login> {
  bool isUserMode = true;
  bool isPassVisivible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            color: textheadlinecolor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            image(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              userbtn(),
              pinbtn(),
            ]),
            const SizedBox(
              height: 30,
            ),
            isUserMode ? buildUerLogin() : buildPINLogin(),
            login(),
          ],
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      margin: const EdgeInsets.only(right: 100, left: 100, bottom: 10),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mainLogo.png'),
        ),
      ),
    );
  }

  Widget userbtn() {
    return SizedBox(
      width: 150,
      height: 50,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          setState(() {
            isUserMode = true;
          });
        },
        color: isUserMode ? kPrymeryColor2 : kPrymeryColor1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7), bottomLeft: Radius.circular(7))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard,
              color: isUserMode ? Colors.white : textheadlinecolor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "User",
              style: TextStyle(
                color: isUserMode ? Colors.white : textheadlinecolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pinbtn() {
    return SizedBox(
      width: 150,
      height: 50,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          setState(() {
            isUserMode = false;
          });
        },
        color: !isUserMode ? kPrymeryColor2 : kPrymeryColor1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(7), bottomRight: Radius.circular(7))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard,
              color: !isUserMode ? Colors.white : textheadlinecolor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Pin",
              style: TextStyle(
                color: !isUserMode ? Colors.white : textheadlinecolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget email() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'EMAIL',
        ),
      ),
    );
  }

  Widget password() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: !isPassVisivible,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'PASSWORD',
          suffixIcon: isPassVisivible
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isPassVisivible = false;
                    });
                  },
                  child: const Icon(Icons.visibility))
              : InkWell(
                  onTap: () {
                    setState(() {
                      isPassVisivible = true;
                    });
                  },
                  child: const Icon(Icons.visibility_off)),
        ),
      ),
    );
  }

  Widget fpassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: InkWell(
            child: Text(
              "Forget Password?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget login() {
    return Center(
      child: SizedBox(
        width: 350,
        height: 50,
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NavBar()));
          },
          color: kPrymeryColor2,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: const Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPINLogin() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 82, top: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildPIN(first: true, last: false),
          buildPIN(first: false, last: false),
          buildPIN(first: false, last: false),
          buildPIN(first: false, last: true),
        ],
      ),
    );
  }

  Column buildUerLogin() {
    return Column(
      children: [
        email(),
        password(),
        const SizedBox(
          height: 15,
        ),
        fpassword(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget buildPIN({first, last}) {
    return SizedBox(
      //color: kPrymeryColor1,
      height: 85,

      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextFormField(
          autofocus: false,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kPrymeryColor1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kPrymeryColor2),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
