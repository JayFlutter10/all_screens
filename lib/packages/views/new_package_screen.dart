import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_bizbooster/constants/style/text_styles.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';
import 'package:side_bizbooster/packages/views/scratch_cupon_screen.dart';

import '../widgets/data_franchise.dart';

class NewPackageScreen extends StatefulWidget {
  const NewPackageScreen({super.key});

  @override
  State<NewPackageScreen> createState() => _NewPackageScreenState();
}
final List<dynamic> learnMore=[
  {
    'title':'Learn more about revenue',
    'data':'Earn 5%-15% revenue share.'
  },
  {
    'title':'Learn more about marketing support',
    'data':'Earn 7% team revenue.Geo-targeted ad campaigns provided.Use advanced marketing templates',
  },
  {
    'title':'Learn more about franchise support',
    'data':'Receive support within 6 hours.Get priority franchise access.'
  }
];
final List<dynamic> franchiseDetails=[
  {
    'title':'REVENUE',
    'data':'Earn 5%-15% revenue share.'
  },
  {
    'title':'REFERRAL BENEFIT',
    'data':'Get ₹3,000 per team member.'
  },
  {
    'title':'MARKETING SUPPORT ',
    'data':'Earn 7% team revenue.Geo-targeted ad campaigns provided.Use advanced marketing templates.'
  },
];
 Color franchiseTheme =Colors.blue;
class _NewPackageScreenState extends State<NewPackageScreen> {
  // Create a global key for the benefits section
  final GlobalKey _benefitsKey = GlobalKey();

