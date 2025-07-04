import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../models/call_list_model.dart';
import '../services/api_service.dart';
import '../widgets/ring_chart.dart';
import '../widgets/status_card.dart';
import '../widgets/gradient_button.dart';

class GraphViewScreen extends StatefulWidget {
  final String listId;
  final String email;

  const GraphViewScreen({
    super.key,
    required this.listId,
    required this.email,
  });

  @override
  State<GraphViewScreen> createState() => _GraphViewScreenState();
}

class _GraphViewScreenState extends State<GraphViewScreen> {
  late Future<CallListModel> _callListFuture;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _callListFuture = _fetchCallList();
  }

  Future<CallListModel> _fetchCallList() async {
    setState(() => _isLoading = true);
    try {
      final data = await ApiService.fetchCallList(widget.listId, widget.email);
      return data;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _callListFuture = _fetchCallList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: const Text(
          AppStrings.graphViewTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_phone_outlined, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<CallListModel>(
        future: _callListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load data'),
                  ElevatedButton(
                    onPressed: _refreshData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final callData = snapshot.data!;
          final totalCalls = callData.totalCalls;

          return RefreshIndicator(
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  // Test List Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                AppStrings.testList,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '$totalCalls',
                                      style: const TextStyle(color: AppColors.primaryBlue),
                                    ),
                                    const TextSpan(
                                      text: ' ${AppStrings.totalCalls}',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Ring Chart
                  RingChart(
                    pending: callData.pending,
                    completed: callData.called,
                    rescheduled: callData.rescheduled,
                  ),
                  const SizedBox(height: 40),

                  // Status Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusCard(
                        title: AppStrings.pending,
                        value: callData.pending,
                        color: AppColors.chartOrange,
                      ),
                      StatusCard(
                        title: AppStrings.done,
                        value: callData.called,
                        color: AppColors.chartGreen,
                      ),
                      StatusCard(
                        title: AppStrings.scheduled,
                        value: callData.rescheduled,
                        color: AppColors.chartPurple,
                      ),
                    ],
                  ),
                  const Spacer(),

                  // Start Calling Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GradientButton(
                      text: AppStrings.startCalling,
                      onPressed: () {
                        // Implement start calling functionality
                      },
                      isLoading: _isLoading,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}