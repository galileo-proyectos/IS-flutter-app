class ModelPaymentIntent {
  final String clientSecret;

  ModelPaymentIntent.fromJson(Map<String, dynamic> json):
    clientSecret = json['client_secret'];
}