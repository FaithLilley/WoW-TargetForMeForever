# WoW-TargetForMeForever
World of Warcraft Forever add-on - Target For Me Forever

## Installation

1. Download or clone this repository.
2. Copy only the inner `TargetForMeForever` directory into your installed WoW
   Forever client's `Interface/AddOns` directory.
3. Confirm the resulting layout is
   `Interface/AddOns/TargetForMeForever/TargetForMeForever_Camelot.toc` with
   `Core.lua` beside it. Do not copy the repository's outer directory into AddOns.
4. Start the Forever client and enable TargetForMeForever in the AddOns list.
   Log in and enter `/tfm` to display the addon version.

The current addon is a scaffold that prints a login message and its version;
targeting utilities are not implemented yet. The TOC targets interface `16001`;
confirm your installed Forever client's interface with
`/dump select(4, GetBuildInfo())`.

## Development

Open the repository root in VS Code and install the recommended Lua extension.
Workspace settings use Lua 5.1 and load the editor-only definitions under `types`.
See [docs/API.md](docs/API.md) for snapshot provenance, supplemental typing limits,
and update instructions. Development files (`types`, `docs`, `.vscode`, and Git
metadata) are not required in the game's AddOns directory.
