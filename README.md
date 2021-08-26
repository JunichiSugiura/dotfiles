# dotfiles

dotfiles managed with
- [GNU stow](https://www.gnu.org/software/stow/)
- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [asdf](https://asdf-vm.com/#/)

## Installation

1. Sign in to App store manually (Temporary solution. See more: <https://github.com/mas-cli/mas/issues/164>)
2. Run install

```sh
curl -o - https://raw.githubusercontent.com/JunichiSugiura/dotfiles/master/packages/cli/scripts/dotfiles | sh
```

3. Start Yabai and skhd

```sh
brew services start yabai
brew services start skhd
# or
brew services start --all
```
Then allow accessibility permissions on `Security & Privacy` inside `System Preferences.app`

## Manual operations
haven't figure out ways to automate
- add google-japanese-ime to input sources
- `^space` to switch input source
- show battery percentage

## Installed Apps

Check [Brewfile](./Brewfile) for the latest bundle.

## Tutorial

If you like to learn how to create dotfiles, check out my [tutorial ](https://github.com/JunichiSugiura/tutorials/tree/master/dotfiles).
