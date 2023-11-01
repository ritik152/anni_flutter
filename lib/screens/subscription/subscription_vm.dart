import 'dart:convert';
import 'package:anni_ai/screens/chat/chat.dart';
import 'package:anni_ai/screens/subscription/subscriptions_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../apis/api_controller.dart';
import '../../apis/common_model.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import 'AnyModel.dart';

class SubscriptionVM with ChangeNotifier{

  var isLoading = true;
  final gMonthlyId = 'anni_monthly';
  final iMonthlyId = 'anni_monthly';
  List<ProductDetails> productList = [];

  static SubscriptionVM instance = SubscriptionVM();

  Future<List<ProductDetails>> fetchSubscriptions() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available)
    {

      debugPrint('Unable to reach to store');
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
    }

    const Set<String> subscriptionIds = <String>{
      'anni_monthly'
    };

    final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(subscriptionIds,);

    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('No Products Found');
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
    }

    List<ProductDetails> products = response.productDetails;
    debugPrint('${products.first}');
    notifyListeners();
    return products;

  }

  //Subscription
  Future<AnyModel> subscription(Map<String,String> params,BuildContext context) async {
    var response = await postMethod("POST", AllKeys.subscription, params, null, context);
    var res = jsonDecode(response);
    return AnyModel.fromJson(res);
  }

  performPayment(BuildContext context) async {
    if (defaultTargetPlatform == TargetPlatform.iOS){

    }
    ProductDetails? productToBuy;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
        var index = productList.indexWhere((element) => element.id == iMonthlyId);
        productToBuy = productList.elementAt(index);
    }
    else{

        var index = productList.indexWhere((element) => element.id == gMonthlyId);
        productToBuy = productList.elementAt(index);

    }

    await SubscriptionsProvider.instance.buySubscription(productToBuy, (PurchaseDetails details) async {

      print("QWERTYUIOP______________$details");

      Map<String,String> map = {
        "transaction_id":details.purchaseID.toString(),
        "amount":productToBuy!.rawPrice.toString(),
        "type":'1',
        "json_data":details.verificationData.serverVerificationData,
      };
      String res = await methodWithHeader("POST", AllKeys.subscription, map, null, context);

      var response = jsonDecode(res);

      CommonModel commonModel = CommonModel.fromJson(response);
      if (commonModel.success == 200){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Chat()), (route) => false);
      }else{
        showToast(commonModel.message ?? '');
      }


    });

  }

}