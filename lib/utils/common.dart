import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';
import 'color.dart';


/*const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';*/

String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*\.com$";

var urlPattern = r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

const platform = MethodChannel('com.auria/custom');

void showToast(String msg) {

  Fluttertoast.showToast(
      msg: msg, // message
      backgroundColor: AppColor.greenColor,
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 3 // duration
  );

}

void showError(String msg) {

  Fluttertoast.showToast(
      msg: msg, // message
      backgroundColor: AppColor.redColor,
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 3 // duration
  );

}

void showLoader(BuildContext context){
  showDialog(
    barrierColor: AppColor.dialogBackgroundColor,
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async {

          return false;
        },
        child: SimpleDialog(
          backgroundColor: Colors.transparent,//here set the color to transparent
          elevation: 0,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  color: AppColor.greenColor,
                ),
                const SizedBox(height: 10),
                const Text("", textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void hideLoader(BuildContext context){
  Navigator.of(context).pop();
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}


String dateFormat(String eventDate) {
  var createTime = "";
  String formattedDate2 = DateFormat('MMM dd, yyyy').format(DateTime.parse(eventDate));
  print(formattedDate2);
  createTime = formattedDate2.toString();
  return createTime;
}

String dateFormatBetting(String eventDate) {
  var createTime = "";
  DateTime date = DateTime.parse(eventDate);
  var newDate = DateTime(date.year, date.month, date.day + 6);
  String formattedDate2 = DateFormat('MMM dd').format(newDate);
  print(formattedDate2);
  createTime = formattedDate2.toString();
  return createTime;
}

String dateFormatBetting2(String eventDate) {
  var createTime = "";
  final utcTime = DateTime.parse(eventDate).add(const Duration(hours: 9,minutes: 30));
  var date = utcTime.toLocal();
  String formattedDate2 = DateFormat('MMM dd').format(date);
  print(formattedDate2);
  createTime = formattedDate2.toString();
  return createTime;
}

String dateTimeFormat(String eventDate) {
  var createTime = "";
  final utcTime = DateTime.parse(eventDate).add(const Duration(hours: 9,minutes: 30));
  var dateLocal = utcTime.toLocal();
  var dateTime2 = DateFormat('hh:mm a MMM dd').format(dateLocal.toLocal());
  DateTime EastCoast = dateTimeToZone(zone: "EST", datetime: DateTime.parse(eventDate));
  print('UTC Time: ${DateTime.parse(eventDate).toUtc()}');
  print('Local Time: ${dateLocal}');
  print('eventDate Time: $EastCoast');
  createTime = dateTime2.toString();
  return createTime;
}

bool dateTimeFormatCheck(String eventDate) {
  final utcTime = DateTime.parse(eventDate).add(const Duration(hours: 4));
  var dateLocal = utcTime.toLocal();
  print('UTC Time: ${dateLocal.isBefore(DateTime.now())}');
  return dateLocal.isBefore(DateTime.now());
}

String getOrdinal(int number) {
  if (number % 10 == 1 && number % 100 != 11) {
    return '$number${number == 11 ? "TH" : "ST"}';
  } else if (number % 10 == 2 && number % 100 != 12) {
    return '$number${number == 12 ? "TH" : "ND"}';
  } else if (number % 10 == 3 && number % 100 != 13) {
    return '$number${number == 13 ? "TH" : "RD"}';
  } else {
    return '$number' + 'TH';
  }
}

