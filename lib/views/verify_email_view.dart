import 'package:flutter/material.dart';
import 'package:mynotes/constants/route.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify email")),
      body: Column(
        children: [
          const Text("An email was sent  please Verify your email address"),
          const Text(
              "If you don't recive it in a while press the button  below"),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: const Text("Send another Email Verification"),
          ),
          TextButton(
              onPressed: () async {
                AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Restart'))
        ],
      ),
    );
  }
}
