function mp32ogg -d 'Convert local mp3 files to ogg format'
  set -l quality 4

  if count $argv > /dev/null
    set quality $argv[1]
  end

  for file in (find . -name '*.mp3')
    echo "Converting [$file]"

    ffmpeg -i $file -acodec libvorbis -aq $quality (dirname $file)/(basename $file .mp3).ogg; and rm $file
  end
end
