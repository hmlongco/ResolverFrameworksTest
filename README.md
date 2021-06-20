# ResolverFrameworksTest

This following project repository demonstrates using Resolver across frameworks and in the main application.

Functionally, the main trick is to place Resolver into its own, dedicated framework that's imported into the main application and into each individual framework. 

This is needed because If you simply include Resolver in each framework, either as a single file or even as a package, then each framework has its own "copy" of Resolver that's a different type that all of the other copies of Resolver. In which case nothing matches up, nothing resolve across boundaries, and chaos ensues.

I called the dedicated framework ResolverFramework in this example, but it could also be a common "SharedFramework" that contained a copy of Resolver plus other common code shared by the application.

Either way, once that's done the main application would be responsible for calling the registration blocks for each framework the application wants to use.

```swift
import ResolverFramework

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerAppServices()
        registerPresentationServices()
        registeDataServices()
        ...
    }
}
```
Where in the PresentationFramework...
```swift
import ResolverFramework

extension Resolver {
    public static func registerPresentationServices() {
        register { PresentationViewModel() }
            .scope(.shared)
    }
}
```
This example also shows defining a delegate protocol in the framework, and then fulfilling that protocol with a class registered in the main application.
