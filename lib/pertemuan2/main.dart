import 'package:flutter/material.dart';

class Makanan {
  final String nama;
  final int harga;
  final String deskripsi;

  const Makanan(this.nama, this.harga, this.deskripsi);
}

// Fungsi untuk format harga menjadi format ribuan
String formatHarga(int harga) {
  return harga
      .toString()
      .replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]}.',
      );
}

const daftarMenu = [
  Makanan(
    'Nasi Goreng',
    15000,
    'Nasi goreng dengan bumbu khas dan telur.',
  ),
  Makanan(
    'Mie Ayam',
    12000,
    'Mie dengan topping ayam dan kuah gurih.',
  ),
  Makanan(
    'Es Teh',
    4000,
    'Minuman teh manis yang menyegarkan.',
  ),
  Makanan(
    'Ayam Bakar',
    20000,
    'Ayam bakar dengan bumbu kecap yang lezat.',
  ),
  Makanan(
    'Sate',
    18000,
    'Sate ayam dengan bumbu kacang.',
  ),
  Makanan(
    'Bakso',
    15000,
    'Bakso sapi dengan kuah gurih dan mie.',
  ),
  Makanan(
    'Soto Ayam',
    13000,
    'Soto ayam dengan kuah gurih dan segar.',
  ),
  Makanan(
    'Ayam Geprek',
    17000,
    'Ayam crispy dengan sambal pedas.',
  ),
  Makanan(
    'Rendang',
    25000,
    'Daging sapi dengan bumbu rendang khas Indonesia.',
  ),
  Makanan(
    'Gado-Gado',
    12000,
    'Sayuran segar dengan saus kacang.',
  ),
  Makanan(
    'Nasi Padang',
    22000,
    'Nasi dengan pilihan lauk khas Padang.',
  ),
  Makanan(
    'Seblak',
    14000,
    'Seblak pedas dengan kerupuk dan berbagai topping.',
  ),
  Makanan(
    'Martabak',
    20000,
    'Martabak manis dengan berbagai pilihan topping.',
  ),
  Makanan(
    'Pempek',
    18000,
    'Pempek khas Palembang dengan kuah cuko.',
  ),
  Makanan(
    'Kwetiau',
    16000,
    'Kwetiau goreng dengan sayuran dan telur.',
  ),
  Makanan(
    'Capcay',
    15000,
    'Aneka sayuran dengan kuah gurih.',
  ),
  Makanan(
    'Pisang Goreng',
    10000,
    'Pisang goreng renyah dan manis.',
  ),
  Makanan(
    'Es Jeruk',
    5000,
    'Minuman jeruk segar dan menyegarkan.',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 2',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int halamanSekarang = 0;

  // Maksimal 8 menu per halaman
  final int menuPerHalaman = 8;

  @override
  Widget build(BuildContext context) {
    final int mulai = halamanSekarang * menuPerHalaman;

    final int selesai = (mulai + menuPerHalaman < daftarMenu.length)
        ? mulai + menuPerHalaman
        : daftarMenu.length;

    final menuSaatIni = daftarMenu.sublist(mulai, selesai);

    final int jumlahHalaman =
        (daftarMenu.length / menuPerHalaman).ceil();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Menu'),
      ),

      body: Column(
        children: [
          // Daftar menu
          Expanded(
            child: ListView.builder(
              itemCount: menuSaatIni.length,
              itemBuilder: (context, index) {
                final item = menuSaatIni[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant,
                      color: Colors.blue,
                    ),
                    title: Text(
                      item.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Rp ${formatHarga(item.harga)}',
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(makanan: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Pagination
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: halamanSekarang > 0
                      ? () {
                          setState(() {
                            halamanSekarang--;
                          });
                        }
                      : null,
                  child: const Text('← Sebelumnya'),
                ),

                const SizedBox(width: 20),

                Text(
                  '${halamanSekarang + 1} / $jumlahHalaman',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed:
                      halamanSekarang < jumlahHalaman - 1
                          ? () {
                              setState(() {
                                halamanSekarang++;
                              });
                            }
                          : null,
                  child: const Text('Berikutnya →'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Makanan makanan;

  const DetailPage({
    super.key,
    required this.makanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(makanan.nama),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.restaurant_menu,
                size: 80,
              ),

              const SizedBox(height: 16),

              Text(
                makanan.nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Rp ${formatHarga(makanan.harga)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                makanan.deskripsi,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}