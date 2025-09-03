import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
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
  int seconds = 60;
  late final ticker;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void _activeRest(BuildContext context) {
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
      if (mounted && seconds > 0) {
        setState(() {
          seconds--;
        });
      }
    });
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(AppAssets.otpImage, height: 150),

              const SizedBox(height: 10),
              const Text(
                "Please enter the 6 digit code sent to:",
                style: TextStyle(fontSize: 16),
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

              PinCodeTextField(
                appContext: context,
                controller: otpController,
                length: 6,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the code";
                  }
                  if (value.length < 6) {
                    return "Code must be 6 digits";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),

              const SizedBox(height: 20),

              BlocConsumer<ActiveResetCubit, ActiveResetState>(
                listener: (context, state) {
                  if (state is ActiveResetSucess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("✅ Verification successful"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // تروح لصفحة reset password
                    GoRouter.of(context).push(AppRouter.KCreateNewPass,extra: widget.email);
                  } else if (state is ActiveResetFalier) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMassge),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ActiveResetLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () => _activeRest(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text("Verify Code"),
                  );
                },
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
                    // TODO: استدعاء Cubit عشان يرسل كود جديد
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
      ),
    );
  }
}
