import "dart:convert";
import "dart:io";
import "package:http/http.dart";

import "package:zapit/Assets/api_key.dart";
import "package:zapit/Models/crypto_info_model.dart";

class CryptoRepository {
  String url = "www.alphavantage.co";

  Future<CryptoInfoModel> getCryptoInfo(String symbol) async {
    final queryParameters = {
      'function': 'DIGITAL_CURRENCY_DAILY',
      'symbol': symbol,
      'market': 'INR',
      'apikey': API_KEY
    };
    final uri = Uri.https(url, '/query', queryParameters);

    print(uri);

    final response = await get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print(data["Meta Data"]);

      data = data["Time Series (Digital Currency Daily)"]
          [data["Meta Data"]["6. Last Refreshed"].toString().substring(0, 10)];

      return CryptoInfoModel(
        open: double.parse(data["1a. open (INR)"]),
        high: double.parse(data["2a. high (INR)"]),
        low: double.parse(data["3a. low (INR)"]),
        close: double.parse(data["4a. close (INR)"]),
        volume: double.parse(data["5. volume"]),
        market_cap: double.parse(data["6. market cap (USD)"]),
      );
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
