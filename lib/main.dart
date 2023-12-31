import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tooldiem/student.dart';

void main() {
  runApp(const App());
}

void showSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Đã copy")));
}

final huy = Student(
  name: "Hương Đạt Huy",
  id: "31231021639",
  lop: "SE0001",
  khoa: "Công nghệ thông tin kinh doanh",
  nganh: "Kỹ thuật phần mềm",
  phone: "0914398183",
  address:
      "320/39 Bình Trị Đông, Phường Bình Trị Đông, Quận Bình Tân, TP. Hồ Chí Minh",
  fb: "https://facebook.com/tadyuh/",
  email: "tadyuh76@gmail.com",
  edumail: "huyhuong.31231021639@st.ueh.edu.vn",
);

final nhu = Student(
  name: "Lý Hồng Như",
  id: "31231021252",
  lop: "TSP001",
  khoa: "Du lịch",
  nganh: "Quản trị lữ hành",
  phone: "0908227514",
  address: "4 Trịnh Đình Thảo, p. Hoà Thạnh, q. Tân Phú",
  fb: "https://www.facebook.com/nhu.hong.9047506",
  email: "Lyhongnhu290@gmail.com",
  edumail: "nhuly.31231021252@st.ueh.edu.vn",
);

final data = [huy, nhu];

class TouchableText extends StatelessWidget {
  final String text;
  const TouchableText(this.text, {super.key});

  void copy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    showSnackbar(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => copy(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            height: 1.5,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TOOL DIEM"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TouchableText(data[index].name),
                    TouchableText(data[index].id),
                    TouchableText(data[index].lop),
                    TouchableText(data[index].phone),
                    TouchableText(data[index].khoa),
                    TouchableText(data[index].nganh),
                    TouchableText(data[index].address),
                    TouchableText(data[index].fb),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
