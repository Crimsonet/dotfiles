function fish_prompt
    echo -n (set_color ff8a00)(prompt_pwd)' '
    if fish_is_root_user
        echo -n (set_color e50000)'诏: '
    else
        echo -n (set_color ff6c00)'谕: '
    end
    set_color normal
end
