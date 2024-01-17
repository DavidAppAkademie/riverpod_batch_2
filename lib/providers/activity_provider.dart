import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_batch_2/models/activity.dart';
import 'package:http/http.dart' as http;
part 'activity_provider.g.dart';

@riverpod
Future<Activity> fetchActivity(FetchActivityRef ref) async {
  // API CALL
  final response = await http.get(Uri.https('boredapi.com', '/api/activity'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
}
