import 'dart:convert';
import 'package:http/http.dart';
import '../models/profile.dart';
import '../models/session.dart';
import '../models/statistics.dart';
import '../models/typeData.dart';
import '../models/res.dart';
import '../models/sharedData.dart';
import '../models/event.dart';
import '../models/user.dart';
import '../models/region.dart';

class API {
  static const String _BASE_URL = 'https://moh.hadath.app';
  static String s;
  static Future<List<ShardData>> getAllSpeakers() async {
    //business logic to send data to server
    final Response response =
        await get('https://moh.hadath.app/en/json/speakers?_format=json');

    if (response.statusCode == 200) {
      print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ShardData>((item) => ShardData.fromJson(item)).toList();
      //return Author.fromJson(json.decode(response.body));
    } else {
      print('Error');
      throw Exception("Can't load speaker");
    }
  }

  static Future<ResModel> signup(ResModel user) async {
    final Response response =
        await post('https://moh.hadath.app/user/register?_format=json',
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8',
            },
            body: jsonEncode(user.toJson()));

    if (response.statusCode == 200) {
      print("the response is");

      print(response.body);

      return ResModel.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  Future<List<ResModel>> register() async {
    var response =
        await post('https://moh.hadath.app/user/register?_format=json');

    var rb = response.body;

    // store json data into list
    var list = json.decode(rb) as List;

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    List<ResModel> imgs = list.map((i) => ResModel.fromJson(i)).toList();

    print(imgs.runtimeType); //returns List<Img>
    print(imgs[0].runtimeType); //returns Img

    return imgs;
  }

  static Future<User> login(User user) async {
    final Response response = await post('$_BASE_URL/user/login?_format=json',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(user.toJson()));

    if (response.statusCode == 200) {
      s = response.headers['set-cookie'].substring(0, 82);
      print(s);
      print("the response is");

      print(response.body);

      return User.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception("Can't load login");
    }
  }

  static Future<void> sendCode(String email) async {
    String url =
        '$_BASE_URL/hadath-user-registration/verify-email?_format=json&email=$email';

    final Response response = await get(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
    } else {
      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  static Future<void> verifymobile(String no) async {
    String url =
        '$_BASE_URL/hadath-user-registration/verify-mobile?_format=json&email=$no';

    final Response response = await get(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
    } else {
      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  static Future<List<Region>> getRegion() async {
    var data = await get('$_BASE_URL/hadath/reg_settings?_format=json');

    var jsonData = json.decode(data.body);

    List<Region> regions = [];

    for (var u in jsonData) {
      Region user = Region(u["tid"], u["name"]);

      regions.add(user);
    }

    return regions;
  }

  static Future<bool> verifyCode(String item, String code) async {
    String url =
        '$_BASE_URL/hadath-user-registration/verify-code?_format=json&item=$item&code=$code';

    final Response response = await get(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = response.body;
      if (response.body == '1') {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  static Future<List<Response>> typeVerify() async {
    final Response response =
        await get('$_BASE_URL/hadath/reg_settings?_format=json');
    if (response.statusCode == 200) {
      List x = jsonDecode(response.body);
      print(x);

      x.forEach((e) {
        if (e['email_verification_required'] == '1') {
          print("email");
        } else if (e['mobile_verification_required'] == '1') {
          print("mobile");
        } else if (e['email_verification_required'] == '1' &&
            e['mobile_verification_required'] == '1') {
          print("email and phone");
        } else {
          print("there is aproblem");
        }
      });
    } else {
      print("error");
      throw Exception("Can't load data");
    }
  }

  static Future<List<TypeData>> typing() async {
    var data = await get('$_BASE_URL/hadath/reg_settings?_format=json');

    var jsonData = json.decode(data.body);

    List<TypeData> types = [];

    for (var u in jsonData) {
      TypeData list2 = TypeData(
          u["email_verification_required"], u["mobile_verification_required"]);

      types.add(list2);
    }

    return types;
  }

  static Future<List<Statistics>> getAllS() async {
    var data = await get('https://moh.hadath.app/hadath/stats-es');

    var jsonData = json.decode(data.body);

    List<Statistics> types = [];

    for (var u in jsonData) {
      Statistics list2 =
          Statistics(u["members"], u["sponsors"], u["speakers"], u["sessions"]);

      types.add(list2);
    }

    return types;
  }

  static Future<List<ShardData>> getAllSponsers() async {
    final Response response =
        await get('https://moh.hadath.app/en/json/sponsors?_format=json');
    if (response.statusCode == 200) {
      // print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<ShardData>((item) => ShardData.fromJson(item)).toList();
    } else {
      print("error");
      throw Exception("Can't load sponser");
    }
  }

  static Future<List<Session>> getAllSessions() async {
    final Response response = await get(
        'https://moh.hadath.app/en/json/sessions?_format=json',
        headers: {'Cookie': s});

    if (response.statusCode == 200) {
      print(response.body);

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Session>((item) => Session.fromJson(item)).toList();
    } else {
      print(response);

      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  static Future<List<Profile>> getProfile() async {
    final Response response = await get(
        'https://moh.hadath.app/en/user-info?_format=json',
        headers: {'Cookie': s});

    if (response.statusCode == 200) {
      print(response.body);

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Profile>((item) => Profile.fromJson(item)).toList();
    } else {
      print(response);

      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  static Future<List<Event>> getAllEvent() async {
    final Response response =
        await get('https://moh.hadath.app/en/json/event?_format=json');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Event>((item) => Event.fromJson(item)).toList();
    } else {
      print(response);

      throw Exception('Request Error: ${response.statusCode}');
    }
  }
}
