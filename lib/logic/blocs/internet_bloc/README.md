## Internet Connectivity BLOC

For a bloc we need to create three things:
 - Events
 - States
 - Logic (BLoC).

### States:

States are like all the possible options that can occur.
For this particular instance, a device can be
 - Connected to Internet (Wi-Fi or Mobile data) => InternetConnectedState().
 - Disconnected from Internet => InternetDisconnectedState().

### Events:

The event can be thought as an external stimulus that changes a state.
So in this paricular context there are two types of events possible:

 - Disconnected State to Connected State => InternetConnectedEvent()
 - Connected State to Disconnected State => InternetDisconnectedEvent()

### Logic (BLoC):

This class extends both the State and Event classes (abstract). The main purpose of this class is to create an 
async generator method called mapEventToState(). This method returns a stream which can be listened to.
In this particular example:

If the event is InternetConnectedEvent this method will yield (return) a new InternetConnectedState and likewise if 
the event is InternetDisconnectedEvent this method will yield (return) a new InternetDisconnectedState.  

## Presentation Layer (UI):
The UI must initiate (create) the BLoC (InternetBloc) which is done in the main.dart with the help of a BlocProvider.


    return BlocProvider(
      create: (context) => InternetBloc(
        connectivity: Connectivity(),
      ),
      child: ...
    );


Similarly, wherever this particular state is needed can be listened to using:

    BlocProvider.of<InternetBloc>(context).state;
        or
    context.read<InternetBloc>();


Apart from this if the state is required to be used/changed inside the build method then either of these three need to be used.

    - BlocListener
    - BlocBuilder
    - BlocConsumer
    
### Repository:
This concept is not required in the current use case and will be explained with a different example.

#### Note: 
 - Order of development must be in the same format.
    States >>  Events >> Repositories (Optional) >> Blocs.
 - There is another concept that is required to understand is: 
    i.e the difference between 
    **BlocProvider(...) and BlocProvider.value(...)**