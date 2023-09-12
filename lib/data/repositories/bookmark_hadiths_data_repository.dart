import 'package:hadith_40/data/datasources/databases/local/queries/local_bookmark_hadiths.dart';
import 'package:hadith_40/data/models/chapter_hadith.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/bookmark_hadiths_repository.dart';

class BookmarkHadithsDataRepository implements BookmarkHadithsRepository {
  final LocalBookmarkHadiths localBookmarkHadiths;

  BookmarkHadithsDataRepository({required this.localBookmarkHadiths});

  @override
  Future<List<ChapterHadithEntity>> getBookmarkHadiths({required String tableName, required List<int> bookmarks}) async {
    final List<ChapterHadith> bookmarkHadiths = await localBookmarkHadiths.getBookmarkHadiths(tableName: tableName, bookmarks: bookmarks);
    final List<ChapterHadithEntity> bookmarkHadithEntities = bookmarkHadiths.map((chapterHadith) {
      return _mapToHadithEntity(chapterHadith);
    }).toList();
    return bookmarkHadithEntities;
  }

  // Mapping to entity
  ChapterHadithEntity _mapToHadithEntity(ChapterHadith hadith) {
    return ChapterHadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
    );
  }
}
