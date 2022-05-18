class Wines {
  String? winery;
  String? wine;
  Rating? rating;
  String? location;
  String? image;
  int? id;

  Wines(
      {this.winery,
      this.wine,
      this.rating,
      this.location,
      this.image,
      this.id});


       factory Wines.fromJson(json) => Wines(
     winery:json['winery'],
    wine:  json['wine'],
    rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    location : json['location'],
    image : json['image'],
    id : json['id'],);

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =Map<String, dynamic>();
    data['winery'] = winery;
    data['wine'] = wine;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['location'] =location;
    data['image'] =image;
    data['id'] =id;
    return data;
  }
}

class Rating {
  String? average;
  String? reviews;

  Rating({this.average, this.reviews});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['average'] = average;
    data['reviews'] = reviews;
    return data;
  }
}
