// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:app/core/enums/agua_unidade_enum.dart';

@immutable
class Agua {
  final double quantidade;
  final String uid;
  final UnidadeAgua unidade;

  const Agua({
    required this.quantidade,
    required this.uid,
    required this.unidade,
  });

  Agua copyWith({
    double? quantidade,
    String? uid,
    UnidadeAgua? unidade,
  }) {
    return Agua(
      quantidade: quantidade ?? this.quantidade,
      uid: uid ?? this.uid,
      unidade: unidade ?? this.unidade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantidade': quantidade,
      'uid': uid,
      'unidade': unidade.unidade,
    };
  }

  factory Agua.fromMap(Map<String, dynamic> map) {
    return Agua(
      quantidade: map['quantidade'] + 0.0,
      uid: map['uid'] as String,
      unidade: (map['unidade'] as String).toAguaEnum(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Agua.fromJson(String source) =>
      Agua.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Agua(quantidade: $quantidade, uid: $uid, unidade: $unidade)';
  }

  @override
  bool operator ==(covariant Agua other) {
    if (identical(this, other)) return true;

    return other.quantidade == quantidade &&
        other.uid == uid &&
        other.unidade == unidade;
  }

  @override
  int get hashCode {
    return quantidade.hashCode ^ uid.hashCode ^ unidade.hashCode;
  }
}