  // Method to scroll to benefits section
  void _scrollToBenefits() {
    Scrollable.ensureVisible(
      _benefitsKey.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }
  DataFranchise dataFranchise=DataFranchise();
  int selection=0;
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Package'),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/package/bgImg/bkgImg.jpg',),fit: BoxFit.fill,opacity: 0.35),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.02),
            child: Column(
              children: [
                ///Row for All Franchise
                customContainer(
                  vPadding: height*0.01,
                  vMargin: height*0.02,
                  hMargin: width*0.01,
                  hPadding: width*0.02,
                  bRadius: width*0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _circleAvatarFranchise( franchiseName: 'Franchise\n', onTap: (){
                        setState(() {
                          selection=0;
                          franchiseTheme=Colors.blue;
                        });
                      }, color: Colors.blue, context: context, selection: selection, backgroundColor: selection==0?Colors.blue.shade50:Colors.white),
                      _dash(context: context),
                      _circleAvatarFranchise(franchiseName: 'Super\nFranchise', onTap: (){
                        setState(() {
                          selection=1;
                          franchiseTheme=Color.fromRGBO(45, 129, 0, 1);});
                      } ,color: Color.fromRGBO(45, 129, 0, 1), context: context, selection: selection, backgroundColor: selection==1?Color.fromRGBO(45, 129, 0, 0.1):Colors.white),
                      _dash(context: context),
                      _circleAvatarFranchise( franchiseName: 'Premium\nFranchise', onTap: (){
                        setState(() {
                          selection=2;
                          franchiseTheme=Color.fromRGBO(168, 53, 241, 1);
                        });
                      }, color: Color.fromRGBO(168, 53, 241, 1), context: context, selection: selection, backgroundColor: selection==2?Color.fromRGBO(168, 53, 241, 0.1):Colors.white),

                    ],
                  ),
                ),
                ///Franchise Details
                customContainer(bRadius: width*0.04, vPadding: height*0.01,
                    vMargin: height*0.02,
                    hMargin: width*0.06,
                    hPadding: width*0.075,
                    borderColor: franchiseTheme,
                  child: Column(
                    children: [
                      ///Franchise name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(radius: width*0.1,),
                          SizedBox(width: width*0.01,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(dataFranchise.franchiseName[selection],style: TextStyle(fontSize: 20,color:franchiseTheme,fontWeight: FontWeight.w500),textAlign: TextAlign.end,),
                                Text('(${dataFranchise.franchiseNameAbbr[selection]})',style: TextStyle(fontSize: 16,color:franchiseTheme,fontWeight: FontWeight.w500),textAlign: TextAlign.end,),
                                selection==0?Text('₹7,00,000',style: textStyle16(context,color: Colors.grey),):selection==1?Text('Recruit 10 GPs to become a SGP.',style: textStyle14(context,color: Colors.grey),textAlign: TextAlign.end,):Text('When your appointed GPs recruit 10 more, you become a PGP',style: textStyle14(context,color: Colors.grey),textAlign: TextAlign.end,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      ///Franchise Short Description
                      Column(
                        children: [
                          Text('Priority Access: Gain early access to franchise opportunities in all categories',),
                          SizedBox(height: height*0.01,),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: franchiseDetails.length,
                            itemBuilder: (context,index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(franchiseDetails[index]['title'].toString(),style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 80, 157, 1),fontWeight: FontWeight.w500),),
                                Text(
                                  franchiseDetails[index]['data'].toString().split('.').where((sentence) => sentence.trim().isNotEmpty)
                                      .map((sentence) => '• ${sentence.trim()}')
                                      .join('\n'),
                                  style: textStyle14(context,fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: height*0.01,)
                              ],
                            );
                          }),
                          SizedBox(height: height*0.015,),
                          customContainer(bRadius: width*0.1,vPadding: height*0.01,hPadding: width*0.1,borderColor: franchiseTheme,
                            child: Text('Know Benefits',style: TextStyle(fontSize: 16),),
                            onTap: _scrollToBenefits
                          ),
                          SizedBox(height: height*0.008,),
                        ],
                      ),
                    ],
                  ),
                ),
          
                ///Assure 5X
                selection==0?customContainer(bRadius: width*0.04,borderColor: franchiseTheme,
                  vMargin: height*0.02, vPadding: height*0.01,
                    hMargin: width*0.01,
                    hPadding: width*0.02,
                  child: Column(
                    children: [
                      ///Assured Text and Buy Now
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customContainer(
                            height: height*0.12,
                            width: width*0.3,bRadius: width*0.02,assetsImg: 'assets/package/img/rafiki.png'),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: height*0.001,horizontal: width*0.02),
                            child: Column(
                              children: [
                                Row(
                                  children: [Text('We assure you '),
                                  Text('5X Return',style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.w500,decoration: TextDecoration.underline,decorationColor: Colors.blue),),
                                ],),
                                Text('If you earn less than our assured earnings, we’ll refund up to 5X your initial amount',style: TextStyle(fontSize: 12,color: Colors.grey),textAlign: TextAlign.end,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('₹7,00,000',style: TextStyle(color: Color.fromRGBO(0, 80, 157, 1,),fontWeight: FontWeight.w500,fontSize: 16),),
                                    customContainer(bRadius: width*0.05,vPadding: height*0.01,hPadding: width*0.08,containerColor: Color.fromRGBO(29, 139, 242, 1),
                                      child: Text('Buy Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: height*0.01,),
                    customContainer(bRadius: width*0.06,borderColor: franchiseTheme,vPadding: height*0.01,hPadding: width*0.04,
                      child: Text('Check Your Discount Eligibility',style: TextStyle(fontSize: 16,color: franchiseTheme),),
                      onTap: (){
                      Get.to(()=>ScratchCuponScreen());
                      }
                    ),
                    SizedBox(height: height*0.01,),

                    ],
                  ),
                ):Container(),

                ///Assured Earning
                customContainer(bRadius: width*0.06, vPadding: 5, hPadding: width*0.08, containerColor: franchiseTheme,
                  child: Column(
                    children: [
                      Text(
                        'Assured Earnings',
                        style: textStyle18(context,color: Colors.white)
                      ),
                      Text(
                        dataFranchise.assuredLearning[selection].toString(),
                        style: textStyle16(context,color: Colors.white)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.01,),

                ///Franchise Benefits
                Row(
                  key: _benefitsKey,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(dataFranchise.franchiseName[selection].toString(),style: textStyle20(context,color: franchiseTheme),),
                    Text(' Benefits',style: textStyle20(context),)
                  ],
                ),
                SizedBox(height: height*0.01,),
                Text(dataFranchise.franchiseUpgradeTerms[selection].toString(),textAlign: TextAlign.center,style: textStyle16(context,color: franchiseTheme),),
                SizedBox(height: height*0.01,),

                ///Franchise Benefits 3 icons
                customContainer(bRadius: 10, vPadding: 10, margin: 10,borderColor: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _columnBenefits(icon: Icons.wallet, text: '15% Revenue\n Share', color: franchiseTheme),
                      _columnBenefits(icon: Icons.window_rounded, text: 'Standard\nTemplate', color: franchiseTheme),
                      _columnBenefits(icon: Icons.access_time, text: 'Support\nWithin 3-6hrs', color: franchiseTheme),
                    ],
                  ),),

                ///Know Benefits
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selection == 0
                      ? dataFranchise.franchise.length
                      : selection == 1
                      ? dataFranchise.superFranchise.length
                      : dataFranchise.premiumFranchise.length,
                  itemBuilder: (context, index) {

                    final currentData = selection == 0
                        ? dataFranchise.franchise
                        : selection == 1
                        ? dataFranchise.superFranchise
                        : dataFranchise.premiumFranchise;

                    return customContainer(
                      bRadius: width*0.04,
                      vPadding: height*0.01,
                      hPadding: width*0.03,
                      vMargin: height*0.01,
                      borderColor: Colors.grey.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentData[index]['title'].toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.only(left: width*0.005,top: height*0.005),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: currentData[index]['subtitle'].length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  Icon(
                                    currentData[index]['subtitle'][i]['icon'],
                                    color: franchiseTheme,
                                  ),
                                  SizedBox(width: width*0.02),
                                  Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '${currentData[index]['subtitle'][i]['data']
                                                  .toString()
                                                  .split(' ')
                                                  .take(2)
                                                  .join(' ')} ', // Extract first two words and add space
                                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: currentData[index]['subtitle'][i]['data']
                                                  .toString()
                                                  .split(' ')
                                                  .skip(1)
                                                  .join(' '), // Remaining words
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: height*0.01,)
                        ],
                      ),
                    );
                  },
                ),

                ///Learn More
                ListView.builder(
                    itemCount: dataFranchise.learnMore.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return customContainer(

                        bRadius: 15,
                        vMargin: height*0.01,
                        child: ExpansionTile(
                          shape:RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.zero
                          ) ,
                          collapsedShape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.zero
                          ),
                          childrenPadding: EdgeInsets.only(left: 10),
                          title: Text(dataFranchise.learnMore[index]['title'].toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                          children: [
                            Text(dataFranchise.learnMore[index]['data'].toString(),style: TextStyle(fontSize: 14),),
                          ],
                        ),
                      );
                    }
                ),
                SizedBox(height: height*0.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _dash({required context}){
  final double width=MediaQuery.of(context).size.width;
  return Row(
    children: [
      Image.asset('assets/package/bgImg/arrow.png',width: width*0.17,),
    ],
  );
}
Widget _columnBenefits({required IconData icon,required String text,required Color color}){
  return Column(
    children: [
      customContainer(containerColor:color,shadowColor: Colors.transparent,borderColor: Colors.transparent,bRadius: 15, vPadding: 10,hPadding: 10,child: Icon(icon,size: 30,color: Colors.white,),),
      Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: color,fontWeight: FontWeight.w500),)
    ],
  );
}
Widget _circleAvatarFranchise({required Color backgroundColor,required Color color,required String franchiseName,required VoidCallback onTap,required context,required int selection}){
  final double width=MediaQuery.of(context).size.width;
  return Column(
    children: [
      Row(
        children: [
          InkWell(
            onTap: onTap,
            child: customContainer(
              containerColor: backgroundColor,
              bRadius: width*0.1,
              borderColor: color,
              height: 65,width: 65
            ),
          ),
          SizedBox(width: width*0.008,),
        ],
      ),
      Text(franchiseName,textAlign: TextAlign.center,),
    ],
  );
}