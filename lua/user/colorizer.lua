local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

-- Defaults
--   RGB      = true;
--   RRGGBB   = true;
--   names    = false;
--   RRGGBBAA = false;
--   rgb_fn   = false; -- css rgb() and rgba() functions
--   hsl_fn   = false; -- css hsl() and hsla() functions
--   css      = false; --enable all features for css
--   css_fn   = false; --enable all functions for css
--   mode     = "background"; -- alternative is foreground

colorizer.setup({
  css = {css = true; css_fn = true}
})
