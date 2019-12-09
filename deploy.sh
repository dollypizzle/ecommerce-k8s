
docker build -t dollypizzle/ecommerce-client:latest -t dollypizzle/ecommerce-client:$SHA -f ./client/Dockerfile ./client
docker build -t dollypizzle/ecommerce-server:latest -t dollypizzle/ecommerce-server:$SHA -f ./server/Dockerfile ./server

docker push dollypizzle/ecommerce-client:latest
docker push dollypizzle/ecommerce-server:latest

docker push dollypizzle/ecommerce-client:$SHA
docker push dollypizzle/ecommerce-server:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dollypizzle/ecommerce-server:$SHA
kubectl set image deployments/client-deployment client=dollypizzle/ecommerce-client:$SHA
