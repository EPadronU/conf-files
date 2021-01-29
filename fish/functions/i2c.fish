function i2c -d 'Transform the given integer into its corresponding ASCII character'
  if count $argv > /dev/null
    printf  "\\"(printf "%03o" $argv[1])
    return 0
  end

  return 1
end
