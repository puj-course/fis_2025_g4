import 'dart:convert';
import 'package:http/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

enum HttpMethod { get, post, put, delete }

@injectable
class CloudFunctionsHelper {
  final FirebaseProvider _firebaseProvider;
  final String _baseFunctionUrl = 'https://us-central1-top-app-cbef2.cloudfunctions.net';

  CloudFunctionsHelper({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider;

  Future<Map<String, dynamic>> callFunction({
    required String functionName,
    required HttpMethod method,
    Map<String, dynamic>? body,
  }) async {
    try {
      final String functionUrl = '$_baseFunctionUrl/$functionName';

      // Create the request headers
      final Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
      };

      // Convert body to JSON string if it exists
      final String? jsonBody = body != null ? jsonEncode(body) : null;

      // Make the HTTP request based on the method
      final Response response = switch (method) {
        HttpMethod.get =>
          await _firebaseProvider.httpClient.get(Uri.parse(functionUrl), headers: headers),
        HttpMethod.post => await _firebaseProvider.httpClient
            .post(Uri.parse(functionUrl), headers: headers, body: jsonBody),
        HttpMethod.put => await _firebaseProvider.httpClient
            .put(Uri.parse(functionUrl), headers: headers, body: jsonBody),
        HttpMethod.delete => await _firebaseProvider.httpClient
            .delete(Uri.parse(functionUrl), headers: headers, body: jsonBody),
      };

      // Check if the request was successful
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to call function $functionName: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
