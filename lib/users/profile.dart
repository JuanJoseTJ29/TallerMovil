import 'package:flutter/material.dart';

import 'profile_header.dart';
import 'profile_data.dart';

class ProfileUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Data_Profile(),
      Header_Profile("assets/images/people_1.jpeg", "Juana Jose"),
    ]);
  }
}
