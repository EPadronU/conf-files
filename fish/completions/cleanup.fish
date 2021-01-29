complete -c cleanup -f
complete -c cleanup -s a -d 'Delete everything'
complete -c cleanup -s t -x -d 'Delete only the history'
complete -c cleanup -s v -d 'Delete only nvim-related files but the shada one'
complete -c cleanup -s I -d 'Prompt once before removing more than three files'
