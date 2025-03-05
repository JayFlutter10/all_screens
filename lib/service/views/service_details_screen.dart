import 'package:flutter/material.dart';
import '../../constants/widgets/custom_container.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final String? serviceID;
  final String? fromPage;
  const ServiceDetailsScreen({super.key, this.serviceID,this.fromPage="others"}) ;

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> with SingleTickerProviderStateMixin{

  final scaffoldState = GlobalKey<ScaffoldState>();
  bool  _selectedIndex = true;
  late TabController _tabController;
  late ScrollController _scrollController;
  final List<GlobalKey> _keys = [];
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();

    /// Initialize the global keys for each section

    int keysCount = _selectedIndex == true? _productCategory.length : _franchiseCategory.length;
    for (int i = 0; i < keysCount; i++) {
      _keys.add(GlobalKey());
    }
    /// _scrollController
    _tabController = TabController(length: _selectedIndex == true? _productCategory.length: _franchiseCategory.length, vsync: this);

    _scrollController = ScrollController();

    _tabController.addListener(() {
      if (!_isScrolling && _tabController.indexIsChanging) {
        _scrollToSection(_tabController.index);
      }
    });

    _scrollController.addListener(_onScroll);
  }

  void _scrollToSection(int index) {
    final keyContext = _keys[index].currentContext;
    if (keyContext != null) {
      _isScrolling = true;
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        //curve: Curves.decelerate,
        curve: Curves.easeInSine,
      ).then((_) => _isScrolling = false);
    }
  }
  void  _onScroll() {
    if (_isScrolling) return;
    for (int i = 0; i < _keys.length; i++) {
      final keyContext = _keys[i].currentContext;
      if (keyContext != null) {
        final RenderBox box = keyContext.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position > 0 && position < 160) { // Adjust based on layout
          if (_tabController.index != i) {
            _tabController.animateTo(i);
          }
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Dummy category names
  final List<dynamic> _productCategory = [
    'Description',
    'Document',
    'How it works',
    'T&C',
    'FAQs'
  ];
  final List<dynamic> _franchiseCategory = [
    'Payout',
    'Videos',
    'How it works',
    'T&C',''
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [

          /// Big Tap index
          SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(height*0.01)),
                margin:  EdgeInsets.symmetric(vertical: 0, horizontal:  height*0.02),
                child: Row(
                  children: [
                    Expanded(child: _tapButton(context,headline: 'Product Details', borderColorChange:  _selectedIndex == false ? true : false,
                      onTap: () {
                        setState(() {
                          _selectedIndex = true ;
                        });
                      },
                    )),

                    Expanded(child: _tapButton(context,headline: 'Franchise Details', borderColorChange:_selectedIndex == false ? false : true,
                      onTap: () {
                        setState(() {
                          _selectedIndex = false;
                        });
                      },
                    )
                    ),
                  ],
                ),
              )
          ),

          /// Tap index list
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(
              child: Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue.shade700,
                  labelColor: Colors.blue.shade700,
                  unselectedLabelColor: Colors.grey,

                  isScrollable: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  tabs: List.generate(_selectedIndex == true?_productCategory.length:_franchiseCategory.length, (index) {
                    return Tab(
                      icon: const Icon(Icons.inbox, color: Colors.transparent, size: 0),
                      text:_selectedIndex == true?_productCategory[index]:_franchiseCategory[index],
                    );
                  }),
                ),
              ),
            ),
          ),

          ///Tab Details
          SliverToBoxAdapter(
            child:
            _selectedIndex == true?
            Column(
              children: [
                customContainer(  key:  _keys[0],child: Center(child: Text(_productCategory[0])),bRadius: height*0.02, height: height*0.4, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[1],child: Center(child: Text(_productCategory[1])), bRadius: height*0.02, height: height*0.3, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[2],child: Center(child: Text(_productCategory[2])), bRadius: height*0.02, height: height*0.6, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[3], child: Center(child: Text(_productCategory[3])),bRadius: height*0.02, height: height*0.5, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity,borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[4],child: Center(child: Text(_productCategory[4])), bRadius: height*0.02, height: height*0.6, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                SizedBox(height: height*0.3,)
              ],
            ):
            Column(
              children: [
                customContainer(  key:  _keys[0],child: Center(child: Text(_productCategory[0])),bRadius: height*0.02, height: height*0.4, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[1],child: Center(child: Text(_productCategory[1])), bRadius: height*0.02, height: height*0.3, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[2],child: Center(child: Text(_productCategory[2])), bRadius: height*0.02, height: height*0.6, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                customContainer(  key:  _keys[3], child: Center(child: Text(_productCategory[3])),bRadius: height*0.02, height: height*0.6, margin: height*0.01 ,containerColor: Colors.white, width: double.infinity, borderColor: Colors.grey.shade300),
                SizedBox(height: height*0.3,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}

Widget _tapButton(BuildContext context, {String? headline, VoidCallback? onTap, bool? borderColorChange = true}){
  final height = MediaQuery.of(context).size.height;
  return  customContainer(
      bRadius: height*0.01,
      height: height*0.033,
      //margin: height*0.02,
      shadowColor: borderColorChange! ? Colors.transparent : Colors.grey.shade50,
      containerColor:borderColorChange ? Colors.transparent : Colors.blue.shade100,
      borderColor: borderColorChange ? Colors.transparent : Colors.blue.shade200,
      onTap: onTap,
      child:  Center(child: Text(headline!))
  );
}

/// _StickyHeaderDelegate
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}