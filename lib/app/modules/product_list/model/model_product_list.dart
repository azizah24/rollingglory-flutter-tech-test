class ModelListProduct {
  ModelListProduct({
    this.meta,
    this.data,
    this.links,
  });

  Meta? meta;
  List<Datum>? data;
  Links? links;

  factory ModelListProduct.fromJson(Map<String, dynamic> json) =>
      ModelListProduct(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
      );

   
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Links {
  Links({
    required this.self,
    required this.next,
    required this.last,
  });

  String self;
  String next;
  String last;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        next: json["next"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "next": next,
        "last": last,
      };
}

class Meta {
  Meta({
    required this.totalItems,
    required this.currentPage,
    required this.itemPerPage,
    required this.totalPages,
  });

  int totalItems;
  int currentPage;
  int itemPerPage;
  int totalPages;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        itemPerPage: json["itemPerPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "currentPage": currentPage,
        "itemPerPage": itemPerPage,
        "totalPages": totalPages,
      };
}
