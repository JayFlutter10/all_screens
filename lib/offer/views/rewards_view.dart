import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../../constants/widgets/custom_container.dart';
import 'claim_reward_view.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({super.key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> dataOfReward=[
      {
        'company':'Apple',
        'offer':'Get a free I-Pad',
        'banner':'assets/rewards/img/ipad.png',
        'icon':'assets/rewards/img/apple_icon.png'
      },
      {
        'company':'Apple',
        'offer':'Get a free headphone',
        'banner':'assets/rewards/img/airpod_max.png',
        'icon':'assets/rewards/img/apple_icon.png'
      },
    ];

    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;

  ///user_recruited_franchise_members must not exceed 20
   final int userRecruitedMembers=11 ;
   final int necessaryMembers=20;
   // ignore: unused_local_variable
   int userRecruitLeft=0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:width*0.02),
          child: Column(
            children: [
              ///Center Text
              Center(child: Text('Complete tasks & get exclusive rewards',style: TextStyle(fontSize: 16),
                //,style: textStyle18(context)
              )),
              SizedBox(height: height*0.04,),

              ///Offer Widget
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemCount: dataOfReward.length,
                  itemBuilder: (context,index)
                  {
                return customContainer(
                  margin: width*0.01,
                  vPadding: height*0.01,
                  hPadding: width*0.015,
                  bRadius: width*0.05,
                  child: Column(
                    children: [
                      ///Reward Company and Name and expiry details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(backgroundImage: AssetImage('assets/rewards/img/apple_icon.png'),),
                              SizedBox(width: width*0.02,),
                              Text('Apple')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.hourglass_empty,color: Colors.grey,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expires on 00-00-0000',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                  Text('11:59 PM',style: TextStyle(fontSize: 12,color: Colors.grey),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height*0.01,
                      ),

                      ///banner image
                      customContainer(bRadius: 12,assetsImg: dataOfReward[index]['banner'],height: height*0.2),
                      Padding(
                        padding:  EdgeInsets.only(top:height*0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height*0.0,
                            ),
                            CircleAvatar(radius: height*0.04,backgroundImage: AssetImage('assets/rewards/img/apple_icon.png'),),
                            SizedBox(width: width*0.05,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Apple'
                                  //,style: textStyle16(context),
                                ),
                                Text(dataOfReward[index]['offer']
                                  //,style: textStyle18(context)
                                  ,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.01,),

                      ///Eligibility Criteria and Linear Progress Bar
                      customContainer(
                        bRadius: width*0.02,
                        vPadding: height*0.01,
                        hPadding: width*0.02,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Eligibility Criteria'
                              //,style: textStyle16(context,fontWeight: FontWeight.w600)
                            ),
                            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor'
                              //,style: textStyle14(context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    index==1?'0':userRecruitedMembers.toString()
                                  //,style: textStyle16(context)
                                ),
                                customContainer(bRadius: width*0.5, width: width*0.75, height: height*0.009,
                                  borderColor: Colors.grey.shade400,
                                  child: LinearProgressBar(
                                    progressColor: Colors.red,
                                    borderRadius: BorderRadius.circular(width*0.05),
                                    maxSteps: necessaryMembers,
                                    currentStep: index==1?0:userRecruitedMembers,
                                  ),
                                ),
                                Text('20'
                                  //,style: textStyle16(context),
                                ),
                              ],
                            ),
                            userRecruitedMembers==necessaryMembers?Center(child: Text('Completed'
                              //,style: textStyle16(fontWeight: FontWeight.w600,context,color: Colors.green)
                              ,)):Container()
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02,),

                      ///Claim now button
                      customContainer(bRadius: width*0.05, vPadding: height*0.01, width: width*0.8, containerColor: Color.fromRGBO(0, 80,157, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              userRecruitedMembers!=necessaryMembers?Icon(Icons.lock_outline,color: Colors.white,size: height*0.025,):Container(),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text('Claim Now',style: TextStyle(color: Colors.white),
                                    //,style: textStyle18(context,color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: (){
                           userRecruitLeft=necessaryMembers-userRecruitedMembers;

                           // userRecruitedMembers==necessaryMembers?
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>ClaimRewardView(imageBanner: dataOfReward[index]['banner'], iconImage: dataOfReward[index]['icon'], companyName: dataOfReward[index]['company'], offerText: dataOfReward[index]['offer'],)));

                           // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           //      margin: EdgeInsets.only(
                           //        bottom:height * 0.08,
                           //        left: 10,
                           //        right: 10,
                           //      ),
                           //      duration: const Duration(seconds: 2),
                           //      behavior: SnackBarBehavior.floating,
                           //      content: Center(child: index==1?Text("${userRecruitLeft + 20} members are left to unlock the reward"
                           //        //,style: textStyle16(context,color: Colors.white),
                           //      ):Text("$userRecruitLeft members are left to unlock the reward"
                           //        //,style: textStyle16(context,color: Colors.white),
                           //      ),
                           //      ),
                           //      backgroundColor: Color.fromRGBO(0, 80, 157, 1),),);
                      }
                      ),
                      SizedBox(height:5 ,),
                    ],
                  ),
                );
              }),

            ],
          ),
        ),
      ),
    );
  }
}