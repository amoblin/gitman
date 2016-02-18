(* Copyright (C) 2016 amoblin *)

property dialog_timeout : 30 -- set the amount of time before dialogs auto-answer.

on adding folder items to this_folder after receiving added_items
    try
        tell application "Finder"
            set current_path to (POSIX path of (target of front window as alias))
            do shell script ("cd \"" & current_path & "\"; /usr/local/bin/gitdisk-update")
        end tell
    on error the_error
        display dialog the_error buttons {"OK"} with icon caution with title "Error"
    end try
end adding folder items to
