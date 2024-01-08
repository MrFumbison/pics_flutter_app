


class ImageModel{
  int id;
  String url;
  String title;

  ImageModel(this.id,this.title,this.url);

  // named constructor
  ImageModel.fromJson(parsedJson)
   : id = parsedJson['id'],
     url = parsedJson['url'],
     title = parsedJson['title'];
  
}