import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/content_hadith_repository.dart';

class ContentHadithUseCase {
  final ContentHadithRepository contentHadithRepository;

  ContentHadithUseCase({required this.contentHadithRepository});

  Future<ContentHadithEntity> getContentHadithById({
    required String tableName,
    required int hadithId,
  }) async {
    try {
      final ContentHadithEntity contentHadith =
          await contentHadithRepository.getContentHadithById(
        tableName: tableName,
        hadithId: hadithId,
      );
      return contentHadith;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
