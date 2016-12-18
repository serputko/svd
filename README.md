# svd

## To run docker need to do 

- `docker volume create --name svdlab-postgres`
- `docker-compose build`
- `docker-compose run --user "$(id -u):$(id -g)" svdlab rake db:reset`
- `docker-compose up`
