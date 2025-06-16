class AttendanceModel {
  final String state;
  final String timestamp;

  AttendanceModel({required this.state, required this.timestamp});

  Map<String, dynamic> toJson() => {
        'state': state,
        'timestamp': timestamp,
      };

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      state: json['state'],
      timestamp: json['timestamp'],
    );
  }
}