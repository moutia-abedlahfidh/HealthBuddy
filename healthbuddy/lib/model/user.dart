

class userModel {
  String? userid ;
  final String? name ;
  final int? alt ;
  final String? geschlecht ;
  final String? email ;
  final double? gewicht ;
  final double? grose ;


  userModel({
     this.userid,
     this.name,
     this.email,
     this.geschlecht,
     this.gewicht,
     this.grose,
     this.alt
  });

  factory userModel.fromJson(Map<String, dynamic> map) {
    return userModel(
      name: map['name'],
      email: map['email'],
      geschlecht: map['geschlecht'],
      grose: (map['grose'] as num?)?.toDouble(),
      alt: map['alt'],
      gewicht: (map['gewicht'] as num?)?.toDouble(),
    );
  }
}