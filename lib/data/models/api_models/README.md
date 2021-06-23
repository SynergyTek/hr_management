## API Http Helper with BLoC Pattern:

### Steps to follow:

- Step 1: Create a Higher level API model.

- Step 2: Create a each APIData model.

- Step 3: Create a data class i.e. Repository class  
  (both Abstract class and it's implementation)

- Step 4: Create an API Endpoints const class to manage Endpoints centrally.

- Step 5: Create the API Bloc.

- Step 6: Call the API Bloc from a StreamBuilder from UI.

### Dependencies:

- bloc
- dio
- rxdart

### Response:

{
data: [
APIDataModel,
APIDataModel,
APIDataModel,
],

error: "",
}

APIDataModel {
int id;
double popularity;
String title;
String backPoster;
String poster;
String overview;
double rating;
}
