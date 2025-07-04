import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';
import '../widgets/otp_field.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  final String whatsappNumber;

  const OtpVerificationScreen({
    super.key,
    required this.email,
    required this.whatsappNumber,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                AppStrings.otpVerificationTitle,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.otpVerificationSubtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 32),

              // OTP Field
              OtpField(controller: _otpController),
              const SizedBox(height: 16),

              // WhatsApp Number Display
              Center(
                child: Text(
                  'Linked to: ${widget.whatsappNumber}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Resend OTP Text
              Center(
                child: GestureDetector(
                  onTap: _isLoading ? null : _resendOtp,
                  child: Text(
                    AppStrings.resendOtpText,
                    style: TextStyle(
                      color: _isLoading ? Colors.grey : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Verify Button
              GradientButton(
                text: AppStrings.verifyButton,
                onPressed: _isLoading ? null : _verifyOtp,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _verifyOtp() async {
    if (_otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter 6-digit OTP')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    // Navigate to sign-in page after verification
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
          (route) => false, // Remove all previous routes
    );
  }

  Future<void> _resendOtp() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent successfully')),
    );
  }
}