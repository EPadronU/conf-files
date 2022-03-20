function gjcp -d 'Generate the java classpath from the given root directory'
    set -l argv_length (count $argv)
    set -l home_path ":."
    set -l jar_filter ""

    if test \( $argv_length -lt 1 \)
        echo "You have to indicate the root directory"
        return 1
    end

    if test ! \( -d $argv[1] \)
        echo "$argv[1] is not a directory"
        return 1
    end

    if test \( $argv_length -ge 2 \)
        if test \( $argv[2] = homeless \) -o \( $argv[2] = H \)
            set home_path ""

            if test \( $argv_length -ge 3 \)
                set jar_filter $argv[3..-1]
            end

        else
            set jar_filter $argv[2..-1]
        end
    end

    # Separate the jar names by \|
    set jar_filter (echo $jar_filter | sed 's/ /\\\\|/')

    if test -n $jar_filter
        echo (find $argv[1] -name '*.jar' -printf '%p:' | sed "s/[^:]*\($jar_filter\)[^:]*://gI" | sed 's/:$//')$home_path

    else
        echo (find $argv[1] -name '*.jar' -printf '%p:' | sed 's/:$//')$home_path
    end
end
