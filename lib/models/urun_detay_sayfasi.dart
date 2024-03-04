import 'package:flutter/material.dart';
import 'package:minimenu/models/urunler_model.dart';

class UrunDetaySayfasi extends StatefulWidget {
  final Urun urun;

  const UrunDetaySayfasi({Key? key, required this.urun}) : super(key: key);

  @override
  State<UrunDetaySayfasi> createState() => _UrunDetaySayfasiState();
}

class _UrunDetaySayfasiState extends State<UrunDetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    double DeviceHeight = MediaQuery.of(context).size.height;
    double DeviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.urun.isim),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              widget.urun.resim,
              width: DeviceWidth,
              height: DeviceHeight / 3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            SizedBox(
              height: DeviceHeight / 10,
              width: DeviceWidth,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "  Ürün Adı: ${widget.urun.isim}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Fiyat: ${widget.urun.fiyat}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.urun.aciklama}",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text("Sepete Ekle")),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Sipariş Ver")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
