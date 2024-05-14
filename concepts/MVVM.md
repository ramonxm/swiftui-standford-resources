# MVVM Architecture 

Introduced MVVM architecture for SwiftUI Apps

## Topics 

- MVVM 
  - Design Paradigm
- Swift Type System
  - struct
  - class
  - protocol
  - "don't care" type (aka generics)
  - enum
  - functions
  

## Model and UI

### Separating "Logic and Data" from "UI"
  
SwiftUI is very serious about the separation of application logic & data from the UI.
We call this logic and data our "*Model*".
It could be a struct or an SQL database or some machine learning code or many other things.
Or any combination of such things

The UI is basically just a "parametrizable" shell that the Model feeds and brigs to life.
Think of the *UI* as a *visual manifestation of the Model*
The Model is where things like `isFaceup` and `cardCount` would live (not in @State in the UI)
SwiftUI taks care of making sure the UI gets rebuilt when a Model change affects the UI


### Connecting the Model to the UI

There are some choices about how to connect the Model to the UI

1) Rarely, the Model could just be an @State in a View (this is very minimal to no separation)
2) The Model might only be accessible via gatekeeper "*View Model*" class (full separation)
3) There is a View Model class, but the Model is still directly accessible (partial separation)

Mostly this choice depends on the complexity of the Model

A Model that is made up of SQL + struct(s) + something else will likely opt for #2
A Model that is just a simple piece of data and little to no logic would likely opt for #1
Something in-between might be interested in option #3

We're going to talk now about #2 (full separation)

We call this architecture that connects the Model to the UI in this way *MVVM*.

**M**odel-**V**iew-**V**iew**M**odel
This is the primary architecture for any reasonably complex SwiftUI application

You'll also quickly see how #3 (partial separation) is just a minor tweak to MVVM.

