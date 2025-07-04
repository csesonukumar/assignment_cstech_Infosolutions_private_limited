import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../widgets/gradient_button.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> languages = AppStrings.languages;

  @override
  Widget build(BuildContext context) {
    String? selectedLanguage;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.chooseLanguage,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languages.map((lang) {
                return DropdownMenuItem(
                  value: lang["code"],
                  child: Text(lang["name"]!),
                );
              }).toList(),
              onChanged: (value) => selectedLanguage = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: AppStrings.selectLanguage,
              ),
            ),
            SizedBox(height: 20),
            GradientButton(
              text: AppStrings.continueText,
              onPressed: () => Navigator.pushNamed(context, '/welcome'),
            ),
          ],
        ),
      ),
    );
  }
}