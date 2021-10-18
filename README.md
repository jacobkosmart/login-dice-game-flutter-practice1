![Kapture 2021-10-18 at 11 16 02](https://user-images.githubusercontent.com/28912774/137659194-667d9b91-f330-4cee-b4ad-4cf2d63c2c2b.gif)

## 1.설치 패키지 및 초기 설정

### yaml 설정

```yaml
# const constructors false in analysis_options.yaml
rules:
  prefer_const_constructors: false

#  add images folder in pubspec.yaml
assets:
  - images/
```

### Add package

```bash
# to show svg image in the app
 $ flutter pub add flutter_svg
```

```dart
// in main.dart

import 'package:flutter_svg/flutter_svg.dart';

// add svg images
SvgPicture.asset("images/imageName.svg")
```

## Login page 만들기

### autoFocus

```dart
TextField(
  // TextEditingController 에 입력값 연결
  controller: controller1,
  // app 이 실행되자 마자 texfiled 에 자동으로 focus 값을 줘서 id 에 바로 입력 할수 있게 함
  autofocus: true,
)
```

### Focus

- FocusNode : 포커스를 받는 특정 위젯을 식별

- FocusScope: 어떤 위젯들 까지 포커스를 받는지 범위를 나타냄

## dice page 만들기

### random 숫자 나타내기

```dart

  // 주사위 숫자 변수
  int leftDice = 1;
  int rightDice = 1;


ButtonTheme(
  minWidth: 100.0,
  height: 60.0,
  child: ElevatedButton(
    onPressed: () {
      setState(() {
        // 0 ~ 5 까지의 random 변수에 + 1 해 줌
        leftDice = Random().nextInt(6) + 1;
        rightDice = Random().nextInt(6) + 1;
      });
      showToast("왼쪽 주사위 : ($leftDice), 오른쪽 주사위 : ($leftDice)");
    },
    child: Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: 50.0,
    ),
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurpleAccent,
    ),
  ),
),
```

### fluttertoast 패키지 추가

```yaml
# in pubspec.yaml

dev_dependencies:
  flutter_test:
    sdk: flutter
  # fluttertoast package 추가
  fluttertoast: ^8.0.8
# vscode 에서는 저장하면 자동으로 pub get 으로 package 다운로드 받아서 저장 됨
```

- toastMessage 를 적용시키려면 app 을 재실행 시켜야 함

```dart
void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    // toast 메세지 지속시간 설정
    toastLength: Toast.LENGTH_SHORT,
    // toast 메세지 위치 설정
    gravity: ToastGravity.BOTTOM,
  );
}
```

🔶 🔷 📌 🔑

## Reference

- Adding interactivity to your Flutter app - [https://flutter.dev/docs/development/ui/interactive](https://flutter.dev/docs/development/ui/interactive)

- 코딩 셰프 - [https://www.youtube.com/watch?v=StvbitxUKSo&list=PLQt_pzi-LLfoOpp3b-pnnLXgYpiFEftLB](hhttps://www.youtube.com/watch?v=StvbitxUKSo&list=PLQt_pzi-LLfoOpp3b-pnnLXgYpiFEftLB)
