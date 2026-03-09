# NixOS Config Structure

```
nixos-config/
├── flake.nix                        # Entry point — inputs, outputs, nixosSystem
├── hardware-configuration.nix       # Auto-generated, do not edit manually
│
├── modules/
│   ├── hardware/
│   │   ├── nvidia.nix               # NVIDIA Prime offload, AMD+NVIDIA hybrid
│   │   ├── audio.nix                # Pipewire, rtkit
│   │   ├── bluetooth.nix            # Bluetooth + blueman
│   │   └── display.nix              # OLED font rendering, DPI, font packages
│   │
│   ├── system/
│   │   ├── boot.nix                 # Bootloader, latest kernel, silent boot
│   │   ├── locale.nix               # Timezone (Asia/Aqtau), locale settings
│   │   ├── networking.nix           # Hostname, NetworkManager
│   │   ├── security.nix             # sudo, polkit
│   │   ├── services.nix             # Printing, flatpak, fprintd, XDG portals
│   │   ├── users.nix                # abzal user, groups, fish shell
│   │   └── nix.nix                  # Flakes, GC, allowUnfree, stateVersion
│   │
│   └── programs/
│       ├── suckless.nix             # dwm, dmenu, st, slstatus, slock overrides
│       ├── xorg.nix                 # Xserver, startx, libinput, xorg utils
│       ├── packages.nix             # All system packages (apps, games, dev)
│       ├── shell.nix                # Fish, starship, fzf
│       └── virtualisation.nix       # VirtualBox
│
├── home/                            # home-manager tree
│   ├── default.nix                  # home-manager entry, imports, stateVersion
│   └── modules/
│       ├── xsession.nix             # .xsession (dwm launch), feh, slstatus, Xresources
│       ├── shell.nix                # fish aliases, env vars, starship
│       ├── dunst.nix                # Notification daemon config
│       └── git.nix                  # Git user, defaultBranch, rebase
│
└── suckless/                        # (optional) local patched sources
    ├── dwm/                         # Put your patched dwm source here
    │   └── config.h                 # Your dwm config (not managed by Nix)
    ├── dmenu/
    │   └── config.h
    ├── st/
    │   └── config.h
    ├── slstatus/
    │   └── config.h
    └── slock/
        └── config.h
```

---

## How patching works

In `modules/programs/suckless.nix`, each tool is overridden like this:

```nix
dwm = pkgs.dwm.overrideAttrs (old: {
  # Option A — use your GitHub fork:
  src = pkgs.fetchFromGitHub {
    owner  = "youruser";
    repo   = "dwm";
    rev    = "HEAD";
    sha256 = pkgs.lib.fakeSha256; # run build once to get real hash
  };

  # Option B — use a local patched directory:
  # src = ./suckless/dwm;
});
```

Run once with `fakeSha256`, let it fail, copy the correct hash from the error, paste it in.

---

## First-time setup

```sh
# 1. Clone or create the repo
git clone <your-repo> ~/nixos-config
cd ~/nixos-config

# 2. Copy hardware config
cp /etc/nixos/hardware-configuration.nix .

# 3. Edit suckless.nix — set your GitHub usernames or switch to local src
# 4. Edit home/modules/git.nix — set your email

# 5. Build
sudo nixos-rebuild switch --flake .#nixos
```

---

## Useful aliases (set in home/modules/shell.nix)

| Alias     | Command                                               |
|-----------|-------------------------------------------------------|
| `rebuild` | `sudo nixos-rebuild switch --flake ~/nixos-config#nixos` |
| `vim`     | `nvim`                                                |
| `ll`      | `ls -lah --color=auto`                               |

---

## NVIDIA Prime — offload usage

```sh
# Run a specific app on the NVIDIA GPU:
nvidia-offload <app>

# e.g.:
nvidia-offload blender
nvidia-offload steam
```

`nvidia-offload` is provided automatically by `prime.offload.enableOffloadCmd = true`.

---

## Adding a new module

1. Create `modules/system/mymodule.nix` or `modules/programs/mymodule.nix`
2. Add to the `modules = [ ... ]` list in `flake.nix`
3. Rebuild

---

## Suckless patching workflow

```sh
# Clone upstream
git clone https://git.suckless.org/dwm suckless/dwm

# Apply patches manually
cd suckless/dwm
patch -p1 < some-patch.diff

# Edit your config.h (Nix won't touch it)
$EDITOR config.h

# In suckless.nix, switch to local src:
# src = ./suckless/dwm;

# Rebuild
rebuild
```
