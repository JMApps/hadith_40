import 'package:hadith_40/data/database_helper.dart';
import 'package:hadith_40/model/hadeeth_apart_item.dart';
import 'package:hadith_40/model/hadeeth_item.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<HadeethItem>> getAllHadeeths() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<HadeethItem>? allChapters = res.isNotEmpty ? res.map((c) => HadeethItem.fromMap(c)).toList() : null;
    return allChapters!;
  }

  Future<List<HadeethItem>> getOneHadeeth(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: '_id == $id');
    List<HadeethItem>? oneHadeeth = res.isNotEmpty ? res.map((c) => HadeethItem.fromMap(c)).toList() : null;
    return oneHadeeth!;
  }

  Future<List<HadeethItem>> getSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_chapters WHERE hadeeth_number LIKE '%$text%' OR hadeeth_title LIKE '%$text%'");
    List<HadeethItem>? searchResults = res.isNotEmpty ? res.map((c) => HadeethItem.fromMap(c)).toList() : null;
    return searchResults!;
  }

  addRemoveFavorite(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE _id == $_id');
  }

  Future<List<HadeethItem>> getFavoriteHadeeths() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<HadeethItem>? favoriteChapters = res.isNotEmpty ? res.map((c) => HadeethItem.fromMap(c)).toList() : null;
    return favoriteChapters!;
  }

  Future<List<HadeethItem>> getHadeethContent(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: '_id == $id');
    List<HadeethItem>? chapterContent = res.isNotEmpty ? res.map((c) => HadeethItem.fromMap(c)).toList() : null;
    return chapterContent!;
  }

  Future<List<HadeethApartItem>> getApartHadeeth(int hadeethId) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_cut', where: 'item_position == $hadeethId');
    List<HadeethApartItem>? apartHadeeth = res.isNotEmpty ? res.map((c) => HadeethApartItem.fromMap(c)).toList() : null;
    return apartHadeeth!;
  }
}