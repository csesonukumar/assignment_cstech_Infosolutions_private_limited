import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/user_greeting_card.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import '../widgets/calling_list_drawer.dart';

class DashboardPage extends StatelessWidget {
  final String userName;
  final String? userImageUrl;

  const DashboardPage({
    super.key,
    required this.userName,
    this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            const Text(
              AppStrings.dashboardTitle,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.headset_mic_outlined, color: Colors.black87),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.dashboardLightBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            // User Greeting Card
            UserGreetingCard(
              userName: userName,
              imageUrl: userImageUrl,
            ),
            const SizedBox(height: 25),

            // Load Numbers Card
            DashboardCard(
              headerColor: AppColors.dashboardDarkBlue,
              headerText: AppStrings.loadNumbersTitle,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                      children: [
                        const TextSpan(text: 'Visit '),
                        TextSpan(
                          text: AppStrings.calleyUrl,
                          style: const TextStyle(
                            color: AppColors.dashboardPrimary,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.loadNumbersText
                              .replaceFirst('%s', AppStrings.calleyUrl),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/d7fe63dd-7d18-420c-a5c2-e339fba93b88.png',
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 250,
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: Icon(Icons.broken_image_outlined, size: 40, color: Colors.grey),
                        ),
                      ),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              children: [
                // WhatsApp Button
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.dashboardGreen, width: 2),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {}, // WhatsApp functionality
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone,
                        color: AppColors.dashboardGreen,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Start Calling Button
                Expanded(
                  child: GradientButton(
                    text: AppStrings.startCalling,
                    onPressed: () => _showCallingListDrawer(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavBarIcon(Icons.home_outlined),
          _buildNavBarIcon(Icons.contact_page_outlined),
          _buildPlayButton(),
          _buildNavBarIcon(Icons.call_outlined),
          _buildNavBarIcon(Icons.calendar_month_outlined),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: Colors.grey.shade600,
      iconSize: 28,
    );
  }

  Widget _buildPlayButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dashboardPrimary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.dashboardPrimary.withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.play_arrow_rounded),
        color: Colors.white,
        iconSize: 36,
      ),
    );
  }

  // Inside your DashboardPage class, add:
  void _showCallingListDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CallingListDrawer(),
    );
  }
}