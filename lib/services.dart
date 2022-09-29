import 'package:http/http.dart' as http;

class Services{

   static Future<dynamic> getResponse() async {


     var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef'));
     http.StreamedResponse response = await request.send();

     if(response.statusCode == 200){

       var res= await response.stream.bytesToString();

       return res;
     }
     else{

       print(response.reasonPhrase);
       return"0";
     }


   }

}

class Categories{

  static Future<dynamic> getResponse() async {


    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Chicken'));
    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200){

      var res= await response.stream.bytesToString();

      return res;
    }
    else{

      print(response.reasonPhrase);
      return"0";
    }


  }
}

class Cat{

  static Future<dynamic> getResponse() async {


    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200){

      var res= await response.stream.bytesToString();

      return res;
    }
    else{

      print(response.reasonPhrase);
      return"0";
    }


  }
}

class SeaFood{

  static Future<dynamic> getResponse() async {


    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=SeaFood'));
    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200){

      var res= await response.stream.bytesToString();

      return res;
    }
    else{

      print(response.reasonPhrase);
      return"0";
    }


  }
}