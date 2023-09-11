import 'package:hadith_40/domain/entities/search_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/search_list_repository.dart';

class SearchListUseCase {
  final SearchListRepository searchListRepository;

  SearchListUseCase({required this.searchListRepository});

  Future<List<SearchHadithEntity>> getSearchChapterHadiths({
    required String tableName,
  }) async {
    try {
      final List<SearchHadithEntity> searchChapterHadiths =
          await searchListRepository.getSearchChapterHadiths(
        tableName: tableName,
      );
      return searchChapterHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
