import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimenu/models/urun_detay_sayfasi.dart';
import 'package:minimenu/models/urunler_model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  UrunlerModel? _veriler;
  List<Urun> _urunler = [];

  void _loadData() async {
    final dataString = await rootBundle.loadString('assets/files/data.json');
    final datajson = jsonDecode(dataString);

    _veriler = UrunlerModel.fromJson(datajson);
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  void _filterData(int id) {
    _urunler = _veriler!.urunler
        .where((verilerEleman) => verilerEleman.kategori == id)
        .toList();
    setState(() {});
  }

  void _resetFilter() {
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      appBar: AppBar(
        toolbarHeight: deviceHeight / 35,
        backgroundColor: const Color.fromARGB(255, 116, 115, 115),
        title: Text("Menü"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/menu1.png",
                  height: deviceHeight / 3,
                  width: deviceWidth,
                  fit: BoxFit.cover,
                ),
                _yemeklerButton(deviceHeight, deviceWidth),
                _iceceklerButton(deviceHeight, deviceWidth),
                _meyvelerButton(deviceHeight, deviceWidth),
              ],
            ),
            ElevatedButton(onPressed: _resetFilter, child: Text("Tüm Ürünler")),
            _veriler == null
                ? const Text("Yükleniyor")
                : Expanded(
                    child: _urunlerBolumu(),
                  ),
          ],
        ),
      ),
    );
  }

  Positioned _meyvelerButton(double deviceHeight, double deviceWidth) {
    return Positioned(
      top: deviceHeight / 6,
      left: deviceWidth / 2,
      child: GestureDetector(
        onTap: () {
          print("Meyveler");
          _filterData(1);
        },
        child: Container(
          color: Colors.transparent,
          height: deviceHeight / 6,
          width: deviceWidth / 2,
        ),
      ),
    );
  }

  Positioned _iceceklerButton(double deviceHeight, double deviceWidth) {
    return Positioned(
      top: deviceHeight / 6,
      child: GestureDetector(
        onTap: () {
          print("İçecekler");
          _filterData(3);
        },
        child: Container(
          color: Colors.transparent,
          height: deviceHeight / 6,
          width: deviceWidth / 2,
        ),
      ),
    );
  }

  GestureDetector _yemeklerButton(double deviceHeight, double deviceWidth) {
    return GestureDetector(
      onTap: () {
        print("Yemekler");
        _filterData(2);
      },
      child: Container(
        color: Colors.transparent,
        height: deviceHeight / 6,
        width: deviceWidth,
      ),
    );
  }

  ListView _urunlerBolumu() {
    return ListView.separated(
      itemCount: _urunler.length,
      itemBuilder: (context, index) {
        final Urun urun = _urunler[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => UrunDetaySayfasi(urun: urun))));
          },
          leading: Image.network(
            urun.resim,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(urun.isim),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                urun.fiyat,
              ),
              Text(urun.onAciklama)
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.green,
        height: 10,
      ),
    );
  }
}
