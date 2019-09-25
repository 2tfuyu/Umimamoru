import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umimamoru/application/bloc/bloc_provider.dart';
import 'package:umimamoru/application/bloc/cone_state_bloc.dart';
import 'package:umimamoru/presentation/display/display.dart';
import 'package:umimamoru/presentation/display/state/map_state.dart';

import '../umimamoru_theme.dart';

class DisplayHome extends StatefulWidget {

  final String beach;
  final String region;

  const DisplayHome({
    Key key,
    @required this.beach,
    @required this.region
  }) :
        assert(beach != null),
        assert(region != null),
        super(key: key);

  @override
  _DisplayHome createState() => _DisplayHome();
}

class _DisplayHome extends State<DisplayHome> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          icon: Icon(Icons.perm_device_information, color: Colors.white),
        ),
        Tab(
          icon: Icon(Icons.pin_drop, color: Colors.white),
        )
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: UmimamoruTheme.colorTheme,
            title: Text(widget.beach, style: TextStyle(color: Colors.white)),
            bottom: getTabBar()
        ),
        body: getTabBarView(<Widget>[
          Display(beach: widget.beach, region: widget.region),
          BlocProvider<ConeStateBloc>(
              bloc: ConeStateBloc(widget.beach),
              child: MapState()
          )
        ]
        )
    );
  }
}