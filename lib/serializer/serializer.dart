import 'dart:convert';

Serializer serializerFromJson(String str) => Serializer.fromJson(json.decode(str));

String serializerToJson(Serializer data) => json.encode(data.toJson());

class Serializer {
    int result;

    Serializer({
        this.result,
    });

    factory Serializer.fromJson(Map<String, dynamic> json) => Serializer(
        result: json["Result"],
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
    };
}