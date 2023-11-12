import 'package:multi_screen_app/src/models/ModelPaymentIntent.dart';
import 'package:multi_screen_app/src/providers/DefaultProvider.dart';
import 'package:multi_screen_app/src/models/ApiResponse.dart';
import 'package:multi_screen_app/src/providers/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderStripe extends DefaultProvider {
  ProviderStripe(super.ctx);

  Future<ModelPaymentIntent?> fetchPaymentIntent () async {
    onLoading();

    // fetch
    final http.Response httpResult = await http.get(
        Uri.http(BaseAPI.authority, '${BaseAPI.routes['cart']}/payment_intent'),
        headers: BaseAPI.authHeaders(user.token)
    );
    print(httpResult.body);

    // parse http result
    final ApiResponse response = ApiResponse.fromJson(jsonDecode(httpResult.body));

    // convert to list
    offLoading();
    if (response.isSuccess()) {
      return ModelPaymentIntent.fromJson(response.results);
    } else {
      return null;
    }
  }
}