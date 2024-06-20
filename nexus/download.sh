# save the artifact details in a json file
curl -u admin:admin -X GET 'http://159.223.17.75:8081/service/rest/v1/components?repository={npm-sample}&sort=version' | jq "." > artifact.json

# grab the download url from the saved artifact details using 'jq' json processor tool
artifactDownloadUrl=$(jq '.items[].assets[].downloadUrl' artifact.json --raw-output)

# fetch the artifact with the extracted download url using 'wget' tool
wget --http-user=admin --http-password=admin $artifactDownloadUrl
