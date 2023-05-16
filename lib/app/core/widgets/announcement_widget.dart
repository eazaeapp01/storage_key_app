import 'package:flutter/material.dart';

import '../../../data/model/announcement_model.dart';
import '../../constants/colors.dart';
import '../components/announcement_row.dart';
import '../components/grey_container.dart';

class AnnouncementWidget extends StatelessWidget {
  final AnnouncementModel? announcementModel;

  const AnnouncementWidget({super.key, this.announcementModel});

  @override
  Widget build(BuildContext context) {
    debugPrint('announcement value: ${announcementModel?.announcements}');
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
          const AnnouncementRow(
            name: "Name",
            startDate: 'Start Date',
            endDate: 'End Date',
            description: 'Description',
            fontWeight: FontWeight.bold,
          ),
          const Divider(),
          ...List.generate(
            announcementModel?.announcements?.length ?? 0,
            (index) => AnnouncementRow(
              name: announcementModel?.announcements?[index].name,
              startDate: announcementModel?.announcements?[index].startDate,
              endDate: announcementModel?.announcements?[index].endDate,
              description: announcementModel?.announcements?[index].description,
            ),
          )
        ],
      ),
    );
  }
}
