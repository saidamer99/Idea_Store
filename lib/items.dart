class Items {
  String image;
  String numberOfPices;
  String kindOfPhone;
  String quality;
  String categoryOfMobile;
  Items(
      {this.image,
      this.numberOfPices,
      this.kindOfPhone,
      this.quality,
      this.categoryOfMobile});
  String getImage() {
    return this.image;
  }

  String getnumberOfPices() {
    return this.numberOfPices;
  }

  String getkindOfPhone() {
    return this.kindOfPhone;
  }

  String getquality() {
    return this.quality;
  }

  String getcategoryOfMobile() {
    return this.categoryOfMobile;
  }
}
