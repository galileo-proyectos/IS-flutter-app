import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/providers/ProviderStripe.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
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
        print('Me debes ');
        context.go('/cart/pay/success');

      } else {
        // [P] show generic error
      }
    } on StripeException catch (e) {
      // [P] show declined error message
      print("error Stripe Exception");
    } catch (e) {
      // [P] generic error error message
      print("catch");
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
          Visibility(
              visible: controller.details.complete,
              child: ElevatedButton(
                  onPressed: _handlePayPress,
                  child: const Text('Pagar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyStyles.orange,
                  minimumSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  // background
                ),
              )),
          Visibility(
              visible: !controller.details.complete,
              child: ElevatedButton(
                  onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE5E5E5),
                  minimumSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  // background
                ),
                  child: const Text('Pagar'),

              ))
        ]
      )
    );
  }
}
