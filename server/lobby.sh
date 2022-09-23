#! /bin/bash

# カレントディレクトリ
HOME=$(cd $(dirname $0);pwd)

# 起動メモリ
MEMORY=1G

# Paper 最新版を確認
PROJECT="paper"
VERSION="1.16.5"

BUILD=`curl -fsSL https://papermc.io/api/v2/projects/${PROJECT}/versions/${VERSION} | jq "[.builds[]] | last"`
JAR=${PROJECT}-${VERSION}-${BUILD}.jar

# server ダウンロード
if [ ! -f $HOME/$JAR ];then
    # l削除
    rm -f $HOME/${PROJECT}*.jar
    # ダウンロード
    echo "https://papermc.io/api/v2/projects/${PROJECT}/versions/${VERSION}/builds/${BUILD}/downloads/${JAR}"
    if curl -o "${HOME}/${JAR}" -fsSL "https://papermc.io/api/v2/projects/${PROJECT}/versions/${VERSION}/builds/${BUILD}/downloads/${JAR}";then
        echo "DownloadSuccess"
    else
        echo "DownloadError" 1>&2
    fi
else
    echo $HOME/${PROJECT}-${VERSION} "is the latest build."
fi

if [ ! -f $HOME/eula.txt ];then
    java -jar -Xms512M -Xmx512M ${JAR} nogui
    sed -Ei "s/eula=.+/eula=${EULA}/" eula.txt
fi 

java -jar -Xms${MEMORY} -Xmx${MEMORY} ${JAR} nogui