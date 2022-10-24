import 'package:flutter/material.dart';
import 'package:gerak_cuy/models/user_model.dart';

import '../shared/theme.dart';

class JoinedUsersList extends StatelessWidget {
  const JoinedUsersList({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        decoration: BoxDecoration(
            color: Colors.lightBlue.shade200,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: NetworkImage(userModel.foto!),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.fullName!,
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    userModel.nomor!,
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ]));
  }
}
