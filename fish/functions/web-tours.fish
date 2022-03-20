function web-tours
    podman run \
        --publish 8080:8080 \
        --publish 5901:5901 \
        --mount type=bind,source="/home/nodxine/.local/bin/Web Tours",target=/root/www \
        --cpuset-cpus 0 \
        --memory 2g \
        --tz America/Bogota \
        --workdir /root/www \
        --detach \
        --name web-tours \
        fullaxx/ubuntu-desktop-wine32
end
