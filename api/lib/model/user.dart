import 'address.dart';
import 'company.dart';

class User {
/*
"id": 1,
"name": "Leanne Graham",
"username": "Bret",
"email": "Sincere@april.biz",
"address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
    }
},
"phone": "1-770-736-8031 x56442",
"website": "hildegard.org",
"company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
} 
*/

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // Deserialization (JSON -> Object)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name":name,
      "username":username,
      "email":email,
      "address":address.toJson(),
      "phone":phone,
      "website":website,
      "conmpany":company.toJson(),
    };
  }
}




// IMP THINGS 
// Deserialize JSON to User object
 // Map<String, dynamic> userMap = jsonDecode(jsonResponse);  // Convert JSON string to map
 //User user = User.fromJson(userMap);  // Convert map to User object
// / Print User object details
//   print('User ID: ${user.id}');
//   print('Name: ${user.name}');
//   print('Username: ${user.username}');
//   print('Email: ${user.email}');
//   print('Address: ${user.address.street}, ${user.address.city}');
//   print('Phone: ${user.phone}');
//   print('Company: ${user.company.name}');

// Serialize User object back to JSON
  //Map<String, dynamic> userJson = user.toJson();
  //String jsonString = jsonEncode(userJson);  // Convert map back to JSON string
// Print the JSON string
  // print('Serialized JSON:');
  // print(jsonString);

