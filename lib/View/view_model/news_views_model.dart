import 'package:news_app/Model/CategoriesNewsModel.dart';
import 'package:news_app/Model/NewsChannelModel.dart';
import 'package:news_app/Repository/new_repository.dart';

class NewsViewModel {
  final _api = NewsRepository();

  Future<NewsChannelModel> fetchNewChannelHeadlineApi(
      String channelName) async {
    final response = await _api.fetchNewChannelHeadlineApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String categories) async {
    final response = await _api.fetchCategoriesNewsApi(categories);
    return response;
  }
}
