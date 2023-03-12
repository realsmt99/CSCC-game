import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../theme/colors.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          'Feedback',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: primary, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.03),
                spreadRadius: 10,
                blurRadius: 3,
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, right: 25, left: 25, bottom: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        cursorColor: black,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.record_voice_over_rounded),
                          prefixIconColor: black,
                          hintText: "Feedback",
                          border: InputBorder.none,
                        ),
                        controller: _feedbackController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your feedback';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: _rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 40,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final user = FirebaseAuth.instance.currentUser;
                            final username = await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid)
                                .get()
                                .then((value) => value.data()!['username']);
                            final feedback = _feedbackController.text;
                            await FirebaseFirestore.instance
                                .collection('User+Feedback')
                                .add({
                              'username': username,
                              'feedback': feedback,
                              'rating': _rating,
                            });
                            Navigator.of(context).pushNamed("homePage");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Thank you for your feedback!',
                                  style: TextStyle(color: white),
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.grey.shade800,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: blue,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          minimumSize: Size(double.infinity, 0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
