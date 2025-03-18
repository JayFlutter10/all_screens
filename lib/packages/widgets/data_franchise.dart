import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataFranchise{
  final List<dynamic> franchiseDetails=[
    {
      'GB':
      [
        {'title': 'REVENUE', 'data': 'Earn 5%-15% revenue share.'},
        {'title': 'REFERRAL BENEFIT', 'data': 'Get ₹3,000 per team member.'},
        {'title': 'MARKETING SUPPORT ','data':'Earn 7% team revenue.Geo-targeted ad campaigns provided.Use advanced marketing templates.'},
      ],
    },
    {
      'SGP': [
        {
          'title': 'REVENUE', 'data': 'Earn up to 22% revenue share.'
        },
        {
          'title': 'REFERRAL BENEFIT', 'data': 'Get up to ₹5,000 per team member.'
        },
        {
          'title': 'MARKETING SUPPORT ',
          'data':'Commission: 5% to 15% per successful lead.Team Revenue Share: 5% to 10% from the team’s performance'
        },
      ],
    },
    {
      'PGP': [
        {'title': 'REVENUE', 'data': 'Earn up to 27% revenue share.'},
        {'title': 'REFERRAL BENEFIT', 'data': 'Get up to ₹5,000 per team member.'},
        {
          'title': 'MARKETING SUPPORT ',
          'data':
          'Team Revenue Share: 5% to 10% from the team’s performance.Additional Team Revenue Share: 3% to 7% from GPs onboarded by direct GPs'
        },
      ],
    },
  ];
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
  final List<dynamic> franchiseUpgradeTerms=[
    '','Recruit 10 GPs to become a Super Franchise.','When your appointed GPs recruit 10 more, you become a Premium Franchise.'
  ];
  final List<dynamic> franchiseNameAbbr=[
    'GB','SGP','PGP'
  ];
  final List<dynamic> franchiseName=[
    'Growth Partner','Super Growth Partner','Premium Growth Partner'
  ];
  final List<dynamic> growthPartner=[
    {
      'title':'Assured Earnings Opportunity',
      'subtitle': [
        {
          'data':'Earn ₹30,000 – ₹50,000/month',
          'icon': CupertinoIcons.money_yen,
        },
        {
          'data':'₹5000 per direct GP, ₹3000 per indirect referral',
          'icon':Icons.auto_graph_outlined
        },
        {
          'data':'Business Onboarding Bonus: Up to ₹10,000 per business/service',
          'icon':Icons.warehouse_rounded
        },
      ],
    },
    {
      'title':'Revenue & Commission Structure',
      'subtitle':[
        {
          'data':'Support within 3-6 hours',
          'icon':Icons.support_agent_rounded
        },
        {
          'data':'Access to pre-designed outreach & promotion tools',
          'icon':CupertinoIcons.rectangle_grid_2x2_fill
        }
      ],
    },
  ];
  final List<dynamic> superGrowthPartner=[
    {
      'title':'Assured Earnings Opportunity',
      'subtitle': [
        {
          'data':'Earn ₹50,000 – ₹70,000/month',
          'icon': CupertinoIcons.money_yen,
        },
        {
          'data':'₹5000 per direct GP, ₹3000 per indirect referral',
          'icon':Icons.auto_graph_outlined
        },
        {
          'data':'Business Onboarding Bonus: Up to ₹10,000 per business/service',
          'icon':Icons.warehouse_rounded,
        },
      ],
    },
    {
      'title':'Revenue & Commission Structure',
      'subtitle':[
        {
          'data':'Support within 3-6 hours',
          'icon':Icons.support_agent_rounded
        },
        {
          'data':'Access to pre-designed outreach & promotion tools',
          'icon':CupertinoIcons.rectangle_grid_2x2_fill
        }
      ],
    },
  ];
  final List<dynamic> premiumGrowthPartner=[
    {
      'title':'Assured Earnings Opportunity',
      'subtitle': [
        {
          'data':'Earn ₹70,000 – ₹1,00,000/month',
          'icon': CupertinoIcons.money_yen,
        },
        {
          'data':'₹5000 per direct GP, ₹3000 per indirect referral',
          'icon':Icons.auto_graph_outlined
        },
        {
          'data':'Business Onboarding Bonus: Up to ₹10,000 per business/service',
          'icon':Icons.warehouse_rounded
        },
        {
          'data':'3% to 7% from GPs onboarded by direct GPs',
          'icon':Icons.wallet_rounded
        },
      ],
    },
    {
      'title':'Revenue & Commission Structure',
      'subtitle':[
        {
          'data':'Support within 3-6 hours',
          'icon':Icons.support_agent_rounded
        },
        {
          'data':'Access to pre-designed outreach & promotion tools',
          'icon':CupertinoIcons.rectangle_grid_2x2_fill
        }
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
  final List<dynamic> assuredEarning=[
    ' ₹30,000 – ₹50,000/month',' ₹50,000 – ₹70,000/month',' ₹70,000 – ₹1,00,000/month'
  ];
  final List<dynamic> iconsData=[
    {
      'key':'GB',
      'value':['15% Revenue\nShare','Team Building\nincome']
    },
    {
      'key':'SGP',
      'value':['22% Revenue\nShare','GP Team\nRevenue income']
    },
    {
      'key':'PGP',
      'value':['27% Revenue\nShare','SGP Team Revenue\nincome']
    }
  ];
}