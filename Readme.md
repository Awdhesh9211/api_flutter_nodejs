# DEMO PNG
1. **Image Path**: ![screen](./screen.png) 
# HTTP Package for Flutter

This README covers usage of the `http` package in Flutter. It provides examples for making HTTP requests including `GET`, `POST`, `PUT`, `DELETE`, and `PATCH` requests, along with headers, parameters, and body data.

### Key Points:
- **GET**: Used for fetching data.
- **POST**: Used for sending data to the server.
- **PUT**: Used to update an existing resource.
- **DELETE**: Used to delete a resource.
- **PATCH**: Used to partially update a resource.
- Handling headers, bodies, and errors effectively.

## Table of Contents
- [Installation](#installation)
- [HTTP Methods](#http-methods)
  - [GET Request](#get-request)
  - [POST Request](#post-request)
  - [PUT Request](#put-request)
  - [DELETE Request](#delete-request)
  - [PATCH Request](#patch-request)
- [Query and URL Parameters](#query-and-url-parameters)
- [Error Handling](#error-handling)
- [Headers and Body](#headers-and-body)

## Installation

1. Add the `http` package to your `pubspec.yaml`:

```yaml
dependencies:
  http: ^0.14.0
```
## HTTP Methods
# GET
```dart
Future<void> fetchData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    throw Exception('Failed to load data');
  }
}
```
# POST
```dart
Future<void> postData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: '{"title": "foo", "body": "bar", "userId": 1}',
  );

  if (response.statusCode == 201) {
    print('Post created: ${response.body}');
  } else {
    throw Exception('Failed to post data');
  }
}
```
# PUT
```dart
Future<void> updateData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.put(
    url,
    headers: {'Content-Type': 'application/json'},
    body: '{"id": 1, "title": "foo updated", "body": "bar updated", "userId": 1}',
  );

  if (response.statusCode == 200) {
    print('Updated data: ${response.body}');
  } else {
    throw Exception('Failed to update data');
  }
}
```
# DELETE 
```dart
Future<void> deleteData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.delete(url);

  if (response.statusCode == 200) {
    print('Resource deleted');
  } else {
    throw Exception('Failed to delete data');
  }
}
```
# PATCH
```dart
Future<void> patchData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.patch(
    url,
    headers: {'Content-Type': 'application/json'},
    body: '{"title": "foo patched"}',
  );

  if (response.statusCode == 200) {
    print('Patched data: ${response.body}');
  } else {
    throw Exception('Failed to patch data');
  }
}
```
## Query and URL Parameters
### Adding Query Parameters to GET Requests
```dart
Future<void> fetchDataWithParams() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts')
      .replace(queryParameters: {'userId': '1', 'id': '1'});  // Add query params

  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    throw Exception('Failed to load data');
  }
}
```
```dart
https://jsonplaceholder.typicode.com/posts?userId=1&id=1
```
### Adding URL Parameters (Path Parameters)
```dart
Future<void> fetchPostById() async {
  final postId = 1;  // Dynamically specify the post ID
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'); // URL with path parameter

  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    throw Exception('Failed to load data');
  }
}
```
### Combining Query and URL Parameters
```dart
Future<void> fetchPostWithParams() async {
  final postId = 1;
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId')
      .replace(queryParameters: {'userId': '1'});

  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    throw Exception('Failed to load data');
  }
}
```
```dart
https://jsonplaceholder.typicode.com/posts/1?userId=1
```
## ERROR HANDLING
```dart
Future<void> handleErrors() async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/invalid-url'));

    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```
## HEADERS AND BODY
### Custome Headers
```dart
Future<void> fetchDataWithHeaders() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.get(
    url,
    headers: {'Authorization': 'Bearer your_token_here', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    throw Exception('Failed to load data');
  }
}
```
### Sending JSON Body
```dart
Future<void> postJsonData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: '{"title": "foo", "body": "bar", "userId": 1}',
  );

  if (response.statusCode == 201) {
    print('Post created: ${response.body}');
  } else {
    throw Exception('Failed to post data');
  }
}
```



