import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengelolaan Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nilai1Controller = TextEditingController();
  final TextEditingController _nilai2Controller = TextEditingController();
  final TextEditingController _nilai3Controller = TextEditingController();

  String? _result;

  void _hitungRataRata() {
    String nama = _namaController.text;
    double nilai1 = double.tryParse(_nilai1Controller.text) ?? 0.0;
    double nilai2 = double.tryParse(_nilai2Controller.text) ?? 0.0;
    double nilai3 = double.tryParse(_nilai3Controller.text) ?? 0.0;

    Mahasiswa mahasiswa = Mahasiswa(nama, nilai1, nilai2, nilai3);

    setState(() {
      _result = mahasiswa.tampilkanHasil();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengelolaan Data Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Mahasiswa'),
            ),
            TextField(
              controller: _nilai1Controller,
              decoration: const InputDecoration(labelText: 'Nilai Mata Kuliah 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nilai2Controller,
              decoration: const InputDecoration(labelText: 'Nilai Mata Kuliah 2'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nilai3Controller,
              decoration: const InputDecoration(labelText: 'Nilai Mata Kuliah 3'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungRataRata,
              child: const Text('Hitung Rata-rata'),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                _result!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

class Mahasiswa {
  String nama;
  double nilaiMatkul1;
  double nilaiMatkul2;
  double nilaiMatkul3;

  Mahasiswa(this.nama, this.nilaiMatkul1, this.nilaiMatkul2, this.nilaiMatkul3);

  double hitungRataRata() {
    return (nilaiMatkul1 + nilaiMatkul2 + nilaiMatkul3) / 3;
  }

  String tampilkanHasil() {
    double rataRata = hitungRataRata();
    String status = rataRata >= 60 ? 'Lulus' : 'Tidak Lulus';
    return 'Nama Mahasiswa: $nama\nRata-rata Nilai: ${rataRata.toStringAsFixed(2)}\nStatus: $status';
  }
}
