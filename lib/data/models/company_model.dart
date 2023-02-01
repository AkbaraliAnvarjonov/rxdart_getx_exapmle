class CompanyModel {
  int id;
  String carModel;
  int averagePrice;
  String logo;
  int establishedYear;

  CompanyModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      carModel: json['car_model'],
      averagePrice: json['average_price'],
      logo: json['logo'],
      establishedYear: json['established_year'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car_model'] = carModel;
    data['average_price'] = averagePrice;
    data['logo'] = logo;
    data['established_year'] = establishedYear;
    return data;
  }
}
