#!/bin/bash
clear
echo " :::::INSTALACAO ALFRESCO [parte 1]:::::"
echo " ::::::::::MAPROEx::::::::::::"
sleep 2
clear 

echo " [Aguarde a preparacao do ambiente]..."
sleep 2
clear 

echo "::INSTALACAO DAS DEPENDENCIAS::"
echo "-Criando usuario Alfreco" 

useradd alfresco -p alfresco -g sudo 
sleep 1
clear 
echo "-atualizando bibliotecas e configuracoes" 
sleep 1

sudo dpkg --configure -a
apt-get update
apt-get upgrade
apt-get purge openjdk-*

clear
echo "->bibliotecas e configuracoes atualizadas!" 
echo
clear
echo "- Preparar instalacao Java Developer Kit 7" 
echo " [Aguarde....]" 
sleep 3


sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
sudo apt-get install oracle-java7-set-default

clear 
echo "-> instalando ImageMagick..."
sleep 2

sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install ffmpeg
sudo dpkg --configure -a

clear 
echo "-> Instalando FFMPeg..."
sleep 2
sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next
sudo apt-get update
sudo apt-get install ffmpeg
sudo dpkg --configure -a

clear 
echo "->Instalando SWFTools"
echo
sleep 3 
sudo apt-get install libjpeg62 libgif4 libart-2.0-2
wget http://archive.canonical.com/pool/partner/s/swftools/swftools_0.9.0-0ubuntu2_amd64.deb
sudo chmod a+x swftools_0.9.0-0ubuntu2_amd64.deb
sudo dpkg -i swftools_0.9.0-0ubuntu2_amd64.deb
sudo rm swftools_0.9.0-0ubuntu2_amd64.deb

clear 
echo "-> Instalando LibreOffice..."
sudo apt-get install libreoffice

clear 
echo "-> Instalando Banco de Dados... " 
echo
echo "ATENCAO!!"
echo "Quando for solicitado uma senha digite: postgres"
sleep 5

sudo apt-get install postgresql postgresql-contrib
sudo passwd postgres

clear 
echo "-> Instalando Servidor Web... "
echo 
sleep 2
sudo mkdir -p /opt/alfresco
sudo chown alfresco /opt/alfresco
wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz

sudo mkdir /opt/alfresco/tomcat
sudo chmod 777 /opt/alfresco/tomcat
sudo tar -xvf apache-tomcat-7.0.65.tar.gz
sleep 3
sudo mv apache-tomcat-7.0.65/ /opt/alfresco/tomcat/
sudo chown -R alfresco /opt/alfresco/tomcat /opt/alfresco/tomcat/apache-tomcat-7.0.65/bin/startup.sh
ps -ef | grep java
sudo rm apache-tomcat-7.0.65.tar.gz

clear 
echo "[INICIANDO SERVIDOR WEB....]"
sleep 2
sudo /opt/alfresco/tomcat/apache-tomcat-7.0.65/bin/startup.sh
sleep 3
clear 
echo "::::PRIMEIRA PARTE FINALIZADA!:::"
echo "Ambiente levantado, aguarde orientacoes para configurar o banco de dados...."
sleep 4
clear
echo "Agora eh necessario criar um usuario para o Alfresco no banco, bem como criar o schema."
echo 
echo "O essa parte eh manual, porem basta copiar os codigos que seram apresentados a seguir e teclar <ENTER>..."
sleep 4








