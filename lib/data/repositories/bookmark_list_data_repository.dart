import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/models/bookmark_hadith.dart';
import 'package:hadith_40/domain/entities/bookmark_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/bookmark_list_repository.dart';
import 'package:sqflite/sqflite.dart';

class BookmarkListDataRepository implements BookmarkListRepository {
  final DatabaseHelper databaseHelper;

  BookmarkListDataRepository({required this.databaseHelper});

  @override
  Future<List<BookmarkHadithEntity>> getBookmarksChapterHadiths({
    required String tableName,
    required List<int> bookmarks,
  }) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName, where: 'id in (${bookmarks.map((id) => '?').join(', ')})', whereArgs: bookmarks,);
    List<BookmarkHadithEntity>? allBookmarksHadiths = res.isNotEmpty ? res.map((c) => _mapToHadithEntity(BookmarkHadith.fromMap(c))).toList() : null;
    return allBookmarksHadiths!;
  }

  // Mapping to entity
  BookmarkHadithEntity _mapToHadithEntity(BookmarkHadith hadith) {
    return BookmarkHadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
    );
  }
}