function fish_prompt
    echo -n (set_color ff8a00)(prompt_pwd)' '
    if fish_is_root_user
        echo -n (set_color cd0000)'诏'
    else
        echo -n (set_color ff6c00)'令'
    end
    echo -n (set_color ff6c00)'❯ '
    set_color normal
end
