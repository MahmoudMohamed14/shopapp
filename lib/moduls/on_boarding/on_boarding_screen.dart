


import 'package:flutter/material.dart';
import 'package:shopapp/moduls/login/login.dart';
import 'package:shopapp/shared/componants/componants.dart';
import 'package:shopapp/shared/sharedpreference/cachhelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoarding{
  String? image;
  String? title;
  String? body;
  OnBoarding({required this.body,required this.image,required this.title});


}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardingController = PageController();

  List<OnBoarding> listOnBoarding=[
    OnBoarding(body: 'On Boarding Body 1', image:'asserts/images/onboarding.png' , title: 'On Boarding Title 1'),
    OnBoarding(body: 'On Boarding Body 2', image:'asserts/images/onboarding.png' , title: 'On Boarding Title 2'),
    OnBoarding(body: 'On Boarding Body 3', image:'asserts/images/onboarding.png' , title: 'On Boarding Title 3')
  ];
  bool isLst=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          TextButton(

              onPressed: submit, child: Text('SKIP',style: TextStyle(color:Colors.green[200] ),))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(itemBuilder: (context,index)=>buildBoardingItem(listOnBoarding[index]),
                itemCount: listOnBoarding.length,
                controller: boardingController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index){
                if(index==listOnBoarding.length-1){
                  setState(() {
                    isLst=true;
                  });
                }else{
                  setState(() {
                    isLst=false;
                  });
                }
                },

              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(controller: boardingController,
                    count: listOnBoarding.length,
                  effect:ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                    expansionFactor: 4,
                    spacing: 5,

                  ) ,
                ),
                //spacer بتاخد كل المسافة اللي في النص
                Spacer(),

                FloatingActionButton(onPressed: (){

                  if(isLst){
                    submit();

                  }else{
                    boardingController.nextPage(duration: Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn)
                    ;
                  }

                },child: Icon(Icons.arrow_forward),)
              ],
            )
          ],
        ),
      ),
    );
  }
  void submit(){
    CachHelper.putData(key: 'onBoarding', value:true).then((value) {
   if(value){
     navigateAndFinish(context, LoginScreen());

       }
    });
  }

  Widget buildBoardingItem(OnBoarding onBoarding)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image(image: AssetImage('${onBoarding.image}'),),
      )),
      SizedBox(height: 30,),
      Text('${onBoarding.title}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      SizedBox(height: 15,),
      Text('${onBoarding.body}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
    ],
  );
}



