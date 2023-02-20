import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/user_request_model.dart';

class ResumeItem extends StatelessWidget {
  final UserRequestModel userRequest;

  const ResumeItem({
    required this.userRequest,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            userRequest.user,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  for (int i = 0; i < userRequest.food!.length; i++)
                    Text(
                      userRequest.food![i],
                      style: const TextStyle(fontSize: 18),
                    )
                ],
              ),
              Column(
                children: [
                  for (int i = 0; i < userRequest.juice!.length; i++)
                    Text(
                      userRequest.juice![i],
                      style: const TextStyle(fontSize: 18),
                    )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
