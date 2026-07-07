-- inject-metadata.lua — Pandoc Lua filter
--
-- Replaces {{title}} and {{author}} placeholders in the document body
-- with values from book-settings.yaml (passed via --metadata-file).
--
-- Usage: added automatically by the atelier build command.

local function meta_string(val)
  if val == nil then return "" end
  return pandoc.utils.stringify(val)
end

function Pandoc(doc)
  local title  = meta_string(doc.meta.title)
  local author = meta_string(doc.meta.author)

  return doc:walk({
    -- Replace {{title}} and {{author}} placeholders in body text.
    Str = function(el)
      local s = el.text
        :gsub("{{title}}",  title)
        :gsub("{{author}}", author)
      if s ~= el.text then return pandoc.Str(s) end
    end,

    -- Center standalone images in LaTeX/PDF output.
    -- A paragraph containing only one image is treated as a block figure.
    Para = function(el)
      if FORMAT ~= "latex" then return nil end
      if #el.content == 1 and el.content[1].t == "Image" then
        return {
          pandoc.RawBlock("latex", "\\begin{center}"),
          pandoc.Para(el.content),
          pandoc.RawBlock("latex", "\\end{center}"),
        }
      end
    end,
  })
end
