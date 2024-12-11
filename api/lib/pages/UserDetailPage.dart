import '../api/fetchuser.dart';
import '../model/user.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Username: ${user.username}',
                            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Email: ${user.email}',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 18, color: Colors.blueGrey),
                              SizedBox(width: 5),
                              Text(user.phone, style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.web, size: 18, color: Colors.blueGrey),
                              SizedBox(width: 5),
                              Text(user.website, style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(),
                          SizedBox(height: 8),
                          Text(
                            'Address: ${user.address.street}, ${user.address.city}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Company: ${user.company.name}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available', style: TextStyle(fontSize: 18)));
          }
        },
      ),
    );
  }
}
