# AGENTS.md - AstroNvim Configuration

## Build/Test Commands
- No build commands - Neovim configuration loads directly
- No test suite - test by opening `nvim` and checking plugin functionality
- Formatting: `stylua .` (uses `.stylua.toml` config)
- Linting: `selene .` (uses `selene.toml` config)

## Code Style Guidelines
- **Language**: Lua 5.1 (Neovim runtime)
- **Indentation**: 2 spaces (configured in `.stylua.toml`)
- **Line width**: 120 characters max
- **Quotes**: Auto-prefer double quotes
- **Function calls**: No parentheses when possible (`require "module"` not `require("module")`)

## File Structure
- `lua/plugins/` - Plugin configurations as LazySpec tables
- Each plugin file returns a LazySpec table with plugin setup
- Use `---@type LazySpec` annotation for type hints

## Naming Conventions
- Snake_case for file names
- Use descriptive plugin file names matching plugin purpose
- Leader key mappings use `<Leader>` prefix

## Error Handling
- Use `vim.notify()` for user messages
- Check plugin existence with `vim.fn.exists()` before calling commands
- Wrap plugin-specific code in conditional blocks