import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:flutter_application_1/pages/details.dart';

import 'package:flutter_application_1/pages/services/services.dart';

class MyMobilePage extends StatefulWidget {
  const MyMobilePage({super.key});

  @override
  State<MyMobilePage> createState() => _MyMobilePageState();
}

class _MyMobilePageState extends State<MyMobilePage> {
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
                  Tab(text: "Android"),
                  Tab(text: "IOS"),
                ],
              )),
          body: TabBarView(
            children: [
              MyAndroidPage(nhom: "ANDROID"),
              MyAndroidPage(
                nhom: "IPHONE",
              )
            ],
          ),
        ));
  }
}

class MyAndroidPage extends StatefulWidget {
  MyAndroidPage({super.key, required this.nhom});
  String nhom = '';
  @override
  State<MyAndroidPage> createState() => _MyAndroidPageState();
}

class _MyAndroidPageState extends State<MyAndroidPage> {
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

  late List<MobileModel>? _filterMobile = [];
  late List<MobileModel>? _filterMobile1 = [];
  late List<MobileModel>? _mobileModel = [];
  void _getData() async {
    _mobileModel = (await ApiService().getMobiles())!
        .where((mobile) =>
            mobile.nhom.maso.toString().toLowerCase() ==
            widget.nhom.toString().toLowerCase())
        .toList();
    debugPrint(_mobileModel!.length.toString());
    setState(() {
      _filterMobile = _mobileModel;
      _filterMobile1 = _filterMobile;
    });
    debugPrint(_filterMobile.toString());
  }

  handle(String value) {
    debugPrint('Gia tri nhap vao: ${value}');

    if (value.isEmpty) {
      debugPrint('empty');
      setState(() {
        _filterMobile1 = [];
        _filterMobile1 = _filterMobile;
      });
    } else {
      List<MobileModel>? result;
      result = _filterMobile
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

      // _filterMobile1?.forEach((element) {
      //   debugPrint('Filtermb: ${element.ten}');
      // });
      setState(() {
        _filterMobile1 = result;
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
              itemCount: _filterMobile1?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigate(
                        _filterMobile1![index].dongiaBan,
                        _filterMobile1![index].ten.toString(),
                        '${Value.baseUrl}${_filterMobile1![index].maso}.png');
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
                              _filterMobile1![index].dongiaBan.toString())),
                      leading: Container(
                        height: 200,
                        width: 100,
                        child: Image.network(
                            fit: BoxFit.fill,
                            '${Value.baseUrl}${_filterMobile1![index].maso}.png'),
                      ),
                      title: Text(_filterMobile1![index].ten.toString()),
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

// class MyIosPage extends StatefulWidget {
//   MyIosPage({super.key, required this.nhom});
//   String nhom = '';
//   @override
//   State<MyIosPage> createState() => _MyIosPageState();
// }

// class _MyIosPageState extends State<MyIosPage> {
//   void navigate(int dongia, String ten, String url) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => MyDetail(
//                 ten: ten,
//                 url: url,
//                 dongia: dongia,
//               )),
//     );
//   }

//   late List<MobileModel>? _filterMobile = [];
//   late List<MobileModel>? _mobileModel = [];
//   void _getData() async {
//     _mobileModel = (await ApiService().getMobiles())!
//         .where((mobile) =>
//             mobile.nhom.maso.toString().toLowerCase() ==
//             widget.nhom.toString().toLowerCase())
//         .toList();
//     debugPrint(_mobileModel!.length.toString());
//     setState(() {
//       _filterMobile = _mobileModel;
//     });
//     debugPrint(_filterMobile.toString());
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: _filterMobile?.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 color: Theme.of(context).colorScheme.outline,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(12)),
//             ),
//             child: ListTile(
//               subtitle: Center(
//                   child: Text(
//                       style: TextStyle(color: Colors.red),
//                       _filterMobile![index].dongiaBan.toString())),
//               leading: Container(
//                 height: 200,
//                 width: 100,
//                 child: Image.network(
//                     fit: BoxFit.fill,
//                     '${Value.baseUrl}${_filterMobile![index].maso}.png'),
//               ),
//               title: Text(_filterMobile![index].ten.toString()),
//               trailing: InkWell(
//                 child: Icon(Icons.navigate_next),
//                 onTap: () {
//                   navigate(
//                       _filterMobile![index].dongiaBan,
//                       _filterMobile![index].ten.toString(),
//                       '${Value.baseUrl}${_filterMobile![index].maso}.png');
//                 },
//               ),
//             ),
//           );
//         });
//   }
// }



// class MatHang {
//   String url;
//   int dongia;
//   int ten;

//   MatHang(this.dongia, this.ten, this.url);
// }
