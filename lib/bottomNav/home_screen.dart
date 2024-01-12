import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tambahkan tindakan yang ingin dilakukan ketika tombol ditekan
                print('Tombol Home ditekan');
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tombol Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Image.asset(
            //   'assets/welcome_image.png', // Gantilah dengan path gambar Anda
            //   height: 150,
            //   width: 150,
            // ),
          ],
        ),
      ),
    );
  }
}
