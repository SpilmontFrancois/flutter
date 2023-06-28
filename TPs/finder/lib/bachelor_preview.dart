import 'package:finder/bachelor_details.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorPreview extends StatelessWidget {
  const BachelorPreview({Key? key, required this.bachelor}) : super(key: key);

  final Bachelor bachelor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(bachelor.avatar),
      ),
      title: Text(bachelor.firstname),
      subtitle: Text(bachelor.lastname),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BachelorDetails(bachelor: bachelor),
          ),
        );
      },
    );
  }
}
