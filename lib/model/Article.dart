class Article {
  int id;
  String judul, kategori, isi;

  Article({this.id, this.judul, this.kategori, this.isi});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      judul: json['judul'],
      kategori: json['kategori'],
      isi: json['isi'],
    );
  }
}
