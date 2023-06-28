import 'package:finder/bachelor_details.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorPreview extends StatelessWidget {
  const BachelorPreview(
      {Key? key,
      required this.bachelor,
      required this.toggleLikedBachelor,
      required this.isLiked})
      : super(key: key);

  final Bachelor bachelor;
  final VoidCallback toggleLikedBachelor;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(bachelor.avatar),
      ),
      textColor: const Color.fromARGB(255, 66, 66, 66),
      title: Text(bachelor.firstname),
      subtitle: Text(bachelor.lastname),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BachelorDetails(
                bachelor: bachelor,
                toggleLikedBachelor: toggleLikedBachelor,
                isLiked: isLiked),
          ),
        );
      },
    );
  }
}
