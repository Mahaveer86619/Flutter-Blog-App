import 'package:flutter/material.dart';
import 'package:supabase_blog/features/presentation/page/sign_up_page.dart';
import 'package:supabase_blog/features/presentation/widgets/auth_field.dart';
import 'package:supabase_blog/features/presentation/widgets/auth_grad_button.dart';

import '../../../core/theme/app_pallete.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const SignInPage(),
  );
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildUi(),
        ),
      ),
    );
  }

  Widget _buildUi() {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AuthField(
            hintText: "Email",
            controller: emailController,
          ),
          const SizedBox(
            height: 15,
          ),
          AuthField(
            hintText: "Password",
            controller: passwordController,
            isObscureText: true,
          ),
          const SizedBox(
            height: 25,
          ),
          const AuthGradButton(
            text: "Sign In",
            height: 57,
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                SignUpPage.route(),
              )
            },
            child: RichText(
              text: TextSpan(
                text: "Don't have an account?",
                style: theme.textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: " Sign Up.",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppPallete.gradient2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
