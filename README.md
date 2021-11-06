# Friendr iOS interview

## Part one

1) Explain some differences between a modal and push navigation.

Modal presentation usually fully covers the screen and it requires action from the user to exit. 
It is used to direct the user to a complety new flow in the app. 
User's attention is fully focused on the modal page until it's dissmissed.

Push navigation is part of a navigation stack where pages are put on the stack.
User can pop the page from the stack and go back to the previous page until the root page is reached.
Pushed page covers most of the screen except the bars with controls for navigation.
Unlike modal no explicit action is needed to push and pop content to and from the stack.

2) When is it preferred to use `Keychain Services`, `UserDefaults` or `Core Data`? Please explain some different scenarios or use cases.
All three frameworks are for persisting data in a storage. 

Main feature of Keychan Service is to securely store private data in a small database.
Private information like passwords, auth tokens and credit card info.

UserDefaults is also a small database for storing insensitive date like user's preferences.
Examples are app theme or in-app default language.

Core Data is complex API for storing app's data and managing relationship's between app's objects.
With Core Data you can save app data for offline usage and cache network data. 

3) Given the following function inside a `UIViewController`, what can go wrong here?:
```swift
func fetchData() {
    service.fetchFromAPI { result in
        self.data = result
    }
}
```
1. data property of self can be a UI element. And fetchFromAPI's completion handler can be called from
background thread. You mustn't modify UI from background thread. Because UIKit elements are not thread-safe.
2. Completion handler closure captures self. It can lead to retain cycle. Self have to captured as weak.
 [weak self] result in 
 
4) Give a brief explanation of protocol oriented programming.

POP is a new method of programming which uses protocols as a unit of abstraction
to group logic and functionality, as opposed to "classes" in Object-Oriented Programming.
Protocols describe the functionality of the object that implements it, like a template.
Unlike classes Protocols allow multiple inheritence in Swift. Protocols allow inheritance for value types. 
This makes code more modular.
Combined with values types Protocols can help solve many 
problems of Object-oriented programming such as rigidity and complexity.
