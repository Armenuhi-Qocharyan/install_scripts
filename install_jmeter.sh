#!/bin/bash
URLS='http://apache.mirrors.hoobly.com//jmeter/binaries/apache-jmeter-3.3.zip http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.1.3.zip http://jmeter-plugins.org/downloads/file/JMeterPlugins-Extras-1.1.3.zip http://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-1.1.3.zip' 
ZIP_FILES='JMeterPlugins-Standard-1.1.3.zip JMeterPlugins-Extras-1.1.3.zip JMeterPlugins-ExtrasLibs-1.1.3.zip'

download_jmeter_zip(){
	#cd ~
	mkdir jmeter_install_dir
	cd 'jmeter_install_dir'
	for  URL in $URLS
	do
		curl $URL
	done
}
install_jmeter(){
	cd ~/jmeter_install_dir
	sudo unzip apache-jmeter-3.3.zip -d  /opt/jmeter/
	for ZIP in $ZIP_FILES
	do
		sudo    unzip -n $ZIP -d /opt/jmeter/apache-jmeter-3.3/
	done
	sudo chmod +x '/opt/jmeter/apache-jmeter-3.3/' 
	echo export PATH='/opt/jmeter/apache-jmeter-3.3/bin':$PATH >> ~/.bashrc 
}
main(){
	download_jmeter_zip
	install_jmeter
	echo export PATH='/opt/jmeter/apache-jmeter-3.3/bin':$PATH >> ~/.bashrc 
}
main
#curl "http://127.0.0.1:8000" -o "outfile"
