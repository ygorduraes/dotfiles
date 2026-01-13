---
applyTo: "**/*.swift
---

# SwiftUI instructions

## Overall guidelines

- Don't overengineer. Be as simple as possible (KISS), refactor most of the code to simplify it if necessary
- Always document the functions and classes
- Avoid creating giant files. If anything reaches more than 1000 lines, start moving classes and functions to separate .swift files
- Use native SwiftUI components every time you can (e.g. Sheets)
- When creating classes and functions, write some documentation explaining what they do (no need to be too long, but the minimum to have some context)
- Always check if you're using non-deprecated code, based on the iOS target
- Always use context7 when I need code generation, setup or configuration steps, or library/API documentation. This means you should automatically use the Context7 MCP tools to resolve library id and get library docs without me having to explicitly ask

## SwiftUI Patterns

- Use modern `#Preview` macro (not `PreviewProvider`)
- Leverage property wrappers: `@State`, `@StateObject`, `@EnvironmentObject`, `@Binding`
- Keep `body` computed property clean and readable
- Extract complex views into separate components
- Use view modifiers for styling (avoid creating wrapper views unnecessarily)

## Async/Await and Concurrency

- Use Swift concurrency (`async/await`) for asynchronous operations
- Default actor isolation is `MainActor` for this project
- Annotate with `@MainActor` when needed for UI updates
- Avoid completion handlers; prefer async functions

## Error Handling

- Use Swift's native error handling (`throw`, `try`, `catch`)
- Define custom error types conforming to `Error` or `LocalizedError`
- Provide meaningful error messages for debugging
- Handle errors gracefully in the UI

## Documentation

Document all public APIs, complex logic, and non-obvious implementations.

## Important Notes

- **No third-party dependencies whenever possible** - keep it native where possible
- **Modern Swift features enabled**: Previews (multiple per UI state if necessary), asset symbols, string catalogs
- **Automatic Info.plist generation** - no manual plist editing needed
- **Code signing**: Automatic
