class MarketSubItemEntity {
  int id;
  String name;
  String location;
  String description;
  String ?image;

  MarketSubItemEntity({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
     this.image,
  });
  
}
