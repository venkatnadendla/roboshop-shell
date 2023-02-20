code_dir=$(pwd)
echo -e "\e[35mInstalling nginx\e[0m"
yum install nginx -y
echo -e "\e[35mRemoving old content\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[35mDownloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[35mExtracting frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[35mCopying nginx config for roboshop\e[0m"
cp ${code_dir}/configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[35mEnabling NGINX\e[0m"
systemctl enable nginx

echo -e "\e[35mStarting nginx\e[0m"
systemctl start nginx
## Roboshop config not copied
# If any command is errored or failed, we need to stop the script there itself
