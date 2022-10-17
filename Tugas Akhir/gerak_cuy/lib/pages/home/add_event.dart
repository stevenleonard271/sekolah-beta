import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:gerak_cuy/widgets/custom_button.dart';
import 'package:gerak_cuy/widgets/custom_text_form_field.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController judulController = TextEditingController(text: '');
    TextEditingController kuotaController = TextEditingController(text: '');
    TextEditingController lokasiController = TextEditingController(text: '');
    TextEditingController jenisController = TextEditingController(text: '');
    TextEditingController tanggalController = TextEditingController(text: '');
    TextEditingController waktuController = TextEditingController(text: '');
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Buat Kegiatan Olahraga',
          style: blackTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
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
            CustomTextFormField(
                hintText: 'Jenis Olahraga',
                title: 'Jenis',
                prefix: const Icon(Icons.sports),
                margin: const EdgeInsets.only(bottom: 20),
                controller: jenisController),
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
                prefix: const Icon(Icons.date_range),
                margin: const EdgeInsets.only(bottom: 20),
                controller: tanggalController),
            CustomTextFormField(
                hintText: 'Waktu Olahraga',
                title: 'Waktu',
                prefix: const Icon(Icons.timer),
                margin: const EdgeInsets.only(bottom: 20),
                controller: waktuController),
            CustomButton(
                title: 'Selanjutnya',
                onPressed: () {
                  Navigator.pushNamed(context, '/add_next_event');
                })
          ],
        ),
      ),
    );
  }
}
