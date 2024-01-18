class Activity {
  final String activity;
  final double? price;

  Activity({required this.activity, required this.price});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json["activity"],
      price: json["price"],
    );
  }
}
