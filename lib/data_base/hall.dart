class Hall {
  String? HallName;
  String? PrimaryImageUrl;
  String? PrimaryLocation;
  double? Latitude;
  double? Longitude;
  List<dynamic>? PhotosList;
  String? HallCapacity;
  String? PriceDescription;
  String? MarkerId;
  String? PhoneNumber;
  String? RatingNumber;
  List<dynamic>? VideosList;
  Hall(
      {required this.HallName,
      required this.PrimaryImageUrl,
      required this.PrimaryLocation,
      required this.Latitude,
      required this.Longitude,
      required this.PhotosList,
      required this.HallCapacity,
      required this.PriceDescription,
      required this.MarkerId,
      required this.PhoneNumber,
      required this.VideosList,
      required this.RatingNumber});
  Hall.FromFirestore(Map<String, dynamic> data)
      : this(
            HallName: data['HallName'],
            PrimaryImageUrl: data['PrimaryImageUrl'],
            PrimaryLocation: data['PrimaryLocation'],
            Latitude: data['Latitude'],
            Longitude: data['Longitude'],
            PhotosList: data['PhotosList'],
            HallCapacity: data['HallCapacity'],
            PriceDescription: data['PriceDescription'],
            MarkerId: data['MarkerId'],
            PhoneNumber: data['PhoneNumber'],
            VideosList: data['VideosList'],
            RatingNumber: data['RatingNumber']);
  Map<String, dynamic> ToFirestore() {
    return {
      'HallName': HallName,
      'PrimaryImageUrl': PrimaryImageUrl,
      'PrimaryLocation': PrimaryLocation,
      'Latitude': Latitude,
      'Longitude': Longitude,
      'PhotosList': PhotosList,
      'HallCapacity': HallCapacity,
      'PriceDescription': PriceDescription,
      'MarkerId': MarkerId,
      'PhoneNumber': PhoneNumber,
      'VideosList': VideosList,
      'RatingNumber': RatingNumber
    };
  }
}
