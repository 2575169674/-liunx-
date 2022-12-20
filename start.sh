echo && echo -e "ConstOS7.6常用脚本---Enols
安装python提示如果是第一次安装请先安装OpenSSL 1.1.1
"

OpenSSL111Install(){
    wget https://github.com/openssl/openssl/archive/OpenSSL_1_1_1d.tar.gz
    tar -zxvf OpenSSL_1_1_1d.tar.gz
    cd openssl-1.1.1s 
    ./config shared --openssldir=/usr/local/openssl --prefix=/usr/local/openssl
    make && make install
    mv /usr/bin/openssl /usr/bin/openssl.bak
    ln -sf /usr/local/openssl/bin/openssl /usr/bin/openssl
    echo "/usr/local/openssl/lib" >> /etc/ld.so.conf
    cd -
}

Python310Install(){
    whereis python3 |xargs rm -frv
    whereis pip3 |xargs rm -frv
    rm -rf /usr/bin/python3
    rm -rf /usr/bin/pip3
    yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make -y
    yum install libffi-devel -y 
    wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz

    tar -zxvf Python-3.10.9.tgz

    cd Python-3.10.9

    ./configure --prefix=/python3/Python-3.10.9  --with-ssl

    make && make install

    ln -s /python3/Python-3.10.9/bin/python3 /usr/bin/python3
    ln -s /python3/Python-3.10.9/bin/pip3 /usr/bin/pip3
    cd -

}


echo "1:安装Python3.10
2:安装OpenSSL 1.1.1"
read -e -p " 请输入数字:" num
case "$num" in
1)
    read -e -p "警告!
    这会删除你原有的python3和pip3按任意键继续Ctrl+C退出"
    Python310Install
    ;;
2)
    read -e -p "警告!
    这会删除你原有的OpenSSL按任意键继续Ctrl+C退出"
    OpenSSL111Install
    ;;
*)
    echo
    echo -e " ${Error} 请输入正确的数字"
    ;;
esac