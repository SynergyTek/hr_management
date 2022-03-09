import 'package:meta/meta.dart';
// import 'package:flutter/services.dart';

class FormIOHelper {
  Future<String> fn({
    String? cssText,
    String? jsText,
    String? json,
  }) async {
    String upperHTML = """ 
  <!doctype html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>InAppWebViewInitialDataTest</title>
    <script type="text/javascript" src="https://cdn.embedly.com/widgets/platform.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
  """;

    String localFile = """
      <style>$cssText</style>
      <script>$jsText</script>
    """;

    String lowerHTML = """<script>
                  window.onload = function () {
                Formio.icons = "fontawesome";
                Formio.createForm(
                    document.getElementById("formio"),
                  $json  
                );
                  };
          </script>
        </head>
        <body>
                <div id="formio"></div>
        </body>
    </html>
    """;

    return upperHTML + localFile + lowerHTML;
  }

  String generateHTML({
    required String json,
  }) {
    if (json == null || json.isEmpty)
      throw Exception("FormIO Json cannot be null or empty.");

    return _generateFormIOHTML(json);
  }

  String _generateFormIOHTML(String json) {
    return """
    <!doctype html>
    <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>InAppWebViewInitialDataTest</title>
          <script type="text/javascript" src="https://cdn.embedly.com/widgets/platform.js"></script>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />

          <link rel="stylesheet" href="https://cdn.form.io/formiojs/formio.full.min.css" />
          <script src="https://cdn.form.io/formiojs/formio.full.min.js"></script>

          <script>
                  window.onload = function () {
                Formio.icons = "fontawesome";
                Formio.createForm(
                    document.getElementById("formio"),
                    """ +
        json +
        """
                );
                  };
          </script>
        </head>
        <body>
                <div id="formio"></div>
        </body>
    </html>
    """;
  }
}

// <link rel="stylesheet" href="https://cdn.form.io/formiojs/formio.full.min.css" />
// <script src="https://cdn.form.io/formiojs/formio.full.min.js"></script>
