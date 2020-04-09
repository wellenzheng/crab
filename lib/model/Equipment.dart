class Equipment {
  String id;
  String name;
  String modelType;
  String user;
  String alias;
  String location;
  String roomNumber;
  String specification;
  String produceCountry;
  String factoryNumber;
  String produceFactory;
  DateTime purchaseDateTime;
  double price;
  String invoice;
  String usingDirection;
  String note;

  Equipment(
      {this.id,
      this.name,
      this.modelType,
      this.user,
      this.alias,
      this.location,
      this.roomNumber,
      this.specification,
      this.produceCountry,
      this.factoryNumber,
      this.produceFactory,
      this.purchaseDateTime,
      this.price,
      this.invoice,
      this.usingDirection,
      this.note});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
        id: json['id'],
        name: json['name'],
        modelType: json['modelType'],
        user: json['user'],
        alias: json['alias'],
        location: json['location'],
        roomNumber: json['roomNumber'],
        specification: json['specification'],
        produceCountry: json['produceCountry'],
        factoryNumber: json['factoryNumber'],
        produceFactory: json['produceFactory'],
        purchaseDateTime: json['purchaseDateTime'],
        price: json['price'],
        invoice: json['invoice'],
        usingDirection: json['usingDirection'],
        note: json['note']);
  }
}
