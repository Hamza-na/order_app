


class UserEntitiy {
  String name;
  String phoneNumber;
  String ?image;
  String ?location;
  String lang;


  UserEntitiy({
    required this.name,
    required this.phoneNumber,
    this.image,
    required this.lang,
    this.location,
  });
  

  
}
