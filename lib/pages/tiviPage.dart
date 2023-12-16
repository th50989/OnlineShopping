import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/pages/mobilePage.dart';
import 'package:flutter_application_1/pages/services/services.dart';

class MyTiViPage extends StatefulWidget {
  const MyTiViPage({super.key});

  @override
  State<MyTiViPage> createState() => _MyTiViPageState();
}

class _MyTiViPageState extends State<MyTiViPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 0,
              // toolbarHeight: MediaQuery.of(context).size.height / 10,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Samsung"),
                  Tab(text: "Sony"),
                  Tab(text: "LG"),
                  Tab(text: "Khac"),
                ],
              )),
          body: const TabBarView(
            children: [
              TiviPage(
                nhom: "SAMSUNG",
              ),
              TiviPage(
                nhom: "SONY",
              ),
              TiviPage(
                nhom: "LG",
              ),
              TiviPage(
                nhom: "KHAC",
              )
            ],
          ),
        ));
  }
}

class TiviPage extends StatefulWidget {
  const TiviPage({super.key, required this.nhom});
  final String nhom;
  @override
  State<TiviPage> createState() => _TiviPageState();
}

class _TiviPageState extends State<TiviPage> {
  late List<TiviModel>? _filterTivi = [];
  late List<TiviModel>? _filterTivi1 = [];
  late List<TiviModel>? _tiviModel = [];
  bool _isLoading = true;
  void navigate(int dongia, String ten, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyDetail(
                ten: ten,
                url: url,
                dongia: dongia,
              )),
    );
  }

  handle(String value) {
    debugPrint('Gia tri nhap vao: ${value}');

    if (value.isEmpty) {
      debugPrint('empty');
      setState(() {
        _filterTivi1 = [];
        _filterTivi1 = _filterTivi;
      });
    } else {
      List<TiviModel>? result;
      result = _filterTivi
          ?.where(
              (item) => item.ten.toLowerCase().contains(value.toLowerCase()))
          .toList();
      // debugPrint(result?[0].ten.toString());
      // debugPrint(result?[1].ten.toString());
      //debugPrint(result?[1].ten.toString());
      result?.forEach((element) {
        debugPrint('Result: ${element.ten}');
      }); // [1, 2, 3]
      // final valuesList = result.values.toList(growable: false);
      // debugPrint(result?.toList());

      _filterTivi1?.forEach((element) {
        debugPrint('Filtertv: ${element.ten}');
      });
      setState(() {
        _filterTivi1 = result;
      });
      _filterTivi1?.forEach((element) {
        debugPrint('Sau setstate Filtertv: ${element.ten}');
        debugPrint(_filterTivi1?.length.toString());
      });
    }
  }

  void _getData() async {
    _tiviModel = (await ApiService().getTivis())!
        .where((food) =>
            food.nhom.maso.toString().toLowerCase() ==
            widget.nhom.toString().toLowerCase())
        .toList();
    debugPrint(_tiviModel!.length.toString());
    setState(() {
      _filterTivi = _tiviModel;
      _filterTivi1 = _filterTivi;
      _isLoading = false;
    });

    //  debugPrint(_filterTivi.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => handle(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _filterTivi1?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigate(
                        _filterTivi1![index].dongiaBan,
                        _filterTivi1![index].ten.toString(),
                        '${Value.baseUrl}${_filterTivi1![index].maso}.png');
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: ListTile(
                      subtitle: Center(
                          child: Text(
                              style: TextStyle(color: Colors.red),
                              _filterTivi1![index].dongiaBan.toString())),
                      leading: Container(
                        height: 200,
                        width: 100,
                        child: Image.network(
                            fit: BoxFit.fill,
                            '${Value.baseUrl}${_filterTivi1![index].maso}.png'),
                      ),
                      title: Text(_filterTivi1![index].ten.toString()),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
