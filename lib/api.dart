import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiBase = 'http://192.168.1.4:3000'; // your PC LAN IP

class PageData {
  final String title;
  final String body;
  PageData({required this.title, required this.body});

  factory PageData.fromJson(Map<String, dynamic> j) =>
      PageData(title: j['title'] ?? '', body: j['body'] ?? '');
}

Future<PageData> fetchPage(String id) async {
  final resp = await http.get(Uri.parse('$apiBase/api/page/$id'));
  if (resp.statusCode != 200) {
    throw Exception('HTTP ${resp.statusCode}: ${resp.body}');
  }
  return PageData.fromJson(json.decode(resp.body));
}
