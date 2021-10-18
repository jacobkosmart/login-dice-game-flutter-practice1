import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // TextEditingController instance 생성
  // textfiled 의 값을 읽어야 할 때, TextEditingController 를 사용합니다. textField 와 연결 시켜야 한다는 의미 입니다.
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      // snackBar 에 context 전달을 위해서 Builder 생성
      body: Builder(builder: (context) {
        // SingleChildScrollView : body 영역에 나중에 keyboard 가 올라와서 스크린 영역을 침범하면 그만큼 안짤리게 body screen 을 올려줌
        // GestureDetector : onTap 의 함수로써 unfocus 하면 키보드가 사라지게 하는것 (화면 밖을 누르면 keyboard 가 내려가는것)
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Center(
                  //
                  child: SvgPicture.asset(
                    'images/logo1.svg',
                    width: 150.0,
                    height: 150.0,
                  ),
                ),

                // Form Widget
                Form(
                  child: Theme(
                    data: ThemeData(
                      // textField 를 클릭했을때, 강조되는 색상 지정
                      primaryColor: Colors.deepPurpleAccent,
                      // textField 위에 사용자에게 정보를 주는 lable design
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    // textfiled 를 child 에 나열
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            // TextEditingController 에 입력값 연결
                            controller: controller1,
                            // app 이 실행되자 마자 texfiled 에 자동으로 focus 값을 줘서 id 에 바로 입력 할수 있게 함
                            autofocus: true,
                            decoration:
                                InputDecoration(labelText: 'Enter "dice"'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            // TextEditingController 에 입력값 연결
                            controller: controller2,
                            decoration:
                                InputDecoration(labelText: 'Enter "Password"'),
                            keyboardType: TextInputType.text,
                            // obscureText : password 시 글자가 안보이게 함
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                            minWidth: 100.0,
                            height: 50.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurpleAccent,
                              ),
                              onPressed: () {
                                if (controller1.text == 'dice' &&
                                    controller2.text == '1234') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => Dice(),
                                    ),
                                  );
                                  // null safety 때문에 아닌 경우에도 경우를 체크 해야됨
                                } else if (controller1.text != 'dice' &&
                                    controller2.text == '1234') {
                                  // ID 가 틀렸을 경우
                                  showSnackBar3(context);
                                } else if (controller1.text == 'dice' &&
                                    controller2.text != '1234') {
                                  // Password 가 틀렸을 경우
                                  showSnackBar2(context);
                                } else {
                                  // snack bar 불어 오기
                                  showSnackBar1(context);
                                }
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// show snakBar 함수 : builder 의 context 값이 전달 되어야 함
void showSnackBar1(BuildContext context) {
  // 첫번째 snackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '로그인 정보를 다시 확인하세요',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar2(BuildContext context) {
  // 첫번째 snackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '비밀번호가 일치하지 않습니다',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar3(BuildContext context) {
  // 첫번째 snackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'dice 의 철자를 확인하세요',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
