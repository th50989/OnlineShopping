import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/pages/mobilePage.dart';
import 'package:flutter_application_1/pages/services/services.dart';

class MyFoodPage extends StatefulWidget {
  const MyFoodPage({super.key});

  @override
  State<MyFoodPage> createState() => _MyFoodPageState();
}

class _MyFoodPageState extends State<MyFoodPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 0,
              // toolbarHeight: MediaQuery.of(context).size.height / 10,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Cafe"),
                  Tab(text: "Food"),
                ],
              )),
          body: TabBarView(
            children: [
              FoodPage(
                nhom: "CA_PHE",
              ),
              FoodPage(
                nhom: "MON_AN",
              ),
            ],
          ),
        ));
  }
}

class FoodPage extends StatefulWidget {
  FoodPage({super.key, required this.nhom});
  String nhom = '';
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late List<FoodModel>? _filterFood = [];
  late List<FoodModel>? _filterFood1 = [];
  late List<FoodModel>? _FoodModel = [];
  void _getData() async {
    _FoodModel = (await ApiService().getFoods())!
        .where((food) =>
            food.nhom.maso.toString().toLowerCase() ==
            widget.nhom.toString().toLowerCase())
        .toList();

    debugPrint(_FoodModel!.length.toString());
    setState(() {
      _filterFood = _FoodModel;
      _filterFood1 = _filterFood;
    });
    debugPrint(_filterFood.toString());
  }

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
        _filterFood1 = [];
        _filterFood1 = _filterFood;
      });
    } else {
      List<FoodModel>? result;
      result = _filterFood
          ?.where(
              (item) => item.ten.toLowerCase().contains(value.toLowerCase()))
          .toList();
      // debugPrint(result?[0].ten.toString());
      // debugPrint(result?[1].ten.toString());
      //debugPrint(result?[1].ten.toString());
      // result?.forEach((element) {
      //   debugPrint('Result: ${element.ten}');
      // }); // [1, 2, 3]
      // final valuesList = result.values.toList(growable: false);
      // debugPrint(result?.toList());

      // _filterFood1?.forEach((element) {
      //   debugPrint('Filtermb: ${element.ten}');
      // });
      setState(() {
        _filterFood1 = result;
      });
      // _filterMobile1?.forEach((element) {
      //   debugPrint('Sau setstate Filtertv: ${element.ten}');
      //   debugPrint(_filterMobile1?.length.toString());
      // });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
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
              itemCount: _filterFood1?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigate(
                        _filterFood1![index].dongiaBan,
                        _filterFood1![index].ten.toString(),
                        '${Value.baseUrl}${_filterFood1![index].maso}.png');
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
                              _filterFood1![index].dongiaBan.toString())),
                      leading: Container(
                        height: 200,
                        width: 100,
                        child: Image.network(
                            fit: BoxFit.fill,
                            '${Value.baseUrl}${_filterFood1![index].maso}.png'),
                      ),
                      title: Text(_filterFood1![index].ten.toString()),
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
