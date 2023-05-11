import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../components/grey_container.dart';

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({Key? key}) : super(key: key);

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  @override
  Widget build(BuildContext context) {
    return GreyContainer(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Announcement',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          const Divider(),
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Start Date',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'End Date',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
