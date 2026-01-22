---
applyTo: "**/*.ts,**/*.tsx"
---

# Typescript and Next.js instructions

- Always use `pnpm` if you need to run commands
- Use shadcn/ui for every component possible (cards, accordion, sidebar, breadcrumbs, badges, alerts, React Hook Form, charts etc)
- Avoid creating components from scratch at all costs. Always check the available components in shadcn's MCP registry before trying to create components
- The command to add new components is like this `pnpm dlx shadcn@latest add button`. Check shadcn's MCP registry to find out the name of the component
- Use Lucide for icons
- Don't overengineer. Be as simple as possible (KISS), refactor most of the code to simplify it if necessary
- Break the code in separate components every time you have to reuse stuff, avoid creating giant files
- When mocking data, just mock it straight into the components (don't create APIs or server functions to fetch data, I'll do that later when I get the actual API schema). Use simple states (useState/useEffect) for the mock data. No need for useMemos, SWR or more complex stuff.
- When fetching real data, do it in the UI through useSWR, always creating a custom fetcher in `lib/fetchers.ts` and a server function for it in `lib/api-functions.ts`
- Prefer using shadcn/ui Skeleton component when loading data instead of using texts or spinners
- Always document the functions using @param and @returns
- Prefer async/await over .then() all the time
- Never export default on components and functions, always export the functions individually
- If you've got an external API to connect to, create interfaces/types that match the fields returned, even if it uses snake case
- Always use async params fetching on slugs (mandatory for newer versions of Next.js)
- When creating new pages, always keep a server side `page.tsx` along with its client side component e.g. for a `/login` page, there would be a `use server` `page.tsx` that loads a `use client` `login.tsx`, both files inside `/login`. This way we can load server side data before loading the page when necessary.
- Prefer `??` over `||` to prevent nulls (adapt the code accordingly)
- Avoid ternaries unless when conditionally rendering TSX code that contains Javascript/Typescript
- Always protect props with Readonly
- If we're working with tests, always write/update the test files after changes
- Always run `pnpm lint` after making changes to see if everything is fine, and `pnpm format` to format the codebase with the code formatter
