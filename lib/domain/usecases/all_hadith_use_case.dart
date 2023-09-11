import 'package:hadith_40/domain/entities/hadith_entity.dart';
import 'package:hadith_40/domain/repositories/hadith_repository.dart';

class AllHadithUseCase {
  final HadithRepository hadithRepository;

  AllHadithUseCase({required this.hadithRepository});

  Future<List<HadithEntity>> getAllHadiths() async {
    try {
      final List<HadithEntity> hadiths = await hadithRepository.getAllHadiths();
      return hadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
