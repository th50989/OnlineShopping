import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "About the app",
                ),
                Tab(
                  text: "Contact",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [MyIntro(), MyContact()],
          ),
        ));
  }
}

class MyIntro extends StatefulWidget {
  const MyIntro({super.key});

  @override
  State<MyIntro> createState() => _MyIntroState();
}

class _MyIntroState extends State<MyIntro> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Ứng dụng mua sắm online sử dụng flutter'),
              ),
              Center(
                  child: Text(
                'Hướng dẫn sử dụng',
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Người dùng chọn 1 trong 3 loại dịch vụ ở phía trên.',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Người dùng chọn món hàng muốn mua và bấm vào món hàng đó',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Người dùng chọn nút đặt hàng',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Người dùng có thể xem lại những món đã đặt ở phần Orders phía bên dưới',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Nếu người dùng đang ở mục orders,vui lòng quay về mục shop trước khi bấm các tab dịch vụ ở trên',
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyContact extends StatelessWidget {
  const MyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://csc.edu.vn/template/frontend/images/logo-mobile-ttth.png'),
            const SizedBox(height: 20),
            const Text(
              'Sinh viên thực hiện: Hoàng Cao Thành',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Giảng viên hướng dẫn: Thầy Tuấn',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
