import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogle extends StatefulWidget {
  @override
  State createState() => SignInGoogleState();
}

class SignInGoogleState extends State<SignInGoogle> {
  UserCredential? userCredential;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: Center(child: _buildBody()));
  }

  Widget _buildBody() {
    if (userCredential != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListTile(
              leading: Image.network(userCredential!.user!.photoURL.toString()),
              title: Text(userCredential!.user!.displayName ?? ''),
              subtitle: Text(userCredential!.user!.email.toString()),
            ),
          ),
          const Text(
            "Signed in successfully.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: ElevatedButton(
                onPressed: _signOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image(
                        height: 50,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_960_720.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(flex: 5, child: Text('Sign Out'))
                  ],
                )),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            "You are not currently signed in.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: ElevatedButton(
                onPressed: signInWithGoogle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image(
                        height: 50,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_960_720.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(flex: 5, child: Text('Google Sign In'))
                  ],
                )),
          )
        ],
      );
    }
  }

  //Sign In Google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      setState(() {
        userCredential = value;
      });
    });
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Sign Out Google
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      userCredential = null;
    });
  }
}
