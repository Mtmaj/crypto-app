import 'package:cryptoapp/model/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_list_item/animated_list_item.dart';
import 'dart:ui';
import 'package:cryptofont/cryptofont.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static List<Crypto> CryptoList = [];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  int item_index = 0;
  late AnimationController _animationController;
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 25),);
    
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            SizedBox(height: 25,),
            AppBar(),
            SizedBox(height: 16,),
            SliderWidget(),
            SizedBox(height: 10,),
            DotSliderWidget(),
            SizedBox(height: 36,),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Text('All Crypto',style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded,color:Colors.white,size: 20,)
                ],
              ),
            ),
            SizedBox(height: 18,),
            Expanded(
              child: ListView.builder(
                itemCount: HomeScreen.CryptoList.length,
                itemBuilder: (BuildContext context,index){
                  return AnimatedListItem(
                    curve: Curves.easeInOut,
                    animationType: AnimationType.zoomIn,
                    index: index,
                    aniController: _animationController,
                    length: HomeScreen.CryptoList.length,
                    child: ItemCryptoWidget(HomeScreen.CryptoList[index]),
                  );
                }
              )
            )
          ]),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 22, 84, 199), Color(0xFF010022)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
        ),
      ),
    );
  }

  Container ItemCryptoWidget(Crypto data) {
    return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                    margin: EdgeInsets.only(bottom: 18,left: 32,right: 32),
                    child: Row(
                      children: [
                        Icon(CryptoFontIcons.fromSymbol(data.symbol),color: Colors.white,size: 25,),
                        SizedBox(width: 8,),
                        Text((data.name.length > 9?(data.name.substring(0,7)+'...'):data.name),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(width: 4,),
                        Text(data.symbol,style: TextStyle(color: Colors.white,fontSize: 11,),),
                        Spacer(),
                        Text(data.price.toString().split('.')[0]+'.'+data.price.toString().split('.')[1].substring(0,2)+'\$',style: TextStyle(color: Color.fromARGB(255, 51, 255, 0), fontSize: 16,),),
                        SizedBox(width: 5,),
                        Text((data.changed24H>0?'+':'')+data.changed24H.toString().split('.')[0]+'.'+data.changed24H.toString().split('.')[1].substring(0,2),style: TextStyle(color: Color.fromARGB(255, 51, 255, 0), fontSize: 14,),),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF4642FF),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  );
  }

  Container DotSliderWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(int i = 0;i<3;i++)...[
            ItemDot(i, item_index)
          ]
        ],
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(82, 255, 255, 255),
        borderRadius: BorderRadius.circular(50)
      ),
    );
  }

  Container SliderWidget() {
    return Container(
      width: double.infinity,
      height: 110,
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context,index,c){
          return SliderItem();
        },
        options: CarouselOptions(
          onPageChanged: (index, reason) {item_index = index;
            setState(() {});
          },
          height: 110,
          padEnds: true
          
        ),
      ),
    );
  }

  AnimatedContainer ItemDot(int i, int item_index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      width: 5,
      height: 5,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: i == item_index? Color.fromARGB(255, 0, 4, 255):Color.fromARGB(85, 0, 0, 0),
        borderRadius: BorderRadius.circular(50)
      ),
    );
  }

  Container SliderItem() {
    return Container(
      height: 132,
      margin: EdgeInsets.only(right: 9,left: 9),
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/bitcoin_background.png',
              fit: BoxFit.cover,
              width: Get.width,
              height: 132,
            ),
          ),
          Container(
            width: double.infinity,
            height: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 132,
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(width: 11,),
                Image.asset('assets/images/bitcoin.png',width: 70,),
                SizedBox(width: 14,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bitcoin',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      'BTC',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text(
                          '46,000\$',
                          style: TextStyle(
                            color:Color.fromARGB(255, 34, 172, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 3,),
                        Text(
                          ' +60%',
                          style: TextStyle(
                            color:Color.fromARGB(255, 34, 172, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 32),
      child: Text(
        'Welcome To CryptoApp',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }
}
