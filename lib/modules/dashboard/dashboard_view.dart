import 'package:flutter/material.dart';

import '../../app/constants/colors.dart';
import '../../app/core/components/custom_button.dart';
import '../../app/core/components/grey_container.dart';
import '../../app/core/widgets/announcement_widget.dart';
import '../../app/core/widgets/leave_status.dart';
import '../../app/core/widgets/punch_status.dart';
import '../../app/core/widgets/time_log.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  Future<void> getAnnouncement() async {
    // final announcement = await announcementRepository.getAnnouncement();
    // setState(() {
    //   _announcement = announcement;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/mini_logo.png'),
        ),
      ),
      endDrawer: SafeArea(
        child: Container(
          color: Colors.white,
          width: 300,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black54, width: 5)),
              ),
              const SizedBox(height: 10),
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(child: const Text('Punch In'), onPressed: () {}),
              const SizedBox(height: 10),
              GreyContainer(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Hi, Mohammad'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Good morning!'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 3),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                            ),
                          ),
                          child: const Text(
                            'Late',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LayoutBuilder(builder: (ctx, cts) {
                      debugPrint('width: ${cts.maxWidth}');
                      return Row(
                        children: [
                          PunchStatus(
                            asset: 'assets/icons/punch_in.svg',
                            title: 'Not yet',
                            subtitle: 'Punch in time',
                            width: cts.maxWidth / 2,
                          ),
                          PunchStatus(
                            asset: 'assets/icons/punch_out.svg',
                            title: 'Not yet',
                            subtitle: 'Punch out time',
                            width: cts.maxWidth / 2,
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const LeaveStatus(
                title: '0',
                subtitle: 'Total leave allowance',
                paid: '0',
                unpaid: '0',
              ),
              const SizedBox(height: 10),
              const LeaveStatus(
                title: '0',
                subtitle: 'Total leave taken',
                paid: '0',
                unpaid: '0',
              ),
              const SizedBox(height: 10),
              const LeaveStatus(
                title: '0',
                subtitle: 'Total leave available',
                paid: '0',
                unpaid: '0',
              ),
              const SizedBox(height: 10),
              const LeaveStatus(
                title: '0',
                subtitle: 'Leave request pending',
                paid: '0',
                unpaid: '0',
              ),
              const SizedBox(height: 10),
              const TimeLogWidget(),
              const SizedBox(height: 10),
              const AnnouncementWidget(),
              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}
