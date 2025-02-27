import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../configs/theme/app_colors.dart';
import '../../../view_model/view_model.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  void reassemble() {
    super.reassemble();
    context.read<SignupViewModel>().reassemble();
  }

  @override
  Widget build(BuildContext context) {
    final signupViewModel = context.read<SignupViewModel>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: signupViewModel.qrKey,
              onQRViewCreated: (p0) => signupViewModel.onQRViewCreated(context, p0),
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.primary,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
