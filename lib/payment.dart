// import 'dart:io';
//
// import 'package:chet/paymentconfig.dart';
// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
//
//
//
// class HomePage1 extends StatefulWidget {
//   const HomePage1({super.key});
//
//   @override
//   State<HomePage1> createState() => _HomePage1State();
// }
//
// class _HomePage1State extends State<HomePage1> {
//   String os = Platform.operatingSystem;
//
//   var applePayButton = ApplePayButton(
//     paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
//     paymentItems: const [
//       PaymentItem(
//         label: 'Item A',
//         amount: '0.01',
//         status: PaymentItemStatus.final_price,
//       ),
//       PaymentItem(
//         label: 'Item B',
//         amount: '0.01',
//         status: PaymentItemStatus.final_price,
//       ),
//       PaymentItem(
//         label: 'Total',
//         amount: '0.02',
//         status: PaymentItemStatus.final_price,
//       )
//     ],
//     style: ApplePayButtonStyle.black,
//     width: double.infinity,
//     height: 50,
//     type: ApplePayButtonType.buy,
//     margin: const EdgeInsets.only(top: 15.0),
//     onPaymentResult: (result) => debugPrint('Payment Result $result'),
//     loadingIndicator: const Center(
//       child: CircularProgressIndicator(),
//     ),
//   );
//
//   var googlePayButton = GooglePayButton(
//     paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
//     paymentItems: const [
//       PaymentItem(
//         label: 'Total',
//         amount: '0.01',
//         status: PaymentItemStatus.final_price,
//       )
//     ],
//     type: GooglePayButtonType.pay,
//     margin: const EdgeInsets.only(top: 15.0),
//     onPaymentResult: (result) => debugPrint('Payment Result $result'),
//     loadingIndicator: const Center(
//       child: CircularProgressIndicator(),
//     ),
//   );
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("jngdfsk");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(child: Platform.isIOS ? applePayButton : googlePayButton),
//       ),
//     );
//   }
// }