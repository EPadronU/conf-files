function insert-completions
  # We need to remove the descriptions, and we also don't want everything to be inserted on separate lines
  commandline -i -- (complete --do-complete | string replace -r '\t.*' '' | string join " ")
end
