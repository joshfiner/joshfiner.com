build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://joshfiner.info --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E1220HX57WI1O3 --paths "/*"
