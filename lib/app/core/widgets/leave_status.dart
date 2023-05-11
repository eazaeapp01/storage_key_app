import 'package:flutter/material.dart';

import '../components/grey_container.dart';

class LeaveStatus extends StatelessWidget {
  final title;
  final subtitle;
  final paid;
  final unpaid;

  const LeaveStatus({
    Key? key,
    this.title,
    this.subtitle,
    this.paid,
    this.unpaid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GreyContainer(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 5),
                  Text('Paid - $paid')
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    color: Colors.green,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 5),
                  Text('Unpaid - $unpaid')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
