#!/usr/bin/env bash
# File: ~/bin/font-diagnostics.sh
# Purpose: Query current font settings across system and applications

echo "===== FONT DIAGNOSTICS ====="
echo "Monitor: Dell P3223QE + laptop screen"
echo "Kanshi scaling assumed (external monitor): 1.4"
echo

# ------------------------------
# 1️⃣ Fontconfig default
# ------------------------------
echo "Fontconfig monospace:"
fc-match monospace
echo

# ------------------------------
# 2️⃣ GTK fonts
# ------------------------------
echo "GTK default font:"
gsettings get org.gnome.desktop.interface font-name
echo "GTK monospace font:"
gsettings get org.gnome.desktop.interface monospace-font-name
echo

# ------------------------------
# 3️⃣ Sway font
# ------------------------------
SWAY_FONT=$(grep -E '^font ' ~/.config/sway/config | awk '{print $2,$3}')
echo "Sway font (bar / UI): $SWAY_FONT"
echo

# ------------------------------
# 4️⃣ Kitty terminal
# ------------------------------
if command -v kitty &>/dev/null; then
    echo "Kitty fonts:"
    grep font_family ~/.config/kitty/kitty.conf
    grep font_size ~/.config/kitty/kitty.conf
fi
echo

# ------------------------------
# 5️⃣ Neovim GUI font
# ------------------------------
NVIM_FONT=$(nvim --headless +'echo &guifont' +qa 2>/dev/null)
echo "Neovim GUI font: ${NVIM_FONT:-not set}"
echo

# ------------------------------
# 6️⃣ Tmux
# ------------------------------
TMUX_FONT="inherits terminal font"
if [ -n "$TMUX" ]; then
    echo "Tmux running → font: $TMUX_FONT"
else
    echo "Tmux not running → font: $TMUX_FONT"
fi
echo

# ------------------------------
# 7️⃣ Firefox / Thunderbird (via gsettings / fontconfig)
# ------------------------------
echo "Firefox / Thunderbird content monospace font:"
grep -E 'font.name.monospace' ~/.mozilla/firefox/*/prefs.js 2>/dev/null || echo "Use GUI settings (about:preferences)"
echo

# ------------------------------
# 8️⃣ Chrome / Chromium
# ------------------------------
echo "Chrome / Chromium content monospace font:"
grep -i monospace ~/.config/google-chrome/Default/Preferences 2>/dev/null \
  || grep -i monospace ~/.config/chromium/Default/Preferences 2>/dev/null \
  || echo "Use GUI settings (chrome://settings/fonts)"
echo

# ------------------------------
# 9️⃣ Font scaling sanity check
# ------------------------------
echo "Effective DPI / scale:"
echo "  XDG_SCALE / GTK_SCALE: $GDK_SCALE / $GDK_DPI_SCALE"
echo "  Wayland scaling: 1.4 (kanshi)"
echo

echo "===== END FONT DIAGNOSTICS ====="

