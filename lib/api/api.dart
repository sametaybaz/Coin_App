import 'package:http/http.dart' as http;

/* class CryptoRank {
  static const String apiKey = 'c5bfe72968a6cd5b2f760dfe998c2bc3b3539d79b1ada2f2383ea3074085';
  final String _apiBaseUrl = "https://api.cryptorank.io";
  final String _apiPath = "/v1";

  Future<dynamic> cryptocurrency(String endpoint) async {

    final Uri uri = Uri.parse(_apiBaseUrl + _apiPath + endpoint);

    final response = await http.get(uri, headers: {
      'api_key': apiKey,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('API request failed with status code: ${response.statusCode}');
    }
  }
} */

class CryptoRank {
  static const String apiKey = 'c5bfe72968a6cd5b2f760dfe998c2bc3b3539d79b1ada2f2383ea3074085';
  final String _apiBaseUrl = "https://api.cryptorank.io";
  final String _apiPath = "/v1";

  Future<dynamic> cryptocurrency(String endpoint) async {
    final Uri uri = Uri.parse('$_apiBaseUrl$_apiPath$endpoint?api_key=$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('API request failed with status code: ${response.statusCode}');
    }
  }
}
