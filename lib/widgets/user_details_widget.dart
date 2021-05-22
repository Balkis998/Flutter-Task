import 'package:flutter/material.dart';
import 'package:task_balkis/models/user_location.dart';

class UserDetails extends StatelessWidget {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final DateTime dateOfBirth;
  final DateTime registerDate;
  final String phone;
  final String pictureUrl;
  final UserLocation location;
  UserDetails({
    this.email,
    this.id,
    this.title,
    this.location,
    this.gender,
    this.dateOfBirth,
    this.firstName,
    this.lastName,
    this.phone,
    this.pictureUrl,
    this.registerDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.red,
              height: 250,
              width: double.infinity,
              child: Image.network(
                pictureUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(id),
            Text('Gender :$gender'),
            Text('Date Of Birth :$dateOfBirth'),
            Text('Register Date :$registerDate'),
            Divider(height: 15),
            Text('Email :$email'),
            Text('Phone: :$phone'),
            Container(
              height: 200,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(),
                    Text(
                      'Address',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(location.country),
                    Text(location.state),
                    Text(location.city),
                    Text(location.street),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
