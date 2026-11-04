# AstroNvim Template

**NOTE:** This is for AstroNvim v6+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## CodeCompanion

Chat and inline interactions use GitHub Copilot's `gpt-6-astra` with a 1,000,000-token
context budget and high reasoning effort. The `copilot_astra` adapter in
`lua/plugins/user.lua` uses the Responses API; other Copilot interactions keep
their defaults. Long prompts may incur higher Copilot usage charges.

Requires a GitHub Copilot sign-in and access to this model. If Copilot stores its
token in `auth.db`, CodeCompanion also requires `sqlite3` on `PATH`.
