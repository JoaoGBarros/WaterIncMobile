// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String email;
  final String name;
  final List<String> seguidores;
  final List<String> seguindo;
  final String uid;
  final String profilePic;

  //Construtor
  const UserModel({
    required this.email,
    required this.name,
    required this.seguidores,
    required this.seguindo,
    required this.uid,
    required this.profilePic,
  });

  // Basicamente um update, o campo defindo vai ser alterado
  UserModel copyWith({
    String? email,
    String? name,
    List<String>? seguidores,
    List<String>? seguindo,
    String? uid,
    String? profilePic,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      seguidores: seguidores ?? this.seguidores,
      seguindo: seguindo ?? this.seguindo,
      uid: uid ?? this.uid,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'seguidores': seguidores,
      'seguindo': seguindo,
      'uid': uid,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print("No mapa");
    print(map['profilePic']);
    return UserModel(
      email: map['email'] as String,
      name: map['name'] as String,
      seguidores: List<String>.from((map['seguidores'])),
      seguindo: List<String>.from((map['seguindo'])),
      profilePic: map['profilePic'] as String,
      uid: map['\$id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, seguidores: $seguidores, seguindo: $seguindo, uid: $uid, profilePic: $profilePic)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        listEquals(other.seguidores, seguidores) &&
        listEquals(other.seguindo, seguindo) &&
        other.uid == uid &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        seguidores.hashCode ^
        seguindo.hashCode ^
        uid.hashCode ^
        profilePic.hashCode;
  }
}
