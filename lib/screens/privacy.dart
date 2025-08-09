import 'package:flutter/material.dart';
import 'package:seo/constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final String policyText = '''
This is your Privacy Policy.

We respect your privacy and are committed to protecting your personal data.

- Data Collection
- Usage
- Security
- Third-party Sharing
- Contact Information
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          policyText,
          style: TextStyle(fontSize: 16,color: textBlack),
        ),
      ),
    );
  }
}
