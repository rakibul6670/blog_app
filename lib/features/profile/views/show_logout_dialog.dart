// import 'package:blog_app/common_widgets/app_snackbar.dart';
// import 'package:blog_app/features/auth/presentation/login_screen.dart';
// import 'package:blog_app/helpers/auth_get_storage.dart';
// import 'package:blog_app/helpers/route_helper.dart';
// import 'package:blog_app/provider/login_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// Future showLogOutDialog(context) async {
//   return showDialog(
//     barrierDismissible: false,
//     useSafeArea: true,
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Icon(Icons.logout, size: 35),
//         elevation: 4,
//         backgroundColor: Colors.white,
//         content: Text(
//           "Are your sure you want to \n logout ",
//           textAlign: TextAlign.center,
//           style: Theme.of(
//             context,
//           ).textTheme.titleMedium!.copyWith(color: Colors.black),
//         ),
//         actionsAlignment: MainAxisAlignment.center,
//         actions: [
//           //-----------------------No Button for cancel logout---------------
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("No"),
//           ),

//           //----------------------Yes Button ---------------
//           Consumer<LoginProvider>(
//             builder: (context, provider, child) {
//               return Visibility(
//                 visible: provider.logoutLoading == false,
//                 replacement: Center(
//                   child: CircularProgressIndicator(color: Colors.blue),
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     await provider.loginUser();
//                     if (provider.isLogout) {
//                       await AuthGetStorage.clearUserToken();

//                       AppSnackBar.showSuccess(context, provider.logoutMessage);

//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                         (predicate) => false,
//                       );
//                     } else {
//                       AppSnackBar.showError(context, provider.logoutMessage);
//                       Navigator.pop(context);
//                     }
//                   },

//                   child: Text("Yes"),
//                 ),
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
