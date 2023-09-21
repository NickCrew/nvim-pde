local ok, um = pcall(require, "settings.mappings.wk")
if not ok then
  print("Failed to load user's custom mappings")
else
  um.load_wk()
end

