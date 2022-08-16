#!/usr/bin/env bash

# JDK 安装脚本
# https://adoptium.net/zh-CN/temurin/releases?version=8
# https://aws.amazon.com/cn/corretto/?filtered-posts.sort-by=item.additionalFields.createdDate&filtered-posts.sort-order=desc

. lib/constants.sh

# latest/latest_checksum
type=latest

# 8
corretto_version=8

# x64/aarch64
# cpu_arch=aarch64
cpu_arch=x64

# windows/linux/macos
os=macos

# jre/jdk
package_type=jdk

# linux: deb/rpm/tar.gz
# windows: msi/zip
# macos: pkg/tar.gz
file_extension=tar.gz

install_folder=amazon-corretto-${corretto_version}-${cpu_arch}
install_path=${JVM_INSTALL_PATH}/${install_folder}

check_install() {
    ${JAVA_HOME_CMD} -x | grep $1 &> /dev/null
}

check_install ${install_path}
if [[ $? -eq 0 ]] ; then
    echo "${install_folder} has been installed"
    exit 0
fi

download_url=https://corretto.aws/downloads/${type}/amazon-corretto-${corretto_version}-${cpu_arch}-${os}-${package_type}.${file_extension}

# create install folder
echo "create install folder: ${install_path}"
sudo mkdir ${install_path}

# echo ${download_url} ${install_folder}

# curl -IL ${download_url}

# wget 前不添加 sudo 的话，管道后的 tar 命令会卡死不能执行
sudo wget -c ${download_url} -O - | sudo tar -xz -C ${install_path} --strip-components 1 