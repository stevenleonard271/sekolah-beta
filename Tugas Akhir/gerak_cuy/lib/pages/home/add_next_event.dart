import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AddNextEvent extends StatelessWidget {
  const AddNextEvent({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController biayaController = TextEditingController(text: '');
    TextEditingController catatanController = TextEditingController(text: '');
    TextEditingController fotoController = TextEditingController(text: '');

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
            onPressed: () {},
            icon: const Icon(Icons.check),
            tooltip: 'Buat Kegiatan',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomTextFormField(
                hintText: 'Biaya Iuran',
                title: 'Biaya (opsional)',
                allowInput: [FilteringTextInputFormatter.digitsOnly],
                prefix: const Icon(Icons.money_rounded),
                margin: const EdgeInsets.only(bottom: 20),
                controller: biayaController),
            CustomTextFormField(
                hintText: 'Catatan',
                title: 'Catatan (opsional)',
                margin: const EdgeInsets.only(bottom: 20),
                controller: catatanController),
            CustomTextFormField(
                hintText: 'Foto Olahraga',
                title: 'Foto (opsional)',
                prefix: const Icon(Icons.photo),
                margin: const EdgeInsets.only(bottom: 20),
                controller: fotoController),
            CustomButton(title: 'Selesai', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
