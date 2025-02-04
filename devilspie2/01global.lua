-- Rules common to all devices.
do_rules(
    --{app="Xfce Terminal", size={w=568, h=288}},
    --{app="Thunar", size={w=526, h=372}},
    {app="Xfce Terminal", alpha=0.80},
    {app="Thunar", size={w=408, h=387}},
    {app="Thunar", name="File Operation Progress", size={w=300, h=105}},
    {app="geany", size={w=622, h=411}},
    {app="syncthing-gtk", size={w=550, h=400}},
    {app="mirage", max=true},
    {name="Whisker Menu", type="dialog", alpha=0.88, size={w=350, h=380}}
)
