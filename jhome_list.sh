#!/usr/bin/env bash

. lib/constants.sh

# use plutil read plist from stdin, convert to json and output to stdout
jdk_array="$(${JAVA_HOME_CMD} -X | plutil -convert json - -o - | jq -c '.[]')"

# # for 循环中，修改 IFS 来正确遍历 jdk_array
# old_ifs="${IFS}"
# IFS=$'\n'
# for jdk in ${jdk_array[@]}; do
#     echo ${jdk}
# done
# IFS="$old_ifs"

# for jdk in 
# readarray 等同于 read -a

# while 循环中，使用 read 命令配合修改 IFS 来正确遍历 jdk_array
# 因为 read 只能从 stdin 中读取内容，所以需要使用 Here String 来讲变量的值写入到 stdin 中
# while IFS= read -r jdk; do
while read jdk; do
    # echo ${jdk}
    arch=$(jq '.JVMArch' <<< ${jdk})
    version=$(jq '.JVMVersion' <<< ${jdk})
    path=$(jq '.JVMHomePath' <<< ${jdk})
    echo "${version}(${arch}) - ${path}"
done <<< "${jdk_array}"