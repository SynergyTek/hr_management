## Routing:

### Using Named routes:

Using named routes are a convinient way to separate the routing logic from the normal code and this method provides us a convinient way to introduce middlewares (such as authentication) over our screens and hence increase the maintainability of the code.

** For more reference pl read this medium article: [Click here. ](https://medium.com/flutter-community/clean-navigation-in-flutter-using-generated-routes-891bd6e000df)**

#### Setup

- Firstly, we need to create a route constant for the given route. For Example:  
  `const String USER_PROFILE_ROUTE = "/profile";`
- Secondly, we need to map this route with the screen in the XTPLRouter class under the generateRoute method. For Example:  
  ` case USER*PROFILE_ROUTE:`  
  ` return MaterialPageRoute(`  
  ` builder: (*) => UserProfileScreen(),`  
  ` );`

#### Usage:

    Navigator.pushNamed(
        context,
        USER_PROFILE_ROUTE,
    );

#### Router Arguements:

    case feedRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Feed(data));
