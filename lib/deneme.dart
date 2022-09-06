class Dename {
  Dename() {
    comandList['topla'] = topla;
    comandList['cikar'] = cikar;
  }

  void calistir() {
    var deger = comandList['topla']!(1);
    print(deger);
    deger = comandList['cikar']!(deger);
    print(deger);
  }

  int Function(int data) topla = (int data) {
    return data + 1;
  };

  int Function(int data) cikar = (int data) {
    return data - 1;
  };

  Map<String, Function> comandList = {};
}
