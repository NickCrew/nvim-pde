# Neovim Dark Mode

This is from [maxbucknell](https://gist.github.com/nick/6f111b2a04132ab922f29cf631abd58b) and altered for my
purposes.

## Alfred

I have a "lights" workflow in Alfred, that is a little AppleScript
  
```
tell application "System Events"
	tell appearance preferences
		set dark mode to not dark mode
	end tell
end tell
```

This just toggles light vs. dark mode, and isn't related to the rest of it, but it's a neat utility, because I work in different places that have different lighting situations.

## Shell

I wrote another tiny little Apple Script utility to tell me if dark mode is active, which Vim has used on startup for ages to know whether it should use a light or dark theme.

```
#! /usr/bin/env osascript
tell application "System Events"
	tell appearance preferences
		dark mode
	end tell
end tell
```

I use this inside Neovim to know whether the theme should be dark or light. A caveat here is that it echoes `true` or `false`, which isn't very Unixy, but Apple Script isn't very unixy and it's cool that we can even run it like this.

## iTerm

Make sure you have a profile called "Light", and a profile called "Dark" inside iTerm.

I get iTerm to change the terminal theme when the system theme changes with a custom script built using their Python plugin API. It also sends a notification to every running Neovim instance using Neovim's RPC socket API, which is really neat.

I have a custom Python Script in iTerm that listens for changes to the system theme. You'll need to do "Scripts > Manage > New Python Script", then choose "Full Environment", then choose "Long-Running Daemon". In the dialog that opens up, make a directory called "AutoLaunch" inside the "Scripts" directory that is open, and name your script. I call it "dark_mode_neo", because this is a second attempt, but you can call it whatever you like. In the "PyPI Dependencies" field, enter "pynvim", so we can talk to Neovim.

The actual scripts you'll need to create are files in this gist. Both files should be added to the plugin directory. I had to make two files and call the second one as a separate process because both the iTerm API and the pynvim package use asyncio, and only one event loop is allowed to be created inside a single Python process, and neither package seemed amenable to being given an event loop. You will need to change the directories on line 22 to be correct for you.

## Neovim

Then I recommend putting `darkmodesocket.vim` into your autoload directory, and then calling `listenForLights` on startup:

```
augroup startUp
    autocmd!

    autocmd VimEnter * call darkmodesocket#listenForLights
augroup END
```
