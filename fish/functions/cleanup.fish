function cleanup -d 'Clean history & cache files'
  argparse 'a' 't' 'v' 'I' -- $argv ^/dev/null

  if [ $status -ne 0 ]
      echo 'usage: ch -a -t -v -I'
      return 1
  end

  set -l files (find $HOME -maxdepth 2 -type f -iname '*history')
  set -l shada_file ~/.local/share/nvim/shada/main.shada

  if set -q _flag_a; or set -q _flag_t
    echo yes | history --clear > /dev/null
  end

  if set -q _flag_a; or set -q _flag_v
    set files $files ~/.config/nvim/vim{backup,swap,view,undo}/*
  end

  if set -q _flag_a; and set -q _flag_v; and test -e $shada_file
    set files $files $shada_file
  end

  if count $files > /dev/null; and test (echo $files) != ''
    if set -q _flag_I
      echo 'To be removed:' \n$files
      rm -I $files

    else
      rm -i $files
    end
  end
end
