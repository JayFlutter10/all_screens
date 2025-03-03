import 'package:flutter/material.dart';

class CustomTapBarWidget extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> widgets;
  Decoration? indicator;
  Color? indicatorColor;
  Color? dividerColor;
  TextStyle? textStyle;
  final double indicatorHeight;
   CustomTapBarWidget({
    super.key,
     this.textStyle,
     this.indicator,
     required this.indicatorHeight,
     this.indicatorColor,
     this. dividerColor,
    required this.tabTitles,
    required this.widgets,
  });

  @override
  State<CustomTapBarWidget> createState() => _CustomTapBarWidgetState();
}

class _CustomTapBarWidgetState extends State<CustomTapBarWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final List<GlobalKey> _keys = [];
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabTitles.length, vsync: this);
    _scrollController = ScrollController();
    _keys.addAll(List.generate(widget.widgets.length, (index) => GlobalKey()));

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
        curve: Curves.easeInOut,
      ).then((_) => _isScrolling = false);
    }
  }

  void _onScroll() {
    if (_isScrolling) return;
    for (int i = 0; i < _keys.length; i++) {
      final keyContext = _keys[i].currentContext;
      if (keyContext != null) {
        final RenderBox box = keyContext.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position > 0 && position < 150) { // Adjust based on layout
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Tab Bar'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (scrollNotification) {
          _onScroll();
          return true;
        },
        child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 200,),),
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                title: TabBar(
                  labelStyle:widget.textStyle,
                  indicatorWeight: widget.indicatorHeight,
                  indicator: widget.indicator,
                  dividerColor: Colors.transparent??widget.dividerColor,
                  indicatorColor: widget.indicatorColor??Color.fromRGBO(0, 80, 157, 1),
                  controller: _tabController,
                  tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: List.generate(widget.widgets.length, (index) {
                    return Container(
                      key: _keys[index],
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: widget.widgets[index],
                    );
                  }),
                ),
              ),
            ]
        ),
      ),
    );
  }
}