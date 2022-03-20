function sdk-use -d "Use the lattest installed version of a candidate given its major fragment"
    if not type sdk &>/dev/null
        echo "sdkman was not found"
        return 1
    end

    if test (count $argv) -lt 2
        echo "sdk-use <candidate> <version>"
        echo -e "\te.g. sdk-use java 14"
        return -1
    end

    set -l candidate $argv[1]
    set -l major_version $argv[2]

    set -l path ~/.sdkman/candidates/$candidate

    if test ! \( -d $path \)
        echo "No matching candidate found"
        return -2
    end

    set -l version_path (ls $path | egrep "^$major_version\." | sort | head -n 1)

    if test -z $version_path
        echo "No matching version found"
        return -3
    end

    sdk use $candidate (basename $version_path)
end
