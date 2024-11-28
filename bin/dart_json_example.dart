import 'dart:convert';

// 직렬화 : 객체를 JSON 형태의 문자열로 변환
//         객체 -> Map -> String
//         jsonEncode
//         객체에 toJson 메서드 구현
// 역직렬화 : JSON 형태의 문자열을 객첼 변환
//          String -> Map -> 객체
//          jsonDecode
//          객체에 fromJason named 생성자 구현하여 사용

void main() {
  // Pet
  String easyJson = """
{
  "name": "김영환",
  "age": 28,
  "isMale": true
}
""";

  // 1. String -> Map 형태로 바꾼다.
  Map<String, dynamic> easyMap = jsonDecode(easyJson);
  // 3. Map -> class 객체로 바꾼다.
  Pet pet = Pet.fromJason(easyMap);
  print(pet.toJson());

  // PetDetail
  // Contact
  String hardJson = """
{
{
	"name": "오상구",
	"age": 7,
	"isMale" : true,
	"favorite_foods" : ["삼겹살", "연어", "고구마"],
	"dislike_foods" : [],
	"contact": {
		"mobile": "010-0000-0000",
		"email": null
	}
}
""";
}

// 2. class를 정의한다.
// name, age, isMale
class Pet {
  String name;
  int age;
  bool isMale;

  Pet({
    required this.name,
    required this.age,
    required this.isMale,
  });

  // fromJson named 생성자 만들기
  Pet.fromJason(Map<String, dynamic> map)
      : this(
          name: map['name'],
          age: map['age'],
          isMale: map['isMale'],
        );

  // Map<String, dynamic> toJson 만들기
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'isMale': isMale,
    };
  }
}
