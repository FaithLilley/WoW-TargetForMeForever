---@meta
-- Editor-only definitions; never load this file from the addon's TOC.
-- Sources, scope, and verification notes: ../docs/API.md.

-- UNVERIFIED: the complete OnEvent callback signature/payload types are not
-- specified by the snapshot. Model self/event plus opaque payloads only.
---@alias TFMForeverEventHandler fun(self: Frame, event: string, ...: unknown)

-- Minimal Frame surface used by Core.lua, not a complete widget definition.
-- RegisterEvent's argument and return type come from the build-70170 snapshot.
-- SetScript accepts a function or nil; only OnEvent is modeled here.
---@class Frame
---@field RegisterEvent fun(self: Frame, eventName: string): boolean
---@field SetScript fun(self: Frame, scriptTypeName: "OnEvent", script: TFMForeverEventHandler?)

-- UNVERIFIED: the full CreateFrame signature is absent from the snapshot.
-- Forever FrameXML demonstrates one-argument frame creation; expose only the
-- plain Frame form used by Core.lua. Other frame types/arguments are unmodeled.
---@param frameType "Frame"
---@return Frame frame
function CreateFrame(frameType) end

-- Forever FrameXML dispatches slash handlers with trimmed text and the edit box.
-- UNVERIFIED: the edit box's complete widget type is intentionally left opaque.
---@alias TFMForeverSlashHandler fun(message: string, editBox: unknown)

---@type table<string, TFMForeverSlashHandler>
SlashCmdList = {}
