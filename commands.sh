ssh-keygen -t rsa

git clone git@github.com:Amine24h/building-a-ci-cd-pipeline.git

cd building-a-ci-cd-pipeline
python -m venv building-a-ci-cd-pipeline-venv
. building-a-ci-cd-pipeline-venv/bin/activate

make all

az webapp up --sku F1 -n building-a-ci-cd-pipeline-service

az webapp log tail --name building-a-ci-cd-pipeline-service --resource-group amine.kabouche_rg_Linux_centralus

./make_predict_azure_app.sh

pip install locust
locust