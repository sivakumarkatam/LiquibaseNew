#!/bin/bash
aws --region ap-southeast-1 ssm get-parameters --names "apgflywayuser" --with-decryption | awk 'match($0, /"Value":.*/) { print substr($0, RSTART, RLENGTH) }'| cut -d '"' -f4 | sudo tee user
username=$(cat user)

aws --region ap-southeast-1 ssm get-parameters --names "apgflywaypassword" --with-decryption | awk 'match($0, /"Value":.*/) { print substr($0, RSTART, RLENGTH) }'| cut -d '"' -f4 | sudo tee pwd
password=$(cat pwd)
cd /tmp/
mvn install flyway:migrate -Ddatabaseuser=$username -Ddatabasepassword=$password
