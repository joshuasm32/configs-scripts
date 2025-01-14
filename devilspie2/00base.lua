--[[ All-in one config script for simple matches.
do_rules(
    {app="etc", max="true", ...},
    {class="etc", size={w=500, h=500}, ...},
    ...
)

MATCH CRITERIA
app = application name
class = window class
name = title bar contents
type = window type, specified without the WINDOW_TYPE_ prefix and whatever case
       you want. if nil, assumed to be normal. if *, all types.
exc_name = exclude window name
exc_type = exclude window type

ACTION CRITERIA
alpha = window opacity
pos = a table with fields x and y for the desired position
size = a table with fields w and h for the desired size
wksp = target workspace starting from 1
vport = target viewport starting from 1
no_task = hide from tasklist
no_page = hide from pager
set_type = change the window's type. see type above.
top, bottom, shade, max, min, undeco, stick, pin = do these to the window.
]]


function do_rules(...)
    for _, v in ipairs(arg) do
        if
            (not v.app or v.app == get_application_name()) and
            (not v.class or v.class == get_window_class()) and
            (not v.name or v.name == get_window_name()) and
            (not v.exc_name or v.class ~= get_window_name()) and
            (v.type == "*" or
                "WINDOW_TYPE_"..string.upper(v.type or "normal") ==
                get_window_type()) and
            (not v.exc_type or "WINDOW_TYPE_"..string.upper(v.exc_type) ~=
                get_window_type())
        then
            if v.pos then set_window_position(v.pos.x, v.pos.y) end
            if v.size then set_window_size(v.size.w, v.size.h) end
            if v.alpha then set_opacity(v.alpha) end
            if v.wksp then
                --change_workspace(v.wksp)
                set_window_workspace(v.wksp)
            end
            if v.vport then set_viewport(v.vport) end
            if v.no_task then set_skip_tasklist(true) end
            if v.no_page then set_skip_pager(true) end
            if v.top then make_always_on_top() end
            if v.above then set_window_above() end
            if v.below then set_window_below() end
            if v.shade then shade() end
            if v.max then maximize() end
            if v.min then minimize() end
            if v.undeco then undecorate_window() end
            if v.pin then pin_window() end
            if v.stick then stick_window() end
            if v.set_type then
                set_window_type("WINDOW_TYPE_"..string.upper(v.set_type))
            end
        end
    end
end
