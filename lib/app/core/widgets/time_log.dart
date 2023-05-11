import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../components/grey_container.dart';

class TimeLogWidget extends StatelessWidget {
  const TimeLogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GreyContainer(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Time Log',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          const Text(
            'Time Today',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '09:00\nScheduled',
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                '00:00\nWorked',
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                '00:00\nBalanced',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'This month',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppColors.primaryColor,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 5),
                  Text(
                    '224h',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Total schedule time',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Worked Time - 2m',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          const LinearProgressIndicator(
            value: .5,
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            'Shortage Time - 207h',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          const LinearProgressIndicator(
            value: .8,
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            'Over Time - 6m',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          const LinearProgressIndicator(
            value: .3,
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
