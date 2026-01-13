---
applyTo: "**/*.swift
---

# SwiftUI instructions

- Don't overengineer. Be as simple as possible (KISS), refactor most of the code to simplify it if necessary
- Always document the functions and classes
- Avoid creating giant files. If anything reaches more than 1000 lines, start moving classes and functions to separate .swift files
- Use native SwiftUI components every time you can (e.g. Sheets)
- When creating classes and functions, write some documentation explaining what they do (no need to be too long, but the minimum to have some context)
- Always check if you're using non-deprecated code, based on the iOS target
- Always use context7 when I need code generation, setup or configuration steps, or library/API documentation. This means you should automatically use the Context7 MCP tools to resolve library id and get library docs without me having to explicitly ask
