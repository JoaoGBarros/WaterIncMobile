
import 'package:app/constraints/constants.dart';
import 'package:app/core/core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:app/models/agua_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final aguaAPIProvider = Provider((ref) {
  return AguaAPI(
    db: ref.watch(appwriteDatabaseProvider),
  );
});

abstract class IAguaAPI {
  FutureEither<Document> addAgua(Agua agua);
  Future<List<Document>> getAgua();
}

class AguaAPI implements IAguaAPI {
  final Databases _db;
  AguaAPI({required Databases db}) : _db = db;

  @override
  FutureEither<Document> addAgua(Agua agua) async {
    try {
      final document = await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.aguaCollection,
          documentId: ID.unique(),
          data: agua.toMap());
      return right(document);
    } on AppwriteException catch (e, st) {
      return left(Failure(e.message ?? 'Some unexpected error', st));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Future<List<Document>> getAgua() async {
    final documents = await _db.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.aguaCollection);

    return documents.documents;
  }
}
