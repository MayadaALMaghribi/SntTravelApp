import 'package:flutter/material.dart';
import 'package:sntegpito/core/utils/styles.dart';
import '../../../../../core/utils/open_app_orstore.dart';
import '../../../../room/presentation/view/widgets/reserve_room_button.dart';

class LinksCar extends StatelessWidget {
  const LinksCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "You can try the link to choose best car for you",
            style: Styles.textStyle17,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ReserveRoomButton(
            text: "Uber",
            ontap: () => openOrInstallApp(
                  packageName: "com.ubercab",
                  playStoreUrl:
                      "https://play.google.com/store/apps/details?id=com.ubercab",
                )),
        //openAppOrStore(packageName: "com.ubercab")),
        ReserveRoomButton(
            text: "InDrive",
            ontap: () => openOrInstallApp(
                  packageName: "sinet.startup.inDriver",
                  playStoreUrl:
                      "https://play.google.com/store/apps/details?id=sinet.startup.inDriver",
                )),

        ReserveRoomButton(
            text: "Careem",
            ontap: () => openOrInstallApp(
                  packageName: "com.careem.acma",
                  playStoreUrl:
                      "https://play.google.com/store/apps/details?id=com.careem.acma",
                ))
      ],
    );
  }
}
