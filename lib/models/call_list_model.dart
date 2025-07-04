class CallListModel {
  final int pending;
  final int called;
  final int rescheduled;
  final List<dynamic> calls;

  CallListModel({
    required this.pending,
    required this.called,
    required this.rescheduled,
    required this.calls,
  });

  factory CallListModel.fromJson(Map<String, dynamic> json) {
    return CallListModel(
      pending: json['pending'] ?? 0,
      called: json['called'] ?? 0,
      rescheduled: json['rescheduled'] ?? 0,
      calls: json['calls'] ?? [],
    );
  }

  int get totalCalls => pending + called + rescheduled;
}