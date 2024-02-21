// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class GpayScreen extends StatefulWidget {
//   const GpayScreen({super.key});
//
//   @override
//   State<GpayScreen> createState() => _GpayScreenState();
// }
//
// class _GpayScreenState extends State<GpayScreen> {
//
//
//   void onGooglePayResult(paymentResult) {
//     print("hii");
// print(paymentResult.toString());
//   }
//   void initState() {
//     super.initState();
//     _paymentItems.add(PaymentItem(amount: '200',label: 'Product1',status: PaymentItemStatus.final_price));
//
//   }
//   final _paymentItems =<PaymentItem>[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Row(
//           children: [
//             GooglePayButton(
//               paymentConfigurationAsset: 'gpay.json',
//               paymentItems: _paymentItems,
//               width: 200,
//               height: 50,
//               type: GooglePayButtonType.pay,
//               margin: const EdgeInsets.only(top: 15.0),
//               onPaymentResult:onGooglePayResult,
//
//               loadingIndicator: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
