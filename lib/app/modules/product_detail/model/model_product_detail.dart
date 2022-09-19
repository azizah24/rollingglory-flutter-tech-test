 
class ModelProductDetail {
  ModelProductDetail({
    this.data,
  });

  Data? data;

  factory ModelProductDetail.fromJson(Map<String, dynamic> json) =>
      ModelProductDetail(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.id,
     required this.name,
    required this.info,
    required this.description,
    required this.points,
    required this.slug,
    required this.stock,
    required this.images,
    required this.isNew,
    required this.rating,
    required this.numOfReviews,
    required this.isWishlist,
  });

  int id;
  String name;
  String info;
  String description;
  int points;
  String slug;
  int stock;
  List<String> images;
  int isNew;
  double rating;
  int numOfReviews;
  int isWishlist;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        id: json["id"],
        name: json["name"],
        info: json["info"],
        description: json["description"],
        points: json["points"],
        slug: json["slug"],
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
        isNew: json["isNew"],
        rating: json["rating"].toDouble(),
        numOfReviews: json["numOfReviews"],
        isWishlist: json["isWishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "info": info,
        "description": description,
        "points": points,
        "slug": slug,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isNew": isNew,
        "rating": rating,
        "numOfReviews": numOfReviews,
        "isWishlist": isWishlist,
      };
}
