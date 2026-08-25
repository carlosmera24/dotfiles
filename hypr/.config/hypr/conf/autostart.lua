-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  -- hl.exec_cmd("waybar & hyprpaper & firefox")
  -- hl.exec_cmd("nm-applet")
  -- hl.exec_cmd("nm-applet & ashell &  mako")

  -- nm-applet y blueman-applet
  -- hl.exec_cmd("nm-applet & blueman-applet")
  -- hl.exec_cmd("nm-applet")

  -- Activar notificaciones try para ashell 
  hl.exec_cmd("/usr/lib/libdbusmenu-gtk3/status-notifier-watcher")

  -- Ashell
  hl.exec_cmd("ashell")

  -- Wallpaper --
  hl.exec_cmd("wpaperd")

  -- Bloqueo de pantalla --
  -- hypridle - cambio la gestión del bloqueo de pantalla para una integración más nativa
  hl.exec_cmd("hypridle")

  -- genome-keyring
  hl.exec_cmd("gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY SSH_AUTH_SOCK")

  -- Cursor, requiere instalar volantes-cursor (AUR) o descargar y copiar en /usr/share/icons
  hl.exec_cmd("hyprctl setcursor volantes_cursors 24")

  -- Hyprpolkit
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- Notificador personalizado de batería baja
  hl.exec_cmd("~/.config/myscripts/battery-notify.sh")

  -- Definir workspace por default, solución alternativa para no usar default:true en workspaces,
  -- ya que genera conflicto entre equipos, y solo tomará como default el primer workspace definido
  hl.exec_cmd("hyprctl dispatch 'hl.dsp.focus({ workspace = 1 })'")

  -- Snappy
  hl.exec_cmd("snappy-switcher --daemon")
end)
