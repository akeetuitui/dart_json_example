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
  // 1. jsonString -> Map 형태로
  Map<String, dynamic> hardMap = jsonDecode(hardJson);

  // 3. class를 정의했으니 객체로 만든다 (map을)
  PetDetail petDetail = PetDetail.fromJason(hardMap);
  print(petDetail.toJASON());
}

// 2. 객체로 바꾸기 위해서 class를 정의한다.
class PetDetail {
  String name;
  int age;
  bool isMale;
  List<String> favoriteFoods;
  Contact contact;

  PetDetail({
    required this.name,
    required this.age,
    required this.isMale,
    required this.favoriteFoods,
    required this.contact,
  });

  // fromJson 네임드 생성자
  PetDetail.fromJason(Map<String, dynamic> map): this(
    name: map['name'],
    age: map['age'],
    isMale: map['isMale'],
    favoriteFoods: List<String>.from(map['favorite_foods']),
    contact: Contact.fromJason(map['contact']),
  );

  // toJson 메서드
  Map<String, dynamic> toJASON(){
    return {
      'name': name,
      'age': age,
      'isMale': isMale,
      'favorite_foods': favoriteFoods,
      'contact': contact.toJASON(),
    };
  }
}

class Contact {
  // contact가 하위 정보가 있으니 클래스로 정의해준다
  String mobile;
  String? email; // email은 null이 올 수 있으니 '?'를 붙여준다

  Contact({
    required this.mobile,
    required this.email,
  });

// Contact. fromJson 네임드 생성자 만들기
  Contact.fromJason(Map<String, dynamic> map)
      : this(
          mobile: map['mobile'],
          email: map['email'],
        );

// toJASON 메서드 만들기
  Map<String, dynamic> toJASON() {
    return 
    {'mobile': mobile, 'email': email};
  }
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
