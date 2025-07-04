import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_button.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import 'otp_verification_screen.dart';

class WelcomeSignupScreen extends StatefulWidget {
  const WelcomeSignupScreen({super.key});

  @override
  State<WelcomeSignupScreen> createState() => _WelcomeSignupScreenState();
}

class _WelcomeSignupScreenState extends State<WelcomeSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  AppStrings.welcomeTitle,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.registerSubtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 32),

                // Name Field
                CustomTextField(
                  controller: _nameController,
                  hintText: AppStrings.nameHint,
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email Field
                CustomTextField(
                  controller: _emailController,
                  hintText: AppStrings.emailHint,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppStrings.passwordHint,
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // WhatsApp Field
                CustomTextField(
                  controller: _whatsappController,
                  hintText: AppStrings.whatsappHint,
                  prefixIcon: Icons.phone_android, // Different phone icon
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter WhatsApp number';
                    }
                    if (value.length < 10) {
                      return 'Enter valid WhatsApp number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Mobile Field
                CustomTextField(
                  controller: _phoneController,
                  hintText: AppStrings.mobileHint,
                  prefixIcon: Icons.phone_android_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    if (value.length < 10) {
                      return 'Enter valid mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Signup Button
                GradientButton(
                  text: AppStrings.signupButton,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen(
                            email: _emailController.text,
                            whatsappNumber: _whatsappController.text,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Already have account
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.alreadyHaveAccount,
                        style: const TextStyle(color: AppColors.secondaryText),
                        children: [
                          TextSpan(
                            text: AppStrings.signinText,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    // Implement your API call here
    // Use http package to call your registration endpoint
    // Show loading indicator during API call
    // Handle success/error responses
  }
}