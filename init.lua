require "plugins"
require "utils"
require "typedin"
require "mappings" -- should be a good idea to move all plugin bindings into this file

--[[
   syntax highlighting is handled by the treesitter engine NOT lsp cf: tj derieves

   lsp config is just a helper plugin that manages lsp configuration

   capital K is the defacto shortcut to documentation in the vim world
]]
