import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/providers/ProviderStripe.dart';
import 'package:provider/provider.dart';

class ScreenPay extends StatefulWidget {
  const ScreenPay({super.key});

  @override

  State<ScreenPay> createState() => _ScreenPayState();
}

class _ScreenPayState extends State<ScreenPay> {
  final controller = CardFormEditController();

  @override
  void initState() {
    controller.addListener(update);
    super.initState();
  }

  void update() => setState(() {});

  @override
  void dispose() {
    controller.removeListener(update);
    controller.dispose();
    super.dispose();
  }

  void _handlePayPress () async {
    try {
      final paymentIntent = await Provider.of<ProviderCart>(context, listen: false).fetchPaymentIntent();

      if (paymentIntent != null) {
        await Stripe.instance.confirmPayment(
            paymentIntentClientSecret: paymentIntent.clientSecret,
            data: const PaymentMethodParams.card(
                paymentMethodData: PaymentMethodData(
                    billingDetails: BillingDetails(
                      email: 'alessandro.morales@galileo.edu',
                    )
                )
            )
        );

        Provider.of<ProviderCart>(context, listen: false).emptyCart();
        // [P] go to confirmation
        print('Me debes \$100');
      } else {
        // [P] show generic error
      }
    } on StripeException catch (e) {
      // [P] show declined error message
    } catch (e) {
      // [P] generic error error message
    }

  }

  @override
  Widget build (BuildContext ctx) {
    return Center(

      child: Column(
        children: [
          CardFormField(
            controller: controller,
            countryCode: 'GT',
            enablePostalCode: false,
          ),
          Visibility(visible: controller.details.complete, child: ElevatedButton(onPressed: _handlePayPress, child: const Text('Pay On'))),
          Visibility(visible: !controller.details.complete, child: ElevatedButton(onPressed: () {}, child: const Text('Pay Off')))
        ]
      )
    );
  }
}
