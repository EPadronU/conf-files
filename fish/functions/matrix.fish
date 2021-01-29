function matrix -d 'Shows the Matrix Code'
  set_color 0f0
  set_color -b black

  set -l until

  if count $argv > /dev/null
    set until $argv[1]
  else
    set until 150
  end

  while test $until -gt 0
    set -l characters

    for i in (seq 4)
      set characters $characters (i2c (math (random) \% 94 + 32))
    end

    for i in (seq 8)
      printf "%c   %c   %c   %c   " $characters
    end

    printf "%c   %c\n" $characters[1..2]

    set until (math $until - 1)
  end

  i2c 0
end
