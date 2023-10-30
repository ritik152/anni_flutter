import 'package:anni_ai/screens/subscription/subscription_vm.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/buttons.dart';
import '../../utils/color.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {

  var vm = SubscriptionVM();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async{
    var products = await SubscriptionVM.instance.fetchSubscriptions();
    vm.productList = products;
    setState(() {
      vm.isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
      elevation: 0.0,
    ),
      body: (vm.isLoading == true)?Progress():SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              BoldText(vm.productList[0].price, 55, AppColor.whiteColor, TextAlign.center),
              BoldText("/month", 15, AppColor.hintColor, TextAlign.center),
              const SizedBox(height: 50,),
              BoldText("What can premium do?", 18, AppColor.whiteColor, TextAlign.center),
              const SizedBox(height: 30,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.backColor
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/subscribe_chats.png",height: 30,width: 30),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: 150,
                              child: MediumText("Unlimited messages & statistics from Anni", 13, AppColor.whiteColor, TextAlign.start))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.backColor
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/data_analysis.png",height: 30,width: 30),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: 150,
                              child: MediumText("Unlimited tables & graphs from Anni", 13, AppColor.whiteColor, TextAlign.start))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.backColor
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/article.png",height: 30,width: 30),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: 150,
                              child: MediumText("Unlimited Article generations from Anni ", 13, AppColor.whiteColor, TextAlign.start))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.backColor
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons/bookmark.png",height: 30,width: 30),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: 150,
                              child: MediumText("Save all your conversation", 13, AppColor.whiteColor, TextAlign.start))
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60,),

              Image.asset("assets/images/ball.png",height: 40,),
              const SizedBox(height: 40,),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: RoundedButton(text: "Get Started", color: AppColor.black, buttonColor: AppColor.greenColor, radios: 50,
                    onTap: (){
                      vm.performPayment(context);
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Chat()), (route) => false);
                    }),
              ),
              const SizedBox(height: 20,),
              BoldText("3-day trial,then ${vm.productList[0].price}/mo", 14, AppColor.greenColor, TextAlign.center),
              const SizedBox(height: 5,),
              MediumText("Secured with iTunes,Cancel anytime", 12, AppColor.whiteColor, TextAlign.center),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
