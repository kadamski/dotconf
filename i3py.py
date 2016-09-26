#!/home/k/virtualenvs/i3pystatus/bin/python3
from i3pystatus import Status
from i3pystatus.mail import imap
import locale
import os.path
import configparser
locale.setlocale(locale.LC_ALL, 'pl_PL')

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%a %d.%m %H:%M",
                interval = 5,
                on_leftclick = "zenity --calendar")

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery",
                format="{status} [{consumption:.1f}W ]{percentage:.0f}%[ {remaining:%E%hh:%Mm}]",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "⚡"
    },)

# # This would look like this:
# # Discharging 6h:51m
# status.register("battery",
#     format="{status} {remaining:%E%hh:%Mm}",
#     alert=True,
#     alert_percentage=5,
#     status={
#         "DIS":  "Discharging",
#         "CHR":  "Charging",
#         "FULL": "Bat full",
#     },)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

status.register("cpu_usage", format="CPU: {usage}%")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",
    interval=3)


# Displays whether a DHCP client is running
# status.register("runwatch",
#     name="DHCP",
#     path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="enp0s25",
    format_up="{v4cidr}",)

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
#
# Note: requires both netifaces and basiciw
status.register("network",
    interface="wlp3s0",
    format_up="{essid} {quality:03.0f}%",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/tmp",
    format="{used}M",
    divisor=1024**2)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
backlight_driver = None
for bd in ('amdgpu_bl0', 'intel_backlight'):
    if os.path.exists('/sys/class/backlight/{}'.format(bd)):
        backlight_driver = bd
        break

if backlight_driver:
    status.register("backlight",
        format="☼ {percentage:.0f}%",
        on_upscroll="xbacklight +5",
        on_downscroll="xbacklight -5",
        backlight=backlight_driver)

status.register("pulseaudio",
    format="♪ {volume}%",)

config = configparser.ConfigParser()
config.read('{}/.i3/config-private.ini'.format(os.path.expanduser('~')))
try:
    status.register('mail',
                    backends=[imap.IMAP(
                        host=config.get('mail', 'host'),
                        username=config.get('mail', 'user'),
                        password=config.get('mail', 'pass'),
                    )],
                    interval=30,
                    format='M {unread}',
                    format_plural='M {unread}',
                    log_level=20,
                    hide_if_null=False, )
except (configparser.NoOptionError, configparser.NoSectionError):
   pass

status.run()
