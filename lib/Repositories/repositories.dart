import "dart:convert";
import "package:http/http.dart";
import "package:zapit/Assets/api_key.dart";

class CryptoRepository {
  String url = "https://www.alphavantage.co/";

  getCryptoInfo(String symbol) async {
    Response response = await get(Uri.https(url, "", {
      'function': 'DIGITAL_CURRENCY_DAILY',
      'symbol': symbol,
      'market': 'INR',
      'apikey': API_KEY
    }));

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body)["data"]
          ["Time Series (Digital Currency Daily)"];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
