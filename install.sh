#!/system/bin/sh

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

# Set what you want to display when installing your module
print_modname() {
ui_print " ┏━━━┓━┏┓┏┓┏━━┓━┏━┏┓┏━━┓"
sleep 1
ui_print " ┃┏━┛━┃┃┃┃┃┃┏┓┃━┃┏┃┃┃┏┓┃"
sleep 1
ui_print " ┃┗━┓━┃┃┃┃┃┃┃┃┃━┃┃┃┃┃┃┃┃"
sleep 1
ui_print " ┗━━┛━┗┛┗┛┗┛┗┛┗┛━┗┛┗┛┗┛┗┛"
sleep 1
ui_print ""
ui_print " Mvast Tweak is always your choice"
sleep 1
ui_print ""
ui_print " Powered by REXX FLOSS™"
ui_print " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
sleep 1

unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
chmod +x "$MODPATH/system/bin/battery"
chmod +x "$MODPATH/system/bin/balanced"
chmod +x "$MODPATH/system/bin/performance"
chmod +x "$MODPATH/system/bin/gaming"

unzip -o "$ZIPFILE" 'Mvast.apk' -d "/data/local/tmp" >&2

settings put global package_verifier_enable 0

if ! pm install "/data/local/tmp/Mvast.apk" >/dev/null 2>&1; then
  ui_print "Installation in data/local/tmp failed, installing directly..."
  pm install -r "$MODPATH/system/Mvast.apk" >/dev/null 2>&1
fi

rm "/data/local/tmp/Mvast.apk" >/dev/null 2>&1

}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/system/bin 0 0 0777 0755
}
