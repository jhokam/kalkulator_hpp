import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kalkulator_hpp/result.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final biayaBahanBaku = TextEditingController();
  final biayaOperasionalPabrik = TextEditingController();
  final biayaTenagaKerja = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kalkulator HPP',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600)),
              ),
              Container(
                color: const Color(0xffD7DEDD),
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              Text(
                'Masukan Biaya Bahan Baku',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10.0,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 23.0),
                child: TextField(
                  controller: biayaBahanBaku,
                  decoration: const InputDecoration(
                      hintText: 'Biaya Bahan Baku',
                      fillColor: Color(0xffEDF5F4),
                      filled: true),
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500)),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                'Masukan Operasional Pabrik',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10.0,
                )),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 23.0),
                  child: TextField(
                    controller: biayaOperasionalPabrik,
                    decoration: const InputDecoration(
                        hintText: 'Biaya Operasional Pabrik',
                        fillColor: Color(0xffEDF5F4),
                        filled: true),
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500)),
                    keyboardType: TextInputType.number,
                  )),
              Text(
                'Masukkan Biaya Tenaga Kerja',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10.0,
                )),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextField(
                    controller: biayaTenagaKerja,
                    decoration: const InputDecoration(
                        hintText: 'Biaya Tenaga Kerja',
                        fillColor: Color(0xffEDF5F4),
                        filled: true),
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500)),
                    keyboardType: TextInputType.number,
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff00ACA1))),
                  onPressed: () {
                    if (biayaBahanBaku.text.isEmpty ||
                        biayaOperasionalPabrik.text.isEmpty ||
                        biayaTenagaKerja.text.isEmpty) {
                      EasyLoading.showError(
                          'Tolong isi semua\nform yang masih kosong',
                          duration: Duration(seconds: 2));
                    } else if (int.tryParse(biayaBahanBaku.text) == null ||
                        int.tryParse(biayaOperasionalPabrik.text) == null ||
                        int.tryParse(biayaTenagaKerja.text) == null) {
                      EasyLoading.showError('Hanya Bisa Memasukkan Angka',
                          duration: Duration(seconds: 2));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    biayaBahanBaku: biayaBahanBaku.text,
                                    biayaOperasionalPabrik:
                                        biayaOperasionalPabrik.text,
                                    biayaTenagaKerja: biayaTenagaKerja.text,
                                  )));
                      EasyLoading.showSuccess('Berhasil menghitung HPP',
                          duration: const Duration(seconds: 2));
                    }
                    ;
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Konfirmasi',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
