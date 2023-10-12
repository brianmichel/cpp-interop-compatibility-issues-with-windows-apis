# C++ Interop Compatibility Issues With Windows APIs

A sample repository to demonstrate the issues as a package author on Swift for Windows that can occur as consuming tools compile with and without C++ interoperability enabled.

## Usage
1. Run `swift test`
2. The application should build and successfully test
3. Run `swift test -Xswiftc -cxx-interoperability-mode=default` (to simulate being consume by an application building with C++ interop enabled)
4. Observe the build failure due to shifting Windows type signatures.

## Discussion

As a package author for Swift on Windows there is a new responsibility since Swift 5.9 and beyond to ensure that packages published work with both C and C++ interoperability modes. Currently there is no way in Swift code to know if a module has been compiled with or without C++ interop enabled. This makes it especially challenging on Windows which includes system headers that adjust function signatures and type definitions depending on whether or not you're working with a C or C++ context.