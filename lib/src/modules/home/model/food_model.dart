class FoodModel {
  FoodModel({
    required this.foods,
    required this.error,
  });

  final List<Food> foods;
  final ErrorCode? error;

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    List<Food> foods = [];
    final jsonFoods = json['foods'];
    if (jsonFoods != null) {
      final jsonFood = jsonFoods['food'];
      if (jsonFood != null && (jsonFood as List).isNotEmpty) {
        foods = List<Food>.from(jsonFood.map((e) => Food.fromJson(e)));
      }
    }
    return FoodModel(
      foods: foods,
      error: ErrorCode.fromJson(json['error']),
    );
  }
}

class FoodBody {
  FoodBody({
    this.format,
    required this.method,
    this.searchExpression,
  });

  String? format;
  String method;
  String? searchExpression;

  Map<String, String> toJson() => {
        'method': method,
        'format': format ?? "json",
        'searchExpression': searchExpression ?? "",
      };
}

class Food {
  Food({
    required this.brandName,
    required this.foodDescription,
    required this.foodId,
    required this.foodName,
    required this.foodType,
    required this.foodUrl,
  });

  final String? brandName;
  final String? foodDescription;
  final String? foodId;
  final String? foodName;
  final String? foodType;
  final String? foodUrl;

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        brandName: json['brand_name'],
        foodDescription: json['food_description'],
        foodId: json['food_id'],
        foodName: json['food_name'],
        foodType: json['food_type'],
        foodUrl: json['food_url']);
  }
}

class ErrorCode {
  ErrorCode({
    required this.code,
    required this.message,
  });

  final int? code;
  final String? message;

  factory ErrorCode.fromJson(Map<String, dynamic> json) {
    return ErrorCode(
      code: json['code'],
      message: json['message'],
    );
  }
}
