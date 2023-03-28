
abstract class BaseApiService {

  Future<dynamic> getGetAPiResponce(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);
}