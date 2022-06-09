// import 'package:flutter/material.dart';

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({Key? key}) : super(key: key);
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//         userAgent: 'Flutter;Webview',
//         navigationDelegate: (navigation) {
//           if (navigation.url == 'https://standard.paystack.co/close') {
//             Navigator.of(context).pop(); //close webview
//           }
//           if (navigation.url == "https://hello.pstk.xyz/callback") {
//             Navigator.of(context).pop(); //close webview
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }
