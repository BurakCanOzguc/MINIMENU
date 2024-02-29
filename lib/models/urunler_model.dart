// Burada ise liste halinde çağırıyoruz.
class UrunlerModel {
  final List<Urun> urunler;
  final List<Kategori> kategoriler;

  UrunlerModel(this.urunler, this.kategoriler);

  //Listeyi Json'a çevir.
  factory UrunlerModel.fromJson(Map<String, dynamic> json) {
    final List jsonUrunler = json['urunler'];
    final List jsonKategoriler = json['kategoriler'];

    // Json Listesini modele dönüştür
    return UrunlerModel(jsonUrunler.map((e) => Urun.fromJson(e)).toList(),
        jsonKategoriler.map((e) => Kategori.fromJson(e)).toList());
  }
}

// Burası tek bir tanesi için tanımlama
class Urun {
  final int id;
  final int kategori;
  final String isim;
  final String fiyat;
  final String resim;
  Urun(this.id, this.kategori, this.isim, this.fiyat, this.resim);

//Urun class'ımızı jsonla eşitlemek için yapılan işlem
  Urun.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        kategori = json['kategori'],
        isim = json['isim'],
        fiyat = json['fiyat'],
        resim = json['resim'];
//Urun class'ımızı jsonla eşitlemek için yapılan işlem
}

class Kategori {
  final int id;
  final String isim;

  Kategori(this.id, this.isim);

  Kategori.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        isim = json['isim'];
}
