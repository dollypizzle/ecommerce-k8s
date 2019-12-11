
docker build -t dollypizzle/eco-client:latest -t dollypizzle/eco-client:$SHA -f ./client/Dockerfile ./client
docker build -t dollypizzle/eco-server:latest -t dollypizzle/eco-server:$SHA -f ./server/Dockerfile ./server

docker push dollypizzle/eco-client:latest
docker push dollypizzle/eco-server:latest

docker push dollypizzle/eco-client:$SHA
docker push dollypizzle/eco-server:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dollypizzle/eco-server:$SHA
kubectl set image deployments/client-deployment client=dollypizzle/eco-client:$SHA
