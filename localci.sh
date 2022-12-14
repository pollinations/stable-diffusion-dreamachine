cog build -t 614871946825.dkr.ecr.us-east-1.amazonaws.com/pollinations/stable-diffusion-dreamachine
cog push r8.im/pollinations/stable-diffusion-dreamachine
aws ecr get-login-password \
        --region us-east-1 \
    | docker login \
        --username AWS \
        --password-stdin 614871946825.dkr.ecr.us-east-1.amazonaws.com
docker push 614871946825.dkr.ecr.us-east-1.amazonaws.com/pollinations/stable-diffusion-dreamachine
docker inspect 614871946825.dkr.ecr.us-east-1.amazonaws.com/pollinations/stable-diffusion-dreamachine > inspect.json
cd ../model-index && git pull && cd ../stable-diffusion-dreamachine
mkdir -p ../model-index/pollinations/stable-diffusion-dreamachine
cp meta.json ../model-index/pollinations/stable-diffusion-dreamachine/meta.json
cp inspect.json ../model-index/pollinations/stable-diffusion-dreamachine/inspect.json
cd ../model-index && python add_image.py pollinations/stable-diffusion-dreamachine 614871946825.dkr.ecr.us-east-1.amazonaws.com/pollinations/stable-diffusion-dreamachine && cd ../stable-diffusion-dreamachine
cd ../model-index && git add . && git commit -m "Update pollinations/stable-diffusion-dreamachine" && git push && cd ../stable-diffusion-dreamachine