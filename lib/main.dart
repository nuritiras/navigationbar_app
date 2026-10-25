import 'package:flutter/material.dart';
void main() {
  runApp(const DegerlerEgitimiApp());
}
class DegerlerEgitimiApp extends StatelessWidget {
  const DegerlerEgitimiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Değerler Eğitimi',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8F7),
      ),
      home: const DegerlerAnaEkran(),
    );
  }
}
class DegerlerAnaEkran extends StatefulWidget {
  const DegerlerAnaEkran({super.key});
  @override
  State<DegerlerAnaEkran> createState() =>
      _DegerlerAnaEkranState();
}
class _DegerlerAnaEkranState
    extends State<DegerlerAnaEkran> {
  // Seçili gezinme öğesinin indeksi
  int selectedIndex = 0;
  // Bölümlere ait başlıklar
  final List<String> sayfaBasliklari = [
    'Ana Sayfa',
    'Değerlerimiz',
    'Etkinlikler',
  ];
  // Ana içerikleri seçili indekse göre belirler.
  Widget sayfaIcerigi() {
    switch (selectedIndex) {
      case 0:
        return const AnaSayfaIcerigi();
      case 1:
        return const DegerlerIcerigi();
      case 2:
        return const EtkinliklerIcerigi();
      default:
        return const AnaSayfaIcerigi();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sayfaBasliklari[selectedIndex]),
        centerTitle: true,
        backgroundColor: Theme.of(context)
            .colorScheme
            .surface,
      ),
      // Seçili bölüme ait içerik
      body: sayfaIcerigi(),
      // Alt gezinme çubuğu
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        labelBehavior:
            NavigationDestinationLabelBehavior
                .alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Değerler',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist),
            label: 'Etkinlikler',
          ),
        ],
      ),
    );
  }
}
// --------------------------------------------------
// 1. ANA SAYFA
// --------------------------------------------------
class AnaSayfaIcerigi extends StatelessWidget {
  const AnaSayfaIcerigi({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: Theme.of(context)
              .colorScheme
              .primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 42,
                ),
                const SizedBox(height: 12),
                Text(
                  'Değerlerle Güzel Bir Gelecek',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ekim ayı değerler eğitimi: '
                  'Saygı, Temizlik ve Mahremiyet.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const BilgiKarti(
          baslik: 'Günün Mesajı',
          aciklama:
              'Güzel davranışlar, güçlü bir karakterin '
              've huzurlu bir toplumun temelidir.',
          ikon: Icons.lightbulb_outline,
        ),
        const BilgiKarti(
          baslik: 'Saygı',
          aciklama:
              'İnsanları dikkatle dinleyelim ve '
              'farklı düşüncelere anlayış gösterelim.',
          ikon: Icons.handshake_outlined,
        ),
        const BilgiKarti(
          baslik: 'Temizlik',
          aciklama:
              'Kişisel temizliğimize ve ortak '
              'alanlarımızın düzenine özen gösterelim.',
          ikon: Icons.cleaning_services_outlined,
        ),
        const BilgiKarti(
          baslik: 'Mahremiyet',
          aciklama:
              'Başkalarının özel bilgilerini, '
              'fotoğraflarını ve mesajlarını izin '
              'almadan paylaşmayalım.',
          ikon: Icons.privacy_tip_outlined,
        ),
      ],
    );
  }
}
// --------------------------------------------------
// 2. DEĞERLER SAYFASI
// --------------------------------------------------
class DegerlerIcerigi extends StatelessWidget {
  const DegerlerIcerigi({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        DegerKarti(
          baslik: 'Saygı',
          ikon: Icons.people_outline,
          aciklama:
              'Saygı; insanların haklarına, düşüncelerine '
              've kişisel sınırlarına değer vermektir.',
          ornek:
              'Bir arkadaşımız konuşurken sözünü '
              'kesmeden dinlemek.',
          gorev:
              'Bugün en az bir kişiyi dikkatle dinle '
              've düşüncesini anlamaya çalış.',
        ),
        DegerKarti(
          baslik: 'Temizlik',
          ikon: Icons.cleaning_services_outlined,
          aciklama:
              'Temizlik; bedenimizi, kıyafetlerimizi '
              've yaşadığımız çevreyi temiz tutmaktır.',
          ornek:
              'Kullandığımız masayı düzenli bırakmak '
              've çöpleri uygun kutuya atmak.',
          gorev:
              'Bugün sınıfımızın temiz kalmasına '
              'katkıda bulun.',
        ),
        DegerKarti(
          baslik: 'Mahremiyet',
          ikon: Icons.shield_outlined,
          aciklama:
              'Mahremiyet; kişinin özel hayatına, '
              'bilgilerine ve kişisel sınırlarına '
              'saygı gösterilmesidir.',
          ornek:
              'Bir arkadaşımızın fotoğrafını veya '
              'mesajını izni olmadan paylaşmamak.',
          gorev:
              'Dijital hesaplarında hangi bilgilerin '
              'herkese açık olduğunu gözden geçir.',
        ),
      ],
    );
  }
}
// --------------------------------------------------
// 3. ETKİNLİKLER SAYFASI
// --------------------------------------------------
class EtkinliklerIcerigi extends StatefulWidget {
  const EtkinliklerIcerigi({super.key});
  @override
  State<EtkinliklerIcerigi> createState() =>
      _EtkinliklerIcerigiState();
}
class _EtkinliklerIcerigiState
    extends State<EtkinliklerIcerigi> {
  final List<String> gorevler = [
    'Arkadaşlarımı sözlerini kesmeden dinledim.',
    'Sınıfın temiz kalmasına katkıda bulundum.',
    'Başkalarının özel bilgilerini korudum.',
  ];
  final List<bool> tamamlandi = [
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    final int tamamlananGorev =
        tamamlandi.where((gorev) => gorev).length;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Günlük Değerler Görevim',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tamamlanan görev: '
                  '$tamamlananGorev/${gorevler.length}',
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: tamamlananGorev /
                      gorevler.length,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(gorevler.length, (index) {
          return Card(
            child: CheckboxListTile(
              value: tamamlandi[index],
              onChanged: (bool? yeniDeger) {
                setState(() {
                  tamamlandi[index] =
                      yeniDeger ?? false;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading,
              title: Text(gorevler[index]),
            ),
          );
        }),
        const SizedBox(height: 12),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Unutma: Güzel davranışlar yalnızca '
              'bir gün değil, her gün uygulanmalıdır.',
            ),
          ),
        ),
      ],
    );
  }
}
// --------------------------------------------------
// ORTAK BİLGİ KARTI
// --------------------------------------------------
class BilgiKarti extends StatelessWidget {
  final String baslik;
  final String aciklama;
  final IconData ikon;
  const BilgiKarti({
    super.key,
    required this.baslik,
    required this.aciklama,
    required this.ikon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          ikon,
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          baslik,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(aciklama),
        ),
      ),
    );
  }
}
// --------------------------------------------------
// DEĞERLER SAYFASINDA KULLANILAN KART
// --------------------------------------------------
class DegerKarti extends StatelessWidget {
  final String baslik;
  final IconData ikon;
  final String aciklama;
  final String ornek;
  final String gorev;
  const DegerKarti({
    super.key,
    required this.baslik,
    required this.ikon,
    required this.aciklama,
    required this.ornek,
    required this.gorev,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  ikon,
                  size: 32,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    baslik,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(aciklama),
            const Divider(height: 24),
            const Text(
              'Günlük Hayattan Örnek',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(ornek),
            const SizedBox(height: 16),
            const Text(
              'Bugünün Görevi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(gorev),
          ],
        ),
      ),
    );
  }
}
