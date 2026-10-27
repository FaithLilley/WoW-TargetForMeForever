# Forever API definitions

`types/WowForeverAPI.lua` is an unchanged upstream snapshot generated from the
WoW Forever client's own APIDocumentation. Its header identifies build **70170**,
interface **16001**, exported **2026-10-01 21:34:30**. The corresponding upstream
[machine-readable export](https://atraeau.github.io/WoW-Addons/api.json) identifies
version **1.60.1** and product `wow_classic_beta`.

Source: [Atraeau/WoW-Addons](https://github.com/Atraeau/WoW-Addons),
[upstream Lua definitions](https://github.com/Atraeau/WoW-Addons/blob/main/types/WowForeverAPI.lua),
and [generated API reference](https://atraeau.github.io/WoW-Addons/).
These live links can change; the local header records this repository's snapshot.
The imported file's SHA-256 is
`30B6B9C8375E178DEEEEAC8EC99B3EA70E531632D327109B2A6DEB81BBDBD0D9`.

## Supplemental definitions

`types/WowForeverSupplemental.lua` supplies only the missing surface needed by
`Core.lua`. Both files are discovered through the existing `Lua.workspace.library`
entry for `types` in `.vscode/settings.json`. Neither belongs in the addon TOC.

The snapshot incorrectly places widget methods in the global namespace. The
supplement defines methods as fields of a new `Frame` class, without redeclaring
those globals or the snapshot's existing callback classes. `CreateFrame` and
`SlashCmdList` are absent from the snapshot and are each defined once here.
Do not enable an additional generic Retail/Classic API library alongside these
definitions without first checking for overlapping declarations.

Evidence and limits:

- `Frame:RegisterEvent(eventName: string): boolean` follows the local snapshot
  (line 26169) and Forever's
  [SimpleFrame API documentation](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_APIDocumentationGenerated/SimpleFrameAPIDocumentation.lua).
- `Frame:SetScript` takes a script name and a nullable function, following the
  local snapshot (line 27253) and Forever's
  [SimpleScriptRegion API documentation](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_APIDocumentationGenerated/SimpleScriptRegionAPIDocumentation.lua).
  Only `OnEvent` is modeled. Its complete callback signature and event-specific
  payload types remain **unverified**; payloads are opaque `unknown` values.
- The full `CreateFrame` signature is **unverified** in this snapshot. Forever's
  [CallbackRegistry](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_SharedXMLBase/CallbackRegistry.lua)
  demonstrates one-argument frame creation and `SetScript` usage. The supplement
  deliberately models only `CreateFrame("Frame")`, as used by this addon.
- Forever's
  [ChatFrameUtil](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_ChatFrameBase/Shared/ChatFrameUtil.lua)
  imports `SlashCmdList` entries using `SLASH_<key><index>` globals. Its
  [ChatFrameEditBox](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_ChatFrameBase/Shared/ChatFrameEditBox.lua)
  dispatches handlers with trimmed message text and the edit box. The complete
  edit-box type remains **unverified** and is represented as `unknown`.

`CreateFrame` and `SlashCmdList` no longer need a globals whitelist. The
addon-defined `SLASH_TARGETFORMEFOREVER1` remains listed intentionally; it is a
registration global, not a missing client API definition.

## Updating the snapshot

1. Confirm the installed Forever client's build and interface in game with
   `/dump GetBuildInfo()`. Do not infer compatibility from Retail or Classic.
2. Follow the upstream [generation instructions](https://github.com/Atraeau/WoW-Addons/blob/main/docs/README.md)
   for a matching Forever export. The generator named in the snapshot header,
   `scripts/generate-lua-definitions.ps1`, lives upstream, not in this repository.
   Review its workflow separately; it uses an export addon and SavedVariables.
   Updating these development definitions adds no addon runtime dependency.
3. Replace the snapshot with the upstream-generated file as a whole; do not
   hand-edit it. Record the source revision, build, interface, export timestamp,
   and SHA-256 here. Review the TOC interface against the actual client.
4. Check whether upstream now defines `Frame`, `CreateFrame`, `SlashCmdList`, or
   the supplemental aliases. Remove or adjust overlapping supplemental entries
   before accepting the new snapshot. Keep missing definitions in the supplement.
5. Run Lua Language Server with Lua 5.1 and this workspace's settings. Check for
   syntax, duplicate-definition, undefined-global, and call-signature diagnostics.
   Existing malformed annotations and flattened widget methods in the upstream
   snapshot remain upstream limitations; do not suppress all diagnostics to hide them.
6. In Forever, verify addon discovery, the login message, and `/tfm` output without
   Lua errors. Static typing does not establish in-game API compatibility.
