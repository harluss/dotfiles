# .dotfiles for macOS Monterey

Dotfiles for my Mac Mini running macOS Monterey 12.2.

I wanted to automate the tedious process of setting up a new machine or an old one after a clean install.
And it worked! Well most of it worked... It still needs some tweaks here and there, but for the most part it worked well.

Keep in mind these are my settings and your mileage may vary...

- [The script will](https://github.com/harluss/dotfiles/tree/readme#the-script-will)
- [To do before next time](https://github.com/harluss/dotfiles/tree/readme#to-do-before-the-next-time)
- [Before clean install](https://github.com/harluss/dotfiles/tree/readme#before-clean-install)
  - [Backup/Sync stuff](https://github.com/harluss/dotfiles/tree/readme#backupsync-stuff)
  - [Deactivate licenses](https://github.com/harluss/dotfiles/tree/readme#deactivate-licenses)
  - [If selling Mac](https://github.com/harluss/dotfiles/tree/readme#if-selling-mac)
- [After clean install](https://github.com/harluss/dotfiles/tree/readme#after-clean-install)
  - [Run the script](https://github.com/harluss/dotfiles/tree/readme#run-the-script)
  - [Next steps](https://github.com/harluss/dotfiles/tree/readme#next-steps)
    - [System Preferences](https://github.com/harluss/dotfiles/tree/readme#system-preferences)
    - [Brave](https://github.com/harluss/dotfiles/tree/readme#brave)

## The script will:

- Create all hyperlinks to dotfiles from `config/` setting up shell and git.
- Create Code folder and subfolders.
- Install Meslo Nerd Font font - used by iTerm.
- Install Homebrew with brews and casks from `Brewfile`.
- Create hyperlink to VSCode's settings in `apps/vscode/settings/`.
- Install VSCode's extensions from `apps/vscode/extensions/`.
- Install Zsh plugins.
- Sync iTerm settings from `apps/iterm2/settings/`.
- Install NodeJS.
- Install JDKs.
- Install Python.
- Help you setup Brave, iTerm, Rectangle.
- Log you into GitHub CLI using SSH and change the cloned `.dotfiles` repo from HTTPS to SSH.
- Setup macOS System Preferences and Dock applications.

## To do before the next time:

- [ ] Check Brave Sync Chain.
- [ ] Check Intellij Settings Sync.
- [ ] Check VSCode Settings Sync.
- [ ] Automate Brave's setup using defaults.
- [ ] Automate Karabiner-Elements's setup using defaults.
- [ ] Automate Keyboard Maestro's setup using defaults.
- [ ] Automate Raycast's setup using defaults.
- [ ] Automate Rectangle's setup using defaults.
- [ ] Fix and expand automation of macOS System Preferences.
- [ ] Ask for git username and password before GitHub SSH setup.
- [ ] Ask for computer name (System Preferences)?
- [ ] Add `install.conf.yaml` profiles i.e. home and work, that would handle setups differently.
- [ ] Add conditional settings for laptop i.e. battery power management (System Preferences).
- [ ] Keep and eye on [mas account doesn't work on macOS 12 and later](https://github.com/mas-cli/mas/issues/417).
- [ ] Uninstall unwanted Apple software i.e. Garageband.
- [ ] Try [Aldente](https://github.com/davidwernhart/AlDente).
- [ ] Try [Little Snitch](https://www.obdev.at/support/littlesnitch).
- [ ] Find alternative to 1Password?
- [ ] Test and update MacOS settings on Ventura.
- [ ] Test on Apple silicon.

## Before clean install

### Backup/Sync stuff:

- Backup whatever files need backing up.
- Brave Browser - export bookmarks (currently Sync Chain between macOS and iOS only syncs bookmarks and even that is broken).
- Brewfile - update brews and casks: `brew bundle dump --file=~/.dotfiles/Brewfile`.
- IntelliJ - export settings.
- Karabiner Elements - export settings.
- Keyboard Maestro - export settings.
- Raycast - export settings.
- VSCode - extensions: `code --list-extensions > ~/.dotfiles/apps/vscode/extensions/extensions.list`.

### Deactivate licenses:

...

### If selling Mac:

- iCloud: `System Preferences > Apple ID > Overview > Sign Out`.

## After clean install

### Run the script

**Note:** Initial system setup should take care of `iCloud`, `Theme`, `Siri`, `Time Machine`, `Analytics`, `Find My`, etc.

**Open Terminal and run**

```
git
```

It should trigger a popup asking if you want to install `command line developer tools`.

- Click `install`.

**Clone this repo**

```
git clone https://github.com/harluss/dotfiles.git ~/.dotfiles
```

**Navigate to cloned repo**

```
cd ~/.dotfiles
```

- Make sure to update your **email** and **user** in `config/gitconfig` before next step!

**Run the script**

```
./install
```

- You will be asked for password and permissions in the process.

**Type `y` when prompted**

```
Open App Store, so you can sign in? [y/n]:
```

- Make sure you're signed into App Store (should be handled by the initial system setup).
- Hit `Cmd+Q` to quit the app and continue with the installation (this step might take a while).

```
Do you want to set up other apps? [y/n]:
```

- Follow the next prompts typing `y` and hitting `[Enter]` whenever you're ready to move to the next one.

```
Brave Browser - Open the app, so you can set it as the default browser and sync settings? [y/n]
```

- Set as Default Browser (will be used to setup SSH with GitHub).
- Keep in mind Sync Chain is broken atm, so import bookmarks and change browser settings manually.

```
iTerm - Open the app, co you can set it up as the default Term? [y/n]
```

- Make it the default terminal: `iTerm2 (Menu Item) > Make iTerm2 Default Term`.

```
Rectangle - Open the app, so you can set it up? [y/n]
```

- Select `Spectacle` style shortcuts.

```
Git - Do you want to set up SSH? [y/n]
```

This will trigger `gh auth login` - GitHub CLI.

- Select `id_ed25519_github` when asked to upload your public SSH key and follow the instructions.

```
Do you want to set up macOS System Preferences? [y/n]
```

Will change some System Preferences and Dock applications.

```
Reboot is required for some changes to take effect. Reboot now? [y/n]
```

Will Reebot...

### Next steps

Brave Browser:

- Import settings: `Settings > Get Started > Import Bookmarks & Settings`

Karabiner-Elements:

- Import settings: `Preferences > Misc > Export & Import`

Keyboard Maestro:

- Import macros: `File > Import > Import Macros`

Raycast:

- Import settings: `Settings > Advanced > Import`

Rectangle:

- Import settings: `Preferences > Import`

#### System Preferences

---

- [x] Handled by script
- [ ] To be set manually

---

- [x] `General > Appearance: Dark`
- [x] `General > Click in the scroll bar to: Jump to the spot that's clicked`
- [x] `General > Default web browser: Brave Browser`
- [x] `General > Ask to keep changes when closing documents: Check`
- [x] `Desktop & Screen Saver > Show screen saver after: Uncheck`
- [x] `Dock & Menu Bar > Dock > Size`
- [x] `Dock & Menu Bar > Dock > Magnification: Check`
- [x] `Dock & Menu Bar > Position on screen: Left`
- [x] `Dock & Menu Bar > Minimise windows using: Scale effect`
- [x] `Dock & Menu Bar > Minimise windows into application icon: Uncheck`
- [x] `Dock & Menu Bar > Show recent application in Dock: Uncheck`
- [x] `Dock & Menu Bar > Bluetooth > Show in Menu Bar: Check`
- [x] `Dock & Menu Bar > Sound > Show in Menu Bar: Check (Always)`
- [x] `Dock & Menu Bar > Spotlight > Show in Menu Bar: Uncheck`
- [x] `Dock & Menu Bar > Siri > Show in Menu Bar: Uncheck`
- [x] `Dock & Menu Bar > Time Machine > Show in Menu Bar: Uncheck`
- [x] `Mission Control > Automatically rearrange Spaces based on most recent use: Uncheck`
- [ ] `Notifications & Focus > Notifications > Check settings`
- [ ] `Accessibility > Pointer Control > Trackpad Options > Enable dragging > three finger drag`
- [ ] `Accessibility > Zoom > Use scroll gesture with the (Ctrl (^)) modifier key to zoom`
- [ ] `Accessibility > Zoom > Advanced > Appearance > When zoomed in, the screen image moves: Only when the pointer reaches an edge`
- [ ] `Security & Privacy > General: Require password: Check (5 sec)`
- [ ] `Security & Privacy > Firewall: Turn on firewall `
- [ ] `Security & Privacy > Firewall > Firewall Options > Automatically allow builtin soft to receive incloming connections: Uncheck`
- [ ] `Security & Privacy > Firewall > Firewall Options > Automatically allow downloaded soft to receive incloming connections: Uncheck`
- [ ] `Security & Privacy > Firewall > Firewall Options > Enable stealth mode: Check`
- [x] `Security & Privacy > Privacy > Advertising: Limit ad tracking: Check`
- [ ] `Security & Privacy > Privacy > Check permissions`
- [ ] `Sharing > Computer Name:`
- [ ] `Network > Advanced > DNS: 1.1.1.1 / 1.0.0.1 / 8.8.8.8 / 8.8.4.4`
- [x] `Sound > Play sound on startup: Uncheck`
- [x] `Keyboard > Text > Uncheck all options`
- [x] `Keyboard > Shortcuts > Spotlight > Show Spotlight search: Uncheck`
- [x] `Trackpad > Point & Click > Tap to click: Check`
- [x] `Trackpad > More Gestures > App Expose: Check (Swipe down with four fingers)`
- [ ] `Displays > Night Shift > Sunset to Sunrise`
- [x] `Energy Saver > Wake for network access: Uncheck`
- [x] `Energy Saver > Prevent computer from sleeping automatically when the display is off: Uncheck`
- [x] `Finder > Preferences > General > New Finder windows show: Home`
- [x] `Finder > Preferences > General > Show these items on the desktop > Connected Servers: Check`
- [ ] `Finder > Preferences > Sidebar > Check/Uncheck what needed`
- [x] `Finder > Preferences > Advanced > Show all file extensions: Check`
- [x] `Finder > Preferences > Advanced > Show warning before changing an extension: Uncheck`
- [x] `Finder > Preferences > Advanced > Keep folders on top > In windows when sorting by name: Check`
- [x] `Finder > Preferences > Advanced > Keep folders on top > On Desktop: Check`
- [x] `Finder > Preferences > Advanced > When performing a search: Search the Current Folder`
- [x] `Finder > Preferences > View menu > Show Status Bar`
- [x] `Finder > Preferences > View menu > Show Path Bar`
- [ ] `Finder > View Menu > View Options > Calculate all size`
- [x] `User Folder (right click on any folder inside) > Show View Options > Show Library Folder`
- [x] `Right click on desktop > Show View Options > Show item info: Check`
- [ ] `Right click on desktop > Use Stacks`
- [x] `Hidden: Screenshot > Disable shadow`

#### Brave

- `Get started > Profile name and icon: <YOUR_NAME>`
- `Get started > Set as default browser`
- `Appearance > Hide Brave Rewards button: Check`
- `Appearance > Always show bookmarks on new tab page: Uncheck`
- `Appearance > Always show full URLs: Check`
- `Appearance > Show warning before quitting with Cmd+Q: Check`
- `New tab page > New tab page shows: Blank page`
- `Shields > Default view: Advanced view`
- `Shields > Trackers & ads blocking: Aggressive`
- `Fingerprinting blocking: Strict`
- `Social media blocking > Allow Google login buttons on third-part sites: Uncheck`
- `Social media blocking > Allow Facebook logins and embedded posts: Uncheck`
- `Social media blocking > Allow Twitter embedded tweets: Uncheck`
- `Security and privacy > Allow privacy-preserving product analytics (P3A): Uncheck`
- `Security and privacy > Automatically send daily usage ping to Brave: Uncheck`
- `Security and privacy > Security > Always use secure connections: Check`
- `Search engine > Search engine used in the address bar: DuckduckGo`
- `Wallet > Show Brave Wallet icon on Toolbar: Uncheck`
- `Extensions > React Dev Tools (enable in Incognito mode)`
- `Extensions > Redux Dev Tools (enable in Incognito mode)`

**Note:** Sync is broken on macOS - iOS, keep an eye on updates. Until then, bookmarks must be imported manually.
