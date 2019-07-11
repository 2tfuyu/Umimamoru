import 'package:flutter/material.dart';
import 'package:umimamoru_flutter/info_display.dart';

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text("Search Smaple", style: TextStyle(color: Colors.white));
  Icon actionIcon = Icon(Icons.search, color: Colors.white,);
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<String> _list;
  bool _isSearching;
  String _searchText = "";

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  initState() {
    super.initState();
    _isSearching = false;
    init();
  }

  init() {
    _list = [
      "foo",
      "bar",
      "foobar",
      "hoge",
      "hogehoge",
      "hogepoyo"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: key,
      appBar: buildBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => ChildItem(contact)).toList();
    }
    else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: appBarTitle,
      actions: <Widget>[
        IconButton(icon: actionIcon, onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = Icon(Icons.close, color: Colors.white,);
              this.appBarTitle = TextField(
                controller: _searchQuery,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white,),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white)
                ),
              );
              _handleSearchStart();
            }
            else {
              _handleSearchEnd();
            }
          });
        },)
      ],
    );
  }

  _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(Icons.search, color: Colors.white);
      this.appBarTitle = Text("Search Sample", style: new TextStyle(color: Colors.white));
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(title: RaisedButton(
        key: null,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoDisplay(this.name)));
        },
        color: Color(0xFFe0e0e0),
        child:
        Text(
          this.name,
          style: TextStyle(fontSize:18.0,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        )
    ));
  }
}