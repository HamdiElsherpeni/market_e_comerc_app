import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  int seconds = 60; // مدة العداد
  late final ticker;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    ticker = Stream.periodic(const Duration(seconds: 1), (x) => x);
    ticker.listen((value) {
      if (mounted) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        }
      }
    });
  }

  void verifyCode() {
    String otp = otpController.text;
    if (otp.length == 4) {
      // هنا تقدر تستدعي API للتحقق من الكود
      print("Entered OTP: $otp");
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter 4 digits")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification Code"),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // صورة توضيحية
            Image.asset(AppAssets.otpImage, height: 200),

            const SizedBox(height: 20),
            Text(
              "Please enter the 4 digit code sent to:",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              widget.phoneNumber,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // إدخال الكود
            PinCodeTextField(
              appContext: context,
              controller: otpController,
              length: 4,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 60,
                fieldWidth: 50,
                activeFillColor: Colors.white,
              ),
              onChanged: (value) {},
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyCode,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text("Verify Code"),
            ),

            const SizedBox(height: 20),
            Text(
              "00:${seconds.toString().padLeft(2, '0')}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (seconds == 0) {
                  setState(() {
                    seconds = 60;
                    startTimer();
                  });
                }
              },
              child: const Text(
                "Resend Code",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
