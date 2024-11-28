import 'dart:convert';


// 직렬화 : 객체를 JSON 형태의 문자열로 변환
//         객체 -> Map -> String
//         jsonEncode
//         객체에 toJson 메서드 구현
// 역직렬화 : JSON 형태의 문자열을 객첼 변환
//          String -> Map -> 객체
//          jsonDecode
//          객체에 fromJason named 생성자 구현하여 사용

void main(List<String> arguments) {
  // jsonEncode : Map => String 역할!
  //
  Map<String, dynamic> map = {
    "name" : "이지원",
    "age" : 20,
};

  String jsonData = jsonEncode(map);
  print(jsonData);

  String jsonSampleDate = """
{
  "name":"이지원",
  "age":20
}
  """;
  var decodedData = jsonDecode(jsonSampleDate);
  print(decodedData.runtimeType);
  print(decodedData);

  Human human = Human.fromJson(decodedData);
  human.toJson();
}


class Human {
  String name;
  int age;

  Human({
    required this.name,
    required this.age,
  });

  Human.fromJson(Map<String, dynamic> map) : this(
    name: map['name'],
    age: map['age'],
  );
  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'age': age,
    };
  }
}