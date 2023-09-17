import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/content_hadith_repository.dart';

class ContentHadithUseCase {
  final ContentHadithRepository contentHadithRepository;

  ContentHadithUseCase({required this.contentHadithRepository});

  Future<List<ContentHadithEntity>> getContentHadith({
    required String tableName,
    required int hadithId,
  }) async {
    try {
      final List<ContentHadithEntity> contentHadith = await contentHadithRepository.getContentHadith(
        tableName: tableName,
      );
      return contentHadith;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
