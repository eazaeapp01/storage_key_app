import 'package:flutter/material.dart';

class AnnouncementRow extends StatelessWidget {
  final String? name, startDate, endDate, description;
  final FontWeight? fontWeight;

  const AnnouncementRow({
    Key? key,
    this.name,
    this.startDate,
    this.endDate,
    this.description, this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                name ?? '',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            Expanded(
              child: Text(
                startDate ?? '',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            Expanded(
              child: Text(
                endDate ?? '',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            Expanded(
              child: Text(
                description ?? '',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8 )
      ],
    );
  }
}
