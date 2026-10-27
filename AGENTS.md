
# TargetForMeForever

## Project
This repository contains TargetForMeForever, a standalone addon for World of Warcraft Forever.

## Scope
- This repository contains exactly one addon.
- Do not modify files outside this repository.
- Do not create dependencies on other personal addons.
- Keep the addon independently installable.
- Do not introduce shared libraries without approval.

## WoW Forever
- Target WoW Forever specifically.
- Do not assume Classic Era, Season of Discovery, or Retail API compatibility.
- Forever uses a modern retail-derived API.
- Prefer the local types/WowForeverAPI.lua definitions.
- Consult the Forever API documentation when needed.
- Treat unverified APIs and behaviours as assumptions.
- Confirm the interface version against the game client.

## Addon engineering
- Use Lua compatible with WoW's runtime.
- Follow existing project conventions.
- Keep code readable and modular.
- Prefer event-driven code over polling.
- Respect secure execution and protected actions.
- Never suggest bypassing Blizzard's addon restrictions.

## Development workflow
- Make focused changes only.
- Explain significant design decisions.
- Do not commit or push to GitHub automatically.
- Do not modify unrelated files.
- Report unverified API assumptions.
- State what requires testing in the live game.

## Testing
- Run available static checks.
- Do not claim in-game functionality is tested unless actual test results have been provided.
- Provide reproduction steps for bugs.
- Do not modify WoW settings or SavedVariables unless explicitly requested.