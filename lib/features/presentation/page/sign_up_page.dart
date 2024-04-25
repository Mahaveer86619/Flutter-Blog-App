import 'package:flutter/material.dart';
import 'package:supabase_blog/core/theme/app_pallete.dart';
import 'package:supabase_blog/features/presentation/page/sign_in_page.dart';
import 'package:supabase_blog/features/presentation/widgets/auth_field.dart';
import 'package:supabase_blog/features/presentation/widgets/auth_grad_button.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
            "Sign Up",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AuthField(
            hintText: "Name",
            controller: nameController,
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
            text: "Sign Up",
            height: 57,
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                SignInPage.route(),
              )
            },
            child: RichText(
              text: TextSpan(
                text: "Already have an account?",
                style: theme.textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: " Sign In.",
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
