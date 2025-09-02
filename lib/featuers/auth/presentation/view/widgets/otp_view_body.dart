import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/active_reset_cubit/active_reset_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  int seconds = 60; // مدة العداد
  late final ticker;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void _activeRest(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<ActiveResetCubit>().futureActiveReset(
        email: widget.email,
        code: otpController.text.trim(),
      );
    }
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
            Image.asset(AppAssets.otpImage, height: 150),

            const SizedBox(height: 10),
            Text(
              "Please enter the 4 digit code sent to:",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              widget.email,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // إدخال الكود
            PinCodeTextField(
              appContext: context,
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 40,
                fieldWidth: 20,
                activeFillColor: Colors.white,
              ),
              onChanged: (value) {},
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: verifyCode,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text("Verify Code"),
            ),

            const SizedBox(height: 10),
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
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
