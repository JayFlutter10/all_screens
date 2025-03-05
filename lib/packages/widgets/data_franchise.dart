import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataFranchise{
  final List<dynamic> carouselData = [
    {'key':'\nFranchise',
      'value':''
    },
    {
      'key':'Super\nFranchise',
      'value':'Recruit 10 Super Franchises to become a Super Franchise.'
    },
    {
      'key':'Premium\nFranchise',
      'value':'Recruit 10 Super Franchises to become a Premium Franchise.'
    }
  ];
  final List<dynamic> franchiseName=[
    'Franchise','Super\nFranchise','Premium\nFranchise'
  ];
  final List<dynamic> franchise=[
    {
      'title':'Assured Earnings Opportunity',
      'subtitle': [
        {
          'data':'Earn ₹30,000 – ₹50,000/month',
          'icon': CupertinoIcons.money_yen,
        },
        {
          'data':'Scalable income – The more leads you convert, the higher your earnings!',
          'icon':Icons.auto_graph_outlined
        },
      ],
    },
    {
      'title':'Revenue & Commission Structure',
      'subtitle':[
        {
          'data':'Earn 5% to 15% revenue share on every successful lead conversion',
          'icon':CupertinoIcons.bag
        },
        {
          'data':'Use pre-designed templates for client outreach & promotions',
          'icon':CupertinoIcons.cube_box_fill
        },
        {
          'data':'Earn ₹5,000 for every franchise you successfully on-board.',
          'icon':Icons.savings,
        },
        {
          'data':'Earn ₹3,000 when a franchise you on boarded brings in another franchise.',
          'icon':Icons.account_balance_wallet
        },
      ],
    },
  ];
  final List<dynamic> superFranchise=[
    {
      'title':'Assured Earnings Opportunity',
      'subtitle': [
        {
          'data':'Earn ₹50,000 – ₹70,000/month',
          'icon': CupertinoIcons.money_yen,
        },
        {
          'data':'Higher income potential with franchise benefits & team earnings!',
          'icon':Icons.auto_graph_outlined
        },
      ],
    },
    {
      'title':'Revenue & Commission Structure',
      'subtitle':[
        {
          'data':'Earn 5% to 15% revenue share on every successful lead',
          'icon':CupertinoIcons.bag
        },
        {
          'data':'Use advance templates for client outreach & promotions',
          'icon':CupertinoIcons.cube_box_fill
        },
        {
          'data':'Earn ₹5,000 for every franchise you successfully on-board.',
          'icon':Icons.savings,
        },
        {
          'data':'Earn ₹3,000 when a franchise you on boarded brings in another franchise.',
          'icon':Icons.account_balance_wallet
        },
        {
          'data':'Earn 5% to 10% revenue share from your team\'s performance.',
          'icon':Icons.money
        },
      ],
    },
  ];
  final List<dynamic> premiumFranchise=[
    {
      'title':'Assured Earnings Opportunity',
      'subtitle': [
        {
          'data':'5% to 15% revenue share',
          'icon': CupertinoIcons.money_yen,
        },
        {
          'data':'Scalable income – The more leads you convert, the higher your earnings!',
          'icon':Icons.auto_graph_outlined
        },
      ],
    },
    {
      'title':'Revenue & Commission Structure',
      'subtitle':[
        {
          'data':'Earn 5% to 15% revenue share on every successful lead conversion',
          'icon':CupertinoIcons.bag
        },
        {
          'data':'Earn ₹5,000 for every franchise you successfully on-board.',
          'icon':CupertinoIcons.cube_box_fill
        },
        {
          'data':'Earn ₹3,000 when a franchise you on boarded brings in another franchise',
          'icon':Icons.savings,
        },
        {
          'data':'Earn 5% to 10% revenue share from your team\'s performance',
          'icon':Icons.account_balance_wallet
        },
        {
          'data':'Earn 3% to 7% revenue share from the franchises on boarded by your direct franchisees',
          'icon':Icons.money
        },
      ],
    },
  ];
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
  final List<dynamic> assuredLearning=[
    ' ₹30,000 – ₹50,000/month',' ₹50,000 – ₹70,000/month',' ₹70,000 – ₹1,00,000/month'
  ];
}