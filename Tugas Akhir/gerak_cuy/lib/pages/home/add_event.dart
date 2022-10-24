import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerak_cuy/models/event_model.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:gerak_cuy/widgets/custom_button.dart';
import 'package:gerak_cuy/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  User? loggedUser = FirebaseAuth.instance.currentUser;
  TextEditingController biayaController = TextEditingController(text: '');

  TextEditingController catatanController = TextEditingController(text: '');

  TextEditingController fotoController = TextEditingController(text: '');

  TextEditingController judulController = TextEditingController(text: '');

  TextEditingController kuotaController = TextEditingController(text: '');

  TextEditingController lokasiController = TextEditingController(text: '');

  TextEditingController tanggalController = TextEditingController(text: '');

  TextEditingController waktuController = TextEditingController(text: '');

  List<String> items = [
    'Basket',
    'Sepak Bola',
    'Jogging',
    'Renang',
    'Sepeda',
    'Bulu Tangkis',
    'Voli'
  ];

  String? valueChoose = 'Basket';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Buat Kegiatan Olahraga',
          style: blackTextStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_next_event');
            },
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Next',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomTextFormField(
                hintText: 'Judul Olahraga',
                title: 'Judul',
                prefix: const Icon(Icons.event),
                margin: const EdgeInsets.only(bottom: 20),
                controller: judulController),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis Olahraga',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white)),
                        child: DropdownButton(
                            focusColor: Colors.white,
                            iconSize: 20,
                            underline: SizedBox(),
                            hint: Text('Pilih olahraga'),
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: valueChoose,
                            style: blackTextStyle.copyWith(fontSize: 13),
                            items: items
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                valueChoose = value;
                              });
                            }),
                      )
                    ])),
            CustomTextFormField(
                hintText: 'Kuota Olahraga',
                title: 'Kuota(orang)',
                allowInput: [FilteringTextInputFormatter.digitsOnly],
                textInputType: TextInputType.number,
                prefix: const Icon(Icons.people),
                margin: const EdgeInsets.only(bottom: 20),
                controller: kuotaController),
            CustomTextFormField(
                hintText: 'Lokasi Olahraga',
                title: 'Lokasi',
                prefix: const Icon(Icons.location_on),
                margin: const EdgeInsets.only(bottom: 20),
                controller: lokasiController),
            CustomTextFormField(
                hintText: 'Tanggal Olahraga',
                title: 'Tanggal',
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2030))
                      .then((value) {
                    return tanggalController.text =
                        DateFormat('dd-MM-yyyy').format(value!).toString();
                  });
                },
                prefix: const Icon(Icons.calendar_month),
                margin: const EdgeInsets.only(bottom: 20),
                controller: tanggalController),
            CustomTextFormField(
                hintText: 'Waktu Olahraga',
                readOnly: true,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 00, minute: 00),
                  ).then((value) {
                    return waktuController.text =
                        value!.format(context).toString();
                  });
                },
                title: 'Waktu',
                prefix: const Icon(Icons.timer),
                margin: const EdgeInsets.only(bottom: 20),
                controller: waktuController),
            CustomTextFormField(
                hintText: 'Catatan',
                title: 'Catatan (opsional)',
                margin: const EdgeInsets.only(bottom: 20),
                controller: catatanController),
            CustomButton(
                title: 'Selesai',
                onPressed: () {
                  postEvent();
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  postEvent() async {
    EventModel eventModel = EventModel();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String? setFoto() {
      String? linkFoto;
      if (valueChoose == "Basket") {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/basket.jpeg?alt=media&token=4efbf64f-e353-4bb1-8ed4-c268d44055c6";
      } else if (valueChoose == "Sepak Bola") {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/sepakbola.jpg?alt=media&token=ddf84c9b-c1ef-441e-b031-e5edfce2b370";
      } else if (valueChoose == "Jogging") {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/jogging.jpg?alt=media&token=d9d5bfac-67ab-49dc-8907-91fdba56cc26";
      } else if (valueChoose == "Renang") {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/renang.jpg?alt=media&token=2c815aca-3c85-4ef0-8962-16c9f310adbc";
      } else if (valueChoose == "Sepeda") {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/sepeda.jpg?alt=media&token=b0209a98-c14f-47af-a782-415c3f6f979a";
      } else if (valueChoose == "Bulu Tangkis") {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/badminton.jpg?alt=media&token=3e1aef7e-3798-46c7-bf1b-1d93f7b5833d";
      } else {
        linkFoto =
            "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/voli.jpg?alt=media&token=71961581-df19-4a51-8bef-cd8e4714a93b";
      }
      return linkFoto;
    }

    var newDocRef = firestore.collection('events').doc();
    eventModel.userId = loggedUser!.uid;
    eventModel.judul = judulController.text;
    eventModel.jenis = valueChoose;
    eventModel.foto = setFoto();
    eventModel.kuota = int.parse(kuotaController.text);
    eventModel.catatan = catatanController.text;
    eventModel.lokasi = lokasiController.text;
    eventModel.tanggal = tanggalController.text;
    eventModel.waktu = waktuController.text;
    eventModel.eventId = newDocRef.id;
    // eventModel.userJoin = [];

    await newDocRef.set(eventModel.toMap());
  }
}
