cd C:/TANGJ15/code/Nginx/nginx
nmake clean
cd C:/TANGJ15/code/Nginx/nginx
mkdir -p objs
mkdir -p objs/lib
cd objs/lib
tar -xzf ../../pcre-8.39.tar.gz
tar -xzf ../../zlib-1.2.10.tar.gz
tar -xzf ../../openssl-1.0.2j.tar.gz
cd ../../
auto/configure --with-cc=cl --builddir=objs --prefix= \
--conf-path=conf/nginx.conf --pid-path=logs/nginx.pid \
--http-log-path=logs/access.log --error-log-path=logs/error.log \
--sbin-path=nginx.exe --http-client-body-temp-path=temp/client_body_temp \
--http-proxy-temp-path=temp/proxy_temp \
--http-fastcgi-temp-path=temp/fastcgi_temp \
--with-cc-opt='-DFD_SETSIZE=1024 -D__NO_MINGW_LFS /Ob0 -Zc:wchar_t -D_NGX_WIN32' \
--with-select_module --with-http_ssl_module --with-ipv6 --with-http_flv_module \
--with-http_mp4_module  --with-http_stub_status_module \
--with-http_secure_link_module \
--http-scgi-temp-path=temp/scgi_temp --http-uwsgi-temp-path=temp/uwsgi_temp \
--with-http_realip_module \
--with-http_addition_module --with-http_sub_module --with-http_dav_module \
--with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module \
--with-http_random_index_module --with-http_slice_module \
--with-mail --with-stream   \
--with-http_ssl_module --with-mail_ssl_module --with-stream_ssl_module --with-ipv6 \
--with-pcre=objs/lib/pcre-8.39 \
--with-zlib=objs/lib/zlib-1.2.10 \
--with-openssl=objs/lib/openssl-1.0.2j \
--with-openssl-opt=no-asm \
--add-module=../nginx-sticky-module-ng-bitbucket \
--with-debug \

nmake -f objs/Makefile


echo -D_NGX_WIN32_CONFIG_H_INCLUDED_ -D__WATCOMC__
