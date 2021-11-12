class Books {
  String name;
  String image;
  String status;
  String update;
  String author;
  String artist;

  Books(this.name, this.image, this.status, this.update, this.author, this.artist);
  @override
  String toString() {
    var out = name;
    return out;
  }
}