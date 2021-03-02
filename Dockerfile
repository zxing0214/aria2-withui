FROM zxing/alpine

# webui + aria2
RUN apk update ;\
	apk --no-cache add aria2 busybox curl unzip ;\
	# gosu 
	GITHUB_REPO="https://github.com/tianon/gosu" ;\
  	LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "[0-9].[0-9]*"` ;\
    curl -L $GITHUB_REPO"/releases/download/"$LATEST"/gosu-amd64" > /usr/local/bin/gosu ;\
    chmod +x /usr/local/bin/gosu ;\
	# goreman supervisor
	GITHUB_REPO="https://github.com/mattn/goreman" ;\
    LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "v[0-9]*.[0-9]*.[0-9]*"` ;\
    curl -L "${GITHUB_REPO}/releases/download/${LATEST}/goreman_${LATEST}_linux_amd64.tar.gz" > goreman.zip ;\
    unzip goreman.zip && mv /goreman /usr/local/bin/goreman && rm -R goreman* ;\
	# setup Procfile
	echo "web: gosu root /bin/busybox httpd -f -p 8080 -h /webui-aria2\nbackend: gosu root /usr/bin/aria2c --enable-rpc --rpc-listen-all --dir=/data" > Procfile


ADD ./docs /webui-aria2

# aria2 downloads directory
VOLUME /data
# aria2 RPC port, map as-is or reconfigure webui
EXPOSE 6800/tcp
# webui static content web server, map wherever is convenient
EXPOSE 8080/tcp

CMD ["start"]
ENTRYPOINT ["/usr/local/bin/goreman"]