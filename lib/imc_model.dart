class ImcModel {
  final bool isMale;
  final String gender;
  String description;
  final double altura;
  final double peso;
  double numberResult = 0;
  String result = '';

  ImcModel({
    required this.altura,
    required this.peso,
    required this.isMale,
    required this.gender,
    required this.description,
  });

  copyWith({
    double? altura,
    double? peso,
    bool? isMale,
    String? gender,
    String? description,
  }) {
    return ImcModel(
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
      isMale: isMale ?? this.isMale,
      gender: gender ?? this.gender,
      description: description ?? this.description,
    );
  }
}
