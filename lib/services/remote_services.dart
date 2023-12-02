import 'package:rest_api_app/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Photos>?> getPhotos() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return photosFromJson(json);
    }
    return null;
  }
}
