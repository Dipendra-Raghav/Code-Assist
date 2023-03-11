import 'dart:isolate';

import 'package:code_assist/core/common/loader.dart';
import 'package:code_assist/core/constants/constants.dart';
import 'package:code_assist/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/signin_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Code Assist'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Constants.logopath,
                height: 40,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Lets get code SORTED',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  Constants.emotepath,
                  height: 400,
                ),
              ),
              const SignInButton(),
            ]),
    );
  }
}
