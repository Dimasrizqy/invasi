import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  String? value = '';
  bool isFlashOn = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: const Color.fromRGBO(78, 130, 110, 1),
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller != null) {
                isFlashOn
                    ? controller!.toggleFlash()
                    : controller!.toggleFlash();
                setState(() {
                  isFlashOn = !isFlashOn;
                });
              }
            },
            child: Text(isFlashOn ? 'Matikan Flash' : 'Aktifkan Flash'),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      // Tindakan yang ingin Anda lakukan setelah berhasil memindai QR code
      value = scanData.code;
      if (!isLoading) {
        isLoading = true;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Hasil Pemindaian QR Code"),
              content: Text("Hasil Pemindaian: $value "),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    isLoading =
                        false; // Setelah dialog ditutup, atur isLoading ke false
                  },
                  child: const Text("Tutup"),
                ),
              ],
            );
          },
        );
      } //ini
      // Anda dapat menambahkan logika lain atau navigasi ke halaman lain di sini
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
