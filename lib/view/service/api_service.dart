import '../../model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PostModel>> fetchPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return postModelFromJson(json);
    } else {
      return null!;
    }
  }
}
