import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class TestColorScreenView extends StatelessWidget {
  final Color color;
  final String colorName;

  TestColorScreenView({
    super.key,
    required this.color,
    required this.colorName,
  });

  // Move constant data to static final fields
  static final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.white),
        label: "Home"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings, color: Colors.white),
        label: "Settings"
    ),
  ];

  final List<dynamic> services=[
    {
      'title':'Onboarding',
      'data':[
        'Merchant Onboarding','Seller Onboarding','Partner Onboarding','Customer Onboarding','App Earnings',
      ],
      'color':Color.fromRGBO(0, 63, 136, 1)
    },
    {
      'title':'Business',
      'data':[
        'Startup','Business','IT Services','Franchise','Dealers & hhhDistributors'
      ],
      'color':Color.fromRGBO(117, 11, 198, 1)

    },
    {
      'title':'Branding',
      'data':[
        'Logo Design','Branding','Marketing','Creative','UI/UXh'
      ],
      'color':Color.fromRGBO(8, 135, 8, 1)

    },
    {
      'title':'Legal',
      'data':[
        'Registration','Compliances','Lawyers','CSC Center'
      ],
      'color':Color.fromRGBO(237, 87, 40, 1)

    },
    {
      'title':'Home',
      'data':[
        'Women salon','Men hSalon','Repairs','Pest Control','Painting'
      ],
      'color':Color.fromRGBO(246, 76, 229, 1)

    },
    {
      'title':'IT',
      'data':[
        'Infrastructure Services','Software Development',' IT Support','Cybersecurity','Cloud Computing'
      ],
      'color':Color.fromRGBO(252, 40, 86, 1)

    },
    {
      'title':'Educational',
      'data':[
        'Development Courses ','Business Courses','Software Courses','Marketing Courses','Design Courses'
      ],
      'color':Color.fromRGBO(0, 169, 51, 1)

    },
    {
      'title':'Finance',
      'data':[
        'Instant Loan','Business Loan','Account Opening','Credit Cardh'
      ],
      'color':Color.fromRGBO(39, 124, 114, 1)

    },
    {
      'title':'Franchise',
      'data':[
        'Automotive','Beauty','Health','Fashion','Food'
      ],
      'color':Color.fromRGBO(94, 5, 92, 1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: color),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColorNameSection(),
              _buildNetworkImageSection(height, width),
              _buildDashboardSection(height, width),
              _buildSearchBar(),
              _buildServicesGrid(height, width),
              _buildOnboardingServicesList(height, width),
              SizedBox(height: height * 0.1),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems,
        backgroundColor: color,
      ),
    );
  }

  Widget _buildColorNameSection() {
    return Center(child: Text(colorName));
  }

  Widget _buildNetworkImageSection(double height, double width) {
    return Column(
      children: [
        customContainer(
            bRadius: 10,
            height: height * 0.2,
            width: width,
            networkImg: 'https://as1.ftcdn.net/jpg/02/51/38/60/1000_F_251386057_B08juEpPRDo5NZxUCwlVuw9PtRqVWXNX.webp'
        ),
        SizedBox(height: height * 0.01),
      ],
    );
  }

  Widget _buildDashboardSection(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dashboard', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            Column(
              children: [
                customContainer(
                  bRadius: width * 0.03,
                  containerColor: Colors.blue,
                  margin: width * 0.02,
                  height: height * 0.3,
                  width: width * 0.45,
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  customContainer(
                    bRadius: width * 0.02,
                    height: height * 0.14,
                    containerColor: Colors.red,
                    width: width,
                    margin: width * 0.02,
                  ),
                  customContainer(
                    bRadius: width * 0.02,
                    height: height * 0.14,
                    containerColor: color,
                    margin: width * 0.02,
                    width: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search by name or type',
          suffixIcon: const Icon(Icons.sort_rounded),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }

  Widget _buildServicesGrid(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Services', style: TextStyle(fontSize: 16)),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: width * 0.02,
            mainAxisSpacing: height * 0.009,
          ),
          itemCount: 9,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return customContainer(
              bRadius: width * 0.05,
              containerColor: Colors.red.shade200,
            );
          },
        ),
      ],
    );
  }

  Widget _buildOnboardingServicesList(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Onboarding Services', style: TextStyle(fontSize: 16)),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.all(width * 0.02),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: width * 0.21, // Match the container width
                margin: EdgeInsets.symmetric(horizontal: width * 0.005),
                child: Column(
                  children: [
                    customContainer(
                      bRadius: 100,
                      borderColor: Colors.pink,
                      margin: width * 0.005,
                      width: width * 0.21,
                      height: height * 0.095,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      services[0]['data'][index].toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}