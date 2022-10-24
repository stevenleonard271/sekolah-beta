import 'package:flutter/material.dart';
import 'package:gerak_cuy/models/event_model.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:gerak_cuy/widgets/sport_detail_card.dart';

class SportCard extends StatelessWidget {
  const SportCard({
    super.key,
    this.button = true,
    required this.width,
    required this.eventModel,
  });

  final double width;
  final bool button;

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue.shade200),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: [
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(eventModel.foto!)))),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventModel.judul!,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text(eventModel.lokasi!,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.sports,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              eventModel.jenis!,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 5),
                            Text(
                                '${eventModel.userJoin!.length}'
                                '/${eventModel.kuota} orang',
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 5),
                            Text(eventModel.tanggal!,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 5),
                            Text(eventModel.waktu!,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SportDetailPage(
                    userJoin: eventModel.userJoin!.length,
                    lokasi: eventModel.lokasi!,
                    button: button,
                    eventId: eventModel.eventId!,
                    catatan: eventModel.catatan!,
                    userId: eventModel.userId!,
                    gambar: eventModel.foto!,
                    judul: eventModel.judul!,
                    jenis: eventModel.jenis!,
                    kuota: eventModel.kuota,
                    tanggal: eventModel.tanggal!,
                    waktu: eventModel.waktu!)));
      },
    );
  }
}
