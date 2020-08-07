# Overwrite any bref file or config

Create a new fancy layer an put it on top.

## Publish

```
docker build -t bref/overwrite-layer .

rm -rf export/tmp/layer || true
mkdir -p export/tmp && cd export/tmp

docker run --entrypoint "tar" bref/overwrite-layer -ch -C /opt . | tar -x
zip --quiet -X --recurse-paths ../overwrite-layer.zip .

cd ../..
aws lambda publish-layer-version --layer-name bref-overwrite --zip-file fileb://export/overwrite-layer.zip --region eu-west-1
```
