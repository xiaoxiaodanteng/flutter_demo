class Article {
  int artId;
  String title;
  int autId;
  String autName;
  int commCount;

  Article.fromJson(json){
    artId = json['artId'];
    title = json['title'];
    autId = json['autId'];
    autName = json['autName'];
    commCount = json['commCount'];
  }
}