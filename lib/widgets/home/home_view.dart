import 'package:flutter/material.dart';
import 'package:login_methods/widgets/login_methods/google_sign_in_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yöntemini Seçiniz'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildListLoginButton(
                    'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_960_720.png',
                    'Google',
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInGoogle()),
                        )),
              ]),
        ),
      ),
    );
  }

  ElevatedButton buildListLoginButton(
      String imageUrl, String title, Function() goToPage) {
    return ElevatedButton(
        onPressed: goToPage,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Image(
                height: 60,
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ));
  }
}
