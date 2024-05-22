import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatefulWidget {
  final String biayaBahanBaku;
  final String biayaOperasionalPabrik;
  final String biayaTenagaKerja;

  const ResultPage(
      {super.key,
      required this.biayaBahanBaku,
      required this.biayaOperasionalPabrik,
      required this.biayaTenagaKerja});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    double biayaBahanBaku = double.parse(widget.biayaBahanBaku);
    double biayaOperasionalPabrik = double.parse(widget.biayaOperasionalPabrik);
    double biayaTenagaKerja = double.parse(widget.biayaTenagaKerja);

    double hpp = biayaBahanBaku + biayaOperasionalPabrik + biayaTenagaKerja;
    double hppPerOlahan = hpp / 4;
    double hppPerButir = hpp / 4 / 500;
    double a = (hppPerButir + (hppPerButir * 0.1)) * 50;
    double b = hppPerOlahan * 0.05;

    return Center(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Hasil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Center(
                child: const Text(
                  "Anda Memasukkan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text("Biaya Bahan Baku : $biayaBahanBaku"),
              Text("Biaya Operasional Pabrik : $biayaOperasionalPabrik"),
              Text("Biaya Tenaga Kerja : $biayaTenagaKerja"),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Soal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                  'A. HPP = Biaya Bahan Baku + Biaya Operasional + Biaya Tenaga Kerja $hpp'),
              Text('B. HPP per butir = $hppPerButir'),
              Text('C. 1x olahan mengambil untung 10% = ${hppPerOlahan * 0.1}'),
              Text('D. keuntungan Perbutir Bakso = ${hppPerButir * 0.1}'),
              Text('E. Berapa Untung 4x olahan = ${hpp * 0.1}'),
              Text(
                  'F. Berapa Harga Jual 1x Olahan = ${hppPerOlahan + (hppPerOlahan * 0.1)}'),
              Text(
                  'G. Berapa Harga jual Per Butirnya = ${hppPerButir + (hppPerButir * 0.1)}'),
              Text(
                  'H. Modal Kembali = ${hppPerOlahan / (hppPerButir + (hppPerButir * 0.1))}'),
              Text(
                  'I. isi 50 butir dan mengambil untung 5% per olahan, pendapatan = ${a + b}'),
              Text(
                  'J.Pendapatan bila 4x olahan terjual semua = ${(hppPerOlahan + (hppPerOlahan * 0.1)) * 4}'),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali')),
              )
            ]),
      ),
    );
  }
}
